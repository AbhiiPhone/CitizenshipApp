//
//  UIButonExtension.swift
//  City Wedding Planner
//
//  Created by @vi on 13/04/17.
//  Copyright © 2017 AbhiMicronix. All rights reserved.
//

import Foundation
import UIKit
//import SVProgressHUD

extension UIButton{
    
class func backButtonTarget(_ target: Any, action: Selector) -> UIBarButtonItem {
    
        let backButton = UIButton(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(12), height: CGFloat(15)))
    
//        backButton.setTitle("Cancel",for: .normal)
//        backButton.backgroundColor = UIColor.green
        backButton.setBackgroundImage(UIImage(named: "Left.png"), for: .normal)
        let barBackButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(target, action: action, for: .touchUpInside)
    
        return barBackButtonItem
    }
}

extension UIViewController{
    
    func changeTabTitleName(title:String) -> Void
    {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        if ( UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad )
        {
            //ProximaNova-Bold
           // ProximaNova-Regular
            let tlbl = UILabel()
            
            tlbl.text = title
            tlbl.font = UIFont(name:"ProximaNova-Bold",size:30)
            tlbl.sizeToFit()
            tlbl.textColor = UIColor.white
            self.tabBarController?.navigationItem.titleView = tlbl
            
        }
        else
        {
            let tlbl = UILabel()
            tlbl.text = title
            tlbl.font = UIFont(name:" ProximaNova-Bold",size:22)
            tlbl.sizeToFit()
            tlbl.textColor = UIColor.white
            self.tabBarController?.navigationItem.titleView = tlbl
        }
        
    }
        
        func changeTitleName(title:String) -> Void
        {
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            
            navigationController?.navigationBar.tintColor = UIColor.white
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationController?.navigationBar.topItem?.title = " "
            
            if ( UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad )
            {
                //ProximaNova-Bold
                // ProximaNova-Regular
                let tlbl = UILabel()
                
                tlbl.text = title
                tlbl.font = UIFont(name:"ProximaNova-Bold",size:30)
                tlbl.sizeToFit()
                tlbl.textColor = UIColor.white
                self.tabBarController?.navigationItem.titleView = tlbl
                
            }
            else
            {
                let tlbl = UILabel()
                tlbl.text = title
                tlbl.font = UIFont(name:" ProximaNova-Bold",size:22)
                tlbl.sizeToFit()
                tlbl.textColor = UIColor.white
                self.tabBarController?.navigationItem.titleView = tlbl
            }
    }
    
    func backButtonSelector() -> Void {
        
//        self.navigationItem.leftBarButtonItem = UIButton.backButtonTarget(self, action: #selector(popCurrentViewController))
        
        self.navigationItem.hidesBackButton = true
        
        self.tabBarController?.navigationItem.leftBarButtonItem = UIButton.backButtonTarget(self, action: #selector(popCurrentViewController))
    }
    
    @objc func popCurrentViewController() -> Void {
        
        _ = self.navigationController?.popToRootViewController(animated: true)
        
        NotificationCenter.default.post(name: Notification.Name("EnableMenu"), object: nil)
        
    }
    
    func changeView(_ view:UIView) -> Void {
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.hexStringToUIColor(hex: "c4c2c2").cgColor
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "f3f3f3")
        view.layer.cornerRadius = 5
    }
    
    func setNavigationBarItem()
    {
        
        self.tabBarController?.navigationController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.tintColor = UIColor.white
        let image = UIImage(named: "menutab.png")
        let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(24), height: CGFloat(20))
        let button = UIButton(frame: buttonFrame)
        button.addTarget(self, action: #selector(navLeftButtonAction), for: .touchUpInside)
       
        button.setImage(image, for: .normal)
        let item = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = item
        
        let image1 = UIImage(named: "logout.png")
        let buttonFrame1 = CGRect(x: CGFloat(350), y: CGFloat(0), width: CGFloat(24), height: CGFloat(20))
        let button1 = UIButton(frame: buttonFrame1)
        button1.addTarget(self, action: #selector(self.navReghitButtonAction), for: .touchUpInside)
        button1.setImage(image1, for: .normal)
        
        
        
        let item1 = UIBarButtonItem(customView: button1)
        self.navigationItem.rightBarButtonItem = item1
    }
    @objc func navLeftButtonAction() {
       
        _ = self.navigationController?.popToRootViewController(animated: true)
       
//        var sliderDelegate: sliderIndexDelegate?
//        var sliderVC: SliderViewController! = nil
//        if sliderVC.view.frame.origin.x < 0 {
//            sliderVC.view.isHidden = false
//            UIView.animate(withDuration: 0.3, animations: {() -> Void in
//                self.sliderVC.view.frame = CGRect(x: CGFloat(0), y: CGFloat((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat(264), height: CGFloat(self.view.frame.size.height-60))
//            })
        }
//        else {
//            //newSlideViewHideAnimation()
//        }
    
    //}
    func newSlideViewHideAnimation() {
//        UIView.animate(withDuration: 0.1, animations: {() -> Void in
//           // sliderVC.view.frame = CGRect(x: CGFloat(-200), y: CGFloat((self.navigationController?.navigationBar.frame.size.height)!+20), width: CGFloat(264), height: CGFloat(self.view.frame.size.height-60))
//        }, completion: {(_ finished: Bool) -> Void in
//            //self.sliderVC.view.isHidden = true
//        })
    }
    @objc func navReghitButtonAction() {
        
       
    }
    
    func attributedString(from string: String, nonBoldRange: NSRange?) -> NSAttributedString {
        
        let fontSize = UIFont.systemFontSize
        let attrs = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: fontSize),
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        let nonBoldAttribute = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize),
            ]
        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
        if let range = nonBoldRange {
            attrStr.setAttributes(nonBoldAttribute, range: range)
        }
        return attrStr
    }
    
    func callHUD() {
//        
//        perform(#selector(self.dismiss1), with: nil, afterDelay: 0.5)
//        
//        SVProgressHUD.showError(withStatus: "Error")
    }
    
    func dismiss1() -> Void {
        
        //SVProgressHUD.dismiss()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(title: String, message: String, noOfButton: NSNumber) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        if noOfButton == 2 {
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                
                print("OK")
                
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { action in
                
                print("CANCEL")
                
            }))
        }
        else{
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                
                print("OK")
                
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: testStr)
        
    }
//    func getSliderIndex(index: NSInteger) {
//
//        print(index)
//         let menuVC = MenuViewController()
//
//        if index >= 4 {
//
//
//            menuVC.moreNavigationController.navigationBar.isHidden = true
//            //self.moreNavigationController.tabBar.isHidden = true
//        }
//        if(index == 4)
//        {
//            print("Soumi")
//
//            menuVC.selectedIndex = 3
//
//
//        }
//        else if (index == 3)  {
//
//            let examVC = self.storyboard?.instantiateViewController(withIdentifier: "ChapterExamViewController") as! ChapterExamViewController
//
//            self.navigationController?.pushViewController(examVC, animated: true)
//
//        }
//        else if (index == 5) {
//
//            let timeVC = self.storyboard?.instantiateViewController(withIdentifier: "TimePeriodViewController") as! TimePeriodViewController
//
//            self.navigationController?.pushViewController(timeVC, animated: true)
//
//        }
//
//        else if(index == 6)
//        {
//
//            let govtVC = self.storyboard?.instantiateViewController(withIdentifier: "GovernmentViewController") as! GovernmentViewController
//
//            self.navigationController?.pushViewController(govtVC, animated: true)
//
//        }
//        else if(index == 7) {
//
//            let supportVC = self.storyboard?.instantiateViewController(withIdentifier: "SupportViewController") as! SupportViewController
//
//            self.navigationController?.pushViewController(supportVC, animated: true)
//
//        }
//            //
//        else if (index == 8){
//
//            let logoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//
//            self.navigationController?.pushViewController(logoutVC, animated: true)
//
//        }
//
//
//        else
//        {
//            menuVC.selectedIndex = index
//        }
//
//
//        newSlideViewHideAnimation()
//    }
    
}

extension UIView{
    
    var newLayer:CALayer{
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.hexStringToUIColor(hex: "c4c2c2").cgColor
        self.layer.cornerRadius = 5
        
        return self.layer
    }
    
    var bgColor: UIView{
        
        self.bgColor.backgroundColor = UIColor.hexStringToUIColor(hex: "c4c2c2")
        return self.bgColor
    }
    
    
}


extension UIColor{
    
   class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
//extension UIDevice{
//    
//    public enum DisplayType {
//        case unknown
//        case iphone4
//        case iphone5
//        case iphone6
//        case iphone6plus
//        static let iphone7 = iphone6
//        static let iphone7plus = iphone6plus
//        case ipad
//    }
//    
//    public final class Display {
//        
//        class var width:CGFloat { return UIScreen.main.bounds.size.width }
//        class var height:CGFloat { return UIScreen.main.bounds.size.height }
//        class var maxLength:CGFloat { return max(width, height) }
//        class var minLength:CGFloat { return min(width, height) }
//        class var zoomed:Bool { return UIScreen.main.nativeScale >= UIScreen.main.scale }
//        class var retina:Bool { return UIScreen.main.scale >= 2.0 }
//        class var phone:Bool { return UIDevice.current.userInterfaceIdiom == .phone }
//        class var pad:Bool { return UIDevice.current.userInterfaceIdiom == .pad }
//        class var carplay:Bool { return UIDevice.current.userInterfaceIdiom == .carPlay }
//        class var tv:Bool { return UIDevice.current.userInterfaceIdiom == .tv }
//        
//        class var typeIsLike:DisplayType {
//            if phone && maxLength < 568 {
//                return .iphone4
//            }
//            else if phone && maxLength == 568 {
//                return .iphone5
//            }
//            else if phone && maxLength == 667 {
//                return .iphone6
//            }
//            else if phone && maxLength == 736 {
//                return .iphone6plus
//            }
//            else if pad && maxLength >= 1024 {
//                return .ipad
//            }
//            return .unknown
//        }
//    }
//}
