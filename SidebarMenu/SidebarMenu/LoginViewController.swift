//
//  LoginViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var imgViewLogo: UIImageView!
    @IBOutlet weak var btnContinueAsGuest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let logo = UIImage(named: "CompanyLogo")
//        let imageView = UIImageView(image:logo)
//        self.navigationItem.titleView = imageView
        //UserDefaults.standard.set(true, forKey: "Key")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignInPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func btnSignUpPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func btnContinueAsGuestPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "LOGGEDIN")
    }
    
}
