//
//  StackTableViewCell.swift
//  Collapse
//
//  Created by nguyen gia huy on 08/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class StackTableViewCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    

    @IBOutlet weak var btAction: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
