//
//  PostsView.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit


class PostsView: UIView, UITableViewDelegate {
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
//        tableView.delegate = self
        tableView.register(PostsCell.self, forCellReuseIdentifier: String(describing: PostsCell.self))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.accessibilityIdentifier = "post-tableview"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostsCell.self)) as! PostsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


