//
//  ViewController.swift
//  UserGenerator
//
//  Created by Marat on 17.11.2021.
//

import UIKit

class UserViewController: UIViewController, UserPresenterDelegate {
    
    private let userPresenter = UserPresenter()
    
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
        setupLayout()
    }
    
    func presentUser(user: User) {
        let user = user
        
        if let url = user.picture?.large {
            guard let imageUrl = URL(string: url) else { return }
            guard let imageDate = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.photoImageView.image = UIImage(data: imageDate)
            }
        }
        
        DispatchQueue.main.async {
            self.firstNameLabel.text = "First name: \(user.name?.first ?? "Unknown")"
            self.lastNameLabel.text = "Last name: \(user.name?.last ?? "Unknown")"
            self.gender.text = "Gender: \(user.gender ?? "Unknown")"
            self.city.text = "City: \(user.location?.city ?? "Unknown")"
            self.country.text = "Country: \(user.location?.country ?? "Unknown")"
            self.postcode.text = "Postcode: \(user.location?.postcode ?? 0)"
            self.email.text = "Email: \(user.email ?? "Unknown")"
            self.username.text = "Username: \(user.login?.username ?? "Unknown")"
            self.password.text = "Password: \(user.login?.password ?? "Unknown")"
            self.phone.text = "Phone: \(user.phone ?? "Unknown")"
            
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
    
    private func setupLayout() {
        photoImageView.backgroundColor = .systemGray2
        photoImageView.layer.cornerRadius = 100
        photoImageView.clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [photoImageView, firstNameLabel,
                                                       lastNameLabel, gender, city, country,
                                                       postcode, email, username, password, phone])
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.setCustomSpacing(30, after: photoImageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            photoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    @objc private func addNewTask() {
        userPresenter.getUsers()
    }
}

