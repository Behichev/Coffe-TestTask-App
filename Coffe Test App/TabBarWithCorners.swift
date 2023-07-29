//
//  TabBarWithCorners.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 29.07.2023.
//

import UIKit

@IBDesignable
class TabBarWithCorners: UITabBar {
    
    @IBInspectable private var color: UIColor?
    @IBInspectable private var radii: CGFloat = 32
    
    public var didTapButton: (() -> ())?
    
    private var shapeLayer: CALayer?
    private lazy var middleButton: UIButton! = {
        let middleButton = UIButton()
        
        middleButton.frame.size = CGSize(width: 57, height: 57)
        
        let image = UIImage(named: "qr-code")!
        middleButton.setImage(image, for: .normal)
        middleButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        middleButton.backgroundColor = UIColor(named: "purple")
        middleButton.tintColor = .white
        middleButton.layer.cornerRadius = 20
        middleButton.layer.borderWidth = 2
        middleButton.layer.borderColor = UIColor(named: "borderPink")?.cgColor
        
        middleButton.addTarget(self, action: #selector(self.middleButtonAction), for: .touchUpInside)
        
        self.addSubview(middleButton)
        
        return middleButton
    }()
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3)
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0))
        
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame = self.frame
        var bottomSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        tabFrame.size.height = 65 + (bottomSafeArea ?? .zero)
        tabFrame.origin.y = self.frame.origin.y + (self.frame.height - 65 - (bottomSafeArea ?? .zero))
        self.layer.cornerRadius = 20
        self.frame = tabFrame
        self.items?.forEach({$0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0)})
        middleButton.center = CGPoint(x: frame.width / 2, y: 14)
    }
    
    @objc func middleButtonAction(sender: UIButton) {
        didTapButton?()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        
        return self.middleButton.frame.contains(point) ? self.middleButton : super.hitTest(point, with: event)
    }
    
}
