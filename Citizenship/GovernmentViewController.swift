//
//  GovernmentViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 20/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class GovernmentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ExpandHeaderFooterViewDelegate
{

    @IBOutlet var topLbl: UILabel!
    @IBOutlet var desTopLbl: UILabel!
  
    @IBOutlet var govtTableVw: UITableView!
    
    var sections=[
    
        Section(question:"Who is the Head of State?",
                answer:["The Sovereign (Her Majesty Queen Elizabeth II)"],
                expanded: false),
        
        Section(question:"What is the name of representative of the Queen of Canada, the Governor General?",
                answer:["David Johnston"],
                expanded: false),
        
        Section(question:"What is the name of the Head of Canadian Government, the Prime Minister?",
                answer:["Justin Trudeau"],
                expanded: false),
        
        Section(question:"What is the name of political party in power in Canada?",
                answer:["Liberal Party of Canada"],
                expanded: false),
        
        Section(question:"What is the name of the Leader of the Opposition?",
                answer:["Rona Ambrose (interim leader)"],
                expanded: false),
        
        Section(question:"What is the name of the party representing Her Majesty’s Loyal Opposition?",
                answer:["Conservative Party of Canada"],
                expanded: false),
        
        Section(question:"What are the names of the other opposition parties and leaders in Canada?",
                answer:["Find out here"],
                expanded: false),
        
        Section(question:"Who are your Members of Parliament (MP) in Ottawa?",
                answer:["Find out by typing your postal code here"],
                expanded: false),
        
        Section(question:"Who is your federal electoral district?",
                answer:["Find out by typing your postal code here"],
                expanded: false),
        
        Section(question:"Who is the head of the municipal government (Meyor or reeve)?",
                answer:["You find out for cities, or you can call your local city hall here"],
                expanded: false),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        govtTableVw.delegate=self
        govtTableVw.dataSource=self
        
//        self.title="CITIZENSHIP"
//        navigationController?.navigationBar.topItem?.title = ""
        
//        self.title = "CITIZENSHIP"
//        navigationController?.navigationBar.topItem?.title = ""
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
           
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
         
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
          
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
           
            
        }
        
        
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = "CITIZENSHIP"
        navigationController?.navigationBar.topItem?.title = " "
        
    }

   
    
    //MARK:- Table View Delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(sections[section].answer.count)
       return sections[section].answer.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = govtTableVw.dequeueReusableCell( withIdentifier: "GovtCell", for: indexPath) as! GovtTableViewCell
        
        cell.queLbl.text = " " + " " + " " + sections[indexPath.section].answer[indexPath.row]
        
        
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
     
        if (sections[indexPath.section].expanded==false)
        {
            return 0
        }
            
        else
        {
            return 60
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
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ExpandHeaderFooterView()
        
        header.customInit(title: sections[section].question, section: section, delegate: self as ExpandHeaderFooterViewDelegate)
        return header
        
    }
    func toggleSection(header: ExpandHeaderFooterView, section: Int) {
        
        sections[section].expanded = !sections[section].expanded
        
        govtTableVw?.beginUpdates()
        
        for i in 0 ..< sections[section].answer.count
        {
            govtTableVw?.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        
        
        govtTableVw?.endUpdates()
    }
   

}
