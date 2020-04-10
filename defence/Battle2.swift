//
//  Battle2.swift
//  defence
//
//  Created by 90304395 on 3/6/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Battle2: Middle{
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
        enemyGold = Gold(x: 1720, y: 200, scene: self, team: "CPU")
        enemyC.append(Cannon(x: 1200, y: 450, scene: self, autoShoot: true, autoShootTime: 2))
        enemyC.last?.flip()

    }
}
