

import UIKit

extension Array where Element == CarObject {
    func convertToCarStructs() -> [Car] {
        self.reduce(into: [Car]()) { partialResult, object in
            let car = Car(model: object.model,
                          producer: object.producer,
                          year: object.year,
                          photo: UIImage(data: object.photoData!) ?? .close,
                          color: UIColor(hex: object.color) ?? .green)
            partialResult.append(car)
        }
    }
}

extension Array where Element == Car {
    func convertToCarStructs() -> [CarObject] {
        self.reduce(into: [CarObject]()) { partialResult, carObject in
            let car = CarObject(model: carObject.model,
                                producer: carObject.producer,
                                year: carObject.year,
                                photo: carObject.photo,
                                color: carObject.color)
            partialResult.append(car)
        }
    }
}
