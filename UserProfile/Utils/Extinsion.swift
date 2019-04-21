//
//  Extinsion.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

// MARK: - UIlabel
extension UILabel {
    
    func configureLabel(size:CGFloat,color:UIColor,weight:UIFont.Weight?){
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: size, weight: weight ?? UIFont.Weight.regular)
        textColor = color
    }
}


// MARK: - UIImageView
extension UIImageView {
    
    func configureImageViewBorder(width:CGFloat,color:UIColor)  {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}


// MARK: - UIButton
extension UIButton {
    
    func configureButton(image:String)  {
        translatesAutoresizingMaskIntoConstraints = false
        let img = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        setImage(img, for: .normal)
    }
}
