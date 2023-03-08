//
//  UserServices.swift
//  InstagramClone
//
//  Created by ahmed nagi on 08/03/2023.
//

import Firebase

struct UserServices {
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dict = snapshot?.data() else { return }
            let user = User(dict: dict)
            completion(user)
        }
    }
}
