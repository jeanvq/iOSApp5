import SwiftUI
import Charts

struct StatsView: View {
    let teams: [Team]

    // Groups favorite teams by league and counts them
    private var favoritesByLeague: [(league: String, count: Int)] {
        let favorites = teams.filter { $0.isFavorite }
        let grouped = Dictionary(grouping: favorites, by: { $0.league })
        return grouped.map { (league: $0.key, count: $0.value.count) }
            .sorted { $0.count > $1.count }
    }

    private let brandGreen = Color(red: 0.13, green: 0.85, blue: 0.45)
    private let brandCyan = Color(red: 0.15, green: 0.75, blue: 0.95)

    var body: some View {
        NavigationStack {
            VStack {
                if favoritesByLeague.isEmpty {
                    ContentUnavailableView(
                        "No Favorites Yet",
                        systemImage: "star.slash",
                        description: Text("Mark some teams as favorites to see stats here.")
                    )
                } else {
                    Chart(favoritesByLeague, id: \.league) { item in
                        BarMark(
                            x: .value("League", item.league),
                            y: .value("Favorites", item.count),
                            width: .fixed(50)
                        )
                        .foregroundStyle(brandGreen.gradient)
                        .cornerRadius(6)
                    }
                    .frame(height: 260)
                    .padding()
                }

                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Stats")
        }
        .preferredColorScheme(.dark)
        .tint(brandCyan)
    }
}

#Preview {
    StatsView(teams: Team.mockTeams)
}
