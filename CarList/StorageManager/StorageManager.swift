

import RealmSwift
import Foundation

enum StorageError: Error {
    case realmError(description: String)
}

protocol StorageManager {
    func saveObject(_ cars: [CarObject]) throws
    func getObject() throws -> [CarObject]
    func deleteObject() throws
}

final class StorageManagerImpl: StorageManager {
    private let realm: Realm

    init() throws {
        self.realm = try Realm()
    }

    func saveObject(_ cars: [CarObject]) throws {
        do {
            try realm.write {
                realm.add(cars)
            }
        } catch let error as NSError {
            throw StorageError.realmError(description: "Failed to save objects: \(error.localizedDescription)")
        }
    }
    
    func getObject() throws -> [CarObject] {
        do {
            let cars = realm.objects(CarObject.self)
            return Array(cars)
        }
    }
    
    func deleteObject() throws {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            throw StorageError.realmError(description: "Failed to delete objects: \(error.localizedDescription)")
        }
    }
}
