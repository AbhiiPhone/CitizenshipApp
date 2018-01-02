//
//  ExamResultCell.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 29/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class ExamResultCell: UITableViewCell {

    @IBOutlet weak var questionLbl: UILabel!
    
    
    @IBOutlet weak var optionlbl1: UILabel!
    
    @IBOutlet weak var optionlbl2: UILabel!
    
    @IBOutlet weak var optionlbl3: UILabel!
    
    @IBOutlet weak var optionlbl4: UILabel!
   
    @IBOutlet weak var option1Img: UIImageView!
    
    
    @IBOutlet weak var option2Img: UIImageView!
    
    @IBOutlet weak var option3Img: UIImageView!
    @IBOutlet weak var option4Img: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
