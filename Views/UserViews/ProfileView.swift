//
//  ProfileView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var showLogoutAlert = false
    
    @AppStorage("isLoggedIn")
    private var isLoggedIn = false
    
    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {

                // Profile Section
                VStack(spacing: 12) {

                    Image("profile_pic")
                        .resizable()
                        .frame(width: AppConstants.ImageSize.imageWidth, height: AppConstants.ImageSize.imageWidth)
                        .clipShape(Circle())
                        .foregroundStyle(.blue)

                    Text("Vijay Kumar")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("+91 9876543210")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, AppConstants.Padding.paddingNormal)

                // Menu Section
                VStack(spacing: AppConstants.Spacing.medium) {

                    ProfileRow(
                        icon: "pencil",
                        title: "Edit Profile"
                    )

                    ProfileRow(
                        icon: "heart.fill",
                        title: "My Favorites"
                    )

                    ProfileRow(
                        icon: "bell.fill",
                        title: "Notifications"
                    )

                    ProfileRow(
                        icon: "info.circle.fill",
                        title: "About App"
                    )

                    Button {
                        showLogoutAlert = true
                    } label: {
                        ProfileRow(
                            icon: "rectangle.portrait.and.arrow.right",
                            title: "Logout"
                        )
                    }
                    .buttonStyle(.plain)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("profile_title")
            .alert("Logout", isPresented: $showLogoutAlert) {

                Button("cancel", role: .cancel) { }

                Button("okay", role: .destructive) {
                    logout()
                }

            } message: {

                Text("Are you sure you want to logout?")
            }
        }
    }
    func logout() {
        isLoggedIn = false
    }
}
