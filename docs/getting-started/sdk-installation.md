# How to install the Snippet SDK

Follow these steps to install the Snippets SDK:

##1\. **Add OpenUPM to the scoped registries of your project**
Open the Packages/manifest.json file in the folder of your project and add the following lines:
```
    {
    "dependencies": {
        ...
    },
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

---

##2\. **Install Snippets SDK Package to Unity**
Navigate to [https://www.snippets3d.com/integrations](https://www.snippets3d.com/integrations). 
Here you will find the latest download of the SnippetsSDK.

**You have the following installation options:**

###2a\. **Install Package via Git URL (Recommended)**
Click "Copy" to copy the git url.

In Unity, Open the Unity Package Manager (`Window -> Package Manager`) and click on the + button in the top left corner. Select *Install package from git url...* and paste the Git URL. It will automatically download and install. You can check for updates by periodically clicking "Update".

###2b\. **Download and Install Package from Disk**
Click Download the ZIP file, and extract it to a folder in your project. (NOT in the Assets folder).

In Unity, Open the Unity Package Manager (`Window -> Package Manager`) and click on the + button in the top left corner. Select *Install package from disk...* and navigate to the `package.json` file in the Snippets SDK folder you just added.
    -Wait for the package manager to do all the heavy lifting. It may take a few minutes.

---

##3\. **Import the TextMeshPro Essentials**
If you don't have TextMeshPro in your project, you can import it by clicking on the *Import TMP Essentials* button in the `Window -> TextMeshPro -> Import TMP Essential Resources` menu.

---

##4\. **Create a template**

You can create your own custom template, or use the sample template we've provided in `Packages/com.snippets.sdk/Editor/SnippetsTemplates/SnippetTemplate.prefab`. Let's drag that into our project folder for now.

---

##5\. **Be careful of the conflicts**
The Snippets SDK uses UnityGLTF to load GLTF files, and it may conflict with other packages that import GLTF files, like glTFast.