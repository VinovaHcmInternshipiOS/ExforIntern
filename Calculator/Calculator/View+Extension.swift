//
//  View+Extension.swift
//  Calculator
//
//  Created by nguyen gia huy on 07/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
@IBInspectable var cornerRadius: CGFloat {
  get {
    return layer.cornerRadius
  }
  set {
    layer.cornerRadius = newValue
    clipsToBounds = true
  }
}}
