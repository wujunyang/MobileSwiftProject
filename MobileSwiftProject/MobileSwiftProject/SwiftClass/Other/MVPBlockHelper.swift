//
//  MVPBlockHelper.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/12/19.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPBlockHelper: NSObject {

    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    func sortNames1()
    {
        var namelist=[String]();
        namelist=["abc","feg","abd","bdc","gab"];
        
        let changelist=namelist.sorted(by:self.backward(_:_:));
        
        print("第一种block效果\n");
        print(changelist);
    }
    
    
//    闭包语法另一种写法：
//
//    { (parameters) -> return type in
//        statements
//    }
    
    func sortNames()
    {
        var namelist=[String]();
        namelist=["abc","feg","abd","bdc","gab"];
        
        let changelist=namelist.sorted { (s1:String,s2:String) -> Bool in
            return s1>s2;
        };
        
        print("第一种block效果\n");
        print(changelist);
    }
    
    //根据上下文推断类型
    
    func sortNames3()
    {
        var namelist=[String]();
        namelist=["abc","feg","abd","bdc","gab"];
        
        let changelist=namelist.sorted(by:{s1,s2 in return s1>s2});
        
        print("第三种block效果\n");
        print(changelist);
    }
    
    //return也可以省略
    
    func sortNames4()
    {
        var namelist=[String]();
        namelist=["abc","feg","abd","bdc","gab"];
        
        let changelist=namelist.sorted(by:{s1,s2 in s1>s2});
        
        print("第四种block效果\n");
        print(changelist);
    }
}
