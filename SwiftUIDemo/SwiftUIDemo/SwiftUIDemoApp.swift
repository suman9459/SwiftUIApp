//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Sai Suman Pothedar on 11/10/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            UserView(viewModel: UserViewModel())
        }
    }
}
