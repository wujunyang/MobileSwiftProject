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
        
        //-----------------
        let thelper = MVPTHelper.init();
        
        //------------------MVPNilHelper------------------
        let curNilHelper=MVPNilHelper();
        
        if let roomCount=curNilHelper.mvpPerson?.numberOfRooms
        {
            print("John's residence has \(roomCount) room(s).")
        }
        else{
            print("Unable to retrieve the number of rooms."); //--
        }
        
        let curNilPerson=MVPNilPerson();
        curNilHelper.mvpPerson=curNilPerson;
        
        if let roomCount=curNilHelper.mvpPerson?.numberOfRooms
        {
            print("John's residence has \(roomCount) room(s).");//--
        }
        else{
            print("Unable to retrieve the number of rooms.")
        }
        
        //------------------NotificationCenter------------------
        let curNotification=MVPNotificationCenterHelper();
        
        //监听
        curNotification.startNotificationObserver();
        
        //开始发布
        curNotification.sendNotification();
    }
    
    

}
