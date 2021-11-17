//
//  UserPresenter.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUser(user: User)
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
        
    public func getUsers() {
        NetworkManager.shared.fetchUser(url: "https://randomuser.me/api/") { user in
            self.delegate?.presentUser(user: user)
        }
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
