//
//  ViewController.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

class UserViewController: UIViewController, UserPresenterDelegate {
    
    private let userPresenter = UserPresenter()
    
    private var user: User? {
        didSet {
            DispatchQueue.main.async {
                self.setupUI()
            }
        }
    }
    
    // MARK: - UI elements
    private let photoImageView = UIImageView()
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
        
        setNavigavionBar()
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
    
    private func setupUI() {
        photoImageView.backgroundColor = .systemGray2
        photoImageView.layer.cornerRadius = 100
        photoImageView.clipsToBounds = true
        
        if let url = user?.picture?.large {
            guard let imageUrl = URL(string: url) else { return }
            guard let imageDate = try? Data(contentsOf: imageUrl) else { return }
                        
            DispatchQueue.main.async {
                self.photoImageView.image = UIImage(data: imageDate)
            }
        }
        
        firstNameLabel.text = "Name: \(user?.name?.first ?? "Unknown")"
        lastNameLabel.text = "Last name: \(user?.name?.last ?? "Unknown")"
        gender.text = "Gender: \(user?.gender ?? "Unknown")"
        city.text = "City: \(user?.location?.city ?? "Unknown")"
        country.text = "Country: \(user?.location?.country ?? "Unknown")"
        postcode.text = "Postcode: \(user?.location?.postcode ?? 0)"
        email.text = "Email: \(user?.email ?? "Unknown")"
        username.text = "Username: \(user?.login?.username ?? "Unknown")"
        password.text = "Password: \(user?.login?.password ?? "Unknown")"
        phone.text = "Phone: \(user?.phone ?? "Unknown")"
        
        view.setNeedsLayout()
    }
    
    @objc private func addNewTask() {
        userPresenter.getUsers()
        setupUI()
    }
}

