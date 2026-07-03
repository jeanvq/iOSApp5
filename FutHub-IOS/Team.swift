import Foundation

struct Team: Identifiable {
    let id = UUID()
    let name: String
    let league: String
    let country: String
    let crestURL: String
    var isFavorite: Bool = false
}

extension Team {
    static let mockTeams: [Team] = [
        Team(name: "Real Madrid", league: "La Liga", country: "Spain",
             crestURL: "https://media.api-sports.io/football/teams/541.png"),
        Team(name: "FC Barcelona", league: "La Liga", country: "Spain",
             crestURL: "https://media.api-sports.io/football/teams/529.png"),
        Team(name: "Manchester City", league: "Premier League", country: "England",
             crestURL: "https://media.api-sports.io/football/teams/50.png"),
        Team(name: "Liverpool", league: "Premier League", country: "England",
             crestURL: "https://media.api-sports.io/football/teams/40.png"),
        Team(name: "River Plate", league: "Liga Profesional", country: "Argentina",
             crestURL: "https://media.api-sports.io/football/teams/435.png"),
        Team(name: "Boca Juniors", league: "Liga Profesional", country: "Argentina",
             crestURL: "https://media.api-sports.io/football/teams/451.png"),
        Team(name: "Club América", league: "Liga MX", country: "Mexico",
             crestURL: "https://media.api-sports.io/football/teams/2287.png"),
        Team(name: "Bayern Múnich", league: "Bundesliga", country: "Germany",
             crestURL: "https://media.api-sports.io/football/teams/157.png")
    ]
}
