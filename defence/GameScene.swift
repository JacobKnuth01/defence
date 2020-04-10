//
//  GameScene.swift
//  defence
//
//  Created by 90304395 on 2/27/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: Middle {
    
    var newScene = SKSpriteNode()
    var push:Button?
    var background:SubMenu?
    var garbage = SKSpriteNode()
    var boxLimit = 40
    var displayLimit = SKSpriteNode()
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        self.name = "gameScene"
        newScene = SKSpriteNode(color: UIColor.purple, size: CGSize(width: 110, height: 80) )
        newScene.position = CGPoint(x: 420, y: self.size.height - 80)
        newScene.addChild(SKLabelNode(text: "BATTLE!"))
        addChild(newScene)
        
        xBorder = nil
        b.color = self.backgroundColor
        b.zPosition = -10
        
        
        
        if ALLcanons.count == 0{
            ALLcanons.append(Cannon(x: 500, y: 500, scene: self))
            
        }
        
        if gold == nil{
            gold = Gold(x: 90, y: 40, scene: self, team: "Player")
        }
        
        
        
        buttons.append(Button(x: 50, y: Int(self.size.height - 200), Scene: self, name: "1X1", action: place, text: "1", w: 100, h: 100))
        
        buttons.append(Button(x: 50, y: Int(self.size.height - 300), Scene: self, name: "4X1", action: place2, text: "4", w: 100, h: 100))
        
        buttons.append(Button(x: 50, y: Int(self.size.height - 400), Scene: self, name: "8X1", action: place3, text: "8", w: 100, h: 100))
        
        buttons.append(Button(x: 50, y: Int(self.size.height - 500), Scene: self, name: "10X1", action: place4, text: "10", w: 100, h: 100))
        
        garbage = SKSpriteNode(imageNamed: "trash-can-clip-art")
        garbage.setScale(0.05)
        garbage.position = CGPoint(x: X! - 100, y: CenterY!)
        addChild(garbage)
        
        displayLimit = SKSpriteNode(color: UIColor.purple, size: CGSize(width: 50, height: 50))
        displayLimit.position = CGPoint(x: X! - 100, y: Y!-100)
        displayLimit.addChild(SKLabelNode(text: String(boxLimit)))
        addChild(displayLimit)
    
        var t = 0
        
        for i in boxes{
            t = t + Int(i.sName!)!
        }
        
        boxLimit = boxLimit - t
        var re = displayLimit.children[0] as! SKLabelNode
        re.text = String(boxLimit)
    
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if newScene.contains(touches.first?.location(in: self) as! CGPoint){
            let scene = LevelSelect(size: self.size)
            scene.ALLcanons = ALLcanons
            scene.gold = gold
            scene.boxes = boxes
            
            scene.scaleMode = .aspectFit
            self.view?.presentScene(scene)
            
        }
        
        
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesMoved(touches, with: event)
        
        let t =  touches.first?.location(in: self) as! CGPoint
        
        if garbage.contains(t) && last != nil && last!.body.contains(t){
            var z = 0
            for b in boxes{
                if b === last!{
                    boxes.remove(at: z)
                    
                    b.body.removeFromParent()
                    boxChange(size: b.sName!, isRemoving: true)
                }
                z+=1
            }
        }
        
    }
    
    
    override func didBegin(_ contact: SKPhysicsContact){
        
    }
    
    
    
    
    
    
    
    
    func place(S: String){
        
        
        if boxLimit - 1 >= 0{
            boxes.append(Box(x: Int(CenterX!), y: Int(Y! - 50), scene: self, width: 50, height: 50))
            boxes.last!.sName = "1"
            
            boxChange(size: boxes.last!.sName!, isRemoving: false)
        }
        
    }
    func place2(s: String){
        if boxLimit - 4 >= 0{
            boxes.append(Box(x: Int(CenterX!), y: Int(Y! - 50), scene: self, width: 200, height: 50))
            boxes.last!.sName = "4"
            boxChange(size: boxes.last!.sName!, isRemoving: false)
        }
        
    }
    
    func place3(s: String){
        if boxLimit - 8 >= 0{
            boxes.append(Box(x: Int(CenterX!), y: Int(Y! - 50), scene: self, width: 400, height: 50))
            boxes.last!.sName = "8"
            boxChange(size: boxes.last!.sName!, isRemoving: false)
               }
        
    }
    func place4(s: String){
       if boxLimit - 10 >= 0{
                  boxes.append(Box(x: Int(CenterX!), y: Int(Y! - 50), scene: self, width: 500, height: 50))
        boxes.last!.sName = "10"
        boxChange(size: boxes.last!.sName!, isRemoving: false)
              }
        
    }
    func boxChange(size: String, isRemoving: Bool){
        
        if isRemoving{
            boxLimit = boxLimit + Int(size)!
        }
        else{
            boxLimit = boxLimit - Int(size)!
        }
        var t = displayLimit.children[0] as! SKLabelNode
        t.text = String(boxLimit)
    }
    
}
