

import UIKit

extension UIColor {
    
    static let brightLilac = UIColor(r: 210, g: 86, b: 255)
    static let activColor = UIColor(named: "activ") ?? UIColor(r: 220, g: 210, b: 100)
    static let backgraundColor = UIColor(named: "backgraund") ?? UIColor(r: 220, g: 210, b: 100)
    static let inactivColor = UIColor(named: "inactiv") ?? UIColor(r: 220, g: 210, b: 100)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, _ a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func toHexString() -> String {
        guard let components = self.cgColor.components, components.count >= 3 else {
            return "#FFFFFF"
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        return String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}
