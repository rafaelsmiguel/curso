//
//  BaseViewController.swift
//  projeto-mvvm
//
//  Created by Rafael Miguel on 01/12/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    var baseLoadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoading() {
        
        self.baseLoadingView = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? LoadingView
        self.baseLoadingView?.frame = self.view.frame
        self.view.addSubview(self.baseLoadingView ?? UIView())
        self.baseLoadingView?.showLoading()
    }
    
    func hiddenLoading() {
        self.baseLoadingView?.showLoading()
        self.baseLoadingView?.isHidden = true
    }
    
}
