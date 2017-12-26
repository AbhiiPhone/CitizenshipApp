//
//  SupportViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 19/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import Alamofire
import MBProgressHUD

class SupportViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var subTF: UITextField!
    @IBOutlet weak var msgTxtview: UITextView!
    @IBOutlet var supportLbl: UILabel!
    @IBOutlet var desLbl: UILabel!
    @IBOutlet var sndBtn: UIButton!
    @IBOutlet var viewTop: NSLayoutConstraint!
    @IBOutlet var viewLeading: NSLayoutConstraint!
    @IBOutlet var viewTrailing: NSLayoutConstraint!
    @IBOutlet var lblTop: NSLayoutConstraint!
    @IBOutlet var lblHeight: NSLayoutConstraint!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
  
    @IBOutlet weak var msgImgviewHicons: NSLayoutConstraint!
    
    @IBOutlet weak var txtFieldImgviewHiCons: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
         jsonFetch.jsonData = self
        nameTF.delegate = self
        emailTF.delegate = self
        subTF.delegate = self
        
        
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            msgImgviewHicons.constant = 180
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            msgImgviewHicons.constant = 50
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == nameTF)
        {
            emailTF.becomeFirstResponder()
        }
        else if(textField == emailTF)
        {
            subTF.becomeFirstResponder()
        }
        else
        
        {
            subTF.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func sendBtnAction(_ sender: Any) {
        
        parameters = ["actiontype" :  "support",
                      "user_name" :  self.nameTF.text!,                     // soumi,
                       "email" :     self.emailTF.text!,             //aa@gmail.com!,
                        "subject" :  self.subTF.text!,           //hi,
                        "message" :  self.msgTxtview.text!           //hi!
        ]
        
        print(parameters)
  
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "support")

        

    }

    
}
extension SupportViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
       
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
               showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
           // print(((data as! NSDictionary).value(forKey: "success") as! String))      //
            print(jsonName)
            
            if(((data as! NSDictionary).value(forKey: "succes") as! String) == "yes")
            {
               
                 showAlert(title: "Congratulation !", message: "thanks for your concern we will get back to you shortly!", noOfButton: 1)
                
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
