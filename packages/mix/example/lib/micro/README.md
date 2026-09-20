# Mix Micro

Thirty small, stateful styling lessons inspired by the [React Bits Micro catalog](https://github.com/DavidHDev/react-bits/tree/5fc9addb5b2362043332ad6d403bb436f2596318/src/content/Micro).
These are **Mix adaptations, not behavior-identical ports**. Each keeps its visual chain next to the interaction state.

Run from `packages/mix/example`:

```sh
flutter run -d macos -t lib/micro_main.dart
flutter test test/micro_gallery_test.dart test/micro_animation_test.dart
flutter analyze
```

## Self-contained examples

Every gallery card is backed by one canonical, copy/paste-ready Dart file. Each
file contains its own `main()`, Material app, Mix scope, tokens, helpers and
interaction. It has no project-relative imports, so the entire file can be
pasted into [DartPad](https://dartpad.dev/) and run as a Flutter example.

| Controls | Actions | Motion | Agent |
|---|---|---|---|
| [Squish Switch](examples/squish_switch/main.dart) | [Hold Button](examples/hold_button/main.dart) | [Dodge Field](examples/dodge_field/main.dart) | [Lattice Loader](examples/lattice_loader/main.dart) |
| [Peek Rating](examples/peek_rating/main.dart) | [Pulse Heart](examples/pulse_heart/main.dart) | [Swipe Row](examples/swipe_row/main.dart) | [Status Mark](examples/status_mark/main.dart) |
| [Spring Check](examples/spring_check/main.dart) | [Slide Commit](examples/slide_commit/main.dart) | [Warm Tooltip](examples/warm_tooltip/main.dart) | [Call Chip](examples/call_chip/main.dart) |
| [Rubber Segment](examples/rubber_segment/main.dart) | [Fuse Button](examples/fuse_button/main.dart) | [Swipe Toast](examples/swipe_toast/main.dart) | [Prompt Bar](examples/prompt_bar/main.dart) |
| [Jelly Radio](examples/jelly_radio/main.dart) | [Bell Toggle](examples/bell_toggle/main.dart) | [Folder Float](examples/folder_float/main.dart) | [Voice Pill](examples/voice_pill/main.dart) |
| [Glide Select](examples/glide_select/main.dart) | [Sling Button](examples/sling_button/main.dart) | [Branched Menu](examples/branched_menu/main.dart) | [Thought Line](examples/thought_line/main.dart) |
| [Scrub Field](examples/scrub_field/main.dart) |  |  | [Refine Frame](examples/refine_frame/main.dart) |
| [Code Slots](examples/code_slots/main.dart) |  |  | [Slosh Gauge](examples/slosh_gauge/main.dart) |
| [Wake Slider](examples/wake_slider/main.dart) |  |  |  |
| [Comet Dial](examples/comet_dial/main.dart) |  |  |  |

The gallery imports these same files through `examples.dart`; there is no
second implementation to drift. `theme.dart` only styles the gallery shell.
The copy button on every card loads and copies its exact `main.dart` asset.

Verified DartPad stable versions on September 18, 2026: Dart 3.13.3, Flutter
3.47.4 and Mix 2.1.0. The repository currently uses Mix 2.2.0-beta.5, so the
snippets intentionally stay within the API supported by both versions.

From `packages/mix/example`, recheck the live DartPad service with:

```sh
dart run tool/verify_micro_dartpad.dart
```

## Intentional adaptations

- **Spring Check:** 28×28 visual square within a 44px hit row, 2px border at 28% opacity (50% hover), centered 18px Material tick, and a label-width strike. Its 6px radius is a deliberate checkbox-like treatment; upstream defaults to 9px. Upstream draws the tick and coordinates the fill, outer swell, label and strike from one spring. Here, a Mix spring fill, fading icon and animated strike keep the lesson compact. The fill overshoot is clipped to the square.
- **Rubber Segment:** spring travel with a brief stretch/squash keyframe; not independently simulated leading/trailing edges. **Sling Button:** drag left and release to send, with spring recoil, without the upstream tether/flight. **Branched Menu:** clipped animated section folding, without drawn branch paths.
- **Wake Slider / Comet Dial:** custom-painted direct-input accents with 320ms release decay. The comet trail follows drag direction; angular flick/momentum physics remain outside this example.
- **Slosh Gauge:** direct liquid-level input and a temporarily tilted surface that springs flat on release; no splash simulation. Fill height and tilt animate separately so a spring cannot overshoot the height below zero.
- **Status Mark / Prompt Bar / Thought Line:** status glyph reveal, send/stop, and animated staged rows; not upstream's full shape morphs, composer features or interactive trace.
- **Voice Pill:** a synthetic waveform, not microphone capture. **Refine Frame:** a gradient specimen, not generation output.

Roundness follows purpose: 6px checkbox; 8–10px inset selections/menu; 12–16px fields and action surfaces; 20px gallery cards; stadium/circle only for pills, tracks and round handles.

- **Slide Commit:** full-travel white capsule, pending spinner, green expanding confirmation and timed reset. Simulated success only.
- **Fuse Button:** 4s amber perimeter countdown, crossfaded Archive/Undo faces, hover-reentry and app-lifecycle pause.
- **Glide Select / Swipe Toast / Swipe Row:** fixed-width trigger and anchored menu pop and delayed exit unmount; clipped toast reveal/exit; row departure and restore crossfade. Swipe Row keeps a stable demo stage rather than collapsing the gallery card.

- **Folder Float:** three evenly separated cards fade out completely when closed; a fixed hover area contains the whole spread. A visible tab and upright front keep the folder silhouette clear.
- **Prompt Bar / Thought Line:** explicit text-field inset matches the send tile; a fixed thought stage keeps the heading anchored while indented steps reveal. Idle state says “Run thought.”

## Animation and Flutter boundaries

Implicit Mix animations cover state and variant transitions. Heart, bell and segment stretch use keyframes because their choreography is the point. Controllers are retained for interruptible hold/countdown progress and continuous status/waveform motion. Painted wake/trail amplitudes use Flutter tweens because they feed custom painters. Timers model simulated work, not hand-stepped tweening. Raw pointer listeners distinguish canceled accepted drags from successful releases; Flutter can otherwise report both through `onDragEnd`.

Flutter `TextField` owns text editing, selection, focus and formatters. Painters own wake bars, radial ticks/trails and status glyphs. These exceptions do not replace ordinary Mix styling. Positioned layers are used only for geometry independent of a sibling's measured size (checkbox strike and bottom-anchored hold fill).

## Verification

The two micro test files cover all 30 primary interactions, interruption/reversal, deterministic intermediate and settled frames, compact/wide gallery layouts, source-asset integrity, clipboard behavior, and three goldens (wide gallery and unchecked/checked Spring Check). Continuous animations use exact duration pumps, never `pumpAndSettle`. Pixel comparisons are used for custom drawing, while ordinary motion checks use global painted geometry rather than generated Transform nesting.


### Headless integration tests (no desktop input)

`integration_test/micro_gallery_test.dart` runs all 30 examples inside the real
scrollable app, with one scenario per example. It covers hover, drag, hold,
text entry, timed completion, and reruns using Flutter-injected input. Existing
widget tests remain the place for exact intermediate-frame/golden assertions.

Install a ChromeDriver matching your Chrome version, then run from the example
package (keep ChromeDriver running in a separate terminal):

```sh
chromedriver --port=4444
```

```sh
flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/micro_gallery_test.dart \
  -d web-server --browser-name=chrome --headless --driver-port=4444 \
  --browser-dimension=1100x900 --no-web-resources-cdn
```

This launches an isolated headless browser. It does not move the system pointer,
focus a desktop app, or type through the OS. The integration binding supplies
the test extension; the production entry point stays unchanged.

For capture tools, `--dart-define=MICRO_RECORDING=true` enables fully live frames,
brief viewing pauses, and start/end console markers per example. Recording
remains separate from assertions. Headless debug runs verify behavior, not
native-device frame-time budgets or perceptual smoothness.
