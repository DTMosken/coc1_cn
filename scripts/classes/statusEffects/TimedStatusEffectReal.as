package classes.statusEffects
{
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.SaveAwareInterface;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.TimeAwareInterface;
   import classes._StatusEffect.DataStore;
   import flash.Boot;
   
   public class TimedStatusEffectReal extends TemporaryBuff implements SaveAwareInterface, TimeAwareInterface
   {
      
      public var updateValueNr:int;
      
      public var updateValue:Boolean;
      
      public var updateString:String;
      
      public var removeString:String;
      
      public var duration:int;
      
      public function TimedStatusEffectReal(param1:StatusEffectType = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:String = undefined)
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         updateValueNr = 0;
         updateValue = false;
         removeString = "";
         updateString = "";
         duration = 1;
         super(param1,param2,param3,param4,param5);
         dataStore = new DataStore(1,"","",null,null);
         CoC.timeAwareClassAdd(this);
      }
      
      public function updateValueForMe(param1:int) : void
      {
         if(param1 < 5 && param1 > 0)
         {
            updateValue = true;
            updateValueNr = param1;
         }
      }
      
      public function updateBeforeSave(param1:CoC) : void
      {
         dataStore.duration = duration;
         dataStore.updateString = updateString;
         dataStore.removeString = removeString;
      }
      
      public function updateAfterLoad(param1:CoC) : void
      {
         if(dataStore != null)
         {
            duration = dataStore.duration;
            updateString = dataStore.updateString;
            removeString = dataStore.removeString;
         }
         else
         {
            dataStore = new DataStore(duration,removeString,updateString,null,null);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:Boolean = false;
         if(get_host() is Creature && !get_host().hasStatusEffect(get_stype()))
         {
            CoC.timeAwareClassRemove(this);
            remove();
            return false;
         }
         if(get_host() is Player && get_host() != StatusEffect.get_game().player)
         {
            _loc1_ = decrementDuration(false);
         }
         else
         {
            _loc1_ = decrementDuration();
         }
         if(updateValue)
         {
            switch(updateValueNr)
            {
               case 1:
                  value1 = duration;
                  break;
               case 2:
                  value2 = duration;
                  break;
               case 3:
                  value3 = duration;
                  break;
               case 4:
                  value4 = duration;
            }
         }
         return _loc1_;
      }
      
      public function setUpdateString(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         updateString = param1;
      }
      
      public function setRemoveString(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         removeString = param1;
      }
      
      public function setDuration(param1:int) : void
      {
         duration = param1;
      }
      
      override public function removedFromHostList(param1:Boolean) : void
      {
         CoC.timeAwareClassRemove(this);
         super.removedFromHostList(param1);
      }
      
      public function decrementDuration(param1:Boolean = true) : Boolean
      {
         duration -= 1;
         if(duration <= 0)
         {
            CoC.timeAwareClassRemove(this);
            remove();
            if(param1 && removeString != "")
            {
               StatusEffect.get_game().outputText("[pg]" + removeString + "[pg]");
               return true;
            }
         }
         if(param1 && updateString != "")
         {
            StatusEffect.get_game().outputText("[pg]" + updateString + "[pg]");
            return true;
         }
         return false;
      }
   }
}

