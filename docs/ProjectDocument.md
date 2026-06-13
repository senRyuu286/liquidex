# Project Document

**Project Title:** Liquidex: Dynamic Beverage & Hydration Intake Tracker

**Target Platform:** iOS & Android (Flutter)

**Core Tech Stack:** Flutter, Riverpod (State Management), Firebase (Backend), Freezed (Data Modeling)

---

## 1. Project Overview & Value Proposition

For students and developers navigating a high-stress academic environment, beverages like energy drinks, sodas, coffee, and water are a daily staple. However, unmonitored intake of high-sugar or high-caffeine beverages can negatively impact health, sleep, and focus.

**Liquidex** is a streamlined mobile logging application designed to track all liquid consumption throughout the day. It copies the successful, fast-to-build layout patterns of a classic fitness tracker or calorie journal but infuses a retro, handheld "Dex" aesthetic. By focusing on a single unit of measurement (volume in ml/oz) and leveraging robust data modeling, the app minimizes user entry friction while enforcing clean, multi-metric health boundaries.

---

## 2. Core Features & Functional Requirements

### Feature 1: Simple Authentication & Profile Targets

- User authentication via **Firebase Auth** using Email and Password.
- A profile configuration screen where users set three overarching daily metrics:

1. **Hydration Goal:** Minimum volume of healthy liquids (like water) to consume (e.g., 2500 ml).
2. **Sugar Ceiling Limit:** Maximum allowed daily intake of sugars in grams (e.g., 50g).
3. **Caffeine Ceiling Limit:** Maximum allowed daily intake of caffeine in milligrams (e.g., 400mg).

- User profiles and parameters are stored in a `users` collection inside **Cloud Firestore**.

### Feature 2: "Dex-Style" Intakes Dashboard (Grid View)

- A retro dashboard utilizing high-contrast UI borders, pixel-inspired accents, and a main layout formatted as a **Grid View of Item Slots**.
- Each item slot displays custom, pixel-style progress bars directly underneath it to track individual category volume.
- **Tactile Interactions:** The app utilizes crisp, physical haptic feedback when a user clicks quick-log presets (e.g., "+ 330ml Can", "+ 500ml Bottle") to simulate interacting with buttons on a handheld device.
- **Color-Coded Visual Filters:** Categories like _Soft Drinks_ use high-visibility warning colors (Neon Pink/Purple) with clear sub-labels (_"Added Sugars"_), while _Natural Juices_ are separated using health-centric palettes (Vibrant Orange/Green) to prevent user confusion.

### Feature 3: Custom Beverage Blueprint Catalog (Freezed Layer)

Instead of forcing users to type out custom descriptions manually every time, Liquidex locks in a **Predefined Beverage Blueprint Catalog**. Built completely on Freezed union types, this catalog prevents bad data injection by explicitly restricting tracking parameters depending on what category is being logged.

The catalog tracks metrics across 6 distinct, structured categories:

1. **Water / Pure Hydration**

- _Tracked Metrics:_ Volume (mL/oz).
- _App Impact:_ Directly fills the main Hydration Goal bar. No negative boundaries checked.
- _Dex Vibe:_ `Entry #001: Pure H2O`.

2. **Isotonic / Sports Drinks** (e.g., Gatorade, Pocari Sweat)

- _Tracked Metrics:_ Volume (mL), Sugars (g), Electrolytes/Sodium (Isotonic flag).
- _App Impact:_ Fills the Hydration Goal bar while evaluating against the daily Sugar Ceiling.
- _Dex Vibe:_ `Entry #012: Hydro-Fuel`.

3. **Soft Drinks & Processed Juices** (Sodas, sweet teas, concentrates)

- _Tracked Metrics:_ Volume (mL), Added Sugars (g).
- _App Impact:_ Provides zero hydration points. Ticks up the Sugar Ceiling; progress bars turn red as limits approach.
- _Dex Vibe:_ `Entry #035: Sugar Bomb`.

4. **Natural Juices & Smoothies** (100% Fruit or freshly squeezed)

- _Tracked Metrics:_ Volume (mL), Natural Sugars (g).
- _App Impact:_ Safely handles dual-impact logic. It contributes partially to the Hydration Goal due to high water-content but also counts toward the daily Sugar Ceiling.
- _Dex Vibe:_ `Entry #050: Nature's Blend`.

5. **Energy Drinks** (Monster, Red Bull, Celsius)

- _Tracked Metrics:_ Volume (mL), Caffeine (mg), Sugars (g).
- _App Impact:_ Simultaneously impacts both safety caps. Ticks up the daily Sugar Ceiling and logs directly against the 400mg Caffeine Ceiling.
- _Dex Vibe:_ `Entry #077: Overdrive`.

6. **Caffeine** (Coffee, Tea, Espresso, Matcha)

- _Tracked Metrics:_ Volume (mL), Caffeine (mg).
- _App Impact:_ Logs purely against the Caffeine Ceiling bar. (Includes a "Has Sugar" local UI toggle for custom metric adaptation).
- _Dex Vibe:_ `Entry #099: Focus Brew`.

### Feature 4: Detailed Intake Logging & Swipe-to-Delete (CRUD)

- A floating action button triggers a custom retro bottom modal to select blueprints, alter volume, and append private user notes.
- A sub-history dashboard shows a scrollable chronological diary of the day's intake. Users can perform **Swipe-to-Delete** gestures to seamlessly wipe out accidental inputs, updating the database dynamically.

---

### Riverpod State Management Design

To enforce a zero-latency, high-performance tracking routine, memory states update smoothly using the **Optimistic UI Pattern**:

1. **`userTargetsProvider`**: A `FutureProvider` mapping global health targets from Firestore upon app initialization.
2. **`dailyBeverageStreamProvider`**: A real-time `StreamProvider` mirroring active sub-collections of data.
3. **`liquidTrackerController`**: A Riverpod `Notifier` coordinating operations. When a user triggers an addition, the controller executes a local state clone using Freezed, modifying the progress rings locally before awaiting Firestore network synchronization.

### Database Schema (Cloud Firestore Structure)

```text
users (collection)
 │
 └── userId (document)
      ├── displayName: "Summer Student"
      ├── hydrationTarget: 2500
      ├── dailySugarLimitGrams: 50
      ├── dailyCaffeineLimitMg: 400
      │
      └── drinkLogs (sub-collection)
           │
           └── logId (document)
                ├── timestamp: Timestamp
                ├── indexNumber: "Entry #024"
                ├── category: "energy_drink" / "water" / "processed_juice"
                ├── volumeMl: 330
                ├── caffeineMg: 140
                ├── sugarGrams: 27
                └── note: "Logged during final project crunch"


```

---

## 3. Required Packages & Extensions

The project avoids third-party REST API dependencies to ensure smooth execution inside short deadlines. It utilizes a clean selection of stable, modern packages:

### Core Production Dependencies

- **`flutter_riverpod`** & **`riverpod_annotation`** – Core state management architecture and provider optimization tools.
- **`go_router`** – A robust, reactive routing layer. Listens seamlessly to Riverpod Auth states to handle declarative redirects and session isolation between the Authentication Hub and the Main Dashboard.
- **`freezed_annotation`** – Handles sealed classes, data unions, pattern matching, and automatic serialization boilerplate.
- **`json_annotation`** – Provides the essential compiler annotations required for mapping Freezed data models.
- **`firebase_core`** – Initializes internal platform configurations for Firebase deployment.
- **`firebase_auth`** – Secure credentialed login, state protection, and session isolation.
- **`cloud_firestore`** – Real-time NoSQL streaming infrastructure for immediate sync tracking.
- **`fl_chart`** – The data visualization powerhouse utilized to render high-tech analytics rings, consumer progress bars, and historical logging charts.
- **`google_fonts`** – Dynamically streams required typography assets (e.g., Press Start 2P, VT323, Rubik, Inter) straight into the app's structural visual theme.
- **`intl`** – Formats retro date strings, timelines, and calendar feeds.
- **`uuid`** – Instantly generates deterministic alphanumeric hashes for serverless document ID assignment.

### Developer Dependencies (Code Generation)

- **`build_runner`** – The primary CLI runner for executing background asset generation and Dart compilation tasks.
- **`riverpod_generator`** – Autogenerates semantic functional state components and boilerplate optimizations for Riverpod.
- **`freezed`** – Translates data class configurations into structural, type-safe immutable Dart files.
- **`json_serializable`** – Generates the underlying serialization maps (`.g.dart`) to convert incoming Firestore document snapshots directly into Freezed schemas.

---
