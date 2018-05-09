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
    func searchTextDidChanged(text:String)
    func searchButtonClicked()
}
class NewsTableViewCell: UITableViewCell, UISearchBarDelegate{
    @IBOutlet weak var serachMe: UISearchBar!
    @IBOutlet weak var lblbread: UILabel!
    
    @IBOutlet weak var lblfoodcup: UILabel!
    @IBOutlet weak var lblfrozen: UILabel!
    @IBOutlet weak var lblmeat: UILabel!
    @IBOutlet weak var lblfruits: UILabel!
    @IBOutlet weak var lbldrinks: UILabel!
    @IBOutlet weak var lbldairy: UILabel!
    @IBOutlet weak var lblsnacks: UILabel!
    @IBOutlet weak var btnSnacks: UIButton!
    @IBOutlet weak var btnDrinks: UIButton!
    @IBOutlet weak var btnMeat: UIButton!
    @IBOutlet weak var btnFrozenFood: UIButton!
    @IBOutlet weak var btnFoodCupboard: UIButton!
    @IBOutlet weak var btnFruitsAndVegs: UIButton!
    @IBOutlet weak var btnBread: UIButton!
    @IBOutlet weak var btnDairy: UIButton!
    @IBOutlet weak var postImageView:UIImageView!
    @IBOutlet weak var authorImageView:UIImageView!
    @IBOutlet weak var postTitleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    var newsCellDelegate: NewsTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serachMe.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        btnDairy.isHidden = true
        lbldairy.isHidden = true
        btnBread.isHidden = true
        lblbread.isHidden = true
        btnFruitsAndVegs.isHidden = true
        lblfruits.isHidden = true
        btnFoodCupboard.isHidden = true
        lblfoodcup.isHidden = true
        btnFrozenFood.isHidden = true
        lblfrozen.isHidden = true
        btnMeat.isHidden = true
        lblmeat.isHidden = true
        btnDrinks.isHidden = true
        lbldrinks.isHidden = true
        btnSnacks.isHidden = true
        lblsnacks.isHidden = true
        if searchText == "Milk" {
            btnDairy.isHidden = false
            lbldairy.isHidden = false
        }else if searchText == "Bread"{
            btnBread.isHidden = false
            lblbread.isHidden = false
        }else if searchText == "Fruits"{
            btnFruitsAndVegs.isHidden = false
            lblfruits.isHidden = false
        }else if searchText == "Food cup"{
            btnFoodCupboard.isHidden = false
            lblfoodcup.isHidden = false
        }else if searchText == "Frozen"{
            btnFrozenFood.isHidden = false
            lblfrozen.isHidden = false
        }else if searchText == "Meat"{
            btnMeat.isHidden = false
            lblmeat.isHidden = false
        }else if searchText == "Drinks"{
            btnDrinks.isHidden = false
            lbldrinks.isHidden = false
        }else if searchText == "Snacks"{
            btnSnacks.isHidden = false
            lblsnacks.isHidden = false
        }else{
            btnDairy.isHidden = false
            lbldairy.isHidden = false
            btnBread.isHidden = false
            lblbread.isHidden = false
            btnFruitsAndVegs.isHidden = false
            lblfruits.isHidden = false
            btnFoodCupboard.isHidden = false
            lblfoodcup.isHidden = false
            btnFrozenFood.isHidden = false
            lblfrozen.isHidden = false
            btnMeat.isHidden = false
            lblmeat.isHidden = false
            btnDrinks.isHidden = false
            lbldrinks.isHidden = false
            btnSnacks.isHidden = false
            lblsnacks.isHidden = false
        }
        //self.newsCellDelegate?.searchTextDidChanged(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.serachMe.endEditing(true)
        self.newsCellDelegate?.searchButtonClicked()
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
