//
//  BlogViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class BlogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var blogTableVw: UITableView!
    
    var blogDetail: BlogDetailsViewController?
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()

    //var p:Int=0
    
    var p:String=""
    
    
    var blogArray = NSArray()
    var idArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blogTableVw.delegate=self
        blogTableVw.dataSource=self
        
        
       // jsonFetch.jsonData = self
        blogTableVw.tableFooterView = UIView(frame: .zero)
        
       
        featchData()
        
  
//        self.title = "CITIZENSHIP"
//        navigationController?.navigationBar.topItem?.title = " "
//        navigationController?.navigationBar.tintColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    func featchData()
    {
        parameters = ["actiontype" :  "blog_title"]
        
       
        jsonFetch.jsonData = self
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "blog_title")
        
    }
    

   
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      
        return blogArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = blogTableVw.dequeueReusableCell( withIdentifier: "BlogCell", for: indexPath) as! BlogTableViewCell
        
         cell.titleLbl.text = ((blogArray[indexPath.row] as AnyObject).value(forKey: "title") as! String)
         cell.titleImg.sd_setImage(with: URL(string: ((blogArray[indexPath.row]) as AnyObject).value(forKey: "image") as! String), placeholderImage: UIImage(named:""))
       
        self.blogTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("index path => ",indexPath.row)
        
        let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "BlogDetailsViewController") as! BlogDetailsViewController
       
        blogDetail.id = idArray[indexPath.row] as! String
        blogDetail.getSelectedIndex = indexPath.row
        blogDetail.getImglink =  (((blogArray[indexPath.row]) as AnyObject).value(forKey: "image") as! String)
        self.navigationController?.pushViewController(blogDetail, animated: true)
            
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            return 500
        }
//        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
//        }
//
//        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
//
//        }
//        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
//
//        }

        else
        
        {
            return 320
        }
    }

    }
    

extension BlogViewController : jsonDataDelegate{
    
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
            
            blogArray = ((data as! NSDictionary).value(forKey: "data") as! NSArray)
            
            
            
            idArray = (((data as! NSDictionary).value(forKey: "data") as! NSArray).value(forKey: "id") as! NSArray)
            
            
            print(idArray)
            
           // print(idArray[indexPath.row])
            
           // print(((blogArray as AnyObject).value(forKey: "id") as! String))
            
            
            
         //   print(((blogArray[tableView.tag] as AnyObject).value(forKey: "id") as! String))
            
            blogTableVw.reloadData()
            
            
            
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
        
          showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1)
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
