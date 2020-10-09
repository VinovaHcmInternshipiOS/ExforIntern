//
//  ViewController.swift
//  Collapse
//
//  Created by nguyen gia huy on 08/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var dataTable = DataCell.share
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        setupfileXIB()
        
        // Do any additional setup after loading the view.
    }
    private func setupTableview(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc func actionButton(sender:UIButton)
    {
        print(sender.tag)
        let cell = tableView.cellForRow(at: IndexPath.init(row: sender.tag, section: 0)) as! StackTableViewCell
        if(dataTable.data[sender.tag].stateCell == false)
        {
            cell.btAction.setTitle("Thu nhỏ", for: .normal)
            UIView.animate(withDuration: 0.1) {
                cell.lbContent.isHidden = true
                 self.dataTable.data[sender.tag].stateCell = true
                if(self.dataTable.data[sender.tag].stateCell == false)
                {
                    cell.btAction.setTitle("Thu nhỏ", for: .normal)
                }
                else
                {
                    cell.btAction.setTitle("Mở rộng", for: .normal)
                }
                
            }
        }
        else
        {
            cell.btAction.setTitle("Xem thêm", for: .normal)
            UIView.animate(withDuration: 0.1) {
                cell.lbContent.isHidden = false
                self.dataTable.data[sender.tag].stateCell = false
                if(self.dataTable.data[sender.tag].stateCell == false)
                {
                    cell.btAction.setTitle("Thu nhỏ", for: .normal)
                }
                else
                {
                    cell.btAction.setTitle("Mở rộng", for: .normal)
                }
                
            }
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.deselectRow(at: IndexPath.init(row: sender.tag, section: 0), animated: true)
    }
    private func setupfileXIB(){
        tableView.register(UINib(nibName: "StackTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }



}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StackTableViewCell
        else
        {
            return UITableViewCell()
        }
        cell.newImage.image = UIImage(named: "\(dataTable.data[indexPath.row].imgView)")
        cell.lbTitle.text = dataTable.data[indexPath.row].title
        cell.lbContent.text = dataTable.data[indexPath.row].content
        cell.lbContent.isHidden = dataTable.data[indexPath.row].stateCell
        cell.btAction.tag = indexPath.row
        cell.btAction.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        if(dataTable.data[indexPath.row].stateCell == false)
        {
            cell.btAction.setTitle("Thu nhỏ", for: .normal)
            cell.lbContent.isHidden = false
        }
        else
        {
            cell.btAction.setTitle("Xem thêm", for: .normal)
            cell.lbContent.isHidden = true
        }
        
        return cell
    }

}

