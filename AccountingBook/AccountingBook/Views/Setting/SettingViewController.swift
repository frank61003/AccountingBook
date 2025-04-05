//
//  SettingViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {
    
    
    private let scrollView: UIScrollView = {
        let scrollView  = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let contentView = UIView()
    private let logoutButton: UIButton = {
        let loginButton = UIButton(type: .system) // 使用系統樣式按鈕
        loginButton.setTitle("登出", for: .normal) // 設定按鈕標題
        loginButton.backgroundColor = UIColor.systemBlue // 設定背景顏色
        loginButton.setTitleColor(.white, for: .normal) // 設定文字顏色
        loginButton.layer.cornerRadius = 10 // 設定圓角
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    @objc func logoutButtonTapped() {
        do {
            try Auth.auth().signOut()
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = LoginNavigationViewController()
            }
            
        } catch let signOutError as NSError {
            print("登出失敗: \(signOutError.localizedDescription)")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupContent()
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .purple
        scrollView.backgroundColor = .red
        self.view.backgroundColor = .yellow
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2)
        ])
    }
    
    private func setupContent() {
        let label = UILabel()
        label.text = "這是一個可滾動的頁面！"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(systemName: "photo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            logoutButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            logoutButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            logoutButton.heightAnchor.constraint( equalToConstant: 50),
            label.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
        ])
    }
    
}
