//
//  LoginBaseController.swift
//  LeagueMobileChallenge
//
//  Created by Sagaya Abdul on 8/18/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import UIKit
import RxSwift
class LoginBaseController: UIViewController {
    let viewModel = LoginViewModel(servicing: LoginService())
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.login()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { _ in
                UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: PostsController(viewModel: PostsViewModel(servicing: PostsService())))
            }) { (error) in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
        
    }
}
