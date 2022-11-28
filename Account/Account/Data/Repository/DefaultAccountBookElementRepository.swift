//
//  DefaultAssetRepository.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/04.
//

import Foundation

final class DefaultAccountBookElementRepository: AccountBookElementRepository {
    
    private let dataTransferService: DataTransferService
    private let storage: Storage
    
    init(dataTransferService: DataTransferService, storage: Storage) {
        self.dataTransferService = dataTransferService
        self.storage = storage
    }
    
    func create(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        storage.create(AccountBookElementStorageEntity(history: object.history, amount: object.amount, paymentEntityType: PaymentEntityType(rawValue: object.paymentType?.rawValue ?? ""), accountBookElementCategoryStorageEntity: AccountBookElementCategoryStorageEntity(accountBookElementCategoryStorageEntityType: .init(rawValue: object.accountCategory?.accountBookElementCategoryType?.rawValue ?? ""), accountBookElementCategoryImageName: object.accountCategory?.accountBookElementCategoryImageName ?? "", accountBookElementCategoryName: object.accountCategory?.accountBookElementCategoryName ?? ""))) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func read(completion: @escaping (Result<[AccountBookElement], Error>) -> Void) {
        storage.read(AccountBookElementStorageEntity.self) { result in
            switch result {
            case .success(let data):
                let domain = data.map { $0.convertToDomain() }
                print(domain)
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func update(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        storage.update(AccountBookElementStorageEntity(history: object.history, amount: object.amount, paymentEntityType: PaymentEntityType(rawValue: object.paymentType?.rawValue ?? ""), accountBookElementCategoryStorageEntity: AccountBookElementCategoryStorageEntity(accountBookElementCategoryStorageEntityType: .init(rawValue: object.accountCategory?.accountBookElementCategoryType?.rawValue ?? ""), accountBookElementCategoryImageName: object.accountCategory?.accountBookElementCategoryImageName ?? "", accountBookElementCategoryName: object.accountCategory?.accountBookElementCategoryName ?? ""))) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func delete(at index: Int, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        storage.delete(AccountBookElementStorageEntity.self, at: index) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func deleteAll(completion: @escaping (Result<[AccountBookElement], Error>) -> Void) {
        storage.deleteAll(AccountBookElementStorageEntity.self) { result in
            switch result {
            case .success(let data):
                let domain = data.map( { $0.convertToDomain() } )
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}
