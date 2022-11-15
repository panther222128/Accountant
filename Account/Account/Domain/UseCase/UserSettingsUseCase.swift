//
//  UserSettingsUseCase.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/25.
//

import Foundation

protocol UserSettingsUseCase {
    
}

final class DefaultUserSettingsUseCase: UserSettingsUseCase {
    
    private let userSettingsRepository: UserSettingsRepository
    
    init(userSettingsRepository: UserSettingsRepository) {
        self.userSettingsRepository = userSettingsRepository
    }
    
}
