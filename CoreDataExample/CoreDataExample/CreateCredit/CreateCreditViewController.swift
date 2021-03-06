//
//  CreateCreditViewController.swift
//  CoreDataExample
//
//  Created nguyen gia huy on 21/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Edward
//

import UIKit

class CreateCreditViewController: UIViewController {
    
    
    
    @IBOutlet weak var btCreate: UIButton!
    @IBOutlet weak var txtCreditCard: UITextField!
    var keyDetail = Users()
    var presenter: CreateCreditPresenterProtocol
    
    init(presenter: CreateCreditPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "CreateCreditViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // presenter.viewCreateCredit = self
        setupNav(titleNav: "Create Credit")
        txtCreditCard.keyboardType = .numberPad
        hideKeyboard()
        btCreate.layer.cornerRadius = 10
        txtCreditCard.becomeFirstResponder()
    }
    func setupNav(titleNav: String){
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = titleNav
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .orange //Background
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //Text Color
        navigationController?.navigationBar.titleTextAttributes = attributes
        
    }
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(CreateUserViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    @IBAction func btCreate(_ sender: Any) {
        if let number = txtCreditCard.text {
            if number.isEmpty {
                alertSystem(title: "An Error", content: "Please fill out this field.")
            }
            else
            {
                if presenter.checkDuplication(credit: removeWhitespaces(text: number)) == true {
                    alertSystem(title: "An Error", content: "Credit number already exists")
                }
                else {
                    presenter.createCredit(user:keyDetail,numberCredit: removeWhitespaces(text: number))
                    let alert = UIAlertController(title: "Create New Credit", message: "Success ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                        presenter.fetchCredit(keyCredit: keyDetail)
                        self.navigationController?.popViewController(animated: true)
                        
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
            
            
            
            
        }
    }
    
}
