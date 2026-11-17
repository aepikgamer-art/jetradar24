import SwiftUI

struct JetPhotoItem: Identifiable {
    let id = UUID()
    let title: String
    let registration: String
    let photographer: String
    let imageName: String
}

struct JetPhotosView: View {
    let photos = [
        JetPhotoItem(title: "Lufthansa Airbus A350-900", registration: "D-AIXY", photographer: "Kai M.", imageName: "airplane.circle.fill"),
        JetPhotoItem(title: "United Airlines Boeing 787-9", registration: "N1995U", photographer: "Alex T.", imageName: "airplane.circle.fill"),
        JetPhotoItem(title: "Delta Air Lines Airbus A350", registration: "N502DN", photographer: "Jordan K.", imageName: "airplane.circle.fill")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(photos) { photo in
                            VStack(alignment: .leading, spacing: 10) {
                                ZStack {
                                    Rectangle()
                                        .fill(LinearGradient(colors: [.indigo, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(height: 220)
                                    Image(systemName: photo.imageName)
                                        .font(.system(size: 70))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .cornerRadius(12)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(photo.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    HStack {
                                        Text("Reg: \(photo.registration)")
                                            .font(.subheadline)
                                            .foregroundColor(.cyan)
                                        Spacer()
                                        Text("Photo by \(photo.photographer)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("JetPhotos")
        }
    }
}
import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Radar Configuration")) {
                    Toggle("High Refresh Rate (60Hz)", isOn: .constant(true))
                    Toggle("Show Flight Trails", isOn: .constant(true))
                }
                
                Section(header: Text("AltStore Source Info")) {
                    HStack {
                        Text("Source URL")
                        Spacer()
                        Text("raw.githubusercontent.com/.../altstore.json")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
