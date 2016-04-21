//
//  Idle.swift
//  DropCharge
//
//  Created by Anko Top on 18/04/16.
//  Copyright © 2016 Anko Top. All rights reserved.
//

import SpriteKit
import GameplayKit

class Idle: GKState {

    unowned let scene: GameScene
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        // not interested in the previousState: always execute the code
        scene.player.physicsBody = SKPhysicsBody(circleOfRadius: scene.player.size.width * 0.3)
        scene.player.physicsBody!.dynamic = false
        scene.player.physicsBody!.allowsRotation = false
        scene.player.physicsBody!.categoryBitMask = PhysicsCategory.Player
        scene.player.physicsBody!.collisionBitMask = 0
        
        // add an exhaust trail
        scene.playerTrail = scene.addTrail("PlayerTrail")
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        
        return stateClass is Jump.Type
    }
    
}
