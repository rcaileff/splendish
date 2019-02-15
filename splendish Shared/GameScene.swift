//
//  GameScene.swift
//  splendish Shared
//
//  Created by Rachel Caileff on 11/21/18.
//  Copyright © 2018 Rachel Caileff. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
//    fileprivate var label : SKLabelNode?
    fileprivate var spinnyNode : SKShapeNode?

    var entityManager: EntityManager!
    
//    class func newGameScene() -> GameScene {
//        // Load 'GameScene.sks' as an SKScene.
//        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
//            print("Failed to load GameScene.sks")
//            abort()
//        }
//
//        // Set the scale mode to scale to fit the window
//        scene.scaleMode = .aspectFill
//
//        return scene
//  }

    class func newGameScene(aspectRatio: CGFloat) -> GameScene {
        let scene = GameScene(size:CGSize(width: 640 * aspectRatio, height: 640))
        scene.backgroundColor = .gray
        return scene
    }
    
    func setUpScene() {
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 4.0
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
            
        }
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
        
        entityManager = EntityManager(scene: self)
        
        let diamondCommodity = CommodityEntity(color: .white)
        if let spriteComponent = diamondCommodity.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        }
        entityManager.add(diamondCommodity)
        
        let player1 = PlayerEntity(name: "Jaimie", owner: .player1)
        if let nameComponent = player1.component(ofType: NameComponent.self) {
            nameComponent.node.position = CGPoint(x: self.size.width * 1/4, y: self.size.height * 3/4)
        }
        entityManager.add(player1)

        let player2 = PlayerEntity(name: "Pat", owner: .player2)
        if let nameComponent = player2.component(ofType: NameComponent.self) {
            nameComponent.node.position = CGPoint(x: self.size.width * 3/4, y: self.size.height * 3/4)
        }
        entityManager.add(player2)

        let player3 = PlayerEntity(name: "Alex", owner: .player3)
        if let nameComponent = player3.component(ofType: NameComponent.self) {
            nameComponent.node.position = CGPoint(x: self.size.width * 1/4, y: self.size.height * 1/4)
        }
        entityManager.add(player3)

        let player4 = PlayerEntity(name: "Sasha", owner: .player4)
        if let nameComponent = player4.component(ofType: NameComponent.self) {
            nameComponent.node.position = CGPoint(x: self.size.width * 3/4, y: self.size.height * 1/4)
        }
        entityManager.add(player4)
        
    }

    func makeSpinny(at pos: CGPoint, color: SKColor) {
        if let spinny = self.spinnyNode?.copy() as! SKShapeNode? {
            spinny.position = pos
            spinny.strokeColor = color
            self.addChild(spinny)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

#if os(iOS) || os(tvOS)
// Touch-based event handling
extension GameScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
        
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.green)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.blue)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.red)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.makeSpinny(at: t.location(in: self), color: SKColor.red)
        }
    }
    
   
}
#endif

#if os(OSX)
// Mouse-based event handling
extension GameScene {

    override func mouseDown(with event: NSEvent) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
        self.makeSpinny(at: event.location(in: self), color: SKColor.green)
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.makeSpinny(at: event.location(in: self), color: SKColor.blue)
    }
    
    override func mouseUp(with event: NSEvent) {
        self.makeSpinny(at: event.location(in: self), color: SKColor.red)
    }

}
#endif

