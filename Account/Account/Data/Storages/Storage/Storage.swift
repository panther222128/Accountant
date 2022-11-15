//
//  AssetElementStorage.swift
//  Account
//
//  Created by Jun Ho JANG on 2022/10/30.
//

import Foundation
import RealmSwift

protocol Storage {
    func create<T: Object>(_ object: T, completion: @escaping (Result<T, Error>) -> Void)
    func read<T: Object>(_ object: T.Type, completion: @escaping (Result<[T], Error>) -> Void)
    func update<T: Object>(_ object: T, completion: @escaping (Result<T, Error>) -> Void)
    func delete<T: Object>(_ object: T.Type, at index: Int, completion: @escaping (Result<T, Error>) -> Void)
    func deleteAll<T: Object>(_ object: T.Type, completion: @escaping (Result<[T], Error>) -> Void)
}

final class DefaultStorage {
    private let storageQueue: DispatchQueue
    
    init() {
        self.storageQueue = DispatchQueue(label: "storageQueue")
    }
    
}

extension DefaultStorage: Storage {
    
    func create<T: Object>(_ object: T, completion: @escaping (Result<T, Error>) -> Void) {
        storageQueue.async {
            do {
                let realm = try Realm()
                do {
                    try realm.write {
                        realm.add(object)
                        completion(.success(object))
                    }
                } catch {
                    completion(.failure(RealmError.create))
                }
            } catch {
                completion(.failure(RealmError.instantiate))
            }
        }
    }
    
    func read<T: Object>(_ object: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        storageQueue.async {
            do {
                let realm = try Realm()
                let realmObjects = realm.objects(T.self)
                let data = realmObjects.convertToArray(ofType: T.self)
                completion(.success(data))
            } catch {
                completion(.failure(RealmError.instantiate))
            }
        }
    }
    
    func update<T: Object>(_ object: T, completion: @escaping (Result<T, Error>) -> Void) {
        storageQueue.async {
            do {
                let realm = try Realm()
                do {
                    try realm.write {
                        realm.add(object, update: .modified)
                        completion(.success(object))
                    }
                } catch {
                    completion(.failure(RealmError.update))
                }
            } catch {
                completion(.failure(RealmError.instantiate))
            }
        }
    }
    
    func delete<T: Object>(_ object: T.Type, at index: Int, completion: @escaping (Result<T, Error>) -> Void) {
        storageQueue.async {
            do {
                let realm = try Realm()
                do {
                    try realm.write {
                        let realmObjects = realm.objects(T.self)
                        let data = realmObjects.convertToArray(ofType: T.self)
                        guard let target = data.filter( { $0 == data[index] } ).first else { return }
                        if data.count < index {
                            completion(.failure(RealmError.deleteRange))
                        } else {
                            realm.delete(target)
                        }
                    }
                } catch {
                    completion(.failure(RealmError.delete))
                }
            } catch {
                completion(.failure(RealmError.instantiate))
            }
        }
    }
    
    func deleteAll<T: Object>(_ object: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        storageQueue.async {
            do {
                let realm = try Realm()
                do {
                    try realm.write {
                        let realmObjects = realm.objects(T.self)
                        let data = realmObjects.convertToArray(ofType: T.self)
                        for datum in data {
                            realm.delete(datum)
                        }
                    }
                } catch {
                    completion(.failure(RealmError.delete))
                }
            } catch {
                completion(.failure(RealmError.instantiate))
            }
        }
    }
    
}
