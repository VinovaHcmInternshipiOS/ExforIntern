//
//  ListCreditTableViewCell.swift
//  CoreDataExample
//
//  Created by nguyen gia huy on 21/10/2020.
//

import UIKit

class ListCreditTableViewCell: UITableViewCell {

    @IBOutlet weak var lbCreditCard: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupData(credits: Credits){
    
        lbCreditCard.text = credits.number
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
