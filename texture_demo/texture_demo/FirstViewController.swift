//
//  FirstViewController.swift
//  texture_demo
//
//  Created by wf on 2018/10/30.
//  Copyright © 2018 sohu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FirstViewController: ASViewController<ASDisplayNode> {

    let tableNode = ASTableNode()
    
    
    
    let samples = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.node)
        self.node.backgroundColor = .red
        
    }
    
    init() {
        
        super.init(node: FirstDisplayNode())
        
        self.title = "Layout Eaxmple"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        
//        tableNode.delegate = self
//
//        tableNode.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//extension FirstViewController: ASTableDataSource {
//
//    func numberOfSections(in tableNode: ASTableNode) -> Int {
//        return samples.count
//    }
//
//    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
//        <#code#>
//    }
//
//}
//
//extension FirstViewController: ASTableDelegate {
//
//
//}
