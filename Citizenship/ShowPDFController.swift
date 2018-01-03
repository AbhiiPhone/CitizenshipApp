//
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
 var getDownloadlink = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.frame = CGRect(origin: CGPoint(x: 0, y: 80), size:  CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height - 70))
        
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor.lightGray
        
        print(getDownloadlink)
        let fileURL = URL(fileURLWithPath: getDownloadlink )
        print(fileURL)
        webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.view.removeFromSuperview()
        
    }
    
}
