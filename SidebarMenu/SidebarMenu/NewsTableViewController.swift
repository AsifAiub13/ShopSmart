//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright (c) 2018 SerajeOrg. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController,NewsTableViewCellDelegate,UITextFieldDelegate {
    
    @IBOutlet var menuButton:UIBarButtonItem!
    @IBOutlet var extraButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear
        if UserDefaults.standard.bool(forKey: "LOGGEDIN") == false{
            let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            let navCtrl = UINavigationController(rootViewController: newView2)
            self.present(navCtrl, animated: true, completion: nil)
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))

            revealViewController().rightViewRevealWidth = 150
            extraButton.target = revealViewController()
            extraButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        
        }
        let editImage    = UIImage(named: "cart")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        navigationItem.rightBarButtonItem = editButton
    
    }


    @objc func didTapEditButton(sender: AnyObject){
        let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
        let navCtrl = UINavigationController(rootViewController: newView2)
        navCtrl.navigationBar.barTintColor = UIColor.black
        navCtrl.navigationBar.tintColor = UIColor.white
        self.present(navCtrl, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDefaults.standard.bool(forKey: "Popupshowed") != true{
            self.showAlertForHomeLocker()
        }
        self.badgeShow()
        
    }
    func showAlertForHomeLocker() {
        let alertController = UIAlertController(title: "", message: "Where would you like your items delivered to?", preferredStyle: .alert)
        let homeAction = UIAlertAction(title: "Home", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            
        }
        let lockerAction = UIAlertAction(title: "Locker", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        alertController.addAction(homeAction)
        alertController.addAction(lockerAction)
        self.present(alertController, animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "Popupshowed")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! NewsTableViewCell
        
        // Configure the cell...
        /*if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Dairy & Eggs"
            cell.authorLabel.text = "Dairy & Eggs"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Bread"
            cell.authorLabel.text = "Bread"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Vegetables & Fruits"
            cell.authorLabel.text = "Vegetables & Fruits"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 3 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Food Cupboard"
            cell.authorLabel.text = "Food Cupboard"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 4 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Frozen Food"
            cell.authorLabel.text = "Frozen Food"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 5 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Meat"
            cell.authorLabel.text = "Meat"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 6 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Drinks & Beverages"
            cell.authorLabel.text = "Drinks & Beverages"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else if indexPath.row == 7 {
            cell.postImageView.image = UIImage(named: "CompanyLogo")
            cell.postTitleLabel.text = "Snacks"
            cell.authorLabel.text = "Snacks"
            cell.authorImageView.image = UIImage(named: "CompanyLogo")
            
        }else {
            return UITableViewCell()
            
        }*/
        cell.newsCellDelegate = self
        return cell
    }
    
    func btnBreadPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreadViewController") as? BreadViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnVegetablesPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VegetablesAndFruitsViewController") as? VegetablesAndFruitsViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnFoodCupboardPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FoodCupboardViewController") as? FoodCupboardViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnFrozenFoodPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FrozenFoodViewController") as? FrozenFoodViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnMeatPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MeatViewController") as? MeatViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnDrinkPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DrinkAndBeveragesViewController") as? DrinkAndBeveragesViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnSnacksPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SnacksViewController") as? SnacksViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func btnDairyPressed() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DairyAndEggsViewController") as? DairyAndEggsViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if indexPath.row == 0{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DairyAndEggsViewController") as? DairyAndEggsViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }else if indexPath.row == 1{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreadViewController") as? BreadViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 2{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VegetablesAndFruitsViewController") as? VegetablesAndFruitsViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 3{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FoodCupboardViewController") as? FoodCupboardViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 4{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FrozenFoodViewController") as? FrozenFoodViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 5{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MeatViewController") as? MeatViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 6{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DrinkAndBeveragesViewController") as? DrinkAndBeveragesViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else if indexPath.row == 7{
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SnacksViewController") as? SnacksViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
            
        }else{
            return
        }*/
    }
    
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
        let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        let navCtrl = UINavigationController(rootViewController: newView2)
        navCtrl.navigationBar.barTintColor = UIColor.black
        navCtrl.navigationBar.tintColor = UIColor.white
        self.present(navCtrl, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func searchTextDidChanged(text: String) {
        if text == "Milk" {
            
        }
    }
    
    func searchButtonClicked() {
        
    }
    
    
}
