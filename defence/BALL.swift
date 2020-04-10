//
//  BALL.swift
//  defence
//
//  Created by 90304395 on 2/28/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class BALL:Thing{
    
    override init(x: Int, y: Int, scene: Middle, width: Int = 50, height: Int = 50, color: UIColor = UIColor.red) {
        
        super.init(x: x, y: y, scene: scene, width: width, height: height, color: color)
        body = SKSpriteNode(imageNamed: "hiclipart.com")
        
        body.physicsBody = SKPhysicsBody(texture: body.texture!, size: body.texture!.size())
       
        var timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(fade), userInfo: nil, repeats: false)
        
        body.position.x = CGFloat(x)
        body.position.y = CGFloat(y)
        body.setScale(0.125)
        body.name = "ball"
        body.physicsBody?.mass = 200
        scene.addChild(body)
    }

    @objc  func fade() {
        var l:[BALL] = scene.allBalls
        var i = 0
        for b in l{
            if b === self{
                l.remove(at: i)
                b.body.removeFromParent()
            }
        i = i + 1
        }
        
        
        
    }
    
}
