//
//  ViewController.swift
//  UserProfile
//
//  Created by MacBook on 4/20/19.
//  Copyright © 2019 Apptive. All rights reserved.
//

import UIKit
private let profileHeaderId = "userProfileVC"
private let userProfileCellId = "userProfileCell"

class UserProfileVC: UICollectionViewController {
    
    // MARK: - Properties
    var user:UserModel?
    var userImages = [UserImages]()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        // register profile header
        collectionView.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: profileHeaderId)
        
        // register collection view cell
        collectionView.register(UserProfileCell.self, forCellWithReuseIdentifier: userProfileCellId)
        
        // remove top padding for header
        collectionView.contentInsetAdjustmentBehavior = .never
        
        // create user
        user = UserModel(userName: "King James", profileImage: "lebron")
        
        // image for user cell
        userImages.append(UserImages(image: "city"))
        userImages.append(UserImages(image: "park"))
        userImages.append(UserImages(image: "court"))
        userImages.append(UserImages(image: "lakers"))
        userImages.append(UserImages(image: "party"))
        userImages.append(UserImages(image: "kids"))
        userImages.append(UserImages(image: "brooklyn"))
        userImages.append(UserImages(image: "durant"))
        userImages.append(UserImages(image: "colorful"))
        userImages.append(UserImages(image: "face"))
        userImages.append(UserImages(image: "lakers"))
        userImages.append(UserImages(image: "party"))
        userImages.append(UserImages(image: "kids"))
        userImages.append(UserImages(image: "brooklyn"))
        
    
        // configure flow layout
        configureFlowLayout(collectionView: collectionView)
      
        
    }
    
    fileprivate func configureFlowLayout(collectionView:UICollectionView){
        let itemSize = UIScreen.main.bounds.width / 3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0)

        collectionView.collectionViewLayout = layout
        
    }
    
}


// MARK: - Collection view header extension
extension UserProfileVC : UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Profile Header View, the red part
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let userProfileHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: profileHeaderId, for: indexPath) as? UserProfileHeader {
            // could be done dynamically
            userProfileHeaderView.userModel = user
            
            // set user delegate to user profile controller
            userProfileHeaderView.delegate = self
            
            return userProfileHeaderView
        }
        
        return UICollectionReusableView()
    }
    
    
    // collection view header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // get collection view width instead of the view's width because collection view might be setup in specific ways
        let userProfileHeaderSize = CGSize(width: collectionView.frame.size.width, height: 300)
        return userProfileHeaderSize
    }
    
    
    // MARK: - User Cell
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userProfileCellId, for: indexPath) as? UserProfileCell else {return UICollectionViewCell()}
        cell.userImages = userImages[indexPath.item]
        return cell
    }
    
    // did select item at indext path
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // handle image tapped
    }
    
}


// MARK: - Handle user profile header delegate
extension UserProfileVC : UserProfileDelegate  {
    
    func handleBackTapped() {
        print("GOING BACK TO CALI")
    }
    
    func handleFollowUserTapped(user: UserModel?) {
        print("YOU ARE NOT GETTING AWAY FROM ME!")
    }
    
   
    
}
