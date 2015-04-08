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
    
   
    
    init(spriteSheet:SpriteSheet,SpriteX:Double,SpriteY:Double){
   
        
        self.spriteX = SpriteX
        self.spriteY = SpriteY
        self.spritesheet=spriteSheet
        self.spirte = spritesheet.getTextureAt( self.spriteX, y: self.spriteY)
        self.SpriteNode = SKSpriteNode(texture: self.spirte, size: CGSize(width: self.width, height: self.width))
    }
   
    
  //returns if the Object was touched -> built in function for this?
    func isTouched(point:CGPoint)->Bool{
        if(point.x>=self.SpriteNode.position.x-(self.width/2) && point.x<=self.SpriteNode.position.x+(self.width/2) && point.y>=self.SpriteNode.position.y-(height/2) && point.y<=self.SpriteNode.position.y+(height/2)){
            return true;
            }
        return false;
    }
    //moves the entity to a point
    func moveTo(location:CGPoint){
        SpriteNode.removeAllActions()
        SpriteNode.runAction(SKAction.moveTo(location, duration: 2))
    }
    
    func update(){
        
    }
    

    
}