//
//  ADCollectionViewController.swift
//  texture_demo
//
//  Created by wf on 2018/11/9.
//  Copyright © 2018 sohu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

let scrollNode_margin: CGFloat = 16
let subNodepadding: CGFloat = 12

let scrollNode_x: CGFloat = scrollNode_margin

let scrollNode_y: CGFloat = 200

let kScreenW: CGFloat = UIScreen.main.bounds.width

let scrollNodeW: CGFloat = kScreenW - scrollNode_x - (scrollNode_margin + subNodepadding)

let scrollNodeH: CGFloat = 250

let imgNode_y: CGFloat = 20

let imgNodeW: CGFloat = scrollNodeW - subNodepadding

let imgNodeH: CGFloat = scrollNodeH - 40

class ADCollectionViewController: UIViewController {

    var hotScrollNode: ASScrollNode!
    
    var footerView: HotListFooterView!
    
//    override init(node: ASDisplayNode) {
//        super.init(node: ASDisplayNode())
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotScrollNode = ASScrollNode()
        
        hotScrollNode.frame = CGRect(x: scrollNode_x, y: scrollNode_y, width: scrollNodeW, height: scrollNodeH)
        
        hotScrollNode.view.delegate = self
        
        hotScrollNode.view.showsHorizontalScrollIndicator = false
        
        hotScrollNode.backgroundColor = UIColor.cyan
        
        hotScrollNode.view.isPagingEnabled = true
        
        hotScrollNode.clipsToBounds = false
        
        for i in 0..<5 {
            
            let imgNode = ASImageNode()
            imgNode.frame = CGRect(x: (CGFloat(i) * imgNodeW + CGFloat(i) * subNodepadding), y: imgNode_y, width: imgNodeW, height: imgNodeH)

            imgNode.backgroundColor = UIColor.red
            
            hotScrollNode.addSubnode(imgNode)
            
        }
        
        self.view.addSubnode(hotScrollNode)
        
        hotScrollNode.view.contentSize = CGSize(width: scrollNodeW * 5 - subNodepadding, height: imgNodeH)
        
        footerView = HotListFooterView()
        footerView.frame = CGRect(x: hotScrollNode.view.contentSize.width, y: imgNode_y, width: 2000, height: imgNodeH)
        footerView.backgroundColor = UIColor.purple
        let node = ASDisplayNode { () -> UIView in
            return self.footerView
        }
        
//        node.backgroundColor = UIColor.blue
        
        hotScrollNode.addSubnode(node)
    }

    
}

extension ADCollectionViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x > 10 && scrollView.contentOffset.x < 50 {
            UIView.animate(withDuration: 0.2) {
                self.hotScrollNode.frame = CGRect(x: scrollNode_x + subNodepadding, y: scrollNode_y, width: scrollNodeW, height: scrollNodeH)
            }
        }
        
        if scrollView.contentOffset.x <= 10 && scrollView.contentOffset.x >= 0 {
            UIView.animate(withDuration: 0.2) {
                self.hotScrollNode.frame = CGRect(x: scrollNode_x, y: scrollNode_y, width: scrollNodeW, height: scrollNodeH)
            }
        }
        
        print("offset : \(scrollView.contentOffset.x)")
        print(scrollView.contentSize.width)

        footerView.offset = scrollView.contentOffset.x + scrollNodeW - scrollView.contentSize.width
        
    }
    
}
