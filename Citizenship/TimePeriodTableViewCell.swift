//
//  TimePeriodTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 19/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class TimePeriodTableViewCell: UITableViewCell {
    
    
    @IBOutlet var yrWidth: NSLayoutConstraint!
    @IBOutlet var yrHeight: NSLayoutConstraint!
    @IBOutlet var yrTop: NSLayoutConstraint!
    @IBOutlet var yrLeading: NSLayoutConstraint!
    
    
    @IBOutlet var desTrailing: NSLayoutConstraint!
    @IBOutlet var desHeight: NSLayoutConstraint!
    @IBOutlet var desTop: NSLayoutConstraint!
    @IBOutlet var desWidth: NSLayoutConstraint!
    
    @IBOutlet var yrLbl: UILabel!
    @IBOutlet var despLbl: UILabel!
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
