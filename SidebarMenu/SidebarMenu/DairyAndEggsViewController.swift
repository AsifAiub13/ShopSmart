//
//  DairyAndEggsViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/2/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class DairyAndEggsViewController: UIViewController {

    @IBOutlet weak var btnMilk: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnMilk.titleLabel?.text = "Milk"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
