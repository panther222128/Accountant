//
//  AccountCategoryEntity.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/31.
//

import Foundation
import RealmSwift

enum AccountBookElementCategoryStorageEntityType: String, PersistableEnum {
    case income
    case expenditure
}

extension AccountBookElementCategoryStorageEntityType {
    
    func convertToDomain() -> AccountBookElementCategoryType {
        switch self {
        case .income:
            return .income
            
        case .expenditure:
            return .expenditure
            
        }
    }
    
}

final class AccountBookElementCategoryStorageEntity: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var accountBookElementCategoryStorageEntityType: AccountBookElementCategoryStorageEntityType?
    @Persisted var accountBookElementCategoryImageName: String
    @Persisted var accountBookElementCategoryName: String
    
    convenience init(accountBookElementCategoryStorageEntityType: AccountBookElementCategoryStorageEntityType?, accountBookElementCategoryImageName: String, accountBookElementCategoryName: String) {
        self.init()
        self.accountBookElementCategoryStorageEntityType = accountBookElementCategoryStorageEntityType
        self.accountBookElementCategoryImageName = accountBookElementCategoryImageName
        self.accountBookElementCategoryName = accountBookElementCategoryName
    }
    
}

extension AccountBookElementCategoryStorageEntity {
    
    func convertToDomain() -> AccountBookElementCategory {
        return .init(accountBookElementCategoryType: accountBookElementCategoryStorageEntityType?.convertToDomain(), accountBookElementCategoryImageName: accountBookElementCategoryImageName, accountBookElementCategoryName: accountBookElementCategoryName)
    }
    
}
