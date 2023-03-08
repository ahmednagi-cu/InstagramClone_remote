//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by ahmed nagi on 03/03/2023.
//

import UIKit


class CustomTextField: UITextField {
    
    init(placeholder: String) {
         super.init(frame: .zero)
           borderStyle = .none
           textColor = .white
           keyboardAppearance = .dark
           keyboardType = .emailAddress
           backgroundColor = UIColor(white: 1, alpha: 0.1)
           leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
           leftViewMode = .always
           setHeight(50)
           attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
