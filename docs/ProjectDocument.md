# Liquidex: Dynamic Beverage & Hydration Intake Tracker

**Platform:** iOS & Android (Flutter)
**Stack:** Flutter, Riverpod, Firebase, Freezed

---

## 1. Overview

Students and developers in high-pressure academic environments drink constantly: energy drinks before deadlines, coffee through all-nighters, and sodas by default. Most people have no real-time awareness of how close they are to a sugar spike or a caffeine ceiling until it is too late.

**Liquidex** is a fast, low-friction mobile logging app that tracks all beverage consumption throughout the day. It borrows the proven one-tap logging pattern from fitness trackers and calorie journals, then wraps it in a retro handheld "Dex" aesthetic that makes the habit engaging. All intake is measured in volume (ml), and a predefined blueprint catalog eliminates the need for manual data entry, keeping the logging experience snappy and consistent.

The core promise: open the app, tap a blueprint, pick a volume, done. Progress bars update immediately. No typing, no searching a food database, no guessing.

---

## 2. Design Language

### Aesthetic Direction

Liquidex looks and feels like a handheld Pokedex crossed with a military-grade health terminal. Every screen uses a high-contrast dark theme with razor-thin borders, chunky pixel accents, and a grid-first layout. The visual identity is deliberately retro and tactile, not modern or minimal.

### Color Palette

| Token | Hex | Role |
|---|---|---|
| `navy-primary` | `#353F72` | Primary UI surface, card backgrounds |
| `true-black` | `#000000` | Structural borders, dividers, backgrounds |
| `terminal-green` | `#39FF14` | Safe / within-limit states |
| `warning-amber` | `#FFC300` | Approaching ceiling states |
| `danger-red` | `#FF2D55` | Exceeded ceiling states, swipe-delete backdrops |
| `neon-pink` | `#FF2D78` | Soft Drinks category accent |
| `vibrant-orange` | `#FF6B00` | Natural Juices category accent |

### Typography

| Role | Font | Used For |
|---|---|---|
| Display / Headers | `Press Start 2P` | Screen titles, entry index labels, category names |
| Data / Values | `VT323` | Volume readings, metric values, timestamps |
| Body | `Inter` | Notes, descriptions, error messages |

### Category Color Map

Each beverage category has a fixed identity color used across its grid slot, progress indicator, and log entry row.

| Category | Accent |
|---|---|
| Water | Ice Blue (`#00BFFF`) |
| Isotonic | Electric Teal (`#00E5CC`) |
| Soft Drinks | Neon Pink (`#FF2D78`) |
| Natural Juices | Vibrant Orange (`#FF6B00`) |
| Energy Drinks | Acid Yellow (`#DFFF00`) |
| Caffeine | Deep Purple (`#9B5DE5`) |

---

## 3. Screen Map

| Screen | Route | Purpose |
|---|---|---|
| **SignIn** | `/signin` | Email/password login for returning users |
| **SignUp** | `/signup` | Account registration for new users |
| **Welcome** | `/welcome` | First-run profile target setup (runs once after SignUp) |
| **Dex** | `/dex` | Main dashboard grid with per-category progress bars and FAB quick-log modal |
| **Log** | `/log` | Scrollable history of today's logged entries with swipe-to-delete |
| **Data** | `/data` | fl_chart analytics view showing intake trends against daily ceilings |
| **Bio** | `/bio` | User profile display and health target editing |

### Navigation Flow

```
SignIn ──┐
         ├──► Welcome (first run only) ──► Dex
SignUp ──┘                                  │
                                            ├──► Log
                                            ├──► Data
                                            └──► Bio
```

Auth state is monitored by a GoRouter redirect listener. Unauthenticated users are always routed back to SignIn regardless of the attempted route.

### FAB Quick-Log Modal

The Dex Screen hosts a floating action button that opens a bottom sheet modal. This is not a separate screen — it is a component within the Dex Screen. It handles blueprint selection, volume input, and note entry for fast logging without leaving the dashboard.

---

## 4. Features

### Feature 1: Authentication & Profile Targets

Users authenticate via Firebase Auth using email and password. New users land on the Welcome Screen after SignUp to set their three daily health boundaries. These targets are pre-filled with sensible defaults so the user can skip setup entirely and reach the Dex Screen immediately.

**Daily Health Targets:**

| Target | Description | Default |
|---|---|---|
| Hydration Goal | Minimum healthy liquid volume to reach per day | 2500 ml |
| Sugar Ceiling | Maximum added or natural sugar allowed per day | 50 g |
| Caffeine Ceiling | Maximum caffeine intake allowed per day | 400 mg |

Targets are stored in the `users` Firestore document and can be edited at any time from the Bio Screen.

---

### Feature 2: Dex Screen (Main Dashboard)

The main screen is a grid of item slots, one per beverage category. Each slot displays the category's Dex-style entry number, its color-coded accent, and a pixel-style progress bar showing today's logged volume relative to the relevant ceiling.

**Dashboard Behaviors:**

- Grid is 2 or 3 columns depending on screen width.
- Progress bars shift color as intake approaches or exceeds ceilings: green to amber to red.
- A global summary strip at the top shows aggregate hydration, sugar, and caffeine against daily targets.
- The screen header renders a pixelated metadata strip with today's date and a daily session identifier.

**FAB Quick-Log Modal:**

- Opened by the floating action button on the Dex Screen.
- Step 1: Select a blueprint from the 6 category icons.
- Step 2: Set volume via slider, preset buttons (250ml, 330ml, 500ml), or manual numeric input.
- Step 3: Optionally add a private note.
- Submitting triggers an optimistic UI update before Firestore sync completes.

**Tactile Feedback:**

- Quick-log preset taps trigger `HapticFeedback.lightImpact`.
- Ceiling breach events trigger `HapticFeedback.vibrate`.

---

### Feature 3: Beverage Blueprint Catalog (Freezed Union Layer)

Instead of free-text entry, Liquidex uses a locked catalog of six predefined beverage blueprints. Each blueprint is a Freezed union type with its own metric scope, making it structurally impossible to log a caffeine value against a Water entry or a hydration contribution against a Soft Drink.

Bad data is prevented at the type level, not through runtime validation.

---

**Blueprint 1: Water**
`Entry #001: Pure H2O`

| Field | Value |
|---|---|
| Tracked | Volume (ml) |
| Hydration Impact | Full contribution to Hydration Goal |
| Sugar Impact | None |
| Caffeine Impact | None |

---

**Blueprint 2: Isotonic / Sports Drinks**
`Entry #012: Hydro-Fuel` (e.g., Gatorade, Pocari Sweat)

| Field | Value |
|---|---|
| Tracked | Volume (ml), Sugars (g), Electrolyte flag |
| Hydration Impact | Partial contribution to Hydration Goal |
| Sugar Impact | Counts toward Sugar Ceiling |
| Caffeine Impact | None |

---

**Blueprint 3: Soft Drinks & Processed Juices**
`Entry #035: Sugar Bomb` (e.g., sodas, sweet teas, concentrates)

| Field | Value |
|---|---|
| Tracked | Volume (ml), Added Sugars (g) |
| Hydration Impact | Zero |
| Sugar Impact | Counts toward Sugar Ceiling |
| Caffeine Impact | None |

---

**Blueprint 4: Natural Juices & Smoothies**
`Entry #050: Nature's Blend` (e.g., 100% fruit juice, fresh-squeezed)

| Field | Value |
|---|---|
| Tracked | Volume (ml), Natural Sugars (g) |
| Hydration Impact | Partial contribution (high water content) |
| Sugar Impact | Counts toward Sugar Ceiling |
| Caffeine Impact | None |

---

**Blueprint 5: Energy Drinks**
`Entry #077: Overdrive` (e.g., Monster, Red Bull, Celsius)

| Field | Value |
|---|---|
| Tracked | Volume (ml), Caffeine (mg), Sugars (g) |
| Hydration Impact | None |
| Sugar Impact | Counts toward Sugar Ceiling |
| Caffeine Impact | Counts toward Caffeine Ceiling |

---

**Blueprint 6: Caffeine Drinks**
`Entry #099: Focus Brew` (e.g., coffee, espresso, matcha, tea)

| Field | Value |
|---|---|
| Tracked | Volume (ml), Caffeine (mg) |
| Hydration Impact | None |
| Sugar Impact | Optional toggle ("Has Sugar") for custom adaptation |
| Caffeine Impact | Counts toward Caffeine Ceiling |

---

### Feature 4: Log Screen (History & Deletion)

The Log Screen shows a scrollable, time-ordered list of every beverage logged today. Each row displays the entry's Dex index label, blueprint category, volume, timestamp, and optional note.

Swiping a row left reveals a danger-red backdrop and triggers optimistic deletion: the row disappears from the list immediately while the Firestore removal completes in the background.

---

### Feature 5: Data Screen (Analytics)

The Data Screen displays intake trends over time using the `fl_chart` package. Charts show historical volume, sugar, and caffeine values against the user's daily ceilings. All chart styling follows the app's retro color palette.

---

### Feature 6: Bio Screen (Profile & Targets)

The Bio Screen displays the user's account details and current health targets. All three ceiling values (hydration, sugar, caffeine) are editable here via the same slider and numeric input controls used on the Welcome Screen. Changes are validated client-side before being written back to Firestore.

---

## 5. State Management Architecture (Riverpod)

All app state is managed by Riverpod providers using the Optimistic UI pattern. Local state updates first, Firestore sync follows. No loading spinners for routine log or delete operations.

### `userTargetsProvider`

Type: `AsyncNotifierProvider`

Fetches the user's three health targets from Firestore on boot and holds them globally. Exposes update actions used by the Welcome Screen and Bio Screen after input validation passes.

### `dailyBeverageStreamProvider`

Type: `StreamProvider`

Opens a real-time listener on the `drinkLogs` sub-collection filtered to the current calendar day's timestamp boundaries. Emits a live list of `DrinkLogEntry` objects consumed by the Dex Screen and Log Screen.

### `intakeAggregatesProvider`

Type: Derived selector from `dailyBeverageStreamProvider`

Sums the active stream into three aggregate values: total hydration volume, total sugar, and total caffeine. These drive all progress bar renders and warning level computations on the Dex Screen.

### `liquidTrackerController`

Type: `NotifierProvider`

Manages local state mutations for add and delete operations.

- **Add:** Clones current state list via Freezed `copyWith`, appends the new entry locally, then fires the Firestore write.
- **Delete:** Removes the target entry from local state immediately on swipe, then fires the Firestore delete by UUID.

---

## 6. Warning Level System

A domain helper translates raw intake vs. ceiling ratios into one of three named warning levels. These drive all color changes across progress bars on the Dex Screen and aggregate strip.

| Level | Condition | Color |
|---|---|---|
| `WithinLimit` | Below 75% of ceiling | Terminal Green |
| `Approaching` | 75% to 99% of ceiling | Warning Amber |
| `Exceeded` | At or above 100% of ceiling | Danger Red |

The Hydration Goal uses the inverse: `WithinLimit` means the goal has not yet been reached; `Achieved` means it has.

---

## 7. Firestore Database Schema

```
users (collection)
 └── {userId} (document)
      ├── displayName: string
      ├── hydrationTargetMl: number          // e.g., 2500
      ├── dailySugarLimitGrams: number       // e.g., 50
      ├── dailyCaffeineLimitMg: number       // e.g., 400
      │
      └── drinkLogs (sub-collection)
           └── {logId} (document)
                ├── id: string              // UUID
                ├── timestamp: Timestamp
                ├── indexLabel: string      // e.g., "Entry #024"
                ├── category: string        // e.g., "energy_drink"
                ├── volumeMl: number
                ├── caffeineMg: number      // 0 if not applicable
                ├── sugarGrams: number      // 0 if not applicable
                └── note: string | null
```

### Security Rules

All read and write access is scoped to authenticated owners only. No document under `users/{userId}` is accessible unless `request.auth.uid == userId`.

---

## 8. Package Reference

### Production Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` + `riverpod_annotation` | State management and provider architecture |
| `go_router` | Declarative routing with reactive auth redirect support |
| `freezed_annotation` + `json_annotation` | Sealed data unions, immutable models, JSON serialization |
| `firebase_core` | Firebase SDK initialization |
| `firebase_auth` | Email/password authentication and session management |
| `cloud_firestore` | Real-time NoSQL data sync |
| `fl_chart` | Analytics charts on the Data Screen |
| `google_fonts` | Press Start 2P, VT323, Inter font loading |
| `intl` | Date formatting for log timestamps and history entries |
| `uuid` | UUID generation for serverless Firestore document IDs |

### Dev Dependencies

| Package | Purpose |
|---|---|
| `build_runner` | Code generation CLI runner |
| `riverpod_generator` | Generates Riverpod provider boilerplate |
| `freezed` | Generates immutable Dart class implementations |
| `json_serializable` | Generates `.g.dart` serialization maps |

---

## 9. Phase Roadmap

### Phase 1: Core Loop (Weeks 1-2)
SignIn, SignUp, Welcome Screen, Dex Screen grid, FAB quick-log modal, real-time progress bars, Log Screen, Firestore sync, security rules.

**Demo target:** User signs up, skips Welcome config, logs three different beverage types via the FAB modal, and watches progress bars update live. Navigates to Log Screen and swipe-deletes an entry.

### Phase 2: Retention Layer (Weeks 3-4)
Data Screen with fl_chart analytics, Bio Screen target editing, daily streak counter, shareable Dex Card.

### Phase 3: Ecosystem (Post-MVP)
Weekly pattern insights, custom beverage entries, ceiling approach push notifications, optional social comparison. F