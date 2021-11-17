//
//  NetworkManager.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchUser(url: String, complition: @escaping (Result) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let user = try JSONDecoder().decode(Result.self, from: data)
                complition(user)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private init() {}
}
