# FutHub (iOS)

A native SwiftUI companion app to FutHub, exploring new SwiftUI Cookbook functionality through a progressive prototype. Built with mock data as a foundation for future features.

## Theme
Football (soccer) companion app — browse teams, search by team/league/country, and mark favorites.

## SwiftUI Cookbook Features Implemented

1. **AsyncImage** — Loads team crest images asynchronously from remote URLs, with loading and failure states handled via `AsyncImagePhase`.
2. **.searchable** — Native search bar to filter teams by name, league, or country in real time.
3. **.swipeActions** — Swipe left to delete a team, swipe right to toggle favorite status.
4. **.refreshable** — Pull-to-refresh gesture simulating a network re-fetch of team data.
5. **.sheet + NavigationStack** — Tapping a team opens a detail view in a modal sheet showing crest, league, country, and favorite status.
6. **Animations/Transitions** — Spring animation on the favorite star appearing/disappearing, and an ease-out transition when deleting a team.

## Tech Stack
- SwiftUI (iOS 17+)
- Mock data (no backend/API integration yet — future iteration will connect to API-Football, mirroring the React Native FutHub app)

## Notes
- Pull-to-refresh currently resets favorites since it reloads from mock data — a known limitation to be addressed with persistence (e.g., SwiftData) in a future assignment.

## Additional SwiftUI Cookbook Features (Assignment 8)

7. **Swift Charts** — Bar chart on the Stats tab showing favorite teams grouped by league, built with `Chart` and `BarMark`.
8. **.sensoryFeedback (Haptics)** — Triggers haptic feedback when a team is marked or unmarked as favorite.
9. **.contextMenu** — Long-press on a team reveals quick actions (favorite/unfavorite, view details, delete) with a detail preview.
10. **TabView** — App restructured into three tabs: Teams, Stats, and Settings, sharing state via a parent `MainTabView`.
11. **Picker (Segmented Control)** — Segmented control to filter teams by league, combined with the existing search.
12. **Form + Toggle/Stepper** — New Settings screen with notification toggle, refresh interval stepper, and compact mode toggle, persisted with `@AppStorage`.

## Screenshots

<p align="center">
  <img src="./screenshot/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-07-03%20at%2014.22.44.png" alt="Teams Tab" width="220"/>
  <img src="./screenshot/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-07-03%20at%2014.22.52.png" alt="Team Detail" width="220"/>
  <img src="./screenshot/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-07-03%20at%2014.23.25.png" alt="Stats Tab" width="220"/>
  <img src="./screenshot/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-07-03%20at%2014.23.31.png" alt="Settings Tab" width="220"/>
  <img src="./screenshot/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-07-03%20at%2014.23.40.png" alt="Context Menu / Actions" width="220"/>
</p>
