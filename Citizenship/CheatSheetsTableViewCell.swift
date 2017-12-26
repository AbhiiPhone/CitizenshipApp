//
//  CheatSheetsTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 18/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class CheatSheetsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var chapterLbl: UILabel!
    @IBOutlet var desLbl: UILabel!
    
    @IBOutlet var cheatSheetLbl: UILabel!
    
    @IBOutlet var pdfBtn: UIButton!
    
    
    @IBOutlet var chpTop: NSLayoutConstraint!
    @IBOutlet var chpHeight: NSLayoutConstraint!
    @IBOutlet var chpWidth: NSLayoutConstraint!
    @IBOutlet var chpLeading: NSLayoutConstraint!
    

    
    @IBOutlet var btnHeight: NSLayoutConstraint!
    @IBOutlet var btnWidth: NSLayoutConstraint!
    @IBOutlet var btnTrailing: NSLayoutConstraint!
    @IBOutlet var btnTop: NSLayoutConstraint!
 
    @IBOutlet var cheatTrailing: NSLayoutConstraint!
    @IBOutlet var cheatTop: NSLayoutConstraint!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
