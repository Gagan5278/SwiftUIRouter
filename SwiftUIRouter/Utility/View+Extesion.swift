//
//  View+Extesion.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

extension View {
    @ViewBuilder
    func buildNextView(navDestination: AppRouter?) -> some View {
        switch navDestination {
        case .login(let vm):
            LoginView(viewModel: vm) // Or pass as: environmentObject(vm)
        case .profile(let vm):
            ProfileView().environmentObject(vm)
        case .registration(let vm):
            RegistrationView().environmentObject(vm)
        case nil:
            EmptyView()
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func createButtonWithTitle(title: String, action: @escaping () -> Void) -> some View {
        Text(title)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue, in: .rect(cornerRadius: 10))
            .padding()
            .onTapGesture {
                action()
            }
    }
}

