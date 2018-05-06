//
//  MilkDetailViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class MilkDetailViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var pickerNumber: UIPickerView!
    @IBOutlet weak var btnAddToCart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerNumber.dataSource = self
        pickerNumber.delegate = self
        // Do any additional setup after loading the view.
        let editImage    = UIImage(named: "cart")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.didTapSearchButton))
        navigationItem.rightBarButtonItems = [searchButton,editButton]
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        
    }
    
    @objc func didTapSearchButton(sender: AnyObject){
        
    }
    let pickerComponents = ["1", "2", "3", "4"]
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
    
    @IBAction func btnAddToCartPressed(_ sender: UIButton) {
        let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
        let navCtrl = UINavigationController(rootViewController: newView2)
        navCtrl.navigationBar.barTintColor = UIColor.black
        navCtrl.navigationBar.tintColor = UIColor.white
        self.present(navCtrl, animated: true, completion: nil)
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
