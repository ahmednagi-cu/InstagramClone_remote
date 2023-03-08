//
//  LoginController.swift
//  InstagramClone
//
//  Created by ahmed nagi on 02/03/2023.
//

import UIKit

class LoginController: UIViewController {
// MARK: - Properties
    private var viewModel = LoginViewModel()
    private let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Instagram_logo_white")
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    private let emailTF: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    private let passwordlTF: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    private let loginBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple.withAlphaComponent(0.5)
        button.isEnabled = false
        button.layer.cornerRadius = 10
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didTapHandelLogin), for: .touchUpInside)
        return button
    }()
    private let forgotPasswordBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setattributedTitle(firstPart: "Forgot your password?", secondPart: "Get help signing in.")
        return button
    }()
    private let dontHaveAccountBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setattributedTitle(firstPart: "Dont have an account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        return button
    }()
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        notifiationObservers()
    }
    

// MARK: - Actions
    @objc func didTapHandelLogin(){
        guard let email = emailTF.text,
              let password = passwordlTF.text else {
            return
        }
        AuthServices.logUserIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBG: Faild to loguser in\(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true,completion: nil)
        }
    }
    @objc func didTapSignup(){
        print("go to register ")
        let controller = RegisterationController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func textDidChange(sender: UITextField){
        if sender == emailTF {
            viewModel.email = sender.text
        }else {
            viewModel.password = sender.text
        }
        updateForm()
    }
// MARK: - Helpers
    func configUI(){
        configGradientLayer()
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    
        
        view.addSubview(logoImage)
        logoImage.centerX(inView: view)
        logoImage.setDimensions(height: 80, width: 120)
        logoImage.anchor(top:view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stacview = UIStackView(arrangedSubviews: [emailTF,passwordlTF,loginBtn,forgotPasswordBtn])
        stacview.axis = .vertical
        stacview.spacing = 20
        view.addSubview(stacview)
        stacview.anchor(top:logoImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
        view.addSubview(dontHaveAccountBtn)
        dontHaveAccountBtn.centerX(inView: view)
        dontHaveAccountBtn.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
    }

   
    func notifiationObservers(){
        emailTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordlTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

extension LoginController: FormViewModel {
    func updateForm() {
        loginBtn.backgroundColor = viewModel.butttonBacgroundColor
        loginBtn.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginBtn.isEnabled = viewModel.formIsValid
    }
    
}
