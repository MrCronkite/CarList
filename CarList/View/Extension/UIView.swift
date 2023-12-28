

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        self.addSubview(view)
    }
    
    func border(width: CGFloat = 0, color: UIColor? = nil, radius: CGFloat = 0) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addTransparentGradient() {
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
            gradient.locations = [0.0, 1.0]
            self.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    func applyShadow(corner: CGFloat = 0.0, opacity: Float = 0.1, shadow: CGFloat = 10.0, color: UIColor = UIColor.brightLilac, offset: CGSize = CGSize(width: 0, height: 6)) {
        layer.masksToBounds = false
        layer.borderWidth = 0.0
        layer.cornerRadius = corner
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadow
        layer.shadowOffset = offset
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, rect: CGRect? = nil) {
        let rect = rect ?? self.bounds
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func tapAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.backgroundColor = .activColor
        }) { _ in
            UIView.animate(withDuration: 0.4) {
                self.transform = CGAffineTransform.identity
                self.backgroundColor = .inactivColor
            }
        }
    }
}
