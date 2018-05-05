//
//  VerificationViewControllerVerificationViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var txtVerificationCode: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnVerifyPressed(_ sender: UIButton) {
        if(self.txtVerificationCode.text == "0000"){
            self.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "LOGGEDIN")
        }else{
            let alertController = UIAlertController(title: "Verification", message: "Please type 0000", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    @IBAction func btnCancelPressed(_ sender: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LoginViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
