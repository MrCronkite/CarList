

import UIKit

protocol CreateCarViewProtocol: AnyObject {
    func showAlert()
    func setViewData(car: Car)
}

protocol CreateCarPresenter: AnyObject {
    var cars: [CarObject] { get set }
    var index: Int { get set }
    var isChangeData: Bool { get set }
    
    func close()
    func saveData(model: String?, producer: String?, year: String?, photo: UIImage?, color: UIColor?)
    func changeData(model: String?, producer: String?, year: String?, photo: UIImage?, color: UIColor?)
    func setCarData(index: Int)
}

final class CreateCarPresenterImpl: CreateCarPresenter {
    weak var view: CreateCarViewProtocol?
    weak var coordinator: Coordinator?
    var storage: StorageManager?
    var cars: [CarObject] = []
    var index: Int = 0
    var isChangeData: Bool = false
    
    init(view: CreateCarViewProtocol, coordinator: Coordinator, storage: StorageManager) {
        self.view = view
        self.coordinator = coordinator
        self.storage = storage
        
        getData()
    }
    
    func saveData(model: String?, producer: String?, year: String?, photo: UIImage?, color: UIColor?) {
        if model != nil && producer != nil && year != nil && photo != nil && color != nil {
            let car = CarObject(model: model!, producer: producer!, year: year!, photo: photo!, color: color!)
            cars.append(car)
            
            do {
                try storage?.saveObject(cars)
            } catch let error {
                print("Error retrieving objects: \(error)")
            }
            
            coordinator?.dismiss()
        } else { view?.showAlert() }
    }
    
    func changeData(model: String?, producer: String?, year: String?, photo: UIImage?, color: UIColor?) {
        
        let car = CarObject(model: model!, producer: producer!, year: year!, photo: photo!, color: color!)
        cars.remove(at: index)
        cars.insert(car, at: index)
        
        do {
            try storage?.deleteObject()
            
            try storage?.saveObject(cars)
            cars.removeAll()
            coordinator?.dismiss()
        } catch let error {
            print("Error updating objects: \(error)")
        }
    }
    
    func close() {
        coordinator?.dismiss()
    }
    
    func setCarData(index: Int) {
        self.index = index
        view?.setViewData(car: self.cars.convertToCarStructs()[index])
    }
    
    private func getData() {
        do {
            let cars = try storage?.getObject()
            self.cars = cars ?? []
        } catch let error {
            print("Error retrieving objects: \(error)")
        }
    }
}
