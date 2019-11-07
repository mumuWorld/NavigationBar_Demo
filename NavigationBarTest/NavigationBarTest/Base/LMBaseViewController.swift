//
//  MQBaseViewController.swift
//  MMQRCode
//
//  Created by yangjie on 2019/7/25.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

let LMEmptyCellID = "LMEmptyCellID"
class LMBaseTableViewController: LMBaseViewController {
    
    lazy var listView: UITableView = {
        let list = UITableView(frame: .zero, style: .plain)
        list.delegate = self
        list.dataSource = self
        list.estimatedRowHeight = 0
        list.estimatedSectionFooterHeight = 0
        list.estimatedSectionHeaderHeight = 0
        list.register(UITableViewCell.self, forCellReuseIdentifier: LMEmptyCellID)
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension LMBaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LMEmptyCellID, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
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

