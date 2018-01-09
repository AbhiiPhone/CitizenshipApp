//
//  PolicyViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import WebKit

class PolicyViewController: UIViewController,UIWebViewDelegate, WKNavigationDelegate {

    var webView: WKWebView!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "CITIZENSHIP"
//        navigationController?.navigationBar.topItem?.title = " "
        
        
        jsonFetch.jsonData = self
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        // webView.uiDelegate = self as! WKUIDelegate
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.frame = CGRect(origin: CGPoint(x: 10, y: 16), size:  CGSize(width: (self.view.frame.size.width - 10), height: self.view.frame.size.height - 20))
        
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        self.view.backgroundColor = UIColor.white
        featchData()
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {

        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
    }
    
    func  featchData()
        
    {
        parameters = ["actiontype" :  "privacypolicy"]
        
        print(parameters)
        
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "privacypolicy")
        
        MBProgressHUD.showAdded(to: (self.view)!, animated: true)
    }

    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        NSLog("Finish Navigation")
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }



}



extension  PolicyViewController: jsonDataDelegate{
    
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

                
                webView.loadHTMLString((((data as! NSDictionary).value(forKey: "data") as! NSString) as String), baseURL: nil)
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
