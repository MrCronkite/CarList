

import UIKit

extension Date {
    static var currentYear: String {
        let date = Date()
        let calendar = Calendar.current
        return String(calendar.component(.year, from: date))
    }
}

extension UIDatePicker {
    func setYear(_ year: Int) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = 1
        dateComponents.day = 1

        if let date = calendar.date(from: dateComponents) {
            self.setDate(date, animated: true)
        }
    }
}
