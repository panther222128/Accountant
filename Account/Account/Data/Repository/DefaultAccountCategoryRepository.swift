//
//  DefaultFirstRepository.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import Foundation

final class DefaultAccountCategoryRepository: AccountCategoryRepository {
    
    private let dataTransferService: DataTransferService
    private let storage: Storage
    
    init(dataTransferService: DataTransferService, storage: Storage) {
        self.dataTransferService = dataTransferService
        self.storage = storage
    }
    
    func create(_ object: AccountBookElementCategory, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void) {
        storage.create(AccountBookElementCategoryStorageEntity(accountBookElementCategoryStorageEntityType: AccountBookElementCategoryStorageEntityType(rawValue: object.accountBookElementCategoryType?.rawValue ?? ""), accountBookElementCategoryImageName: object.accountBookElementCategoryImageName, accountBookElementCategoryName: object.accountBookElementCategoryName)) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func read(completion: @escaping (Result<[AccountBookElementCategory], Error>) -> Void) {
        storage.read(AccountBookElementCategoryStorageEntity.self) { result in
            switch result {
            case .success(let data):
                let domain = data.map ( { $0.convertToDomain() } )
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func update(_ object: AccountBookElementCategory, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void) {
        storage.update(AccountBookElementCategoryStorageEntity(accountBookElementCategoryStorageEntityType: AccountBookElementCategoryStorageEntityType(rawValue: object.accountBookElementCategoryType?.rawValue ?? ""), accountBookElementCategoryImageName: object.accountBookElementCategoryImageName, accountBookElementCategoryName: object.accountBookElementCategoryName)) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func delete(at index: Int, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void) {
        storage.delete(AccountBookElementCategoryStorageEntity.self, at: index) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func deleteAll(completion: @escaping (Result<[AccountBookElementCategory], Error>) -> Void) {
        storage.deleteAll(AccountBookElementCategoryStorageEntity.self) { result in
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
