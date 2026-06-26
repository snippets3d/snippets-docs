# Recommended validation path and troubleshooting

## 1. Recommended validation path

1. Configure OpenUPM.
2. Install SDK via Git URL.
3. Import TMP essentials.
4. Import sample scenes.
5. Login.
6. Import one snippet set.
7. Drag one generated snippet into scene.
8. Apply correct animation ownership setting.
9. Verify text/audio/animation in Play Mode.

---

## 2. Troubleshooting

If something is not working yet, find the closest symptom below and apply the next step.

### Import or update actions are missing

This usually means the set is still processing or has not been published yet.

Next step: wait for processing to finish on the web portal, publish the set, then refresh the Snippet Sets window in Unity.

### Standalone snippet is not animating

In standalone playback, the snippet instance needs to control animation locally.

Next step: on the scene instance, set `External Animation Control` to OFF and keep `Play On Enable` ON.

### Controller-driven setup feels unstable

When using registry/controller tools, animation control must stay external.

Next step: verify `External Animation Control` is ON for snippets driven by controllers.

### Text quality looks off

This is commonly caused by missing TMP essentials.

Next step: import `Window > TextMeshPro > Import TMP Essential Resources`.

### Scene references break after update

Current update behavior regenerates assets (effectively remove + re-import).

Next step: rebind scene references to the regenerated snippet prefabs after the update completes.

### GLTF package conflicts appear

Conflicts can happen if multiple GLTF-related packages overlap in your project.

Next step: review installed GLTF packages and verify compatibility with the Snippets SDK stack.
