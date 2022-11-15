//
//  DefaultAssetRepository.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/26.
//

import Foundation

final class DefaultAssetElementRepository: AssetElementRepository {
    
    private let dataTransferService: DataTransferService
    private let storage: Storage
    
    init(dataTransferService: DataTransferService, storage: Storage) {
        self.dataTransferService = dataTransferService
        self.storage = storage
    }
    
    func create(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        storage.create(AssetElementStorageEntity(assetElementEntityType: AssetElementEntityType(rawValue: object.assetElementType.rawValue)!, name: object.name, amount: object.amount)) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func read(completion: @escaping (Result<[AssetElement], Error>) -> Void) {
        storage.read(AssetElementStorageEntity.self) { result in
            switch result {
            case .success(let data):
                let domain = data.map { $0.convertToDomain() }
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func update(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        storage.update(AssetElementStorageEntity(assetElementEntityType: AssetElementEntityType(rawValue: object.assetElementType.rawValue)!, name: object.name, amount: object.amount)) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func delete(at index: Int, completion: @escaping (Result<AssetElement, Error>) -> Void) {
        storage.delete(AssetElementStorageEntity.self, at: index) { result in
            switch result {
            case .success(let data):
                let domain = data.convertToDomain()
                completion(.success(domain))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
    func deleteAll(completion: @escaping (Result<[AssetElement], Error>) -> Void) {
        storage.deleteAll(AssetElementStorageEntity.self) { result in
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
