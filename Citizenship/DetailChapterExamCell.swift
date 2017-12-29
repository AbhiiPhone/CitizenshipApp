//
//  DetailChapterExamCell.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 28/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class DetailChapterExamCell: UITableViewCell {

    @IBOutlet weak var radioImg: UIImageView!
    @IBOutlet weak var questionlbl: UILabel!
   
    
    @IBOutlet weak var dividerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
