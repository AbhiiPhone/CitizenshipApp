//
//  ChapterExamViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 21/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class ChapterExamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{

    @IBOutlet var chapterTableVw: UITableView!
    @IBOutlet var tableVwLeading: NSLayoutConstraint!
    @IBOutlet var selectedTF: UITextField!
    @IBOutlet var chapterView: UIView!
    
     let chapterArray: NSMutableArray = ["Introduction","Chapter1_Basic Rights and Responsibilities Of Canadian Citizenshi","Chapter2_About Us","Chapter3_History Of Canada","Chapter4_Modernization Of Canada","Chapter5_ Government Of Canadian","Chapter6_Federal Election Process","Chapter7_The Justice System of Canada","Chapter8_Canada and its Symbols","Chapter9_Econimy Of Canada","Chapter10_Regions of Canada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapterTableVw.delegate=self
        chapterTableVw.dataSource=self
        selectedTF.delegate = self
        
        chapterView.isHidden=true
        //setNavigationBarItem()
        

            }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        chapterView.isHidden=false
        UIView.transition(with: self.view, duration: 2.0, options: UIViewAnimationOptions.showHideTransitionViews,
                          animations: {self.view.addSubview(self.chapterView)}, completion: nil)
        
        self.chapterTableVw.isHidden = false
        return true
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        //        if textField == selectedTF {
        //            selectedTF.inputView = chapterView
        //        }
       // return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      //  selectedTF.resignFirstResponder()
        
      
        return true
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
          return chapterArray.count
        
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = chapterTableVw.dequeueReusableCell( withIdentifier: "ChapterExamCell", for: indexPath) as! ChapterExamTableViewCell
        
        cell.chapterLbl.text = chapterArray[indexPath.row] as? String
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        selectedTF.text=chapterArray[indexPath.row] as? String
        
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        
        self.navigationController?.pushViewController(registerVC, animated: true)
        chapterView.isHidden = true
        chapterTableVw.isHidden = true
        print(selectedTF)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 50
        
        
    }
    
  

}
