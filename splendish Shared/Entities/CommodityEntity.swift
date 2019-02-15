//
//  CommodityEntity.swift
//  splendish
//
//  Created by Rachel Caileff on 2/8/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import GameplayKit
import SpriteKit

class CommodityEntity: GKEntity {

    init(color: SpriteColor) {
        super.init()
        
        let spriteComponent = SpriteComponent(color: color, size: CGSize(width: 10, height: 10))
//        let spriteComponent = SpriteComponent(color: color, size: 10)
        addComponent(spriteComponent)
    }

    convenience init(color: SpriteColor, owner: OwnerID) {
        self.init(color: color)
        
        let ownerComponent = OwnerComponent(owner)
        addComponent(ownerComponent)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
