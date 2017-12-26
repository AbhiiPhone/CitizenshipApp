//
//  Menu_SliderViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

protocol sliderIndexDelegate1 {
    func getSliderIndexnew(index: NSInteger) -> Void
    func viewButtonClicked(isTrue: Bool) -> Void
}

protocol GetCellIndex1 {
    
    // func didSelectSettingCell(_ section : Int, row : Int) -> Void
    func didSelectSettingCell(row : Int) -> Void
}

class Menu_SliderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet var menuSliderTableVw: UITableView!
    
    let menuArray: NSArray = ["Home","Purchase","FAQ","Free Tests","Citizenship Test Info", "Blog","Contact Us","Terms and Condition","Privacy Policy","Login"]
    
    let imageArray: NSArray = ["mHome.png","mPurchase.png","mFaq.png","mFreeTest.png","mInfo.png", "mBlog.png","mContact.png","mTerm.png","mPrivacy.png","mLogin.png"]

 var sliderDelegate1: sliderIndexDelegate1?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuSliderTableVw.delegate=self
        menuSliderTableVw.dataSource=self
        
      
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = menuSliderTableVw.dequeueReusableCell( withIdentifier: "Menu_SliderCell", for: indexPath) as! Menu_SliderTableViewCell
        
        cell.titleLbl.text = menuArray[indexPath.row] as? String
        cell.imgVw.image = UIImage.init(named: imageArray[indexPath.row] as! String)
        self.menuSliderTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.sliderDelegate1?.getSliderIndexnew(index: indexPath.row)
        print("index path => ",indexPath.row)
        
        
        if indexPath.row == 0 {
            
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        }
        else if indexPath.row == 1 {
            
            let purchaseVC = self.storyboard?.instantiateViewController(withIdentifier: "PurchaseViewController") as! PurchaseViewController
            
            self.navigationController?.pushViewController(purchaseVC, animated: true)
            
        }
                
                else if indexPath.row == 5 {

            let timeVC = self.storyboard?.instantiateViewController(withIdentifier: "TimePeriodViewController") as! TimePeriodViewController
            
            self.navigationController?.pushViewController(timeVC, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
            
            return 80
            
            
        }
        else
        {
             return 60
        }
       
    }
    
    @IBAction func viewButtonAction1(_ sender: Any) {
        
        self.sliderDelegate1?.viewButtonClicked(isTrue: true)
    }

   

}
