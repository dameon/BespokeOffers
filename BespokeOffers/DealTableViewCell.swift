//
//  DealTableViewCell.swift
//  BespokeOffers
//
//  Created by Dameon Bryant on 6/21/15.
//  Copyright © 2015 Dameon Bryant. All rights reserved.
//

import UIKit

class DealTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var dealLabel: UILabel!
    @IBOutlet weak var dealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
