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
        let editImage    = UIImage(named: "cart")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.didTapSearchButton))
        navigationItem.rightBarButtonItems = [searchButton,editButton]
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        
    }
    
    @objc func didTapSearchButton(sender: AnyObject){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnMilkPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MilkViewController") as? MilkViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    

}
