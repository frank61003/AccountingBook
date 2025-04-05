//
//  AccountDetailViewController.swift
//  AccountingBook
//
//  Created by frank on 03.04.25.
//

import UIKit

class AccountDetailViewController: UIViewController {
    private let backgroundView:UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cancelButton:UIButton  = {
        let cancelButton = UIButton(type: .system) // 使用系統樣式按鈕
        let image = UIImage(named: "icon_close_black")
        cancelButton.setTitle("取消", for: .normal) // 設定按鈕標題
        cancelButton.layer.cornerRadius = 10 // 設定圓角
        cancelButton.setImage(image, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return cancelButton
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView  = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "新增標題"
        textField.backgroundColor = .blue
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "選擇日期"
        
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.locale = Locale(identifier: "zh_TW")
        datePicker = picker
        textField.inputView = picker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private var datePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
    }()
    
    @objc private func doneTapped() {
        // 日期轉字串格式
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "zh_TW") // 中文格式
        dateTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc private func amountInputDoneTapped() {
        view.endEditing(true)
    }
    
    private lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "請輸入數量"
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 16)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(amountInputDoneTapped))
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    
    private let confirmButton:UIButton  = {
        let confirmButton = UIButton(type: .system)
        confirmButton.setTitle("確定", for: .normal)
        confirmButton.layer.cornerRadius = 10
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        return confirmButton
    }()
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
    }
    
    private func setupScrollView() {
        backgroundView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(inputStackView)
        inputStackView.addArrangedSubviews([titleTextField,dateTextField,amountTextField])
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            inputStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            inputStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),inputStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundView.backgroundColor = UIColor(red: 244, green: 244, blue: 244)
        self.backgroundView.addSubview(cancelButton)
        self.backgroundView.addSubview(scrollView)
        self.backgroundView.addSubview(confirmButton)
        amountTextField.delegate = self
        setupScrollView()
        self.view.addSubview(backgroundView)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([backgroundView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),backgroundView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),backgroundView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),self.backgroundView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
        NSLayoutConstraint.activate([cancelButton.topAnchor.constraint(equalTo: self.backgroundView.topAnchor),cancelButton.leftAnchor.constraint(equalTo: self.backgroundView.leftAnchor,constant: 20)])
        NSLayoutConstraint.activate([confirmButton.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor),confirmButton.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor),confirmButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)])
        
    }
    
}
extension  AccountDetailViewController:  UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 只允許 0~9 數字
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
