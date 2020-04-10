//
//  LevelSelect.swift
//  defence
//
//  Created by 90304395 on 3/9/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class LevelSelect:SKScene{
    var boxes = [Box]()
    
    var ALLcanons = [Cannon]()
    
    var gold:Gold?
    
    var buttons = [Button]()
    var back:Button?
    
    override func didMove(to view: SKView) {
        buttons.append(Button(x: 100, y: Int(self.size.height - 100), Scene: self, action: startLevel1, text: "Level 1"))
        
        buttons.append(Button(x: 200, y: Int(self.size.height - 100), Scene: self, action: startLevel2, text: "Level 2"))
        buttons.append(Button(x: 300, y: Int(self.size.height - 100), Scene: self, action: startLevel3, text: "Level 3"))
        buttons.append(Button(x: 400, y: Int(self.size.height - 100), Scene: self, action: startLevel4, text: "Level 4"))
        buttons.append(Button(x: 500, y: Int(self.size.height - 100), Scene: self, action: startLevel5, text: "Level 5"))
        
        
        
        back = Button(x: Int(self.size.width - 100), y: Int(self.size.height - 100), Scene: self, action: goBack, text:"back")
        buttons.append(back!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for b in buttons{
            b.touch(touches: touches, with: event)
        }
    }
    
    func startLevel1(t: String){
        let scene = Battle(fileNamed: "Battle")
        scene!.ALLcanons = ALLcanons
        scene!.gold = gold
        scene!.boxes = boxes
        scene!.scaleMode = .aspectFit
        self.view?.presentScene(scene)
    }
    func startLevel2(t: String){
        let scene = Battle2(fileNamed: "Battle2")
        scene!.ALLcanons = ALLcanons
        scene!.gold = gold
        scene!.boxes = boxes
        scene!.scaleMode = .aspectFit
        self.view?.presentScene(scene)
    }
    func startLevel3(t: String){
        let scene = Battle3(fileNamed: "Battle3")
        scene!.ALLcanons = ALLcanons
        scene!.gold = gold
        scene!.boxes = boxes
        scene!.scaleMode = .aspectFit
        self.view?.presentScene(scene)
    }
    func startLevel4(t: String){
        let scene = Battle4(fileNamed: "Battle4")
        scene!.ALLcanons = ALLcanons
        scene!.gold = gold
        scene!.boxes = boxes
        scene!.scaleMode = .aspectFit
        self.view?.presentScene(scene)
    }
    func startLevel5(t: String){
        let scene = Battle5(size: CGSize(width: 2000, height: 900))
        scene.anchorPoint = CGPoint(x: 0, y: 0)
        scene.ALLcanons = ALLcanons
        scene.gold = gold
        scene.boxes = boxes
        scene.scaleMode = .aspectFit
        self.view?.presentScene(scene)
    }
    func goBack(t: String){
        
        
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
}
