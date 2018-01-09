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
    var getChaptervalue = String()
    var chapterId = Int()
    var scoreValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ansView.layer.borderWidth = 1;
        self.ansView.layer.cornerRadius = 8
        self.ansView.layer.borderColor = UIColor.darkGray.cgColor
        
        
       
        self.navigationItem.setHidesBackButton(true, animated:true)
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
            examTblview.layer.borderWidth = 2;
           // self.examTblview.layer.cornerRadius = 15
            self.examTblview.layer.borderColor = UIColor.darkGray.cgColor
            
            
            let image = UIImage(named: "Back.png")
            let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(45), height: CGFloat(35))
            let button = UIButton(frame: buttonFrame)
            button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
            button.setImage(image, for: .normal)
            let item = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = item
        }
        else
        {
            examTblview.layer.borderWidth = 1;
           // self.examTblview.layer.cornerRadius = 8
            self.examTblview.layer.borderColor = UIColor.darkGray.cgColor
            
            let image = UIImage(named: "Back.png")
            let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(15), height: CGFloat(15))
            let button = UIButton(frame: buttonFrame)
            button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
            button.setImage(image, for: .normal)
            let item = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = item
        }
       
        jsonFetch.jsonData = self
        print(getSelectedOptionValue)
        featchData()
    }
    
    @objc func backAction()
    {
          self.popCurrentViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
        
    }
    func featchData()
    {
        
        if (getResultType == "ChapterQuestion")
        {
            parameters = ["actiontype" : "chapter_ques",]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "chapter_ques")
        }
        else if(getResultType == "SimulationQuestion")
        {
            parameters = ["actiontype" : "simulation_ques",]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "simulation_ques")
            
        }
            else if (getResultType == "TakeTestChapter")
        {
            parameters = ["actiontype" :  "take_test",
                          "chapter_id"  : String(chapterId + 1)
            ]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "take_test")
            MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        }
        else{
            parameters = ["actiontype" :  "chapter_exam",
                          "chapter_id" : String(getChaptervalue)
            ]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "chapter_exam")
            
            
            MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        }
        
    }
    
    
}
extension ExamResultController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
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
        
        print(correctOption)
        print((((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "correct_answer") as! String)))
        
        
        
        if ((((dataQuestionSet.object(at: indexPath.row) as! NSDictionary).object(forKey: "correct_answer") as! String))) == String(correctOption)
        {
            
            if(correctOption == 1)
            {
                cell.option1Img.image =  UIImage.init(named: "green_tick-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
                
                scoreValue = scoreValue + 1
                
            }
            else if(correctOption == 2)
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "green_tick-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
                
                scoreValue = scoreValue + 1
            }
                
            else if(correctOption == 3)
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "green_tick-min.png")
                cell.option4Img.image = UIImage.init(named: "red-min.png")
                scoreValue = scoreValue + 1
            }
            else
                
            {
                cell.option1Img.image =  UIImage.init(named: "red-min.png")
                cell.option2Img.image = UIImage.init(named: "red-min.png")
                cell.option3Img.image = UIImage.init(named: "red-min.png")
                cell.option4Img.image = UIImage.init(named: "green_tick-min.png")
                scoreValue = scoreValue + 1
            }
            
           
            
        }
            
        else
        {
            print(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String))
            
            if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(1))
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
            else if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(2))
                
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
                
            else if(((dataQuestionSet.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(3))
                
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
                    cell.option4Img.image = UIImage.init(named: "red-min.png")
                    
                }
                else
                {
                    cell.option1Img.image =  UIImage.init(named: "red-min.png")
                    cell.option2Img.image = UIImage.init(named: "red-min.png")
                    cell.option4Img.image = UIImage.init(named: "red_cross-min.png")
                }
                
                
                
                
               // print(getSelectedOptionValue[indexPath.row])
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
                
               // print(getSelectedOptionValue[indexPath.row])
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
            
            return 350
          
        }
        else
        {
            return 255
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
                   
                    DispatchQueue.main.async {
                        
                        MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                    }
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
            else if(jsonName == "simulation_ques")
            {
                print(data)
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                   // print(((dataQuestionSet ).value(forKey: "correct_answer")))
                    examTblview.delegate=self
                    examTblview.dataSource=self
                }
                
            }
            
            else if(jsonName == "chapter_exam")
            {
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                    // print(((dataQuestionSet ).value(forKey: "correct_answer")))
                    
                print(dataQuestionSet.count)
                    examTblview.delegate=self
                    examTblview.dataSource=self
                }
            }
            
            
            else
            {
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                    // print(((dataQuestionSet ).value(forKey: "correct_answer")))
                    
                    print(dataQuestionSet.count)
                    examTblview.delegate=self
                    examTblview.dataSource=self
                }
            }
            
            fstAnslbl.text = "You have attempt " + " " + String(dataQuestionSet.count) + " " +  "question"
            secondAnslbl.text = "your score is " + " " + String(getScoreValue * 100/dataQuestionSet.count) + "%" + " " +  String(getScoreValue) + "out of " + " " + String(dataQuestionSet.count)
            
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
