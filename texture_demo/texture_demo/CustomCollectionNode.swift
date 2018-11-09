//
//  CustomCollectionNode.swift
//  texture_demo
//
//  Created by wf on 2018/11/9.
//  Copyright © 2018 sohu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CustomCollectionNode: ASCollectionNode {

    override func layout() {
        super.layout()
        self.clipsToBounds = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }
    
}
