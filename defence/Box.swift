//
//  Box.swift
//  defence
//
//  Created by 90304395 on 2/27/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Box:Thing{
    var sName:String?
    override init(x: Int, y: Int, scene: Middle, width: Int = 50, height: Int = 50, color: UIColor = UIColor.red) {
        
        super.init(x: x, y: y, scene: scene, width: width, height: height, color: color)
        body.color = color
        body.size = CGSize(width: width, height: height)
        body.physicsBody = SKPhysicsBody(rectangleOf: body.size)
        body.position.x = CGFloat(x)
        body.position.y = CGFloat(y)
        
        body.physicsBody?.mass = 80
        body.physicsBody?.friction = 0.6
        body.physicsBody?.restitution = 0
        
        body.physicsBody?.usesPreciseCollisionDetection = true
        body.name = "box"
        
        scene.addChild(body)
    }
}
