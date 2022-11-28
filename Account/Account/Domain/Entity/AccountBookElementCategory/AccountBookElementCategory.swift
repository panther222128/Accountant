//
//  Category.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/29.
//

import Foundation

enum AccountBookElementCategoryType: String {
    case income
    case expenditure
}

struct AccountBookElementCategory {
    let accountBookElementCategoryType: AccountBookElementCategoryType?
    let accountBookElementCategoryImageName: String
    let accountBookElementCategoryName: String
}
