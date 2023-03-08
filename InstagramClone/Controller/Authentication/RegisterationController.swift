//
//  RegisterationController.swift
//  InstagramClone
//
//  Created by ahmed nagi on 02/03/2023.
//

import UIKit

class RegisterationController: UIViewController {
// MARK: - Properties
    private var viewModel = RegisterViewMode()
    private var profileImage: UIImage?
    private let userAvatar: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapPhotoSelect), for: .touchUpInside)
        return button
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
    private let full_nameTF = CustomTextField(placeholder: "Fullname")
    private let user_nameTF = CustomTextField(placeholder: "Username")
    
    private let sign_upBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didHandelSignUp), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setattributedTitle(firstPart: "Dont have an account?", secondPart: "Log in")
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        notifiationObservers()
    }
    

// MARK: - Actions
    @objc func didTapLogin(){
        navigationController?.popViewController(animated: true)
    }
    @objc func textDidChange(sender: UITextField){
        if sender == emailTF {
            viewModel.email = sender.text
        }else if sender == passwordlTF {
            viewModel.password = sender.text
        }else if sender == full_nameTF {
            viewModel.fullname = sender.text
        }else {
            viewModel.username = sender.text
        }
        updateForm()
    }
    
    @objc func didTapPhotoSelect(){
        print("DEBG: Show photo library")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @objc func didHandelSignUp(){
        print("DEBG: sign up")
        guard let email = emailTF.text,
              let password = passwordlTF.text,
                let fullname = full_nameTF.text,
              let username = user_nameTF.text?.lowercased(),
        let profileImage = self.profileImage
        else { return }
       let credentials = UserModel(email: email, password: password, fullname: fullname, username: username, profileImage: profileImage)
        AuthServices.registerUser(withCredential: credentials) { error in
            if let error = error {
                print("DEBG: Faild to register usdr\(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true)
            print("DEBG: Successfully register user with firestore....")
        }
    }
// MARK: - Helpers
    func configUI(){
        configGradientLayer()
        view.addSubview(userAvatar)
        userAvatar.centerX(inView: view)
        userAvatar.setDimensions(height: 140, width: 140)
        userAvatar.anchor(top:view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stacview = UIStackView(arrangedSubviews: [emailTF,passwordlTF,full_nameTF,user_nameTF,sign_upBtn])
        stacview.axis = .vertical
        stacview.spacing = 20
        view.addSubview(stacview)
        stacview.anchor(top:userAvatar.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountBtn)
        alreadyHaveAccountBtn.centerX(inView: view)
        alreadyHaveAccountBtn.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor)
    }
   
    func notifiationObservers(){
        emailTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordlTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        full_nameTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        user_nameTF.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
//
extension RegisterationController: FormViewModel {
    func updateForm() {
        sign_upBtn.backgroundColor = viewModel.butttonBacgroundColor
        sign_upBtn.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        sign_upBtn.isEnabled = viewModel.formIsValid
    }
    
}
// MARK: - UImagePickerController
extension RegisterationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage
        userAvatar.layer.cornerRadius = userAvatar.frame.width / 2
        userAvatar.layer.masksToBounds = true
        userAvatar.layer.borderColor = UIColor.white.cgColor
        userAvatar.layer.borderWidth = 2
        userAvatar.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true)
    }
    
    
    
    
}
