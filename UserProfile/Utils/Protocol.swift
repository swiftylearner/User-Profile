//
//  Protocol.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import Foundation

protocol UserProfileDelegate {
    func handleBackTapped()
    func handleFollowUserTapped(user:UserModel?)
}

