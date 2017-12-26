//
//  StudyMaterialTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 18/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class StudyMaterialTableViewCell: UITableViewCell {
    
    
    @IBOutlet var newAudioVw: UIWebView!
    
    @IBOutlet var chpLbl: UILabel!
    @IBOutlet var pdfBtn: UIButton!
    @IBOutlet var audioBtn: UIButton!
    
    
    @IBOutlet var lblHeight: NSLayoutConstraint!
    @IBOutlet var lblWidth: NSLayoutConstraint!
    
    @IBOutlet var pdfHeight: NSLayoutConstraint!
    @IBOutlet var pdfWidth: NSLayoutConstraint!
    
    @IBOutlet var audioHeight: NSLayoutConstraint!
    @IBOutlet var audioWidth: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
