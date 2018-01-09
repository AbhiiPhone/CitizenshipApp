////
//  ShowPDFController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 02/01/18.
//  Copyright © 2018 Basir. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD
import Alamofire

class ShowPDFController: UIViewController,WKUIDelegate, WKNavigationDelegate {
 var webView: WKWebView!
 var getDownloadlink = String()
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self

//        webView.backgroundColor = UIColor.blue
        webView.translatesAutoresizingMaskIntoConstraints = false
        
       self.containerView.addSubview(webView)
        
        
        
        containerView.backgroundColor = UIColor.lightGray
        print(getDownloadlink)
        let fileURL = URL(fileURLWithPath: getDownloadlink  )
        print(fileURL)
      
        webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL )
        
        MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
       
        self.navigationController?.popViewController(animated: true)
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("file should be loaded")
        
        MBProgressHUD.hide(for:(self.navigationController?.view)! , animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
        
    }
}
