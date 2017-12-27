//
//  DetailViewController.swift
//  Citizenship
//
//  Created by @vi on 30/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    @IBOutlet weak var detailTblview: UITableView!
    @IBOutlet weak var showTitlelbl: UILabel!
    
    var isClick = Bool()
    var getIndexPath = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = detailTblview.dequeueReusableCell( withIdentifier: "DetailsViewCell", for: indexPath) as! DetailsViewCell
        self.detailTblview.separatorColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        isClick = true
        getIndexPath = indexPath.row
        self.detailTblview.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (isClick == true)
        {
            if (indexPath.row == getIndexPath)
            {
                return 100
            }
            else
            {
                return 50
            }
        }
        else
        {
            return 50
        }
    }
}



