//
//  GovtTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 20/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class GovtTableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblLeading: NSLayoutConstraint!
    @IBOutlet var lblTop: NSLayoutConstraint!
    
    @IBOutlet var queLbl: UILabel!
    @IBOutlet var dropBtn: UIButton!
    
    @IBOutlet var lblHeight: NSLayoutConstraint!
    @IBOutlet var lblWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
