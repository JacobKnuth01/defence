//
//  MyScene.swift
//  defence
//
//  Created by 90304395 on 3/5/20.
//  Copyright © 2020 90304395. All rights reserved.

import Foundation
import SpriteKit
import GameplayKit

class MyScene:SKScene{
   
    override func didMove(to view: SKView){
        var body = SKSpriteNode(color: UIColor.red, size: CGSize(width: 100, height: 100))
        
      
        
        body.position.x = CGFloat(0)
        body.position.y = CGFloat(0)
        addChild(body)
    }
}
