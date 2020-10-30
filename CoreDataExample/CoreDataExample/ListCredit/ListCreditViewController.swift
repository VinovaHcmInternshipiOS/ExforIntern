//
//  ListCreditViewController.swift
//  CoreDataExample
//
//  Created nguyen gia huy on 21/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Edward
//

import UIKit

class ListCreditViewController: UIViewController, ListCreditViewProtocol {
    
    @IBOutlet weak var stateTable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var presenter: ListCreditPresenterProtocol
    private var pullControl = UIRefreshControl()
    var dataTable = [Credits]()
    var keyDetail = Users()
    var sortListUsers: (()->Void)? = nil
    init(presenter: ListCreditPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "ListCreditViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewListCredit = self
        setupXIB()
        setupNav(titleNav: "List Credits")
        pullRefreshData()
        fetchData()
        customBackbutton()
        
    }
    @objc func back(sender: UIBarButtonItem) {
        sortListUsers!()
        _ = navigationController?.popViewController(animated: true)
    }
    func customBackbutton() {
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),style: UIBarButtonItem.Style.plain, target: self, action: #selector(CreateUserViewController.back(sender:)))
                self.navigationItem.leftBarButtonItem = backButton
    }
    
    func fetchData(){
        dataTable = presenter.fetchCredit(keyCredit: keyDetail)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func pulledRefreshControl(sender:AnyObject) {
        pullControl.endRefreshing()
        fetchData()
    }
    
    private func pullRefreshData() {
        pullControl.attributedTitle = NSAttributedString(string: "Pull To Refresh")
        pullControl.addTarget(self, action: #selector(pulledRefreshControl), for: UIControl.Event.valueChanged)
        tableView.addSubview(pullControl)
    }
    func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        print("Core Data DB Path :: \(path ?? "Not found")")
    }
    
    private func setupXIB(){
        tableView.register(UINib(nibName: "ListCreditTableViewCell", bundle: nil), forCellReuseIdentifier: "ListCreditTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    func setupNav(titleNav: String){
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = titleNav
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .orange //Background
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //Text Color
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        let createBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(action(sender:)))
        createBtn.tintColor = .black
        navigationItem.rightBarButtonItem = createBtn
        
    }
    @objc func action(sender: UIBarButtonItem) {
        let createView = CreateCreditViewController(presenter: CreateCreditPresenter())
        createView.keyDetail = keyDetail
        createView.presenter.viewCreateCredit = self // Auth Delegate
        self.navigationController?.pushViewController(createView, animated: true)
    }
    
}

extension ListCreditViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
}
extension ListCreditViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataTable.count != 0 {
            stateTable.isHidden = true
        }
        else {
            stateTable.isHidden = false
        }
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCreditTableViewCell", for: indexPath) as? ListCreditTableViewCell else {return UITableViewCell()}
        cell.setupData(credits: dataTable[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: { [self](action,view,completionHandler) in
            
            let alert = UIAlertController(title: "Confirm", message: "Do you really want to delete ?",preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
                tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "OK",style: UIAlertAction.Style.destructive,handler: {(_: UIAlertAction!) in
                presenter.deleteCredit(position: indexPath.row, dataTable: dataTable)
                fetchData()
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        })
        
        
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: { [self](action,view,completionHandler) in
            
            let credit = dataTable[indexPath.row]
            let alertUpdate = UIAlertController(title: "Edit Credit", message: nil , preferredStyle: .alert)
            alertUpdate.addTextField()
            let creditNumber = alertUpdate.textFields![0]
            creditNumber.clearButtonMode = .always
            creditNumber.text = credit.number
            let saveButton = UIAlertAction(title: "Save", style: .default, handler: { _ in ()
                let creditNumber = alertUpdate.textFields![0]
                if creditNumber.text == credit.number {
                    alertSystem(title: "Warning", content: "Nothing changes")
                }
                else {
                    if presenter.checkDuplication(credit: removeWhitespaces(text: creditNumber.text!)) == true {
                        let alert = UIAlertController(title: "An Error", message: "Credit number already exists ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            present(alertUpdate, animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true, completion: nil)

                    }
                    else {
                        let alert = UIAlertController(title: "Update Credit", message: "Success ", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                            presenter.updateCredit(position: indexPath.row, dataTable: dataTable, creditNumber: creditNumber.text!)
                            fetchData()
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
            })
            let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in ()
                fetchData()
            })
            alertUpdate.addAction(cancelButton)
            alertUpdate.addAction(saveButton)
            present(alertUpdate, animated: true, completion: nil)
            
        })
        edit.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.8171495795, green: 0.1939333081, blue: 0.2262191176, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [delete,edit])
        
    }
    
    
    
    
}

extension ListCreditViewController: CreateCreditViewProtocol {
    func createSuccess(credit: [Credits]) {
        dataTable = credit
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func createError() {
        
    }
    
    
}