//
//  ListUserViewController.swift
//  ExampleDelegate
//
//  Created by nguyen gia huy on 13/10/2020.
//

import UIKit

class ListUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataTableView = DataUser.share
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupXIB()
        setupNav(titleNav: "LIST")
        // Do any additional setup after loading the view.
    }
    
    func setupNav(titleNav: String){
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = titleNav
        navigationController?.navigationBar.barTintColor = .orange //Background
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //Text Color
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        let createBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(action(sender:)))
        createBtn.tintColor = .white
        navigationItem.rightBarButtonItem = createBtn
    }
    @objc func action(sender: UIBarButtonItem) {
        let createView = CreateViewController(nibName: "CreateViewController", bundle: nil)
        createView.delegate = self
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupXIB(){
        tableView.register(UINib(nibName: "ListUserTableViewCell", bundle: nil), forCellReuseIdentifier: "ListUserTableViewCell")
    }
}

extension ListUserViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTableView.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListUserTableViewCell", for: indexPath) as? ListUserTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(userName: dataTableView.data[indexPath.row].userName, userClass: dataTableView.data[indexPath.row].userClass)
        return cell
    }
    
    
}

extension ListUserViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension ListUserViewController: CreateViewControllerProtocol {
    func didCreateSuccess(sender: Users) {
        dataTableView.data.append(sender)
        print(dataTableView.data)
        tableView.reloadData()
    }
    
}
