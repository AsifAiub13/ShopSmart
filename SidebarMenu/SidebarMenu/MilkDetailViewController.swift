//
//  MilkDetailViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class MilkDetailViewController: UIViewController {
    @IBOutlet weak var pickerNumber: UIPickerView!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddToCartPressed(_ sender: UIButton) {
        
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