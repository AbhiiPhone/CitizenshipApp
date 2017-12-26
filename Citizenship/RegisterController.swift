//
//  RegisterController.swift
//  Citizenship
//
//  Created by Amit Kumar Poreli on 13/12/17.
//  Copyright © 2017 Basir. All rights reserved.
//

import UIKit

class RegisterController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmTxtField: UITextField!
    @IBOutlet weak var passwordEyeBtn: UIButton!
    @IBOutlet weak var confoPasswordEyeBtn: UIButton!
    @IBOutlet weak var alreadylblLeadingCons: NSLayoutConstraint!
    var isPasswordBtnClick = Bool()
    var isConfoPasswordEyeBtn = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       userTxtField.delegate = self
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        confirmTxtField.delegate = self
        
        isPasswordBtnClick = false
        isConfoPasswordEyeBtn = false
        
        
        if UIDevice.Display.typeIsLike == UIDevice.DisplayType.ipad {
            
            alreadylblLeadingCons.constant = 230
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone5{
            
             alreadylblLeadingCons.constant = 30
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphoneSE{
            
          alreadylblLeadingCons.constant = 30
            
        }
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6{
            
            
            
        }
            
        else if UIDevice.Display.typeIsLike == UIDevice.DisplayType.iphone6plus{
            
            
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "CITIZENSHIP"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.navigationBar.topItem?.title = " "
        
        self.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: "#FFFFFF")
        
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    @IBAction func passwordEyeBtnAction(_ sender: Any) {
        
        if(isPasswordBtnClick == true) {
            passwordTxtField.isSecureTextEntry = false
            isPasswordBtnClick = false
        } else {
            passwordTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        }
        
    }
    @IBAction func confoPasswordEyeBtnAction(_ sender: Any) {
        
        if(isConfoPasswordEyeBtn == false) {
            confirmTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        } else {
            confirmTxtField.isSecureTextEntry = true
            isPasswordBtnClick = true
        }
        
    }
    
    @IBAction func registerBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginBtnAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == userTxtField)
        {
            emailTxtField.becomeFirstResponder()
        }
        else if(textField == emailTxtField)
        {
            passwordTxtField.becomeFirstResponder()
        }
        else if(textField == passwordTxtField)
        {
            confirmTxtField.becomeFirstResponder()
        }
        else
        {
            confirmTxtField.resignFirstResponder()
        }
        return true
    }
}
