//
//  TextField.swift
//  ExampleDelegate
//
//  Created by nguyen gia huy on 13/10/2020.
//
import Foundation
import UIKit
extension UITextField {
    func setBottomBorder(){

        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.6)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0
    }
    func setBottomBorderInvalid(){

        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.6)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0
    }
    
    
}
