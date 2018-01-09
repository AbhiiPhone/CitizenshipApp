//
//  CheatSheetsViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 18/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class CheatSheetsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var cheatSheetTableVw: UITableView!
    
    var parameters: [String: String] = [:]
    var jsonFetch = JsonFetchClass()

    
    @IBOutlet var lblTop: NSLayoutConstraint!
    @IBOutlet var lblLeading: NSLayoutConstraint!
    @IBOutlet var lblTrailing: NSLayoutConstraint!
    @IBOutlet var lblHeight: NSLayoutConstraint!
    @IBOutlet var tableVwTop: NSLayoutConstraint!
   
    
    
    var lessonArr = [String]()
    var pdfArr = [String]()
    var cheatArray = NSArray()
    var attachArray = NSArray()

     
    
    
//    @IBAction func pdfBtnAction(_ sender: Any) {
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonFetch.jsonData = self

        cheatSheetTableVw.delegate=self
        cheatSheetTableVw.dataSource=self
        
        cheatSheetTableVw.tableFooterView = UIView(frame: .zero)
        cheatSheetTableVw.rowHeight = UITableViewAutomaticDimension
        cheatSheetTableVw.estimatedRowHeight = 118
        
       
      
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
          
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
               lblLeading.constant=8.0
          //  lblTop.constant=52.0
            lblTrailing.constant=8.0
            lblHeight.constant=32.0
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
//            lblLeading.constant=16.0
//            lblTop.constant=52.0
//            lblTrailing.constant=16.0
//            lblHeight.constant=32.0
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            lblLeading.constant=16.0
            lblTop.constant=10.0
            lblTrailing.constant=16.0
            lblHeight.constant=32.0
            
        }
        
          featchData()
    }

    func featchData()
    {
        parameters = ["actiontype" :  "cheat_sheets",]
        
        print(parameters)
       
        jsonFetch.fetchData(parameters , methodType: "POST", url: " ", JSONName: "cheat_sheets")
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
      self.tabBarController?.navigationItem.title = "CITIZENSHIP"
    }
    
    // MARK: - Table View Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return cheatArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = cheatSheetTableVw.dequeueReusableCell( withIdentifier: "CheatSheetsCell", for: indexPath) as! CheatSheetsTableViewCell
       
        print((cheatArray[indexPath.row] as AnyObject).value(forKey: "title") as! String)
        
        cell.chapterLbl.text = ((cheatArray[indexPath.row] as AnyObject).value(forKey: "title") as! String)
        
        cell.desLbl.text = ((cheatArray[indexPath.row] as AnyObject).value(forKey: "description") as! String)
        cell.desLbl.sizeToFit()
       
        self.cheatSheetTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
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
        
        cell.pdfBtn.addTarget(self, action: #selector(CheatSheetsViewController.pdfBtnAction), for: .touchUpInside)
        
        cell.pdfBtn.tag = indexPath.row

        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("index path => ",indexPath.row)
        
        
        print(attachArray[indexPath.row])
        cheatSheetTableVw.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableViewAutomaticDimension
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableViewAutomaticDimension
//    }
//

    @objc func pdfBtnAction(_ sender : UIButton)
    {
        
        print("Test Index ==> indexpath",sender.tag)
        //  print("Take Test",sender.tag)
        
         print(attachArray[sender.tag])
       // {
            
            //        print("hjdfgkhdj")
            //
            ////      //  UIApplication.shared.openURL(URL(string: ((manualArray[sender.tag] as AnyObject).value(forKey: "pdf") as! String))!)
            //
            //
            //        let getpdfString =  (manualArray[sender.tag] as AnyObject).value(forKey: "pdf") as! String!
            //
            //        _ = NSURL(string:getpdfString! )
            
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            
            hud.mode = MBProgressHUDMode.annularDeterminate
            hud.label.text = "Loading... "
            
            
            let getpdfString =  (attachArray[sender.tag] as! String)
            print(getpdfString)
            
            let destination: DownloadRequest.DownloadFileDestination = { _, _ in
                
                let documentsURL :NSURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
                
                print("**** documentUrl: ",documentsURL)
                
                // let fileURL = documentsURL.appendingPathComponent("\(0).pdf")
                
                let fileURL = documentsURL.appendingPathComponent(((self.cheatArray[sender.tag] as AnyObject).value(forKey: "attachment") as! String).components(separatedBy : "/").last!)
                print(fileURL!)
                
                return (fileURL!, [.removePreviousFile, .createIntermediateDirectories])
            }
            
            
            //    Alamofire.download(getpdfString!,to:destination).response{ response in
            
            Alamofire.download(getpdfString,to:destination).downloadProgress(closure: {(prog) in
                
                hud.progress = Float(prog.fractionCompleted)
                
                
            }).response{ response in
                
                print(response)
                hud.hide(animated:true)
                if response.error == nil,let filePath = response.destinationURL?.path
                {
                    print("***sgs",filePath)
                    
                    let showVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowPDFController") as! ShowPDFController

                 showVC.getDownloadlink = filePath

//                    UIView.transition(with: self.view, duration: 0.5, options: UIViewAnimationOptions.transitionCurlUp,
//                                      animations: {self.view.addSubview(showVC.view)}, completion: nil)
//
//                    showVC.view.frame = CGRect(x: 0, y: 64 , width: self.view.frame.size.width, height: self.view.frame.size.height)

                      self.navigationController?.pushViewController(showVC, animated: true)
                    
                }
                
            }
            
        }
        
}
extension CheatSheetsViewController : jsonDataDelegate{
    
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
            
            print(data)
            print(((data as! NSDictionary).value(forKey: "success") as! String))
            
            attachArray = (((data as! NSDictionary).value(forKey: "chapter") as! NSArray).value(forKey: "attachment") as! NSArray)
            
            
         cheatArray = ((data as! NSDictionary).value(forKey: "chapter") as! NSArray)
            
            print(cheatArray)
            
            print(attachArray)
            
         //   print(((cheatArray[0] as AnyObject).value(forKey: "attachment") as! String))
            
            cheatSheetTableVw.reloadData()
            
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

