//
//  Battle.swift
//  defence
//
//  Created by 90304395 on 3/3/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Battle:Middle{
    
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
       
        gold?.newScene(newScene: self)
        enemyGold = Gold(x: 1480, y: 40, scene: self, team: "CPU")
        
        enemyC.append(Cannon(x: 1240, y: 750, scene: self, autoShoot: true, autoShootTime: 2))
        enemyC.last?.flip()
        lastC = ALLcanons[0]
        
    }   
    
        
       
}
