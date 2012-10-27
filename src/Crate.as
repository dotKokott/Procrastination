package  
{
	/**
	 * ...
	 * @author Christian Kokott
	 */
	
	 import net.flashpunk.FP;
	 import net.flashpunk.Entity;
	 import net.flashpunk.graphics.Image;
	 import Worlds.GameWorld;
	 
	public class Crate extends Entity
	{		
		private var color:uint = 0x855E42;
		
		public function Crate(posX:int, posY:int) 
		{
			x = posX;
			y = posY;
			
			width = 50;
			height = 50;
			
			setHitbox(50, 50);
			
			graphic = Image.createRect(50, 50, color);			
			
			type = "crate";
		}		
		
		override public function update():void 
		{
			var player:Player = collide("player", x, y) as Player;
			var slot:CrateSlot = collide("crateslot", x - 25, y +1) as CrateSlot;
						
			if (player)
			{
				x = player.x + player.width;
			}
			
			if (slot && slot.Item == null)
			{
				slot.snapInCrate(this);
				(this.world as GameWorld).respawnCrateTrigger();
			}
		}
	}
}