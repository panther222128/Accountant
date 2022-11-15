//
//  FirstViewModel.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import Foundation

protocol MonthlyAccountViewModel {
    
}

struct MonthlyAccountViewModelAction {
    
}

final class DefaultMonthlyAccountViewModel: MonthlyAccountViewModel {
    
    private let monthlyAccountUseCase: MonthlyAccountUseCase
    private let action: MonthlyAccountViewModelAction
    
    init(monthlyAccountUseCase: MonthlyAccountUseCase, action: MonthlyAccountViewModelAction) {
        self.monthlyAccountUseCase = monthlyAccountUseCase
        self.action = action
    }
    
}
