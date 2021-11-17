//
//  ViewController.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

class UserViewController: UIViewController, UserPresenterDelegate {
    
    private let userPresenter = UserPresenter()
        
    private var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        userPresenter.setViewDelegate(delegate: self)
        userPresenter.getUsers()
    }
    
    func presentUser(user: User) {
        self.user = user
    }
}

