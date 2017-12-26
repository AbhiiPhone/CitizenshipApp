//
//  DashBoardViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 18/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    @IBOutlet var lbl1Top: NSLayoutConstraint!
    @IBOutlet var lbl1Leading: NSLayoutConstraint!
    @IBOutlet var lbl1Trailing: NSLayoutConstraint!
    @IBOutlet var Lbl1Height: NSLayoutConstraint!
    @IBOutlet var btn1Height: NSLayoutConstraint!
    @IBOutlet var btn1Width: NSLayoutConstraint!
    @IBOutlet var lbl2Trailing: NSLayoutConstraint!
    @IBOutlet var lbl2Height: NSLayoutConstraint!
    @IBOutlet var lbl3Height: NSLayoutConstraint!
    @IBOutlet var lbl4Height: NSLayoutConstraint!
    @IBOutlet var lbl5Height: NSLayoutConstraint!
    @IBOutlet var lblHeight: NSLayoutConstraint!
    @IBOutlet var lbl7Height: NSLayoutConstraint!
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
      
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
          

        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
           
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
           
        }
            
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
        }
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        

        
    }
    

    

}
