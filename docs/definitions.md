# Definitions

This page provides clear definitions for key concepts used throughout the documentation. Understanding these terms will help you make the most of the SDK and streamline your integration process.

---

## Snippet

A **Snippet** is a unit of dialogue animation. It typically includes:

- Audio
- Visemes (mouth shapes for lip-syncing)
- Animation data (such as gestures or expressions)

Snippets are the core building blocks for creating interactive character dialogue.

---

## Snippet Set

A **Snippet Set** is a collection of related Snippets. This serves as your **project folder**, which groups all relevant dialogue assets together.

You can import an entire Snippet Set into your Unity project using the SDK. This makes it easier to manage and reuse your content across different applications or scenes.

## Rig

A rig refers to the digital skeleton: a structure of bones and joints, which is applied to a 3D character model to enable animation. We provide our animations using several standard rig formats, including Ready Player Me, Mixamo, and Character Creator.

If your model uses the same rig standard, the animation can be retargeted or applied directly to your model with little to no adjustment.