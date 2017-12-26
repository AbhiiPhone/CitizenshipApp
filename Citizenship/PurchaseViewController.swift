//
//  PurchaseViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 11/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    @IBOutlet var introLbl: UILabel!
    
    @IBOutlet var buyBtn: UIButton!
    
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl3: UILabel!
    @IBOutlet var lbl4: UILabel!
    @IBOutlet var lbl5: UILabel!
    @IBOutlet var lbl6: UILabel!
    @IBOutlet var lbl7: UILabel!
    @IBOutlet var priceLbl: UILabel!
    
    @IBOutlet var lbl1Leading: NSLayoutConstraint!
    @IBOutlet var lbl1Trailing: NSLayoutConstraint!
    @IBOutlet var lbl1Height: NSLayoutConstraint!
    @IBOutlet var lbl1Top: NSLayoutConstraint!
    
    
    @IBOutlet var imgFstLeading: NSLayoutConstraint!
    @IBOutlet var img1Top: NSLayoutConstraint!
    @IBOutlet var img1Leading: NSLayoutConstraint!
    @IBOutlet var img1Height: NSLayoutConstraint!
    @IBOutlet var img1Weight: NSLayoutConstraint!
    
    
    @IBOutlet var lbl2Top: NSLayoutConstraint!
    @IBOutlet var lbl2Leading: NSLayoutConstraint!
    @IBOutlet var lbl2Height: NSLayoutConstraint!
    @IBOutlet var lbl2Trailing: NSLayoutConstraint!
    
    @IBOutlet var img2Leading: NSLayoutConstraint!
    @IBOutlet var img2Top: NSLayoutConstraint!
    @IBOutlet var img2Height: NSLayoutConstraint!
    @IBOutlet var img2Width: NSLayoutConstraint!
    
    
    @IBOutlet var lbl3Leading: NSLayoutConstraint!
    @IBOutlet var lbl3Height: NSLayoutConstraint!
    @IBOutlet var lbl3Trailing: NSLayoutConstraint!
    @IBOutlet var lbl3Top: NSLayoutConstraint!
    
    @IBOutlet var img3Top: NSLayoutConstraint!
    @IBOutlet var img3Leading: NSLayoutConstraint!
    @IBOutlet var img3Width: NSLayoutConstraint!
    @IBOutlet var img3Height: NSLayoutConstraint!
    
    @IBOutlet var lbl4Leading: NSLayoutConstraint!
    @IBOutlet var lbl4Height: NSLayoutConstraint!
    @IBOutlet var lbl4Top: NSLayoutConstraint!
    @IBOutlet var lbl4Trailing: NSLayoutConstraint!
    
    
    @IBOutlet var img4Top: NSLayoutConstraint!
    @IBOutlet var img4Width: NSLayoutConstraint!
    @IBOutlet var img4Height: NSLayoutConstraint!
    
    @IBOutlet var lbl5Leading: NSLayoutConstraint!
    @IBOutlet var lbl5Trailing: NSLayoutConstraint!
    @IBOutlet var lbl5Height: NSLayoutConstraint!
    @IBOutlet var lbl5Top: NSLayoutConstraint!
    
    @IBOutlet var img5Top: NSLayoutConstraint!
    @IBOutlet var img5Leading: NSLayoutConstraint!
    @IBOutlet var img5Height: NSLayoutConstraint!
    @IBOutlet var img5Width: NSLayoutConstraint!
    
    @IBOutlet var lbl6Leading: NSLayoutConstraint!
    @IBOutlet var lbl6Height: NSLayoutConstraint!
    @IBOutlet var lbl6Top: NSLayoutConstraint!
    @IBOutlet var lbl6Trailing: NSLayoutConstraint!
    
    
    @IBOutlet var img6Top: NSLayoutConstraint!
    @IBOutlet var img6Leading: NSLayoutConstraint!
    @IBOutlet var imh6Width: NSLayoutConstraint!
    @IBOutlet var img6Height: NSLayoutConstraint!
    
    @IBOutlet var lbl7Leading: NSLayoutConstraint!
    @IBOutlet var lbl7Height: NSLayoutConstraint!
    @IBOutlet var lbl7Top: NSLayoutConstraint!
    @IBOutlet var lbl7Trailing: NSLayoutConstraint!
    
    
    @IBOutlet var img7Top: NSLayoutConstraint!
    @IBOutlet var img7Height: NSLayoutConstraint!
    @IBOutlet var img7Ledaing: NSLayoutConstraint!
    @IBOutlet var img7Width: NSLayoutConstraint!
    
    @IBOutlet var lbl8Leading: NSLayoutConstraint!
    @IBOutlet var lbl8Height: NSLayoutConstraint!
    @IBOutlet var lbl8Trailng: NSLayoutConstraint!
    @IBOutlet var lbl8Top: NSLayoutConstraint!
    
    @IBOutlet var priceTop: NSLayoutConstraint!
    @IBOutlet var priceHeight: NSLayoutConstraint!
    @IBOutlet var priceLeading: NSLayoutConstraint!
    @IBOutlet var priceTrailing: NSLayoutConstraint!
    
    @IBOutlet var buyHeight: NSLayoutConstraint!
    @IBOutlet var buyTop: NSLayoutConstraint!
    @IBOutlet var buyLeading: NSLayoutConstraint!
    @IBOutlet var buyTrailing: NSLayoutConstraint!
    
    
    @IBOutlet var paypalTrailing: NSLayoutConstraint!
    @IBOutlet var paypalTop: NSLayoutConstraint!
    @IBOutlet var paypalLeading: NSLayoutConstraint!
    @IBOutlet var paypalHeight: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            introLbl.font = introLbl.font.withSize(30)
            // img1Leading.constant=16.0
            
           /* lbl1Height.constant=60.0
            paypalTrailing.constant=320.0
            paypalLeading.constant=320.0
            
            buyTop.constant=10.0
            paypalTop.constant=10.0
            buyLeading.constant=280.0
            buyTrailing.constant=280.0
            
            lbl2Top.constant=40.0
            lbl1Leading.constant=24.0
            lbl1Height.constant=48.0
            
            lbl4Height.constant=80.0
            
             lbl6Height.constant=80.0
            
            lbl1Trailing.constant=24.0
            
            img1Top.constant=48.0
            img1Weight.constant=15.0
            
            //img1Leading.constant=0.0
            imgFstLeading.constant=16.0
            img2Leading.constant=16.0
            
            img2Width.constant=30.0
            
            img4Top.constant=73.0
            img5Top.constant=40.0
            img6Top.constant=75.0
            img7Top.constant=30.0
            
            
            
            priceTop.constant=40.0
 
 */
            priceLbl.font = priceLbl .font.withSize(20)
            
            lbl1.font = lbl1.font.withSize(20)
            lbl2.font = lbl2.font.withSize(20)
            lbl4.font = lbl4.font.withSize(20)
            lbl5.font = lbl5.font.withSize(20)
            lbl3.font = lbl3.font.withSize(20)
            lbl6.font = lbl6.font.withSize(20)
            lbl7.font = lbl7.font.withSize(20)
            
//            buyHeight.constant=40.0
            
//            paypalHeight.constant=40.0
            
           // buyBtn.font = buyBtn.font.withSize(20)
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
           
           /* introLbl.font = introLbl.font.withSize(14)
            lbl1Top.constant=6.0
            lbl2Top.constant=10.0
            
            img1Top.constant=20.0
            img2Top.constant=23.0
            lbl3Top.constant=6.0
            
            lbl2.font = lbl2.font.withSize(11)
            lbl4.font = lbl4.font.withSize(11)
             lbl5.font = lbl5.font.withSize(10)
             lbl3.font = lbl3.font.withSize(11)
            lbl6.font = lbl6.font.withSize(11)
            lbl7.font = lbl7.font.withSize(11)
            
            lbl6Trailing.constant=8.0
            lbl4Top.constant=5.0
            lbl5Top.constant=5.0
            
            img3Top.constant=10.0
            lbl6Top.constant=1.0
            
            img4Top.constant=10.0
            
            lbl7Top.constant=4.0
            lbl8Top.constant=4.0
            
            priceTop.constant=4.0
            priceLeading.constant=100.0
            priceTrailing.constant=100.0
            
            buyHeight.constant=20.0
             buyLeading.constant=100.0
             buyTrailing.constant=100.0
            buyTop.constant=2.0
            lbl6Height.constant=35.0
            
            paypalHeight.constant=20.0
            paypalLeading.constant=140.0
            paypalTrailing.constant=140.0
            
            */
            
           // buyBtn.font = buyBtn.font.withSize(11)
            
//            lbl2Leading.constant=.0
//            lbl2Trailing.constant=10.0
//            lbl2Top.constant=10.0
        }
            
            
            
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            introLbl.font = introLbl.font.withSize(14)
            
//            lbl1Leading.constant=10.0
//            lbl1Trailing.constant=10.0
//
//           // lbl1Top.font =  UIFont(size: 12)
//
//            lbl1Top.constant=1.0
//
//            lbl6Height.constant=60.0
//
//            lbl2Top.constant=10.0
//            img1Top.constant=10.0
//
            
            
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            lbl1Leading.constant=12.0
//            
//            lbl1Leading.constant=12.0
//            
//            lbl1Leading.constant=12.0
//            
            // lbl6Top.font = lbl6Top.font.withSize(11)
            
            
            //
            //
        }
            
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
            //
        }
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
//
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
   
    changeTabTitleName(title: "CITIZENSHIP")
    
    
    
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
