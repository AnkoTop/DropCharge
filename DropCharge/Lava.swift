//
//  Lava.swift
//  DropCharge
//
//  Created by Anko Top on 18/04/16.
//  Copyright © 2016 Anko Top. All rights reserved.
//

import SpriteKit
import GameplayKit

class Lava: GKState {

    unowned let scene: GameScene
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if scene.player.position.y < scene.lava.position.y + 90 {
            scene.boostPlayer()
            scene.lives -= 1
        }
        print("LAVA")
       
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Dead.Type || stateClass is Fall.Type || stateClass is Jump.Type
    }
    
}
