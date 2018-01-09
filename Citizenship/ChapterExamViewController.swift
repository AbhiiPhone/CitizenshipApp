//
//  ChapterExamViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 21/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ChapterExamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var chapterTableVw: UITableView!
  
    @IBOutlet weak var selectedBtn: UIButton!
    @IBOutlet var chapterView: UIView!
    
    @IBOutlet weak var selectTitlelbl: UILabel!
    let chapterArray: NSMutableArray = ["Introduction","Chapter1_Basic Rights and Responsibilities Of Canadian Citizenship","Chapter2_About Us","Chapter3_History Of Canada","Chapter4_Modernization Of Canada","Chapter5_ Government Of Canadian","Chapter6_Federal Election Process","Chapter7_The Justice System of Canada","Chapter8_Canada and its Symbols","Chapter9_Econimy Of Canada","Chapter10_Regions of Canada"]
    
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
  var isSelected = Bool()
    var getChapterId = String()
    var getChapterValue = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        chapterTableVw.delegate=self
        chapterTableVw.dataSource=self
      
        
        chapterView.isHidden=true
        //setNavigationBarItem()
        
        chapterTableVw.layer.borderWidth = 1;
        chapterTableVw.layer.shadowRadius = 12.0
        chapterTableVw.layer.cornerRadius = 5
        chapterTableVw.layer.borderColor = UIColor.darkGray.cgColor
        
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
       // <<chapter_exam>> 'actiontype'=>'chapter_exam',
        //'chapter_id'=>'1'
        
       
            parameters = ["actiontype" :  "chapter_list",
                          
            ]
            print(parameters)
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "chapter_list")
        
       
      
        
        MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        
        
    }
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
          return getChapterValue.count
        
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = chapterTableVw.dequeueReusableCell( withIdentifier: "ChapterExamCell", for: indexPath) as! ChapterExamTableViewCell
        
        cell.chapterLbl.text = ((getChapterValue[indexPath.row] as AnyObject).value(forKey: "chapter_name") as! String)
        
        self.chapterTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        
        if(indexPath.row == 10)
        {
            cell.dividerView.isHidden = true
            
        }
        else
        {
            cell.dividerView.isHidden = false
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedBtn.setTitle(chapterArray[indexPath.row] as? String, for: .normal)
        
        selectTitlelbl.text = ((getChapterValue[indexPath.row] as AnyObject).value(forKey: "chapter_name") as! String)
        getChapterId = ((getChapterValue[indexPath.row] as AnyObject).value(forKey: "chapter_id") as! String )
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailChapterExamController") as! DetailChapterExamController
        
        detailVC.getChapterDetailsId = getChapterId
        self.navigationController?.pushViewController(detailVC, animated: true)
        chapterView.isHidden = true
        chapterTableVw.isHidden = true
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
             return 82
            
        }
        else {
            
             return 70
        }
       
        
        
    }
    
    @IBAction func selectedBtnAction(_ sender: Any) {
        
        chapterView.isHidden=false
        UIView.transition(with: self.view, duration: 1.5, options: UIViewAnimationOptions.transitionCurlUp,
                          animations: {self.view.addSubview(self.chapterView)}, completion: nil)
        
        self.chapterTableVw.isHidden = false
    }
    

}
extension ChapterExamViewController : jsonDataDelegate{
    
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
                getChapterValue = ((data as! NSDictionary).value(forKey: "chapter_details") as! NSArray)
                
                chapterTableVw.reloadData()
                
                DispatchQueue.main.async {
                    
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                }
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
        
        //  showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1, selectorMethod:())
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
