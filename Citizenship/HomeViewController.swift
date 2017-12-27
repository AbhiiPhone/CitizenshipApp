//
//  HomeViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 11/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet var homeTableVw: UITableView!
    @IBOutlet var tableVwTop: NSLayoutConstraint!
    @IBOutlet var tableVwTrailing: NSLayoutConstraint!
    @IBOutlet var tableVwLeading: NSLayoutConstraint!
    
    
    let imgArray: NSMutableArray = ["img1.jpg","img2.jpg","img2.jpg"]
    
    let topArray: NSArray = ["How to Prepare for Your Citizenship Coaching Test?","Citizenship Coaching Test-What Information Do You Need To Know?","Citizenship Coaching Test-What Information Do You Need To Know?"]
    
    let bottomArray: NSArray = ["Any individual who is applying for the Canadian Citizenship or retaining it needs to pass a citizenship coaching test. The","Any individual who is applying for the Canadian Citizenship or retaining it needs to pass a citizenship coaching test. The","Any individual who is applying for the Canadian Citizenship or retaining it needs to pass a citizenship coaching test. The"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableVw.delegate = self
        homeTableVw.dataSource = self
        
        
//        for family in UIFont.familyNames {
//            print("\(family)")
//
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   \(name)")
//            }
//        }
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
//          //  tableVwTop.constant=1.0
//            tableVwTrailing.constant=1.0
//            tableVwLeading.constant=1.0
            
        }
        
        
//        homeTableVw.delegate=self
//        homeTableVw.dataSource=self
        
//        homeTableVw.tableFooterView = UIView(frame: .zero)
//
//        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
//        navigationController?.navigationBar.topItem?.title = ""
//
        
        //
        //        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
      //  self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
//        self.tabBarController?.navigationController?.navigationBar.isHidden = false
        
        changeTabTitleName(title: "CITIZENSHIP")
        
    }
    
    
    
}

extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imgArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = homeTableVw.dequeueReusableCell( withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        
        cell.topLbl.text = topArray[indexPath.row] as? String
        cell.bottomLbl.text = bottomArray[indexPath.row] as? String
        cell.homeImg.image = UIImage.init(named: imgArray[indexPath.row] as! String)
        self.homeTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
            cell.topLblHeight.constant = 40.0
         
            cell.topLblLeading.constant = 16.0
            cell.topLblTop.constant = 0.0
            
            cell.imgHeight.constant = 300.0
         
            cell.bottomLblLeading.constant = 16.0
            cell.bottomLblWidth.constant = 670.0
         
            cell.arrowTrailing.constant = 16.0
            cell.arrowHeight.constant=25.0
            cell.arrowWidth.constant=30.0
           
            
            cell.topLbl.font = cell.topLbl.font.withSize(22)
            cell.bottomLbl.font = cell.bottomLbl.font.withSize(16)
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
            //
            cell.topLblHeight.constant = 40.0
            
            cell.topLblTop.constant = 0.0
            
            cell.imgHeight.constant = 160.0
            // cell.imgTop.constant=6.0
            
            //                        cell.bottomLblTop.constant = 10.0
            //                        cell.bottomLblLeading.constant = 8.0
            //                        cell.bottomLblHeight.constant = 40.0
            cell.bottomLblWidth.constant = 280.0
            
            cell.arrowTrailing.constant = 16.0
            cell.arrowHeight.constant=15.0
            cell.arrowWidth.constant=20.0
            //                       // cell.arrowLeading.constant = 40.0
            //                        cell.arrowTop.constant = 40.0
            
            cell.topLbl.font = cell.topLbl.font.withSize(12)
            cell.bottomLbl.font = cell.bottomLbl.font.withSize(10)
            
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            cell.topLblHeight.constant = 40.0
            //            cell.topLblTrailing.constant = 8.0
            //            cell.topLblLeading.constant = 8.0
            cell.topLblTop.constant = 0.0
            
            cell.imgHeight.constant = 160.0
            // cell.imgTop.constant=6.0
            
            //                        cell.bottomLblTop.constant = 10.0
            //                        cell.bottomLblLeading.constant = 8.0
            //                        cell.bottomLblHeight.constant = 40.0
            
            cell.arrowTrailing.constant = 16.0
            cell.arrowHeight.constant=15.0
            cell.arrowWidth.constant=20.0
            //                       // cell.arrowLeading.constant = 40.0
            //                        cell.arrowTop.constant = 40.0
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            cell.topLblHeight.constant = 10.0
            //            cell.topLblTrailing.constant = 8.0
            //            cell.topLblLeading.constant = 8.0
            cell.topLblTop.constant = 0.0
            
            cell.imgHeight.constant = 160.0
            // cell.imgTop.constant=6.0
            
            //                        cell.bottomLblTop.constant = 10.0
            //                        cell.bottomLblLeading.constant = 8.0
            //                        cell.bottomLblHeight.constant = 40.0
            
            cell.arrowTrailing.constant = 16.0
            cell.arrowHeight.constant=15.0
            cell.arrowWidth.constant=20.0
            //                       // cell.arrowLeading.constant = 40.0
            //                        cell.arrowTop.constant = 40.0  m6g7t502909
            //
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.getIndex = indexPath.row
        self.tabBarController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
            
            return 400
        }
        else
        {
            return 250
        }
        
    }
}







