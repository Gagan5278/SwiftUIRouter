//
//  ContentView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationStore: NavigationStore

    var body: some View {
        NavigationStack(path: $navigationStore.path) {
            RootView(viewModel: RootViewModel())
                .environmentObject(navigationStore)
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
