//
//  UserImages.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit

class UserImages {
    var userImage:UIImage!
    
    init(image:String) {
        userImage = UIImage(named: image)
    }
}
