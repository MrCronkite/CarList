

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func setup(car: Car)
}

protocol DetailsCarPresenter: AnyObject {
    var cars: [Car] { get set }
    var index: Int { get set }
    
    func goToRoot()
    func changeCar()
    func setupData(cars: [Car], index: Int)
}

final class DetailsCarPresenterImpl: DetailsCarPresenter {
    weak var view: DetailsViewProtocol?
    weak var coordinator: Coordinator?
    var storage: StorageManager?
    var cars: [Car] = []
    var index: Int = 0
    
    init(view: DetailsViewProtocol, coordinator: Coordinator, storage: StorageManager) {
        self.view = view
        self.coordinator = coordinator
        self.storage = storage
    }
    
    func setupData(cars: [Car], index: Int) {
        self.cars = cars
        self.index = index
        view?.setup(car: self.cars[index])
    }
    
    func goToRoot() {
        coordinator?.popToRoot()
    }
    
    func changeCar() {
        coordinator?.changeCardCar(index: index)
    }
}
