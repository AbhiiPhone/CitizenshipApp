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
        
        parameters = ["actiontype" :  "blog_title"]
    
        print(parameters)
        
        jsonFetch.jsonData = self
        
        let strLink =  "http://bestauctionsoftware.com/citi/json.php"
        
        jsonFetch.fetchData(parameters , methodType: "POST", url: strLink, JSONName: "blog_title")
        
        
        

        

        
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
        // Do any additional setup after loading the view.
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
        
        
        cell.blogLbl.text = ((blogArray[indexPath.row] as AnyObject).value(forKey: "title") as! String)
       
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("index path => ",indexPath.row)
        
            let blogDetail = self.storyboard?.instantiateViewController(withIdentifier: "BlogDetailsViewController") as! BlogDetailsViewController
        
        if(indexPath.row==0)
        {
           p=idArray[indexPath.row] as! String
            print(p)
        }
       else if(indexPath.row==1)
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }

        else if(indexPath.row==2)
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }
        else if(indexPath.row==3)
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }
        else if(indexPath.row==4)
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }
        else if(indexPath.row==5)
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }
        else
        {
            p=idArray[indexPath.row] as! String
            print(p)
        }


        

        
        
        
          // blogDetail?.id = idArray[indexPath.row] as! String
        
          print(idArray[indexPath.row])
        
          //  blogDetail?.id = idArray[indexPath.row] as! String
        
          //  blogDetail?.id = p as! String
        
      // blogDetail?.id = idArray as! String
        
      
        
      // print (blogDetail?.id)
       //
        
        blogDetail.id = idArray[indexPath.row] as! String
        
            self.navigationController?.pushViewController(blogDetail, animated: true)
            
        
    }


    }
    

extension BlogViewController : jsonDataDelegate{
    
    func didReceiveData(_ data: Any, jsonName: String) {
        
        print(jsonName)
        
        print(data)
        
        /* Calling Serially as following
         
         1. FilterData
         2. Reviewsdata
         3. Bookie Slides
         
         */
        
        if data as? String ==  "NO INTERNET CONNECTION" {
            
            DispatchQueue.main.async {
                
                MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
            }
            
            //   showAlert(title: "Network !", message: "Check your internet connection please", noOfButton: 1, selectorMethod: ())
            
            
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
        
        //  showAlert(title: "Error", message: "Something is not going right !", noOfButton: 1, selectorMethod:())
        
        DispatchQueue.main.async {
            
            MBProgressHUD.hide(for: (self.navigationController?.view)!, animated: true)
        }
    }
    
    
}
