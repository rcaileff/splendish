//
//  EntityManager.swift
//  splendish
//
//  Created by Rachel Caileff on 2/10/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class EntityManager {
    var entities = Set<GKEntity>()
    var scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        if let nameNode = entity.component(ofType: NameComponent.self)?.node {
            scene.addChild(nameNode)
        }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        if let nameNode = entity.component(ofType: NameComponent.self)?.node {
            nameNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
}
