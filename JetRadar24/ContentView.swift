import SwiftUI

struct FlightAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let flightNumber: String
    let aircraftType: String
    let heading: Double
    let altitude: Int
}

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MapContainerView()
                .tabItem {
                    Label("Radar", systemImage: "map.fill")
                }
                .tag(0)

            JetPhotosView()
                .tabItem {
                    Label("JetPhotos", systemImage: "camera.fill")
                }
                .tag(1)

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(2)
        }
        .accentColor(.cyan)
        .preferredColorScheme(.dark)
    }
}

struct MapContainerView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.8561, longitude: -104.6737),
        span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    )
    
    @State private var flights: [FlightAnnotation] = [
        FlightAnnotation(coordinate: CLLocationCoordinate2D(latitude: 39.0, longitude: -105.0), flightNumber: "DLH34Z", aircraftType: "A359", heading: 45, altitude: 38000),
        FlightAnnotation(coordinate: CLLocationCoordinate2D(latitude: 40.2, longitude: -103.5), flightNumber: "UAL1123", aircraftType: "B789", heading: 120, altitude: 34000),
        FlightAnnotation(coordinate: CLLocationCoordinate2D(latitude: 39.2, longitude: -106.1), flightNumber: "AAL554", aircraftType: "A321", heading: 270, altitude: 28000)
    ]
    
    @State private var selectedFlight: FlightAnnotation? = nil

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $region, annotationItems: flights) { flight in
                MapAnnotation(coordinate: flight.coordinate) {
                    Button(action: {
                        selectedFlight = flight
                    }) {
                        Text("✈️")
                            .font(.system(size: 26))
                            .rotationEffect(.degrees(flight.heading))
                            .shadow(color: .cyan.opacity(0.8), radius: 6, x: 0, y: 0)
                    }
                }
            }
            .ignoresSafeArea()

            // Liquid Glass Search & Header Overlay
            VStack {
                HStack {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .foregroundColor(.cyan)
                    Text("JETRADAR24 // KDEN")
                        .font(.system(.headline, design: .monospaced))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                        .shadow(color: .green, radius: 4)
                    Text("LIVE ADS-B")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(LinearGradient(colors: [.white.opacity(0.4), .clear], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.top, 50)

                Spacer()

                if let flight = selectedFlight {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Flight \(flight.flightNumber)")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: { selectedFlight = nil }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        Divider().background(.white.opacity(0.3))
                        HStack {
                            Label("Type: \(flight.aircraftType)", systemImage: "airplane")
                            Spacer()
                            Label("Alt: \(flight.altitude) ft", systemImage: "arrow.up.right")
                        }
                        .font(.subheadline)
                        .foregroundColor(.cyan)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.spring(), value: selectedFlight != nil)
                }
            }
        }
    }
}
import MapKit
