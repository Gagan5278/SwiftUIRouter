//
//  AppRouter.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import Foundation

enum AppRouter: Hashable {
    case login(LoginViewModel)
    case registration(RegistrationViewModel)
    case profile(ProfileViewModel)
    case none

    static func == (lhs: AppRouter, rhs: AppRouter) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        var index = 0
        switch self {
        case .login:
            index = 1
        case .registration:
            index = 2
        case .profile:
            index = 3
        case .none:
            index = 0
        }
        //
        hasher.combine(index)
    }
}
