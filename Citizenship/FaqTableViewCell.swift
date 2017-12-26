//
//  FaqTableViewCell.swift
//  Citizenship
//
//  Created by Basir Alam on 12/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class FaqTableViewCell: UITableViewCell {
    
    @IBOutlet var qusWidth: NSLayoutConstraint!
    @IBOutlet var qusHeight: NSLayoutConstraint!
    
    @IBOutlet var QLblTop: NSLayoutConstraint!
    @IBOutlet var qusLblTop: NSLayoutConstraint!
    @IBOutlet var qusLbl: UILabel!
    @IBOutlet var ansLbl: UILabel!
    
    @IBOutlet var QLbl: UILabel!
    @IBOutlet var sepLbl: UILabel!
    
    @IBOutlet weak var ansBackgroundImg: UIImageView!
    
    @IBOutlet weak var arrowHcons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
