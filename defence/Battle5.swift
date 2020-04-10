//
//  Battle5.swift
//  defence
//
//  Created by 90304395 on 4/7/20.
//  Copyright © 2020 90304395. All rights reserved.
import Foundation
import SpriteKit
import GameplayKit

class Battle5: Middle{
    var enemyGold:Gold?
    var enemyC = [Cannon]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
       
        for b in boxes{
            
            b.newScene(newScene: self)
        }
        for c in ALLcanons{
            c.newScene(newScene: self)
        }
        lastC = ALLcanons[0]
        gold?.newScene(newScene: self)
        
        enemyGold = Gold(x: 1500, y: Int(Y! - 50), scene: self, team: "CPU")
        enemyGold?.body.physicsBody?.mass = 1
        enemyC.append(Cannon(x: 1000, y: 600, scene: self, autoShoot: true, autoShootTime: 1))
               enemyC.last?.flip()
        
        
        var sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width: 400, height: 450))
        sprite.position = CGPoint(x: X!/2 - 100, y: 50)
        sprite.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        sprite.physicsBody?.mass = 100
        addChild(sprite)
      
        for i in 1...300{
            
            var ball = SKShapeNode(circleOfRadius: 20)
            ball.fillColor = UIColor.blue
            ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
            ball.physicsBody?.friction = 1
            
            var x = Int.random(in: Int(X!/2 + 100)...Int(X!))
            var y = Int.random(in: 0...Int(Y!))
            ball.position = CGPoint(x: x, y: y)
            addChild(ball)
        }
         

    }
}
