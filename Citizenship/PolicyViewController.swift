//
//  PolicyViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class PolicyViewController: UIViewController {

    @IBOutlet var policyWebVw: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
        
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    

    

}
