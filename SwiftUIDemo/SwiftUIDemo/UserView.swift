//
//  UserView.swift
//  SwiftUIDemo
//
//  Created by Sai Suman Pothedar on 11/10/23.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel
    
    @State private var title = "Hello"
    @State private var textFieldValue = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20.0) {
                List(viewModel.user.users) { user in
                    NavigationLink(destination: UserDetailView(selectedUserInfo: user)) {
                        Text(user.firstName)
                    }
                }
                .navigationTitle("Navigation")
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.makeAPICall()
        }
    }
}

struct UserDetailView: View {
    @EnvironmentObject var viewModel: UserViewModel
    var selectedUserInfo: UserItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("User First Name is \(selectedUserInfo.firstName)")
            Text("Total User Count - \(viewModel.user.users.count)")
        }
        .onAppear {
            print("On Appear")
        }
        .onDisappear {
            print("On Disappear")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel())
    }
}
