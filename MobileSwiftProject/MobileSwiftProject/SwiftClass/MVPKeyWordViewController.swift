//
//  MVPKeyWordViewController.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/11/20.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPKeyWordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //------------------方法调用------------------
        MVPAsHelper.showName();
        
        //------------------NotificationCenter------------------
        let curNotification=MVPNotificationCenterHelper();
        
        //监听
        curNotification.startNotificationObserver();
        
        //开始发布
        curNotification.sendNotification();
    }
    
    

}
