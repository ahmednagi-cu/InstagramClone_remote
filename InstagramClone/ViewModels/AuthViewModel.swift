//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by ahmed nagi on 03/03/2023.
//


import UIKit

protocol FormViewModel {
    func updateForm()
}
protocol AuthenticationViewModel {
    var formIsValid: Bool {get}
    var butttonBacgroundColor: UIColor {get}
    var buttonTitleColor: UIColor {get}
}
struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var butttonBacgroundColor: UIColor{
        return formIsValid ? .systemPurple : .systemBlue.withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
}


struct RegisterViewMode: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var butttonBacgroundColor: UIColor{
        return formIsValid ? .systemPurple : .systemBlue.withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor{
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
