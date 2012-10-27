package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	public class Platform extends Entity
	{
		private var color:uint = 0x000000;
		
		public function Platform(posX:int, posY:int, width:int, height:int) 
		{
			var ground:Image = Image.createRect(width, height, color);
			graphic = ground;	
			x = posX;
			y = posY;
			setHitbox(width, height, 0, 0);
			type = "ground";
		}		
	}
}