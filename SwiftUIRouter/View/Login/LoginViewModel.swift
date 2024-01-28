//
//  LoginViewModel.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import Foundation
protocol LoginViewModelProtocol: ObservableObject {
    var appRouter: AppRouter? { get set }
    var navigateToProfileTitle: String { get }
    var navigationTitle: String { get }
    
    func navigateToProfile()
}

class LoginViewModel: LoginViewModelProtocol {
    @Published var appRouter: AppRouter? = nil
    
    var navigateToProfileTitle: String {
        "Profile"
    }
    
    var navigationTitle: String {
        "Login"
    }
    
    func navigateToProfile() {
        appRouter = .profile(ProfileViewModel())
    }
    
    
}
