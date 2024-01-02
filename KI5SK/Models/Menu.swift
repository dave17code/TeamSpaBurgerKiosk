//
//  Menu.swift
//  KI5SK
//
//  Created by JiHoon K on 12/28/23.
//

import Foundation

// menu -> detail 식별자
var selectedIndexPath: Int = 0
var selectedCategory :Category = .burger

// 주문 개수
enum Category {
    case burger
    case beverage
    case side
}

// MARK: 구조체
// 메뉴 구조체
struct Menu {
    var name: String
    var photo: String
    var price: Int
    var number = 1
    var singleOption: [SingleOption]?
    var multiOption: [MultiOption]?
    var category: Category
}

// 싱글 옵션 구조체
struct SingleOption {
    let title: String
    var items: [(name: String, price: Int)]
    var selected: Int
}

// 멀티 옵션 구조체
struct MultiOption {
    let title: String
    var items: [(name: String, price: Int, isSelected: Bool)]
}

struct MenuData {
    
    // MARK: 인스턴스 생성
    // 싱글 옵션 인스턴스
    var frenchFrieOption = SingleOption(
        title: "후렌치 후라이",
        items: [(name: "M", price: 0),
                (name: "L", price: 500)],
        selected: 0
    )
    var beverageOption = SingleOption(
        title: "음료",
        items: [
            (name: "콜라 제로M", price: 0),
            (name: "콜라 제로L", price: 500),
            (name: "사이다 제로M", price: 0),
            (name: "사이다 제로L", price: 500)
        ],
        selected: 0
    )
    var sizeOption = SingleOption(
        title: "크기",
        items: [
            (name: "M", price: 0),
            (name: "L", price: 500)
        ],
        selected: 0)
    
    var flavorOption = SingleOption(
        title: "맛",
        items: [
            (name: "바닐라", price: 0),
            (name: "딸기", price: 0),
            (name: "초코", price: 0),
            (name: "바나나", price: 0)
        ],
        selected: 0)
    
    // 멀티 옵션 인스턴스
    var extraMenuOption = MultiOption(
        title: "추가 메뉴",
        items: [
            (name: "치킨 너겟", price: 1500, isSelected: false),
            (name: "치킨 텐더", price: 3000, isSelected: false),
            (name: "애플 파이", price: 2500, isSelected: false),
            (name: "해쉬 브라운", price: 2000, isSelected: false),
            (name: "치즈 스틱", price: 1500, isSelected: false)
        ])
    
    // MARK: 카테고리별 메뉴 인스턴스 생성
    // 버거 메뉴 인스턴스 생성
    // 옵션 인스턴스 생성 이후 이루어져야 함으로 lazy 키워드 사용
    lazy var bigmacSet = Menu(
        name: "BIGMAC Set",
        photo: "BIGMAC Set",
        price: 10000,
        singleOption: [frenchFrieOption, beverageOption],
        multiOption: [extraMenuOption],
        category: .burger
    )
    lazy var chickenSet = Menu(
        name: "Chicken Set",
        photo: "Chicken Set",
        price: 9000,
        singleOption: [frenchFrieOption, beverageOption],
        multiOption: [extraMenuOption],
        category: .burger
    )
    lazy var shrimpSet = Menu(
        name: "Shrimp Set",
        photo: "Shrimp Set",
        price: 8000,
        singleOption: [frenchFrieOption, beverageOption],
        multiOption: [extraMenuOption],
        category: .burger
    )
    
    lazy var cheeseSet = Menu(
        name: "Cheese Set",
        photo: "Cheese Set",
        price: 7000,
        singleOption: [frenchFrieOption, beverageOption],
        multiOption: [extraMenuOption],
        category: .burger
    )
    
    // 음료 메뉴 인스턴스 생성
    lazy var coke = Menu(
        name: "Coke",
        photo: "Coke",
        price: 2000,
        singleOption: [sizeOption],
        category: .beverage
    )
    lazy var cider = Menu(
        name: "Cider",
        photo: "Cider",
        price: 2000,
        singleOption: [sizeOption],
        category: .beverage
    )
    lazy var shake = Menu(
        name: "Shake",
        photo: "Shake",
        price: 3000,
        singleOption: [sizeOption, flavorOption],
        category: .beverage
    )
    
    // 디저트 메뉴 인스턴스 생성
    lazy var pie = Menu(
        name: "Pie",
        photo: "Pie",
        price: 2000,
        singleOption: [sizeOption],
        category: .side
    )
    lazy var cookie = Menu(
        name: "Cookie",
        photo: "Cookie",
        price: 2500,
        singleOption: [sizeOption],
        category: .side
    )
    lazy var icecream = Menu(
        name: "Icecreme",
        photo: "Icecreme",
        price: 1500,
        singleOption: [sizeOption, flavorOption],
        category: .side
    )
    
    // MARK: 메뉴 배열 생성
    var bugerMenu: [Menu] = []
    var beverageMenu: [Menu] = []
    var dessertMenu: [Menu] = []
    
    // MARK: 카테고리별 메뉴 인스턴스 배열에 추가
    mutating func setMenu() {
        bugerMenu = [bigmacSet, chickenSet, shrimpSet, cheeseSet]
        beverageMenu = [coke, cider, shake]
        dessertMenu = [pie, cookie, icecream]
    }
}
