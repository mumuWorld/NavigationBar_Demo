//
//  MQBaseViewController.swift
//  MMQRCode
//
//  Created by yangjie on 2019/7/25.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMBaseTableViewController: UITableViewController {
    
}

@objc 
class LMBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}

extension UIViewController {
    func registerKeyboardNotify() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNofity(notify:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNofity(notify:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func resignKeyboardNotify() -> Void {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardNofity(notify: Notification) -> Void {
        let duration = notify.userInfo!["UIKeyboardAnimationDurationUserInfoKey"]
        let endFrame = (notify.userInfo!["UIKeyboardFrameEndUserInfoKey"] as! NSValue).cgRectValue
        if (notify.name == UIResponder.keyboardWillChangeFrameNotification) {
            keyboardWillShowOrHide(isShow: true, time: duration as! Double, keyboardFrame: endFrame)
        } else {
            keyboardWillShowOrHide(isShow: false, time: duration as! Double, keyboardFrame: endFrame)
        }
    }

    @objc func keyboardWillShowOrHide(isShow: Bool,time: Double, keyboardFrame: CGRect) -> Void {
        
    }
}


extension UIViewController {
    @objc enum PopItemStyle:Int {
        case PopItemBlack = 0,PopItemWhite
    }
    
    @objc func naviBarPopItemStyle() -> PopItemStyle {
        return .PopItemBlack
    }
    
    @objc func popToPreviousVC() {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        }
    }

}

