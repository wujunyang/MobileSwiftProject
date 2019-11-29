//
//  MVPAsHelper.swift
//  MobileSwiftProject
//
//  as、as!、as?三种类型转换
//
//  as   1）从派生类转换为基类，向上转型; 2）消除二义性，数值类型转换 3）switch 语句中进行模式匹配
//  as!  向下转型（Downcasting）时使用。由于是强制类型转换，如果转换失败会报 runtime 运行错误
//  as?  as? 和 as! 操作符的转换规则完全一样。但 as? 如果转换不成功的时候便会返回一个 nil     对象。成功的话返回可选类型值。由于 as? 在转换失败的时候也不会出现错误，所以对于如果能确保100%会成功的转换则可使用 as!，否则使用 as?
//
//  Created by wujunyang on 2019/11/20.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPAsHelper: NSObject {
    
    static func showName() {
        let tom=MVPStudent("Student Tom");
        let Jack=MVPTeacher("Teacher Jack");
        
        let person1=tom as MVPPersonModel;
        let person2=Jack as MVPPersonModel;

        showPersonName(person1)
        showPersonName(person2)
    }
}


class MVPPersonModel{
    var name:String
    init(_ name :String) {
        self.name = name;
    }
}

class MVPStudent: MVPPersonModel {
    
}

class MVPTeacher: MVPPersonModel {
    
}

func showPersonName(_ people : MVPPersonModel)
{
    let name = people.name
    print("这个人的名字是: \(name)")
}

//----------------------------------

//let age = 28 as Int
//let money = 20 as CGFloat
//let cost = (50 / 2) as Double

//----------------------------------


//----------------------------------
//switch person1 {
//    case let person1 as Student:
//        print("是Student类型，打印学生成绩单...")
//    case let person1 as Teacher:
//        print("是Teacher类型，打印老师工资单...")
//    default: break
//}
//----------------------------------


//----------------------------------
//2. as!
//let person : Person = Teacher("Jimmy Lee")
//let jimmy = person as! Teacher
//----------------------------------


//----------------------------------
//3. as?
//let person : Person = Teacher("Jimmy Lee")
//
//if let someone = person as? Teacher{
//    print("这个人是教师, 名字是 \(someone.name)")
//} else {
//    print("这个人不是教师, 'tom'的值是 nil")
//}
//----------------------------------
