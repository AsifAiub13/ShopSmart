//
//  MeatViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/2/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class MeatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let editImage    = UIImage(named: "cart")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.didTapSearchButton))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func didTapEditButton(sender: AnyObject){
        let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
        let navCtrl = UINavigationController(rootViewController: newView2)
        navCtrl.navigationBar.barTintColor = UIColor.black
        navCtrl.navigationBar.tintColor = UIColor.white
        self.present(navCtrl, animated: true, completion: nil)
    }
    
    @objc func didTapSearchButton(sender: AnyObject){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.badgeShow()
        
    }
    var badgeValueUpdate = 0
    func badgeShow() {
        let badgeLbl = UILabel(frame: CGRect(x: 16, y: -2, width: 18, height: 18))
        badgeLbl.backgroundColor = UIColor.red
        badgeLbl.textColor = UIColor.white
        badgeLbl.textAlignment = .center
        badgeLbl.layer.cornerRadius = 9.0
        badgeLbl.layer.masksToBounds = true
        badgeLbl.text = String(UserDefaults.standard.integer(forKey: "badgeValue"))
        let notificationBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        notificationBtn.setBackgroundImage(UIImage(named: "cart"), for: .normal)
        notificationBtn.setTitle("", for: .normal)
        notificationBtn.addTarget(self, action: #selector(self.onClickAction), for: .touchUpInside)
        notificationBtn.addSubview(badgeLbl)
        let notificationBarBtn = UIBarButtonItem(customView: notificationBtn)
        navigationItem.rightBarButtonItem = notificationBarBtn
    }
    @objc func onClickAction() {
        
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
