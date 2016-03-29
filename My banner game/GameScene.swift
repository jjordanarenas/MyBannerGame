//
//  GameScene.swift
//  My banner game
//
//  Created by Jorge Jordán on 25/03/16.
//  Copyright (c) 2016 Jorge Jordán. All rights reserved.
//

import SpriteKit
//0
import GoogleMobileAds

class GameScene: SKScene {
    // 1
    var viewController: GameViewController!
    // 2
    var bannerView: GADBannerView!
  
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
      
        // 3
        if bannerView == nil {
          initializeBanner()
        }
        loadRequest()
    }
  
    // 3
    func initializeBanner() {
      // Create a banner ad and add it to the view hierarchy.
      bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
      bannerView.adUnitID = "ca-app-pub-5767684210972160/3268052334"
      bannerView.rootViewController = viewController
      view!.addSubview(bannerView)
    }
  
    // 4
    func loadRequest() {
      bannerView.hidden = false
      let request = GADRequest()
      request.testDevices = [kGADSimulatorID, "24ed9ee524b90565f5e15t23ad232415"]
      bannerView.loadRequest(request)
    }
  
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
