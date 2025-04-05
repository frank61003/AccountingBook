//
//  LoginViewController.swift
//  AccountingBook
//
//  Created by frank on 25.03.25.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let accountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "請輸入帳號"
        textField.borderStyle = .roundedRect  // 設置邊框樣式
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "請輸入密碼"
        textField.borderStyle = .roundedRect  // 設置邊框樣式
        textField.clearButtonMode = .whileEditing
        //        textField.font = UIFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    private let inputStackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    private let loginButton:UIButton  = {
        let loginButton = UIButton(type: .system) // 使用系統樣式按鈕
        loginButton.setTitle("點擊我", for: .normal) // 設定按鈕標題
        loginButton.layer.cornerRadius = 10 // 設定圓角
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    private let signUpButton:UIButton  = {
        let loginButton = UIButton(type: .system) // 使用系統樣式按鈕
        loginButton.setTitle("註冊", for: .normal) // 設定按鈕標題
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        return loginButton
    }()
    
    // 按鈕點擊事件
    @objc func buttonTapped() {
        print("按鈕被點擊了！",accountTextField.text)
        guard let account = accountTextField.text, !account.isEmpty,let password = passwordTextField.text,!password.isEmpty else{
            print("有空值")
            return
        }
        Auth.auth().signIn(withEmail: account, password: password) {
            result, error in
            guard let user = result?.user, error == nil else{
                print(error?.localizedDescription)
                return
            }
            print(user.displayName)
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = MainTabBarViewController()
            }
        }
        
    }
    @objc func signUpButtonTapped() {
        let vc = SignUpViewController();
        print("點擊",self.navigationController)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(inputStackView)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        setupConstraints()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = MainTabBarViewController()
            }
        }
    }
    private func setupInputStackView(){
        inputStackView.addArrangedSubviews([accountTextField,passwordTextField])
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            inputStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            inputStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -20)
            
        ])
        
        
        
    }
    private func setupConstraints() {
        setupInputStackView()
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // X 軸置中
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Y 軸置中
            loginButton.widthAnchor.constraint(equalToConstant: 150), // 設定寬度
            loginButton.heightAnchor.constraint(equalToConstant: 50) // 設定高度
        ])
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // X 軸置中
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 150), // 設定寬度
            signUpButton.heightAnchor.constraint(equalToConstant: 50) // 設定高度
        ])
    }}
