//
//  Gold.swift
//  defence
//
//  Created by 90304395 on 3/2/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Gold: Thing {
     
    var team = ""
    init(x: Int, y: Int, scene: Middle, team: String,  width: Int = 50, height: Int = 50, color: UIColor = UIColor.red) {
    
    super.init(x: x, y: y, scene: scene, width: width, height: height, color: color)
        
        self.team = team
        body.color = UIColor.yellow
        body.size = CGSize(width: 50, height: 50)
        body.physicsBody = SKPhysicsBody(rectangleOf: body.size)
        body.position.x = CGFloat(x)
        body.position.y = CGFloat(y)
        body.physicsBody?.mass = 25
        body.physicsBody?.usesPreciseCollisionDetection = true
        body.name = "gold"
        body.physicsBody!.contactTestBitMask = body.physicsBody!.collisionBitMask
        scene.addChild(body)
    }
    
    }

