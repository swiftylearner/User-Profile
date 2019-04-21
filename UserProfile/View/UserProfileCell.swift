//
//  UserProfileCell.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

class UserProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    let userImageView:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var userImages:UserImages? {
        didSet{
            guard let images = userImages else {return}
            userImageView.image = images.userImage
        }
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellComponents()
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell Element Placement
    fileprivate func configureCellComponents(){
        //setup user images for cell
        addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor),
            userImageView.leftAnchor.constraint(equalTo: leftAnchor),
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            userImageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])

    }
    
}
