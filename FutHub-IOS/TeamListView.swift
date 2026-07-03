import SwiftUI

struct TeamListView: View {
    @State private var teams: [Team] = Team.mockTeams
    @State private var searchText: String = ""
    @State private var selectedTeam: Team?

    // FutHub brand colors, matching the app icon
    private let brandGreen = Color(red: 0.13, green: 0.85, blue: 0.45)
    private let brandCyan = Color(red: 0.15, green: 0.75, blue: 0.95)

    var filteredTeams: [Team] {
        if searchText.isEmpty {
            return teams
        }
        return teams.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.league.localizedCaseInsensitiveContains(searchText) ||
            $0.country.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredTeams) { team in
                Button {
                    selectedTeam = team
                } label: {
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: team.crestURL)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 48, height: 48)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                            case .failure:
                                Image(systemName: "shield.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(team.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("\(team.league) · \(team.country)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        if team.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(brandGreen)
                                .scaleEffect(team.isFavorite ? 1.0 : 0.1)
                                .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .padding(.vertical, 8)
                }
                .buttonStyle(.plain)
                .listRowBackground(Color(red: 0.08, green: 0.08, blue: 0.1))
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        deleteTeam(team)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        toggleFavorite(team)
                    } label: {
                        Label(
                            team.isFavorite ? "Unfavorite" : "Favorite",
                            systemImage: team.isFavorite ? "star.slash" : "star.fill"
                        )
                    }
                    .tint(brandGreen)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("FutHub")
            .searchable(text: $searchText, prompt: "Search teams, leagues, countries")
            .refreshable {
                await refreshTeams()
            }
            .sheet(item: $selectedTeam) { team in
                TeamDetailView(team: team)
            }
        }
        .preferredColorScheme(.dark)
        .tint(brandCyan)
    }

    private func toggleFavorite(_ team: Team) {
        if let index = teams.firstIndex(where: { $0.id == team.id }) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                teams[index].isFavorite.toggle()
            }
        }
    }

    private func deleteTeam(_ team: Team) {
        withAnimation(.easeOut(duration: 0.3)) {
            teams.removeAll { $0.id == team.id }
        }
    }

    private func refreshTeams() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        teams = Team.mockTeams
    }
}

#Preview {
    TeamListView()
}
