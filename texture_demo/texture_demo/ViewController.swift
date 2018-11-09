//
//  ViewController.swift
//  texture_demo
//
//  Created by wf on 2018/10/29.
//  Copyright © 2018年 sohu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushAction(_ sender: Any) {
        
        let firstVc = FirstViewController()
        
        self.navigationController?.pushViewController(firstVc, animated: true)
        
    }
    
}

