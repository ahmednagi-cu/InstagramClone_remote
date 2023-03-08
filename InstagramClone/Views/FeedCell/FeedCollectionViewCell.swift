//
//  FeedCollectionViewCell.swift
//  InstagramClone
//
//  Created by ahmed nagi on 01/03/2023.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
// MARK: - Properties
    static let identifier = "FeedCollectionViewCell"
    
    private let profileImageView: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.isUserInteractionEnabled = true
        avatarImage.image = UIImage(named: "venom-7")
        return avatarImage
    }()
    private lazy var usernameBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Ahmed", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.isUserInteractionEnabled = true
        postImageView.image = UIImage(named: "venom-7")
        return postImageView
    }()
    
    private lazy var likeBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var commentBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    private lazy var shareBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLBL: UILabel = {
        let lable = UILabel()
        lable.text = "1 like"
        lable.font = UIFont.boldSystemFont(ofSize: 13)
        return lable
    }()
    private let captionLBL: UILabel = {
        let lable = UILabel()
        lable.text = "Some test caption for now.."
        lable.font = UIFont.systemFont(ofSize: 14)
        return lable
    }()
    private let postTimeLBL: UILabel = {
        let lable = UILabel()
        lable.text = "2 days ago"
        lable.font = UIFont.systemFont(ofSize: 12)
        lable.textColor = .lightGray
        return lable
    }()
    
// MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top:topAnchor, left: leftAnchor,paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameBtn)
        usernameBtn.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor,paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configActionBtn()
        
        addSubview(likesLBL)
        likesLBL.anchor(top:likeBtn.bottomAnchor,left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        addSubview(captionLBL)
        captionLBL.anchor(top:likesLBL.bottomAnchor, left: leftAnchor,paddingTop: 8,paddingLeft: 8)
        addSubview(postTimeLBL)
        postTimeLBL.anchor(top:captionLBL.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
// MARK: - Actions
    @objc func didTapUsername(){
        print("DEGB: did tap username")
    }
// MARK: - Helpers
    func configActionBtn(){
        let stackView = UIStackView(arrangedSubviews: [likeBtn,commentBtn,shareBtn])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top:postImageView.bottomAnchor,width: 120,height: 50)
    }
}
