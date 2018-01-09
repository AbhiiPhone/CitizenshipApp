//
//  FaqViewController.swift
//  Citizenship
//
//  Created by Basir Alam on 12/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class FaqViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var faqTableVw: UITableView!
    var selectedRow : Int? = nil
    
    let questionArray: NSArray = ["Why to Choose Citizenship Coaching Test?","How Can I Get My Money Back?","Who Can Opt For The Test?","What You Should Know About The Test?","How Many Questions Are There In The Citizenship Coaching Test?","How Much Time Do I Have To Finish The Test?","What Will Happen If I Fail The Test?","What Will Happen If I Pass The Test?","How Can I Prepare For The Test?"]
    let answarArray: NSArray = ["Citizenship Coaching helps you to pass your Canadian Citizenship test to become a Canadian Citizen. Our aim is to help people pass their citizenship test. We provide the best learning program so that the user can easily pass the test with 100% satisfaction.","If you are not satisfied with our training program, please let us know. We will cancel your order and issue you a full refund.","The individuals who are between the ages of 14 to 64 can apply for the Citizenship Coaching test.","The Canadian citizenship test is based on the study guide that is “Discover Canada: The Rights and responsibilities of Citizenship”. Citizenship Coaching test consists of 20 multiple choice questions that you will have to answer in 30 minutes. If you have 5 wrong answers, you will fail the test. You need to score at least 75% to pass the exam. People who are between the ages of 14-64 can apply for this citizenship test.","There are 20 multiple choice questions in a single test.","You have 30 minutes to attempt all the questions.","If you failed the test, but you have met all the citizenship criteria, you will be given a date, to rewrite the test. Your test will take place 4-8 weeks later after your first test, but be aware the delay might be longer.","If you pass the test and meet other requirements for citizenship, you will be asked to attend a ceremony and take the oath of citizenship. You will become a citizen of Canada after the ceremony. The ceremony usually takes place 1-3 months after your test.","If you are applicable for the test, you need to study thoroughly about the Discover Canada, its detail information such as history, law, geography, political system, identity and most importantly Rights and responsibilities of citizenship."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faqTableVw.delegate=self
        faqTableVw.dataSource=self
        
        faqTableVw.rowHeight = UITableViewAutomaticDimension
        faqTableVw.estimatedRowHeight = 20
        
        faqTableVw.tableFooterView = UIView(frame: .zero)
        
      

        // Do any additional setup after loading the view.
        
    }

   
    
    override func viewWillAppear(_ animated: Bool) {
        
      
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
       
    }
    

    
    
    // MARK: -Table View Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return questionArray.count
        
       // return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = faqTableVw.dequeueReusableCell( withIdentifier: "FaqCell", for: indexPath) as! FaqTableViewCell
        cell.qusLbl.text = questionArray[indexPath.row] as? String
        cell.ansLbl.text = answarArray[indexPath.row] as? String
        
        self.faqTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
         
            //cell.qusHeight.constant=60.0
             cell.qusWidth.constant = 650
          // cell.ansBackgroundImg.layer.cornerRadius=10
            cell.ansBackgroundImg.layer.masksToBounds = true
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
            cell.ansBackgroundImg.layer.cornerRadius=5
            cell.ansBackgroundImg.layer.masksToBounds = true
            cell.qusWidth.constant = 250
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
            cell.ansBackgroundImg.layer.cornerRadius=5
            cell.ansBackgroundImg.layer.masksToBounds = true
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
        
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("index path => ",indexPath.row)
        
        selectedRow = indexPath.row as Int

        faqTableVw.reloadData()
        
    }

    

    

}
