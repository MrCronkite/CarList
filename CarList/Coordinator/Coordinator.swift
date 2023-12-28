

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: AssemblyBuilder { get set }
    
    func start()
    func createCarController()
    func showDetails(cars: [Car], index: Int)
    func changeCardCar(index: Int)
    func popToRoot()
    func dismiss()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var assemblyBuilder: AssemblyBuilder
    var mainVC: CarsViewController?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
        
        mainVC = assemblyBuilder.mainCarModule(coordinator: self) as? CarsViewController
        
    }
    
    func start() {
        navigationController.pushViewController(mainVC!, animated: false)
    }
    
    func createCarController() {
        let createCarVC = assemblyBuilder.createCarModule(coordinator: self)
        navigationController.topViewController?.present(createCarVC, animated: true)
    }
    
    func changeCardCar(index: Int) {
        let createCarVC = assemblyBuilder.createCarModule(coordinator: self) as! CreateCarViewController
        createCarVC.presenter?.setCarData(index: index)
        createCarVC.presenter?.isChangeData = true
        navigationController.topViewController?.present(createCarVC, animated: true)
    }
    
    func showDetails(cars: [Car], index: Int) {
        let vc = assemblyBuilder.detailsCarModule(coordinator: self) as? CarsDetailsViewController
        vc?.presenter?.setupData(cars: cars, index: index)
        navigationController.pushViewController(vc!, animated: true)
    }
    
    func dismiss() {
        mainVC?.presenter?.setupData()
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    func popToRoot() {
        mainVC?.presenter?.setupData()
        navigationController.popToRootViewController(animated: true)
    }
}

