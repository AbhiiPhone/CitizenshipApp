//
//  CityTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 09/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    
    @IBOutlet var queNewLbl: UILabel!
    @IBOutlet var imgNewLbl: UIImageView!
    @IBOutlet var headingLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
