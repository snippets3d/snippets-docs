# Import your first Snippet into the SDK

---

## 4. Initial setup in Unity

### 4.1 Portal preparation

Create/publish snippet sets in the web portal and ensure they are downloadable by pressing the "Publish" button.

You must not leave the tab while the Snippet is publishing for the process to finalize successfully.

![Press publish to make snippet set accessible to SDK](/assets/images/sdk-guide/sdk-guide-08-p06-i01.png)

### 4.2 Log in

1. `Snippets > Log In`
2. Enter credentials (same as on the web portal)
3. Confirm successful login

![Log into the Snippets SDK](/assets/images/sdk-guide/sdk-guide-09-p06-i02.png)

### 4.3 Open set management

1. `Snippets > Import or Update Snippet Sets`
2. Review set statuses and actions

Status labels:

- `[Imported]`
- `[Local Deprecated]`
- `[Processing/Unpublished]`
- `[Update Processing]`

![Snippet Sets Window - for importing, updating, removing or viewing your snippet sets](/assets/images/sdk-guide/sdk-guide-10-p07-i01.png)

---

## 5. Snippets project folders

Default behavior:

- Generated root: `Assets/My Snippets` -> this is where your snippets prefabs are imported
- Raw setting default: `Assets/My Snippets/Raw` -> this is where the raw files building the prefabs are

Effective per-set structure used by the SDK:

- Generated: `<GeneratedRoot>/<SetName>`
- Raw: `<GeneratedRoot>/<SetName>/Raw` (or custom raw subfolder name)

Example:

- `Assets/My Snippets/Doctor`
- `Assets/My Snippets/Doctor/Raw`

Path configured in `Snippets SDK -> Config -> Resources -> ProjectSnippetsSettings.asset`.

![Snippets automatic import folder including subfolder / snippet set and nested raw folder](/assets/images/sdk-guide/sdk-guide-11-p08-i01.png)

---

## 6. Import, update, remove snippet sets

### 6.1 Import

1. Click `Import`
2. Select template prefab
3. Confirm and wait for completion

Process:

- Download raw archive
- Decompress assets
- Generate prefabs from template

![Import button from Snippet Sets Window](/assets/images/sdk-guide/sdk-guide-12-p08-i02.png)
![Importing Snippets Window](/assets/images/sdk-guide/sdk-guide-13-p09-i01.png)

### 6.2 Update

1. Click `Update` (available only after new changes are published on the Web Portal on the same set)
2. Confirm operation

Current behavior: update is effectively remove + re-import.

Check scene references after update.

![Update button from Snippet Sets Window](/assets/images/sdk-guide/sdk-guide-14-p09-i02.png)

### 6.3 Remove

1. Click `Remove`
2. Confirm

Removes local generated and raw files for that set.

![Remove button from Snippet Sets Window](/assets/images/sdk-guide/sdk-guide-15-p09-i03.png)
