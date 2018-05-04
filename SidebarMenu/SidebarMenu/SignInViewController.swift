//
//  SignInViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgViewLogo: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        txtEmail.delegate = self
        txtEmail.tag = 0
        txtEmail.returnKeyType = UIReturnKeyType.next
        txtPassword.delegate = self
        txtPassword.tag = 1
        txtPassword.returnKeyType = UIReturnKeyType.done
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else{
            textField.resignFirstResponder()
            return true;
        }
        return false
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnForgotPasswordPressed(_ sender: UIButton) {
    }
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "LOGGEDIN")
    }
    
}
