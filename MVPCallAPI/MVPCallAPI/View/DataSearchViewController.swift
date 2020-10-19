//
//  DataSearchViewController.swift
//  MVPCallAPI
//
//  Created by nguyen gia huy on 14/10/2020.
//

import UIKit

class DataSearchViewController: UIViewController {
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btSearch: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    private var loadding = UIActivityIndicatorView()
    private var buttonLoadmore: UIButton!
    private var lbNoMore: UILabel!
    private var pullControl = UIRefreshControl()
    private var dataMovie = [Movies]()
    private let cellId = "MovieTableViewCell"
    private var presenter: DataSearchPresenterProtocol
    
    init() {
        presenter = DataSearchPresenter()
        super.init(nibName: "DataSearchViewController", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupXIB()
        setupTableView()
      //  presenter.callAPIAllData()
      
        
    }
    private func setupXIB(){
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.prefetchDataSource = self
        pullRefreshData()
        hideKeyboard()
    }
    private func setupView(){
        btSearch.layer.cornerRadius = 10
        
        loadding = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.width / 10))
        loadding.color = UIColor.gray
        
        lbNoMore = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.width / 10))
        lbNoMore.text = "no more"
        lbNoMore.textColor = .gray
        lbNoMore.textAlignment = .center
        
        
    }
    
    func hideKeyboard() {
        tableView.keyboardDismissMode = .onDrag
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(DataSearchViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @objc func pulledRefreshControl(sender:AnyObject) {
        pullControl.endRefreshing()
        presenter.callAPISearch(searchText: txtSearch.text!)
        loadding.stopAnimating()
    }
    
    private func pullRefreshData() {
        pullControl.attributedTitle = NSAttributedString(string: "Pull To Refresh")
        pullControl.addTarget(self, action: #selector(pulledRefreshControl), for: UIControl.Event.valueChanged)
        tableView.addSubview(pullControl)
    }
    
    @IBAction func btSearch(_ sender: Any) {
        tableView.isHidden = false
        presenter.callAPISearch(searchText: presenter.removeSpecialCharsFromString(text: txtSearch.text!))
        presenter.resetPageLoadMore()
    }
    
    @objc func updateTableView(){
        presenter.callAPILoadmore(searchText: presenter.removeSpecialCharsFromString(text: txtSearch.text!), page: presenter.getCurrentPage())
    }
    
    
}
extension DataSearchViewController: UITableViewDelegate{
    

}

extension DataSearchViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else { return UITableViewCell()}
        cell.model = dataMovie[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataMovie.count - 1 {
            if presenter.getCurrentPage() < presenter.getTotalPage(){
                tableView.tableFooterView = loadding
                loadding.startAnimating()
                self.perform(#selector(updateTableView), with:  nil, afterDelay: 1.0)
            }
            else
            {
                tableView.tableFooterView = lbNoMore
                loadding.stopAnimating()
            }
            
        }
    }
    
    
    
    
}
extension DataSearchViewController: DataSearchViewControllerProtocol {
    func callNotResult() {
        lbResult.isHidden = false
        tableView.isHidden = true
        self.tableView.reloadData()
    }
    
    func refreshDataAPI() {
            self.dataMovie = []
            self.tableView.reloadData()
        
    }
    func callAPISuccess(movie: [Movies]) {
        self.dataMovie = movie
        lbResult.isHidden = true
        self.tableView.reloadData()
    }
    
    func callAPIFailed(msg: String) {
        print("Failed")
    }
    
    
    
}

//extension DataSearchViewController: UITableViewDataSourcePrefetching{
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        print("Fetching : \(indexPaths)")
//       // self.perform(#selector(updateTableView), with:  nil, afterDelay: 1.0)
//    }
//    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
//        print("Fetching Cancel : \(indexPaths)")
//    }
//
//
//}
