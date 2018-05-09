//
//  PaymentAddressViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class PaymentAddressViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet weak var txtzip: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtcountry: UITextField!
    @IBOutlet weak var txttelephone: UITextField!
    @IBOutlet weak var txtaddress2: UITextField!
    @IBOutlet weak var txtaddress1: UITextField!
    @IBOutlet weak var txtlname: UITextField!
    @IBOutlet weak var txtfname: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        txtfname.delegate = self
        txtfname.tag = 0
        txtfname.returnKeyType = UIReturnKeyType.next
        txtlname.delegate = self
        txtlname.tag = 1
        txtlname.returnKeyType = UIReturnKeyType.next
        txtaddress1.delegate = self
        txtaddress1.tag = 2
        txtaddress1.returnKeyType = UIReturnKeyType.next
        txtaddress2.delegate = self
        txtaddress2.tag = 3
        txtaddress2.returnKeyType = UIReturnKeyType.next
        txttelephone.delegate = self
        txttelephone.tag = 4
        txttelephone.returnKeyType = UIReturnKeyType.next
        txtcountry.delegate = self
        txtcountry.tag = 5
        txtcountry.returnKeyType = UIReturnKeyType.next
        txtcity.delegate = self
        txtcity.tag = 6
        txtcity.returnKeyType = UIReturnKeyType.next
        txtzip.delegate = self
        txtzip.tag = 7
        txtzip.returnKeyType = UIReturnKeyType.done
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.endEditing(true)
    }
    let pickerComponents = ["Addrees", "Locker"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerComponents[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnContinuePressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentDetailsViewController") as? PaymentDetailsViewController {
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
