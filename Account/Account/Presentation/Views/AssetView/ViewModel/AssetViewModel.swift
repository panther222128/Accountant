//
//  AssetViewModel.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/26.
//

import Foundation
import RealmSwift

protocol AssetViewModel {
    var isCreationSuccess: Observable<Bool> { get }
    var error: Observable<Error?> { get }
    
    func didCreate(assetElement: AssetElement)
    func didRead(completion: @escaping (Result<[Object], Error>) -> Void)
    func didUpdate()
    func didDelete(at index: Int, completion: @escaping (Result<Object, Error>) -> Void)
}

final class DefaultAssetViewModel: AssetViewModel {
    
    private let assetUseCase: AssetElementUseCase
    var isCreationSuccess: Observable<Bool>
    var error: Observable<Error?>
    
    init(assetUseCase: AssetElementUseCase) {
        self.assetUseCase = assetUseCase
        self.isCreationSuccess = Observable(false)
        self.error = Observable(nil)
    }
    
    func didCreate(assetElement: AssetElement) {
        assetUseCase.executeCreate(assetElement) { result in
            switch result {
            case .success(_):
                self.isCreationSuccess.value = true
                
            case .failure(let creationError):
                self.error.value = creationError
                
            }
        }
    }
    
    func didRead(completion: @escaping (Result<[Object], Error>) -> Void) {
        
    }
    
    func didUpdate() {
        
    }
    
    func didDelete(at index: Int, completion: @escaping (Result<Object, Error>) -> Void) {
        
    }
    
}
