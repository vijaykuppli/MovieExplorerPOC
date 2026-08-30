//
//  HomeView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some View {

        TabView {

            MovieListView()
                .environmentObject(movieViewModel)
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }

            FavoritesView()
                .environmentObject(movieViewModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
