//
//  FinalPaymentTableViewController.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 5/4/18.
//  Copyright © 2018 SerajeOrg. All rights reserved.
//

import UIKit

class FinalPaymentTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    @IBAction func btnPayNowPressed(_ sender: UIButton) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        if indexPath.row == 0  {
            cell.imageView?.image = #imageLiteral(resourceName: "DairyEggs")
            cell.textLabel?.text = "Item 1"
        }else{
            cell.imageView?.image = #imageLiteral(resourceName: "DairyEggs")
            cell.textLabel?.text = "Item 2"
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        guard section == 0 else { return nil }
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44.0))
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: tableView.frame.width-50, height: 44.0))
        // here is what you should add:
        doneButton.center = footerView.center
        doneButton.setTitle("Pay Now!", for: .normal)
        doneButton.backgroundColor = UIColor(red: 36/255.0, green: 106/255.0, blue: 45/255.0, alpha: 1.0)
        doneButton.layer.cornerRadius = 10.0
        //doneButton.shadow = true
        doneButton.addTarget(self, action: #selector(self.paymentPressed), for: .touchUpInside)
        footerView.addSubview(doneButton)
        
        return footerView
    }
    
    @objc func paymentPressed() {
        let alert = UIAlertController(title: "Thank you for your order!", message: "Your items will be handpicked and you will be notified when they're on their way to you.", preferredStyle: .actionSheet)
        let yesButton = UIAlertAction(title: "OK", style: .cancel, handler: {(_ action: UIAlertAction?) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.clear
        let imgMyImage = UIImage(named: "DairyEggs")
        let ivMyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgMyImage?.size.width ?? 0.0, height: (imgMyImage?.size.height ?? 0.0) - 100))
        ivMyImageView.image = imgMyImage
        ivMyImageView.contentMode = .center
        ivMyImageView.clipsToBounds = true
        viewController.view.addSubview(ivMyImageView)
        alert.setValue(viewController, forKey: "contentViewController")
        let height = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.size.height * 0.9)
        let width = NSLayoutConstraint(item: alert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: view.frame.size.width * 2)
        alert.view.addConstraint(width)
        alert.view.addConstraint(height)
        alert.addAction(yesButton)
        present(alert, animated: true) {() -> Void in }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
