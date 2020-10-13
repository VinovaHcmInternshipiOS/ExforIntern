//
//  ListUserTableViewCell.swift
//  ExampleDelegate
//
//  Created by nguyen gia huy on 13/10/2020.
//

import UIKit

class ListUserTableViewCell: UITableViewCell {

    @IBOutlet weak var lbClass: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(userName: String, userClass: String) {
        lbName.text = userName
        lbClass.text = userClass
    }
    
}
