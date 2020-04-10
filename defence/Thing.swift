//
//  Thing.swift
//  defence
//
//  Created by 90304395 on 2/27/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Thing{
    var body = SKSpriteNode()
    var isGrabed = false
    var scene = Middle()
    var folow = CGPoint()
    var isDead = false
    var lastT = CGPoint()
    init(x: Int, y:Int, scene:Middle,  width:Int=50, height:Int=50, color: UIColor=UIColor.red) {
         
        self.scene = scene
      
        
         
        
       
        
    }
    
    func startTouch(touches: Set<UITouch>){
        
        var t = touches.first?.location(in: scene)
        if body.contains(t!){
            folow = t! as! CGPoint
            isGrabed = true
            body.physicsBody?.angularVelocity = 0
            body.physicsBody?.affectedByGravity = false
            scene.last = self
        }
        
    }
    func endTouch(touches: Set<UITouch>){
        var t = touches.first?.location(in: scene)
        if body.contains(t!){
            isGrabed = false
            body.physicsBody?.affectedByGravity = true
        }
    }
    func moveTouch(touches: Set<UITouch>){
        if isGrabed{
            lastT = folow
            
            
            //body.physicsBody?.applyForce(CGVector(dx: lastT.x - folow.x, dy: lastT.y - folow.y))
            
            folow = touches.first?.location(in: scene) as! CGPoint
            
        }
    }
    func update(){
        
        if (isGrabed && scene.xBorder == nil) || (isGrabed && Int(body.position.x) < Int(scene.xBorder!)){
            
            body.position = folow
        }
        else if scene.xBorder != nil && Int(scene.xBorder!) <= Int(body.position.x){
            body.physicsBody?.affectedByGravity = true
        }
    }
    func die(){
        body.removeFromParent()
        isDead = true
    }
    
    func newScene(newScene:Middle){
        self.scene = newScene
        body.removeFromParent()
        scene.addChild(body)
        
    }
}

