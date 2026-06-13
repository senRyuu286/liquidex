### 1. Models & Infrastructure (Data Layer Core)

_Create the structured underlying data definitions and styling blocks before building UI or Logic._

- [ ] Define the `BeverageCategory` enum containing the 6 structural classifications (Water, Isotonic, Soft Drinks, Natural Juices, Energy Drinks, Caffeine).
- [ ] Create a sealed Freezed class `BeverageBlueprint` implementing distinct union factory constructors for the 6 category blueprints with associated default configuration values (e.g., baseline sugar/caffeine per ml).
- [ ] Create a Freezed model data class for `DrinkLogEntry` featuring fields for `id` (UUID string), `blueprint`, `volumeMl`, `timestamp` (DateTime), and an optional `notes` string.
- [ ] Create a Freezed model data class for `UserProfileTargets` with fields for `hydrationGoalMl` (int), `sugarCeilingGrams` (int), and `caffeineCeilingMg` (int).
- [ ] Generate the corresponding `.freezed.dart` and `.g.dart` data serialization boilerplates for all models using `build_runner`.
- [ ] Implement manual `fromJson` mapping extensions on Firestore document snapshots to safely convert remote maps into type-safe Freezed objects.
- [ ] Build a custom static `ThemeData` configuration file specifying the core Navy Blue (`#353F72`) as primary and True Black (`#000000`) for structural elements.
- [ ] Define reusable custom decoration utilities (`BoxDecoration`) for chunky, retro high-contrast container panels and razor-thin borders.
- [ ] Configure the explicit app text themes (`TextTheme`) utilizing the `google_fonts` package to tie headers to `Press Start 2P` and indices/values to `VT323`.
- [ ] Define a clean domain helper model/extension to translate current raw intake vs ceiling values into structured visual warning levels (`Safe`, `Warning`, `Danger`).

---

### 2. UI & Presentation Layer (Pure Visual Layouts)

_Focus exclusively on building stateless/stateful widgets, structural design elements, and layout flows using hardcoded or dummy variables._

#### Auth Hub

- [ ] Design the visual viewport container for the High-Tech Authentication Hub using an asymmetric technical panel structure.
- [ ] Construct the input fields layout for Email and Password with matching pixelated accent frames.
- [ ] Build a pure layout state switch layout toggle between the "Sign-In" and "Register" view layouts.
- [ ] Implement a custom pixel-art styled warning error pop-up/dialog overlay displaying hardcoded error text.

#### Profile Configuration Screen

- [ ] Construct the core layout grid for the System Configuration panel.
- [ ] Implement the slider/numerical visual input layouts for the Hydration Goal limit.
- [ ] Implement the slider/numerical visual input layouts for the Sugar Ceiling limit.
- [ ] Implement the slider/numerical visual input layouts for the Caffeine Ceiling limit.

#### Main Dashboard

- [ ] Create a multi-column (2-column or 3-column) responsive item grid widget layout to represent individual item slot modules.
- [ ] Build the structural progress bar/ring card frame component to handle localized metric visualization.
- [ ] Design the layout header displaying pixelated metadata identification tokens (e.g., ID numbers, localized tracking tags).

#### Logging Modal

- [ ] Construct a bottom sheet modal overlay menu layout triggered by an external floating action button click hook.
- [ ] Design the internal catalog item selection layout utilizing icon representations for each of the 6 beverage blueprints.
- [ ] Embed visual layout elements for manual custom parameter tweaks (volume slider element, numeric field input, and optional text notes box).
- [ ] Build a row panel of layout shortcuts representing quick-log volumetric preset buttons (e.g., 250ml, 330ml, 500ml).

#### History Dashboard

- [ ] Design a scrollable historical diary list stream layout displaying clean, sequential time-ordered row entries.
- [ ] Wrap the list item row cards inside visual `Dismissible` layout tags to render a bright warning red backdrop when swiped.

#### Analytics View

- [ ] Create an isolated dashboard analytics compartment card using the `fl_chart` library wrapper.
- [ ] Style the custom line/bar charts with hardcoded mock vectors to preview the historical intake ceilings and target goals.

---

### 3. Business Logic & State Management Layer (The Brain)

_Focus on Riverpod providers, navigation management, data transformation logic, and client-side operations._

#### GoRouter Layer

- [ ] Instantiate the global declarative `GoRouter` mapping configuration with specific path definitions for `/auth`, `/dashboard`, `/profile`, and `/history`.
- [ ] Implement a reactive routing redirect listener that reads authentication states and routes unauthenticated users automatically back to the Auth Hub.

#### userTargetsProvider

- [ ] Build a Riverpod `AsyncNotifierProvider` (`userTargetsProvider`) to track, fetch, and globally serve the app state boundaries for profiles upon program boot.
- [ ] Code the state update actions inside the notifier to manipulate the local profile configurations upon input verification.

#### dailyBeverageStreamProvider

- [ ] Build a Riverpod `StreamProvider` that exposes the list of recorded logs recorded within the boundary parameters of the active calendar day.
- [ ] Create a companion derived Riverpod state selector (`intakeAggregatesProvider`) to process data math calculations (e.g., summing total volume, sugar, and caffeine).

#### liquidTrackerController (Optimistic UI)

- [ ] Create a Riverpod `NotifierProvider` controller overseeing the local state mutations of log records.
- [ ] Implement the optimistic addition event method inside the controller that directly clones the active state and reflects changes locally using Freezed `copyWith` prior to executing external transactions.
- [ ] Implement the optimistic deletion sequence method inside the notifier to instantly hide a record upon a swipe trigger gesture while awaiting synchronization completion.

#### Input Validation & Haptics

- [ ] Write client-side validation logic functions returning structured error messages if inputs fall outside strict physical boundaries.
- [ ] Attach specific physical phone vibration actions (`HapticFeedback.lightImpact` for basic logs, `HapticFeedback.vibrate` for ceiling alerts) onto target button tap executions.

---

### 4. Backend & Firebase Integration Layer (Persistence)

_Focus on writing remote data stream linkages, network transaction queries, and database security protocols._

- [ ] Map UI email/password authentication submission commands onto the remote `FirebaseAuth.instance.signInWithEmailAndPassword` execution handler.
- [ ] Map UI registration submission commands onto the remote `FirebaseAuth.instance.createUserWithEmailAndPassword` execution handler.
- [ ] Build a structural data access class (`FirestoreLogRepository`) mapping Freezed `toJson()` maps onto remote destination paths under `users/{userId}/drinkLogs`.
- [ ] Implement a real-time Firestore collection snapshot fetch script to read and emit remote adjustments matching the active day timestamp boundaries.
- [ ] Implement the deep backend removal handler triggering an explicit background request to query and remove the exact Firestore log item mapping to its assigned unique UUID string identifier.
- [ ] Draft production-ready `firestore.rules` configuration rules that strictly limit document query read/write capabilities to instances where `request.auth.uid == userId`.
