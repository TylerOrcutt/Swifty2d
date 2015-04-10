//
//  Map.swift
//  swifty2d
//


import Foundation
import SpriteKit

class Block{
    
    var x:CGFloat = 0
    var y:CGFloat = 0
    
    var spriteX:Double = 0
    var spriteY:Double = 0
    var isBlock:Bool = false
    var SpriteNode:SKSpriteNode!
    
    var sprite: SKTexture!

}

class Map{
        var gamescene:GameScene!
    var blocks = [Block]()
    var MapSheet:SpriteSheet!
    
    init(mapfile:String, mapSheet:SpriteSheet, gamescene:GameScene){
        self.MapSheet = mapSheet
        self.gamescene = gamescene
   var path=NSBundle.mainBundle().pathForResource(mapfile, ofType: ".txt")
        if let contents = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil){
      
        //load map from text file
        var blocklist=contents.componentsSeparatedByString("Newblock:");
        
        for(var i=0;i < blocklist.count;i++){
           
           
         //new block
           
            let line = blocklist[i] as NSString
            var block = Block()
           for(var x=0; x < line.length;x++){
            if(x+5<line.length){
              if(line.substringWithRange(NSRange(location: x, length: 5))=="posx="){
                    let pos=x+5
           
                if let posx =  (getValue(line, position: pos) as String).toInt(){
                       block.x = CGFloat((posx/32)*64)
                }
                }//posx
            
            
                if(line.substringWithRange(NSRange(location: x, length: 5))=="posy="){
                    let pos=x+5
                  
                    if let posy =  (getValue(line, position: pos) as String).toInt(){
                        block.y = CGFloat((posy/32)*64)
                     }
                  }//posy
            
                if(line.substringWithRange(NSRange(location: x, length: 5))=="imgx="){
                    let pos=x+5
                    
                    if let posy =  (getValue(line, position: pos) as String).toInt(){
                        block.spriteX = (Double)(posy/32)
                    }
                }//imgx
                
                if(line.substringWithRange(NSRange(location: x, length: 5))=="imgy="){
                    let pos=x+5
                  
                    if let posy =  (getValue(line, position: pos) as String).toInt(){
                        block.spriteY = (Double)(posy/32)
                    }
                }//imgy
                
            
              }//x+5<line
           
             if(x+8<line.length){
                if(line.substringWithRange(NSRange(location: x, length: 8))=="blocked="){
                    let pos=x+8
                   
                    let isBlocked = getValue(line, position: pos)
                        if(isBlocked=="true"){
                            block.isBlock=true
                        }else{
                            block.isBlock=false
                        }
                    
                }//blocked
            }//>x+8
            
              }//line loop
            block.sprite = MapSheet.getTextureAt(block.spriteX, y: block.spriteY)
            block.SpriteNode = SKSpriteNode(texture: block.sprite, size: CGSize(width: 64, height: 64))
            gamescene.addChild(block.SpriteNode)
            blocks.append(block)
            
            
            }
            
        }
        
       
    }
    
    
    
   private func getValue(line:NSString, position:Int)->NSString{
        var value:NSString = ""
        for(var i = position;i<line.length && line.substringWithRange(NSRange(location:i , length:1)) != ";"; i++){
            value = value + line.substringWithRange(NSRange(location: i, length: 1));
        }
        
        
        return value
    }
    
    
    
    func update(camera:Camera){
        for block in blocks {
          
            block.SpriteNode.position.x = block.x - camera.x
            block.SpriteNode.position.y = block.y - camera.y
            
        }
    }
    
    
}