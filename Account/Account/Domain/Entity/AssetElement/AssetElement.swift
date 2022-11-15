//
//  AssetElement.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/30.
//

import Foundation

enum AssetElementType: String {
    case income
    case expenditure
}

struct AssetElement {
    let assetElementType: AssetElementType
    let name: String
    let amount: Int
}
