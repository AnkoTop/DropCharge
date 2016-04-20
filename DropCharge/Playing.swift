//
//  Playing.swift
//  DropCharge
//
//  Created by Anko Top on 19/04/16.
//  Copyright © 2016 Anko Top. All rights reserved.
//

import SpriteKit
import GameplayKit

class Playing: GKState {
    
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
     
        if previousState is WaitingForBomb {
            scene.player.physicsBody!.dynamic = true
            scene.superBoostPlayer()
            scene.playBackgroundMusic("bgMusic.mp3")
        }
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        scene.updateCamera()
        scene.updateLevel()
        scene.updatePlayer()
        scene.updateLava(seconds)
        scene.updateCollisionLava()
        scene.updateExplosions(seconds)
        scene.updateRedAlert(seconds)
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        
        return stateClass is GameOver.Type
    }

    
}
