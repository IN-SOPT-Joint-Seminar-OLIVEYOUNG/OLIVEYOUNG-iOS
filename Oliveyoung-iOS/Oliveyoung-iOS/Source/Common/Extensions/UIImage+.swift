//
//  UIImage+.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/12/02.
//

import UIKit.UIImage

extension UIImage {
    func resizeTopAlignedToFill(containerSize: CGSize) -> UIImage? {
        let scaleTarget = containerSize.height / containerSize.width
        let scaleOriginal = size.height / size.width
        
        if scaleOriginal <= scaleTarget { return self }
        
        let newHeight = size.width * scaleTarget
        let newSize = CGSize(width: size.width, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func aspectFitImage(inRect rect: CGRect) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        let aspectWidth = rect.width / width
        let aspectHeight = rect.height / height
        let scaleFactor = aspectWidth > aspectHeight ? rect.size.height / height : rect.size.width / width
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width * scaleFactor, height: height * scaleFactor), false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width * scaleFactor, height: height * scaleFactor))
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
