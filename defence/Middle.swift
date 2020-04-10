//
//  Middle.swift
//  defence
//
//  Created by 90304395 on 3/3/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Middle: SKScene, SKPhysicsContactDelegate {
    
    var boxes = [Box]()
    
    var ALLcanons = [Cannon]()
    
    var allBalls = [BALL]()
    
    var buttons = [Button]()
    var sub = [SubMenu]()
    
    var FIRE = SKSpriteNode()
    var rotateL = SKSpriteNode()
    var rotateR = SKSpriteNode()
    var b = SKSpriteNode()
    
    var last:Thing?
    var gold:Gold?
    var lastC:Cannon?
    
    var xBorder:CGFloat?
    
    var CenterX:CGFloat?
    var CenterY:CGFloat?
    
    var X:CGFloat?
    var Y:CGFloat?
    
    //cannon
    var up:Button?
    var down:Button?
    var isGrabed = false
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        CenterX = self.size.width / 2
        CenterY = self.size.height / 2
        X = self.size.width
        Y = self.size.height
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        border.usesPreciseCollisionDetection = true
        
        FIRE = SKSpriteNode(color: UIColor.green, size: CGSize(width: 80, height: 80))
        FIRE.position.x = 100
        FIRE.position.y = 100
        var t = SKLabelNode(text: "FIRE!")
        t.fontColor = UIColor.red
        FIRE.addChild(t)
        addChild(FIRE)
        FIRE.zPosition = 200
       rotateL = SKSpriteNode(color: UIColor.gray, size: CGSize(width: 80, height: 80))
        rotateL.position.x = 200
        rotateL.position.y = self.size.height - 80
        rotateL.addChild(SKLabelNode(text: "L"))
        addChild(rotateL)
        
        rotateR = SKSpriteNode(color: UIColor.gray, size: CGSize(width: 80, height: 80))
        rotateR.position.x = 300
        rotateR.position.y = self.size.height - 80
        rotateR.addChild(SKLabelNode(text: "R"))
        addChild(rotateR)
        
        xBorder = self.size.width / 2.0
        
         b = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 5.0, height: self.size.height))
        b.zPosition = 10
      
        
        b.position = CGPoint(x: xBorder!, y: self.size.height / 2.0)
        
        addChild(b)
        
        self.name = "ground"
        
        up = Button(x: Int(self.size.width - 80), y: 80, Scene: self, action: cUP, text: "Up")
        down = Button(x: Int(self.size.width - 80), y: 170, Scene: self, action:  cDown, text: "Down")
        buttons.append(up!)
        buttons.append(down!)
        
        
    
    }
        
       
        
                                              
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.view?.scene?.name == "gameScene"{
            gold?.startTouch(touches: touches)
        }
        
        
        if FIRE.contains(touches.first?.location(in: self) as! CGPoint){
            if lastC != nil {
                lastC?.fire()
            }
        }
        else{
            for ball in boxes{
                ball.startTouch(touches: touches)
            }
            for c in ALLcanons{
                c.startTouch(touches: touches)
            }
            for b in allBalls{
                b.startTouch(touches: touches)
            }
        }
        
        
        
        
        
        for b in buttons{
            
            
            b.touch(touches: touches, with: event)
        }
        for s in sub{
            s.touch(touches: touches, with: event)
        }
        
        if rotateL.contains(touches.first?.location(in: self) as! CGPoint) && last != nil{
            last?.body.zRotation -= 0.25
        }
        if rotateR.contains(touches.first?.location(in: self) as! CGPoint)  && last != nil{
            last?.body.zRotation += 0.25
        }
        
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for ball in boxes{
            ball.moveTouch(touches: touches)
             
             for b in boxes{
                if !(b === ball) && ball.isGrabed{
                    b.isGrabed = false
                    b.body.physicsBody?.affectedByGravity = true
                }
                
             }
            
             
             
        }
        for c in ALLcanons{
            c.moveTouch(touches: touches)
            for b in boxes{
                if  b.isGrabed && c.isGrabed{
                    b.isGrabed = false
                    b.body.physicsBody?.affectedByGravity = true
                }
            
        }
        }
        for b in allBalls{
            b.moveTouch(touches: touches)
        }
    
        if self.view?.scene?.name == "gameScene"{
            gold?.moveTouch(touches: touches)
            
            for b in boxes{
                if  b.isGrabed && gold!.isGrabed{
                    b.isGrabed = false
                    b.body.physicsBody?.affectedByGravity = true
                }
            }
                for c in ALLcanons{
                    if c.isGrabed && gold!.isGrabed{
                        c.isGrabed = false
                        c.body.physicsBody?.affectedByGravity = true
                    }
                }
        }
        }
        
        
        
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       for ball in boxes{
           ball.endTouch(touches: touches)
            
            
       }
        for c in ALLcanons{
            c.endTouch(touches: touches)
        }
        for b in allBalls{
            b.endTouch(touches: touches)
        }
        gold?.endTouch(touches: touches)
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        for ball in boxes{
            ball.update()
        }
        for c in ALLcanons{
            c.update()
        }
        for b in allBalls{
            b.update()
        }
        gold?.update()
    }
     func didBegin(_ contact: SKPhysicsContact) {
        
        var a = contact.bodyA.node!
        var b = contact.bodyB.node!
        
        
        if a.name == "ball" && b.name == "gold"{
            b.removeFromParent()
            isPlayerGold(b: b)
              
            
            
        }
        else if a.name == "gold" && b.name == "ball"{
            a.removeFromParent()
            isPlayerGold(b: a)
                
        }
        if (a.name == "gold" && b.name == "ground") {
            a.removeFromParent()
            isPlayerGold(b: a)
                
            
        }
        else if a.name == "ground" && b.name == "gold"{
            b.removeFromParent()
            isPlayerGold(b: b)
              
        }
    }
    
    
    func isPlayerGold(b:SKNode){
        self.name = "done"
        for i in allBalls{
            i.body.name = "done"
        }

        let text = SKLabelNode(text: "You ")
        text.position = CGPoint(x: CenterX!, y: CenterY!)
        text.fontSize = 400
        text.zPosition = 200
        text.fontColor = UIColor.red
        if b === gold!.body{
            text.text = "You LOST!"
            
            
        }
        else{
            text.text = "You WON!"
            
        }
        addChild(text)
        var timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(backHome), userInfo: nil, repeats: false)
    }
        
    @objc func backHome(){
        let scene = GameScene(fileNamed: "GameScene")
        
        scene!.scaleMode = .aspectFit
        scene!.boxes = boxes
        scene!.ALLcanons = ALLcanons
        for b in scene!.boxes{
            b.newScene(newScene: scene!)
        }
        for c in scene!.ALLcanons{
            c.newScene(newScene: scene!)
        }
        if gold!.isDead == false{
            scene!.gold = gold
            scene!.gold?.newScene(newScene: scene!)
        }
        self.view?.presentScene(scene)
    }
        
    
    func cUP(t: String){
       
        lastC?.rotateGun(r: -0.50)
    }
    func cDown(t: String){
        lastC?.rotateGun(r: 0.50)
    }
}
        
        
    

