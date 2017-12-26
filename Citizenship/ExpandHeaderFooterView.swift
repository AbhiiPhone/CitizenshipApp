//
//  ExpandHeaderFooterView.swift
//  baseApp
//
//  Created by Amit Kumar Poreli on 31/08/17.
//  Copyright © 2017 Micronix. All rights reserved.
//

import UIKit

protocol  ExpandHeaderFooterViewDelegate {
    
    func toggleSection(header:ExpandHeaderFooterView,section:Int)
}

class ExpandHeaderFooterView: UITableViewHeaderFooterView {

    var delegate:ExpandHeaderFooterViewDelegate?
    var section:Int!
    
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier:reuseIdentifier )
        self.addGestureRecognizer(UITapGestureRecognizer(target:self,action:#selector(selectHeaderActinon)))
    }
    
    
    @objc func selectHeaderActinon(gestureRecognizer:UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandHeaderFooterView
        delegate?.toggleSection(header: self, section: cell.section)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(title: String, section: Int, delegate: ExpandHeaderFooterViewDelegate)
    {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }

    override func layoutSubviews() {
     
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.darkGray
      
       // self.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "AAAAAA")
        self.contentView.backgroundColor = UIColor.lightGray
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            self.textLabel?.font = UIFont(name: "Proximanova-bold",size: 17.0)
           
            }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
           self.textLabel?.font = UIFont(name: "Proximanova-bold",size: 10.0)
  
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
             self.textLabel?.font = UIFont(name: "Proximanova-bold",size: 12.0)
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
          self.textLabel?.font = UIFont(name: "Proximanova-bold",size: 14.0)
            
        }
        
        
        
    }
    
}
