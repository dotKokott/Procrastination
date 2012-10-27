package  
{
	/**
	 * ...
	 * @author Christian Kokott
	 */
	import net.flashpunk.Entity
	 
	public class CrateSlot extends Entity
	{		
		public var Item:Crate;
		
		public function CrateSlot(posX:int, posY:int) 
		{
			x = posX;
			y = posY;
			
			width = 50;
			height = 50;
			
			type = "crateslot";
		}
		
		public function snapInCrate(crate:Crate):void
		{
			Item = crate;
			
			crate.x = x;
			crate.y = y;			
		}		
	}
}