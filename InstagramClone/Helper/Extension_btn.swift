//
//  ExtensionsBtn.swift
//  InstagramClone
//
//  Created by ahmed nagi on 03/03/2023.
//

import UIKit


extension UIButton {
    func setattributedTitle(firstPart: String, secondPart: String){
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 16)]
        let attributtedTitle = NSMutableAttributedString(string: "\(firstPart) ", attributes: atts)
        let bold_atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributtedTitle.append(NSAttributedString(string: secondPart, attributes:bold_atts))
        setAttributedTitle(attributtedTitle, for: .normal)
        
    }
}

extension UIViewController {
    func configGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
