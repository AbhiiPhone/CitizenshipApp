//
//  TimePeriodViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 19/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class TimePeriodViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var timePeriodTableVw: UITableView!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
    var yrArray = NSArray()
  //  var despArray = NSMutableArray()
    
    @IBOutlet var topLbl: UILabel!
    @IBOutlet var desTopLbl: UILabel!
    
    @IBOutlet var timeTop: NSLayoutConstraint!
    @IBOutlet var timeTrailing: NSLayoutConstraint!
   
    //@IBOutlet var topLbl: UILabel!
    //@IBOutlet var desLblTop: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePeriodTableVw.delegate=self
        timePeriodTableVw.dataSource=self
        
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
        jsonFetch.jsonData = self
        
       // MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
        
        
        
        parameters = ["actiontype" :  "date_list",]
        
        print(parameters)
        
        
        let strLink =  "http://bestauctionsoftware.com/citi/json.php"
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: strLink, JSONName: "date_list")
        
        
        
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
           

        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
           
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
           
            

        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
           
            
        }
         UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]

       
        timePeriodTableVw.rowHeight = UITableViewAutomaticDimension
        timePeriodTableVw.estimatedRowHeight = 78
        
        
        // Do any additional setup after loading the view.
    }

   
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return yrArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = timePeriodTableVw.dequeueReusableCell( withIdentifier: "TimePeriodCell", for: indexPath) as! TimePeriodTableViewCell
        
        cell.yrLbl.text = ((yrArray[indexPath.row] as AnyObject).value(forKey: "time_period") as! String)
        cell.despLbl.text = ((yrArray[indexPath.row] as AnyObject).value(forKey: "description") as! String)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        self.timePeriodTableVw.separatorColor = UIColor.clear
        
        
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "f5f7df")
            
            
        }
        else
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "e9ecdb")
        }
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
           
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
          
            }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
          

            }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
          
        }
        
        
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // UITableViewAutomaticDimension
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 90
        }
        else
        {
            return 75
        }
    }
   
}

extension TimePeriodViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
       
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            //   showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1, selectorMethod: ())
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            
            yrArray = ((data as! NSDictionary).value(forKey: "date") as! NSArray)
            
            timePeriodTableVw.reloadData()
            
           
            
        }
        
    }
    
    
    func showAlertMessage(alertTitle: String, alertMsg : String)
    {
        let alertController = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func didFailedtoReceiveData(_ error: Error) {
        
        print(error)
        
        //  showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1, selectorMethod:())
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
