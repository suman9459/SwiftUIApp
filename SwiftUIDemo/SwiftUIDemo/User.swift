//
//  User.swift
//  SwiftUIDemo
//
//  Created by Sai Suman Pothedar on 11/10/23.
//

import Foundation

struct User: Decodable {
    var users: [UserItem]
}

class UserItem: Decodable, Identifiable, ObservableObject {
    var id: Int
    var firstName: String
    var lastName: String
    let maidenName: String
}

