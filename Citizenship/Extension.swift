//
//  Extension.swift
//  BettingAppV4Design2017
//
//  Created by @vi on 27/06/17.
//  Copyright © 2017 AbhiMicronix. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIDevice

extension UIDevice{
    
    public enum DisplayType {
        case unknown
        case iphone4
        case iphone5
        case iphone6
        case iphone6plus
        case iphoneSE
        static let iphone7 = iphone6
        static let iphone7plus = iphone6plus
        static let iphone5s = iphoneSE
        case ipad
    }
    
    public final class Display {
        
        class var width:CGFloat { return UIScreen.main.bounds.size.width }
        class var height:CGFloat { return UIScreen.main.bounds.size.height }
        class var maxLength:CGFloat { return max(width, height) }
        class var minLength:CGFloat { return min(width, height) }
        class var zoomed:Bool { return UIScreen.main.nativeScale >= UIScreen.main.scale }
        class var retina:Bool { return UIScreen.main.scale >= 2.0 }
        class var phone:Bool { return UIDevice.current.userInterfaceIdiom == .phone }
        class var pad:Bool { return UIDevice.current.userInterfaceIdiom == .pad }
        class var carplay:Bool { return UIDevice.current.userInterfaceIdiom == .carPlay }
        class var tv:Bool { return UIDevice.current.userInterfaceIdiom == .tv }
        
        class var typeIsLike:DisplayType {
            if phone && maxLength == 480 {
                return .iphoneSE
            }
            else if phone && maxLength == 568 {
                return .iphone5
            }
            else if phone && maxLength == 667 {
                return .iphone6
            }
            else if phone && maxLength == 736 {
                return .iphone6plus
            }
            else if pad && maxLength >= 1024 {
                return .ipad
            }
            return .unknown
        }
    }
}


//if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
//    
//}
//else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
//    
//    
//    if(indexPath.row == 0)
//    {
//        cell.btnImgLeadingCons.constant = 40
//        
//    }
//    else
//    {
//        cell.btnImgLeadingCons.constant = 60
//    }
//    
//    
//    
//}
//else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
//    
//    if(indexPath.row == 0)
//    {
//        cell.btnImgLeadingCons.constant = 74
//        
//    }
//    else
//    {
//        cell.btnImgLeadingCons.constant = 120
//    }
//    
//}
//else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
//    
//    if(indexPath.row == 0)
//    {
//        cell.btnImgLeadingCons.constant = 74
//        
//    }
//    else
//    {
//        cell.btnImgLeadingCons.constant = 120
//    }
//    
//}





// MARK: - UIColor

//extension UIColor{
//    
//    class func hexStringToUIColor (hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//        
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//        
//        if ((cString.characters.count) != 6) {
//            return UIColor.gray
//        }
//        
//        var rgbValue:UInt32 = 0
//        Scanner(string: cString).scanHexInt32(&rgbValue)
//        
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
//}
//
//extension UIButton{
//    
//    class func backButtonTarget(_ target: Any, action: Selector) -> UIBarButtonItem {
//        
//        let backButton = UIButton(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(10), height: CGFloat(16)))
//        backButton.setBackgroundImage(UIImage(named: "back.png"), for: .normal)
//        let barBackButtonItem = UIBarButtonItem(customView: backButton)
//        backButton.addTarget(target, action: action, for: .touchUpInside)
//        
//        return barBackButtonItem
//    }
//    
//    class func backButtonTarget2(_ target: Any, action: Selector) -> UIBarButtonItem {
//        
//        let backButton = UIButton(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(10), height: CGFloat(16)))
//        backButton.setBackgroundImage(UIImage(named: "RedBack"), for: .normal)
//        let barBackButtonItem = UIBarButtonItem(customView: backButton)
//        backButton.addTarget(target, action: action, for: .touchUpInside)
//        
//        return barBackButtonItem
//    }
//    
//}
//
//extension UIViewController{
    
    
    
//    func backButtonSelector() -> Void {
//        
//        self.navigationItem.leftBarButtonItem = UIButton.backButtonTarget(self, action: #selector(popCurrentViewController))
//    }
//    
//    func backButtonSelector2() -> Void {
//        
//        self.navigationItem.leftBarButtonItem = UIButton.backButtonTarget2(self, action: #selector(popCurrentViewController))
//    }
    
//    func popCurrentViewController() -> Void {
//        
//        _ = self.navigationController?.popViewController(animated: false)
//        
//    }
//    
//    func showAlert(title: String, message: String, noOfButton: NSNumber, selectorMethod: ()) -> Void {
//        
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
//        
//        if noOfButton == 2 {
//            
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
//                
//                print("OK")
//                
//                selectorMethod
//                
//            }))
//            
//            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { action in
//                
//                print("CANCEL")
//                
//            }))
//        }
//        else{
//            
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
//                
//                print("OK")
//                
//                selectorMethod
//                
//            }))
//        }
//        
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    func closeApp() -> Void {
//        exit(0)
//    }
//    
//    func isValidEmail(testStr:String) -> Bool {
//        // print("validate calendar: \(testStr)")
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        
//        return emailTest.evaluate(with: testStr)
//        
//    }
//    
//}
