//
//  DetailViewController.swift
//  Citizenship
//
//  Created by @vi on 30/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import MBProgressHUD

class DetailViewController: UIViewController,UIWebViewDelegate,WKNavigationDelegate {
 
    @IBOutlet weak var detailTblview: UITableView!
    @IBOutlet weak var showTitlelbl: UILabel!
    
    var isClick = Bool()
    var getIndexPath = Int()
      var webView: WKWebView!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    var getIndex = Int()
    var getAllDetailsValue = NSArray()
   
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonFetch.jsonData = self
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
       // webView.uiDelegate = self as! WKUIDelegate
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.frame = CGRect(origin: CGPoint(x: 16, y: 70), size:  CGSize(width: (self.view.frame.size.width - 10), height: self.view.frame.size.height - 20))
        
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor.white
        
        titleLabel.text = (((getAllDetailsValue[getIndex] ) as AnyObject).value(forKey: "heading") as! String)
        print(titleLabel.text!)
        
    featchData()
        
    }
    
  func  featchData()
    
  {
    parameters = ["actiontype" : "readmore" ]
        
        print(parameters)
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "readmore")
        
        MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
                  
        
    
    
    print(parameters)
    
    
    jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "LOGIN")
    }
    override func viewWillAppear(_ animated: Bool) {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
   
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        NSLog("Finish Navigation")
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}

extension DetailViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        //showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
        // MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
            
            
        }
        else{
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            if(((data as! NSDictionary).value(forKey: "success") as! NSString)) == "yes"
            {
                
                
                if(getIndex == 0)
                {

                    webView.loadHTMLString((((data as! NSDictionary).value(forKey: "data") as! NSString) as String), baseURL: nil)
                }
                else if(getIndex == 1)
                {
                    webView.loadHTMLString((((data as! NSDictionary).value(forKey: "data1") as! NSString) as String), baseURL: nil)
                }
                else
                {
                    webView.loadHTMLString((((data as! NSDictionary).value(forKey: "data2") as! NSString) as String), baseURL: nil)
                }
                
            }
           else
            {
                 showAlert(title: " Wait !", message: "Somthing going wrong ,try again..", noOfButton: 1)
                
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

