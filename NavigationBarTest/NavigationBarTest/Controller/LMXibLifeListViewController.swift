//
//  LMXibLifeListView.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/11/5.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMXibLifeListViewController: LMBaseTableViewController {

    lazy var lifeView: MMTestLifeView = {
        printLog(message: "4")
        let life = MMTestLifeView()
        printLog(message: "5")
        life.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        life.backgroundColor = .green
        printLog(message: "7")
        return life
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printLog(message: "g")
        printLog(message: "1")
        lifeView.tag = 10
        printLog(message: "2")
        view.addSubview(lifeView)
        printLog(message: "3")
        lifeView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        printLog(message: "6")
        
        loadViewIfNeeded()
    }
    override func loadView() {
        super.loadView()
        printLog(message: "i")
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        printLog(message: "j")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        printLog(message: "a")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        printLog(message: "b")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printLog(message: "c")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printLog(message: "h")
    }
}

/*
 [LMSecNaviViewController touchesBegan(_:with:)](22): d
 [LMSecNaviViewController testLoadXibVC()](37): e
 [LMSecNaviViewController touchesBegan(_:with:)](25): f
 [LMXibLifeListViewController loadView()](28): i
 [LMXibLifeListViewController viewDidLoad()](20): g
 [LMXibLifeListViewController viewDidLoad()](21): 1
 [MMTestLifeView init(frame:)](15): v-1
 [LMXibLifeListViewController viewDidLoad()](23): 2
 [MMTestLifeView willMove(toSuperview:)](40): v-3
 [MMTestLifeView didMoveToSuperview()](45): v-4
 [LMXibLifeListViewController viewWillAppear(_:)](48): c
 [LMXibLifeListViewController loadViewIfNeeded()](33): j
 [MMTestLifeView willMove(toWindow:)](35): v-5
 [MMTestLifeView didMoveToWindow()](50): v-6
 [LMXibLifeListViewController viewWillLayoutSubviews()](38): a
 [LMXibLifeListViewController viewDidLayoutSubviews()](43): b
 [MMTestLifeView layoutSubviews()](25): v-2
 [LMXibLifeListViewController viewDidAppear(_:)](53): h
 */

//修改 view

/*
 [LMSecNaviViewController touchesBegan(_:with:)](22): d
 [LMSecNaviViewController testLoadXibVC()](37): e
 [LMXibLifeListViewController loadView()](28): i
 [LMXibLifeListViewController viewDidLoad()](20): g
 [LMXibLifeListViewController viewDidLoad()](21): 1
 [MMTestLifeView init(frame:)](15): v-1
 [LMXibLifeListViewController viewDidLoad()](23): 2
 [MMTestLifeView willMove(toSuperview:)](40): v-3
 [MMTestLifeView didMoveToSuperview()](45): v-4
 [LMSecNaviViewController touchesBegan(_:with:)](25): f
 [LMXibLifeListViewController viewWillAppear(_:)](48): c
 [LMXibLifeListViewController loadViewIfNeeded()](33): j
 [MMTestLifeView willMove(toWindow:)](35): v-5
 [MMTestLifeView didMoveToWindow()](50): v-6
 [LMXibLifeListViewController viewWillLayoutSubviews()](38): a
 [LMXibLifeListViewController viewDidLayoutSubviews()](43): b
 [MMTestLifeView layoutSubviews()](25): v-2
 [LMXibLifeListViewController viewDidAppear(_:)](53): h
 */


/*  设置frame 和view 大小
 [LMSecNaviViewController touchesBegan(_:with:)](22): d
 [LMSecNaviViewController testLoadXibVC()](36): e
 [LMXibLifeListViewController loadView()](37): i
 [LMXibLifeListViewController viewDidLoad()](26): g
 [LMXibLifeListViewController viewDidLoad()](27): 1
 [LMXibLifeListViewController lifeView](14): 4
 [MMTestLifeView init(frame:)](15): v-1
 [LMXibLifeListViewController lifeView](16): 5
 [LMXibLifeListViewController lifeView](19): 7
 [LMXibLifeListViewController viewDidLoad()](29): 2
 [MMTestLifeView willMove(toSuperview:)](40): v-3
 [MMTestLifeView didMoveToSuperview()](45): v-4
 [LMXibLifeListViewController viewDidLoad()](31): 3
 [LMXibLifeListViewController viewDidLoad()](33): 6
 [LMSecNaviViewController touchesBegan(_:with:)](25): f
 [LMXibLifeListViewController viewWillAppear(_:)](57): c
 [LMXibLifeListViewController loadViewIfNeeded()](42): j
 [MMTestLifeView willMove(toWindow:)](35): v-5
 [MMTestLifeView didMoveToWindow()](50): v-6
 [LMXibLifeListViewController viewWillLayoutSubviews()](47): a
 [LMXibLifeListViewController viewDidLayoutSubviews()](52): b
 [MMTestLifeView layoutSubviews()](25): v-2
 [LMXibLifeListViewController viewDidAppear(_:)](62): h
 */
