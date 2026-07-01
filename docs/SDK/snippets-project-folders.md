# 5. Snippets project folders

**Default behavior:**

- Generated root: `Assets/My Snippets` -> this is where your snippets prefabs are imported
- Raw setting default: `Assets/My Snippets/Raw` -> this setting defines the raw subfolder name created inside
each imported set folder.

**Effective per-set structure used by the SDK:**

- Generated: `<GeneratedRoot>/<SetName>`
- Raw: `<GeneratedRoot>/<SetName>/Raw` (or custom raw subfolder name)

**Example:**

- `Assets/My Snippets/Doctor`
- `Assets/My Snippets/Doctor/Raw`

Path is configured in `ProjectSnippetsSettings.asset`. If you do not see it directly, search for
`ProjectSnippetsSettings` in the Project window.

![Screenshot](/assets/images/sdk-documentation/page-09-image-01.png)

<p class="screenshot-caption">Snippets automatic import folder including subfolder / snippet set and nested “raw” folder</p>

---

[← Previous: Initial Setup In Unity](/SDK/initial-setup-in-unity.md)  
[Next: Import, Update, Remove Snippet Sets →](/SDK/import-update-remove-snippet-sets.md)

