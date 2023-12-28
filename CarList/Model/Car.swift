

import UIKit
import RealmSwift

struct Car {
    let model: String
    let producer: String
    let year: String
    let photo: UIImage
    let color: UIColor
}

class CarObject: Object {
    @Persisted var model: String = ""
    @Persisted var producer: String = ""
    @Persisted var year: String = ""
    @Persisted var photoData: Data?
    @Persisted var color: String = ""

    convenience init(model: String, producer: String, year: String, photo: UIImage, color: UIColor) {
        self.init()
        self.model = model
        self.producer = producer
        self.year = year
        self.photoData = photo.jpegData(compressionQuality: 0.8)
        self.color = color.toHexString()
    }
}
