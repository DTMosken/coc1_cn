package classes.items
{
   import classes.MasteryLib;
   import classes.MasteryType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.internals.Utils;
   import classes.scenes.areas.lake.GooGirl;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Weapon extends Equippable
   {
      
      public static var init__:Boolean;
      
      public static var WEAPONEFFECTS:WeaponEffects;
      
      public static var WEIGHT_LIGHT:String = "Light";
      
      public static var WEIGHT_MEDIUM:String = "Medium";
      
      public static var WEIGHT_HEAVY:String = "Heavy";
      
      public var perk:Array;
      
      public var effects:Array;
      
      public var _weight:String;
      
      public var _name:String;
      
      public var _currentAmmo:int;
      
      public var _attackWords:Array;
      
      public var _attack:Number;
      
      public var _armorMod:Number;
      
      public var _ammoMax:int;
      
      public var _accBonus:Number;
      
      public function Weapon(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Array = undefined, param6:Number = 0, param7:Number = 0, param8:String = undefined, param9:Array = undefined, param10:Number = 1, param11:Array = undefined, param12:int = 0, param13:Number = 0)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _accBonus = Number(Math.NaN);
         _ammoMax = 0;
         _currentAmmo = 0;
         effects = [];
         _armorMod = Number(Math.NaN);
         _weight = "Medium";
         perk = [];
         _attack = Number(Math.NaN);
         _attackWords = ["attack"];
         super(param1,param2,param4,param7,param8);
         _name = param3;
         _attackWords = param5 == null ? [] : param5;
         _attack = param6;
         perk = param9 == null ? [] : param9;
         _armorMod = param10;
         effects = param11 == null ? [] : param11;
         _ammoMax = param12;
         _accBonus = param13;
      }
      
      public function weaponXP(param1:int, param2:Boolean = true) : void
      {
         var _loc5_:* = null as MasteryType;
         var _loc3_:int = 0;
         var _loc4_:Array = getMasteries();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            get_player().masteryXP(_loc5_,param1,param2);
         }
      }
      
      override public function useText() : void
      {
         super.useText();
         if(isTwoHanded() && get_player().get_shield() != ShieldLib.NOTHING && !(get_player().hasPerk(PerkLib.TitanGrip) && get_player().get_str() >= 90))
         {
            outputText("因为这把武器需要双手使用，你已经卸下了你的盾牌。");
         }
      }
      
      public function useAmmo() : void
      {
         if(get_ammoMax() != 0)
         {
            set_currentAmmo(get_currentAmmo() - 1);
         }
      }
      
      override public function sourceString() : String
      {
         return get_name();
      }
      
      public function set_weightCategory(param1:String) : String
      {
         return _weight = param1;
      }
      
      public function set_weight(param1:String) : String
      {
         return _weight = param1;
      }
      
      override public function set_name(param1:String) : String
      {
         return _name = param1;
      }
      
      public function set_currentAmmo(param1:int) : int
      {
         return _currentAmmo = param1;
      }
      
      public function set_attackVerb(param1:String) : String
      {
         _attackWords[1] = param1;
         return param1;
      }
      
      public function set_attackNoun(param1:String) : String
      {
         _attackWords[0] = param1;
         return param1;
      }
      
      public function set_attack(param1:Number) : Number
      {
         return _attack = param1;
      }
      
      public function set_armorMod(param1:Number) : Number
      {
         return _armorMod = param1;
      }
      
      public function set_ammoMax(param1:int) : int
      {
         return _ammoMax = param1;
      }
      
      public function set_accBonus(param1:Number) : Number
      {
         return _accBonus = param1;
      }
      
      public function setPerks(param1:Array) : void
      {
         perk.resize(0);
         if(int(param1.length) == 0)
         {
            addTags();
         }
         else if(int(param1.length) == 1)
         {
            addTags(param1[0]);
         }
         else if(int(param1.length) == 2)
         {
            addTags(param1[0],param1[1]);
         }
         else if(int(param1.length) == 3)
         {
            addTags(param1[0],param1[1],param1[2]);
         }
         else if(int(param1.length) == 4)
         {
            addTags(param1[0],param1[1],param1[2],param1[3]);
         }
         else if(int(param1.length) == 5)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4]);
         }
         else if(int(param1.length) == 6)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5]);
         }
         else if(int(param1.length) == 7)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6]);
         }
         else if(int(param1.length) == 8)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7]);
         }
         else if(int(param1.length) == 9)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8]);
         }
         else if(int(param1.length) == 10)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9]);
         }
         else if(int(param1.length) == 11)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10]);
         }
         else if(int(param1.length) == 12)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11]);
         }
         else if(int(param1.length) == 13)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12]);
         }
         else if(int(param1.length) == 14)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13]);
         }
         else if(int(param1.length) == 15)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14]);
         }
         else if(int(param1.length) == 16)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14],param1[15]);
         }
         else if(int(param1.length) == 17)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14],param1[15],param1[16]);
         }
         else if(int(param1.length) == 18)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14],param1[15],param1[16],param1[17]);
         }
         else if(int(param1.length) == 19)
         {
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14],param1[15],param1[16],param1[17],param1[18]);
         }
         else
         {
            if(int(param1.length) != 20)
            {
               throw "Too many rest arguments";
            }
            addTags(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5],param1[6],param1[7],param1[8],param1[9],param1[10],param1[11],param1[12],param1[13],param1[14],param1[15],param1[16],param1[17],param1[18],param1[19]);
         }
      }
      
      public function setArmorPenetration(param1:Number) : void
      {
         _armorMod = param1;
      }
      
      public function reload() : void
      {
         set_currentAmmo(get_ammoMax());
         outputText("你打开你的" + Utils.cnName(get_name()) + "的枪膛来重新装填弹药。");
      }
      
      public function preAttack() : Boolean
      {
         if(needsReload())
         {
            reload();
            return false;
         }
         useAmmo();
         return true;
      }
      
      override public function playerEquip() : Equippable
      {
         if(isTwoHanded() && get_player().get_shield() != ShieldLib.NOTHING && !(get_player().hasPerk(PerkLib.TitanGrip) && get_player().get_str() >= 90))
         {
            get_inventory().unequipShield();
         }
         set_currentAmmo(get_ammoMax());
         return super.playerEquip();
      }
      
      public function needsReload() : Boolean
      {
         if(get_ammoMax() > 0)
         {
            return get_currentAmmo() <= 0;
         }
         return false;
      }
      
      public function modifiedAttack() : Number
      {
         var _loc1_:Number = get_attack();
         if(get_player().get_armor() == get_game().armors.SAMUARM && this == get_game().weapons.KATANA)
         {
            _loc1_ += 2;
         }
         return _loc1_;
      }
      
      public function masteryLevel() : int
      {
         var _loc5_:* = null as MasteryType;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = getMasteries();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc1_++;
            _loc2_ += get_player().masteryLevel(_loc5_);
         }
         return int(_loc2_ / _loc1_);
      }
      
      public function listMasteries() : String
      {
         var _loc4_:* = null as MasteryType;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = getMasteries();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc1_.push(Utils.cnName(_loc4_.get_id()));
         }
         return _loc1_.join(", ");
      }
      
      public function isWhip() : Boolean
      {
         return Boolean(perk.contains("Whip"));
      }
      
      public function isUnholy() : Boolean
      {
         return Boolean(perk.contains("uglySword"));
      }
      
      public function isUnarmed() : Boolean
      {
         return Boolean(perk.contains("徒手"));
      }
      
      public function isType(param1:MasteryType) : Boolean
      {
         return Boolean(getMasteries().contains(param1));
      }
      
      public function isTwoHanded() : Boolean
      {
         if(!isLarge())
         {
            return isDual();
         }
         return true;
      }
      
      public function isSummoned() : Boolean
      {
         return Boolean(perk.contains("召唤"));
      }
      
      public function isStaff() : Boolean
      {
         return Boolean(perk.contains("Staff"));
      }
      
      public function isStabby() : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Array = perk;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ != "Knife")
            {
               if(_loc5_ != "1H Sword")
               {
                  if(_loc5_ != "Spear")
                  {
                     if(_loc5_ == "非刃器")
                     {
                        return false;
                     }
                     continue;
                  }
               }
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function isSpear() : Boolean
      {
         return Boolean(perk.contains("Spear"));
      }
      
      public function isSharp() : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Array = perk;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ != "Scythe")
            {
               if(_loc5_ != "Knife")
               {
                  if(_loc5_ != "1H Sword")
                  {
                     if(_loc5_ != "2H Sword")
                     {
                        if(_loc5_ != "Axe")
                        {
                           if(_loc5_ == "锋利")
                           {
                              return true;
                           }
                           if(_loc5_ == "非锐器")
                           {
                              return false;
                           }
                           continue;
                        }
                     }
                  }
               }
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function isScythe() : Boolean
      {
         return Boolean(perk.contains("Scythe"));
      }
      
      public function isRanged() : Boolean
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc1_:int = 0;
         var _loc2_:Array = perk;
         do
         {
            if(_loc1_ >= int(_loc2_.length))
            {
               return false;
            }
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc3_;
            if(_loc4_ == "Bow")
            {
               break;
            }
            if(_loc4_ == "Crossbow")
            {
               break;
            }
            if(_loc4_ == "Firearm")
            {
               break;
            }
         }
         while(_loc4_ != "远程");
         return true;
      }
      
      public function isPolearm() : Boolean
      {
         return Boolean(perk.contains("Polearm"));
      }
      
      public function isOneHandedMelee() : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Array = perk;
         while(true)
         {
            if(_loc2_ >= int(_loc3_.length))
            {
               return _loc1_;
            }
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ != "Polearm")
            {
               if(_loc5_ != "Scythe")
               {
                  if(_loc5_ != "Knife")
                  {
                     if(_loc5_ != "1H Sword")
                     {
                        if(_loc5_ != "1H Blunt")
                        {
                           if(_loc5_ != "Fist")
                           {
                              if(_loc5_ != "Axe")
                              {
                                 if(_loc5_ != "Claw")
                                 {
                                    if(_loc5_ == "大型")
                                    {
                                       break;
                                    }
                                    if(_loc5_ == "Bow")
                                    {
                                       break;
                                    }
                                    if(_loc5_ == "Crossbow")
                                    {
                                       break;
                                    }
                                    if(_loc5_ == "Firearm")
                                    {
                                       break;
                                    }
                                    if(_loc5_ == "远程")
                                    {
                                       break;
                                    }
                                    continue;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc1_ = true;
         }
         return false;
      }
      
      public function isMelting() : Boolean
      {
         return Boolean(perk.contains("融化"));
      }
      
      public function isMagicStaff() : Boolean
      {
         return Boolean(perk.contains("魔法"));
      }
      
      public function isLarge() : Boolean
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc1_:int = 0;
         var _loc2_:Array = perk;
         do
         {
            if(_loc1_ >= int(_loc2_.length))
            {
               return false;
            }
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc4_ = _loc3_;
            if(_loc4_ == "2H Sword")
            {
               break;
            }
            if(_loc4_ == "2H Blunt")
            {
               break;
            }
         }
         while(_loc4_ != "大型");
         return true;
      }
      
      public function isKnife() : Boolean
      {
         return Boolean(perk.contains("Knife"));
      }
      
      public function isKatana() : Boolean
      {
         return Boolean(perk.contains("武士刀"));
      }
      
      public function isHybrid() : Boolean
      {
         return int(getMasteries().length) > 1;
      }
      
      public function isHolySword() : Boolean
      {
         return Boolean(perk.contains("holySword"));
      }
      
      public function isFist() : Boolean
      {
         return Boolean(perk.contains("Fist"));
      }
      
      public function isFirearm() : Boolean
      {
         return Boolean(perk.contains("Firearm"));
      }
      
      public function isDual() : Boolean
      {
         return Boolean(perk.contains("双持"));
      }
      
      public function isCunning() : Boolean
      {
         return Boolean(perk.contains("狡诈"));
      }
      
      public function isCrossbow() : Boolean
      {
         return Boolean(perk.contains("弩"));
      }
      
      public function isClaw() : Boolean
      {
         return Boolean(perk.contains("Claw"));
      }
      
      public function isChanneling() : Boolean
      {
         if(isMagicStaff())
         {
            return get_player().hasPerk(PerkLib.StaffChanneling);
         }
         return false;
      }
      
      public function isBow() : Boolean
      {
         return Boolean(perk.contains("Bow"));
      }
      
      public function isBlunt() : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Array = perk;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ != "Staff")
            {
               if(_loc5_ != "1H Blunt")
               {
                  if(_loc5_ != "2H Blunt")
                  {
                     if(_loc5_ == "钝器")
                     {
                        return true;
                     }
                     if(_loc5_ == "非钝器")
                     {
                        return false;
                     }
                     continue;
                  }
               }
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function isBladed() : Boolean
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Array = perk;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            _loc5_ = _loc4_;
            if(_loc5_ != "Scythe")
            {
               if(_loc5_ != "1H Sword")
               {
                  if(_loc5_ != "2H Sword")
                  {
                     if(_loc5_ != "Axe")
                     {
                        if(_loc5_ == "带刃")
                        {
                           return true;
                        }
                        if(_loc5_ == "非刃器")
                        {
                           return false;
                        }
                        continue;
                     }
                  }
               }
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function isBareFist() : Boolean
      {
         if(isFist())
         {
            return isUnarmed();
         }
         return false;
      }
      
      public function isBareClaw() : Boolean
      {
         if(isClaw())
         {
            return isUnarmed();
         }
         return false;
      }
      
      public function isAxe() : Boolean
      {
         return Boolean(perk.contains("Axe"));
      }
      
      public function isAttached() : Boolean
      {
         if(!isUnarmed())
         {
            return Boolean(perk.contains("附着"));
         }
         return true;
      }
      
      public function isAphrodisiac() : Boolean
      {
         return Boolean(perk.contains("催情武器"));
      }
      
      public function is2HSword() : Boolean
      {
         return Boolean(perk.contains("2H Sword"));
      }
      
      public function is2HBlunt() : Boolean
      {
         return Boolean(perk.contains("2H Blunt"));
      }
      
      public function is1HSword() : Boolean
      {
         return Boolean(perk.contains("1H Sword"));
      }
      
      public function is1HBlunt() : Boolean
      {
         return Boolean(perk.contains("1H Blunt"));
      }
      
      public function get_weightCategory() : String
      {
         return _weight;
      }
      
      override public function get_name() : String
      {
         return _name;
      }
      
      override public function get_headerName() : String
      {
         if(_headerName != "")
         {
            return _headerName;
         }
         return get_name();
      }
      
      public function get_effects() : Array
      {
         return effects;
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = Utils.cnName(_description);
         _loc1_ += "\n\n类型：";
         if(listMasteries() == "")
         {
            _loc1_ += "不明";
         }
         else
         {
            _loc1_ += listMasteries();
         }
         if(isLarge())
         {
            _loc1_ += " (大型)";
         }
         if(isDual())
         {
            _loc1_ += " (双持)";
         }
         _loc1_ += "\n攻击(基础): " + Std.string(get_attack()) + "<b>\n</b>攻击(修正): " + Std.string(modifiedAttack());
         if(get_player().get_weapon().modifiedAttack() < modifiedAttack())
         {
            _loc1_ += "<b>(<font color=\"#3ecc01\">+" + (modifiedAttack() - get_player().get_weapon().modifiedAttack()) + "</font>)</b>";
         }
         else if(get_player().get_weapon().modifiedAttack() > modifiedAttack())
         {
            _loc1_ += "<b>(<font color=\"#cb101a\">-" + (get_player().get_weapon().modifiedAttack() - modifiedAttack()) + "</font>)</b>";
         }
         else
         {
            _loc1_ += "<b>(0)</b>";
         }
         _loc1_ += "\n护甲穿透：" + Std.string(Math.round((1 - get_armorMod()) * 100)) + "%";
         if(get_accBonus() != 0)
         {
            _loc1_ += "\n精准度修正：" + get_accBonus();
         }
         if(get_ammoMax() > 0)
         {
            _loc1_ += "\n最大弹药量：" + get_ammoMax();
         }
         _loc1_ += "\n基础价值：" + Std.string(get_value());
         return _loc1_ + generateStatsTooltip();
      }
      
      public function get_currentAmmo() : int
      {
         return _currentAmmo;
      }
      
      public function get_attackVerbed() : String
      {
         var _loc1_:String = get_attackVerb();
         var _loc2_:IMap = new StringMap();
         if("shoot" in StringMap.reserved)
         {
            _loc2_.setReserved("shoot","shot");
         }
         else
         {
            _loc2_.h["shoot"] = "shot";
         }
         if("cut" in StringMap.reserved)
         {
            _loc2_.setReserved("cut","cut");
         }
         else
         {
            _loc2_.h["cut"] = "cut";
         }
         if("strike" in StringMap.reserved)
         {
            _loc2_.setReserved("strike","struck");
         }
         else
         {
            _loc2_.h["strike"] = "struck";
         }
         if("wallop" in StringMap.reserved)
         {
            _loc2_.setReserved("wallop","walloped");
         }
         else
         {
            _loc2_.h["wallop"] = "walloped";
         }
         if("hit" in StringMap.reserved)
         {
            _loc2_.setReserved("hit","hit");
         }
         else
         {
            _loc2_.h["hit"] = "hit";
         }
         if("swing" in StringMap.reserved)
         {
            _loc2_.setReserved("swing","swung");
         }
         else
         {
            _loc2_.h["swing"] = "swung";
         }
         if("thrust" in StringMap.reserved)
         {
            _loc2_.setReserved("thrust","thrust");
         }
         else
         {
            _loc2_.h["thrust"] = "thrust";
         }
         if("batter" in StringMap.reserved)
         {
            _loc2_.setReserved("batter","battered");
         }
         else
         {
            _loc2_.h["batter"] = "battered";
         }
         if("buffet" in StringMap.reserved)
         {
            _loc2_.setReserved("buffet","buffeted");
         }
         else
         {
            _loc2_.h["buffet"] = "buffeted";
         }
         if("beat" in StringMap.reserved)
         {
            _loc2_.setReserved("beat","beat");
         }
         else
         {
            _loc2_.h["beat"] = "beat";
         }
         var _loc3_:IMap = _loc2_;
         if(_loc1_ in StringMap.reserved ? Boolean(_loc3_.existsReserved(_loc1_)) : _loc1_ in _loc3_.h)
         {
            return _loc1_ in StringMap.reserved ? _loc3_.getReserved(_loc1_) : _loc3_.h[_loc1_];
         }
         var _loc4_:EReg = new EReg("e$","i");
         var _loc5_:EReg = new EReg("([bcdfghjklmnpqrstvwxz])y$","i");
         var _loc6_:EReg = new EReg("[^aeiou][aeiou]([bcdfgjklmnpqrstvxz])$","i");
         if(_loc4_.match(_loc1_))
         {
            return _loc1_ + "d";
         }
         if(_loc5_.match(_loc1_))
         {
            return _loc5_.replace(_loc1_,"$1ied");
         }
         if(_loc6_.match(_loc1_))
         {
            return _loc6_.replace(_loc1_,"$&$1ed");
         }
         return _loc1_ + "ed";
      }
      
      public function get_attackVerb() : String
      {
         if(isChanneling())
         {
            return "zap";
         }
         switch(int(_attackWords.length))
         {
            case 0:
               return "attack";
            case 1:
               return _attackWords[0];
            default:
               return _attackWords[1];
         }
      }
      
      public function get_attackNoun() : String
      {
         if(isChanneling())
         {
            return "bolt";
         }
         if(int(_attackWords.length) == 0)
         {
            return "attack";
         }
         return _attackWords[0];
      }
      
      public function get_attack() : Number
      {
         return _attack;
      }
      
      public function get_armorMod() : Number
      {
         var _loc1_:Number = _armorMod;
         if(isChanneling())
         {
            _loc1_ /= 2;
         }
         return _loc1_;
      }
      
      public function get_ammoMax() : int
      {
         return _ammoMax;
      }
      
      public function get_accBonus() : Number
      {
         return _accBonus;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
      
      public function getMasteries() : Array
      {
         var _loc5_:* = null as MasteryType;
         var _loc1_:Array = perk;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = MasteryLib.MASTERY_WEAPONS;
         var _loc6_:int = 0;
         while(_loc6_ < int(_loc1_.length))
         {
            _loc6_++;
         }
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(Boolean(_loc1_.contains(_loc5_.get_id())))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function getAttackRange() : CombatRange
      {
         if(isChanneling())
         {
            return CombatRange.Ranged;
         }
         if(isRanged())
         {
            return CombatRange.Ranged;
         }
         return CombatRange.Melee;
      }
      
      public function execEffect() : void
      {
         var _loc3_:* = null as Function;
         var _loc1_:int = 0;
         var _loc2_:Array = get_effects();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_();
         }
      }
      
      public function describeAttack(param1:Object) : void
      {
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:Boolean = false;
         var _loc16_:* = null as String;
         var _loc17_:* = null as String;
         var _loc2_:Monster = param1.target;
         var _loc3_:Monster = _loc2_ != null ? _loc2_ : get_monster();
         var _loc4_:Object = param1.damage;
         var _loc5_:int = _loc4_ != null ? int(_loc4_) : 0;
         var _loc6_:Object = param1.crit;
         var _loc7_:Boolean = _loc6_ != null && Boolean(_loc6_);
         var _loc8_:* = param1.attackResult;
         var _loc9_:Object = _loc8_ != null ? Boolean(_loc8_.attackHit) : null;
         var _loc10_:Object = _loc9_ != null ? _loc9_ : param1.hit;
         var _loc11_:Boolean = _loc10_ != null ? Boolean(_loc10_) : true;
         var _loc12_:* = param1.attackResult;
         if(_loc11_)
         {
            if(_loc3_.replacesDescribeAttacked(this,_loc5_,_loc7_))
            {
               return;
            }
            _loc13_ = _loc5_ < 15 || _loc5_ < _loc3_.maxHP() * 0.05;
            _loc14_ = _loc5_ < 50 || _loc5_ < _loc3_.maxHP() * 0.2;
            _loc15_ = _loc5_ < 100 || _loc5_ < _loc3_.maxHP() * 0.33;
            if(this == get_weapons().LRAVENG && _loc5_ == 12 && get_player().isNaked() && get_time().hours == 18 && _loc3_ is GooGirl)
            {
               outputText("夕阳的余晖从你呼啸的刀刃上反射出来，它在空中划出一道致命的弧线，直逼史莱姆女孩。不幸的是，夜幕降临，你赤裸的[skinshort]上越来越冷的寒意让你分心了片刻，破坏了你完美的姿势，让你的氏族蒙羞。这一击仅仅擦伤了她凝胶状的皮肤，不过你还是因为造成了一点微小的伤害而感到些许安慰。");
            }
            else if(isChanneling())
            {
               switch(Utils.rand(2))
               {
                  case 0:
                     outputText("你通过你的" + Utils.cnName(get_name()) + "引导魔法来" + Utils.cnName(get_attackVerb()) + "" + _loc3_.get_themonster() + "。");
                     break;
                  case 1:
                     outputText(_loc3_.get_Themonster() + "被你" + Utils.cnName(get_name()) + "的" + Utils.cnName(get_attackNoun()) + "击中了。");
               }
            }
            else if(_loc5_ <= 0)
            {
               outputText("你的" + Utils.cnName(get_attackNoun()) + "命中了，但没有对" + _loc3_.get_themonster() + "造成伤害。");
            }
            else if(_loc13_)
            {
               outputText("你对" + _loc3_.get_themonster() + "造成了擦伤！");
            }
            else if(_loc14_)
            {
               outputText("你" + Utils.cnName(get_attackVerb()) + "并击伤了" + _loc3_.get_themonster() + "！");
            }
            else if(_loc15_)
            {
               outputText("你" + Utils.cnName(get_attackNoun()) + "的力量使" + _loc3_.get_themonster() + "踉跄了一下！");
            }
            else
            {
               outputText("你用强有力的" + Utils.cnName(get_attackNoun()) + "[b:重创]了" + _loc3_.get_themonster() + "！");
            }
            if(_loc7_)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_combat().getDamageText(_loc5_));
         }
         else
         {
            _loc16_ = "dodge";
            if(_loc12_ != null ? Boolean(_loc12_.parry) : null)
            {
               _loc16_ = "parry";
            }
            if(_loc12_ != null ? Boolean(_loc12_.block) : null)
            {
               _loc16_ = "block";
            }
            _loc17_ = _loc16_;
            if(_loc17_ == "block")
            {
               _loc3_.describeBlock(get_attackNoun(),get_attackVerb());
            }
            else if(_loc17_ == "parry")
            {
               _loc3_.describeParry(get_attackNoun(),get_attackVerb());
            }
            else
            {
               _loc3_.describeDodge(get_attackNoun(),get_attackVerb());
            }
         }
      }
      
      override public function canUse() : Boolean
      {
         return true;
      }
      
      public function addTags(... rest) : Weapon
      {
         var _loc5_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:Array = rest;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc5_ = _loc3_[_loc2_++];
            perk.push(_loc5_);
         }
         return this;
      }
   }
}

