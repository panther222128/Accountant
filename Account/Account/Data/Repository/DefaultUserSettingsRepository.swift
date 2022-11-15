//
//  DefaultUserSettingsRepository.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/25.
//

import Foundation

final class DefaultUserSettingsRepository: UserSettingsRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}
