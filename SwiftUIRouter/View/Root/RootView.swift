//
//  RootView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct RootView<ViewModel: RootViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
          VStack {
             createButtonWithTitle(title: viewModel.navigateToLoginTitle, action: viewModel.navigateToLogin)
            
             createButtonWithTitle(title: viewModel.navigateToRegistartionTitle, action: viewModel.navigateRegistration)
              
              createButtonWithTitle(title: "Present Sheet", action: viewModel.shouldPresentView)

          }
          .navigationTitle(viewModel.navigationTitle)
          .navigationDestination(item: $viewModel.appRouter) { to in
              buildNextView(navDestination: viewModel.appRouter)
          }
          .sheet(isPresented: $viewModel.shouldPresentSheet, content: {
              buildNextView(navDestination: viewModel.sheetPresenter)
          })
    }
}

#Preview {
    RootView(viewModel: RootViewModel())
}
