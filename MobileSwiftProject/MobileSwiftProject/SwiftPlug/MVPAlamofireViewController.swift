//
//  MVPAlamofireViewController.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/12/10.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit
import Alamofire

class MVPAlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        // Do any additional setup after loading the view.
        
        self.mvpGet();
        
        self.mvpGetJson();
        
        self.mvpGetQueue();
        
        self.mvpValidate();
        
        self.mvpAutoValidate();
        
        self.mvpNetworkType();
        
        self.mvpGetParameters();
        
        self.mvpPostParameters();
        
        self.mvpJsonPostBody();
    }
    
    func mvpGet() {
        Alamofire.request("http://baidu.com");
    }
    
    func mvpGetJson()
    {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request ?? "")  // 原始的URL请求
            print(response.response ?? "") // HTTP URL响应
            print(response.data ?? "")     // 服务器返回的数据
            print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据

            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    func mvpGetQueue()
    {
        //默认情况下，响应handler是在主队列执行的。但是我们也可以自定义队列：
        let utitltyQuere=DispatchQueue.global(qos: .utility);
        
        Alamofire.request("https://httpbin.org/get").responseJSON(queue: utitltyQuere) { response in
            print("Executing response handler on utility queue")
        }
    }
    
    func mvpValidate()
    {
        //默认情况下，Alamofire把所有完成的请求当做是成功的请求，无论响应的内容是什么。如果响应有一个不能被接受的状态码或者MIME类型，在响应handler之前调用validate将会产生错误
        
        Alamofire.request("https://httpbin.org/get")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mvpAutoValidate()
    {
       //自动验证在200…299范围内的状态码；如果请求头中有指定Accept，那么也会验证响应头的与请求头Accept一样的Content-Type。
        Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mvpNetworkType()
    {
        Alamofire.request("https://httpbin.org/get") // 默认是get请求
        Alamofire.request("https://httpbin.org/post", method: .post)
        Alamofire.request("https://httpbin.org/put", method: .put)
        Alamofire.request("https://httpbin.org/delete", method: .delete)
    }
    
    func mvpGetParameters()
    {
        let parameters: Parameters = ["foo": "bar"]

        // 下面这三种写法是等价的
        Alamofire.request("https://httpbin.org/get", parameters: parameters) // encoding 默认是`URLEncoding.default`
        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding.default)
        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding(destination: .methodDependent))

        // https://httpbin.org/get?foo=bar
    }
    
    func mvpPostParameters()
    {
        let parameters: Parameters = [
            "foo": "bar",
            "baz": ["a", 1],
            "qux": [
                "x": 1,
                "y": 2,
                "z": 3
            ]
        ]

        // 下面这三种写法是等价的
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters)
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.default)
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)

        // HTTP body: foo=bar&baz[]=a&baz[]=1&qux[x]=1&qux[y]=2&qux[z]=3
        
        //另 1:设置Bool类型参数的编码
        //URLEncoding.BoolEncoding提供了两种编码方式：
        //.numeric：把true编码为1，false编码为0
        //.literal：把true编码为true，false编码为false
        //默认情况下：Alamofire使用.numeric。
        //可以使用下面的初始化函数来创建URLEncoding，指定Bool编码的类型：
        //let encoding = URLEncoding(boolEncoding: .literal)
        
        //另 2：设置Array类型参数编码
        //URLEncoding.ArrayEncoding提供了两种编码方式：
        //.brackets: 在每个元素值的key后面加上一个[]，如foo=[1,2]编码成foo[]=1&foo[]=2
        //.noBrackets：不添加[]，例如foo=[1,2]编码成``foo=1&foo=2`
        //默认情况下，Alamofire使用.brackets。
        //可以使用下面的初始化函数来创建URLEncoding，指定Array编码的类型：
        //let encoding = URLEncoding(arrayEncoding: .noBrackets)
    }
    
    func mvpJsonPostBody()
    {
        let parameters: Parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]

        // 下面这两种写法是等价的
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding(options: []))

        // HTTP body: {"foo": [1, 2, 3], "bar": {"baz": "qux"}}
    }
    
    func mvpHttpHeader()
    {
        let headers: HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]

        Alamofire.request("https://httpbin.org/headers", headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
}







//        // 响应 Handler - 未序列化的响应
//        func response(
//            queue: DispatchQueue?,
//            completionHandler: @escaping (DefaultDataResponse) -> Void)
//            -> Self
//
//        // 响应数据 Handler - 序列化成数据类型
//        func responseData(
//            queue: DispatchQueue?,
//            completionHandler: @escaping (DataResponse<Data>) -> Void)
//            -> Self
//
//        // 响应字符串 Handler - 序列化成字符串类型
//        func responseString(
//            queue: DispatchQueue?,
//            encoding: String.Encoding?,
//            completionHandler: @escaping (DataResponse<String>) -> Void)
//            -> Self
//
//        // 响应 JSON Handler - 序列化成Any类型
//        func responseJSON(
//            queue: DispatchQueue?,
//            completionHandler: @escaping (DataResponse<Any>) -> Void)
//            -> Self
//
//        // 响应 PropertyList (plist) Handler - 序列化成Any类型
//        func responsePropertyList(
//            queue: DispatchQueue?,
//            completionHandler: @escaping (DataResponse<Any>) -> Void))
//            -> Self
