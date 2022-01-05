//
//  BaseViewController.swift
//  Common
//
//  Created by Sagaya Abdul on 8/18/21.
//

import UIKit


open class BaseViewController<subview: UIView, viewModel:Any>: UIViewController {
    public let _view: subview
    public let viewModel: viewModel
    let scrollView = UIScrollView()
    public init(viewModel: viewModel) {
        self.viewModel = viewModel
        self._view = subview(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        view = _view
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (navigationController?.isBeingPresented ?? false) || isBeingPresented{
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.barTintColor = .white
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(goBack))
        }
    }
    @objc public func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
}

