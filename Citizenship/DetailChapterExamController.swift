//
//  DetailChapterExamController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 28/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class DetailChapterExamController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var questionTblview: UITableView!
    var getIndexValue = Int()
    var incrementedNubmer = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTblview.layer.borderWidth = 1;
       // chapterTableVw.layer.shadowRadius = 12.0
       // chapterTableVw.layer.cornerRadius = 5
        questionTblview.layer.borderColor = UIColor.darkGray.cgColor
        
        getIndexValue = 4
        
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        
        incrementedNubmer = incrementedNubmer + 1
        questionTblview.reloadData()
        
    }
    
}
extension DetailChapterExamController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = questionTblview.dequeueReusableCell( withIdentifier: "DetailChapterExamCell", for: indexPath) as! DetailChapterExamCell
        
        
        self.questionTblview.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
        }
        
        if (indexPath.row == 3)
        {
            cell.dividerView.isHidden = true
        }
        else
        {
            cell.dividerView.isHidden = false
        }
        
        if(getIndexValue == indexPath.row)
        {
            cell.radioImg.image = UIImage(named:"radio_on.png")
        }
        else
        {
            cell.radioImg.image = UIImage(named:"radio_off.png")
        }
        
        cell.questionlbl.text = String(incrementedNubmer)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        getIndexValue = indexPath.row
        questionTblview.reloadData()
    }
}
