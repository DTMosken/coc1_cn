package classes
{
   import flash.Boot;
   
   public class Mastery extends BaseContent implements TimeAwareInterface
   {
      
      public var _xp:int;
      
      public var _permed:Boolean;
      
      public var _mtype:MasteryType;
      
      public var _level:int;
      
      public function Mastery(param1:MasteryType = undefined, param2:int = 0, param3:int = 0, param4:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _permed = false;
         _xp = 0;
         _level = 0;
         super();
         _mtype = param1;
         _level = param2;
         _xp = param3;
         _permed = param4;
         CoC.timeAwareClassAdd(this);
      }
      
      public function xpGain(param1:int, param2:Boolean = false) : Boolean
      {
         if(_level >= get_maxLevel())
         {
            return false;
         }
         var _loc3_:int = _level;
         _xp += param1;
         while(_xp >= get_maxXP())
         {
            levelGain(1,false,param2);
         }
         if(_xp < 0)
         {
            levelGain(-1,false,param2);
         }
         if(_loc3_ != _level)
         {
            return true;
         }
         return false;
      }
      
      public function xpFix() : Boolean
      {
         if(_xp < get_maxXP())
         {
            return false;
         }
         while(_xp >= get_maxXP())
         {
            levelGain(1);
         }
         return true;
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         return xpFix();
      }
      
      public function set_xp(param1:int) : int
      {
         return _xp = param1;
      }
      
      public function set_level(param1:int) : int
      {
         return _level = param1;
      }
      
      public function perm() : Boolean
      {
         if(get_mtype().get_permable())
         {
            _permed = true;
         }
         return _permed;
      }
      
      public function onLevel(param1:Boolean = true) : void
      {
         _mtype.onLevel(_level,param1);
      }
      
      public function onAttach(param1:Boolean = true) : void
      {
         _mtype.onAttach(param1);
      }
      
      public function levelGain(param1:int, param2:Boolean = false, param3:Boolean = false) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:int = _level;
         if(_level >= get_maxLevel() && param1 >= 0)
         {
            if(_xp >= get_maxXP())
            {
               _xp = get_maxXP() - 1;
            }
            if(_xp < 0)
            {
               _xp = 0;
            }
            return false;
         }
         if(param1 > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < Math.abs(param1))
            {
               if(!param2)
               {
                  _xp -= get_maxXP();
               }
               _level += 1;
               onLevel(param3);
               _loc5_++;
            }
         }
         else if(param1 < 0)
         {
            if(!param2)
            {
               _xp = 0;
            }
            _level -= param1;
            onLevel(param3);
         }
         if(_xp < 0)
         {
            _xp = 0;
         }
         if(_level < 0)
         {
            _level = 0;
         }
         if(_level > get_maxLevel())
         {
            _level = get_maxLevel();
         }
         if(_loc4_ != _level)
         {
            return true;
         }
         return false;
      }
      
      public function get_xpCurve() : Number
      {
         return _mtype.get_xpCurve();
      }
      
      public function get_xp() : int
      {
         return _xp;
      }
      
      public function get_name() : String
      {
         return _mtype.get_name();
      }
      
      public function get_mtype() : MasteryType
      {
         return _mtype;
      }
      
      public function get_maxXP() : int
      {
         return int(100 * Math.pow(get_xpCurve(),get_level()));
      }
      
      public function get_maxLevel() : int
      {
         return _mtype.get_maxLevel();
      }
      
      public function get_level() : int
      {
         return _level;
      }
      
      public function get_isPermed() : Boolean
      {
         return _permed;
      }
      
      public function get_desc() : String
      {
         return _mtype.get_desc();
      }
      
      public function get_category() : String
      {
         return _mtype.get_category();
      }
   }
}

