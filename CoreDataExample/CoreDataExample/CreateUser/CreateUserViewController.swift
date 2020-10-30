//
//  CreateUserViewController.swift
//  CoreDataExample
//
//  Created nguyen gia huy on 19/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btCreate: UIButton!
    var reloadCreate: (()->Void)? = nil
    
    var presenter: CreateUserPresenterProtocol

    init(presenter: CreateUserPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "CreateUserViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
        super.viewDidLoad()
       // presenter.viewCreateUser = self
        setupNav(titleNav: "Create User")
        hideKeyboard()
        btCreate.layer.cornerRadius = 8
        txtName.becomeFirstResponder()
        customBackbutton()
        
    }
    @objc func back(sender: UIBarButtonItem) {
        reloadCreate!()
        _ = navigationController?.popViewController(animated: true)
    }
    func customBackbutton() {
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),style: UIBarButtonItem.Style.plain, target: self, action: #selector(CreateUserViewController.back(sender:)))
                self.navigationItem.leftBarButtonItem = backButton
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
        if let name = txtName.text {
            if name.isEmpty {
                alertSystem(title: "An Error", content: "Please fill out this field.")
            }
            else {
                if presenter.checkDuplication(name: removeWhitespaces(text: name)) == true {
                    alertSystem(title: "An Error", content: "Name already exists")
                }
                else {
                    presenter.createUser(name: removeWhitespaces(text: name))
                    let alert = UIAlertController(title: "Create New User", message: "Success ", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                        presenter.fetchUser()
                        self.navigationController?.popViewController(animated: true)


                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
    
            
            
     
            
        }
        
    }
    
}
