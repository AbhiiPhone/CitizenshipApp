//
//  ChapterExamTableViewCell.swift
//  Citizenship
//
//  Created by MAC MINI3 on 21/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class ChapterExamTableViewCell: UITableViewCell {

    @IBOutlet weak var dividerView: UIView!
    
    @IBOutlet var chapterLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
