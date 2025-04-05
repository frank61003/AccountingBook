//
//  StackViewExtension.swift
//  AccountingBook
//
//  Created by frank on 03.04.25.
//
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
