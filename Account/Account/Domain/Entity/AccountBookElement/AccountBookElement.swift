//
//  AccountElement.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/25.
//

import Foundation

enum PaymentType: String {
    case cash
    case creditCard
}

struct AccountBookElement {
    let history: String
    let amount: Int
    let paymentType: PaymentType?
    let accountCategory: AccountBookElementCategory?
}

