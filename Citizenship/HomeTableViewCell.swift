//
//  HomeTableViewCell.swift
//  Citizenship
//
//  Created by Basir Alam on 11/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet var topLbl: UILabel!
    @IBOutlet var bottomLbl: UILabel!
    @IBOutlet var homeImg: UIImageView!
    @IBOutlet var arrowImg: UIImageView!
    
    
    @IBOutlet var topLblLeading: NSLayoutConstraint!
    @IBOutlet var topLblTop: NSLayoutConstraint!
    @IBOutlet var topLblTrailing: NSLayoutConstraint!
    @IBOutlet var topLblHeight: NSLayoutConstraint!
    
    @IBOutlet var imgLeading: NSLayoutConstraint!
    @IBOutlet var imgTrailing: NSLayoutConstraint!
    @IBOutlet var imgTop: NSLayoutConstraint!
    @IBOutlet var imgHeight: NSLayoutConstraint!
    @IBOutlet var bottomLblLeading: NSLayoutConstraint!
    @IBOutlet var bottomLblTop: NSLayoutConstraint!
    @IBOutlet var bottomLblHeight: NSLayoutConstraint!
    @IBOutlet var bottomLblWidth: NSLayoutConstraint!
    
    @IBOutlet var arrowWidth: NSLayoutConstraint!
    @IBOutlet var arrowHeight: NSLayoutConstraint!
    @IBOutlet var arrowTop: NSLayoutConstraint!
    @IBOutlet var arrowTrailing: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
