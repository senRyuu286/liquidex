<h1 align="center">Liquidex</h1>

<p align="center"><em>Dynamic Beverage & Hydration Intake Tracker</em></p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black" alt="Firebase">
  <img src="https://img.shields.io/badge/Riverpod-000000?style=flat-square&logo=riverpod&logoColor=white" alt="Riverpod">
  <img src="https://img.shields.io/badge/Status-In_Progress-orange?style=flat-square" alt="Status">
</p>

---

Liquidex is a retro-styled mobile app for tracking daily beverage intake. Log what you drink, watch your health ceilings in real time, and stay within your limits — all in a fast, low-friction interface built around a handheld "Dex" aesthetic.

Built for students and developers who drink energy drinks, coffee, and sodas daily but rarely know how close they are to a sugar spike or caffeine ceiling until it hits.

## Screenshots

_Previews coming soon._

## Features

| Feature               | Description                                                                                         |
| --------------------- | --------------------------------------------------------------------------------------------------- |
| **Authentication**    | Email and password login via Firebase Auth                                                          |
| **Profile Targets**   | Set daily Hydration Goal, Sugar Ceiling, and Caffeine Ceiling                                       |
| **Dex Dashboard**     | Real-time grid view of all 6 beverage categories with color-coded progress bars                     |
| **Blueprint Catalog** | 6 predefined beverage types — Water, Isotonic, Soft Drinks, Natural Juices, Energy Drinks, Caffeine |
| **Quick Log**         | FAB-triggered modal for fast blueprint selection, volume input, and note entry                      |
| **Log History**       | Scrollable daily intake timeline with swipe-to-delete                                               |
| **Analytics**         | Historical intake charts against daily ceiling targets                                              |
| **Optimistic UI**     | Local state updates instantly before Firestore sync completes                                       |

## Tech Stack

| Layer            | Tool                                 |
| ---------------- | ------------------------------------ |
| Framework        | Flutter + Dart                       |
| State Management | Riverpod                             |
| Backend          | Firebase Auth + Cloud Firestore      |
| Data Modeling    | Freezed + JSON Serializable          |
| Navigation       | GoRouter                             |
| Charts           | fl_chart                             |
| Typography       | Press Start 2P, VT323 (Google Fonts) |

## Screens

`SignIn` · `SignUp` · `Welcome` · `Dex` · `Log` · `Data` · `Bio`

## Author

[Justin Ramas (senRyuu286)](https://github.com/senRyuu286)

---

<p align="center"><em>Log your limits. Own your intake.</em></p>
