//
//  MMTestLifeView.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/11/5.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMTestLifeView: UIView {
    
    var btn: CircleClickBtn = CircleClickBtn(type: .custom)
    
    var shapeLayer: CAShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        printLog(message: "v-1")
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(handleBtnClick(sender:)), for: .touchUpInside)
        addSubview(btn)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        printLog(message: "v-1-1")
    }
    
    @objc func handleBtnClick(sender: UIButton) -> Void {
        printLog(message: "btnClick")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        printLog(message: "v-2")
        btn.frame = bounds
//        btn.layer.cornerRadius = btn.frame.width * 0.5
//        btn.layer.masksToBounds = true
        let circlePath = UIBezierPath(ovalIn: bounds)
        shapeLayer.path = circlePath.cgPath
        btn.layer.mask = shapeLayer
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        printLog(message: "v-7")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        printLog(message: "v-5")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        printLog(message: "v-3")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        printLog(message: "v-4")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        printLog(message: "v-6")
    }
}

class CircleClickBtn: UIButton {
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let flag = super.point(inside: point, with: event)
//        printLog(message: "point->\(point)")
//        if flag {
//            let circlePath = UIBezierPath(ovalIn: bounds)
//            if circlePath.contains(point) {
//                return true
//            }
//        }
//        return false
//    }
}
