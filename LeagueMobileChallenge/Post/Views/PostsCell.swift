//
//  PostsCell.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit
import SDWebImage
class PostsCell: UITableViewCell {
    let userImageView = UIImageView()
    let userNameLabel = UILabel()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    var post: Post?{
        didSet{
            guard let validPost = post, let name = validPost.user?.name, let avatar = validPost.user?.avatar?.thumbnail, let body = validPost.body, let title = validPost.title else { return }
            userNameLabel.text = name
            titleLabel.text = title
            descriptionLabel.text = body
            titleLabel.text = title
            userImageView.sd_setImage(with: URL(string: avatar), completed: nil)
            userNameLabel.accessibilityLabel = "Username \(name)"
            titleLabel.accessibilityLabel = "Title \(title)"
            descriptionLabel.accessibilityLabel = "Description \(body)"
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        styleLabel(userNameLabel, with: .black, font: UIFont.systemFont(ofSize: 18, weight: .medium))
        styleLabel(titleLabel, with: .black, font: UIFont.systemFont(ofSize: 18, weight: .medium))
        styleLabel(descriptionLabel, with: .black, font: UIFont.systemFont(ofSize: 15, weight: .regular))
        setupViewLayout()
        userImageView.backgroundColor = .lightGray
        descriptionLabel.numberOfLines = 0
        userImageView.contentMode = .scaleAspectFill
        isAccessibilityElement = true
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = 15
        userImageView.layer.masksToBounds = true
    }
    
    private func setupViewLayout(){
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 30),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 15),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            userNameLabel.topAnchor.constraint(equalTo: userImageView.centerYAnchor, constant: -15),
            
            titleLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 15),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15)
        ])
    }
    

    private func styleLabel(_ label: UILabel, with color: UIColor, font: UIFont){
        label.textColor = color
        label.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
