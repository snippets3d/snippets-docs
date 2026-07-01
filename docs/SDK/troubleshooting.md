# 13. Troubleshooting

- Missing import/update action: set may still be processing/unpublished.
- Text quality issues: TMP essentials not imported.
- Scene links broken after update: updates try to preserve generated prefab references, but renamed or
structurally changed content should still be reviewed.
- GLTF conflicts: verify compatibility with other GLTF packages.
- Gaze setup not working: verify that the actor uses `SnippetsGazeDriver` and that the required rig
references are assigned.

---

[← Previous: Recommended Validation Path](/SDK/recommended-validation-path.md)
