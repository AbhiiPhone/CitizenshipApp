//
//  BlogDetailsViewController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 20/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD


class BlogDetailsViewController: UIViewController,UITextViewDelegate,UIWebViewDelegate {
    
    @IBOutlet var blogTextVw: UITextView!
    
    
    @IBOutlet var blogWeb: UIWebView!

    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    var blogDetailArray = ""
   // var id: String = ""
     var id: String = " "
    var getWebValue = ""
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

         print("\(id)")
       
       loadHtmlCode()
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""

        
        parameters = ["actiontype" : "blog_details","blog_id" :  id]
        print(parameters)
        
        jsonFetch.jsonData = self
        
        //  http://bestauctionsoftware.com/citi/json.php
        
        let strLink =  "http://bestauctionsoftware.com/citi/json.php"
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: strLink, JSONName: "blog_details")
        
       // blogTextVw.delegate=self
        
        blogWeb.delegate=self
        
       // blogWeb.loadRequest(URLRequest(url: URL(string: getWebValue)!))
        
       // blogWeb.loadRequest(URLRequest(url: URL(string: "id")!))
      
       // blogTextVw.text=id
        
 
    }
    
    func loadHtmlCode() {
        //let htmlCode =  ((data as! NSDictionary).value(forKey: "data") as! String)
        blogWeb.loadHTMLString(getWebValue, baseURL: nil)
        
       //  termsWeb.loadHTMLString(getv, baseURL: nil)
    }

    

//    func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    




}
extension BlogDetailsViewController : jsonDataDelegate{
    
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
            
           
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            
          //  blogDetailArray = ((data as! NSDictionary).value(forKey: "data") as! NSArray)
            
            //self.getWebValue = ((data as! NSDictionary).value(forKey: "data") as! String)

            
            getWebValue = ((data as! NSDictionary).value(forKey: "data") as! String)
            
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

