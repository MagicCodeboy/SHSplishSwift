//
//  ViewController.swift
//  SHSplishViewSwift
//
//  Created by lalala on 2017/5/3.
//  Copyright © 2017年 lsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let splishView = SHSplishView.init(frame: UIScreen.main.bounds)
        splishView.initWith(array: ["剧场引导750-1334(1).png","剧场引导750-1334（2）.png","剧场引导750-1334（3）.png","剧场引导750-1334（4）.png"])
        self.view.addSubview(splishView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

