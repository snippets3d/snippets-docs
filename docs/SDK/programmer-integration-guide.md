# Programmer integration guide

## 1. Programmer integration guide

### 1.1 Play a snippet prefab from code (direct `SnippetPlayer`)

Use this when you already have a snippet prefab instance in scene.

```csharp
using UnityEngine;
using Snippets.Sdk;

public class SnippetPlaybackFromCode : MonoBehaviour
{
    [SerializeField] private SnippetPlayer snippetPlayer;

    private void OnEnable()
    {
        if (snippetPlayer == null) return;

        snippetPlayer.PlaybackStarted.AddListener(OnPlaybackStarted);
        snippetPlayer.PlaybackStopped.AddListener(OnPlaybackStopped);
    }

    private void OnDisable()
    {
        if (snippetPlayer == null) return;

        snippetPlayer.PlaybackStarted.RemoveListener(OnPlaybackStarted);
        snippetPlayer.PlaybackStopped.RemoveListener(OnPlaybackStopped);
    }

    public void PlayNow()
    {
        if (snippetPlayer != null)
            snippetPlayer.Play();
    }

    public void StopNow()
    {
        if (snippetPlayer != null)
            snippetPlayer.Stop();
    }

    private void OnPlaybackStarted()
    {
        Debug.Log("Snippet playback started");
    }

    private void OnPlaybackStopped()
    {
        Debug.Log("Snippet playback stopped");
    }
}
```

Notes:

- Standalone autoplay requires AvatarPlayer `External Animation Control` OFF.
- In controller-driven scenes, leave `External Animation Control` ON.

---

### 1.2 Trigger snippets and walks via `SnippetsSimpleController`

Use this for simple one-action runtime triggers.

```csharp
using UnityEngine;

public class SimpleControllerTrigger : MonoBehaviour
{
    [SerializeField] private SnippetsSimpleController controller;

    public void PlayAction()
    {
        if (controller != null)
            controller.Play();
    }

    public void StopAction()
    {
        if (controller != null)
            controller.Stop();
    }

    public void ResetAction()
    {
        if (controller != null)
            controller.Reset();
    }
}
```

---

### 1.3 Drive a full sequence from code with `SnippetsFlowController`

Use this for timeline-like interactions controlled by gameplay code.

```csharp
using UnityEngine;

public class FlowControllerRuntimeApi : MonoBehaviour
{
    [SerializeField] private SnippetsFlowController flow;

    private void OnEnable()
    {
        if (flow == null) return;
        flow.StepStarted += OnStepStarted;
        flow.StepFinished += OnStepFinished;
    }

    private void OnDisable()
    {
        if (flow == null) return;
        flow.StepStarted -= OnStepStarted;
        flow.StepFinished -= OnStepFinished;
    }

    public void StartFlow() => flow?.Play();
    public void StopFlowSoft() => flow?.Stop();
    public void StopFlowHard() => flow?.Stop(SnippetsActorRegistry.StopMode.Hard);
    public void ResetFlow() => flow?.Reset();

    private void OnStepStarted(int index, SnippetsFlowController.Step step)
    {
        Debug.Log($"Step started: {index} ({step.type})");
    }

    private void OnStepFinished(int index, SnippetsFlowController.Step step)
    {
        Debug.Log($"Step finished: {index} ({step.type})");
    }
}
```

---

### 1.4 Start snippets directly through `SnippetsActorRegistry`

Useful when you need explicit actor/snippet indexing from game logic.

```csharp
using UnityEngine;

public class RegistrySnippetApi : MonoBehaviour
{
    [SerializeField] private SnippetsActorRegistry registry;
    [SerializeField] private int actorIndex = 0;
    [SerializeField] private int snippetIndex = 0;

    public void PlaySnippetNow()
    {
        if (registry == null) return;
        registry.StartSnippetNow(actorIndex, snippetIndex);
        registry.QueueIdleAfterCurrent(actorIndex);
    }

    public void StopActorSoft()
    {
        if (registry == null) return;
        registry.StopToIdle(actorIndex, SnippetsActorRegistry.StopMode.Soft);
    }
}
```

Programming best practices:

- Validate references and index ranges before runtime calls.
- Prefer event-driven chaining using `PlaybackStopped` / `StepFinished`.
- Keep `External Animation Control` consistent with your chosen playback architecture.
