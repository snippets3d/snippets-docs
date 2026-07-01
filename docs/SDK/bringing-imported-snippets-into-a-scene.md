# 7. Bringing Imported Snippets Into a Scene

After importing a Snippet Set, the SDK generates Unity prefabs for each snippet in the configured
generated folder. This section covers the normal workflow for getting those prefabs into a scene and
verifying playback.

## 7.1 Locate the generated prefabs

1. Open the generated snippets folder (`Assets/My Snippets/`).
2. Open the subfolder created for the imported Snippet Set.
3. Identify the generated snippet prefabs (one prefab per snippet).

**What to expect:**

1. The imported set produces a folder named after the Snippet Set.
2. Raw files are stored separately (inside the set’s raw subfolder), while the generated prefabs are
the assets you usually drag into scenes.

![Screenshot](/assets/images/sdk-documentation/page-11-image-03.png)

<p class="screenshot-caption">Imported Snippets prefabs</p>

---

## 7.2 Drag and drop a snippet prefab into the scene

1. Drag a generated snippet prefab from the Project window into the Hierarchy or Scene view.
2. Position the instance in the scene as needed.
3. Confirm the prefab instance appears active in the Hierarchy.

**What this gives you:**

1. A ready-to-use snippet GameObject with SnippetPlayer and its child playback components.
2. A quick way to validate audio, text, and animation before building orchestration logic.

![Screenshot](/assets/images/sdk-documentation/page-12-image-01.png)

<p class="screenshot-caption">A Snippet set in the scene</p>

---

## 7.3 Standalone autoplay (drag-and-drop “just play” behavior)

**Required setting: On the root SnippetPlayer, keep Play On Enable enabled (default).**

---

## 7.4 Quick validation checklist (standalone)

Enter Play Mode and verify:

1. The avatar animates.
2. Audio plays (if your template includes sound playback).
3. Text/captions appear (if your template includes text playback).
4. No relevant Console errors appear.

---

[← Previous: Import, Update, Remove Snippet Sets](/SDK/import-update-remove-snippet-sets.md)  
[Next: Setting Up A Scene With Helper Tools →](/SDK/setting-up-a-scene-with-helper-tools.md)

