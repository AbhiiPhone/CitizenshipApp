//
//  TermsViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class TermsViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var termsWeb: UIWebView!
    var parameter: [String: String] = [:]
    
    var getv = ""
    var jsonFetch = JsonFetchClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = "CITIZENSHIP"
//        
//        navigationController?.navigationBar.topItem?.title = ""
        termsWeb.delegate=self
        featchData()
       
        
       
    }

   func featchData()
   {
    parameter = ["actiontype" :  "termsandconditions",]
    print(parameter)
    jsonFetch.jsonData = self
    jsonFetch.fetchData(parameter , methodType: "POST", url: " ", JSONName: "termsandconditions")
    
    MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
    
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
    }
    
    func loadHtmlCode() {
        //let htmlCode =  ((data as! NSDictionary).value(forKey: "data") as! String)
        termsWeb.loadHTMLString(getv, baseURL: nil)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
    }
  
}
extension TermsViewController : jsonDataDelegate{
    
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
            
           //
        //    blogArray = ((data as! NSDictionary).value(forKey: "data") as! NSArray)
            
            
            
           getv = ((data as! NSDictionary).value(forKey: "data") as! String)
            
            loadHtmlCode()
            
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

