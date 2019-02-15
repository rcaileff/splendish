//
//  NameComponent.swift
//  splendish
//
//  Created by Rachel Caileff on 2/10/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import GameplayKit
import SceneKit

class NameComponent: GKComponent {
    let name: String
    let node: SKLabelNode
    
    init(_ name: String) {
        self.name = name
        node = SKLabelNode(text: name)
        node.fontColor = .black
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
