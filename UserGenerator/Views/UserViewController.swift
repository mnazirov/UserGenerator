//
//  ViewController.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

class UserViewController: UIViewController, UserPresenterDelegate {
    
    private let userPresenter = UserPresenter()
    private var userView = UserView()
    
    override func loadView() {
        view = userView
        
        userPresenter.setViewDelegate(delegate: self)
        userPresenter.getUsers()
        
        setNavigavionBar()
    }
    
    func update(with user: User) {
        let user = user
        
        if let url = user.picture?.large {
            guard let imageUrl = URL(string: url) else { return }
            guard let imageDate = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.userView.photoImageView.image = UIImage(data: imageDate)
            }
        }
        
        DispatchQueue.main.async {
            self.userView.firstNameLabel.text = "First name: \(user.name?.first ?? "Unknown")"
            self.userView.lastNameLabel.text = "Last name: \(user.name?.last ?? "Unknown")"
            self.userView.gender.text = "Gender: \(user.gender ?? "Unknown")"
            self.userView.city.text = "City: \(user.location?.city ?? "Unknown")"
            self.userView.country.text = "Country: \(user.location?.country ?? "Unknown")"
            self.userView.postcode.text = "Postcode: \(user.location?.postcode ?? 0)"
            self.userView.email.text = "Email: \(user.email ?? "Unknown")"
            self.userView.username.text = "Username: \(user.login?.username ?? "Unknown")"
            self.userView.password.text = "Password: \(user.login?.password ?? "Unknown")"
            self.userView.phone.text = "Phone: \(user.phone ?? "Unknown")"
            
            self.view.setNeedsLayout()
        }
    }
    
    // MARK: - Private methods
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

