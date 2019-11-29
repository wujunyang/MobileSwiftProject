//
//  MVPSnapKitViewController.swift
//  MobileSwiftProject
//
//  Created by wujunyang on 2019/11/29.
//  Copyright © 2019 com.sdms. All rights reserved.
//

import UIKit
import SnapKit

class MVPSnapKitViewController: UIViewController {

    let mvpTitleLabel = UILabel();
    
    var mvpLeftView:UIView!;
    var mvpRightView:UIView!;
    var mvpBottomView:UIView!;
    
    var topConstraint:Constraint?;
    
    
    lazy var mvpBlackView=UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;

        self.setConfigUI();
        self.setBlackViewUI();
        
        
        self.mvpTitleLabel.text="测试";
        self.mvpTitleLabel.textColor = .black;
        self.mvpTitleLabel.backgroundColor = .blue;
        self.mvpTitleLabel.textAlignment = .center;
        self.view.addSubview(self.mvpTitleLabel);
        
        self.mvpTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.height.equalTo(100);
            make.centerY.equalToSuperview();
        }
    }
    
    func setBlackViewUI()
    {
        mvpBlackView.backgroundColor = .black;
        view.addSubview(mvpBlackView);
        
        mvpBlackView.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview();
            make.width.equalTo(50);
            make.height.equalTo(50);
        }
        
        //手势
        let gusture = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)));
        
        mvpBlackView.addGestureRecognizer(gusture);
    }
    
    func setConfigUI()
    {
        self.mvpLeftView=UIView();
        self.mvpLeftView.backgroundColor = .blue;
        self.view.addSubview(self.mvpLeftView);
        
        self.mvpRightView=UIView();
        self.mvpRightView?.backgroundColor = .red;
        self.view.addSubview(self.mvpRightView);
        
        self.mvpBottomView=UIView();
        self.mvpBottomView?.backgroundColor = .yellow;
        self.view.addSubview(self.mvpBottomView);
        
        
        self.mvpLeftView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 50));
            make.left.equalToSuperview();
            make.top.equalTo(100);
        }
        
        self.mvpRightView.snp.makeConstraints { make in
            make.width.equalTo(self.mvpLeftView.snp.width).multipliedBy(0.5);
            make.height.top.equalTo(self.mvpLeftView).offset(10);
            make.right.equalToSuperview().inset(20);
        }
        
        self.mvpBottomView.snp.remakeConstraints { make in
            make.left.equalTo(self.mvpLeftView);
            make.right.equalTo(self.mvpRightView);
            make.top.equalTo(self.mvpRightView.snp.bottom).offset(10);
            make.height.equalTo(50).priority(55);
            make.height.equalTo(100).priority(10);
        }
    }
    
    @objc func singleTap(_ tapGesture: UITapGestureRecognizer) {
        mvpBlackView.snp.updateConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 100));
        }
    }
    
}
