//
//  SliderTableViewCell.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 26/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var sliderAdminLbl: UILabel!
    @IBOutlet var sliderAdminImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
