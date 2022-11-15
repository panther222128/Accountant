//
//  AccountWriterViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/05.
//

import Foundation

protocol AccountWriterViewModel {
    
}

final class DefaultAccountWriterViewModel: AccountWriterViewModel {
    
    private let accountWriterUseCase: AccountWriterUseCase
    
    init(accountWriterUseCase: AccountWriterUseCase) {
        self.accountWriterUseCase = accountWriterUseCase
    }
    
}
