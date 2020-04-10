//
//  Battle3.swift
//  defence
//
//  Created by 90304395 on 3/16/20.
//  Copyright © 2020 90304395. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Battle3: Middle{
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
        enemyGold = Gold(x: 1600, y: 50, scene: self, team: "CPU")
        enemyC.append(Cannon(x: 1200, y: 600, scene: self, autoShoot: true, autoShootTime: 2))
        enemyC.last?.flip()
        enemyC.append(Cannon(x: 1700, y: 850, scene: self, autoShoot: true, autoShootTime: 4))
        enemyC.last?.flip()

    }
}

