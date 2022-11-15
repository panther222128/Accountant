//
//  StorageUseCase.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/04.
//

import Foundation

protocol AccountBookElementUseCase {
    func executeCreate(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func executeRead(completion: @escaping (Result<[AccountBookElement], Error>) -> Void)
    func executeUpdate(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func executeDelete(at index: Int, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func executeDeleteAll(completion: @escaping (Result<[AccountBookElement], Error>) -> Void)
}

final class DefaultAccountBookElementUseCase: AccountBookElementUseCase {
    
    private let accountBookElementRepository: AccountBookElementRepository
    
    init(accountBookElementRepository: AccountBookElementRepository) {
        self.accountBookElementRepository = accountBookElementRepository
    }
    
    func executeCreate(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        accountBookElementRepository.create(object) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeRead(completion: @escaping (Result<[AccountBookElement], Error>) -> Void) {
        accountBookElementRepository.read { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeUpdate(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        accountBookElementRepository.update(object) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeDelete(at index: Int, completion: @escaping (Result<AccountBookElement, Error>) -> Void) {
        accountBookElementRepository.delete(at: index) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeDeleteAll(completion: @escaping (Result<[AccountBookElement], Error>) -> Void) {
        accountBookElementRepository.deleteAll { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}
