//
//  AccountWriterViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/05.
//

import Foundation

protocol AccountWriterViewModel: NumpadDataSource {
    var inputText: Observable<String> { get }
    
    func didSelectNumpadKey(at index: Int)
}

final class DefaultAccountWriterViewModel: AccountWriterViewModel {
    
    private let numpadKeys: [String]
    private let accountWriterUseCase: AccountWriterUseCase
    
    let inputText: Observable<String>
    
    init(accountWriterUseCase: AccountWriterUseCase) {
        self.inputText = Observable("")
        self.numpadKeys = Constants.numpadKeys
        self.accountWriterUseCase = accountWriterUseCase
    }
    
    func didSelectNumpadKey(at index: Int) {
        inputText.value += numpadKeys[index]
    }
    
}

extension DefaultAccountWriterViewModel {
    func numberOfNumpadKeys() -> Int {
        return numpadKeys.count
    }
    
    func loadNumpadKey(at index: Int) -> String {
        return numpadKeys[index]
    }
}
