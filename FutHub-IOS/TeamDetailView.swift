import SwiftUI

struct TeamDetailView: View {
    let team: Team
    @Environment(\.dismiss) private var dismiss

    private let brandGreen = Color(red: 0.13, green: 0.85, blue: 0.45)
    private let brandCyan = Color(red: 0.15, green: 0.75, blue: 0.95)

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: team.crestURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "shield.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 140, height: 140)
                .padding(.top, 24)

                Text(team.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                VStack(spacing: 12) {
                    DetailRow(label: "League", value: team.league, accent: brandCyan)
                    DetailRow(label: "Country", value: team.country, accent: brandCyan)
                    DetailRow(
                        label: "Favorite",
                        value: team.isFavorite ? "Yes" : "No",
                        accent: brandGreen
                    )
                }
                .padding()
                .background(Color(red: 0.08, green: 0.08, blue: 0.1))
                .cornerRadius(16)
                .padding(.horizontal)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.black.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .tint(brandCyan)
    }
}

private struct DetailRow: View {
    let label: String
    let value: String
    let accent: Color

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .foregroundColor(accent)
                .bold()
        }
    }
}

#Preview {
    TeamDetailView(team: Team.mockTeams[0])
}
