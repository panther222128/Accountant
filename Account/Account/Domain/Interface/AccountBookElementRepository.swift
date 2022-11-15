//
//  AccountBookElementRepository.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/11/04.
//

import Foundation

protocol AccountBookElementRepository {
    func create(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func read(completion: @escaping (Result<[AccountBookElement], Error>) -> Void)
    func update(_ object: AccountBookElement, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func delete(at index: Int, completion: @escaping (Result<AccountBookElement, Error>) -> Void)
    func deleteAll(completion: @escaping (Result<[AccountBookElement], Error>) -> Void)
}
