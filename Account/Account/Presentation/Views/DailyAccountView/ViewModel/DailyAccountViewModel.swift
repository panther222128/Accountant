//
//  ThirdViewModel.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import Foundation

protocol DailyAccountViewModel {
    
}

struct DailyAccountViewModelAction {
    
}

final class DefaultDailyAccountViewModel: DailyAccountViewModel {
    
    private let dailyAccountUseCase: DailyAccountUseCase
    private let action: DailyAccountViewModelAction
    
    init(dailyAccountUseCase: DailyAccountUseCase, action: DailyAccountViewModelAction) {
        self.dailyAccountUseCase = dailyAccountUseCase
        self.action = action
    }
    
}
