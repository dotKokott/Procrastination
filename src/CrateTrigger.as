package  
{
	/**
	 * ...
	 * @author Christian Kokott
	 */
	import net.flashpunk.Entity;
	 
	public class CrateTrigger extends Entity
	{	
		public function CrateTrigger(posX:int, posY:int, width:int, height:int) 
		{
			x = posX;
			y = posY;
			
			width = width;
			height = height;
			
			type = "cratetrigger";
		}
		
		override public function update():void 
		{
			if (collide("player", x, y))
			{
				this.world.remove(this);
				spawnCrate();
			}
		}
		
		private function spawnCrate():void
		{
			this.world.add(new Crate(x, y));
		}
	}
}