//
//  MainTabView.swift
//  Airbnb Clone
//
//  Created by Mac on 19/11/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView().tabItem { Label("Explore", systemImage: "magnifyingglass") }
            WishlistsView().tabItem { Label("Wishlist", systemImage: "heart") }
            ProfileView().tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}

