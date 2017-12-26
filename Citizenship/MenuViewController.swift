//
//  MenuViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 26/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class MenuViewController: UITabBarController,UITabBarControllerDelegate,sliderIndexDelegate {
    
    var sliderDelegate: sliderIndexDelegate?
    var sliderVC: SliderViewController! = nil
    var signUpVC: SignUpViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBackgroundImage:UIImage! = UIImage(named: "headerAdmin.png")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,for: .default)
        self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
        self.delegate = self
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
           
            let image = UIImage(named: "menutab.png")
            let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(45), height: CGFloat(35))
            let button = UIButton(frame: buttonFrame)
            button.addTarget(self, action: #selector(self.menuTabButtonAction), for: .touchUpInside)
            button.setImage(image, for: .normal)
            let item = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = item
            
            let image1 = UIImage(named: "logout.png")
            let buttonFrame1 = CGRect(x: CGFloat(350), y: CGFloat(0), width: CGFloat(45), height: CGFloat(35))
            let button1 = UIButton(frame: buttonFrame1)
            button1.addTarget(self, action: #selector(self.logoutAction), for: .touchUpInside)
            button1.setImage(image1, for: .normal)
            
            let item1 = UIBarButtonItem(customView: button1)
            self.navigationItem.rightBarButtonItem = item1
             sliderVC = self.storyboard?.instantiateViewController(withIdentifier: "SliderViewController") as! SliderViewController
            sliderVC.view.frame = CGRect(x: CGFloat(-350), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(350), height: self.view.frame.height)
            
        }
            
            
            
        else
        {
           
            let image = UIImage(named: "menutab.png")
            let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(24), height: CGFloat(30))
            let button = UIButton(frame: buttonFrame)
            button.addTarget(self, action: #selector(self.menuTabButtonAction), for: .touchUpInside)
            button.setImage(image, for: .normal)
            let item = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = item
            
            let image1 = UIImage(named: "logout.png")
            let buttonFrame1 = CGRect(x: CGFloat(350), y: CGFloat(0), width: CGFloat(24), height: CGFloat(20))
            let button1 = UIButton(frame: buttonFrame1)
            button1.addTarget(self, action: #selector(self.logoutAction), for: .touchUpInside)
            button1.setImage(image1, for: .normal)
            
            let item1 = UIBarButtonItem(customView: button1)
            self.navigationItem.rightBarButtonItem = item1
             sliderVC = self.storyboard?.instantiateViewController(withIdentifier: "SliderViewController") as! SliderViewController
            sliderVC.view.frame = CGRect(x: CGFloat(-250), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(250), height: CGFloat(self.view.frame.size.height)+10)
            
            
        }
        
        
        
       
      //  sliderVC = self.storyboard?.instantiateViewController(withIdentifier: "SliderViewController") as! SliderViewController
        
        //sliderVC.view.frame = CGRect(x: CGFloat(-200), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(264), height: CGFloat(self.view.frame.size.height-60))
        
        self.view?.addSubview(sliderVC.view)
        sliderVC.view.isHidden = true;
        sliderVC.sliderDelegate  = self 
        
       
        //         signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print(viewController.self);
        print("controller class: \(String(describing: viewController.self))")
        print("controller title: \(String(describing: viewController.title))")
        
    }
//    func enableMenuButton(notification: NSNotification) -> Void {
//
//        let str : String = notification.name.rawValue
//
//        print(str)
//
//        if str == "EnableMenu" {
//            self.navigationItem.leftBarButtonItem = self.createMenuButton()
//        }
//        else{
//            self.navigationItem.leftBarButtonItem = nil
//        }
//
//    }
//    func clickedButton(notification: NSNotification) -> Void {
//
//        self.selectedIndex = 2
//    }
//
//    // MARK: - Slider Delegates
    
    func getSliderIndex(index: NSInteger) {

        print(index)

        if index >= 4 {


            //self.moreNavigationController.navigationBar.isHidden = true
            //self.moreNavigationController.tabBar.isHidden = true
        }
        if(index == 4)
        {
            print("Soumi")

            self.selectedIndex = 3


        }
        else if (index == 3)  {

            let examVC = self.storyboard?.instantiateViewController(withIdentifier: "ChapterExamViewController") as! ChapterExamViewController

            self.navigationController?.pushViewController(examVC, animated: true)
            
           
            

        }
        else if (index == 5) {

            let timeVC = self.storyboard?.instantiateViewController(withIdentifier: "TimePeriodViewController") as! TimePeriodViewController

            self.navigationController?.pushViewController(timeVC, animated: true)

            
        }

        else if(index == 6)
        {

            let govtVC = self.storyboard?.instantiateViewController(withIdentifier: "GovernmentViewController") as! GovernmentViewController

            self.navigationController?.pushViewController(govtVC, animated: true)
           
            
            
        }
        else if(index == 7) {

            let supportVC = self.storyboard?.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController

            self.navigationController?.pushViewController(supportVC, animated: true)

            
        }
            //
        else if (index == 8){

//            let logoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//
//            self.navigationController?.pushViewController(logoutVC, animated: true)
            
       //     self.tabBarController?.navigationController?.popToRootViewController(animated: true)
            
//            for controller in self.navigationController!.viewControllers as Array {
//                if controller.isKind(of: SignUpViewController.self) {
//                    self.navigationController!.popToViewController(controller, animated: true)
//                    break
//                }
//            }
//        }

            self.dismiss(animated: true, completion: nil)
            
        }
        else
        {
            self.selectedIndex = index
        }


        slideViewHideAnimation()
    }
    func viewButtonClicked(isTrue: Bool) {
        
        if isTrue == true {
            
            slideViewHideAnimation()
        }
        
        //        slideViewHideAnimation()
    }
   
    @objc  func menuTabButtonAction() {
        
        
        if sliderVC.view.frame.origin.x < 0 {
            
            
            sliderVC.view.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                
                if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
                {
                    
                    self.sliderVC.view.frame = CGRect(x: CGFloat(0), y: (((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(350), height: self.view.frame.height)
                    
                }
                else
                {
                    self.sliderVC.view.frame = CGRect(x: CGFloat(0), y: (((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(250), height: CGFloat(self.view.frame.size.height) + 10)
                }
                
            })
        }
        else {
            slideViewHideAnimation()
        }
        
    }
    func slideViewHideAnimation() {
//        UIView.animate(withDuration: 0.1, animations: {() -> Void in
//           // self.sliderVC.view.frame = CGRect(x: CGFloat(-200), y: CGFloat((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat(264), height: CGFloat(self.view.frame.size.height-60))
//        }, completion: {(_ finished: Bool) -> Void in
//            self.sliderVC.view.isHidden = true
//        })

        UIView.animate(withDuration: 0.1, animations: {() -> Void in
            
            if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
            {
                
                self.sliderVC.view.frame = CGRect(x: CGFloat(-350), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(350), height: self.view.frame.height)
                
            }
            else
            {
                self.sliderVC.view.frame = CGRect(x: CGFloat(-250), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(250), height: CGFloat(self.view.frame.size.height)
                )
            }
        }, completion: {(_ finished: Bool) -> Void in
            self.sliderVC.view.isHidden = true
        })
    
    
    
    }
    @objc  func logoutAction() {
        
        
        if sliderVC.view.frame.origin.x < 0
        {
            self.dismiss(animated: false, completion: nil)
            
        }
        else {
            slideViewHideAnimation()
        }
    }
}
