//
//  MVPNotificationCenterHelper.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/11/26.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPNotificationCenterHelper: NSObject {

    func startNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(todoSomething), name: NSNotification.Name(rawValue: "todoNotification"), object: nil);
    }
    
    func sendNotification()
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "todoNotification"), object: nil);
        NSLog("发送通知了");
    }
    
    //处理方法应该@objc
    @objc func todoSomething() {
        NSLog("接收到通知了");
    }
    
}
