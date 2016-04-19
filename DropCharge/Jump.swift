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
    
    print("JUMP, previous state: \(previousState)")
    
    }
    
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return stateClass is Fall.Type
    }
    
}
