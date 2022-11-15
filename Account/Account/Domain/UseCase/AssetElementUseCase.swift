//
//  AssetUseCase.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/26.
//

import Foundation
import RealmSwift

protocol AssetElementUseCase {
    func executeCreate(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void)
    func executeRead(completion: @escaping (Result<[AssetElement], Error>) -> Void)
    func executeUpdate(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void)
    func executeDelete(_ object: AssetElement, at index: Int, completion: @escaping (Result<AssetElement, Error>) -> Void)
}

final class DefaultAssetElementUseCase: AssetElementUseCase {
    
    private let assetElementRepository: AssetElementRepository
    
    init(assetElementRepository: AssetElementRepository) {
        self.assetElementRepository = assetElementRepository
    }
    
    func executeCreate(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        assetElementRepository.create(object) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeRead(completion: @escaping (Result<[AssetElement], Error>) -> Void) {
        assetElementRepository.read { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeUpdate(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        assetElementRepository.update(object) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func executeDelete(_ object: AssetElement, at index: Int, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        assetElementRepository.delete(at: index) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}
