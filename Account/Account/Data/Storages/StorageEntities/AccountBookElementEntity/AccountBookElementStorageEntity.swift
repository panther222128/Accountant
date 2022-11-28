//
//  AccountBookElementStorageEntity.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/31.
//

import Foundation
import RealmSwift

enum PaymentEntityType: String, PersistableEnum {
    case cash
    case creditCard
}

extension PaymentEntityType {
    
    func convertToDomain() -> PaymentType {
        switch self {
        case .cash:
            return .cash
            
        case .creditCard:
            return .creditCard
            
        }
    }
    
}

final class AccountBookElementStorageEntity: Object {
    
    @Persisted var history: String
    @Persisted var amount: Int
    @Persisted var paymentEntityType: PaymentEntityType?
    @Persisted var accountBookElementCategoryStorageEntity: AccountBookElementCategoryStorageEntity?
    
    convenience init(history: String, amount: Int, paymentEntityType: PaymentEntityType?, accountBookElementCategoryStorageEntity: AccountBookElementCategoryStorageEntity?) {
        self.init()
        self.history = history
        self.amount = amount
        self.paymentEntityType = paymentEntityType
        self.accountBookElementCategoryStorageEntity = accountBookElementCategoryStorageEntity
    }
    
}

extension AccountBookElementStorageEntity {
    
    func convertToDomain() -> AccountBookElement {
        return .init(history: history, amount: amount, paymentType: paymentEntityType?.convertToDomain(), accountCategory: accountBookElementCategoryStorageEntity?.convertToDomain())
    }
    
}
