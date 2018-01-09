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

class SupportViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
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
        msgTxtview.delegate = self
        
        
        
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
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
  
  
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
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField == subTF)
        {
             self.view.frame = CGRect(x: CGFloat(0), y: CGFloat(-50), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.view.frame.size.height))
        }
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       self.view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.view.frame.size.height))
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        self.view.frame = CGRect(x: CGFloat(0), y: CGFloat(-150), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.view.frame.size.height))
    }
    
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        //        composeTxview.resignFirstResponder()
        
        self.view.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(self.view.frame.size.width), height: CGFloat(self.view.frame.size.height))
        return true
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            msgTxtview.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func sendBtnAction(_ sender: Any) {
    
        if (self.nameTF.text?.isEmpty)! || (emailTF.text?.isEmpty)! || (subTF.text?.isEmpty)!
            
        {
            showAlert(title: "Error", message: "Fields are empty.", noOfButton: 1)
        }
        else if (isValidEmail(testStr: (emailTF.text)!)) == false
            
        {
            showAlert(title: "Error", message: "Invalid Email id.", noOfButton: 1)
        }
            
        else
        {
            
            parameters = ["actiontype" :  "support",
                          "user_name" :  self.nameTF.text!,                     // soumi,
                "email" :     self.emailTF.text!,             //aa@gmail.com!,
                "subject" :  self.subTF.text!,           //hi,
                "message" :  self.msgTxtview.text!           //hi!
            ]
           
            
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "SIGNIN_Recruiter")
            MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        }
       
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
        else{
          
            if(((data as! NSDictionary).value(forKey: "succes") as! String) == "yes")
            {
                  showAlert(title: "Congratulation !", message: "thanks for your concern we will get back to you shortly!", noOfButton: 1)
             }
        }
        
    }
   
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
          showAlert(title: "Error", message: "Something going wrong,try again.. !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
