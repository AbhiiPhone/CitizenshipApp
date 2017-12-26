//
//  CitizenshipViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 04/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class CitizenshipViewController : UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandHeaderFooterViewDelegate1
{

    @IBOutlet var testTableVw: UITableView!
    
    
//    var selectedRow : Int? = nil
//    
//    var isExapand : Bool = false

    
//    var headingArray : [String]? = ["Canadian Citizenship Test – What is it all about?", "Canadian Citizenship Test – What happens if you fail it?", "Canadian Citizenship Application – Understanding the process", "Canadian Citizenship Test – How to prepare for it?", "Canadian Citizenship Test – How to tackle this multiple choice test?", "Canadian Citizenship– It's Benefits"]
//    
//    Section(question:"Who is the head of the municipal government (Meyor or reeve)?",
//    answer:["You find out for cities, or you can call your local city hall here"],
//    expanded: false),
    
    
   // let targetArray : [Dictionary<String, String>] = [
        
    var target=[
    
        Target(question : "Canadian Citizenship Test – What is it all about?",
         subtitle:["NEW CANADIAN CITIZENSHIP TEST – WHAT IS IT ALL ABOUT?"],
         answer:["The New Canadian Citizenship Test is administrated by the Department of Immigration, Refugees and Citizenship Canada which is required for all applicants who have applied for Canadian Citizenship. The age of the applicant should be 14 to 64. \n To become a legal Canadian Citizen, you need to pass the Canadian Citizenship Test. The test basically shows what you know about Canada and its legal culture. It is usually written, but the administration The test is the last step before the Citizenship ceremony for nearly any person who wants to become a Legal Canadian Citizen. The test is available in both English and French, the official language of Canada."],
        expanded: false),
            
        Target(question:"Canadian Citizenship Test – What happens if you fail it?",
         subtitle:["CANADIAN CITIZENSHIP TEST – WHAT HAPPENS IF YOU FAIL IT?"],
         answer:["If any applicant does not pass the written exam, but fulfills other criteria for citizenship, the administration will schedule for a second test. Thus, the second test will usually take place 4 to 8 weeks after the first test. However, the delay may be longer depends on the result. If the applicant is not available to take the exam on that due date, he or she must inform the CIC department.\n The New Canadian Citizenship Test contains 20 multiple choice questions. The application needs to complete the exam within 30 minutes. He or she must score at least 75% in order to pass the exam. If any applicant fails the test, it takes a few weeks to take another test."],
         expanded: false),
        
        Target(question:"Canadian Citizenship Application – Understanding the process",
        subtitle:["CANADIAN CITIZENSHIP APPLICATION – UNDERSTANDING THE PROCESS"],
        answer:["Applying for Canadian citizenship involves a formal application to citizenship and Immigration Canada (CIC), a citizenship test and sometimes, a citizenship interview. The criteria or requirements for applying Canadian Citizenship are updated with some professional rules and regulations. These are: \n The applicant should have a permanent address, and have been physically present in Canada for at least 1460 days (4 years) in the six years before applying. \n The applicant must be a permanent resident of Canada. He or she should present in Canada at least 183 days during any four calendar years. \n The Application must fulfill the requirements under the Income Tax Act to file income taxes for any four taxation years that are absolutely or partially within the six years. \n The applicant should be capable to speak in English or French. \n The applicant needs to be able to demonstrate in English or French about Canadian responsibilities, its law and legal rights. \n If you fulfill all the requirements of Canadian Citizenship test, you will be sent a notice to attend a ceremony to take the oath of citizenship. It is very important to bring all of your original immigration documents to the ceremony."],
        expanded: false),
        
        Target(question:"Canadian Citizenship Test – How to prepare for it?",
         subtitle:["NEW CANADIAN CITIZENSHIP TEST – HOW TO PREPARE FOR IT?"],
         answer:["The applicant should pass the Canadian Citizenship test, to earn the legal Citizenship in Canada. The whole program is administrated by Citizenship and Immigration Canada (CIC) within a professional method. \n The applicant needs to prepare himself on different topics to pass the test. The test covers many major issues from Discover Canada, the rights and responsibilities of Citizenship. Citizenship classes are generally free or low cost and cover topics such as Canadian Geography, Canadian economics, history, Government, legal rights and responsibilities of Citizenship, its culture as well as current events. The applicant should meet the basic conditions for Canadian Citizenship."],
        expanded: false),
        
        Target(question:"Canadian Citizenship Test – How to tackle this multiple choice test?",
         subtitle:["CANADIAN CITIZENSHIP TEST – HOW TO TACKLE THIS MULTIPLE CHOICE TEST?"],
         answer:["The New Canadian Citizenship Test is available to everyone. The exam is usually written but the administration may ask you to come to an interview. However, there are different efficient ways to tackle the hurdles when the going gets difficult for you during the examination.\n You Can Attempt The Easy Questions:\n Before appearing the examination, an application needs to prepare the details on several topics such as Canadian Geography, economics, history, Government, legal rights and responsibilities of Citizenship, its culture and current events. However, if you feel that things going get difficult, you can avoid the hard questions and move on to the next question. We often do mistakes on exams. If you repeatedly attempt the wrong answers, it would increase the stress level, leave less time for the easy questions and decrease the self confidence and concentration too. If you proficiently practiced the study guide, you can easily attempt at least half of the questions.\n Take Rest For A Minute:\n After completing all the easy questions, you can attempt the tricky questions of Canadian Citizenship test. You can take rest for a minute. Thus, you need to understand the nuances between the answers. It will help you to pick the right answer among wrong answers.\n How to Tackle the Hard Questions:\n You may do not know the right answer while attempting a tricky question. But you have different alternatives and you can eliminate one or two answers by paying attention at how the question is worded. The syntax of the question might trigger the memories of the right clue. Make sure not to take too much time to answer a hard question.\n You Can Use Your Guess Power to Answer Tricky Questions:\n Before attempting a tricky question, make sure to read it properly to assume the right answer. If the assumption does not work, you will have to simply guess the answer. Guessing gives you additional opportunities to get more points."],
        expanded: false),
        
        
        Target(question:"Canadian Citizenship– It's Benefits",
        subtitle:["CANADIAN CITIZENSHIP – BENEFITS"],
        answer:["Once the applicant should have passed the New Canadian Citizenship test, he or she will be considered as a legal citizen in Canada. The applicant can apply for the passport as well. An applicant will get some major benefits such as: \n The applicant will have the facility to work in all jobs or sectors \n The applicant can get involved into the Canadian politics. \n He or she can take participation on voting process. \n The candidate can easily travel anywhere from one place to another. \n He or she will get social advantages. \n The applicant will get counselor support.\n Nevertheless, in order to get a permanent resident status in Canada, the applicant should live in Canada at least two years within a five year period. The Canadian Citizenship gives you the right to travel freely anywhere in Canada, as well as outside of this country whenever the applicant wants."],
       expanded: false),
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = ""
        
        
        testTableVw.delegate=self
        testTableVw.dataSource=self
        
        testTableVw.estimatedRowHeight = 20
        
        testTableVw.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "CITIZENSHIP"
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    
    //MARK :- TABLE VIEW DELEGATES
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
     //  print(target.count)
        return target.count

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return target[section].answer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = testTableVw.dequeueReusableCell( withIdentifier: "CityCell", for: indexPath) as! CityTableViewCell
        
        cell.queNewLbl.text = target[indexPath.section].answer[indexPath.row]
        cell.headingLbl.text = target[indexPath.section].subtitle[indexPath.row]
        
        
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
            
            
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
           
//            cell.headingLbl.font = cell.headingLbl.font.withSize(12)
//            cell.queNewLbl.font = cell.headingLbl.font.withSize(12)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (target[indexPath.section].expanded==false)
        {
            return 0
        }
            
        else
        {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // return 44
        
        if ( UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad )
        {
            return 60
        }
        else
        {
            return 52
        }
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandGovtHeaderFooterView()
        
        header.customInit(title1: target[section].question, target: section, delegate: self as ExpandHeaderFooterViewDelegate1)
        
//        header.textLabel?.te
        
        return header
        
    }
    
    func toggleSection(header: ExpandGovtHeaderFooterView, section: Int) {
        
        target[section].expanded = !target[section].expanded
        
        testTableVw?.beginUpdates()
        
        for i in 0 ..< target[section].answer.count
        {
            testTableVw?.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        
        
        testTableVw?.endUpdates()
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
