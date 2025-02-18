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

                    //                    ProfileView()
                    //                        .tabItem {
                    //                            Image(systemName: "person.circle")
                    //                            Text("Profile")
                    //                        }
                    //                        .tag(2)
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
