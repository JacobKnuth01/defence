//
//  Button.swift
//  defence
//
//  Created by 90304395 on 3/7/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Button{
    var scene = SKScene()
    var body = SKSpriteNode()
    var action:((String) -> () )
    var name:String
    init(x: Int, y: Int, Scene: SKScene, name: String = "none", action: @escaping ((String) -> () ), text: String = "", w: Int = 80, h: Int = 80){
        
        self.scene = Scene
        self.name = name
        body = SKSpriteNode(color: UIColor.white, size: CGSize(width: w, height: h))
        var l = SKLabelNode(text: text)
        l.zPosition = 10
        l.fontColor = UIColor.red
        body.addChild(l)
        body.position = CGPoint(x: x, y: y)
        Scene.addChild(body)
        
        self.action = action
        
        body.zPosition = 200
        
    }
    
    
    func touch(touches: Set<UITouch>, with event: UIEvent?){
        var t = touches.first?.location(in:scene ) as! CGPoint
       
        if body.contains(t){
            self.action("test")
        }
    }
    
}
