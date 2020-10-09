//
//  UsersTableViewCell.swift
//  TableView
//
//  Created by nguyen gia huy on 07/10/2020.
//  Copyright © 2020 nguyengiahuy. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    var widthLB:CGFloat = 80
    @IBOutlet weak var widthLabel: NSLayoutConstraint!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupItem()
        // Initialization code
    }
    private func setupItem(){
    widthLabel.constant = widthLB
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
