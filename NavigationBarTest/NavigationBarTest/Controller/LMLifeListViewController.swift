//
//  LMLifeListViewController.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/11/5.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMLifeListViewController: LMBaseTableViewController {

    lazy var lifeView: MMTestLifeView = {
        let life = MMTestLifeView()
        return life
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printLog(message: "g")
        printLog(message: "1")
        lifeView.tag = 10
        printLog(message: "2")
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
 [LMSecNaviViewController touchesBegan(_:with:)](20): d
 [LMSecNaviViewController touchesBegan(_:with:)](22): e
 [LMSecNaviViewController touchesBegan(_:with:)](24): f
 [LMLifeListViewController viewDidLoad()](20): g
 [LMLifeListViewController viewDidLoad()](21): 1
 [MMTestLifeView init(frame:)](15): self
 [LMLifeListViewController viewDidLoad()](23): 2
 [LMLifeListViewController viewWillAppear(_:)](38): c
 [LMLifeListViewController viewWillLayoutSubviews()](28): a
 [LMLifeListViewController viewDidLayoutSubviews()](33): b
 [LMLifeListViewController viewDidAppear(_:)](43): h
 */
