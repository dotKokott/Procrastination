package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	public class Clock extends Entity
	{		
		private var hourHand:Image;
		private var minuteHand:Image;
		private var secondHand:Image;
		
		private var value:Date;
		
		public var useCurrentTime:Boolean = true;
		
		public function Clock(posX:int, posY:int, size:int, time:Date = null) 
		{			
			x = posX;
			y = posY;
			
			addGraphic(Image.createCircle(size, 0x000000));
			var inner:Image = Image.createCircle(size -6, 0xFFFFFF);
			inner.originX = inner.originY = -6;
			
			addGraphic(inner);
			
			hourHand = Image.createRect(size - 10, 3, 0x000000);
						
			hourHand.y = size;			
			hourHand.x = size;
						
			addGraphic(hourHand);			
			
			minuteHand = Image.createRect(size - 10, 2, 0x000000);
						
			minuteHand.y = size;			
			minuteHand.x = size;
						
			addGraphic(minuteHand);						
			
			secondHand = Image.createRect(size - 10, 1, 0x000000);
						
			secondHand.y = size;			
			secondHand.x = size;
						
			addGraphic(secondHand);									
			
			if (time == null)
			{
				value = new Date();
			}
			else
			{
				useCurrentTime = false;
				value = time;
			}						
		}
		
		override public function update():void 
		{
			if (useCurrentTime)
			{
				value = new Date();
			}			
			
			if (value.hours >= 12)
			{
				value.hours -= 12;				
			}
			
			hourHand.angle = -(((360 / 12)) * value.hours) + 90;
			minuteHand.angle = -(((360 / 60)) * value.minutes) + 90;
			secondHand.angle = -(((360 / 60)) * value.seconds) + 90;			
		}
	}	
}