//
//  ViewController.swift
//  TableView
//
//  Created by nguyen gia huy on 07/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupfileXIB()
        setupTableView()
        hideKeyboard()
        // Do any additional setup after loading the view.
    }
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    private func setupfileXIB(){
        tableView.register(UINib(nibName: "DownloadTableViewCell", bundle: nil), forCellReuseIdentifier: "DownloadTableViewCell")
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersTableViewCell")
        tableView.register(UINib(nibName: "SignInTableViewCell", bundle: nil), forCellReuseIdentifier: "SignInTableViewCell")
        tableView.register(UINib(nibName: "UseCellularDataTableViewCell", bundle: nil), forCellReuseIdentifier: "UseCellularDataTableViewCell")
    }
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    @objc func buttonTouched(sender:UIButton!){
        print("1")
    }
    
    
    
}
extension ViewController:UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return 2
        }
        else
        {
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 45
        switch indexPath.section {
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
            switch indexPath.row {
            case 0:
                cell1.lbTitle.text  = "Apple ID "
                
                cell1.txtInput.placeholder = "example@icloud.com"
                return cell1
            case 1:
                cell1.lbTitle.text  = "Password "
                cell1.txtInput.isSecureTextEntry = true
                cell1.txtInput.placeholder = "required"
                return cell1
            default:
                break
            }
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "SignInTableViewCell", for: indexPath) as! SignInTableViewCell
            cell2.btSignin.setTitle("Sign In", for: .normal)
            return cell2
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "SignInTableViewCell", for: indexPath) as! SignInTableViewCell
            cell3.btSignin.setTitle("Create New Apple ID", for: .normal)
            return cell3
        case 3:
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "DownloadTableViewCell", for: indexPath) as! DownloadTableViewCell
            cell4.label.text = "Updates"
            cell4.imageView?.image = UIImage(named: "appstore.jpg")
            return cell4
        case 4:
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "UseCellularDataTableViewCell", for: indexPath) as! UseCellularDataTableViewCell
            cell5.labelCellular.text = "Use Cellular Data"
            return cell5
        default:
            break
        }
        
        //cell.
        
        return UITableViewCell()
    }
    
    
}
extension ViewController: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header :UITableViewHeaderFooterView = UITableViewHeaderFooterView()
        header.contentView.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
        if(section == 3 )
        {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:20, y:15, width:tableView.frame.size.width, height:18))
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "AUTOMATIC DOWNLOADS"
            label.textColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 91/255.0, alpha: 1)
            view.addSubview(label);
            view.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
            return view
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if ( indexPath.section == 0 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 2 || indexPath.section == 1)
        {
            return nil
        }
        
        return indexPath
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer :UITableViewHeaderFooterView = UITableViewHeaderFooterView()
        footer.contentView.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
        if(section == 1 )
        {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:30))
            let button = UIButton(frame: CGRect(x:0, y:5, width:tableView.frame.size.width, height:30))
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.setTitle("Forgot Apple ID or Password?", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(self, action: #selector(buttonTouched(sender:)), for: UIControl.Event.touchUpInside)
            view.addSubview(button);
            view.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
            
            return view
        }
        else if(section == 2 )
        {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:20, y:5, width:tableView.frame.size.width - 20, height:40))
            label.font = UIFont.systemFont(ofSize: 13)
            label.text = "An Apple ID is the login you use for just about everything you do with Apple."
            label.textColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 91/255.0, alpha: 1)
            label.numberOfLines = 2
            view.addSubview(label);
            view.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
            return view
        }
        else if(section == 4)
        {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
            let label = UILabel(frame: CGRect(x:20, y:5, width:tableView.frame.size.width - 20, height:40))
            label.font = UIFont.systemFont(ofSize: 13)
            label.text = "Use cellular network for automatic downloads and iTunes Match."
            label.textColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 91/255.0, alpha: 1)
            label.numberOfLines = 2
            view.addSubview(label);
            view.backgroundColor = UIColor(red: 238/255.0, green: 239/255.0, blue: 243/255.0, alpha: 1)
            return view
        }
        
        return footer
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return ""
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 30
        case 2,4:
            return 50
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0,1,2,3,4:
            return 40.0
        default:
            break
        }
        return 50.0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !tableView.isDecelerating {
            view.endEditing(true)
        }
    }
    
}
