

import UIKit

class DashedCircleWithCrossView: UIView {
    private let dashedCircleLayer = CAShapeLayer()
    private let crossLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDashedCircleLayer()
        setupCrossLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDashedCircleLayer()
        setupCrossLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dashedCircleLayer.frame = bounds
        crossLayer.frame = bounds
    }
    
    private func setupDashedCircleLayer() {
        dashedCircleLayer.strokeColor = UIColor.white.cgColor
        dashedCircleLayer.lineWidth = 3
        dashedCircleLayer.lineDashPattern = [4, 4]
        
        let path = UIBezierPath(ovalIn: bounds)
        dashedCircleLayer.path = path.cgPath
        dashedCircleLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(dashedCircleLayer)
    }
    
    private func setupCrossLayer() {
        crossLayer.strokeColor = UIColor.white.cgColor
        crossLayer.lineWidth = 4
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX - 10, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX + 10, y: bounds.midY))
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY - 10))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + 10))
        
        crossLayer.path = path.cgPath
        
        layer.addSublayer(crossLayer)
    }
}

