//
//  TakeTestController.swift
//  
//
//  Created by Amit Kumar Poreli on 29/12/17.
//

import UIKit

class TakeTestController: UIViewController {

    @IBOutlet weak var secLbl: UILabel!
    
    @IBOutlet weak var minLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var takeQuestionTblview: UITableView!
    
    var sec = 60
    var min = 29
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        
    }
    @objc func update()
    {
        
        if(min == 0)
        {
            showAlert(title: "Wait", message: "Your time is over", noOfButton: 1)
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            if(sec == 0)
            {
                sec = 60
                min = min - 1
                secLbl.text = String(sec)
                minLbl.text = String(min)
                
            }
            else
            {
                sec = sec - 1
                secLbl.text = String(sec)
                minLbl.text = String(min)
                
            }
        }
        
   
    }
   
}
extension TakeTestController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = takeQuestionTblview.dequeueReusableCell( withIdentifier: "TakeTestCell", for: indexPath) as! TakeTestCell
        
        
        self.takeQuestionTblview.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
        }
        
//        if (indexPath.row == 3)
//        {
//            cell.dividerView.isHidden = true
//        }
//        else
//        {
//            cell.dividerView.isHidden = false
//        }
//
//        if(getIndexValue == indexPath.row)
//        {
//            cell.radioImg.image = UIImage(named:"radio_on.png")
//        }
//        else
//        {
//            cell.radioImg.image = UIImage(named:"radio_off.png")
//        }
//
//        cell.questionlbl.text = String(incrementedNubmer)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        takeQuestionTblview.reloadData()
    }
}
