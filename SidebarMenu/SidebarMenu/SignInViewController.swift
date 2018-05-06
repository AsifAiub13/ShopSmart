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
        let alertController = UIAlertController(title: "Forgot Password", message: "Please enter your phone number to send new password", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Phone Number"
        }
        let saveAction = UIAlertAction(title: "Send", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        if(self.txtEmail.text == "test@mail.com" && self.txtPassword.text == "0000"){
            self.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "LOGGEDIN")
        }else{
            let alertController = UIAlertController(title: "Sign In", message: "Please type test@mail.com in email and 0000 in password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}
