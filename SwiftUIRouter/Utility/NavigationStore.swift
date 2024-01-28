//
//  NavigationStore.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

final class NavigationStore: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = NavigationPath()
    }
    
}
