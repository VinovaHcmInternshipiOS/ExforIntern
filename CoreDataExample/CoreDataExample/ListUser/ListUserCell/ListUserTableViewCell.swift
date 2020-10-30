//
//  ListUserTableViewCell.swift
//  CoreDataExample
//
//  Created by nguyen gia huy on 19/10/2020.
//

import UIKit

class ListUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupData(user: Users, count: String)
    {
        lbName.text = user.name
        lbCount.text = count
    }
    
}
