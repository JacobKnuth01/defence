//
//  Battle4.swift
//  defence
//
//  Created by 90304395 on 4/7/20.
//  Copyright © 2020 90304395. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

class Battle4: Middle{
    var enemyGold:Gold?
    var enemyC = [Cannon]()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        
       
        for b in boxes{
            
            b.newScene(newScene: self)
        }
        for c in ALLcanons{
            c.newScene(newScene: self)
        }
        lastC = ALLcanons[0]
        gold?.newScene(newScene: self)
        enemyGold = Gold(x: 1370, y: 60, scene: self, team: "CPU")
        enemyC.append(Cannon(x: 1840, y: 360, scene: self, autoShoot: true, autoShootTime: 1))
        enemyC.last?.flip()

    }
}
