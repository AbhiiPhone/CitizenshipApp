//
//  AudioViewController.swift
//  Citizenship
//
//  Created by MAC MINI3 on 17/10/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class AudioViewController: UIViewController{
    
    @IBOutlet var audioVw: UIWebView!
    
    var pushValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print("\(pushValue)")

        // Do any additional setup after loading the view.
        
        
      // audioVw.loadRequest(URLRequest(url: URL(string: pushValue)!))//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
