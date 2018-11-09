//
//  FirstDisplayNode.swift
//  texture_demo
//
//  Created by wf on 2018/10/31.
//  Copyright © 2018 sohu. All rights reserved.
//

import AsyncDisplayKit

class FirstDisplayNode: ASDisplayNode {

    let txtNode = ASTextNode()
    
    let imgNode = ASImageNode()
    
    override init() {
        
        super.init()
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left

        let attr = NSAttributedString(string: "你好搜狐", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor .cyan, NSAttributedString.Key.paragraphStyle : paragraph])
        
        txtNode.attributedText = attr
        
        automaticallyManagesSubnodes = true
        
        txtNode.backgroundColor = .purple
        
        
        imgNode.backgroundColor = .green
        imgNode.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        super.didLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.subnodes!)
        }
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        imgNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2)
        
        let centerSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: ASCenterLayoutSpecSizingOptions.init(rawValue: 0), child: imgNode)
        
        let inset = UIEdgeInsets(top: CGFloat.infinity, left: 10, bottom: 10, right: 10)

        let insetSpec = ASInsetLayoutSpec.init(insets: inset, child: txtNode)
        
//        let txtCenterSpec = ASCenterLayoutSpec.init(centeringOptions: .XY, sizingOptions: .init(rawValue: 0), child: txtNode)
        
        let overlaySpec = ASOverlayLayoutSpec(child: centerSpec, overlay: insetSpec)
        
        return overlaySpec
    }
    
}
