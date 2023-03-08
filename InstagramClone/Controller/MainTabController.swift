//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by ahmed nagi on 01/03/2023.
//

import UIKit
import Firebase
class MainTabController: UITabBarController {
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configViewController()
        checkIfUserLoggedIn()
      
    }


    
// MARK: - Helpers
    func checkIfUserLoggedIn(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
    
 
    func configViewController(){
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        
        let feed = templateNavigationController(unselectedImage: UIImage(named: "home_unselected")!, selectedImage: UIImage(named: "home_selected")!, rootviewController: FeedViewController(collectionViewLayout: layout))
    
        let search = templateNavigationController(unselectedImage: UIImage(named: "search_unselected")!, selectedImage: UIImage(named: "search_selected")!, rootviewController: SearchViewController())
        let imageSelector = templateNavigationController(unselectedImage: UIImage(named: "image_unseleted")!, selectedImage: UIImage(named: "image_selected")!, rootviewController: ImageSelectorViewController())
        let notification = templateNavigationController(unselectedImage: UIImage(named: "like_unselected")!, selectedImage: UIImage(named: "like_selected")!, rootviewController: NotificationViewController())
        
        let profileLayout = UICollectionViewFlowLayout()
        let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected")!, selectedImage: UIImage(named: "profile_selected")!, rootviewController: ProfileViewController(collectionViewLayout: profileLayout))
        
        self.setViewControllers([feed,search,imageSelector,notification,profile], animated: true)
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootviewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootviewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        
        return nav
    }
}
