//
//  MQBaseNavigationViewController.swift
//  MMQRCode
//
//  Created by yangjie on 2019/7/25.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMBaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏底部线
        self.navigationBar.shadowImage = UIImage()
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.interactivePopGestureRecognizer?.delegate = self as UIGestureRecognizerDelegate
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
            var itemStyle = PopItemStyle.PopItemBlack
            
            if viewController.responds(to: #selector(naviBarPopItemStyle)) {
                itemStyle = viewController.naviBarPopItemStyle()
            }
//            let popItem = UIBarButtonItem.barButtomItem(title: nil, selectedTitle: nil, titleColor: nil, titleFont: nil, selectedColor: nil, image: itemStyle == PopItemStyle.PopItemBlack ? "btn_back_black" : "btn_back_white" , selectedImg: nil, target: viewController, selecter: #selector(popToPreviousVC))
//            viewController.navigationItem.leftBarButtonItem = popItem
        }
        super .pushViewController(viewController, animated: true)
    }
//    override func popViewController(animated: Bool) -> UIViewController? {
//        return super .popViewController(animated: animated)
//    }
}

extension LMBaseNavigationViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if viewControllers.count > 1 {
            return true
        }
        return false
    }
}

extension UINavigationController {
    func barbBackgroundColor(hex: UInt64, alpha: CGFloat) -> Void {
         self.navigationBar.setBackgroundImage(UIColor.mm_colorImgHex(color_vaule: hex,alpha: alpha), for: UIBarPosition.any, barMetrics: .default)
    }
    
    
    /// 移除第一个出现的vc
    ///
    /// - Parameters:
    ///   - vcStr: vc
    ///   - reverse: 是否倒序
    func removeFirstPurposeVC(vcStr: String, reverse: Bool = false) -> Void {
        var controllers = viewControllers
        if reverse {
            for index in (0..<viewControllers.count).reversed() {
                let indexVC = viewControllers[index]
                if indexVC.isKind(of: NSClassFromString(vcStr)!) {
                    controllers.remove(at: index)
                    break
                }
            }
        } else {
            for index in 0..<viewControllers.count {
                let indexVC = viewControllers[index]
                if indexVC.isKind(of: NSClassFromString(vcStr)!) {
                    controllers.remove(at: index)
                    break
                }
            }
        }
        self.viewControllers = controllers
    }
}
