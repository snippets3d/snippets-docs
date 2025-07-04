# Import your first Snippet into the SDK

Once the Snippets SDK is installed, you can immediately start to use it create your own snippets. This is a quick guide to get you started:

---

##1\. **Log in to Snippets**

To use the Snippets SDK, you need to log in to your Snippets account. You can do this by opening the Snippets menu in Unity and clicking on *Login*. This will open a small UI window where you can enter your credentials. This is fundamental so that you can access from Unity the Snippets that you created on the web portal.

---

##2\. **Access to your list of Snippet Sets**

Once you are logged in, you can access your list of Snippet Sets by opening the Snippets menu in Unity and clicking on *Show User's Snippet Sets*. This will open a window where you can see all the Snippet Sets you created on the web portal and what is their current importing status.

Every Snippet Set will appear in the list with its thumbnail and its name. After the name, there may be some tag in square brackets that indicates some special status of the Snippet Set:

- `[Processing]` means that the Snippet Set is being processed by the server and it is not yet ready to be used yet. This applies even if the snippet is not published yet
- `[Imported]` means that the Snippet Set has already been successfully imported in your project and you can use it
- `[Local Deprecated]` means that the Snippet Set has already been successfully imported in your project, but it has actually been deleted on the cloud (so only the local version of the Snippet Set exists)

Every Snippet Set may have close to it also one or multiple buttons that represent the actions you can perform on it:

- **Import** means that the Snippet Set is not yet imported in your project, and you can click on this button to start the import process
- **Update** means that the Snippet Set has been imported in your project but there is an updated version on the cloud. You can click on this button to update the local version of the Snippet Set
- **Remove** means that the Snippet Set has been imported in your project, and you can click on this button to delete the local version of it

---

##3\. **Perform operations on the Snippet Sets**

Once you have your Snippet Sets list, you can perform some operations on them directly from the Snippet Sets window. The operations you can perform are:

- **Import a Snippet Set**: To import a Snippet Set, you can click on the *Import* button next to the Snippet Set you want to import. The system will show you a window asking what is the template prefab you want to use for the Snippets of that Snippet Set. You can choose the template prefab created in the [previous guide](/getting-started/sdk-installation), or you can [create a new one](/create-a-snippet-template). Select the prefab from your folder (NOT from the scene). You can now click the *Import* button and the system will start the import process, at first downloading the raw data of the Snippets, and then generating the prefabs of the Snippets in the folder you configured in the previous step. If everything went smoothly, you will have the Snippet prefabs generated in the folder you configured, By default, your snippets can be found in Snippets/Generated. If something went wrong, you will see an error message in the console.

- **Remove a Snippet Set**: To remove a Snippet Set, you can click on the *Remove* button next to the Snippet Set you want to remove. The system will ask you to confirm the removal in a dialogue window, and once you confirm it, it will delete the local version of the Snippet Set, both the raw data and the generated prefabs. If you were using the Snippet prefabs in some scene, they will become invalid. Notice that if the Snippet Set was imported from the cloud, it will still exist on the cloud, but it will not be available in your project anymore.

- **Update a Snippet Set**: To update a Snippet Set, you can click on the *Update* button next to the Snippet Set you want to update. Notice that the button will appear only if there is an updated version of the Snippet Set on the cloud. The dialogue window for the Update process is mostly identical to the one of the Import process. Be careful that in the current implementation, the Update process consists in removing the local version of the Snippet Set and then importing it again from the cloud. This means that you will lose any changes you made to the Snippet prefabs, and you will also lose any reference you had to your prefabs in your scenes, so be careful when using this feature. We plan to improve the update process to make it less disruptive in a future version of our SDK.

---

##4\. **Use the Snippets in your project**

Once you have imported the Snippets Sets you want to use, you can start using the Snippets in your project. You can do this by instantiating the Snippet prefab you generated in the previous step. The Snippet prefab will have the `SnippetPlayer` component that you can use to control the playback of the Snippet. You can call the `Play()` method to start playing the Snippet, and you can also stop it by calling the `Stop()` method. The `SnippetPlayer` component also has two events: `PlaybackStarted` and `PlaybackStopped` that you can use to perform actions when the playback starts or finishes: for instance, you can start the playback of a second Snippet when the first one finishes, or you can show a UI message when the playback starts, etc...

---

##5\. **Enjoy the Snippets SDK!**

You now know how to use the Snippets SDK in your project. Have fun!
