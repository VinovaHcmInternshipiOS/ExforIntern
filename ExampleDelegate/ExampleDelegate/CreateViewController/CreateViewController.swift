//
//  CreateViewController.swift
//  ExampleDelegate
//
//  Created by nguyen gia huy on 13/10/2020.
//

import UIKit
protocol CreateViewControllerProtocol: class {
    func didCreateSuccess(sender: Users)
}
class CreateViewController: UIViewController {
    weak var delegate: CreateViewControllerProtocol?
    var dataGlobal = DataUser.share
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtClass: UITextField!
    @IBOutlet weak var btDone: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        hideKeyboard()
        setupNav(titleNav: "CREATE")
        // Do any additional setup after loading the view.
    }
    
    func setupNav(titleNav: String){
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = titleNav
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .orange //Background
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //Text Color
        navigationController?.navigationBar.titleTextAttributes = attributes

    }
    private func setupView(){
        txtName.setBottomBorder()
        txtClass.setBottomBorder()
        txtName.delegate = self
        txtClass.delegate = self
        btDone.layer.cornerRadius = 7
        
    }
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(CreateViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func btDone(_ sender: Any) {
        if let username = txtName.text, let userclass = txtClass.text {
            let request = Users(userName: username, userClass: userclass)
           // dataGlobal.data.append(request)
            let alert = UIAlertController(title: "Create New User", message: "Success ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
                self.delegate?.didCreateSuccess(sender: request)
            }))
            self.present(alert, animated: true, completion: nil)
            
            
     
            
        }
        
    }
}

extension CreateViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
            textField.resignFirstResponder()
            return true
        }
}
