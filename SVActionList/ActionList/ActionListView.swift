//
//  ActionListView.swift
//  SVActionList
//
//  Created by Vitaliy on 04.02.2021.
//

import UIKit

class ActionListView: UIView {
    
    @IBInspectable
    var isTopLeft: Bool = false
    
    @IBInspectable
    var isTopRight: Bool = false
    
    @IBInspectable
    var isBottomLeft: Bool = false
    
    @IBInspectable
    var isBottomRight: Bool = false
    
    @IBInspectable
    var cornerRadius: CGFloat = 0

    override func layoutSubviews() {
        super.layoutSubviews()
        var corners: UIRectCorner = []
        if isTopLeft { corners.insert(.topLeft) }
        if isTopRight { corners.insert(.topRight) }
        if isBottomLeft { corners.insert(.bottomLeft) }
        if isBottomRight { corners.insert(.bottomRight) }
        roundCorners(corners: corners, radius: cornerRadius)
    }
    
    private func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        layer.masksToBounds = false
    }
}
