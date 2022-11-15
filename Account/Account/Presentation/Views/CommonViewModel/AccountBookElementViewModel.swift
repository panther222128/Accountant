//
//  AccountookElementViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/04.
//

import Foundation

protocol AccountBookElementViewModel {
    func didCreate(_ object: AccountBookElement)
    func didRead()
    func didUpdate(_ object: AccountBookElement)
    func didDelete(at index: Int)
    func didDeleteAll()
}

final class DefaultAccountBookElementViewModel: AccountBookElementViewModel {
    
    private let accountBookElementStorageUseCase: AccountBookElementUseCase
    
    let isCreationSuccess: Observable<Bool>
    let isReadSuccess: Observable<Bool>
    let isUpdateSuccess: Observable<Bool>
    let isDeleteSuccess: Observable<Bool>
    let isDeleteAllSuccess: Observable<Bool>
    let error: Observable<Error?>
    
    init(accountBookElementStorageUseCase: AccountBookElementUseCase) {
        self.accountBookElementStorageUseCase = accountBookElementStorageUseCase
        self.isCreationSuccess = Observable(false)
        self.isReadSuccess = Observable(false)
        self.isUpdateSuccess = Observable(false)
        self.isDeleteSuccess = Observable(false)
        self.isDeleteAllSuccess = Observable(false)
        self.error = Observable(nil)
    }
    
    func didCreate(_ object: AccountBookElement) {
        accountBookElementStorageUseCase.executeCreate(object) { result in
            switch result {
            case .success(_):
                self.isCreationSuccess.value = true
                
            case .failure(let error):
                self.error.value = error
                
            }
        }
    }
    
    func didRead() {
        accountBookElementStorageUseCase.executeRead { result in
            switch result {
            case .success(_):
                self.isReadSuccess.value = true
                
            case .failure(let error):
                self.error.value = error
                
            }
        }
    }
    
    func didUpdate(_ object: AccountBookElement) {
        accountBookElementStorageUseCase.executeUpdate(object) { result in
            switch result {
            case .success(_):
                self.isUpdateSuccess.value = true
                
            case .failure(let error):
                self.error.value = error
                
            }
        }
    }
    
    func didDelete(at index: Int) {
        accountBookElementStorageUseCase.executeDelete(at: index) { result in
            switch result {
            case .success(_):
                self.isDeleteSuccess.value = true
                
            case .failure(let error):
                self.error.value = error
                
            }
        }
    }
    
    func didDeleteAll() {
        accountBookElementStorageUseCase.executeDeleteAll { result in
            switch result {
            case .success(_):
                self.isDeleteAllSuccess.value = true
                
            case .failure(let error):
                self.error.value = error
                
            }
        }
    }
    
}
