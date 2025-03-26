//
//  LoginViewController.swift
//  AccountingBook
//
//  Created by frank on 25.03.25.
//

import UIKit

class LoginViewController: UIViewController {

    // 定義一個 UITextField 屬性
    private let textField: UITextField = {
        
        let textField = UITextField()
        // 設置輸入欄的屬性
        textField.placeholder = "請輸入內容"
        textField.borderStyle = .roundedRect  // 設置邊框樣式
        textField.clearButtonMode = .whileEditing // 編輯時顯示清除按鈕
        textField.font = UIFont.systemFont(ofSize: 16)
        
        // 設定位置與大小（可以根據需要調整）
        textField.frame = CGRect(x: 50, y: 200, width: 300, height: 40)
        
        // 可選：設置自動對齊方式
        textField.textAlignment = .center
        return textField
    }()

    // 創建按鈕
    private let loginButton:UIButton  = {
        let loginButton = UIButton(type: .system) // 使用系統樣式按鈕
        loginButton.setTitle("點擊我", for: .normal) // 設定按鈕標題
        loginButton.backgroundColor = UIColor.systemBlue // 設定背景顏色
        loginButton.setTitleColor(.white, for: .normal) // 設定文字顏色
        loginButton.layer.cornerRadius = 10 // 設定圓角
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
   
    // 按鈕點擊事件
    @objc func buttonTapped() {
        print("按鈕被點擊了！")
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = MainTabBarViewController()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(textField)
        self.view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupConstraints()
        
    }
    private func setupConstraints() {
           NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // X 軸置中
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Y 軸置中
            loginButton.widthAnchor.constraint(equalToConstant: 150), // 設定寬度
            loginButton.heightAnchor.constraint(equalToConstant: 50) // 設定高度
           ])
    }}
