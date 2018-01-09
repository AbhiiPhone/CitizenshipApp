//
//  ChangePasswordController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 02/01/18.
//  Copyright © 2018 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class ChangePasswordController: UIViewController {

    @IBOutlet weak var otpTxtfield: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var confirmTxtField: UITextField!
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        jsonFetch.jsonData = self
     //  changeTabTitleName(title: "CITIZENSHIP")
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
    }
   
    func featchData()
    {
        parameters = ["actiontype" :  "change_password",
                      "old_password" : self.otpTxtfield.text!,
                      "new_password": passwordTxtField.text!,
                      "user_id"     : UserDefaults.standard.value(forKey:"user_id" ) as! String
                      
        ]
        
        print(parameters)
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "Change Password")
    }
    @IBAction func submiteAction(_ sender: Any) {
        
//        if( (otpTxtfield.text?.isEmpty == true)|| (passwordTxtField.text?.isEmpty == true)||(confirmTxtField.text?.isEmpty == true))
//        {
//            print("Enter all data")
//             self.showAlertMessage(alertTitle: "Error!", alertMsg: " Please enter all data")
//        }
         featchData()
    }
    

}

extension ChangePasswordController : jsonDataDelegate{
    
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
            
            
                // if (((data as! NSDictionary).value(forKey: "LOGIN") as! NSDictionary).value(forKey: "success") as! NSString) == "yes"
                
                if (((data as! NSDictionary).value(forKey: "status") as! String)) == "Password Changed"
                    
                {
                    MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                     self.showAlertMessage(alertTitle: "Wait!", alertMsg: "Your password has been changed..")
                    //                  self.showAlertMessage(alertTitle: "Congratulation", alertMsg: " You successfully logged in")
                    
                   
                }
                    
                else
                {
                     MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
                   // self.showAlertMessage(alertTitle: "Error!", alertMsg: "you entered wrong data...")
                      self.showAlertMessage(alertTitle: "Error!", alertMsg: "you entered wrong data...")
                }
                
            
            
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
        
        showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
