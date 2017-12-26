//
//  QuestionTableViewCell.swift
//  Citizenship
//
//  Created by Basir Alam on 12/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet var ansLbl: UILabel!
    @IBOutlet var imgVRightOrWrong: UIImageView!
    @IBOutlet var qusBtn: UIButton!
    
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
