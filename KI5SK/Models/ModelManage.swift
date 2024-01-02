//
//  ModelManage.swift
//  KI5SK
//
//  Created by JiHoon K on 12/29/23.
//

import Foundation

class ModelManage {
    static let shared = ModelManage()
    
    var cart: [Menu] = [] // 
    var totalPrice: Int {
        get {
            var sum = 0
            for menu in cart {
                sum += getPriceOf(menu: menu)
            }
            
            return sum
        }
    }
}

extension ModelManage {
    // 17800 -> "17,800원" 반환
    func formatPrice(_ price:Int) -> String {
        var price: [Character] = Array(String(price))
        
        for i in stride(from: price.count-3, through: 0, by: -3) {
            price.insert(",", at: i)
        }
        
        if price.first == "," {
            price.removeFirst()
        }
        
        return String(price) + "원"
    }
    
    // Menu 구조체 넣으면 옵션 포함해서 얼마 인지 Int로 반환
    func getPriceOf(menu: Menu) -> Int {
        var result = menu.price
        
        if let singleOption = menu.singleOption {
            for single in singleOption {
                result += single.items[single.selected].price
            }
        }
        
        if let multiOption = menu.multiOption {
            for multi in multiOption {
                for item in multi.items {
                    if item.isSelected {
                        result += item.price
                    }
                }
            }
        }
        
        return result * menu.number
    }
    
    func getOptionsTitle(menu: Menu) -> String {
        var title = ""
        if let singleOption = menu.singleOption {
            for single in singleOption {
                title += single.items[single.selected].name + ", "
            }
        }
        
        if let multiOption = menu.multiOption {
            for multi in multiOption {
                for item in multi.items {
                    if item.isSelected {
                        title += item.name + ", "
                    }
                }
            }
        }
        
        return title
    }
    
    func clearCart() {
        cart.removeAll()
    }
}
