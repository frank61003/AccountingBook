//
//  LoginNavigationViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit

class LoginNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

    init() {
           let rootVC = LoginViewController()
           super.init(rootViewController: rootVC)
    }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
}
