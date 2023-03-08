//
//  ProfileCell.swift
//  InstagramClone
//
//  Created by ahmed nagi on 06/03/2023.
//

import UIKit


class ProfileCell: UICollectionViewCell {
// MARK: - Properties
    static let identifier = "ProfileCell"
    private let postImage: UIImageView = {
       let postImage = UIImageView()
        postImage.image = UIImage(named: "venom-7")
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        return postImage
    }()
// MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
          backgroundColor = .lightGray
          addSubview(postImage)
         postImage.frame = CGRect(x: 0 , y: 0, width: frame.width, height: frame.height)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
