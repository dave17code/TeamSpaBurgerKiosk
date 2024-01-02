//
//  CartCellViewController.swift
//  KI5SK
//
//  Created by JiHoon K on 12/29/23.
//

import UIKit

class CartPaymentCell: UITableViewCell {
    
    var menu: Menu?
    
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var optionsTitle: UILabel!
    @IBOutlet weak var optionChangeBtn: UIButton!
    @IBOutlet var numberTitle: UILabel!
    @IBOutlet var totalPrice: UILabel!
    
    var tapAction: ((ButtonType) -> ())?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if let menu = menu {
            imageTitle.image = UIImage(named: menu.photo)
            menuTitle.text = menu.name
            optionsTitle.text = ModelManage.shared.getOptionsTitle(menu: menu)
            numberTitle.text = "\(menu.number)"
            totalPrice.text = ModelManage.shared.formatPrice(ModelManage.shared.getPriceOf(menu: menu))
        }
        setUpView()
    }
    
    enum ButtonType {
        case sub, add, tapOption
    }
}

extension CartPaymentCell {
    @IBAction func addByOne(_ sender: UIButton) {
        tapAction!(.add)
    }
    
    @IBAction func subByOne(_ sender: UIButton) {
        tapAction!(.sub)
    }
    
    @IBAction func tapOption(_ sender: UIButton) {
        tapAction!(.tapOption)
    }
}

//MARK: - Helpers
extension CartPaymentCell {
    private func setUpView() {
        optionChangeBtn.layer.backgroundColor = UIColor.systemGray6.cgColor
        optionChangeBtn.layer.cornerRadius = 16
        optionChangeBtn.clipsToBounds = true
    }
}
