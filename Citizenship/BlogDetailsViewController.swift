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
import SDWebImage
class BlogDetailsViewController: UIViewController,UITextViewDelegate,UIWebViewDelegate {
    
   
    @IBOutlet var blogWeb: UIWebView!

    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    var blogDetailArray = ""
   // var id: String = ""
     var id: String = " "
     var getWebValue = ""
     var getSelectedIndex = Int()
   var getImglink = ""
   
    @IBOutlet weak var shoeTitle: UILabel!
    @IBOutlet weak var showImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

         print("\(id)")
       
        
        
        
        jsonFetch.jsonData = self
        blogWeb.delegate=self
      
        //self.showImg.sd_setImage(with: URL(String:getImglink), placeholderImage: UIImage(named:""))
        self.showImg.sd_setImage(with: URL(string: getImglink), placeholderImage: UIImage(named:""))
        
       // cell.titleImg.sd_setImage(with: URL(string: ((blogArray[indexPath.row]) as AnyObject).value(forKey: "image") as! String), placeholderImage: UIImage(named:""))
        featchData()
     
 
    }
    
    func loadHtmlCode() {
        //let htmlCode =  ((data as! NSDictionary).value(forKey: "data") as! String)
        blogWeb.loadHTMLString(getWebValue, baseURL: nil)
        
       //  termsWeb.loadHTMLString(getv, baseURL: nil)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
  func featchData()
  {
    parameters = ["actiontype" : "blog_details","blog_id" :  id]
   
    print(parameters)
    jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "blog_details")
    
    MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
    
    }
    @IBAction func continueAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension BlogDetailsViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
       
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
             showAlert(title: "Error", message: "No Internet connection,please check your network !", noOfButton: 1)
        }
        else{
            
           if ((data as! NSDictionary).value(forKey: "success") as! String) == "yes"
           {
             getWebValue = ((data as! NSDictionary).value(forKey: "data") as! String)
            shoeTitle.text = ((data as! NSDictionary).value(forKey: "title") as! String)
           
            
             loadHtmlCode()
            }
            else
           {
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
             showAlert(title: "Error", message: "Something going wrong, try again..", noOfButton: 1)
            
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

