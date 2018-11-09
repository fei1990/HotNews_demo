//
//  HotListFooterView.swift
//  FiveLine
//
//  Created by limx on 2018/5/18.
//  Copyright © 2018年 Kingnet. All rights reserved.
//

import UIKit

class HotListFooterView: UICollectionViewCell {
    
    lazy var bgView: UIView = {
        let v = UIView()
        self.contentView.addSubview(v)
        return v
    }()
    
    lazy var bglayer: CAShapeLayer = {
        let l = CAShapeLayer()
        l.fillColor = UIColor.sin_color(hexString: "0xf4f4f4").cgColor
        
        bgView.layer.addSublayer(l)
        return l
    }()
    
    lazy var label: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = normalText
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 13)
        l.textColor = UIColor.sin_color(hexString: "0x9f9f9f")
        l.isHidden = true
        
        self.contentView.addSubview(l)
        self.contentView.bringSubviewToFront(l)
        return l
    }()
    
    var offset: CGFloat = 0.0 {
        didSet {
            updateUI()
        }
    }
    
    let normalText = "拖\n动\n查\n看\n更\n多"
    let showMoreText = "松\n开\n查\n看\n更\n多"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.frame = self.bounds
        label.frame = self.bounds
    }
    
    func updateUI() {
        updateLayerPath()
        
        label.isHidden = offset <= 0
        
        // offset < 40
        
        label.frame = CGRect(x: self.bounds.width - offset, y: 10, width: 40, height: self.bounds.height - 20)
        if offset > 40 {
            label.frame = CGRect(x: self.bounds.width - 40, y: 10, width: 40, height: self.bounds.height - 20)
        }
        if offset > 64 {
            label.text = showMoreText
        } else {
            label.text = normalText
        }
        
        
        
    }
    
    func updateLayerPath() {
        let path = UIBezierPath()
        var topLeft = CGPoint(x: self.bounds.width - offset, y: 0)
        let topRight = CGPoint(x: self.bounds.width, y: 0)
        var bottomLeft = CGPoint(x: self.bounds.width - offset, y: self.bounds.height)
        let bottomRight = CGPoint(x: self.bounds.width, y: self.bounds.height)
        let middleLeft = CGPoint(x: self.bounds.width - offset, y: self.bounds.height/2)
        
        if offset > 40 {
            topLeft = CGPoint(x: self.bounds.width - 40, y: 0)
            bottomLeft = CGPoint(x: self.bounds.width - 40, y: self.bounds.height)
        }
        
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        
        let y = middleLeft.y
        let e = middleLeft.x
        let a = topLeft.x
        let b = topLeft.y
        let d = bottomLeft.y
        if a == e {
            return
        }
        let x = (a*a-e*e+(y-b)*(y-b))/(2*a-2*e)
        
        let center = CGPoint(x:x, y:y)
        let startAngel = atan2f(Float(d-y), Float(a-x))
        let endAngel = atan2f(Float(b-y), Float(a-x))
        
        path.addArc(withCenter: center, radius: x-e, startAngle: CGFloat(startAngel), endAngle: CGFloat(endAngel), clockwise: true)
        path.close()
        
        bglayer.path = path.cgPath
    }
    
}


//MARK: hex -> UIColor
extension UIColor {
    
    public class func sin_color(hexString: String) -> UIColor {
        
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        return UIColor.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    public class func sin_color(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    public class func sin_color(rgb: Int, a: CGFloat = 1.0) -> UIColor {
        return UIColor.sin_color(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF, a: a)
    }
}
