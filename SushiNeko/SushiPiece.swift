//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Benjamin Simpson on 11/11/19.
//  Copyright © 2019 Benjamin Simpson. All rights reserved.
//

import SpriteKit

class SushiPiece: SKSpriteNode {
    var rightChopstick: SKSpriteNode!
    var leftChopstick: SKSpriteNode!
    
    /* Sushi type */
    var side: Side = .none {
        didSet {
            switch side {
            case .left:
                /* Show left chopstick */
                leftChopstick.isHidden = false
            case .right:
                /* Show right chopstick */
                rightChopstick.isHidden = false
            case .none:
                /* Hide all chopsticks */
                leftChopstick.isHidden = true
                rightChopstick.isHidden = true
            }
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func connectChopsticks() {
        /* Connect our child chopstick nodes */
        rightChopstick = childNode(withName: "rightChopstick") as! SKSpriteNode
        leftChopstick = childNode(withName: "leftChopstick") as! SKSpriteNode
        /* Set the default side */
        side = .none
    }
    func flip(_ side: Side) {
       /* Flip the sushi out of the screen */
       var actionName: String = ""
       if side == .left {
          actionName = "FlipRight"
       } else if side == .right {
          actionName = "FlipLeft"
       }
       /* Load appropriate action */
       let flip = SKAction(named: actionName)!
       /* Create a node removal action */
       let remove = SKAction.removeFromParent()
       /* Build sequence, flip then remove from scene */
       let sequence = SKAction.sequence([flip,remove])
       run(sequence)
    }
}
