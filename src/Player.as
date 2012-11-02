package  
{
	/**
	 * ...
	 * @author Christian Kokott
	 */
	
	 import flash.geom.Point;
	 import net.flashpunk.FP;
	 import net.flashpunk.Entity;
	 import net.flashpunk.graphics.Spritemap;
	 import net.flashpunk.utils.Input;
	 import net.flashpunk.utils.Key;
	 
	public class Player extends Entity
	{		
		[Embed(source = '../assets/player.png')] private const playerSprite:Class;
		
		private var direction:String = "right";
		private var currentAnimation:String = "stand";				
		
		private var playerSpritemap:Spritemap;
			
		private var velocity:Point = new Point(0,0);
		
		private var walkSpeed:int = 150;		
		
		public function Player() 
		{			
			playerSpritemap = new Spritemap(playerSprite, 104, 150);			

			playerSpritemap.add("walk_right", [0, 1, 2, 3, 4, 5], 5, true);
			playerSpritemap.add("walk_left", [6, 7, 8, 9, 10, 11], 5, true);
			playerSpritemap.add("stand_right", [12], 5, true);
			playerSpritemap.add("stand_left", [13], 5, true);
			
			x = 90;
			y = 550 - 150;
			
			setHitbox(104, 150);
			
			type = "player";
			
			graphic = playerSpritemap;			
		}
		
		override public function update():void 
		{
			processInput();		
			
			x += velocity.x;
			y += velocity.y;
		}
		
		private function processInput():void
		{
			if (Input.check(Key.LEFT))
			{
				direction = "left";
				currentAnimation = "walk";
				
				velocity.x = -walkSpeed * FP.elapsed;
			}
			if (Input.check(Key.RIGHT))
			{
				direction = "right";
				currentAnimation = "walk";
				
				velocity.x = walkSpeed * FP.elapsed;		
			}
			
			if (!Input.check(Key.RIGHT) && !Input.check(Key.LEFT))
			{
				velocity.x = 0;
			}
			
			if (velocity.x == 0 && velocity.y == 0)
			{
				currentAnimation = "stand";
			}
		
			playerSpritemap.play(currentAnimation + "_" + direction);			
		}		
	}
}