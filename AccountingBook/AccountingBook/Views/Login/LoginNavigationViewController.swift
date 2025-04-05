//
//  LoginNavigationViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit

class LoginNavigationViewController: UINavigationController {
    
    init() {
        let rootVC = LoginViewController()
        super.init(rootViewController: rootVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
