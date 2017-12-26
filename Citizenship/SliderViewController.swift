//
//  SliderViewController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 26/09/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

protocol sliderIndexDelegate {
    func getSliderIndex(index: NSInteger) -> Void
    func viewButtonClicked(isTrue: Bool) -> Void
}

protocol GetCellIndex {
    
    // func didSelectSettingCell(_ section : Int, row : Int) -> Void
    func didSelectSettingCell(row : Int) -> Void
}


class SliderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet var sliderTableVw: UITableView!
    let sliderArray: NSArray = ["Dashboard","Study Material","Cheat Sheets","Chapter Exams","Simulation Test", "Time Periods","Government","Support","Logout"]
    
    let imgArray: NSArray = ["mDashboard.png","mStudyMaterial.png","mCheatSheets.png","mChapterExams.png","mSimulationTest.png", "mTimePeriods.png","mGovernment.png","mSupport.png","mLogout.png"]
    
    var sliderDelegate: sliderIndexDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderTableVw.delegate=self
        sliderTableVw.dataSource=self

        // Do any additional setup after loading the view.
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sliderArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sliderTableVw.dequeueReusableCell( withIdentifier: "SliderCell", for: indexPath) as! SliderTableViewCell
        
         self.sliderTableVw.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
     //  self.sliderTableVw.sel
        
        cell.sliderAdminLbl.text = sliderArray[indexPath.row] as? String
        cell.sliderAdminImg.image = UIImage.init(named: imgArray[indexPath.row] as! String)
        
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.sliderDelegate?.getSliderIndex(index: indexPath.row)
        print("index path => ",indexPath.row)
        
        
        if indexPath.row == 0 {
            
            let dashboardVC = self.storyboard?.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
            self.navigationController?.pushViewController(dashboardVC, animated: true)
            
       }
        else if indexPath.row == 1 {
            
            let studyVC = self.storyboard?.instantiateViewController(withIdentifier: "StudyMaterialViewController") as! StudyMaterialViewController
            
            self.navigationController?.pushViewController(studyVC, animated: true)
            
        }
        else if indexPath.row == 2 {

            
            
            let sheetVC = self.storyboard?.instantiateViewController(withIdentifier: "CheatSheetsViewController") as! CheatSheetsViewController
            
            self.navigationController?.pushViewController(sheetVC, animated: true)
            
        }
        else if ((indexPath.row == 4)||(indexPath.row == 3)){
        
            let simulationVC = self.storyboard?.instantiateViewController(withIdentifier: "SimulationTestViewController") as! SimulationTestViewController
            
            self.navigationController?.pushViewController(simulationVC, animated: true)
            
        }
        else if  indexPath.row == 6 {
        
            let govtVC = self.storyboard?.instantiateViewController(withIdentifier: "GovernmentViewController") as! GovernmentViewController
        
            self.navigationController?.pushViewController(govtVC, animated: true)
        
            }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad
        {
              return 80
        
        }
        else
        {
            return 50
        }
    }
    

}
