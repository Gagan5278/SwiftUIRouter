//
//  LoginView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            Color.green
            VStack {
                Text("Login View")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                createButtonWithTitle(title: viewModel.navigateToProfileTitle, action: viewModel.navigateToProfile)
            }
            .navigationDestination(item: $viewModel.appRouter) { _ in
                buildNextView(navDestination: viewModel.appRouter)
            }
        }
        .navigationTitle(viewModel.navigationTitle)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
