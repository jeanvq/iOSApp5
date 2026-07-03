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
