//
//  ProfileHeaderViewModel.swift
//  InstagramClone
//
//  Created by ahmed nagi on 08/03/2023.
//

import Foundation


struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    var profileImageUrl: URL? {
        return URL(string: user.profileImage)
    }
    init(user: User) {
        self.user = user
    }
}
