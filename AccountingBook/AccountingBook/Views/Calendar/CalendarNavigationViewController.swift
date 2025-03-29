//
//  CalendarNavigationViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit

class CalendarNavigationViewController: UINavigationController {
    
    init() {
        let rootVC = CalendarViewController()
        super.init(rootViewController: rootVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
