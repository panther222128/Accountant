//
//  SecondViewModel.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import Foundation

protocol WeeklyAccountViewModel {
    
}

struct WeekyAccountViewModelAction {
    
}

final class DefaultWeeklyAccountViewModel: WeeklyAccountViewModel {
    
    private let weeklyAccountUseCase: WeeklyAccountUseCase
    private let action: WeekyAccountViewModelAction
    
    init(weeklyAccountUseCase: WeeklyAccountUseCase, action: WeekyAccountViewModelAction) {
        self.weeklyAccountUseCase = weeklyAccountUseCase
        self.action = action
    }
    
}
