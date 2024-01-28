//
//  RegistrationView.swift
//  SwiftUIRouter
//
//  Created by Gagan Vishal  on 2024/01/28.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ZStack {
            Color.purple
            Text("Registration View")
                .foregroundStyle(.white)
                .font(.largeTitle)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
