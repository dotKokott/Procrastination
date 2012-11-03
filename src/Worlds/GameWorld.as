package Worlds 
{
	/**
	 * ...
	 * @author Christian Kokott
	 */
	 import net.flashpunk.FP;
	 import net.flashpunk.World;
	 import Player;
	 
	public class GameWorld extends World
	{
		public var player:Player;
		
		public function GameWorld() 
		{
			
			add(new Clock(100, 50, 50));
			add(new Clock(0, 70, 20));
			add(new Clock(100, 300, 70));
			add(new Clock(500, 70, 80));
			add(new Clock(400, 50, 30));
			player = new Player();
			
			add(new Platform(0, 550, 800, 5));
			add(player);
			
			respawnCrateTrigger();
			
			//add(new Crate(200, 500));
			
			for (var i:int = 0; i <= 10; i++)
			{
				add(new CrateSlot(800 + (i * 50), 550));				
			}
		}
		
		public function respawnCrateTrigger():void
		{
			add(new CrateTrigger(100, 500, 100, 100));
		}
	}
}