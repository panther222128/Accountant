//
//  FirstRepository.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/05.
//

import Foundation

protocol AccountCategoryRepository {
    func create(_ object: AccountBookElementCategory, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void)
    func read(completion: @escaping (Result<[AccountBookElementCategory], Error>) -> Void)
    func update(_ object: AccountBookElementCategory, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void)
    func delete(at index: Int, completion: @escaping (Result<AccountBookElementCategory, Error>) -> Void)
    func deleteAll(completion: @escaping (Result<[AccountBookElementCategory], Error>) -> Void)
}
