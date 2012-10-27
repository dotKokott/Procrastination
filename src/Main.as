package 
{	
	/**
	 * ...
	 * @author Christian Kokott
	 */
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import Worlds.GameWorld;
	[SWF(width="800",height="600")]
	public class Main extends Engine 
	{	
		public function Main()
		{			
			super(3200, 600, 60, false);
			FP.world = new GameWorld;
			FP.screen.color = 0xFFFFFF;
			FP.console.enable();
			FP.console.toggleKey = Key.ENTER;			
		}			
	}	
}