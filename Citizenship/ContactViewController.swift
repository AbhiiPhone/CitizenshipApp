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

class ContactViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var lblDes: UILabel!
    @IBOutlet var sndBtn: UIButton!
    @IBOutlet var contactLbl: UILabel!
    
    @IBOutlet var contactTop: NSLayoutConstraint!
    
    @IBOutlet var lblLeading: NSLayoutConstraint!
    @IBOutlet var lblTop: NSLayoutConstraint!
    @IBOutlet var lblTrailing: NSLayoutConstraint!
    
    @IBOutlet var stackhHeight: NSLayoutConstraint!
    @IBOutlet var stackVwTop: NSLayoutConstraint!
    @IBOutlet var msgTop: NSLayoutConstraint!
    @IBOutlet var msgHeight: NSLayoutConstraint!
    
    @IBOutlet var sndTop: NSLayoutConstraint!
    @IBOutlet var contactLeading: NSLayoutConstraint!
   
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    @IBOutlet var nameTF: ACFloatingTextfield!
    @IBOutlet var mailTF: ACFloatingTextfield!
    @IBOutlet var subjectTF: ACFloatingTextfield!
    @IBOutlet var msgTF: ACFloatingTextfield!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
         jsonFetch.jsonData = self
        
        nameTF.delegate=self
        mailTF.delegate=self
        subjectTF.delegate=self
        msgTF.delegate=self
        
        
        
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
        
        if(textField == nameTF)
        {
            nameTF.resignFirstResponder()
        }
        else if(textField == mailTF)
        {
            mailTF.resignFirstResponder()
        }
        else if(textField == subjectTF)
        {
            subjectTF.resignFirstResponder()
        }
        else
        {
            msgTF.resignFirstResponder()
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    
    @IBAction func sendBtnAction(_ sender: Any) {
        
        parameters = ["actiontype" :  "contact",
                      "user_name" :  self.nameTF.text!,         // sss,
                       "email" :     self.mailTF.text!,             //soumi.micronix@gmail.com!,
                        "subject" :  self.subjectTF.text!,           //aaaaaaa,
                        "message" :  self.msgTF.text!           //aaaaa
                        ]
        
        print(parameters)
       
        let strLink = "http://bestauctionsoftware.com/citi/json.php"
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: strLink, JSONName: "contact")

        let alertController = UIAlertController(title: "Congratulation!!!", message: "thanks for your concern we will get back to you shortly", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            // NSLog(@"Cancel action");
        })
//        alertController.addAction(cancelAction)
//        present(alertController, animated: true) { _ in }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ContactViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
        /* Calling Serially as following
         
         1. FilterData
         2. Reviewsdata
         3. Bookie Slides
         
         */
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            //   showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1, selectorMethod: ())
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            print(jsonName)
            
  
            
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
        
        //  showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1, selectorMethod:())
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}

