//
//  BeverageViewController.swift
//  KI5SK
//
//  Created by TeamSpaFiveTeam on 2023/12/27.
//

import UIKit

class BeverageViewController: UIViewController {
    
    weak var entryVC: EntryViewController!
    
    //메뉴 데이터 인스턴스
    var beverageData = MenuData()
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageCollectionView.delegate = self
        beverageCollectionView.dataSource = self
        beverageCollectionView.collectionViewLayout = createLayout()
    }
    
    // 컬렉션뷰 셀 레이아웃
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        // Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
        
        // Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5)), subitem: item, count: 2)
        
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 8)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension BeverageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //선택 indexPath 넘겨주기
        //선택 Category 넘겨주기
        selectedIndexPath = indexPath.row
        selectedCategory = .beverage
        
        // 메뉴 옵션 모달 띄우기
        let storyboard = UIStoryboard(name: "DetailOption", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailOptionViewController") as! DetailOptionViewController
        vc.entryVC = entryVC
        
        present(vc, animated: true, completion: nil)
    }
}

extension BeverageViewController: UICollectionViewDataSource {
    
    //item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beverageData.setMenu()
        return beverageData.beverageMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCollectionViewCell.identifier, for: indexPath) as! BeverageCollectionViewCell
        
        beverageData.setMenu()
        
        //음료 메뉴 사진
        cell.BeverageMenuImageView.image = UIImage(named: beverageData.beverageMenu[indexPath.row].photo)
        
        //음료 메뉴 이름
        cell.BeverageMenuNameLable.text = beverageData.beverageMenu[indexPath.row].name
        
        //음료 메뉴 가격
        cell.BeverageMenuPriceLable.text = "\(beverageData.beverageMenu[indexPath.row].price)원"
        
        // 셀 색상
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 16
        
        return cell
    }
}
