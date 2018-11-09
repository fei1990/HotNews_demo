//
//  CustomCellNode.swift
//  texture_demo
//
//  Created by wf on 2018/11/9.
//  Copyright © 2018 sohu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CustomCellNode: ASCellNode {

    var imgNode: ASImageNode!
    
    override init() {
        super.init()
        
        imgNode = ASImageNode()
        imgNode.backgroundColor = UIColor.cyan
        
//        automaticallyManagesSubnodes = true
        
        addSubnode(imgNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: imgNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.next?.next?.next?.touchesBegan(touches, with: event)
        
    }
    
}
