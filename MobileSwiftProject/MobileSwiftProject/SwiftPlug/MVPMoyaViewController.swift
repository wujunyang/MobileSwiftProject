//
//  MVPMoyaViewController.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/12/17.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON


class MVPMoyaViewController: UIViewController {

    /// 用来主动取消网络请求
    var cancelableRequest: Cancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white;
        testZhiHuDailyAPI()///演示moya+handyJSON的使用，个人感觉handyJSON转模型比swifterJSON方便很多
        testAPI()//调用这个方法只是演示post请求 接口是调不通的
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 有些时候的需求是页面退出是取消网络请求。
        cancelableRequest?.cancel()
    }
    
    func testZhiHuDailyAPI() {
        cancelableRequest = NetWorkRequest(.easyRequset, completion: { (responseString) -> (Void) in
        if let daliyItems = [GHItem].deserialize(from: responseString, designatedPath: "stories") {
            daliyItems.forEach({ (item) in
                print("模型属性--\(item?.title ?? "模型无title")" )
            })
        }
        }, failed: { (failedResutl) -> (Void) in
            print("服务器返回code不为0000啦~\(failedResutl)")
        }, errorResult: { () -> (Void) in
            print("网络异常")
        })

    }
    
    /// 基本使用
    func testAPI() {
        var paraDict: [String:Any] = Dictionary()
        paraDict["app_type_"] = "1"
        paraDict["app_version_no_"] = "1.0.1"
        paraDict["platform_type_"] = "2"
        paraDict["ver_code_value_"] = nil
        NetWorkRequest(.updateAPi(parameters: paraDict)) { (responseString) -> (Void) in
            //后台flag为1000是后台的result code
            print(responseString)
        }
    }
    
    /// muti-form 多表单文件上传，这里使用的是png图片上传--接口地址是我瞎写的， 你按照实际后台地址写就行
    func uploadImage() {
        var para:[String:Any] = [:] //参数按照后台约定就成
        para["token"] = "token"
        para["juid"] = "id"
        para["file_type_"] = "head"
        
        let imageData = UIImage().jpegData(compressionQuality: 0.3) //把图片转换成data
        NetWorkRequest(.uploadHeadImage(parameters: para, imageDate: imageData!)) { (resultString) -> (Void) in
            ///处理后台返回的json字符串
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
