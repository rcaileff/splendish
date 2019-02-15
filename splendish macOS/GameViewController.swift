//
//  GameViewController.swift
//  splendish macOS
//
//  Created by Rachel Caileff on 11/21/18.
//  Copyright © 2018 Rachel Caileff. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aspectRatio = view.bounds.width / view.bounds.height
        let scene = GameScene.newGameScene(aspectRatio: aspectRatio)
        
        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

}

