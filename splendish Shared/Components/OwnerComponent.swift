//
//  OwnerComponent
//  splendish
//
//  Created by Rachel Caileff on 2/10/19.
//  Copyright © 2019 Rachel Caileff. All rights reserved.
//

import GameplayKit
import SceneKit

enum OwnerID {
    case player1
    case player2
    case player3
    case player4
    case bank
}

class OwnerComponent: GKComponent {
    let id: OwnerID
    
    init(_ owner: OwnerID) {
//        node = SKNode()
        self.id = owner
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
