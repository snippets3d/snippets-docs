# 3. Installation

## 3.1 Option A: AI-assisted manifest install (no OpenUPM required)

Use this option if you want Codex, Claude, Copilot, or another coding agent to install the SDK for you and
update `Packages/manifest.json` directly. This path adds all required packages from Git URLs, so it does
not require the OpenUPM scoped registry setup. Paste the following prompt:

```text
Install the Snippets SDK by updating Packages/manifest.json.
Use this exact SDK package dependency:
- "com.snippets.sdk": "<insert link to the git URL found at https://app.snippets3d.com/integrations>"
Also add these dependencies if missing:
- "com.cysharp.unitask":
"https://github.com/Cysharp/UniTask.git?path=/src/UniTask/Assets/Plugins/UniTask"
- "org.khronos.unitygltf": "https://github.com/KhronosGroup/UnityGLTF.git"
Keep all existing dependencies unchanged.
```

---

## 3.2 Option B: Unity Package Manager install

### 3.2.1 Configure OpenUPM scoped registry

**Required scopes:**

- com.cysharp.unitask
- org.khronos.unitygltf

1. Edit > Project Settings > Package Manager
2. Add Scoped Registry:
Name: OpenUPM
URL: https://package.openupm.com
Scopes: com.cysharp.unitask, org.khronos.unitygltf

![Screenshot](/assets/images/sdk-documentation/page-02-image-01.png)

Manual manifest.json example:

```json
{
  "scopedRegistries": [
    {
      "name": "OpenUPM",
      "url": "https://package.openupm.com",
      "scopes": [
        "com.cysharp.unitask",
        "org.khronos.unitygltf"
      ]
    }
  ]
}
```

### 3.2.2 Install Snippets SDK package

Recommended: install from Git URL to get updates and keep team environments consistent.

**Git URL method:**

1. Window > Package Manager
2. + button
3. Add package from git URL (find the URL at [the integrations page](https://app.snippets3d.com/integrations))
4. Paste SDK Git URL
5. Install

**Disk method (ZIP fallback):**

1. Download and unzip SDK outside Assets
2. Window > Package Manager
3. + button
4. Add package from disk (download package at [the integrations page](https://app.snippets3d.com/integrations))
5. Select package.json

![Screenshot](/assets/images/sdk-documentation/page-04-image-01.png)

<p class="screenshot-caption">Copy git URL or download ZIP</p>

![Screenshot](/assets/images/sdk-documentation/page-04-image-02.png)

<p class="screenshot-caption">Install Snippets SDK via git URL using Unity Package Manager</p>

---

## 3.3 Import TMP essentials (recommended)

**For better text quality and consistency:**

1. Window > TextMeshPro > Import TMP Essential Resources
2. Confirm import

![Screenshot](/assets/images/sdk-documentation/page-05-image-01.png)

<p class="screenshot-caption">Importing TextMeshPro Essential Resources</p>

---

## 3.4 Import sample scenes (optional)

1. Open Package Manager and select Snippets SDK (after installing it)
2. Open Samples tab
3. Import Snippets Sample Scenes
4. Open sample scenes and run Play Mode

![Screenshot](/assets/images/sdk-documentation/page-06-image-01.png)

<p class="screenshot-caption">Importing Sample Scenes & path to the Scenes after import</p>

---

[← Previous: Overview](/SDK/overview.md)  
[Next: Initial Setup In Unity →](/SDK/initial-setup-in-unity.md)

