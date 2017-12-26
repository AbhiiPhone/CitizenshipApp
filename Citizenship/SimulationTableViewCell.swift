//
//  SimulationTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 19/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class SimulationTableViewCell: UITableViewCell {
    
    
    @IBOutlet var setNameLbl: UILabel!
    @IBOutlet var partLbl: UILabel!
    @IBOutlet var testBtn: UIButton!
    
    
    @IBOutlet var lblTop: NSLayoutConstraint!
    @IBOutlet var lblHeight: NSLayoutConstraint!
    @IBOutlet var lblWidth: NSLayoutConstraint!
    @IBOutlet var lblLeading: NSLayoutConstraint!
    
    @IBOutlet var takeTestheight: NSLayoutConstraint!
    
    @IBOutlet var takeTestTrailing: NSLayoutConstraint!
    @IBOutlet var takeTestTop: NSLayoutConstraint!
    @IBOutlet var takeTestWidth: NSLayoutConstraint!
    
    @IBOutlet var partHeight: NSLayoutConstraint!
    @IBOutlet var partWidth: NSLayoutConstraint!
    
    @IBOutlet var partLeading: NSLayoutConstraint!
    
   // @IBOutlet var takeTrailing: NSLayoutConstraint!
   // @IBOutlet var takeTestTrailing: NSLayoutConstraint!
   // @IBOutlet var takeTestLeading: NSLayoutConstraint!
    
   // @IBOutlet var partLeading: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
