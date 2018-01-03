//
//  SignUpViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 11/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import ACFloatingTextfield_Swift

class SignUpViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var userTF: ACFloatingTextfield!
    @IBOutlet var passwordTF: ACFloatingTextfield!
    
    @IBOutlet var uTF: UITextField!
    @IBOutlet var pTF: UITextField!
    
    @IBOutlet var closeBtnHeight: NSLayoutConstraint!
    @IBOutlet var closeBtnWidth: NSLayoutConstraint!
    @IBOutlet var signTrailing: NSLayoutConstraint!
    @IBOutlet var signLeading: NSLayoutConstraint!
    @IBOutlet var signHeight: NSLayoutConstraint!
    
    @IBOutlet var logoTopConst: NSLayoutConstraint!
    @IBOutlet var logoTrailingConst: NSLayoutConstraint!
    @IBOutlet var logoLeadingConst: NSLayoutConstraint!
    @IBOutlet var logoHeightConst: NSLayoutConstraint!
    
   
    @IBOutlet var signBtnHeight: NSLayoutConstraint!
   
    @IBOutlet var forgotLeading: NSLayoutConstraint!
    @IBOutlet var forgotTrailing: NSLayoutConstraint!
   
    
    @IBOutlet var accountTop: NSLayoutConstraint!
     var parameters: [String: String] = [:]
     var jsonFetch = JsonFetchClass()
    var getforgotpasswordEmail = " "

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //  self.title = "CITIZENSHIP"
        
        userTF.delegate=self
        passwordTF.delegate=self
        
        jsonFetch.jsonData = self
       
        self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
       changeTitleName(title: "CITIZENSHIP")
        
    if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
        
        closeBtnHeight.constant=40.0
        closeBtnWidth.constant=40.0
        
        signTrailing.constant=235.0
        signLeading.constant = 205.0
        signHeight.constant = 60.0
        
        logoHeightConst.constant=250.0
        logoTopConst.constant=30.0
        logoLeadingConst.constant=150.0
        logoTrailingConst.constant=150.0
        
       
        signBtnHeight.constant = 100.0
       forgotLeading.constant = 34.0
        forgotTrailing.constant = 34.0
       accountTop.constant=60.0

    
    
    }
    else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
    
    
    
  //  signInHConst.constant = 20
    signTrailing.constant = 60.0
    signLeading.constant = 25.0
    
    closeBtnHeight.constant = 10.0
    closeBtnWidth.constant = 10.0
//
    logoHeightConst.constant = 80.0
    logoTopConst.constant = 20.0
    logoLeadingConst.constant = 79.0
    logoTrailingConst.constant = 79.0
    signBtnHeight.constant = 50.0
    forgotLeading.constant = 24.0
    forgotTrailing.constant = 24.0
    accountTop.constant = 0.0
        
  }
else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
    
    
        signTrailing.constant=60.0
        signLeading.constant = 25.0
        
        closeBtnHeight.constant=15.0
        closeBtnWidth.constant=15.0
        //
        logoHeightConst.constant=120.0
        logoTopConst.constant=40.0
        logoLeadingConst.constant=75.0
        logoTrailingConst.constant=75.0
        signBtnHeight.constant = 50.0
       forgotLeading.constant = 24.0
        forgotTrailing.constant = 24.0
     
        accountTop.constant=20.0
        //
//
    }
    
    
    else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
    
        signTrailing.constant=60.0
        signLeading.constant = 25.0
        
        closeBtnHeight.constant=15.0
        closeBtnWidth.constant=15.0
        //
        logoHeightConst.constant=160.0
        logoTopConst.constant=40.0
        logoLeadingConst.constant=75.0
        logoTrailingConst.constant=75.0
       
        signBtnHeight.constant = 60.0
        forgotLeading.constant = 24.0
        forgotTrailing.constant = 24.0
       
        accountTop.constant=60.0
        //
    }
        
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if(textField == userTF)
        {
            pTF.becomeFirstResponder()
        }
        else
        {
            pTF.resignFirstResponder()
        }
        
        return true
    }
    
  
    @IBAction func backBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        
        
        parameters = ["actiontype" :  "user_login",
                      "user_name" :   self.userTF.text!,           //"chandradip1",
                      "password" :  self.passwordTF.text!               //"woulverine1"
            
        ]
        
        print(parameters)
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "LOGIN")
        
//        let adminVC = self.storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
//        self.navigationController?.present(adminVC, animated: true, completion: nil)
       
    }
    
   
    @IBAction func forgotBtnAction(_ sender: Any) {
        
        //'actiontype'=>'forgotpass',
        //'email'=>'soumi.micronix@gmail.com'
        
        let alert = UIAlertController(title: "Reset your password",
                                      message: nil,
                                      preferredStyle: .alert)
        // Submit button
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            let textField = alert.textFields![0]
            
            self.getforgotpasswordEmail = textField.text!
            
            self.forgotData()
            
            
        })
        
        // Cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        
        // Add 1 textField and customize it
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Enter your email id."
            textField.clearButtonMode = .whileEditing
        }
        
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    

    
    func forgotData()
    {
        /*"email" =>"soumi.micronix@gmail.com","user_type"=>"recruiter","actiontype"=>"forgotpass"" */
        
        parameters = ["actiontype" :  "forgotpass",
                      "email" : getforgotpasswordEmail,
                      
            
        ]
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "ForgetPassword")
        
        print(parameters)
    }
    
    
    @IBAction func accountBtnAction(_ sender: Any) {
        
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    
    @IBAction func ChangePasswordAction(_ sender: Any) {
        
        if ( UserDefaults.standard.value(forKey:"user_id" ) != nil) {
           
            let changePassVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordController") as! ChangePasswordController
            
            self.navigationController?.pushViewController(changePassVC, animated: true)
            
        }
        
        else
        {
             showAlert(title: "Alert !", message: "Please login first..", noOfButton: 1)
        }
    }
    
    
    
    
   
}

extension SignUpViewController : jsonDataDelegate{
    
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
            
          //  print(((data as! NSDictionary).value(forKey: "success") as! String))
            //print(jsonName)
            
            if(jsonName == "ForgetPassword")
            {
                
                if ((data as! NSDictionary).value(forKey: "Status") as! NSString) == "Invalid email"
                    
                    
                {
                    
                     MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                    
                    self.showAlertMessage(alertTitle: "Error!", alertMsg: " This email does not exits,Enter another email ")
                    
                 }
                else
                
                {
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                    
//                    let alert = UIAlertController(title: "Reset your password",
//                                                  message: nil,
//                                                  preferredStyle: .alert)
                    
                    self.showAlertMessage(alertTitle: "Welcome ", alertMsg: " Password has been sent to your email ")
                }
                
                
            }
                
                
           else
            {
               // if (((data as! NSDictionary).value(forKey: "LOGIN") as! NSDictionary).value(forKey: "success") as! NSString) == "yes"
                    
                if (((data as! NSDictionary).value(forKey: "success") as! String)) == "yes"
                    
                {
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
//                  self.showAlertMessage(alertTitle: "Congratulation", alertMsg: " You successfully logged in")
                     UserDefaults.standard.set(((data as! NSDictionary).value(forKey: "id") as! String), forKey: "user_id")
                   presentController()
                }
                    
                else
                {
                    self.showAlertMessage(alertTitle: "Error!", alertMsg: "you entered wrong data...")
                    
                }
                
            }
           
        }
        
    }
       func presentController()
       {
        let adminVC = self.storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
        self.navigationController?.present(adminVC, animated: true, completion: nil)
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
        
          showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }


}
