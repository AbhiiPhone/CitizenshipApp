//
//  DetailChapterExamController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 28/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class DetailChapterExamController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var questionTblview: UITableView!
    var getIndexValue = Int()
    var incrementedNubmer = Int()
    var getChapterDetailsId = String()
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    var getAllCapterValue = NSArray()
    var selectedOptionValue = NSMutableArray()
    var obtainScoreValue = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTblview.layer.borderWidth = 1;
       // chapterTableVw.layer.shadowRadius = 12.0
       // chapterTableVw.layer.cornerRadius = 5
        questionTblview.layer.borderColor = UIColor.darkGray.cgColor
        
            getIndexValue = 4
        incrementedNubmer  = 0
           jsonFetch.jsonData = self
        
        featchData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
    }

    func featchData()
    {
        parameters = ["actiontype" :  "chapter_exam",
                      "chapter_id" : String(getChapterDetailsId)
        ]
        print(parameters)
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "chapter_exam")
    
    
    MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
       
         print(incrementedNubmer)
        selectedOptionValue.insert(getIndexValue, at: incrementedNubmer)
        if(incrementedNubmer < (getAllCapterValue.count - 1))
        {
           
            
            incrementedNubmer = incrementedNubmer + 1
            self.titleLbl.text = ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "question") as! String ).uppercased()
            
            
            if ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "correct_answer") as! String) == String(getIndexValue + 1)
            {
                
                obtainScoreValue = obtainScoreValue + 1
                
            }
            
              getIndexValue = 4
            questionTblview.reloadData()
        }
        
        else
        {
            
            print("Question over")
          
             let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "ExamResultController") as! ExamResultController
             
             blogDetail.getSelectedOptionValue = selectedOptionValue
            blogDetail.getResultType = "DetailChapter"
            blogDetail.getChaptervalue = getChapterDetailsId
            blogDetail.getScoreValue = obtainScoreValue
            
            self.navigationController?.pushViewController(blogDetail, animated: true)
             

        }
    }
    
}
extension DetailChapterExamController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if ((getAllCapterValue.object(at: incrementedNubmer) as? NSDictionary)?.object(forKey: "option") as? NSArray) ==  nil {

            print("novalue")
            return 0
        }
        else{

            print(((getAllCapterValue.object(at: incrementedNubmer) as! NSDictionary).object(forKey: "option") as! NSArray))
            return ((getAllCapterValue.object(at: incrementedNubmer) as! NSDictionary).object(forKey: "option") as! NSArray).count
        }
      
       
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
        
        cell.questionlbl.text = ((((getAllCapterValue.object(at: incrementedNubmer) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: indexPath.row) as! String).uppercased())
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 90
        }
        else {
            return 55
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        getIndexValue = indexPath.row
        questionTblview.reloadData()
    }
}
extension DetailChapterExamController : jsonDataDelegate{
    
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
            if(((data as! NSDictionary).value(forKey: "success") as! String)) ==  "yes"
            {
               
                
                  getAllCapterValue = ((data as! NSDictionary).value(forKey: "data") as! NSArray)
                self.titleLbl.text = ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "question") as! String ).uppercased()
                print(getAllCapterValue.count)
            
                
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
                questionTblview.dataSource = self
                questionTblview.delegate = self
                    questionTblview.reloadData()
                
            }
                
            else{
                
                showAlert(title: "Wait !", message: " Something going wrong,try again..", noOfButton: 1)
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
            }
            
        }
        
    }
    
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
          showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
