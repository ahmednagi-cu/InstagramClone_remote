//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by ahmed nagi on 01/03/2023.
//

import UIKit

class ProfileViewController: UICollectionViewController {
// MARK: - Properties
    var user: User? {
        didSet { collectionView.reloadData()}
    }
   
// MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        fetchUSer()
    }
// MARK: - Actions
    
// MARK: - Helpers
    
    func configCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.identifier)
    }
    
// MARK: - API
    func fetchUSer(){
        UserServices.fetchUser { user in
            self.user = user
            self.navigationItem.title = user.username
        }
    }

}

// MARK: - UICollectionviewDatasource
extension ProfileViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("DEBG: Did call header function...")
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeader.identifier, for: indexPath) as! ProfileHeader
        if let user = user {
            header.profile_header_view_model = ProfileHeaderViewModel(user: user)
        }
        return header
        
    }
}

// MARK: - UICollectionviewDelegate
extension ProfileViewController {
    
}
// MARK: - UICollectionviewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
