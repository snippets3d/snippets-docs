# Helper Tools Reference

## 1. Helper tools (see "1. Setting Up a Scene With Helper Tools (Step-by-Step)" for detailed implementation)

---

### 1.1 SnippetsActorRegistry

Purpose:

- Central actor/snippet/walk/gaze mapping
- Animation transitions (idle/walk/snippet)
- Soft/hard stop behavior and post-fade face reset

Per actor assign:

- `SnippetPlayer`
- optional `SnippetsWalker`
- optional `SnippetsHeadTurn`
- legacy `Animation` (can auto-find)
- idle clip, walk clip
- snippet list

Use when you have multi-actor orchestration or any flow controller.

![Snippets Actor Registry component](/assets/images/sdk-guide/sdk-guide-27-p21-i01.png)

---

### 1.2 SnippetsSimpleController

Purpose:

- Trigger single actions quickly (`Snippet` or `Walk`)
- Good for prototyping and QA checks

Key fields:

- Registry
- Action type
- Actor index
- Snippet index / Waypoint index
- Optional keyboard trigger

Runtime controls:

- `Start`
- `Stop`
- `Reset`

![SnippetsSimpleController component](/assets/images/sdk-guide/sdk-guide-28-p22-i01.png)

---

### 1.3 SnippetsFlowController

Purpose:

- Scripted sequence of `Snippet` / `Walk` / `Pause` steps
- Looping and manual progression support
- Emits `StepStarted` / `StepFinished` events

Key fields:

- Registry
- Steps list
- `Play On Start`
- `Loop Sequence`
- `Auto Progress`
- Keyboard key

Use for guided narrative/tour timelines.

![SnippetsFlowController component](/assets/images/sdk-guide/sdk-guide-29-p23-i01.png)

---

### 1.4 SnippetsGazeFlowController

Purpose:

- Gaze orchestration synchronized to Flow steps
- Supports `Simple` and `Granular` cue modes

Modes:

- `Simple`: apply overrides at step start
- `Granular`: apply cue overrides by percentage of snippet duration

Target types:

- `Transform`
- `Actor`
- `MainCamera`
- `Forward`
- `None`

Unspecified actor policy:

- `KeepPrevious`
- `SetOff`
- `LookAtMainCamera`

![SnippetsGazeFlowController component](/assets/images/sdk-guide/sdk-guide-30-p24-i01.png)

---

### 1.5 SnippetsWalker

Purpose:

- Waypoint movement with optional NavMesh mode

Key fields:

- Waypoints
- Move speed / arrive distance / turn speed
- `useNavMesh` + `NavMeshAgent` settings
- anti-drift options

![SnippetsWalker component](/assets/images/sdk-guide/sdk-guide-31-p25-i01.png)

---

### 1.6 SnippetsHeadTurn

Purpose:

- Procedural head/waist gaze control with smoothing and limits

Modes:

- `FollowTarget`
- `LookInFront`
- `Off`

Key fields:

- Head and waist bone references
- `lookWeight`, `blendSpeed`, `maxYaw`/`maxPitch`
- smoothing and waist-follow tuning

![Snippets HeadTurn component](/assets/images/sdk-guide/sdk-guide-32-p26-i01.png)
