//
//  Entity.swift
//  swifty2d
//

import Foundation
import SpriteKit

class Entity{
    var SpriteNode:SKSpriteNode!
    var spirte: SKTexture!
    var spritesheet:SpriteSheet!
    var spriteX:Double = 0
    var spriteY:Double = 0
    var height:CGFloat = 64
    var width:CGFloat  = 64
    let speed:CGFloat = 100
    var position:CGPoint!
    
    init(spriteSheet:SpriteSheet,SpriteX:Double,SpriteY:Double){
        self.position = CGPoint(x: 0, y: 0)
        
        self.spriteX = SpriteX
        self.spriteY = SpriteY
        self.spritesheet=spriteSheet
        self.spirte = spritesheet.getTextureAt( self.spriteX, y: self.spriteY)
        self.SpriteNode = SKSpriteNode(texture: self.spirte, size: CGSize(width: self.width, height: self.width))
    }
   
    
  //returns if the Object was touched -> built in function for this? -- CGRectContainspoint?
    func isTouched(point:CGPoint)->Bool{
        if(point.x>=self.SpriteNode.position.x-(self.width/2) && point.x<=self.SpriteNode.position.x+(self.width/2) && point.y>=self.SpriteNode.position.y-(height/2) && point.y<=self.SpriteNode.position.y+(height/2)){
            return true;
            }
        return false;
    }
    //moves the entity to a point ->needs to be updated for camera 
    // runAction probably wont work
    func moveTo(location:CGPoint){
        SpriteNode.removeAllActions()
        let dist = distanceToPoint(location)
        let duration = NSTimeInterval(dist/speed)
        SpriteNode.runAction(SKAction.moveTo(location, duration:duration ))
    }
    
    
    //returns distance to a point
    func distanceToPoint(point :CGPoint)->CGFloat{
        let y = abs(abs((position.y-point.y)))
        let x = abs((position.x-point.x))
        
        
        return sqrt(((x*x)+(y*y)))
        
        
    }
    
    
   func update(curTime: CFTimeInterval, dt: CFTimeInterval){
        
        
    }
    

    
}