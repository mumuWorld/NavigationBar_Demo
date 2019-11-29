//
//  LMSecNaviViewController.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/9/11.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMSecNaviViewController: LMBaseViewController {
    
    var testDic:[Int: [Int]] = Dictionary()
    
    lazy var tmp: UIView? = {
        var testLazy = UIView()
        return testLazy
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "第二个标题"
        testDic[1] = [1,2,3,4,5,6]
        
        view.addSubview(tmp!)
        DispatchQueue.main.async {
            self.tmp!.removeFromSuperview()
            self.tmp = nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        printLog(message: "d")
//        testLoadXibVC()
        printLog(message: "f")
        arrtest()
//        print(tmp)
//        strTest()
    }
    
    func strTest() -> Void {
        var oriArr = [1,3,8,5,9,6]
        oriArr.sort(by: {
            return $0 < $1
        })
        print(oriArr)
    }
    
    
    func testLoadNormal() {
        let targetVC = LMLifeListViewController()
        printLog(message: "e")
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    func testLoadXibVC() -> Void {
        let xib = LMXibLifeListViewController.init(nibName: "LMXibLifeListViewController", bundle: nil)
        printLog(message: "e")
        xib.view.backgroundColor = .red
        navigationController?.pushViewController(xib, animated: true)
    }
    
    func arrtest() -> Void {
        var arr = testDic[1]
        
        printLog(message: arr)
        arr?.removeAll()
        
        printLog(message: testDic)
       
    }
}
