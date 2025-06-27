**Introduction**

There is a small configuration file called `ProjectSnippetsSettings` in the `/SnippetsSDK/Config/Resources` folder. Modifying it allows you to change the default folders where the Snippets SDK operates. There are two main folders you can configure:

- **Raw Snippets Download Folder**: This is the folder where the raw data of the Snippets will be downloaded. For instance, all the audio file and animation files will be saved here. Usually you don't touch the files in this folder

- **Generated Snippets Download Folder**: This is the folder where the Snippet prefabs will be generated. This is where you will look for your prefabs of the Snippets to add to your project.

In both folders, the system will create a subfolder with the name of the Snippet Set you are importing, and inside it will save all the files related to that Snippet Set.