//
//  CalendarViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit

class CalendarViewController: UIViewController {
    private let datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = .red
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    @objc func rightButtonTapped() {
        print("右上角按鈕被點擊了")
        let vc = AccountDetailViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(datePicker)
        let rightButton = UIBarButtonItem(title: "按鈕", style: .plain, target: self, action: #selector(rightButtonTapped))
        
        // 將按鈕設置到導航條的右側
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        NSLayoutConstraint.activate([datePicker.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),datePicker.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),datePicker.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),datePicker.heightAnchor.constraint(equalToConstant: 350)])
        
    }
    
    
    
    
}
