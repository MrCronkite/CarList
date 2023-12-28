

import UIKit

protocol AssemblyBuilder: AnyObject {
    func mainCarModule(coordinator: Coordinator) -> UIViewController
    func createCarModule(coordinator: Coordinator) -> UIViewController
    func detailsCarModule(coordinator: Coordinator) -> UIViewController
}

final class AssemblyBuilderImpl: AssemblyBuilder {
    func mainCarModule(coordinator: Coordinator) -> UIViewController {
        let view = CarsViewController()
        let storage = try! StorageManagerImpl()
        let presenter = CarsPresenterImpl(view: view, coordinator: coordinator, storage: storage)
        view.presenter = presenter
        return view
    }
    
    func createCarModule(coordinator: Coordinator) -> UIViewController {
        let view = CreateCarViewController()
        let storage = try! StorageManagerImpl()
        let presenter = CreateCarPresenterImpl(view: view, coordinator: coordinator, storage: storage)
        view.presenter = presenter
        return view
    }
    
    func detailsCarModule(coordinator: Coordinator) -> UIViewController {
        let view = CarsDetailsViewController()
        let storage = try! StorageManagerImpl()
        let presenter = DetailsCarPresenterImpl(view: view, coordinator: coordinator, storage: storage)
        view.presenter = presenter
        return view
    }
}
