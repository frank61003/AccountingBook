//
//  SignUpViewController.swift
//  AccountingBook
//
//  Created by frank on 29.03.25.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    private let accountTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "請輸入信箱"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "⚠️ 帳號不能為空"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        label.isHidden = true  // 預設隱藏
        return label
    }()
    
    
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "請輸入密碼"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let stackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("註冊", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("取消", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let buttonStackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    @objc func cancelButtonTapped() {
        print("點擊",self.navigationController)
        self.navigationController?.popViewController(animated: true)
    }
    @objc func signUpButtonTapped() {
        guard let account = accountTextField.text, !account.isEmpty,let password = passwordTextField.text, !password.isEmpty else{return}
        
        Auth.auth().createUser(withEmail: account, password:password) { result, error in
            guard error == nil else {
                print("註冊錯誤", error?.localizedDescription)
                return
            }
            let profileChangeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            profileChangeRequest?.displayName = self.nameTextField.text
            profileChangeRequest?.commitChanges(completion: { error in
                guard error == nil else {
                    print(error?.localizedDescription)
                    return
                }
            })
            print("註冊成功")
        }}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        stackView.addArrangedSubviews([accountTextField,errorLabel,passwordTextField,nameTextField])
        stackView.backgroundColor = .red
        self.view.addSubview(stackView)
        //        NSLayoutConstraint.activate([accountTextField.heightAnchor.constraint(equalToConstant: 30),passwordTextField.heightAnchor.constraint(equalToConstant: 30)])
        
        buttonStackView.addArrangedSubview(signUpButton)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.backgroundColor = .green
        self.view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),stackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40),stackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40)])
        NSLayoutConstraint.activate([buttonStackView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),buttonStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40),buttonStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40)])
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
    }
    
    
    
}
