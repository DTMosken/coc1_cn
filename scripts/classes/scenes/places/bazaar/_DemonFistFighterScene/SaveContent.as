package classes.scenes.places.bazaar._DemonFistFighterScene
{
   import flash.Boot;
   
   public class SaveContent
   {
      
      public var timesWon:int;
      
      public var timesLost:int;
      
      public var timesFoughtDog:int;
      
      public var timesBrokenRules:int;
      
      public var shookDogHand:Boolean;
      
      public var playerName:String;
      
      public var newRulesExplained:Boolean;
      
      public var learnedOfDemonFist:Boolean;
      
      public var demonfistTimeAway:int;
      
      public var consecutiveLosses:int;
      
      public var beatDemonfist:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:String = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         shookDogHand = false;
         timesFoughtDog = 0;
         newRulesExplained = true;
         demonfistTimeAway = 0;
         consecutiveLosses = 0;
         learnedOfDemonFist = false;
         beatDemonfist = false;
         playerName = "";
         timesBrokenRules = 0;
         timesWon = 0;
         timesLost = 0;
         if(param1 != null)
         {
            timesLost = param1;
         }
         if(param2 != null)
         {
            timesWon = param2;
         }
         if(param3 != null)
         {
            timesBrokenRules = param3;
         }
         if(param4 != null)
         {
            playerName = param4;
         }
         if(param5 != null)
         {
            beatDemonfist = param5;
         }
         if(param6 != null)
         {
            learnedOfDemonFist = param6;
         }
         if(param7 != null)
         {
            consecutiveLosses = param7;
         }
         if(param8 != null)
         {
            demonfistTimeAway = param8;
         }
         if(param9 != null)
         {
            newRulesExplained = param9;
         }
         if(param10 != null)
         {
            timesFoughtDog = param10;
         }
         if(param11 != null)
         {
            shookDogHand = param11;
         }
      }
   }
}

