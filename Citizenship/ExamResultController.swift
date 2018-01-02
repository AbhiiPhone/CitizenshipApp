//
//  ExamResultController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 29/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ExamResultController: UIViewController {
    
    @IBOutlet weak var examTblview: UITableView!
    @IBOutlet weak var ansView: UIView!
    @IBOutlet weak var fstAnslbl: UILabel!
    @IBOutlet weak var secondAnslbl: UILabel!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    var dataQuestionSet = NSArray()
    var getResultType = " "
    var getSelectedOptionValue = NSMutableArray()
    var correctOption = Int()
    var getScoreValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ansView.layer.borderWidth = 1;
        self.ansView.layer.cornerRadius = 8
        self.ansView.layer.borderColor = UIColor.darkGray.cgColor
        
        fstAnslbl.text = "You have attempt 20 question"
        secondAnslbl.text = "your score is" + " " + String(getScoreValue * 5) + "%" + " " +  String(getScoreValue) + "out of 20"
        jsonFetch.jsonData = self
        
        //self.fstAnslbl.text = String(getScoreValue)
        //self.secondAnslbl.text = String(getScoreValue/20)
        print(getSelectedOptionValue)
        
        featchData()
    }
    func featchData()
    {
        
        if (getResultType == "ChapterQuestion")
        {
            parameters = ["actiontype" : "chapter_ques",]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "chapter_ques")
        }
        else
        {
            parameters = ["actiontype" : "simulation_ques",]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "simulation_ques")
            
        }
        
    }
    
    
}
extension ExamResultController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        //        if ((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "option") as? NSArray) ==  nil {
        //
        //            print("novalue")
        //            return 0
        //        }
        //        else{
        //
        //            print(((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray))
        //            return ((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray).count
        //        }
        
        return dataQuestionSet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = examTblview.dequeueReusableCell( withIdentifier: "ExamResultCell", for: indexPath) as! ExamResultCell
        
        cell.optionlbl1.text = (((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: 0) as! String).uppercased()
        cell.optionlbl2.text = (((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: 1) as! String).uppercased()
        cell.optionlbl3.text = (((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: 2) as! String).uppercased()
        cell.optionlbl4.text = (((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: 0) as! String).uppercased()
        cell.questionLbl.text = (((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "question") as! String).uppercased())
        
        
        correctOption  = getSelectedOptionValue[indexPath.row] as! Int
        correctOption = correctOption + 1
        if ((((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "correct_answer") as! String))) == String(correctOption)
        {
            
            
            
            if(correctOption == 1)
            {
                cell.option1Img.image =  UIImage.init(named: "green_tick-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
                
            }
            else if(correctOption == 2)
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "green_tick-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
            }
                
            else if(correctOption == 3)
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "green_tick-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
            }
            else
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "green_tick-min.png")
            }
        }
            
        else
        {
            if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(0))
            {
                cell.option1Img.image =  UIImage.init(named: "green-min.png")
                
                if(String(describing: getSelectedOptionValue[indexPath.row]) == String(1))
                {
                    cell.option2Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                }
                else if(String(describing: getSelectedOptionValue[indexPath.row]) == String(2))
                {
                    cell.option2Img.image =  UIImage.init(named: "red-min.png")
                    cell.option3Img.image = UIImage.init(named: "red_cross-min.png")
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                }
                else
                {
                    cell.option2Img.image =  UIImage.init(named: "red-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red_cross-min.png")
                }
                print(getSelectedOptionValue[indexPath.row])
            }
            else if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(1))
                
            {
                
                cell.option2Img.image = UIImage.init(named: "green-min.png")
                
                
                if(String(describing: getSelectedOptionValue[indexPath.row]) == String(0))
                {
                    cell.option1Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                }
                else if(String(describing: getSelectedOptionValue[indexPath.row]) == String(2))
                {
                    cell.option1Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                }
                else
                {
                    cell.option1Img.image =  UIImage.init(named: "red-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red_cross-min.png")
                }
                print(getSelectedOptionValue[indexPath.row])
            }
                
            else if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(2))
                
            {
                
                cell.option3Img.image = UIImage.init(named: "green-min.png")
                
                
                if(String(describing: getSelectedOptionValue[indexPath.row]) == String(0))
                {
                    cell.option1Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option2Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                }
                else if(String(describing: getSelectedOptionValue[indexPath.row]) == String(1))
                {
                    cell.option1Img.image = UIImage.init(named: "red-min.png")
                    cell.option2Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    
                }
                else
                {
                    cell.option1Img.image =  UIImage.init(named: "red-min.png")
                    cell.option2Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red_cross-min.png")
                }
                
                
                
                
                print(getSelectedOptionValue[indexPath.row])
            }
            else
                
            {
                
                cell.option4Img.image = UIImage.init(named: "green-min.png")
                
                if(String(describing: getSelectedOptionValue[indexPath.row]) == String(0))
                {
                    cell.option1Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option2Img.image = UIImage.init(named: "red-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                }
                else if(String(describing: getSelectedOptionValue[indexPath.row]) == String(1))
                {
                    cell.option1Img.image = UIImage.init(named: "red-min.png")
                    cell.option2Img.image =  UIImage.init(named: "red_cross-min.png")
                    cell.option3Img.image = UIImage.init(named: "red-min.png")
                    
                }
                else
                {
                    cell.option1Img.image =  UIImage.init(named: "red-min.png")
                    cell.option2Img.image = UIImage.init(named: "red-min.png")
                    cell.option3Img.image = UIImage.init(named: "red_cross-min.png")
                }
                
                print(getSelectedOptionValue[indexPath.row])
            }
        }
        
        self.examTblview.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 430
        }
            //        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            //        }
            //
            //        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            //
            //        }
            //        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            //
            //        }
            
        else
            
        {
            return 210
        }
    }
    
}
extension ExamResultController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
        }
        else{
            
            if(jsonName == "chapter_ques")
            {
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                    
                    //  print("dataQuestionSet.count:\(dataQuestionSet.count)")
                    print(((dataQuestionSet ).value(forKey: "correct_answer")))
                    //  print(dataQuestionSet)
                    //  print(((dataQuestionSet ).value(forKey: "option")))
                    //  print((((dataQuestionSet.object(at: 1) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: 0) as! String).uppercased())
                    
                    examTblview.delegate=self
                    examTblview.dataSource=self
                }
            }
            else
            {
                print(data)
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                   // print(((dataQuestionSet ).value(forKey: "correct_answer")))
                    examTblview.delegate=self
                    examTblview.dataSource=self
                }
                
            }
            
            examTblview.reloadData()
        }
    }
    
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
        showAlert(title: "Error", message: "Something  going wrong !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
