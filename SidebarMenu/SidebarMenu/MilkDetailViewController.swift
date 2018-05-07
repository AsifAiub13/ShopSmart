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
    var badgeValueUpdate = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerNumber.dataSource = self
        pickerNumber.delegate = self
        // Do any additional setup after loading the view.
        let editImage    = UIImage(named: "cart")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        
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
        badgeValueUpdate = badgeValueUpdate + 1
        UserDefaults.standard.set(badgeValueUpdate, forKey: "badgeValue")
        self.badgeShow()
    }
    
    func badgeShow() {
        let badgeLbl = UILabel(frame: CGRect(x: 16, y: -2, width: 18, height: 18))
        badgeLbl.backgroundColor = UIColor.red
        badgeLbl.textColor = UIColor.white
        badgeLbl.textAlignment = .center
        badgeLbl.layer.cornerRadius = 9.0
        badgeLbl.layer.masksToBounds = true
        badgeLbl.text = String(badgeValueUpdate)
        let notificationBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        notificationBtn.setBackgroundImage(UIImage(named: "cart"), for: .normal)
        notificationBtn.setTitle("", for: .normal)
        notificationBtn.addTarget(self, action: #selector(self.onClickAction), for: .touchUpInside)
        notificationBtn.addSubview(badgeLbl)
        let notificationBarBtn = UIBarButtonItem(customView: notificationBtn)
        navigationItem.rightBarButtonItem = notificationBarBtn
    }
    @objc func onClickAction() {
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
