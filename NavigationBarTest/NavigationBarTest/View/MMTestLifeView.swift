//
//  MMTestLifeView.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/11/5.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class MMTestLifeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        printLog(message: "v-1")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        printLog(message: "v-1-1")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        printLog(message: "v-2")
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
