//
//  UserSettingsViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/25.
//

import Foundation

protocol UserSettingsViewModel {
    
}

final class DefaultUserSettingsViewModel: UserSettingsViewModel {
    
    private let userSettingsUseCase: UserSettingsUseCase
    
    init(userSettingsUseCase: UserSettingsUseCase) {
        self.userSettingsUseCase = userSettingsUseCase
    }
    
}
