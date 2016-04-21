//
//  Jump.swift
//  DropCharge
//
//  Created by Anko Top on 18/04/16.
//  Copyright © 2016 Anko Top. All rights reserved.
//

import SpriteKit
import GameplayKit

class Jump: GKState {

    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if previousState is Lava {
            return
        }
        // Check if we need to make the exhaust work
        if scene.playerTrail.particleBirthRate == 0 {
            scene.playerTrail.particleBirthRate = 200
        }
        // animate the player when jumping
        scene.player.runAction(scene.squashAndStretch!)
    }
    
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Fall.Type
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        // Animate the player
        if abs(scene.player.physicsBody!.velocity.dx) > 100.0 {
            if (scene.player.physicsBody!.velocity.dx > 0) {
                scene.runAnim(scene.animSteerRight)
            } else {
                scene.runAnim(scene.animSteerLeft)
            }
        } else {
            scene.runAnim(scene.animJump)
        }
    }
    
}
