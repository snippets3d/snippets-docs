# 8. Setting Up a Scene With Helper Tools (Step-by-Step)

This section describes a recommended setup flow for a controller-driven scene (single-actor or
multi-actor). It is the best path when you need sequencing, movement, or gaze control.

## 8.1 Recommended setup order

**Use this order to avoid debugging too many systems at once:**

1. Place snippet prefabs in the scene.
2. For automated setup navigate to `Snippets > Scene-Auto Setup`. This will set up
helper-tools/snippet components automatically, for you to customise.
3. Alternatively, for manual setup: Configure SnippetsActorRegistry.
4. Validate playback with SnippetsSimpleController.
5. Add movement (SnippetsWalker) if needed.
6. Add sequencing (SnippetsFlowController).
7. Add gaze (SnippetsGazeDriver + SnippetsGazeFlowController) last.
This progression gives you a clean baseline before layering more behavior.

---

## 8.2 Place your actor/snippet prefabs in the scene

1. Decide how many actors (characters) you will have in the scene and drag in one snippet prefab
for each character.
2. Position them where they should appear.
3. Rename them with easy to remember identifiers (like their names or roles).
4. After placing one snippet instance for each actor in the scene, you can use `Snippets > Scene Auto
Setup` to generate the initial runtime setup (Steps will be provided) or you can set up scene
manually.

![Screenshot](/assets/images/sdk-documentation/page-13-image-01.png)

Screenshot to add: Two snippets added to the scene renamed “Doctor” and “Nurse”

---

## 8.3 Manual Set-up: Create and configure SnippetsActorRegistry

1. Add SnippetsActorRegistry component.
2. Add one Actor entry per character.
3. For each actor, assign:
- player (SnippetPlayer)
- snippets list (all snippet prefabs you will use for that actor)
- idleClip - find sample idleClip in `SnippetsSDK\Runtime\Assets\Animations\`
- walkClip (if movement will be used) - sample walkClip in
`SnippetsSDK\Runtime\Assets\Animations\`
- walker (optional, if using movement) -> instructions in next points
- gazeDriver (optional, if using gaze) -> instructions in next points

**Notes:**

1. The registry can auto-find some components (like legacy Animation and optionally SnippetsGazeDriver)
under the player hierarchy.
2. Explicit assignments are still recommended in production scenes for clarity and stability.

![Screenshot](/assets/images/sdk-documentation/page-14-image-01.png)

![Screenshot](/assets/images/sdk-documentation/page-15-image-01.png)

<p class="screenshot-caption">ActorRegistry component with Doctor and Nurse actors attached</p>

---

## 8.4 Snippet Scene Auto-Setup

Scene Auto Setup is a fast way to create the basic runtime structure needed for a controller-driven Snippets scene. It
is useful when you want the SDK to automatically add the main helper components, prepare the initial scene wiring,
and give you a starting point that you can customize afterward.
1. Place one Snippet prefab for each actor into the scene (recommended: rename each
snippet actor prefab with their character name).
2. In the top menu, go to `Snippets > Scene Auto Setup`.

![Screenshot](/assets/images/sdk-documentation/page-16-image-01.png)

3. In the Scene Auto Setup window, assign the Snippet instances you want to use in the
scene by dragging them in the Actors Object Field.
4. Review the options for which helper components should be created.

![Screenshot](/assets/images/sdk-documentation/page-17-image-01.png)

5. Click Create or Update Scene Setup.

![Screenshot](/assets/images/sdk-documentation/page-18-image-01.png)

6. Result: A parent object named Snippet Tools is created in the scene. By default, it
includes: Actor Registry, Flow Controller, Gaze Flow Controller, Simple Controller
7. The tool applies an initial configuration so you can start testing immediately and
then adjust the setup for your specific use case.

![Screenshot](/assets/images/sdk-documentation/page-18-image-02.png)

---

## 8.5 Validate with SnippetsSimpleController (first runtime test)

Before building a sequence, test the registry setup with a simple trigger.
1. Add SnippetsSimpleController to a GameObject (for clarity make one called SimpleController).
2. Assign the SnippetsActorRegistry.
3. Choose:
a. Action = Snippet, Walk, Pause, Custom Animation, or Snippet + Custom Animation
b. Actor
c. Snippet or Waypoint
d. If you use Snippet + Custom Animation, also choose the custom animation, snippet mask if
needed, and completion policy.
4. Optionally enable keyboard trigger (default is useful for quick tests).
5. Enter Play Mode and press the configured key or use inspector buttons.

**Why this step matters:**

1. It confirms the registry wiring is correct.
2. It isolates setup issues before you build longer flow sequences.

![Screenshot](/assets/images/sdk-documentation/page-19-image-01.png)

<p class="screenshot-caption">SimpleController testing playing Snippet “DoctorSnippet1” by actor “Doctor”</p>

---

## 8.5 Add movement with SnippetsWalker (optional)

If actors need to move between points:
1. Add SnippetsWalker to the actor root (or movement parent object).
2. Create waypoint transforms in the scene.
3. Assign waypoints in order to the walker.
4. Configure movement values:
a. moveSpeed
b. arriveDistance
c. turnSpeed
5. If using NavMesh:
a. Enable useNavMesh
b. Assign NavMeshAgent
c. Tune agent settings

**Then:**

1. Assign this walker to the actor entry in SnippetsActorRegistry.
2. Re-test using SnippetsSimpleController with Action = Walk.

![Screenshot](/assets/images/sdk-documentation/page-20-image-01.png)

<p class="screenshot-caption">Doctor with the Snippets Walker component attached</p>

---

## 8.6 Build a sequence with SnippetsFlowController

Use SnippetsFlowController when you want controlled steps such as “speak, walk, pause, speak.”
1. Add SnippetsFlowController to a new GameObject called “FlowController”.
2. Assign the SnippetsActorRegistry.
3. Configure flow options (Play On Start, Loop Sequence, Auto Progress, Keyboard key):
4. Add steps in the Steps list.
5. For each step choose:
a. Snippet: actor + snippet name/index
b. Walk: actor + waypoint name/index
c. Pause: timed pause or wait-for-trigger
d. Custom Animation: actor + custom animation name/index
e. Snippet + Custom Animation: actor + snippet + custom animation

**Custom animations and Mixamo Support:**

Custom Animation lets you play an animation clip that is separate from the Snippet’s built-in playback. It is useful
when you want an actor to perform an extra motion, such as a gesture, reaction, or body action, either on its own or
together with a Snippet (f.e. Keep the facial animation and voice of a snippet but use a custom animation). We made
it especially easy to integrate Mixamo animations.
1. Download the animation from Mixamo.com

![Screenshot](/assets/images/sdk-documentation/page-21-image-01.png)

2. Import the downloaded animation into your Unity project.
3. In Unity, go to Snippets > Extra > MixamoToSnippets. This will make the animation
compatible with the default stylized characters from the Snippets platform.

![Screenshot](/assets/images/sdk-documentation/page-22-image-01.png)

4. Drag the imported Mixamo animation clip into the tool’s object field.

![Screenshot](/assets/images/sdk-documentation/page-22-image-02.png)

5. Run the conversion.
6. Select the object that contains the SnippetsActorRegistry component.
7. In the Inspector, expand Show Custom Animations.

![Screenshot](/assets/images/sdk-documentation/page-23-image-01.png)

8. Add a new slot.

![Screenshot](/assets/images/sdk-documentation/page-23-image-02.png)

9. Drag your animation clip into the new object field.

![Screenshot](/assets/images/sdk-documentation/page-24-image-01.png)

10. Select the object that contains the SnippetsFlowController.
11. Add a new step to the flow.
12. Set the step type to either Custom Animation or Snippet + Custom Animation.

![Screenshot](/assets/images/sdk-documentation/page-24-image-02.png)

13. Use Custom Animation when you want to play only the animation.
14. Use Snippet + Custom Animation when you want the Snippet playback and the
custom animation to run together.
15. If you use Snippet + Custom Animation: also choose a Snippet Mask. The mask
controls which parts of the Snippet animation remain active and which parts are
overridden by the custom animation. (ex: if you choose face only mask, the face
remains snippet controlled).

![Screenshot](/assets/images/sdk-documentation/page-25-image-01.png)

**Testing strategy:**

1. Start with 2–3 steps only.
2. Verify each step transition in Play Mode.
3. Expand after baseline flow is working.

![Screenshot](/assets/images/sdk-documentation/page-26-image-01.png)

<p class="screenshot-caption">Snippets Flow Controller example implementation</p>

---

## 8.7 Add gaze behavior (SnippetsGazeDriver) (optional, but recommended for conversations)

SnippetsGazeDriver adds procedural gaze behavior to an actor. It is useful when you want a character to
turn their head, eyes, and upper body toward a target, instead of relying only on the animation already
included in the Snippet.

**For natural attention and gaze direction:**

1. Add SnippetsGazeDriver to each actor that should use procedural gaze.
2. Use the Auto Setup button in the Gaze Driver inspector first, then review the detected references
manually.
3. Assign or correct the required rig references:
a. headBone
b. waistBone f.e. “spline” (recommended for better body follow)
c. leftEyeBone / rightEyeBone (optional, but recommended for dynamic eye follow)
d. faceMesh / eyelid blendshapes (optional, if using eyelid follow)
4. Configure a basic starting setup:
a. Mode: FollowTarget or LookInFront
b. Look limits and smoothing
c. Waist follow values
5. Assign gazeDriver in the actor entry of SnippetsActorRegistry (or rely on auto-find if appropriate).

![Screenshot](/assets/images/sdk-documentation/page-27-image-01.png)

---

## 8.8 Synchronize gaze with flow using SnippetsGazeFlowController

Once your flow is stable, add gaze choreography.
1. Add SnippetsGazeFlowController to the runtime/controller object.
2. Assign:
- flow (SnippetsFlowController)
- registry (SnippetsActorRegistry)
3. Click Sync Now so gaze steps mirror flow steps.
4. Choose UnspecifiedActorBehavior (recommended starting point: KeepPrevious).
5. Configure gaze per step:
- Simple mode for step-level gaze changes (one gaze change / step)
- Granular mode for cue-based changes during a snippet (percent-based) - f.e. “when
snippet 1 reaches 20% of play time this gaze change occurs”

**Recommended first setup:**

1. Start with Simple mode only.
2. Add Granular cues only after the base flow works reliably.
Screenshot to add: 28-gaze-flow-controller-sync.png
Capture: SnippetsGazeFlowController with flow, registry, and Sync controls.

![Screenshot](/assets/images/sdk-documentation/page-28-image-01.png)

<p class="screenshot-caption">GazeFlow implementation example</p>

---

## 8.9 Final controller-based validation checklist

**Before considering the scene ready:**

1. Actors return to idle correctly after snippet/walk actions.
2. Snippet audio/text remain synchronized.
3. Flow progresses as intended (auto or manual).
4. Gaze behavior matches expected targets.
5. Controller-driven actors should not rely on standalone Play On Enable at the same time.
6. No recurring Console warnings/errors during repeated runs.
TIP: Review and experiment with the Demo Scenes provided with the SDK. All helper tools are
implemented and present flows which utilize all features described.

---

[← Previous: Bringing Imported Snippets Into A Scene](/SDK/bringing-imported-snippets-into-a-scene.md)  
[Next: Template And Playback Modes →](/SDK/template-and-playback-modes.md)

