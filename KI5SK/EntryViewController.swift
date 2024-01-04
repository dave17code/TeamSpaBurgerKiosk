//
//  EntryViewController.swift
//  KI5SK
//
//  Created by JiHoon K on 12/31/23.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var burgerBtn: UIButton!
    @IBOutlet weak var beverageBtn: UIButton!
    @IBOutlet weak var dessertBtn: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalPrice: UILabel!

    @IBOutlet weak var selectMenu: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    
    var burgerVC: BurgerViewController!
    var beverageVC: BeverageViewController!
    var dessertVC: DessertViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        burgerVC = UIStoryboard(name: "Burger", bundle: nil).instantiateViewController(withIdentifier: "BurgerViewController") as? BurgerViewController
                
        beverageVC = UIStoryboard(name: "Beverage", bundle: nil).instantiateViewController(withIdentifier: "BeverageViewController") as? BeverageViewController
        dessertVC = UIStoryboard(name: "Dessert", bundle: nil).instantiateViewController(withIdentifier: "DessertViewController") as? DessertViewController
        
        burgerVC.entryVC = self
        beverageVC.entryVC = self
        dessertVC.entryVC = self

        initBtn()
        orderBtn.tintColor = .systemYellow
        orderBtn.layer.cornerRadius = 8
            
        self.totalPrice.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        self.totalPrice.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice)
        

    }
    
    @IBAction func orderBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartPaymentViewController") as UIViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}

extension EntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelManage.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "footerCell") as? FooterCell else {return FooterCell()}
        
        let data = ModelManage.shared.cart[indexPath.row]
        cell.data = data
        
        cell.tapAction = { operType in
            
            switch operType{
            case .add:
                ModelManage.shared.cart[indexPath.row].number += 1
            case .sub:
                if ModelManage.shared.cart[indexPath.row].number > 1 {
                    ModelManage.shared.cart[indexPath.row].number -= 1
                }
            }
            tableView.reloadData()
            self.totalPrice.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice)
        }
        
        return cell
    }
}

extension EntryViewController {
    @IBAction func tapTopButton(_ sender: UIButton) {
        initBtn()
        sender.layer.backgroundColor = UIColor.lightGray.cgColor
        sender.tintColor = .white
        
        burgerVC.removeFromParent()
        beverageVC.removeFromParent()
        dessertVC.removeFromParent()
        
        switch sender.titleLabel?.text {
        case "햄버거 세트":
            selectMenu.isHidden = true
            contentView.addSubview(burgerVC.view)
        case "음료":
            selectMenu.isHidden = true
            contentView.addSubview(beverageVC.view)
        case "디저트":
            selectMenu.isHidden = true
            contentView.addSubview(dessertVC.view)
        default:
            return
        }
        
    }
}

extension EntryViewController {
    private func initBtn() {
        burgerBtn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        burgerBtn.layer.borderColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1).cgColor
        burgerBtn.layer.cornerRadius = 16
        burgerBtn.layer.borderWidth = 1
        burgerBtn.clipsToBounds = true
        burgerBtn.tintColor = .black
        
        beverageBtn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        beverageBtn.layer.borderColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1).cgColor
        beverageBtn.layer.cornerRadius = 16
        beverageBtn.layer.borderWidth = 1
        beverageBtn.clipsToBounds = true
        beverageBtn.tintColor = .black
        
        dessertBtn.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        dessertBtn.layer.borderColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1).cgColor
        dessertBtn.layer.cornerRadius = 16
        dessertBtn.layer.borderWidth = 1
        dessertBtn.clipsToBounds = true
        dessertBtn.tintColor = .black
    }
}
