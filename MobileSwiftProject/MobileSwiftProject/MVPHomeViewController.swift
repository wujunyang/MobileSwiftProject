//
//  MVPHomeViewController.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/11/19.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit

class MVPHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var mvpDataTableView:UITableView!
    var mvpTableDataList:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.blue;
        
        self.setMvpDataTableView();
        
        self.setData();
    }
    
    //Data
    func setData(){
        mvpTableDataList=["SnapKit","Alamofire"];
        mvpDataTableView.reloadData();
    }
    
    //UI
    func setMvpDataTableView(){
        mvpDataTableView=UITableView.init();
        mvpDataTableView.frame=CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        mvpDataTableView.backgroundColor = .white;
        mvpDataTableView.dataSource=self;
        mvpDataTableView.delegate=self;
        mvpDataTableView.register(MVPHomeTableViewCell.classForCoder(), forCellReuseIdentifier: "MVPHomeTableViewCell");
        if #available(iOS 11.0, *)
        {
            mvpDataTableView.contentInsetAdjustmentBehavior = .never
        }
        self.view.addSubview(mvpDataTableView);
    }
    
    
    //UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mvpTableDataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCellID="MVPHomeTableViewCell";
        let cell:MVPHomeTableViewCell!=tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as? MVPHomeTableViewCell;
        
        cell.textLabel?.text=mvpTableDataList[indexPath.row] as? String;
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0
        {
            let vc=MVPSnapKitViewController();
            self.navigationController?.pushViewController(vc, animated: true);
        }
        if indexPath.row==1
        {
            let vc=MVPAlamofireViewController();
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }
}
