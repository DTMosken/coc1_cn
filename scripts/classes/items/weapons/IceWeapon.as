package classes.items.weapons
{
   import classes.ItemType;
   import classes.Monster;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class IceWeapon extends Weapon
   {
      
      public static var init__:Boolean;
      
      public static var typeTags:Array;
      
      public static var AXE:int = 0;
      
      public static var MACE:int = 1;
      
      public static var SPEAR:int = 2;
      
      public static var SWORD:int = 3;
      
      public static var DAGGER:int = 4;
      
      public static var SCYTHE:int = 5;
      
      public static var STAFF:int = 6;
      
      public static var typeStrings:Array = ["axe","mace","spear","sword","dagger","scythe","staff"];
      
      public static var typeNouns:Array = ["swing","smash","thrust","slash","stab","slash","strike"];
      
      public static var typeVerbs:Array = ["hack","smash","stab","slash","stab","reap","strike"];
      
      public var _type:int;
      
      public function IceWeapon(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _type = 0;
         _type = param1;
         var _loc2_:Boolean = param1 == 6;
         super("Ice" + Utils.capitalizeFirstLetter(typeString()),"Ice " + Utils.capitalizeFirstLetter(typeString()),"ice " + typeString(),"a frozen " + typeString(),[typeNoun(),typeVerb()],6,0,"A translucent blue " + typeString() + ", made of nothing but ice. You shouldn\'t expect it to last very long.",["融化",typeTag()]);
         if(_loc2_)
         {
            addTags("魔法");
         }
      }
      
      public static function playerHasIceWeapon() : String
      {
         var _loc2_:* = null as ItemType;
         if(KGAMECLASS.kGAMECLASS.player.get_weapon().isMelting())
         {
            return KGAMECLASS.kGAMECLASS.player.get_weapon().get_name();
         }
         var _loc1_:int = 0;
         while(_loc1_ < int(IceWeapon.typeStrings.length))
         {
            _loc2_ = ItemType.lookupItem("Ice" + Utils.capitalizeFirstLetter(IceWeapon.typeStrings[_loc1_]));
            if(KGAMECLASS.kGAMECLASS.player.hasItem(_loc2_))
            {
               return _loc2_.get_name();
            }
            _loc1_++;
         }
         return "";
      }
      
      public static function melt(param1:Boolean = false) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:String = KGAMECLASS.kGAMECLASS.player.location;
         if(_loc2_ == "冰川裂谷")
         {
            return true;
         }
         if(_loc2_ == "火山岩山")
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2797,-50);
         }
         else
         {
            _loc3_ = 2797;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2797) <= 0)
         {
            if(param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2797) == -50)
               {
                  KGAMECLASS.kGAMECLASS.output.text("[pg-]当你准备攻击时，你手中滴水的[weapon]瞬间融化了，水很快就蒸发了。也许把冰制武器带进这种酷热的环境中并不是个好主意。[pg-]");
               }
               else
               {
                  KGAMECLASS.kGAMECLASS.output.text("[pg-]在你设法攻击之前，融化的[weapon]因承受不住压力而碎裂，让你手无寸铁。[pg-]");
               }
            }
            else
            {
               KGAMECLASS.kGAMECLASS.output.text("[pg]你的冰制武器已经融化，变得毫无用处。[pg]");
            }
            IceWeapon.removeAllIceWeapons();
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2797) == 5)
         {
            if(param1)
            {
               KGAMECLASS.kGAMECLASS.output.text("[pg-]你的[weapon]在高温和攻击的压力下看起来相当脆弱。它撑不了多久了，像这样可能也造成不了多少伤害。");
               return true;
            }
            KGAMECLASS.kGAMECLASS.output.text("[pg]你的冰制武器状况不太好；从到处滴水的情况来看，它可能撑不了多久了。[pg]");
            return false;
         }
         return true;
      }
      
      public static function removeAllIceWeapons() : void
      {
         var _loc2_:* = null as ItemType;
         var _loc1_:int = 0;
         while(_loc1_ < int(IceWeapon.typeStrings.length))
         {
            _loc2_ = ItemType.lookupItem("Ice" + Utils.capitalizeFirstLetter(IceWeapon.typeStrings[_loc1_]));
            if(KGAMECLASS.kGAMECLASS.player.get_weapon().isMelting())
            {
               KGAMECLASS.kGAMECLASS.player.setUnarmed();
            }
            while(KGAMECLASS.kGAMECLASS.player.hasItem(_loc2_))
            {
               KGAMECLASS.kGAMECLASS.player.destroyItems(_loc2_);
            }
            _loc1_++;
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2797,0);
      }
      
      public function typeVerb() : String
      {
         return IceWeapon.typeVerbs[_type];
      }
      
      public function typeTag() : String
      {
         return IceWeapon.typeTags[_type];
      }
      
      public function typeString() : String
      {
         return IceWeapon.typeStrings[_type];
      }
      
      public function typeNoun() : String
      {
         return IceWeapon.typeNouns[_type];
      }
      
      override public function preAttack() : Boolean
      {
         return IceWeapon.melt(true);
      }
      
      override public function get_attackVerb() : String
      {
         if(isChanneling())
         {
            return "blast";
         }
         return typeVerb();
      }
      
      override public function get_attackNoun() : String
      {
         if(isChanneling())
         {
            return "icebolt";
         }
         return typeNoun();
      }
      
      override public function get_attack() : Number
      {
         return _attack + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2797);
      }
      
      override public function describeAttack(param1:Object) : void
      {
         var _loc2_:Monster = param1.target;
         var _loc3_:Monster = _loc2_ != null ? _loc2_ : get_monster();
         var _loc4_:Object = param1.damage;
         var _loc5_:int = _loc4_ != null ? int(_loc4_) : 0;
         var _loc6_:* = param1.attackResult;
         var _loc7_:Object = _loc6_ != null ? Boolean(_loc6_.attackHit) : null;
         var _loc8_:Object = _loc7_ != null ? _loc7_ : param1.hit;
         var _loc9_:Boolean = _loc8_ != null ? Boolean(_loc8_) : true;
         var _loc10_:Object = param1.crit;
         var _loc11_:Boolean = _loc10_ != null && Boolean(_loc10_);
         if(_loc9_ && isChanneling())
         {
            switch(Utils.rand(2))
            {
               case 0:
                  outputText("你周围的空气变得更冷了，你的" + Utils.cnName(get_name()) + "向" + _loc3_.get_themonster() + "发射了一道冰箭。");
                  break;
               case 1:
                  outputText(_loc3_.get_Themonster() + "被你的" + typeString() + "发射的" + Utils.cnName(get_attackNoun()) + "击中。");
            }
            if(_loc11_)
            {
               outputText("<b>暴击！</b>");
            }
            outputText(get_combat().getDamageText(_loc5_));
         }
         else
         {
            super.describeAttack(param1);
         }
      }
   }
}

