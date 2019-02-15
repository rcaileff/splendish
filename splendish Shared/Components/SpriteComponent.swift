//
//  SpriteComponent.swift
//  splendish
//
//  Created by Rachel Caileff on 2/8/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
    let node: SKSpriteNode
//    let node: SKShapeNode

//    init(texture: SKTexture) {
//        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
//        super.init()
//    }

//    init(color: SpriteColor, size: CGFloat) {
//        node = SKShapeNode(circleOfRadius: size)
//        node.fillColor = color
//        super.init()
//    }
    
    init(color: SpriteColor, size: CGSize) {
        node = SKSpriteNode(color: color, size: size)
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
