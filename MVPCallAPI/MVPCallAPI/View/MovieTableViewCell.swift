//
//  MovieTableViewCell.swift
//  MVPCallAPI
//
//  Created by nguyen gia huy on 14/10/2020.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var model: Movies? {
        didSet {
            guard let model = self.model else { return }
            lbTitle.text = model.title
            lbID.text = "\(model.id)"
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
