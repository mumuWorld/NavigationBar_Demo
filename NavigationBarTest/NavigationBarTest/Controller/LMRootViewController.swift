//
//  LMRootViewController.swift
//  NavigationBarTest
//
//  Created by yangjie on 2019/9/11.
//  Copyright © 2019 yangjie. All rights reserved.
//

import UIKit

class LMRootViewController: LMBaseViewController {

    lazy var tableView: UITableView = {
       let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "rootCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSet()
        print("DidLoad---\(view.frame)")
        changeBarTranslucent()
//        adjustTableView()
//        self.navigationController?.navigationBar.barStyle = .black
//        setBartintColor()
//        setbarBackgrounImg()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        changeBarTranslucent(isTranslucent: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DidAppear---\(view.frame)")
    }
    
    func defaultSet() -> Void {
        self.view.backgroundColor = .cyan
        self.tableView.backgroundColor = .red
//        self.tableView.backgroundColor = .green
        self.navigationItem.title = "rootVC 标题"
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    func adjustTableView() -> Void {
        //默认从顶部布局
        if #available(iOS 11.0,*) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
    }
    
    func changeBarTranslucent(isTranslucent: Bool = false) -> Void {
        //变成不透明  view从导航栏下方开始
        self.navigationController?.navigationBar.isTranslucent = isTranslucent
    }
    
    func setBartintColor() -> Void {
        self.navigationController?.navigationBar.barTintColor = UIColor.purple
    }
    
    func setbarBackgrounImg() -> Void {
        self.navigationController?.barbBackgroundColor(hex: 0xADFF2F)
    }
}



extension LMRootViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rootCell", for: indexPath)
        cell.textLabel?.text = "标题  \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //跳转到第二个
        let target = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LMSecNaviViewController")
        self.navigationController?.pushViewController(target, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("translate-----\(String(describing: self.navigationController?.navigationBar.isTranslucent))")
        for item in (self.navigationController?.navigationBar.subviews)! {
            if item.isKind(of: NSClassFromString("_UIBarBackground")!.self) {
                for subView in item.subviews {
                    print(subView)
                    print("alpha--\(subView.alpha)")
                }
            }
        }
    }
}
