# How to install the Snippet SDK

Snippets SDK for Unity  
Implementation and Usage Guide

---

## 1. Introduction

The Snippets SDK is the Unity integration layer for Snippets content. It connects your Unity project to the Snippets platform so you can import Snippet Sets created on the web portal, generate ready-to-use Unity prefabs, and play them in your scenes with synchronized animation, audio, and text.

In practice, the SDK covers two needs:

1. Content operations in the Unity Editor: login, browse sets, import/update/remove sets, generate prefabs.
2. Runtime playback in scenes: play snippets directly or orchestrate them with helper tools for actor control, movement, flow sequencing, and gaze behavior.

Mental model:

1. Create and publish content in the Snippets portal.
2. Import that content into Unity through the SDK.
3. Choose your playback mode: standalone snippet playback or controller-based orchestration.

![01-introduction-overview.png](/assets/images/sdk-guide/sdk-guide-01-p01-i01.png)
![Character in Snippets Portal & Unity SDK Sample scene in Play Mode](/assets/images/sdk-guide/sdk-guide-02-p01-i02.png)

---

## 2. Requirements

- Unity 6.3 LTS (6000.3.x), Unity 6.0 LTS (6000.0.x) or Unity 2022.3 LTS (2022.3.x)
- Snippets account
- Internet access for package/cloud operations
- Git installed if using Git URL installation (recommended)

![02-requirements-unity-version.png](/assets/images/sdk-guide/sdk-guide-03-p02-i01.png)
Capture: Unity Hub showing project on 2022.3.x.

---

## 3. Installation

### 3.1 Configure OpenUPM scoped registry

Required scopes:

- `com.cysharp.unitask`
- `org.khronos.unitygltf`

Unity UI procedure:

1. `Edit > Project Settings > Package Manager`
2. Add Scoped Registry:
Name: `OpenUPM`  
URL: `https://package.openupm.com`  
Scopes: `com.cysharp.unitask`, `org.khronos.unitygltf`

Option B (alternative): Manual `manifest.json` procedure:

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

### 3.2 Install Snippets SDK package

Recommended: install from Git URL to get updates and keep team environments consistent.

Git URL method:

1. `Window > Package Manager`
2. `+` button
3. `Add package from git URL` (find the URL at [https://app.snippets3d.com/integrations](https://app.snippets3d.com/integrations))
4. Paste SDK Git URL
5. Install

Disk method (ZIP fallback):

1. Download and unzip SDK outside `Assets`
2. `Window > Package Manager`
3. `+` button
4. `Add package from disk` (download package at [https://app.snippets3d.com/integrations](https://app.snippets3d.com/integrations))
5. Select `package.json`

![Copy git URL or download ZIP](/assets/images/sdk-guide/sdk-guide-04-p03-i01.png)
![Install Snippets SDK via git URL using Unity Package Manager](/assets/images/sdk-guide/sdk-guide-05-p04-i01.png)

### 3.3 Import TMP essentials (recommended)

For better text quality and consistency:

1. `Window > TextMeshPro > Import TMP Essential Resources`
2. Confirm import

![Importing TextMeshPro Essential Resources](/assets/images/sdk-guide/sdk-guide-06-p04-i02.png)

### 3.4 Import sample scenes (recommended)

1. Open Package Manager and select Snippets SDK (after installing it)
2. Open `Samples` tab
3. Import Snippets Sample Scenes
4. Open sample scenes and run Play Mode

![Importing Sample Scenes & path to the Scenes after import](/assets/images/sdk-guide/sdk-guide-07-p05-i01.png)
