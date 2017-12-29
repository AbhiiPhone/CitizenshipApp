//
//  FreeTestViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 11/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class FreeTestViewController: UIViewController {

    @IBOutlet var firstVw: UIView!
    @IBOutlet var secondVw: UIView!
    @IBOutlet var chapterLbl: UILabel!
    @IBOutlet var firstVwLbl: UILabel!
    @IBOutlet var simulationLbl: UILabel!
    @IBOutlet var secondVwLbl: UILabel!
    
     @IBOutlet var firstVwTop: NSLayoutConstraint!
     @IBOutlet var firstVwHeight: NSLayoutConstraint!
     @IBOutlet var secondVwTop: NSLayoutConstraint!
    
    @IBOutlet weak var fstviewLcons: NSLayoutConstraint!
    
    @IBOutlet weak var fstviewTcons: NSLayoutConstraint!
    
    
    @IBAction func startBtn(_ sender: Any) {
        let qusVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(qusVC, animated: true)
        
    }
    
    
    @IBAction func startNowBtn(_ sender: Any) {
        
        let qusVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(qusVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
     
//        firstVw.layer.shadowColor = UIColor.lightGray.cgColor
//        firstVw.layer.shadowOpacity = 1
//        firstVw.layer.shadowOffset = CGSize.zero
//        firstVw.layer.shadowRadius = 12
//        firstVw.layer.cornerRadius=8
//
//        secondVw.layer.shadowColor = UIColor.lightGray.cgColor
//        secondVw.layer.shadowOpacity = 1
//        secondVw.layer.shadowOffset = CGSize.zero
//        secondVw.layer.shadowRadius = 12
//        secondVw.layer.cornerRadius=8
        
//        firstVw.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
//        firstVw.layer.shadowOffset = CGSize.zero
//        firstVw.layer.shadowOpacity = 1.0
//        firstVw.layer.shadowRadius = 6.0
//        firstVw.layer.cornerRadius = 8.0
        
        firstVw.layer.borderWidth = 5;
        firstVw.layer.shadowRadius = 12.0
        firstVw.layer.cornerRadius = 15
        firstVw.layer.borderColor = UIColor.lightGray.cgColor
        
        secondVw.layer.borderWidth = 5;
        secondVw.layer.shadowRadius = 12.0
        secondVw.layer.cornerRadius = 15
        secondVw.layer.borderColor = UIColor.lightGray.cgColor
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            firstVwTop.constant = 80.0
            firstVwHeight.constant=300.0
            secondVwTop.constant=80.0
           
         
           
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            firstVwTop.constant=0.0
            firstVwHeight.constant=175.0
           
            secondVwTop.constant = 40.0
           firstVwLbl.font = firstVwLbl.font.withSize(11)
         
            fstviewLcons.constant = 8
            fstviewTcons.constant = 8
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            firstVwTop.constant=20.0
            firstVwHeight.constant=200.0

            secondVwTop.constant=60.0

          
           
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
            firstVwTop.constant=10.0
            firstVwHeight.constant=210.0
            secondVwTop.constant=60.0
           
           
           
        }
        
    }

    
}
