//
//  PushAccountWriterViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/09.
//

import Foundation

protocol PushAccountWriterViewModel {
    func didPressCreateAccountBookElementButton()
}

struct PushAccountWriterViewModelAction {
    let pushAccountWriterView: (() -> Void)
}

final class DefaultPushAccountWriterViewModel: PushAccountWriterViewModel {
    
    private let action: PushAccountWriterViewModelAction
    
    init(action: PushAccountWriterViewModelAction) {
        self.action = action
    }
    
    func didPressCreateAccountBookElementButton() {
        action.pushAccountWriterView()
    }
    
}
