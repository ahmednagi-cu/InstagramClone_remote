//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by ahmed nagi on 01/03/2023.
//

import UIKit
import Firebase
class FeedViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
// MARK: - Actions
    @objc func didTapLogout(){
        do {
            try Auth.auth().signOut()
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        }catch {
            print("DEBG: Failed to sign out")
        }
        print("DEBG: Logout ")
        
    }
// MARK: - Helpers

    func configUI(){
        view.backgroundColor = .white
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        navigationItem.title = "Feed"
    }

}
// MARK: - UIcollectionviewDatasource
extension FeedViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
         return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        return CGSize(width: width, height: height)
    }
}
