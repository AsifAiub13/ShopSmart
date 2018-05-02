//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright (c) 2018 SerajeOrg. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    @IBOutlet var menuButton:UIBarButtonItem!
    @IBOutlet var extraButton:UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        //var check : Bool = UserDefaults.standard.bool(forKey: "LOGGED_IN")
        //if UserDefaults.standard.bool(forKey: "LOGGED_IN") == false ||  UserDefaults.standard.bool(forKey: "LOGGED_IN") == nil{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
//            self.present(controller, animated: true, completion: nil)
//
//            // Safe Present
//            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
//            {
//                present(vc, animated: true, completion: nil)
//
//            }
        
        let newView2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
  
        let navCtrl = UINavigationController(rootViewController: newView2)
        self.present(navCtrl, animated: true, completion: nil)
        //}
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))

            revealViewController().rightViewRevealWidth = 150
            extraButton.target = revealViewController()
            extraButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        
        }
        
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
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! NewsTableViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
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
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
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
        }
    }

}
