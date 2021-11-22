//
//  UserView.swift
//  UserGenerator
//
//  Created by Marat on 21.11.2021.
//

import UIKit

class UserView: UIView {

    // MARK: - UI elements
    let photoImageView = UIImageView()
    let userViewImage = UIImageView()
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let gender = UILabel()
    let city = UILabel()
    let country = UILabel()
    let postcode = UILabel()
    let email = UILabel()
    let username = UILabel()
    let password = UILabel()
    let phone = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            photoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
