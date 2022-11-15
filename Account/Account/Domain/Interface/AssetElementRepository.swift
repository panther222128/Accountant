//
//  AssetRepository.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/26.
//

import Foundation

protocol AssetElementRepository {
    func create(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void)
    func read(completion: @escaping (Result<[AssetElement], Error>) -> Void)
    func update(_ object: AssetElement, completion: @escaping (Result<AssetElement, Error>) -> Void)
    func delete(at index: Int, completion: @escaping (Result<AssetElement, Error>) -> Void)
}
