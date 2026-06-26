# Bringing Imported Snippets Into a Scene

## 1. Bringing Imported Snippets Into a Scene

After importing a Snippet Set, the SDK generates Unity prefabs for each snippet in the configured generated folder. This section covers the normal workflow for getting those prefabs into a scene and verifying playback.

---

### 1.1 Locate the generated prefabs

1. Open the generated snippets folder (`Assets/My Snippets/`).
2. Open the subfolder created for the imported Snippet Set.
3. Identify the generated snippet prefabs (one prefab per snippet).

What to expect:

1. The imported set produces a folder named after the Snippet Set.
2. Raw files are stored separately (inside the set's raw subfolder), while the generated prefabs are the assets you usually drag into scenes.

![Imported Snippets prefabs](/assets/images/sdk-guide/sdk-guide-16-p10-i01.png)

---

### 1.2 Drag and drop a snippet prefab into the scene

1. Drag a generated snippet prefab from the Project window into the Hierarchy or Scene view.
2. Position the instance in the scene as needed.
3. Confirm the prefab instance appears active in the Hierarchy.

What this gives you:

1. A ready-to-use snippet GameObject with `SnippetPlayer` and its child playback components.
2. A quick way to validate audio, text, and animation before building orchestration logic.

![A Snippet set in the scene](/assets/images/sdk-guide/sdk-guide-17-p11-i01.png)

---

### 1.3 Standalone autoplay (drag-and-drop "just play" behavior)

If you want the snippet to play automatically when the scene starts (without helper tools/controllers), you must configure animation ownership correctly.

Required settings:

- On the root `SnippetPlayer`, keep `Play On Enable` enabled (default).
- On child `AvatarPlayer` (`SnippetAvatarAnimatorPlayer`), disable `External Animation Control`.

Why this is required:

1. `Play On Enable` starts snippet playback logic.
2. In standalone mode, the avatar player itself must control animation playback.
3. If `External Animation Control` stays enabled, animation is expected to be driven by external systems (registry/controllers), so the snippet may not animate as expected when used alone.

![Disabling External Animation Control for Auto-play](/assets/images/sdk-guide/sdk-guide-18-p12-i01.png)

---

### 1.4 Quick validation checklist (standalone)

Enter Play Mode and verify:

1. The avatar animates.
2. Audio plays (if your template includes sound playback).
3. Text/captions appear (if your template includes text playback).
4. No relevant Console errors appear.

If animation does not play:

1. Re-check `External Animation Control` on the scene instance (not just the source prefab).
2. Confirm the snippet instance is active.
3. Confirm you are using standalone mode (no controller expecting external animation ownership).

If animation/lip-sync is out-of-sync with the audio (known issue):

1. Disable the prefab in the scene.
2. Press Play.
3. Re-enable the prefab in play mode after scene has fully loaded.

---

### 1.5 When not to use standalone autoplay

Do not disable `External Animation Control` if you plan to use helper tools such as:

1. `SnippetsActorRegistry`
2. `SnippetsSimpleController`
3. `SnippetsFlowController`
4. `SnippetsGazeFlowController`

These systems are designed to control animation transitions and sequencing externally.
