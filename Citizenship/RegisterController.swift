//
//  RegisterController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 13/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class RegisterController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmTxtField: UITextField!
    @IBOutlet weak var passwordEyeBtn: UIButton!
    @IBOutlet weak var confoPasswordEyeBtn: UIButton!
    @IBOutlet weak var alreadylblLeadingCons: NSLayoutConstraint!
    var isPasswordBtnClick = Bool()
    var isConfoPasswordEyeBtn = Bool()
   
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       userTxtField.delegate = self
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        confirmTxtField.delegate = self
        
        isPasswordBtnClick = false
        isConfoPasswordEyeBtn = false
        jsonFetch.jsonData = self
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            alreadylblLeadingCons.constant = 230
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
             alreadylblLeadingCons.constant = 30
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphoneSE{
            
          alreadylblLeadingCons.constant = 30
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "CITIZENSHIP"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.navigationBar.topItem?.title = " "
        
        self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
        
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    @IBAction func passwordEyeBtnAction(_ sender: Any) {
        
        if(isPasswordBtnClick == true) {
            passwordTxtField.isSecureTextEntry = false
            isPasswordBtnClick = false
        } else {
            passwordTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        }
        
    }
    @IBAction func confoPasswordEyeBtnAction(_ sender: Any) {
        
        if(isConfoPasswordEyeBtn == false) {
            confirmTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        } else {
            confirmTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        }
        
    }
    
    @IBAction func registerBtnAction(_ sender: Any) {
        
        
        if (self.userTxtField.text?.isEmpty)! || (emailTxtField.text?.isEmpty)! || (passwordTxtField.text?.isEmpty)!||(confirmTxtField.text?.isEmpty)!
            
        {
           
             showAlert(title: "Error", message: "Fields are empty.", noOfButton: 1)
        }
            
       
            
        else if (isValidEmail(testStr: (emailTxtField.text)!)) == false
            
        {
            showAlert(title: "Error", message: "Invalid Email id.", noOfButton: 1)
        }
            
         else if(self.passwordTxtField.text !=  self.confirmTxtField.text )
            
        {
            showAlert(title: "Error", message: "password ,confirm password does match..", noOfButton: 1)
        }
   
        else
        {
          
            
            //actiontype'=>'register',
           // 'user_name'=>'aaa',
            //'email'=>'aa@gmail.com',
            //'password'=>'aaa'
            parameters = ["actiontype" :  "register",
                          "user_name" : self.userTxtField.text!,
                          "email"  : self.emailTxtField.text!,
                          "password"  : self.passwordTxtField.text!
                         
                
            ]
            
            print(parameters)
            
           
            jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "SIGNIN_Recruiter")
            MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        }
        
     
    }
    @IBAction func loginBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == userTxtField)
        {
            emailTxtField.becomeFirstResponder()
        }
        else if(textField == emailTxtField)
        {
            passwordTxtField.becomeFirstResponder()
        }
        else if(textField == passwordTxtField)
        {
            confirmTxtField.becomeFirstResponder()
        }
        else
        {
            confirmTxtField.resignFirstResponder()
        }
        return true
    }
}
extension RegisterController : jsonDataDelegate{
    
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
                if (((data as! NSDictionary).value(forKey: "success") as! String)) == "yes"
                    
                {
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                    
                     showAlert(title: "Congratulation", message: "You sucessfully register..", noOfButton: 1)
                    self.navigationController?.popViewController(animated: true)
                    
                }
                    
                else
                {
                    //self.showAlertMessage(alertTitle: "Error!", alertMsg: "you enter wrong data..")
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                     showAlert(title: "Wait", message: "Something going wrong,try again..", noOfButton: 1)
                    
                    
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
