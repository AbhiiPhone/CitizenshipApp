//
//  ExpandGovtHeaderFooterView.swift
//  Citizenship
//
//  Created by MAC MINI3 on 09/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

protocol  ExpandHeaderFooterViewDelegate1 {
    
    func toggleSection(header:ExpandGovtHeaderFooterView,section:Int)
}

class ExpandGovtHeaderFooterView: UITableViewHeaderFooterView {

    var delegate:ExpandHeaderFooterViewDelegate1?
    var target:Int!
    
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier:reuseIdentifier )
        self.addGestureRecognizer(UITapGestureRecognizer(target:self,action:#selector(selectHeaderActinon1)))
    }
    
    
    @objc func selectHeaderActinon1(gestureRecognizer:UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandGovtHeaderFooterView
        delegate?.toggleSection(header: self, section: cell.target)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(title1: String, target: Int, delegate: ExpandHeaderFooterViewDelegate1)
    {
        self.textLabel?.text = title1
        self.target = target
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.black
        self.textLabel?.font = UIFont(name: "proximanova-regular-webfont",
                                      size: 10.0)
        
//        self.textLabel?.lineBreakMode = .byWordWrapping
//        self.textLabel?.numberOfLines = 2
        
       // self.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "AAAAAA")
        
        self.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "FFFFFF")
        
        }


}
