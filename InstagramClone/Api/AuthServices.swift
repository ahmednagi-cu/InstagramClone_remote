//
//  AuthServices.swift
//  InstagramClone
//
//  Created by ahmed nagi on 05/03/2023.
//

import UIKit
import Firebase

struct AuthServices {
    // login user
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    // register user
    static func registerUser(withCredential credentials: UserModel,completion: @escaping(Error?) -> Void){
        // first uploadimage
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password){ (result, error) in
                if let error = error {
                    print("DEBG: faild to  register user\(error.localizedDescription)")
                    return
                }
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentials.email,
                                          "fullname": credentials.fullname,
                                          "profileImage": imageUrl,
                                          "uid":uid,
                                          "username":credentials.username]
                COLLECTION_USERS.document(uid).setData(data, completion: completion)
            
            }
        }
        print("DEBG: credentials \(credentials)")
        
    }
    
    
    
}
