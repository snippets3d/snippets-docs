### How to install

Follow these steps to install the Snippets SDK:

1\. **Add OpenUPM to the scoped registries of your project**
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
2\. **Add the Snippets SDK to your project folders**
Unzip the ZIP file of the Snippets SDK we provided to you. If you want, move it to a folder in your project (NOT in the Assets folder).

3\. **Import the Snippets SDK through the package manager**
Open the Unity Package Manager (`Window -> Package Manager`) and click on the + button in the top left corner. Select *Add package from disk...* and navigate to the `package.json` file in the Snippets SDK folder you just added.
    -Wait for the package manager to do all the heavy lifting. It may take a few minutes.

4\. **Import the TextMeshPro Essentials**
If you don't have TextMeshPro in your project, you can import it by clicking on the *Import TMP Essentials* button in the `Window -> TextMeshPro -> Import TMP Essential Resources` menu.

5\. **Create a template**

You can create your own custom template, or use the sample template we've provided in `Packages/com.snippets.sdk/Editor/SnippetsTemplates/SnippetTemplate.prefab`. Let's drag that into our scene for now.

5\. **Be careful of the conflicts**
The Snippets SDK uses UnityGLTF to load GLTF files, and it may conflict with other packages that import GLTF files, like glTFast.