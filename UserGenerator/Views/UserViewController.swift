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
    
    // MARK: - UI elements
    private let userViewImage = UIImageView()
    private let firstNameLabel = UILabel()
    private let lastNameLabel = UILabel()
    private let gender = UILabel()
    private let city = UILabel()
    private let country = UILabel()
    private let postcode = UILabel()
    private let email = UILabel()
    private let username = UILabel()
    private let password = UILabel()
    private let phone = UILabel()
    
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

