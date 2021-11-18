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
    
    private func setNavigavionBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Fake persone"
            
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(addNewTask)
        )
    }
        
    @objc private func addNewTask() {
        userPresenter.getUsers()
    }
}

