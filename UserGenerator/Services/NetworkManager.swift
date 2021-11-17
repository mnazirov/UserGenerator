//
//  NetworkManager.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchUser(url: String, complition: @escaping (User) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                guard let user = result.results.first as? User else { return }
                complition(user)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private init() {}
}
