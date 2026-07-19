package classes
{
   import flash.Boot;
   
   public class Room
   {
      
      public var WestExitTime:int;
      
      public var WestExitCondition:Function;
      
      public var WestExit:String;
      
      public var SouthExitTime:int;
      
      public var SouthExitCondition:Function;
      
      public var SouthExit:String;
      
      public var RoomName:String;
      
      public var RoomFunction:Function;
      
      public var RoomDisplayName:String;
      
      public var NorthExitTime:int;
      
      public var NorthExitCondition:Function;
      
      public var NorthExit:String;
      
      public var EastExitTime:int;
      
      public var EastExitCondition:Function;
      
      public var EastExit:String;
      
      public function Room()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         WestExitTime = 0;
         SouthExitTime = 0;
         EastExitTime = 0;
         NorthExitTime = 0;
      }
   }
}

