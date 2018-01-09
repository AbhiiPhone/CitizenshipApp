//
//  TabViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController,UITabBarControllerDelegate,sliderIndexDelegate1  {
    
    var sliderDelegate1: sliderIndexDelegate1?
    var menu_SliderVC: Menu_SliderViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
     
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            let navBackgroundImage:UIImage! = UIImage(named: "header_ipad.png")
            self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,for: .default)
            self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
            
//            self.navigationController?.navigationBar.barTintColor = UIColor.red
            
             menu_SliderVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu_SliderViewController") as! Menu_SliderViewController
             menu_SliderVC.view.frame = CGRect(x: CGFloat(-350), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(350), height: CGFloat(self.view.frame.size.height))
            
         /*   let attributes = [NSAttributedStringKey.font: UIFont(name: "Georgia", size: 30)!, NSAttributedStringKey.foregroundColor:UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = attributes
            
            let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = textAttributes*/
            //self.title = "CITIZENSHIP"
            
        }
      
        else {
            let navBackgroundImage:UIImage! = UIImage(named: "header")
            self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,for: .default)
            self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
            
            self.navigationController?.navigationBar.barTintColor = UIColor.white
 
             menu_SliderVC = self.storyboard?.instantiateViewController(withIdentifier: "Menu_SliderViewController") as! Menu_SliderViewController
            menu_SliderVC.view.frame = CGRect(x: CGFloat(-250), y: CGFloat(((self.navigationController?.navigationBar.frame.size.height)!+20)), width: CGFloat(250), height: CGFloat(self.view.frame.size.height))
            
            
             //self.title = "CITIZENSHIP"
//            self.tabBarController?.navigationController?.title = "CITIZENSHIP"
//
//            UINavigationBar.appearance().titleTextAttributes = [
//                NSAttributedStringKey.font: UIFont(name: "Georgia", size: 20)!,NSAttributedStringKey.foregroundColor:UIColor.white
//            ]
//             navigationController?.navigationBar.tintColor = UIColor.white
            
            
        }
       
        
        
        
        self.view?.addSubview(menu_SliderVC.view)
        menu_SliderVC.view.isHidden = true;
        menu_SliderVC.sliderDelegate1=self
        
    
       self.navigationItem.leftBarButtonItem = createMenuButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(enableMenuButton(notification:)), name: Notification.Name("EnableMenu"), object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func enableMenuButton(notification: NSNotification) -> Void {
        
        let str : String = notification.name.rawValue
        
        print(str)
        
        if str == "EnableMenu" {
            self.navigationItem.leftBarButtonItem = self.createMenuButton()
        }
        else{
            self.navigationItem.leftBarButtonItem = nil
        }
        
    }
    
    @IBAction func menuButtonAction(_ sender: UIButton) {
        
        self.menuTabButtonAction()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
//            self.title = "CITIZENSHIP"
//
//            UINavigationBar.appearance().titleTextAttributes = [
//                NSAttributedStringKey.font: UIFont(name: "Georgia", size: 30)!,NSAttributedStringKey.foregroundColor:UIColor.white
//            ]
            
        }
            
        else {
            
            
           // self.title = "CITIZENSHIP"
//            self.tabBarController?.navigationController?.title = "CITIZENSHIP"
//
//            UINavigationBar.appearance().titleTextAttributes = [
//                NSAttributedStringKey.font: UIFont(name: "Georgia", size: 20)!,NSAttributedStringKey.foregroundColor:UIColor.white
//            ]
            
        }
        
    }
    
   /* func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print(viewController.self);
        print("controller class: \(String(describing: viewController.self))")
        print("controller title: \(String(describing: viewController.title))")
        
    }*/
    /*func enableMenuButton(notification: NSNotification) -> Void {
        
        let str : String = notification.name.rawValue
        
        print(str)
        
        if str == "EnableMenu" {
            self.navigationItem.leftBarButtonItem = self.createMenuButton()
        }
        else{
            self.navigationItem.leftBarButtonItem = nil
        }
        
    }*/
    func clickedButton(notification: NSNotification) -> Void {
        
        self.selectedIndex = 2
    }
    
    // MARK: - Slider Delegates
    
    func getSliderIndexnew(index: NSInteger) {
        
        print(index)
        
        if index >= 4 {
            
            
            self.moreNavigationController.navigationBar.isHidden = true
            //self.moreNavigationController.tabBar.isHidden = true
        }
        
        
        if(index == 3)
        {
            print("Soumi")
            
            self.selectedIndex = 2
            
        }
        else if(index == 6)
        {
            print("Riya")
            self.selectedIndex = 3
        }
            
        else if (index == 2) {
            
            
            let faqVC = self.storyboard?.instantiateViewController(withIdentifier: "FaqViewController") as! FaqViewController
            
            self.navigationController?.pushViewController(faqVC, animated: true)
        }
            
        else if (index == 4) {
            
            let citizenshipVC = self.storyboard?.instantiateViewController(withIdentifier: "CitizenshipViewController") as! CitizenshipViewController
            
            self.navigationController?.pushViewController(citizenshipVC, animated: true)
            
        }
        else if (index == 5) {
            
            let blogVC = self.storyboard?.instantiateViewController(withIdentifier: "BlogViewController") as! BlogViewController
            
            self.navigationController?.pushViewController(blogVC, animated: true)
            
        }
        else if  (index == 7) {
            
            let termsVC = self.storyboard?.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
            
            self.navigationController?.pushViewController(termsVC, animated: true)
            
        }
        else if  (index == 8) {
            
            let policyVC = self.storyboard?.instantiateViewController(withIdentifier: "PolicyViewController") as! PolicyViewController
            
            self.navigationController?.pushViewController(policyVC, animated: true)
            
        }
            
        else if (index == 9)
        {
            let logoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            
            self.navigationController?.pushViewController(logoutVC, animated: true)
            
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
    
    func createMenuButton() -> UIBarButtonItem {
        
        let image = UIImage(named: "menutab.png")
        let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(15), height: CGFloat(15))
        let button = UIButton(frame: buttonFrame)
        
//        button.backgroundColor = UIColor.blue
        button.backgroundImage(for: .normal)
        button.addTarget(self, action: #selector(self.menuTabButtonAction), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        let item = UIBarButtonItem(customView: button)
        // let label = UILabel("CITIZENSHIP")
        
        
        return item
    }
    @objc  func menuTabButtonAction() {
        if menu_SliderVC.view.frame.origin.x < 0 {
            menu_SliderVC.view.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
               
                if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
                {
                    
                    self.menu_SliderVC.view.frame = CGRect(x: CGFloat(0), y: ((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat(350), height: self.view.frame.height)
                    
                }
                else
                {
                    self.menu_SliderVC.view.frame = CGRect(x: CGFloat(0), y: ((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat(250), height: CGFloat(self.view.frame.size.height) + 10)
                }
            })
        }
        else {
            slideViewHideAnimation()
        }
    }
    func slideViewHideAnimation() {
        UIView.animate(withDuration: 0.1, animations: {() -> Void in
            self.menu_SliderVC.view.frame = CGRect(x: CGFloat(-264), y: CGFloat((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat((self.navigationController?.navigationBar.frame.size.width)!), height: CGFloat(self.view.frame.size.height-60))
        }, completion: {(_ finished: Bool) -> Void in
            self.menu_SliderVC.view.isHidden = true
        })
    }
    
    
    
    
    
    @objc  func menuTabButtonAction1() {
        if menu_SliderVC.view.frame.origin.x < 0
        {
            let signVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(signVC, animated: true)
            
            
        }
        else {
            slideViewHideAnimation()
            
            let signVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            self.navigationController?.pushViewController(signVC, animated: true)
        }
    }
    
    
    
    
}
