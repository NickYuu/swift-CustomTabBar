//
//  MainViewController.swift
//  CustomTab
//
//  Created by TsungHan on 2017/7/15.
//  Copyright © 2017年 TsungHan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var btn : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbtn()
    }
    
    /// 設定按鈕
    func setupbtn() {
        
        // 設定圖片
        let image = UIImage(named: "camera")
        btn.setImage(image, for: .normal)
        
        
        // 按鈕位置
        btn.frame.size = CGSize(width: 60, height: 60)
        btn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height/2 - 15)
        
        // 樣式設定
        let color = UIColor(red: 151/255, green: 216/255, blue: 246/255, alpha: 1)
        btn.backgroundColor = color
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        
        // 添加按鈕
        tabBar.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }
    
    func btnClick() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "camera")
        present(vc!, animated: true, completion: nil)
    }
    
}
