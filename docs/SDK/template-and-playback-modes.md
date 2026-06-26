# Template and playback modes

## 1. Template and playback modes

Default template location:

`Packages/com.snippets.sdk/Editor/SnippetsTemplates/SnippetTemplate.prefab`

The default Snippets template prefab is intended as a production-ready starting point, not a limitation.

You can use it as-is for fast integration, or customize it to match your project's visual style, audio pipeline, accessibility requirements, and avatar setup. In practice, teams commonly customize text presentation (TMP styling/layout), audio source settings (mixers/spatialization), avatar visuals (replace the placeholder avatar with a compatible rig), and playback behavior (custom text/audio/avatar player subclasses) while keeping the root `SnippetPlayer` orchestration model intact.

---

## Core components

- Root `SnippetPlayer`
- `TextPlayer`
- `AudioPlayer`
- `AvatarPlayer` (`SnippetAvatarAnimatorPlayer`)

---

## Critical mode rule

- Standalone drag-and-drop autoplay: `Play On Enable` ON + `External Animation Control` OFF
- Helper tools/controllers: `External Animation Control` ON

Why this matters:

- Standalone mode needs local animation control.
- Controller mode expects external orchestration (registry/controllers) to drive animation blending.

![Snippets template default hierarchy](/assets/images/sdk-guide/sdk-guide-26-p20-i01.png)

---

## 2. Helper tools (see "1. Setting Up a Scene With Helper Tools (Step-by-Step)" for detailed implementation)

For detailed implementation, see:

- [Setting Up a Scene With Helper Tools (Step-by-Step)](setting-up-a-scene-with-helper-tools.md)
- [Helper Tools Reference](helper-tools-reference.md)
