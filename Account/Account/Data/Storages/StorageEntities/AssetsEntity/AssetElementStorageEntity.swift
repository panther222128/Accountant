//
//  AssetElementStorageEntity.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/31.
//

import Foundation
import RealmSwift

enum AssetElementEntityType: String, PersistableEnum {
    case income
    case expenditure
}

extension AssetElementEntityType {
    
    func convertToDomain() -> AssetElementType {
        switch self {
        case .income:
            return .income
        
        case .expenditure:
            return .expenditure
        
        }
    }
    
}

final class AssetElementStorageEntity: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var assetElementEntityType: AssetElementEntityType
    @Persisted var name: String
    @Persisted var amount: Int
    
    convenience init(assetElementEntityType: AssetElementEntityType, name: String, amount: Int) {
        self.init()
        self.assetElementEntityType = assetElementEntityType
        self.name = name
        self.amount = amount
    }
    
}

extension AssetElementStorageEntity {
    
    func convertToDomain() -> AssetElement {
        return .init(assetElementType: assetElementEntityType.convertToDomain(), name: name, amount: amount)
    }
    
}
