//
//  PaymentDetailsViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class PaymentDetailsViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtCVC: UITextField!
    @IBOutlet weak var txtExpiry: UITextField!
    @IBOutlet weak var txtCardNo: UITextField!
    @IBOutlet weak var txtCardHolder: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        txtCardHolder.delegate = self
        txtCardHolder.tag = 0
        txtCardHolder.returnKeyType = UIReturnKeyType.next
        txtCardNo.delegate = self
        txtCardNo.tag = 1
        txtCardNo.returnKeyType = UIReturnKeyType.next
        txtExpiry.delegate = self
        txtExpiry.tag = 2
        txtExpiry.returnKeyType = UIReturnKeyType.next
        txtCVC.delegate = self
        txtCVC.tag = 3
        txtCVC.returnKeyType = UIReturnKeyType.done
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
    
    @IBAction func btnContinuePressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinalPaymentTableViewController") as? FinalPaymentTableViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
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
