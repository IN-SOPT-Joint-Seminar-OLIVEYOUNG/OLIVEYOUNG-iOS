//
//  UIView+.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/15.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    public func makeRounded(radius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    public func makeColorRounded(_ radius: CGFloat, _ width: CGFloat, _ color: UIColor) {
        
        self.makeRounded(radius: radius)
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
//    enum ViewBorder: String {
//        case Left = "borderLeft"
//        case Right = "borderRight"
//        case Top = "borderTop"
//        case Bottom = "borderBottom"
//    }
    
//    func addBorder(vBorders: [ViewBorder], color: UIColor, width: CGFloat) {
//        vBorders.forEach { vBorder in
//            let border = CALayer()
//            border.backgroundColor = color.cgColor
//            border.name = vBorder.rawValue
//            switch vBorder {
//            case .Left:
//                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
//            case .Right:
//                border.frame = CGRect(x:self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
//            case .Top:
//                border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
//            case .Bottom:
//                border.frame = CGRect(x: 0, y: self.frame.size.height - width , width: self.frame.size.width, height: width)
//            }
//            self.layer.addSublayer(border)
//        }
//    }
}

