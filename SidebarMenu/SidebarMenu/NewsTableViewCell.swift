//
//  NewsTableViewCell.swift
//  SidebarMenu
//
//  Created by Asif Seraje on 4/30/18.
//  Copyright (c) 2018 SerajeOrg. All rights reserved.
//

import UIKit
protocol NewsTableViewCellDelegate: class {
    func btnDairyPressed()
    func btnBreadPressed()
    func btnVegetablesPressed()
    func btnFoodCupboardPressed()
    func btnFrozenFoodPressed()
    func btnMeatPressed()
    func btnDrinkPressed()
    func btnSnacksPressed()
}
class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var serachMe: UISearchBar!
    
    @IBOutlet weak var btnDairy: UIButton!
    @IBOutlet weak var postImageView:UIImageView!
    @IBOutlet weak var authorImageView:UIImageView!
    @IBOutlet weak var postTitleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    var newsCellDelegate: NewsTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serachMe.delegate = self as? UISearchBarDelegate
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.serachMe.endEditing(true)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnSnacksPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnSnacksPressed()
    }
    @IBAction func btnDrinkPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnDrinkPressed()
    }
    @IBAction func btnMeatPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnMeatPressed()
    }
    @IBAction func btnFrozenFoodPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnFrozenFoodPressed()
    }
    @IBAction func btnFoodCupboardPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnFoodCupboardPressed()
    }
    @IBAction func btnVegetablesPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnVegetablesPressed()
    }
    @IBAction func btnBreadPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnBreadPressed()
    }
    @IBAction func btnDairyPressed(_ sender: UIButton) {
        self.newsCellDelegate?.btnDairyPressed()
    }
    
}
