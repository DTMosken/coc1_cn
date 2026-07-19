package classes.scenes.dungeons.helDungeon
{
   import classes.Monster;
   import flash.Boot;
   
   public class AbstractPhoenix extends Monster
   {
      
      public var shieldWall:Boolean;
      
      public var ordered:Boolean;
      
      public var friendlyDanger:Boolean;
      
      public function AbstractPhoenix()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         shieldWall = false;
         friendlyDanger = false;
         ordered = false;
         super();
      }
   }
}

