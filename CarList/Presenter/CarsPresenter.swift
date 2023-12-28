

import UIKit

protocol CarsViewProtocol: AnyObject {
    func reloadData()
}

protocol CarsPresenter: AnyObject {
    var cars: [Car] { get set }
    
    func openCreateCarController()
    func openDetailsCarController(index: Int)
    func setupData()
    func deleteItem(index: Int)
}

final class CarsPresenterImpl: CarsPresenter {
    weak var view: CarsViewProtocol?
    weak var coordinator: Coordinator?
    var storage: StorageManager?
    var cars: [Car] = []
    
    init(view: CarsViewProtocol, coordinator: Coordinator, storage: StorageManager) {
        self.view = view
        self.coordinator = coordinator
        self.storage = storage
    }
    
    func openCreateCarController() {
       coordinator?.createCarController()
    }
    
    func setupData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            do {
                let cars = try self.storage?.getObject()
                self.cars = cars?.convertToCarStructs() ?? []
                self.view?.reloadData()
            } catch let error {
                print("Error retrieving objects: \(error)")
            }
        }
    }
    
    func openDetailsCarController(index: Int) {
        coordinator?.showDetails(cars: cars, index: index)
    }
    
    func deleteItem(index: Int) {
        cars.remove(at: index)
        
        do {
            try storage?.deleteObject()
        } catch let error {
            print("Error retrieving objects: \(error)")
        }
        
        do {
            try storage?.saveObject(cars.convertToCarStructs())
        } catch let error {
            print("Error retrieving objects: \(error)")
        }
    }
}

