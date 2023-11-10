//
//  UserViewModel.swift
//  SwiftUIDemo
//
//  Created by Sai Suman Pothedar on 11/10/23.
//

import Foundation
import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    let urlString = "https://dummyjson.com/users"
    @Published var time: String = ""
    @Published var user: User = User(users: [UserItem]())
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
        self.makeAPICall()
    }
    
    func makeAPICall() {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { failureInfo in
                print(failureInfo)
            } receiveValue: { [weak self] userInfo in
                print(userInfo)
                self?.user = userInfo
            }
            .store(in: &cancellable)
    }
}
