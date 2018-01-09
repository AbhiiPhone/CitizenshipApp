//
//  TakeTestController.swift
//  
//
//  Created by Amit Kumar Poreli on 29/12/17.
//

import UIKit
import Alamofire
import MBProgressHUD

class TakeTestController: UIViewController {

    @IBOutlet weak var secLbl: UILabel!
    
    @IBOutlet weak var minLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var takeQuestionTblview: UITableView!
    
    var sec = 60
    var min = 29
    var getIndexValue = Int()
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
  
    var incrementedNubmer = Int()
    var getChapterDetailsId = String()
    
  
    var getAllCapterValue = NSArray()
    var selectedOptionValue = NSMutableArray()
    var selectedOption = Int()
    var obtainScoreValue = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
       // print(getIndexValue)
         jsonFetch.jsonData = self
        selectedOption = 4
        
        takeQuestionTblview.layer.borderWidth = 1;
        self.takeQuestionTblview.layer.cornerRadius = 8
        self.takeQuestionTblview.layer.borderColor = UIColor.darkGray.cgColor
        
        featchData()
        
    }
    func featchData()
    {
        //<<take test>> actiontype'=>'take_test',
        //'chapter_id'=>'1'
        
        parameters = ["actiontype" :  "take_test",
                      "chapter_id"  : String(getIndexValue + 1)
        ]
        print(parameters)
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "take_test")
        MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
    }
    
    
    
    @objc func update()
    {
        
        if(min == 0)
        {
            if(sec == 0)
            {
                showAlert(title: "Wait", message: "Your time is over", noOfButton: 1)
                self.navigationController?.popViewController(animated: true)
            }
           else
            {
                secLbl.text = String(sec)
                minLbl.text = String(min)
            }
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
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        print(incrementedNubmer)
        selectedOptionValue.insert(selectedOption, at: incrementedNubmer)
        if(incrementedNubmer < (getAllCapterValue.count - 1))
        {
            
            self.titleLbl.text = ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "question") as! String ).uppercased()
            incrementedNubmer = incrementedNubmer + 1
            if ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "correct_answer") as! String) == String(selectedOption + 1)
           {
            
            obtainScoreValue = obtainScoreValue + 1
            
            }
              selectedOption = 4
            takeQuestionTblview.reloadData()
        }
            
        else
        {
            
            print("Question over")
            
            let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "ExamResultController") as! ExamResultController
            
            blogDetail.getSelectedOptionValue = selectedOptionValue
            blogDetail.getResultType = "TakeTestChapter"
            blogDetail.getChaptervalue = getChapterDetailsId
            blogDetail.chapterId = getIndexValue
            blogDetail.getScoreValue = obtainScoreValue
            self.navigationController?.pushViewController(blogDetail, animated: true)
            
            
        }
        
        
    }
    
   
}
extension TakeTestController : UITableViewDataSource,UITableViewDelegate
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
        
        if (indexPath.row == 3)
        {
            //cell.dividerView.isHidden = true
        }
        else
        {
           // cell.dividerView.isHidden = false
        }
        
        if(selectedOption == indexPath.row)
        {
            cell.radioImg.image = UIImage(named:"radio_on.png")
        }
        else
        {
            cell.radioImg.image = UIImage(named:"radio_off.png")
        }
        
        cell.optionLabel.text = ((((getAllCapterValue.object(at: incrementedNubmer) as! NSDictionary).object(forKey: "option") as! NSArray).object(at: indexPath.row) as! String).uppercased())
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 80
            
        }
        else {
            
            return 55
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedOption = indexPath.row
      
        takeQuestionTblview.reloadData()
    }
}
extension TakeTestController : jsonDataDelegate{
    
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
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            getAllCapterValue = ((data as! NSDictionary).value(forKey: "data") as! NSArray)
            self.titleLbl.text = ((getAllCapterValue[incrementedNubmer] as AnyObject).value(forKey: "question") as! String ).uppercased()
            print(getAllCapterValue.count)
            
           
            takeQuestionTblview.dataSource = self
            takeQuestionTblview.delegate = self
            takeQuestionTblview.reloadData()
            
        }
        
    }
    
    
    func showAlertMessage(alertTitle: String, alertMsg : String)
    {
        let alertController = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
        showAlert(title: "Error", message: "Something going wrong try again !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
