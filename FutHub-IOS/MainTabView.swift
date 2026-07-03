import SwiftUI

struct MainTabView: View {
    @State private var teams: [Team] = Team.mockTeams

    var body: some View {
        TabView {
            TeamListView(teams: $teams)
                .tabItem {
                    Label("Teams", systemImage: "list.bullet")
                }

            StatsView(teams: teams)
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainTabView()
}
