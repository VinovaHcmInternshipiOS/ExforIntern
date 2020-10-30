//
//  AlertViewController.swift
//  CoreDataExample
//
//  Created by nguyen gia huy on 23/10/2020.
//

import Foundation
import UIKit
extension UIViewController {
    func alertSystem(title: String, content: String){
        let alert = UIAlertController(title: "\(title)", message: "\(content)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

                
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func removeWhitespaces(text: String) -> String {
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        return trimmed
      }
}
