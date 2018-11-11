//
//  HN_NormalViewController.swift
//  texture_demo
//
//  Created by wangfei on 2018/11/11.
//  Copyright © 2018 sohu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

let bkgNodeH: CGFloat = 80
let subNodeH: CGFloat = 40
let subNodeX: CGFloat = 50
let displayNodeY: CGFloat = 20
let reuseNodeY: CGFloat = 50

class HN_NormalViewController: ASViewController<ASDisplayNode> {
    deinit {
        print("HN_NormalViewController deinit........")
    }
    var txtList: [String]!
    
    var index: Int = 1
    
    var timer: Timer!

    var bkgNode: ASDisplayNode = ASDisplayNode()
    
    lazy var displayNode: ASTextNode = {
       let txtNode = ASTextNode()
        txtNode.maximumNumberOfLines = 2
        txtNode.attributedText = NSAttributedString(string: "WEN实战 | 五百块以内耐克签名实战鞋,除了配色有点丑今天我们就来", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
//        txtNode.backgroundColor = UIColor.red
        txtNode.truncationMode = .byTruncatingTail
        return txtNode
    }()
    
    lazy var reuseNode: ASTextNode = {
        let txtNode = ASTextNode()
        txtNode.maximumNumberOfLines = 2
        txtNode.attributedText = NSAttributedString.init(string: "作者:WEN鞋评 一直以来觉得安东尼是个特别有意思的人,因为他总是", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
//        txtNode.backgroundColor = UIColor.cyan
        txtNode.truncationMode = .byTruncatingTail
        txtNode.alpha = 0
        return txtNode
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtList = ["WEN实战 | 五百块以内耐克签名实战鞋,除了配色有点丑今天我们就来",
                   "作者:WEN鞋评 一直以来觉得安东尼是个特别有意思的人,因为他总是",
                   "在中国，提起版画艺术，凯绥·珂勒惠支是一个绕不开的名字，几乎每",
                   "当救亡图存成为民族的头等大事，艺术当然不能独身事外。在这遍布战争",
                   "标志着珂勒惠支的版画艺术正式进入到中国，倡导出轰轰烈烈的新木刻版画运动"]

        self.view.addSubnode(bkgNode)
        
        bkgNode.backgroundColor = UIColor.purple
        
        bkgNode.addSubnode(displayNode)
        
        bkgNode.addSubnode(reuseNode)
        
        subNodeDefaultFrame()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.timerAction(timer:)), userInfo: nil, repeats: true)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            
//
//        }

    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
    }

    private func subNodeDefaultFrame() {
        
        bkgNode.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: bkgNodeH)
        
        displayNode.frame = CGRect(x: subNodeX, y: displayNodeY, width: UIScreen.main.bounds.width - 2 * subNodeX, height: subNodeH)
        
        reuseNode.frame = CGRect(x: subNodeX, y: reuseNodeY, width: UIScreen.main.bounds.width - 2 * subNodeX, height: subNodeH)
        
    }
    
    @objc func timerAction(timer: Timer) {
        
//        let flag = (self.index == self.txtList.count)
//        print(flag)
        UIView.animate(withDuration: 0.5, animations: {

            self.displayNode.alpha = 0
            self.displayNode.frame = CGRect(x: subNodeX, y: 0, width: UIScreen.main.bounds.width - 2 * subNodeX, height: subNodeH)

            self.reuseNode.alpha = 1
            self.reuseNode.frame = CGRect(x: subNodeX, y: displayNodeY, width: UIScreen.main.bounds.width - 2 * subNodeX, height: subNodeH)

        }) { (completion) in

            self.index = self.index + 1
            
            if self.index == self.txtList.count {
                self.index = 0
            }else {
                
            }
            print("\(self.index)")

            let str = self.txtList[self.index]

            let tmpNode = self.displayNode

            tmpNode.frame = CGRect(x: subNodeX, y: reuseNodeY, width: UIScreen.main.bounds.width - 2 * subNodeX, height: subNodeH)

            tmpNode.attributedText = NSAttributedString(string: str, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])

            self.displayNode = self.reuseNode
            self.reuseNode = tmpNode

        }

    }
    
    private func getText(index: Int) -> String? {
        
        guard index < txtList.count else {
            return nil
        }
        
        return txtList?[index]
    }
    
}
