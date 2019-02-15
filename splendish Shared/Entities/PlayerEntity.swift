//
//  PlayerEntity.swift
//  splendish
//
//  Created by Rachel Caileff on 2/10/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import GameplayKit
import SceneKit

class PlayerEntity: GKEntity {
    
    init(name: String, owner: OwnerID) {
        super.init()
        let nameComponent = NameComponent(name)
        addComponent(nameComponent)
        let ownerComponent = OwnerComponent(owner)
        addComponent(ownerComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
