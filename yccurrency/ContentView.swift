//
//  ContentView.swift
//  yccurrency
//
//  Created by mac on 4/2/25.
//

import SwiftUI

struct ContentView: View {

    @State var currentIndex: Int = 0

    var body: some View {
        NavigationStack {
            TabView(
                selection: $currentIndex,
                content: {
                    ExchangeRateView().tabItem {
                        Label("Exchange Rate", systemImage: "arrow.up.circle")
                    }.tag(0)
                    ExchangerView()
                        .tabItem {
                            Image(systemName: "arrow.2.squarepath")
                            Text("Exchanger")
                        }.tag(1)

                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.circle")
                            Text("Profile")
                        }
                        .tag(2)
                    //
                    //                    ExchangerView().tabItem {
                    //                        Label("Exchanger", systemImage: "suitcase.fill")
                    //                    }.tag(1)
                    //
                    //                    ProfileView().tabItem {
                    //                        Label(
                    //                            "Profile",
                    //                            systemImage: "person.badge.shield.checkmark")
                    //                    }.tag(2)
                }
            )
            .onAppear {
                UITabBar.appearance().backgroundColor = .white
            }
        }
    }
}

#Preview {
    ContentView()
}

// Data model for an exchange provider
struct Exchanger: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let exchangeRate: Double
}

// Sample data for exchangers
let sampleExchangers: [Exchanger] = [
    Exchanger(
        name: "Global Exchange", description: "Best rates worldwide",
        imageName: "globe", exchangeRate: 1.15),
    Exchanger(
        name: "City Money Exchange", description: "Reliable and fast",
        imageName: "building.2", exchangeRate: 1.13),
    Exchanger(
        name: "FastExchanger", description: "24/7 services",
        imageName: "clock.fill", exchangeRate: 1.18),
]

// ExchangerView showing a list of provider profiles
struct ExchangersView: View {
    // List of exchangers (could be fetched from an API)
    var exchangers: [Exchanger] = sampleExchangers
    @State private var searchText: String = ""

    // Filter exchangers based on the search text
    var filteredExchangers: [Exchanger] {
        if searchText.isEmpty {
            return exchangers
        } else {
            return exchangers.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search bar for filtering exchangers
                TextField("Search Exchangers", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 10)

                // List of exchanger profiles
                List(filteredExchangers) { exchanger in
                    HStack(spacing: 16) {
                        // Exchanger avatar using system images (customize as needed)
                        Image(systemName: exchanger.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.blue, Color.purple,
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(Circle())
                            .foregroundColor(.white)

                        // Exchanger details
                        VStack(alignment: .leading, spacing: 4) {
                            Text(exchanger.name)
                                .font(.headline)
                            Text(exchanger.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(
                                "Rate: \(exchanger.exchangeRate, specifier: "%.2f")"
                            )
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }

                        Spacer()

                        // Contact button (add your own action)
                        Button(action: {
                            // Implement the contact action here
                        }) {
                            Text("Contact")
                                .font(.subheadline)
                                .padding(8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Exchangers")
            .background(
                // Gradient background for a modern Exchange Rate theme
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white, Color.blue.opacity(0.2),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
        }
    }
}

// MARK: - Profile View
struct ProfilesView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile avatar using a system image (customize with your image if needed)
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top, 40)

                // Profile details
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                Text("john.doe@example.com")
                    .foregroundColor(.gray)

                // Edit Profile button
                Button(action: {
                    // Add your edit profile action here
                }) {
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .background(
                // Subtle gradient background for a modern look
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white, Color.blue.opacity(0.2),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
        }
    }
}
