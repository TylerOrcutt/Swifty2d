//
//  SpriteSheet.swift
//  swifty2d
//


import Foundation
import SpriteKit

class SpriteSheet{
    var spritesheet:SKTexture!
    var rows:Double = 1
    var colums:Double = 1
    init (Sheet:SKTexture, rows:Double, colums:Double){
        self.spritesheet=Sheet;
        self.rows=rows
        self.colums=colums
    }
    
    
    
    
    //returns a texture at specified location
    //this assumes all sprites in the sprite sheet have identical widths/heights
    //the first Sprite image would be at 0,0
    func getTextureAt(x:Double, y:Double)->SKTexture{
        let posx=(x/colums);
        //println("posX:\(posx)")
            
         let posy = (1.0-((y+1)/rows));
        
       // println("posY:\(posy)")
        let width = 1/colums;

        let height = (1/rows)
        //return SKTexture(rect: CGRect(x: 0, y: (1.0-(1/8)), width:(1/12), height: (1/8)), inTexture: self.spritesheet)
        return SKTexture(rect: CGRect(x: posx, y: posy, width:width, height: height), inTexture: spritesheet)
    }
    
    


}