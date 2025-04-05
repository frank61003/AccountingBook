//
//  UIColorExtension.swift
//  AccountingBook
//
//  Created by frank on 03.04.25.
//

import UIKit

extension UIColor {
   
    struct themeColor {
        static var black_alpha_20: UIColor{ return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)}
        static var black_alpha_40: UIColor{ return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)}
        static var black_alpha_70: UIColor{ return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)}
        static var white_alpha_70: UIColor{ return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)}
        static var shadow_light: UIColor{ return UIColor(red: 30/255, green: 58/255, blue: 62/255, alpha: 0.12)}
        
    }
    convenience init(red: Int, green: Int, blue: Int) {
          assert(red >= 0 && red <= 255, "Invalid red component")
          assert(green >= 0 && green <= 255, "Invalid green component")
          assert(blue >= 0 && blue <= 255, "Invalid blue component")

          self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    

}

