//
//  SubMenu.swift
//  defence
//
//  Created by 90304395 on 3/9/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SubMenu{
    var body = SKSpriteNode()
    var scene:Middle
    
    var buttons = [Button]()
    init(x: Int, y: Int, size: CGSize, scene: Middle, color: UIColor = UIColor.blue) {
        body = SKSpriteNode(color: color, size: size)
        self.scene = scene
        body.position = CGPoint(x: x, y: y)
        body.zPosition = 10
        scene.addChild(body)
        
    }
    func findButton(name: String) -> Button?{
        for i in buttons{
            if i.name == name{
                return i
            }
        }
        return nil
    }
    func touch(touches: Set<UITouch>, with event: UIEvent?){
        var t = touches.first?.location(in:scene ) as! CGPoint
       
        for i in buttons{
            i.touch(touches: touches, with: event)
        }
    }
    

}
