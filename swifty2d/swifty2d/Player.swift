//
//  Player.swift
//  swifty2d


import Foundation
import SpriteKit

class Player: Entity{
    var camera:Camera!
    var isMoving:Bool=false
    var moveTo:CGPoint!
    var Playerspeed:CGFloat = 1
    
    //why doesnt this show up in the intellisense if its not overrid
    init(spriteSheet:SpriteSheet,SpriteX:Double,SpriteY:Double, camera: Camera){
        super.init(spriteSheet: spriteSheet, SpriteX: SpriteX, SpriteY: SpriteY)
    self.camera=camera;
    
    }
    
    
   override func moveTo(location:CGPoint){
        var loc=CGPoint(x: location.x+camera.x, y: location.y+camera.y);
    
   
        moveTo=loc
        isMoving=true;
    

    }
    override func update(){
        if(isMoving){
            if(self.position.x==moveTo.x &&  self.position.y==moveTo.y){
            isMoving=false
            moveTo=nil
                
            }else{
             //animate spirte and move
                position.x -= position.x-moveTo.x + Playerspeed
                position.y-=position.y - moveTo.y+Playerspeed
            }
        }
    }

    
}