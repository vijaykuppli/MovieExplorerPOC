//
//  HomeView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var movieViewModel = MovieViewModel()
    
    var body: some View {

        TabView {

            MovieListView()
                .tabItem {
                    Image(systemName: "film")
                    Text("movies_title")
                }

            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("favorites_title")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("profile_title")
                }
        }.environment(movieViewModel)
    }
}
