//
//  SimulationTestViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 19/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class SimulationTestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()
    
  
    @IBOutlet var tableVwTop: NSLayoutConstraint!
    
    @IBOutlet var simulationTableVw: UITableView!
    
    var simulationArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonFetch.jsonData = self
        
         if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
           

        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
          
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
        }
        
        simulationTableVw.delegate=self
        simulationTableVw.dataSource=self
        
        simulationTableVw.tableFooterView = UIView(frame: .zero)

        featchData()
        
    }

    
    func featchData()
    {
        parameters = ["actiontype" :  "simulation_list",]
       
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "simulation_list")
         MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
       
        
    }
    
    // MARK: - Table View Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
          return simulationArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = simulationTableVw.dequeueReusableCell( withIdentifier: "SimulationCell", for: indexPath) as! SimulationTableViewCell
        
        cell.testBtn.addTarget(self, action: #selector(testBtnAction(_:)), for:.touchUpInside)
        
         cell.setNameLbl.text = ((simulationArray[indexPath.row] as AnyObject).value(forKey: "chapter") as! String)
        
         cell.partLbl.text = ((simulationArray[indexPath.row] as AnyObject).value(forKey: "part") as! String)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        self.simulationTableVw.separatorColor = UIColor.clear
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
        }

        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
          
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
           
            
        }
        
        
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "f5f7df")
        }
        else
        {
            cell.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "e9ecdb")
        }
        
        
        cell.testBtn.addTarget(self, action: #selector(SimulationTestViewController.testBtnAction), for: .touchUpInside)
        cell.testBtn.tag = indexPath.row

        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            
            return 80
        }
        else
        
        {
            return 60
        }
    }
    
    @objc func testBtnAction(_ sender : UIButton)
        {
     
            let timeVC = self.storyboard?.instantiateViewController(withIdentifier: "TimePeriodViewController") as! TimePeriodViewController
            
            self.tabBarController?.navigationController?.pushViewController(timeVC, animated: true)
    }
    

}
extension SimulationTestViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
       
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
              showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1)
            
            
        }
        else{  //((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "reviews") as! NSArray
            
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            
       simulationArray = ((data as! NSDictionary).value(forKey: "simulation_list") as! NSArray)
            
            simulationTableVw.reloadData()
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
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
        
         showAlert(title: "Error", message: "Something going wrong try again !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}

