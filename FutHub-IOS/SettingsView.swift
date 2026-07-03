import SwiftUI

struct SettingsView: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    @AppStorage("refreshIntervalMinutes") private var refreshIntervalMinutes: Int = 5
    @AppStorage("compactMode") private var compactMode: Bool = false

    private let brandCyan = Color(red: 0.15, green: 0.75, blue: 0.95)

    var body: some View {
        NavigationStack {
            Form {
                Section("Notifications") {
                    Toggle("Match Notifications", isOn: $notificationsEnabled)

                    Stepper(
                        "Refresh every \(refreshIntervalMinutes) min",
                        value: $refreshIntervalMinutes,
                        in: 1...30
                    )
                }

                Section("Display") {
                    Toggle("Compact Mode", isOn: $compactMode)
                }

                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
        .preferredColorScheme(.dark)
        .tint(brandCyan)
    }
}

#Preview {
    SettingsView()
}
