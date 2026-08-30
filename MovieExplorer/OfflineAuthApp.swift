//
//  OfflineAuthApp.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

@main
struct OfflineAuthApp: App {
    @AppStorage("isLoggedIn")
    private var isLoggedIn = false
    
    var body: some Scene {

        WindowGroup {
            if isLoggedIn{
                            HomeView()
                        } else {
                            LoginView()
                        }
        }
    }
}
