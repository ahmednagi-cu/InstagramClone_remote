//
//  User.swift
//  InstagramClone
//
//  Created by ahmed nagi on 08/03/2023.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    let profileImage: String
    let username: String
    let uid: String
    
    init(dict: [String: Any]){
        self.email = dict["email"] as? String ?? ""
        self.fullname = dict["fullname"] as? String ?? ""
        self.profileImage = dict["profileImageUrl"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.uid = dict["uid"] as? String ?? ""
    }
}
