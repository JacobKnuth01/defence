//
//  Connon.swift
//  defence
//
//  Created by 90304395 on 2/27/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Cannon:Thing{
    
    var isRight = true
    var timer:Timer?
    var part2:SKSpriteNode
    init(x: Int, y: Int, scene: Middle, autoShoot: Bool = false, autoShootTime: Int = Int.random(in: 1...10), width: Int = 90, height: Int = 50, color: UIColor = UIColor.red) {
       self.part2 = SKSpriteNode()
        super.init(x: x, y: y, scene: scene, width: width, height: height, color: color)
        
        
        
        
        body = SKSpriteNode(imageNamed: "Wheels.png")
        
        self.part2 = SKSpriteNode(imageNamed: "Body.png")
        part2.position = CGPoint(x: body.position.x + 25, y: body.position.y + 25)
       
        scene.addChild(body)
        body.addChild(part2)
        
        body.physicsBody = SKPhysicsBody(texture: body.texture!, size: body.texture!.size())
               body.setScale(0.25)
               
               body.physicsBody?.mass = 200
               body.physicsBody?.friction = 0.8
               body.physicsBody?.restitution = 0
        body.position = CGPoint(x: x, y: y)
        
        
        
        if autoShoot{
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(autoShootTime), target: self, selector: #selector(shoot), userInfo: nil, repeats: true)
        }
        
        
        
        
        
        
        
    }
    @objc func shoot(){
        
        if !(scene.view?.scene === scene){
            timer!.invalidate()
            return
        }
        
        
        var GSpot = scene.gold!.body.position
        
        if GSpot.y < body.position.y{
            
            var oppisite = body.position.x - GSpot.x
            
            var adjacent = body.position.y - GSpot.y
            
            var angle = atan(oppisite/adjacent)
            part2.zRotation = angle
        }
        else{
            var oppisite =  body.position.y - GSpot.y
            
            var adjacent =  GSpot.x - body.position.x
            
            var angle = atan(oppisite/adjacent)
            part2.zRotation = angle
        }
        
        fire()
    }

    func fire(){
        
        var ball = BALL(x: 0, y: 0, scene: scene)
        var sign:CGFloat = 1.0
        if !isRight{
             sign = -1.0
        }
        
        
        ball.body.position = CGPoint(x: body.position.x + part2.position.x + sign * (150 * cos(part2.zRotation)), y: body.position.y + part2.position.y + (100 * sin(part2.zRotation)))
        scene.allBalls.append(ball)
        
        
        var strength:CGFloat = 900000
        let vector = CGVector(dx: sign * strength * cos(part2.zRotation), dy: strength * cos(part2.zRotation))
        ball.body.physicsBody?.applyImpulse(vector)
    }
    override func startTouch(touches: Set<UITouch>) {
        super.startTouch(touches: touches)
        if body.contains(touches.first?.location(in: scene) as! CGPoint){
            scene.lastC = self
        }
    }
    override func update() {
        super.update()
        
        
        
    }
    func flip(){
        body.xScale = -1 * body.xScale
        part2.xScale = -1 * part2.xScale
        isRight = !isRight
        
    }
   
    func rotateGun(r: Double){
        part2.zRotation = CGFloat(Double(part2.zRotation) + r)
    }
    
    override func newScene(newScene: Middle) {
        super.newScene(newScene: newScene)
       
    }
}
