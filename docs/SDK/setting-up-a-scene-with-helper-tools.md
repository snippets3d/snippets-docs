# Setting Up a Scene With Helper Tools (Step-by-Step)

## 1. Setting Up a Scene With Helper Tools (Step-by-Step)

This section describes a recommended setup flow for a controller-driven scene (single-actor or multi-actor). It is the best path when you need sequencing, movement, or gaze control.

---

### 1.1 Recommended setup order

Use this order to avoid debugging too many systems at once:

1. Place snippet prefabs in the scene.
2. Configure `SnippetsActorRegistry`.
3. Validate playback with `SnippetsSimpleController`.
4. Add movement (`SnippetsWalker`) if needed.
5. Add sequencing (`SnippetsFlowController`).
6. Add gaze (`SnippetsHeadTurn` + `SnippetsGazeFlowController`) last.

This progression gives you a clean baseline before layering more behavior.

---

### 1.2 Place your actor/snippet prefabs in the scene

1. Decide how many actors (characters) you will have in the scene and drag in one snippet prefab for each character.
2. Position them where they should appear.
3. Rename them with easy-to-remember identifiers (like their names or roles).

Important for helper-tool setups:

1. Keep `External Animation Control` enabled on each snippet's `AvatarPlayer`.
2. This allows the registry/controllers to own animation blending and transitions.

![Two snippets added to the scene renamed Doctor and Nurse](/assets/images/sdk-guide/sdk-guide-19-p13-i01.png)

---

### 1.3 Create and configure SnippetsActorRegistry

1. Create an empty GameObject (for example `SnippetsRuntime` or even `ActorRegistry`).
2. Add `SnippetsActorRegistry` component.
3. Add one Actor entry per character.
4. For each actor, assign:

- `player` (`SnippetPlayer`)
- `snippets` list (all snippet prefabs you will use for that actor)
- `idleClip` - find sample `idleClip` in `SnippetsSDK\Runtime\Assets\Animations\`
- `walkClip` (if movement will be used) - sample `walkClip` in `SnippetsSDK\Runtime\Assets\Animations\`
- `walker` (optional, if using movement) -> instructions in next points
- `headTurn` (optional, if using gaze) -> instructions in next points

Notes:

1. The registry can auto-find some components (like legacy `Animation` and optionally `SnippetsHeadTurn`) under the player hierarchy.
2. Explicit assignments are still recommended in production scenes for clarity and stability.

![ActorRegistry component with Doctor and Nurse actors attached](/assets/images/sdk-guide/sdk-guide-20-p14-i01.png)

---

### 1.4 Validate with SnippetsSimpleController (first runtime test)

Before building a sequence, test the registry setup with a simple trigger.

1. Add `SnippetsSimpleController` to a GameObject (for clarity make one called `SimpleController`).
2. Assign the `SnippetsActorRegistry`.
3. Choose:

- a. Action = `Snippet` (for a playback test) or `Walk` (for movement test)
- b. Actor
- c. Snippet or Waypoint

4. Optionally enable keyboard trigger (default is useful for quick tests).
5. Enter Play Mode and press the configured key or use inspector buttons.

Why this step matters:

1. It confirms the registry wiring is correct.
2. It isolates setup issues before you build longer flow sequences.

![SimpleController testing playing Snippet DoctorSnippet1 by actor Doctor](/assets/images/sdk-guide/sdk-guide-21-p15-i01.png)

---

### 1.5 Add movement with SnippetsWalker (optional)

If actors need to move between points:

1. Add `SnippetsWalker` to the actor root (or movement parent object).
2. Create waypoint transforms in the scene.
3. Assign waypoints in order to the walker.
4. Configure movement values:

- a. `moveSpeed`
- b. `arriveDistance`
- c. `turnSpeed`

5. If using NavMesh:

- a. Enable `useNavMesh`
- b. Assign `NavMeshAgent`
- c. Tune agent settings

Then:

1. Assign this walker to the actor entry in `SnippetsActorRegistry`.
2. Re-test using `SnippetsSimpleController` with Action = `Walk`.

![Doctor with the Snippets Walker component attached](/assets/images/sdk-guide/sdk-guide-22-p16-i01.png)

---

### 1.6 Build a sequence with SnippetsFlowController

Use `SnippetsFlowController` when you want controlled steps such as "speak, walk, pause, speak."

1. Add `SnippetsFlowController` to a new GameObject called `FlowController`.
2. Assign the `SnippetsActorRegistry`.
3. Configure flow options (`Play On Start`, `Loop Sequence`, `Auto Progress`, keyboard key).
4. Add steps in the Steps list.
5. For each step choose:

- a. `Snippet`: actor + snippet name/index
- b. `Walk`: actor + waypoint name/index
- c. `Pause`: timed pause or wait-for-trigger

Testing strategy:

1. Start with 2-3 steps only.
2. Verify each step transition in Play Mode.
3. Expand after baseline flow is working.

![Snippets Flow Controller example implementation](/assets/images/sdk-guide/sdk-guide-23-p17-i01.png)

---

### 1.7 Add gaze behavior (SnippetsHeadTurn) (optional, but recommended for conversations)

For natural attention and gaze direction:

1. Add `SnippetsHeadTurn` to each actor that should use procedural gaze.
2. Assign required rig references:

- a. `headBone`
- b. `waistBone` f.e. `spline` (recommended for better body follow)

3. Configure a basic starting setup:

- a. Mode: `FollowTarget` or `LookInFront`
- b. Look limits and smoothing
- c. Waist follow values

4. Assign `headTurn` in the actor entry of `SnippetsActorRegistry` (or rely on auto-find if appropriate).

![HeadTurn Script added to the Doctor actor](/assets/images/sdk-guide/sdk-guide-24-p18-i01.png)

---

### 1.8 Synchronize gaze with flow using SnippetsGazeFlowController

Once your flow is stable, add gaze choreography.

1. Add `SnippetsGazeFlowController` to the runtime/controller object.
2. Assign:

- `flow` (`SnippetsFlowController`)
- `registry` (`SnippetsActorRegistry`)

3. Click `Sync Now` so gaze steps mirror flow steps.
4. Choose `UnspecifiedActorBehavior` (recommended starting point: `KeepPrevious`).
5. Configure gaze per step:

- `Simple` mode for step-level gaze changes (one gaze change / step)
- `Granular` mode for cue-based changes during a snippet (percent-based) - f.e. "when snippet 1 reaches 20% of play time this gaze change occurs"

Recommended first setup:

1. Start with `Simple` mode only.
2. Add `Granular` cues only after the base flow works reliably.

*Screenshot not embedded in source PDF: 28-gaze-flow-controller-sync.png*
Capture: SnippetsGazeFlowController with flow, registry, and Sync controls.

![GazeFlow implementation example](/assets/images/sdk-guide/sdk-guide-25-p19-i01.png)

---

### 1.9 Final controller-based validation checklist

Before considering the scene ready:

1. Actors return to idle correctly after snippet/walk actions.
2. Snippet audio/text remain synchronized.
3. Flow progresses as intended (auto or manual).
4. Gaze behavior matches expected targets.
5. `External Animation Control` remains enabled for controller-driven snippets.
6. No recurring Console warnings/errors during repeated runs.

TIP: Review and experiment with the Demo Scenes provided with the SDK. All helper tools are implemented and present flows which utilize all features described.
