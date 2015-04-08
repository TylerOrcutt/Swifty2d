//
//  GameScene.swift
//  swifty2d
//
//

import SpriteKit

class GameScene: SKScene {
    
    var myLabel = SKLabelNode(fontNamed:"Chalkduster")
    var player:Player!
    var entities = [Entity]()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
      //  myLabel.text = "Hello, World!";
       // myLabel.fontSize = 20;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame)-20);
       // self.addChild(myLabel)
        backgroundColor=SKColor.blackColor();
        
        
    //init gameObjects
        //the sprite sheet that will be used for the player and enemies
        let char_sheet = SpriteSheet(Sheet: SKTexture(imageNamed: "char_sheet"), rows: 8, colums: 12)
       
        //create the player
        player = Player(spriteSheet: char_sheet, SpriteX: 0, SpriteY: 1)
        player.SpriteNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(player.SpriteNode)
     
        //add an enemy
        let enemy = Enemy(spriteSheet: char_sheet, SpriteX: 0, SpriteY: 4)
          enemy.SpriteNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)+100);
        entities.append(enemy)
        addChild(enemy.SpriteNode)
     
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
        
           
            
            if(player.isTouched(location)){
                println("player touched")
            }else{
                player.moveTo(location)
            }
        }
    }
   
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        player.update()
    }
}
