//
//  MilkViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class MilkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgView1.isUserInteractionEnabled = true
        imgView1.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MilkDetailViewController") as? MilkDetailViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @objc private func onBackButton(button: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var imgView1: UIImageView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
