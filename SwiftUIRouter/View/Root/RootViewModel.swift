//
//  RootViewModel.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import Foundation

protocol RootViewModelProtocol: ObservableObject {
    var appRouter: AppRouter? { get set }
    var sheetPresenter: AppRouter? { get set }

    var navigateToLoginTitle: String { get }
    var navigateToRegistartionTitle: String { get }
    var shouldPresentSheet: Bool { get set }
    var navigationTitle: String { get }
    
    func navigateToLogin()
    func navigateRegistration()
    func shouldPresentView()
}

class RootViewModel: RootViewModelProtocol {
    @Published var shouldPresentSheet = false
    @Published var appRouter: AppRouter?
    @Published var sheetPresenter: AppRouter?
    
    private lazy var loginViewModel = LoginViewModel()
    private lazy var registrationViewModel = RegistrationViewModel()
    
    var navigateToLoginTitle: String {
        "Login"
    }

    var navigateToRegistartionTitle: String {
        "Register"
    }
    
    var navigationTitle: String {
        "Router Example"
    }
    
    func navigateToLogin() {
        appRouter = .login(LoginViewModel())
    }
    
    func navigateRegistration() {
        appRouter = .registration(RegistrationViewModel())
    }
    
    func shouldPresentView() {
        sheetPresenter = .profile(ProfileViewModel())
        shouldPresentSheet.toggle()
    }
}
