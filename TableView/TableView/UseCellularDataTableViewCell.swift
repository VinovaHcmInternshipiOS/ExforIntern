//
//  UseCellularDataTableViewCell.swift
//  TableView
//
//  Created by nguyen gia huy on 07/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class UseCellularDataTableViewCell: UITableViewCell {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var labelCellular: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
