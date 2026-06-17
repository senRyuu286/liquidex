# Liquidex — Development Checklist

---

## Data & Foundation

> Lock this layer completely before touching any other layer. All models, theme tokens, and domain helpers must be stable before UI or logic work begins.

### Data Models

- [ ] Define the `BeverageCategory` enum for the 6 blueprint categories
- [ ] Build the `BeverageBlueprint` sealed Freezed union with one factory per category and its default metric values
- [ ] Build the `DrinkLogEntry` Freezed data class with all required log fields
- [ ] Build the `UserProfileTargets` Freezed data class with the three health ceiling fields
- [ ] Run `build_runner` to generate all `.freezed.dart` and `.g.dart` files for the models above
- [ ] Write `fromJson` conversion extensions for mapping raw Firestore document maps into each Freezed model

### Theme & Design Tokens

- [ ] Create the global `ThemeData` file binding the navy primary and true black structural colors
- [ ] Define the reusable `BoxDecoration` presets for retro panel containers, borders, and card frames
- [ ] Configure the app `TextTheme` mapping `Press Start 2P` to display headers and `VT323` to data and value fields

### Domain Logic

- [ ] Write the warning level helper that maps an intake-to-ceiling ratio into `WithinLimit`, `Approaching`, or `Exceeded`

---

## UI / Presentations / Screens

> Build all screens and components using hardcoded or dummy data only. No providers, no Firebase calls.

### SignIn Screen

- [ ] Build the SignIn screen outer panel with the asymmetric retro terminal layout
- [ ] Build the email and password input fields with pixelated accent border frames
- [ ] Build the pixel-art error dialog overlay for failed login attempts
- [ ] Build the navigation link to the SignUp Screen

### SignUp Screen

- [ ] Build the SignUp screen outer panel mirroring the SignIn terminal aesthetic
- [ ] Build the email, password, and confirm password input fields with matching pixel borders
- [ ] Build the pixel-art error dialog overlay for registration failures
- [ ] Build the navigation link back to the SignIn Screen

### Welcome Screen

- [ ] Build the Welcome Screen outer panel and section layout
- [ ] Build the Hydration Goal slider and numeric input row with its default value pre-filled
- [ ] Build the Sugar Ceiling slider and numeric input row with its default value pre-filled
- [ ] Build the Caffeine Ceiling slider and numeric input row with its default value pre-filled
- [ ] Build the skip/confirm action buttons at the bottom of the screen

### Dex Screen

- [ ] Build the responsive 2 or 3-column blueprint grid that fills the main screen body
- [ ] Build the per-slot card component showing the entry label, category accent color, and progress bar
- [ ] Build the pixelated header strip displaying today's date and daily session identifier
- [ ] Build the global aggregate summary bar showing total hydration, sugar, and caffeine at a glance
- [ ] Build the FAB button that anchors to the bottom right of the Dex Screen

#### FAB Quick-Log Modal (Dex Screen Component)

- [ ] Build the bottom sheet modal container triggered by the FAB
- [ ] Build the blueprint selection grid inside the modal with a color-coded icon per category
- [ ] Build the volume controls row: preset buttons (250ml, 330ml, 500ml), slider, and numeric field
- [ ] Build the optional notes text input field at the bottom of the modal
- [ ] Build the confirm submission button inside the modal

### Log Screen

- [ ] Build the scrollable, time-ordered log entry list layout
- [ ] Build the individual log entry row card showing index label, category, volume, and timestamp
- [ ] Wrap each row in a `Dismissible` widget with a danger-red swipe backdrop and delete icon

### Data Screen

- [ ] Build the Data Screen outer container and section layout
- [ ] Build the analytics chart card using the `fl_chart` package wrapper
- [ ] Style the chart with hardcoded mock vectors showing intake trends against daily ceiling lines

### Bio Screen

- [ ] Build the Bio Screen outer panel with account detail and target sections
- [ ] Build the editable Hydration Goal slider and numeric input row displaying the current saved value
- [ ] Build the editable Sugar Ceiling slider and numeric input row displaying the current saved value
- [ ] Build the editable Caffeine Ceiling slider and numeric input row displaying the current saved value
- [ ] Build the save action button that submits updated targets

---

## Business Logic & State Management

> Wire providers and controllers only after UI shells are complete. Keep optimistic UI behavior in mind throughout.

### Navigation

- [ ] Set up the `GoRouter` with route definitions for `/signin`, `/signup`, `/welcome`, `/dex`, `/log`, `/data`, and `/bio`
- [ ] Add the auth-state redirect listener that routes unauthenticated users back to the SignIn Screen on any protected route access

### `userTargetsProvider`

- [ ] Build the `AsyncNotifierProvider` that fetches and globally exposes user profile targets from Firestore on boot
- [ ] Implement the update action inside the notifier that saves new target values after client-side validation passes

### `dailyBeverageStreamProvider`

- [ ] Build the `StreamProvider` that emits today's log entries filtered to the current day's timestamp boundaries
- [ ] Build the derived `intakeAggregatesProvider` that sums the active stream into total hydration, sugar, and caffeine values

### `liquidTrackerController`

- [ ] Build the `NotifierProvider` that holds and manages the local log list state
- [ ] Implement the optimistic add action that appends the new entry to local state before the Firestore write completes
- [ ] Implement the optimistic delete action that removes the target entry from local state immediately on swipe before Firestore removal

### Validation & Haptics

- [ ] Write client-side input validation functions that return structured error messages for out-of-range volume and target values
- [ ] Attach `HapticFeedback.lightImpact` to quick-log preset button taps and `HapticFeedback.vibrate` to ceiling breach events

---

## Backend / Firebase Integration

> Final layer. Connect auth, Firestore reads and writes, and lock down security rules.

### Authentication

- [ ] Connect the SignIn form submission to the Firebase Auth sign-in handler
- [ ] Connect the SignUp form submission to the Firebase Auth account creation handler

### Firestore

- [ ] Build the `FirestoreLogRepository` class that writes `DrinkLogEntry` objects to the correct Firestore path under the authenticated user
- [ ] Implement the real-time snapshot listener that streams today's `drinkLogs` documents filtered by current day timestamp boundaries
- [ ] Implement the delete handler that removes a specific log document from Firestore by its UUID

### Security

- [ ] Write Firestore security rules that restrict all reads and writes to the document owner based on `request.auth.uid`
