//
//  UserProfile.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

class UserProfileHeader: UICollectionReusableView {
    
    let userProfileImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.configureImageViewBorder(width: 3, color: .white)
        return image
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.configureLabel(size: 24, color: .white, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let backButton:UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(BackTapped), for: .touchUpInside)
        button.configureButton(image: "back")
        return button
    }()
    
    let followUserButton:UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(followUserTapped), for: .touchUpInside)
        button.configureButton(image: "user")
        return button
    }()
    
    // MARK: - Configure User
    var userModel:UserModel? {
        didSet{
            guard let user = userModel else {return}
            userProfileImage.image = user.profileImage
            userNameLabel.text = user.userName
        }
    }
    
    var delegate : UserProfileDelegate?
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        configureHeaderViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - header view element placements
    fileprivate func configureHeaderViews(){
        let padding : CGFloat = 20
        let imageDeminsion : CGFloat = 120
        
        let buttonDeminsion:CGFloat = 40
        
        // setup user profile image
        addSubview(userProfileImage)
        NSLayoutConstraint.activate([
            userProfileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            userProfileImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: padding),
            
            // user profile image height and width
            userProfileImage.heightAnchor.constraint(equalToConstant: imageDeminsion),
            userProfileImage.widthAnchor.constraint(equalToConstant: imageDeminsion)
        ])
        
        // round profile user view
        userProfileImage.layer.cornerRadius = imageDeminsion / 2
        
        // setup user name label
        addSubview(userNameLabel)
        NSLayoutConstraint.activate([
           userNameLabel.topAnchor.constraint(equalTo: userProfileImage.bottomAnchor, constant: padding),
           userNameLabel.centerXAnchor.constraint(equalTo: userProfileImage.centerXAnchor)
        ])
        
        // setup back button
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            
            // height and width
            backButton.heightAnchor.constraint(equalToConstant: buttonDeminsion),
            backButton.widthAnchor.constraint(equalToConstant: buttonDeminsion)
        ])
        
        // setup follow user button
        addSubview(followUserButton)
        NSLayoutConstraint.activate([
            followUserButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            followUserButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            // height and width
            followUserButton.heightAnchor.constraint(equalToConstant: buttonDeminsion),
            followUserButton.widthAnchor.constraint(equalToConstant: buttonDeminsion)
        ])
        
    }
    
    // MARK: - Selectors
    @objc func BackTapped(){
        delegate?.handleBackTapped()
    }
    
    @objc func followUserTapped(){
        delegate?.handleFollowUserTapped(user: userModel)
    }
    
}
