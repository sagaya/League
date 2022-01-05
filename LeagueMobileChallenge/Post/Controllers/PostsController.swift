//
//  PostsController.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit
import Common
import RxSwift
import RxCocoa

class PostsController: BaseViewController<PostsView,PostsViewModel> {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        
        viewModel.fetchPosts()
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel.userPosts
            .bind(to: _view.tableView.rx.items(cellIdentifier: String(describing: PostsCell.self),cellType: PostsCell.self)){ row, post, cell in
                cell.post = post
             }.disposed(by: disposeBag)
        
    }
    
}
