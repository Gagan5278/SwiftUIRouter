//
//  ProfileView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navigationStore: NavigationStore

    var body: some View {
        ZStack {
            Color.yellow
            Text("Profile View")
                .foregroundStyle(.white)
                .font(.largeTitle)
            createButtonWithTitle(title: "Pop to root", action: navigationStore.popToRoot)
        }
        .navigationTitle("Profile")
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
}
