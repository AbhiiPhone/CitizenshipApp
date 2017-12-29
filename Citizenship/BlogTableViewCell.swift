//
//  BlogTableViewCell.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 20/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var aboutTitle: UITextView!
    
    @IBOutlet weak var readingBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
