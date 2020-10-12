//
//  ViewController.swift
//  Collection&Table
//
//  Created by nguyen gia huy on 09/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataCollection = DataMovie.share
    var arrayPostion = Array(repeating: 0, count: 13)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupfileXIB()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupfileXIB(){
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
    }
    
}
extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataCollection.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header :UITableViewHeaderFooterView = UITableViewHeaderFooterView()
        header.contentView.backgroundColor = UIColor(red: 204/255, green: 33/255, blue: 41/255, alpha: 1)
        if(section == 0 )
        {
            let view = UIView(frame: CGRect(x:0, y:0, width:0, height:0))
            return view
        }
        else
        {
            let label = UILabel()
            let headerView = UIView()
            headerView.layer.cornerRadius = 15
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "MOVIE SELECTION"
            label.textColor = .white
            headerView.backgroundColor = .red
            headerView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            return headerView
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0)
        {
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else {return UITableViewCell()}
            return cell1
        }
        else
        {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
            cell2.setData(arrayPostion[indexPath.section])
            cell2.updatePosition()
            cell2.scrollCell = {
                self.arrayPostion[indexPath.section] = cell2.index
            }
            return cell2
        }
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
