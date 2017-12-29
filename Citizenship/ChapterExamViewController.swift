//
//  ChapterExamViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 21/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class ChapterExamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var chapterTableVw: UITableView!
  
    @IBOutlet weak var selectedBtn: UIButton!
    @IBOutlet var chapterView: UIView!
    
    @IBOutlet weak var selectTitlelbl: UILabel!
    let chapterArray: NSMutableArray = ["Introduction","Chapter1_Basic Rights and Responsibilities Of Canadian Citizenship","Chapter2_About Us","Chapter3_History Of Canada","Chapter4_Modernization Of Canada","Chapter5_ Government Of Canadian","Chapter6_Federal Election Process","Chapter7_The Justice System of Canada","Chapter8_Canada and its Symbols","Chapter9_Econimy Of Canada","Chapter10_Regions of Canada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chapterTableVw.delegate=self
        chapterTableVw.dataSource=self
      
        
        chapterView.isHidden=true
        //setNavigationBarItem()
        
        chapterTableVw.layer.borderWidth = 1;
        chapterTableVw.layer.shadowRadius = 12.0
        chapterTableVw.layer.cornerRadius = 5
        chapterTableVw.layer.borderColor = UIColor.darkGray.cgColor
            }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
          return chapterArray.count
        
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = chapterTableVw.dequeueReusableCell( withIdentifier: "ChapterExamCell", for: indexPath) as! ChapterExamTableViewCell
        
        cell.chapterLbl.text = chapterArray[indexPath.row] as? String
        
        self.chapterTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        
        if(indexPath.row == 10)
        {
            cell.dividerView.isHidden = true
            
        }
        else
        {
            cell.dividerView.isHidden = false
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selectedBtn.setTitle(chapterArray[indexPath.row] as? String, for: .normal)
        
        selectTitlelbl.text = (chapterArray[indexPath.row] as! String)
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailChapterExamController") as! DetailChapterExamController
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        chapterView.isHidden = true
        chapterTableVw.isHidden = true
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
        
        
    }
    
    @IBAction func selectedBtnAction(_ sender: Any) {
        
        chapterView.isHidden=false
        UIView.transition(with: self.view, duration: 1.5, options: UIViewAnimationOptions.transitionCurlUp,
                          animations: {self.view.addSubview(self.chapterView)}, completion: nil)
        
        self.chapterTableVw.isHidden = false
    }
    

}
