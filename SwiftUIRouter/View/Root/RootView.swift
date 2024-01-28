//
//  RootView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct RootView<ViewModel: RootViewModelProtocol>: View {
    @EnvironmentObject var navigationStore: NavigationStore
    @ObservedObject var viewModel: ViewModel
    var body: some View {
          VStack {
             createButtonWithTitle(title: viewModel.navigateToLoginTitle, action: viewModel.navigateToLogin)
            
             createButtonWithTitle(title: viewModel.navigateToRegistartionTitle, action: viewModel.navigateRegistration)
          }
          .navigationTitle(viewModel.navigationTitle)
          .navigationDestination(item: $viewModel.appRouter) { _ in
              buildNextView(navDestination: viewModel.appRouter)
                  .environmentObject(navigationStore)

          }
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
