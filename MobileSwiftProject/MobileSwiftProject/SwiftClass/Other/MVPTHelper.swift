//
//  MVPTHelper.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/12/10.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPTHelper: NSObject {

    override init() {
        super.init();
        
        var firstItem=10;
        var lastItem=20;
        self.swapTwoInts(&firstItem, &lastItem);
        print("someInt is now \(firstItem), and anotherInt is now \(lastItem)")
        
        self.swapTwoValues(&firstItem, &lastItem);
        print("firstItem is now \(firstItem), and lastItem is now \(lastItem)")
    }
    
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
}
