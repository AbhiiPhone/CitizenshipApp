//
//  ContactViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import Alamofire
import MBProgressHUD

class ContactViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    @IBOutlet var lblDes: UILabel!
    @IBOutlet var sndBtn: UIButton!
    @IBOutlet var contactLbl: UILabel!
    
    @IBOutlet var contactTop: NSLayoutConstraint!
    
   
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
   
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var subjectTxt: UITextField!
    
    @IBOutlet weak var messageTxtview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
         jsonFetch.jsonData = self
        
        nameTxt.delegate = self
        emailTxt.delegate = self
        subjectTxt.delegate = self
        messageTxtview.delegate = self
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
        
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
         
            
            
            
        }
            
            
            
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
       

                    }
            
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
          
                    }
        

        
        // Do any additional setup after loading the view.
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if(textField == nameTxt)
        {
            emailTxt.becomeFirstResponder()
        }
        else if(textField == emailTxt)
        {
            subjectTxt.becomeFirstResponder()
        }
        
        else
        {
            subjectTxt.resignFirstResponder()
        }
        
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
            messageTxtview.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    
    @IBAction func sendBtnAction(_ sender: Any) {
        
        parameters = ["actiontype" :  "contact",
                      "user_name" :  self.nameTxt.text!,         // sss,
                       "email" :     self.emailTxt.text!,             //soumi.micronix@gmail.com!,
                        "subject" :  self.subjectTxt.text!,           //aaaaaaa,
                        "message" :  self.messageTxtview.text!           //aaaaa
                        ]
        
        print(parameters)
       
       jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "contact")

        let alertController = UIAlertController(title: "Congratulation!!!", message: "thanks for your concern we will get back to you shortly", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            // NSLog(@"Cancel action");
        })
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }

   

}
extension ContactViewController : jsonDataDelegate{
    
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
            //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
//            print(((data as! NSDictionary).value(forKey: "success") as! String))
//            print(jsonName)
            
  
            
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
        
         showAlert(title: "Error", message: "Something   going wrong,try again.. !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}

