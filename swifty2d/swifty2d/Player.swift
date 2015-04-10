//
//  Player.swift
//  swifty2d


import Foundation
import SpriteKit

class Player: Entity{
    var camera:Camera!
    var isMoving:Bool=false
    var moveTo:CGPoint!
    var Playerspeed:CGFloat =  60
    var lastUpdate:CFTimeInterval = 0
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
    override func update(curTime: CFTimeInterval, dt: CFTimeInterval){
        if(isMoving){
            
            if(self.position.x == moveTo.x &&  self.position.y == moveTo.y  || distanceToPoint(moveTo)<(Playerspeed-1) ){
            isMoving=false
            moveTo=nil
             // println("Player move complete")
            }else{
             //animate spirte and move
                //get the angle in which the player is moving
             var angle = atan2((moveTo.y - position.y), (moveTo.x-position.x))
                
              //update position
                position.x += (cos(angle)*Playerspeed) * CGFloat(dt)
                position.y += (sin(angle)*Playerspeed) * CGFloat(dt)
                
                angle += CGFloat(M_PI/2)
                //println(angle);
                //update sprite so it is facing in the correct direction -> kludgy but works for now
                if(angle>=2 && angle<4){
                    spriteY=3
                }else if(angle>=1 && angle<2){
                    spriteY=2
                }
                else if(angle >= -1 && angle<1){
                    spriteY=0
                }else{
                    spriteY=1
                }
                //ehh works for now
                //convert this to MS
                if((curTime-lastUpdate)*1000 > 100){
                    lastUpdate=curTime
                spriteX++
                if(spriteX>2){
                    spriteX=0
                }
                }
                
                SpriteNode.texture = spritesheet.getTextureAt(spriteX, y: spriteY)
                 // println("Moving PLayer")
            }
        }
    }

    
}