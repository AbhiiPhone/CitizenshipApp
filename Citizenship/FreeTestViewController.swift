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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        firstVw.layer.masksToBounds = false
        firstVw.layer.shadowColor = UIColor.darkGray.cgColor
        firstVw.layer.shadowOpacity = 0.5
        firstVw.layer.shadowRadius = 6
        firstVw.layer.cornerRadius = 6
       // firstVw.layer.shouldRasterize = true
        
       // secondVw.layer.masksToBounds = true
        secondVw.layer.shadowColor = UIColor.darkGray.cgColor
        secondVw.layer.shadowOpacity = 0.5
        secondVw.layer.shadowRadius = 6
        firstVw.layer.cornerRadius = 6
       secondVw.layer.shouldRasterize = false
        

       
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
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
    }
    @IBAction func startBtn(_ sender: Any) {
        
        // Chaptre question Btn Action
        let qusVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        qusVC.getBtnValue = "ChapterQuestion"
        
        self.tabBarController?.navigationController?.pushViewController(qusVC, animated: true)
        
    }
    
    
    @IBAction func startNowBtn(_ sender: Any) {
        
        let qusVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        qusVC.getBtnValue = "SimulationQuestion"
        self.tabBarController?.navigationController?.pushViewController(qusVC, animated: true)
    }
    
}
