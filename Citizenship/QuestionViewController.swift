//
//  QuestionViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 12/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//


import UIKit
import Alamofire
import MBProgressHUD

class QuestionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var parameters: [String: String] = [:]
    var parameter: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    @IBOutlet var chkBtn: UIButton!
    @IBOutlet var lblQuestionNo: UILabel!
    @IBOutlet var lblTotalQuestions: UILabel!
    
    
    @IBOutlet var questionTableVw: UITableView!
    @IBOutlet var questionLbl: UILabel!
    
    @IBOutlet var lawtop: NSLayoutConstraint!
    @IBOutlet var lawLeading: NSLayoutConstraint!
    @IBOutlet var lawTrailing: NSLayoutConstraint!
    @IBOutlet var lawHeight: NSLayoutConstraint!
    
    @IBOutlet var tableVwTop: NSLayoutConstraint!
    @IBOutlet var tableVwLeading: NSLayoutConstraint!
    @IBOutlet var tableVwTrailing: NSLayoutConstraint!
    @IBOutlet var tableVwHeight: NSLayoutConstraint!
    
    @IBOutlet var checkTop: NSLayoutConstraint!
    @IBOutlet var chkLeading: NSLayoutConstraint!
    @IBOutlet var chkTrailing: NSLayoutConstraint!
    @IBOutlet var chkHeight: NSLayoutConstraint!
    
    var selectedBtnIndex: Int = 2000
    var tagCount: Int = 0
    var isAnsChecked = false
    var getBtnValue = " "
    
    var dataQuestionSet = NSArray()
    var selectedOptionValue = NSMutableArray()
    var getOptionValue = Int()
    var scoreValue = Int()
    
    //  var ansArray: NSArray = ["option1","option2","option3","option4"]
    
    /*
     
     <<<chapter test>> actiontype=chapter_ques
     <<simulation test>> 'actiontype'=>'simulation_ques'
 */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButtonSelector()
        
        featchData()
       
        jsonFetch.jsonData = self
        
       
        
        chkBtn.setTitle("CHECK", for: .normal)
        
        chkBtn.tag = tagCount
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
            questionTableVw.layer.borderWidth = 1.2;
            self.questionTableVw.layer.cornerRadius = 15
            self.questionTableVw.layer.borderColor = UIColor.darkGray.cgColor
        }
        else
        {
            questionTableVw.layer.borderWidth = 1;
            self.questionTableVw.layer.cornerRadius = 8
            self.questionTableVw.layer.borderColor = UIColor.darkGray.cgColor
        }
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
                        
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
        }
    }
    
   func featchData()
   {
    
    if (getBtnValue == "ChapterQuestion")
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
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    @IBAction func checkBtnAction(_ sender: UIButton) {
        
        if let buttonTitle = sender.title(for: .normal) {
            
            print(buttonTitle)
            
            if selectedBtnIndex != 2000{
                
                if buttonTitle == "CHECK"{
                    
                    print(((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "correct_answer") as? String)!)
                    
                    selectedOptionValue.insert(getOptionValue, at: tagCount)
                     print(getOptionValue)
                    if ((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(selectedBtnIndex + 1) {
                        
                        print("working")
                        scoreValue = scoreValue + 1
                        
                        
                    }
                    else{
                        
                        print("not")
                        
                       
//                        let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "ExamResultController") as! ExamResultController
//
//                        blogDetail.getSelectedOptionValue = selectedOptionValue
//                        blogDetail.getResultType  = getBtnValue
//
//                        self.tabBarController?.navigationController?.pushViewController(blogDetail, animated: true)
                    }
                    
                    isAnsChecked = true
                    chkBtn.setTitle("NEXT", for: .normal)
                    
                    questionTableVw.reloadData()
                }
                else{
                    
                    selectedBtnIndex = 2000
                    
                    isAnsChecked = false
                    
                    tagCount += 1
                    
                    if tagCount < dataQuestionSet.count{
                        
                        chkBtn.tag = tagCount
                        
                        lblQuestionNo.text = String(chkBtn.tag + 1)
                        
                        questionLbl.text = (((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "question") as! String).uppercased())
                        
                        print(chkBtn.tag)
                        
                        chkBtn.setTitle("CHECK", for: .normal)
                        
                        questionTableVw.reloadData()
                        
                    }
                    else{
                        
                        print("Tag Count")
                        
                       //  showAlert(title: "Alert!", message: "You process all question", noOfButton: 1)
                      //  self.navigationController?.popViewController(animated: true)
                       
                        // push will be excute here
                        let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "ExamResultController") as! ExamResultController
                     
                        blogDetail.getSelectedOptionValue = selectedOptionValue
                        blogDetail.getResultType  = getBtnValue
                        blogDetail.getScoreValue = scoreValue
                        
                        self.tabBarController?.navigationController?.pushViewController(blogDetail, animated: true)
                        
                        
                    }
                }
            }
            else{
                
                showAlert(title: "Alert!", message: "Please Select an Option", noOfButton: 1)
            }
            
        }
    }
    
    
    // MARK: -Table View Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        if ((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "option") as? NSArray) ==  nil {
            
            print("novalue")
            return 0
        }
        else{
            
            print(((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray))
            return ((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray).count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = questionTableVw.dequeueReusableCell( withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        
        cell.qusBtn.addTarget(self, action: #selector(QuestionViewController.qusAction), for:.touchUpInside)
        cell.qusBtn.tag = indexPath.row
        cell.imgVRightOrWrong.tag = indexPath.row
//        cell.imgVRightOrWrong.isHidden = true
        
        self.questionTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if indexPath.row == selectedBtnIndex{
            
            cell.qusBtn.setBackgroundImage(UIImage.init(named: "radio-active.png"), for: .normal)
        }
        else{
            
            cell.qusBtn.setBackgroundImage(UIImage.init(named: "radio.png"), for: .normal)
        }
        
        if isAnsChecked == true {
            
            if ((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(selectedBtnIndex + 1) && indexPath.row == selectedBtnIndex{
                
                cell.imgVRightOrWrong.isHidden = false
//                cell.imgVRightOrWrong.backgroundColor = UIColor.green
                
                cell.imgVRightOrWrong.image = UIImage.init(named: "if_check.png")
                
                
                
            }
            else{
                
                if ((dataQuestionSet.object(at: chkBtn.tag) as? NSDictionary)?.object(forKey: "correct_answer") as? String) == String(indexPath.row + 1){
                    
                    cell.imgVRightOrWrong.isHidden = false
//                    cell.imgVRightOrWrong.backgroundColor = UIColor.green
                    cell.imgVRightOrWrong.image = UIImage.init(named: "if_check.png")
                    
                }
                else if indexPath.row == selectedBtnIndex{
                    
                    cell.imgVRightOrWrong.isHidden = false
//                    cell.imgVRightOrWrong.backgroundColor = UIColor.red
                    cell.imgVRightOrWrong.image = UIImage.init(named: "close-round.png")
                }
                else{
                    
                    cell.imgVRightOrWrong.isHidden = true
                }
            }
            
        }
        else{
            
            cell.imgVRightOrWrong.isHidden = true
        }
        
        
        if(indexPath.row == 3)
        {
            cell.dividerView.isHidden = true
            
        }
        else
        {
            cell.dividerView.isHidden = false
        }
        
        cell.ansLbl.text = ((((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: indexPath.row) as! String).uppercased())
     
     ///   print(((((dataQuestionSet.object(at: chkBtn.tag) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: indexPath.row) as! String).uppercased()))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isAnsChecked == true{
        }
        else{
            
            selectedBtnIndex = indexPath.row
            
            questionTableVw.reloadData()
        }
        getOptionValue = indexPath.row
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
            
            return 70
        }
        else
        {
            return 50
        }
        
    }
    @objc func qusAction(_ sender : UIButton)
    {
        print("Pdf Index ==> ",sender.tag)
        
        
        questionTableVw.reloadData()
        
    }
}
extension QuestionViewController : jsonDataDelegate{
    
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
                    
                    print("dataQuestionSet.count:\(dataQuestionSet.count)")
                    
                    print(dataQuestionSet)
                    
                    lblTotalQuestions.text = String(dataQuestionSet.count)
                    lblQuestionNo.text = "1"
                    questionLbl.text = (((dataQuestionSet.object(at: 0) as! NSDictionary).object(forKey: "question") as! String).uppercased())
                    print((((dataQuestionSet.object(at: 0) as! NSDictionary).object(forKey: "question") as! String).uppercased()))
                    
                    
                    questionTableVw.delegate=self
                    questionTableVw.dataSource=self
                }
            }
            else
            {
                print(data)
                if (((data as! NSDictionary).object(forKey: "success") as! String) == "yes"){
                    
                    dataQuestionSet = ((data as! NSDictionary).object(forKey: "data") as! NSArray)
                    
                    print("dataQuestionSet.count:\(dataQuestionSet.count)")
                    
                    print(dataQuestionSet)
                    
                    lblTotalQuestions.text = String(dataQuestionSet.count)
                    lblQuestionNo.text = "1"
                    questionLbl.text = (((dataQuestionSet.object(at: 0) as! NSDictionary).object(forKey: "question") as! String).uppercased())
                    print((((dataQuestionSet.object(at: 0) as! NSDictionary).object(forKey: "question") as! String).uppercased()))
                    
                    
                    questionTableVw.delegate=self
                    questionTableVw.dataSource=self
                }
                
            }
            
            questionTableVw.reloadData()
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

