//
//  ProfileHeader.swift
//  InstagramClone
//
//  Created by ahmed nagi on 06/03/2023.
//

import UIKit
import SDWebImage

class ProfileHeader : UICollectionReusableView {
// MARK: - Properties
    var profile_header_view_model: ProfileHeaderViewModel? {
        didSet{ configure() }
    }
    static let identifier = "ProfileHeader"
    private let profileImage: UIImageView = {
       let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        postImage.backgroundColor = .lightGray
        return postImage
    }()
    private let nameLbl: UILabel = {
       let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        return lable
    }()
    private lazy var editeProfilebtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapEditeProfile), for: .touchUpInside)
        return button
    }()
    private lazy var postLable: UILabel = {
       let lable = UILabel()
        lable.numberOfLines = 0
        lable.textAlignment = .center
        lable.attributedText = attributedStateText(value: 9, lable: "posts")
        return lable
    }()
    private lazy var followersLable: UILabel = {
       let lable = UILabel()
        lable.numberOfLines = 0
        lable.textAlignment = .center
        lable.attributedText = attributedStateText(value: 12, lable: "follower")
        return lable
    }()
    private lazy var followingLable: UILabel = {
       let lable = UILabel()
        lable.numberOfLines = 0
        lable.textAlignment = .center
        lable.attributedText = attributedStateText(value: 10, lable: "following")
        return lable
    }()
    
    let gridBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "grid"), for: .normal)
        return button
    }()
    let listBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "list"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    let bookmarkBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
// MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 12)
        profileImage.setDimensions(height: 80, width: 80)
        profileImage.layer.cornerRadius = 80 / 2
        addSubview(nameLbl)
        nameLbl.anchor(top: profileImage.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        addSubview(editeProfilebtn)
        editeProfilebtn.anchor(top: nameLbl.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 24, paddingRight: 24)
        
        let stack = UIStackView(arrangedSubviews: [postLable, followersLable, followingLable])
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.centerY(inView: profileImage)
        stack.anchor(left:profileImage.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
       
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let bottomDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let buttonStack = UIStackView(arrangedSubviews: [gridBtn, listBtn, bookmarkBtn])
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        addSubview(topDivider)
        addSubview(bottomDivider)
        buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
// MARK: - Actions
    @objc func didTapEditeProfile(){
        print("edite profile ")
    }
// MARK: - Helpers
    func configure(){
        guard let viewModel = profile_header_view_model else { return }
        nameLbl.text = viewModel.fullname
        profileImage.sd_setImage(with: viewModel.profileImageUrl) { _, error, _, url in
            if let error = error {
                print("DEBG: image not yet....\(error.localizedDescription)")
                return
            }
            print(url)
        }
        print(viewModel.profileImageUrl)
        
    }
    func attributedStateText(value: Int, lable: String) -> NSAttributedString{
        let attributedText = NSMutableAttributedString(string: "\(value)\n ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: lable, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributedText
    }
}
