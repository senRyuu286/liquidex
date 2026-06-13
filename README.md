<h1 align="center">
  Liquidex
</h1>

<p align="center">
  <em>Dynamic Beverage & Hydration Intake Tracker</em>
</p>

<p align="center">
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter"></a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart"></a>
  <a href="https://firebase.google.com/"><img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black" alt="Firebase"></a>
  <a href="https://riverpod.dev/"><img src="https://img.shields.io/badge/Riverpod-000000?style=flat-square&logo=riverpod&logoColor=white" alt="Riverpod"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Status-In_Progress-orange?style=flat-square" alt="Status">
</p>

---

**Liquidex** is a streamlined mobile logging application designed to track all liquid consumption throughout the day. Built with **Flutter** and powered by **Firebase**, Liquidex copies the successful, fast-to-build layout patterns of a classic fitness tracker or calorie journal but infuses a retro, handheld "Dex" aesthetic. 

By focusing on a single unit of measurement (volume in ml/oz) and leveraging robust data modeling, the app minimizes user entry friction while enforcing clean, multi-metric health boundaries for students and developers navigating high-stress environments.

## Why Liquidex?

In a demanding academic or professional setting, unmonitored intake of high-sugar or high-caffeine beverages can negatively impact health, sleep, and focus. Liquidex addresses this problem by managing real-time data sync, secure user session authentication, and zero-latency state updates under a cohesive, nostalgic visual wrapper.

## Features

- **Simple Authentication & Profile Targets** — User authentication via Email and Password paired with profile configurations where users set daily metrics including Hydration Goals, Sugar Ceiling Limits, and Caffeine Ceiling Limits.
- **Intakes Dashboard** — A tracking view showcasing real-time metric counters alongside progress indicators to track current beverage volume levels against target safety limits.
- **Custom Beverage Blueprint Catalog** — A predefined library classifying items into 6 tracking categories: *Water, Isotonic, Soft Drinks, Natural Juices, Energy Drinks, and Caffeine*.
- **Detailed Intake Logging & Swipe Operations** — Form system for daily log item additions combined with a historical timeline feed that supports item deletion.
- **Optimistic UI State Management** — Real-time state synchronization that immediately reveals tracking status shifts locally before completing database updates.

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Riverpod
- **Backend Infrastructure:** Firebase
- **Data Modeling & Boilerplate:** Freezed & JSON Serializable
- **Navigation & Security Routing:** GoRouter
- **Data Visualization Engine:** fl_chart

## App Screenshots

_Previews capture the interface configuration across a standard Android device template._

## Author

- [Justin Ramas (senRyuu286)](https://github.com/senRyuu286)

---

<p align="center">
  <em>Log your limits, unlock your hydration — Liquidex.</em>
</p>
