//
//  GameScene.swift
//  swifty2d
//
//

import SpriteKit

class GameScene: SKScene {
     var camera = Camera()
    var myLabel = SKLabelNode(fontNamed:"Chalkduster")
   
    var player:Player!
    var lastUpdate:CFTimeInterval = 0
    var entities = [Entity]()
  //  var maptiles = [Entity]()
    var map : Map!
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
        //map sheet
        let map_sheet = SpriteSheet(Sheet: SKTexture(imageNamed: "sp2"), rows: 12, colums: 10)
         map = Map(mapfile:"test", mapSheet:map_sheet, gamescene:self)
      //generate a simple map for the player to run around on
      /*  for(var y:CGFloat = 0; y<=CGRectGetMaxY(self.frame); y+=64){
                for(var x:CGFloat = 0; x<=CGRectGetMaxX(self.frame); x+=64){
                    let map = Entity(spriteSheet: map_sheet, SpriteX: 3, SpriteY: 9)
                 //   map.SpriteNode.position=CGPoint(x:x, y:y);
                    map.position.x=x;
                    map.position.y=y;
                    //println(CGRectGetMidX(self.frame))
                    addChild(map.SpriteNode)
                    maptiles.append(map)
        }
        }*/
      
     
        //add an enemy
        let enemy = Enemy(spriteSheet: char_sheet, SpriteX: 0, SpriteY: 4)
        //put the enemy int the center of the map
          enemy.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)+100);
        entities.append(enemy)
        addChild(enemy.SpriteNode)
        
        //create the player
        player = Player(spriteSheet: char_sheet, SpriteX: 0, SpriteY: 1, camera:camera)
        player.SpriteNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
     //   player.position=CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        player.position = CGPoint(x: 100, y: 100)
       // player.position=CGPoint(x:0, y:0);
        self.addChild(player.SpriteNode)
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
   
    
   //update all the objects sprite positions based on camera position
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    
        player.update(currentTime, dt: currentTime-lastUpdate)
            lastUpdate=currentTime
       
        
        camera.x=player.position.x-CGRectGetMidX(self.frame);
        camera.y=player.position.y-CGRectGetMidY(self.frame)
  
        
        player.SpriteNode.position.x = player.position.x-camera.x
        player.SpriteNode.position.y = player.position.y-camera.y
     /*   for tiles in maptiles{
            tiles.SpriteNode.position.x = tiles.position.x - camera.x
            tiles.SpriteNode.position.y = tiles.position.y - camera.y
            
        }*/
        map.update(camera)
        for enemy in entities{
            enemy.SpriteNode.position.x = enemy.position.x - camera.x
            enemy.SpriteNode.position.y = enemy.position.y - camera.y
        }
        
    }
}
