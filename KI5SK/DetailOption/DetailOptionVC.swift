//
//  DetailViewController.swift
//  KI5SK
//
//  Created by TeamSpaFiveTeam on 2023/12/28.
//

import UIKit

class DetailOptionViewController: UIViewController {
    
    weak var entryVC: EntryViewController!
    
    //메뉴 배열 생성
    var menu: [Menu] = []
    
    //메뉴 원래 가격
    lazy var originalPrice = menu[selectedIndexPath].price
    
    // 이미지, 이름, 가격, 수량
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameLbl: UILabel!
    @IBOutlet weak var menuPriceLbl: UILabel!
    @IBOutlet weak var menuCountLbl: UILabel!
    
    // 싱글옵션 1
    @IBOutlet weak var topOptionLbl: UILabel!
    @IBOutlet weak var singleOption1Lbl: UILabel!
    @IBOutlet weak var singleOption2Lbl: UILabel!
    @IBOutlet weak var singleOption1Btn: UIButton!
    @IBOutlet weak var singleOption2Btn: UIButton!
    
    // 싱글옵션 2
    @IBOutlet weak var middleOptionLbl: UILabel!
    @IBOutlet weak var singleOption3Lbl: UILabel!
    @IBOutlet weak var singleOption4Lbl: UILabel!
    @IBOutlet weak var singleOption5Lbl: UILabel!
    @IBOutlet weak var singleOption6Lbl: UILabel!
    @IBOutlet weak var singleOption3Btn: UIButton!
    @IBOutlet weak var singleOption4Btn: UIButton!
    @IBOutlet weak var singleOption5Btn: UIButton!
    @IBOutlet weak var singleOption6Btn: UIButton!
    
    // 멀티옵션
    @IBOutlet weak var bottomOptionLbl: UILabel!
    @IBOutlet weak var multiOption1Btn: UIButton!
    @IBOutlet weak var multiOption2Btn: UIButton!
    @IBOutlet weak var multiOption3Btn: UIButton!
    @IBOutlet weak var multiOption4Btn: UIButton!
    @IBOutlet weak var multiOption5Btn: UIButton!
    
    // Cart 담기
    @IBOutlet weak var inputCartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메뉴 인스턴스 생성
        var selectedMenu = MenuData()
        selectedMenu.setMenu()
        
        // 선택 카테고리 식별
        switch selectedCategory {
        case .burger : menu = selectedMenu.bugerMenu
        case .beverage : menu = selectedMenu.beverageMenu
        case .side : menu = selectedMenu.dessertMenu
        }
        
        // 메뉴 이미지, 이름, 가격, 수량
        menuImage.image = UIImage(named: menu[selectedIndexPath].name)
        menuNameLbl.text = menu[selectedIndexPath].name
        menuPriceLbl.text = "\(menu[selectedIndexPath].price)원"
        menuCountLbl.text = "\(menu[selectedIndexPath].number)"
        
        // 싱글 옵션1 레이블
        topOptionLbl.text = menu[selectedIndexPath].singleOption?[0].title
        singleOption1Lbl.text = menu[selectedIndexPath].singleOption?[0].items[0].name
        singleOption2Lbl.text =
            menu[selectedIndexPath].singleOption?[0].items[1].name
        
        // 싱글 옵션2 확인 후 레이블 부여
        if (menu[selectedIndexPath].singleOption?.count)! < 2 {
            // 레이블
            middleOptionLbl.isHidden = true
            singleOption3Lbl.isHidden = true
            singleOption4Lbl.isHidden = true
            singleOption5Lbl.isHidden = true
            singleOption6Lbl.isHidden = true
            
            // 버튼
            singleOption3Btn.isHidden = true
            singleOption4Btn.isHidden = true
            singleOption5Btn.isHidden = true
            singleOption6Btn.isHidden = true
        }
        else {
            // 싱글 옵션2 레이블
            middleOptionLbl.text =
            menu[selectedIndexPath].singleOption?[1].title
            singleOption3Lbl.text =
            menu[selectedIndexPath].singleOption?[1].items[0].name
            singleOption4Lbl.text =
            menu[selectedIndexPath].singleOption?[1].items[1].name
            singleOption5Lbl.text =
            menu[selectedIndexPath].singleOption?[1].items[2].name
            singleOption6Lbl.text =
            menu[selectedIndexPath].singleOption?[1].items[3].name
        }
        
        // 싱글 옵션 버튼 세팅
        // default
        singleOption1Btn.isSelected = true
        singleOption1Btn.tintColor = .systemBlue
        singleOption3Btn.isSelected = true
        singleOption3Btn.tintColor = .systemBlue
        
        // normal
        singleOption1Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        singleOption2Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        singleOption3Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        singleOption4Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        singleOption5Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        singleOption6Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        
        // selected
        singleOption1Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        singleOption2Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        singleOption3Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        singleOption4Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        singleOption5Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        singleOption6Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        
        // 멀티 옵션 타이틀 레이블
        if ((menu[selectedIndexPath].multiOption?.isEmpty) == nil) {
            bottomOptionLbl.isHidden = true
            multiOption1Btn.isHidden = true
            multiOption2Btn.isHidden = true
            multiOption3Btn.isHidden = true
            multiOption4Btn.isHidden = true
            multiOption5Btn.isHidden = true
        }
        
        bottomOptionLbl.text =
        menu[selectedIndexPath].multiOption?[0].title
        multiOption1Btn.setTitle(menu[selectedIndexPath].multiOption?[0].items[0].name, for: .normal)
        multiOption2Btn.setTitle(menu[selectedIndexPath].multiOption?[0].items[1].name, for: .normal)
        multiOption3Btn.setTitle(menu[selectedIndexPath].multiOption?[0].items[2].name, for: .normal)
        multiOption4Btn.setTitle(menu[selectedIndexPath].multiOption?[0].items[3].name, for: .normal)
        multiOption5Btn.setTitle(menu[selectedIndexPath].multiOption?[0].items[4].name, for: .normal)
        
        // 멀티 옵션 버튼 세팅
        // normal
        multiOption1Btn.setTitleColor(.systemBlue, for: .normal)
        multiOption2Btn.setTitleColor(.systemBlue, for: .normal)
        multiOption3Btn.setTitleColor(.systemBlue, for: .normal)
        multiOption4Btn.setTitleColor(.systemBlue, for: .normal)
        multiOption5Btn.setTitleColor(.systemBlue, for: .normal)

        // selected
        multiOption1Btn.setTitleColor(.white, for: .selected)
        multiOption2Btn.setTitleColor(.white, for: .selected)
        multiOption3Btn.setTitleColor(.white, for: .selected)
        multiOption4Btn.setTitleColor(.white, for: .selected)
        multiOption5Btn.setTitleColor(.white, for: .selected)
        
        // 카트 담기 레이블
        inputCartBtn.setTitle("\(menu[selectedIndexPath].price)원 • 내 카트에 담기", for: .normal)
        multiOption1Btn.layer.cornerRadius = 16
        multiOption2Btn.layer.cornerRadius = 16
        multiOption3Btn.layer.cornerRadius = 16
        multiOption4Btn.layer.cornerRadius = 16
        multiOption5Btn.layer.cornerRadius = 16
        
        inputCartBtn.layer.cornerRadius = 8
    }
    
    // 옵션 추가금을 더한 합계 가격 계산하는 메서드
    func calculateTotalPrice() {
        
        // 재계산을 위해 원래 가격으로 복원
        menu[selectedIndexPath].price = originalPrice
        
        // 싱글 옵션1에서 선택된 items의 가격 +
        menu[selectedIndexPath].price += (menu[selectedIndexPath].singleOption?[0].items[(menu[selectedIndexPath].singleOption?[0].selected)!].price)!
  
        // 싱글 옵션2 확인 후 선택된 items의 가격 +
        if (menu[selectedIndexPath].singleOption?.count)! == 2 {menu[selectedIndexPath].price += (menu[selectedIndexPath].singleOption?[1].items[(menu[selectedIndexPath].singleOption?[1].selected)!].price)!
        }
        
        // 멀티 옵션 선택여부를 확인하여 true일 경우 해당 items의 가격 +
        for i in 0...4 {
            if menu[selectedIndexPath].multiOption?[0].items[i].isSelected == true {
                menu[selectedIndexPath].price += (menu[selectedIndexPath].multiOption?[0].items[i].price)!
            }
        }
        
        // 개수만큼 곱해주기
        menu[selectedIndexPath].price = menu[selectedIndexPath].price * menu[selectedIndexPath].number
        
        // 합계 텍스트 레이블에 반영
        inputCartBtn.setTitle("\(menu[selectedIndexPath].price)원 • 내 카트에 담기", for: .normal)
        menuPriceLbl.text = "\(menu[selectedIndexPath].price)원"
    }
    
    // 마이너스 버튼
    @IBAction func menuMinusBtn(_ sender: Any) {
        if menu[selectedIndexPath].number == 1 {
            return
        }
        menu[selectedIndexPath].number -= 1
        
        menuCountLbl.text = String(menu[selectedIndexPath].number)
        calculateTotalPrice()
    }
    
    // 플러스 버튼
    @IBAction func menuPlusBtn(_ sender: Any) {
        menu[selectedIndexPath].number += 1
        
        menuCountLbl.text = String(menu[selectedIndexPath].number)
        calculateTotalPrice()
    }
    
    // 싱글 옵션1 버튼 메서드
    @IBAction func singleOption1BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption2Btn.isSelected = false
        singleOption2Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[0].selected = 0
        calculateTotalPrice()
    }
    
    @IBAction func singleOption2BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption1Btn.isSelected = false
        singleOption1Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[0].selected = 1
        calculateTotalPrice()
    }
    
    // 싱글 옵션2 버튼 메서드
    @IBAction func singleOption3BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption4Btn.isSelected = false
        singleOption5Btn.isSelected = false
        singleOption6Btn.isSelected = false
        singleOption4Btn.tintColor = .systemGray
        singleOption5Btn.tintColor = .systemGray
        singleOption6Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[1].selected = 0
        calculateTotalPrice()
    }
    
    @IBAction func singleOption4BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption3Btn.isSelected = false
        singleOption5Btn.isSelected = false
        singleOption6Btn.isSelected = false
        singleOption3Btn.tintColor = .systemGray
        singleOption5Btn.tintColor = .systemGray
        singleOption6Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[1].selected = 1
        calculateTotalPrice()
    }
    
    @IBAction func singleOption5BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption3Btn.isSelected = false
        singleOption4Btn.isSelected = false
        singleOption6Btn.isSelected = false
        singleOption3Btn.tintColor = .systemGray
        singleOption4Btn.tintColor = .systemGray
        singleOption6Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[1].selected = 2
        calculateTotalPrice()
    }
    
    @IBAction func singleOption6BtnTap(_ sender: UIButton) {
        sender.isSelected = true
        sender.tintColor = .systemBlue
        singleOption3Btn.isSelected = false
        singleOption4Btn.isSelected = false
        singleOption5Btn.isSelected = false
        singleOption3Btn.tintColor = .systemGray
        singleOption4Btn.tintColor = .systemGray
        singleOption5Btn.tintColor = .systemGray
        
        menu[selectedIndexPath].singleOption?[1].selected = 3
        calculateTotalPrice()
    }
    
    // 멀티 옵션 버튼 메서드
    @IBAction func multiOption1BtnTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = sender.tintColor == .systemBlue ? .white : .systemBlue
        
        menu[selectedIndexPath].multiOption?[0].items[0].isSelected = sender.isSelected
        calculateTotalPrice()
    }
    
    @IBAction func multiOption2BtnTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = sender.tintColor == .systemBlue ? .white : .systemBlue
        
        menu[selectedIndexPath].multiOption?[0].items[1].isSelected = sender.isSelected
        calculateTotalPrice()
    }
    
    @IBAction func multiOption3BtnTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = sender.tintColor == .systemBlue ? .white : .systemBlue
        
        menu[selectedIndexPath].multiOption?[0].items[2].isSelected = sender.isSelected
        calculateTotalPrice()
    }
    
    @IBAction func multiOption4BtnTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = sender.tintColor == .systemBlue ? .white : .systemBlue
        
        menu[selectedIndexPath].multiOption?[0].items[3].isSelected = sender.isSelected
        calculateTotalPrice()
    }
    
    @IBAction func multiOption5BtnTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = sender.tintColor == .systemBlue ? .white : .systemBlue
        
        menu[selectedIndexPath].multiOption?[0].items[4].isSelected = sender.isSelected
        calculateTotalPrice()
    }
        
    // Cart에 담기 메서드
    @IBAction func inputCartBtnTap(_ sender: UIButton) {
        menu[selectedIndexPath].price = originalPrice
        ModelManage.shared.cart.append(menu[selectedIndexPath])
        
        if entryVC != nil {
            entryVC.viewWillAppear(true)
        }
        self.dismiss(animated: true)
    }
}
