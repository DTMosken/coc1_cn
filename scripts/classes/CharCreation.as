package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.items.armors.GooArmor;
   import classes.lists.FlagLists;
   import classes.lists.PerkLists;
   import classes.saves.SelfSaver;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import flash.utils.Dictionary;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.EnumValueMap;
   import haxe.ds.IntMap;
   import haxe.ds.Option;
   
   public class CharCreation extends BaseContent
   {
      
      public static var MAX_TOLERANCE_LEVEL:int = 20;
      
      public static var MAX_MORALSHIFTER_LEVEL:int = 10;
      
      public static var MAX_DESIRES_LEVEL:int = 10;
      
      public static var MAX_ENDURANCE_LEVEL:int = 10;
      
      public static var MAX_MYSTICALITY_LEVEL:int = 10;
      
      public static var MAX_WISDOM_LEVEL:int = 5;
      
      public static var MAX_MARTIALITY_LEVEL:int = 10;
      
      public static var MAX_SEDUCTION_LEVEL:int = 10;
      
      public static var MAX_FORTUNE_LEVEL:int = -1;
      
      public static var MAX_VIRILITY_LEVEL:int = 15;
      
      public static var MAX_FERTILITY_LEVEL:int = 15;
      
      public static var NEW_GAME_PLUS_RESET_CLIT_LENGTH_MAX:Number = 1.5;
      
      public var statBonuses:IMap;
      
      public var gender:int;
      
      public var defaultStats:IMap;
      
      public var defaultHairLength:IMap;
      
      public var builds:IMap;
      
      public function CharCreation()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:IMap = new EnumValueMap();
         var _loc2_:IMap = new IntMap();
         var _loc3_:IMap = new IntMap();
         _loc3_.h[1] = {
            "femininity":45,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc3_.h[2] = {
            "femininity":40,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc3_.h[0] = {
            "femininity":34,
            "breasts":0,
            "butt":2,
            "hips":2
         };
         _loc3_.h[3] = {
            "femininity":30,
            "breasts":0,
            "butt":2,
            "hips":2
         };
         _loc2_.h[1] = _loc3_;
         _loc3_ = new IntMap();
         _loc3_.h[1] = {
            "femininity":56,
            "breasts":0,
            "butt":0,
            "hips":0
         };
         _loc3_.h[2] = {
            "femininity":62,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc3_.h[0] = {
            "femininity":66,
            "breasts":2,
            "butt":2,
            "hips":6
         };
         _loc3_.h[3] = {
            "femininity":66,
            "breasts":2,
            "butt":2,
            "hips":6
         };
         _loc2_.h[2] = _loc3_;
         _loc1_.set(Build.Small,{
            "thickness":30,
            "setTone":Option.None,
            "str":-1,
            "spe":1,
            "tou":0,
            "tone":5,
            "mods":_loc2_
         });
         _loc2_ = new IntMap();
         _loc3_ = new IntMap();
         _loc3_.h[1] = {
            "femininity":41,
            "breasts":0,
            "butt":3,
            "hips":0
         };
         _loc3_.h[2] = {
            "femininity":36,
            "breasts":0,
            "butt":3,
            "hips":1
         };
         _loc3_.h[0] = {
            "femininity":30,
            "breasts":0,
            "butt":4,
            "hips":4
         };
         _loc3_.h[3] = {
            "femininity":26,
            "breasts":0,
            "butt":4,
            "hips":4
         };
         _loc2_.h[1] = _loc3_;
         _loc3_ = new IntMap();
         _loc3_.h[1] = {
            "femininity":60,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc3_.h[2] = {
            "femininity":66,
            "breasts":1,
            "butt":2,
            "hips":2
         };
         _loc3_.h[0] = {
            "femininity":70,
            "breasts":3,
            "butt":6,
            "hips":6
         };
         _loc3_.h[3] = {
            "femininity":70,
            "breasts":3,
            "butt":6,
            "hips":6
         };
         _loc2_.h[2] = _loc3_;
         _loc1_.set(Build.Medium,{
            "thickness":50,
            "setTone":Option.None,
            "str":0,
            "spe":0,
            "tou":0,
            "tone":0,
            "mods":_loc2_
         });
         _loc2_ = new IntMap();
         _loc3_ = new IntMap();
         _loc3_.h[1] = {
            "femininity":40,
            "breasts":0,
            "butt":5,
            "hips":1
         };
         _loc3_.h[2] = {
            "femininity":35,
            "breasts":0,
            "butt":6,
            "hips":3
         };
         _loc3_.h[0] = {
            "femininity":29,
            "breasts":0,
            "butt":6,
            "hips":4
         };
         _loc3_.h[3] = {
            "femininity":25,
            "breasts":0,
            "butt":6,
            "hips":4
         };
         _loc2_.h[1] = _loc3_;
         _loc3_ = new IntMap();
         _loc3_.h[1] = {
            "femininity":61,
            "breasts":1,
            "butt":6,
            "hips":4
         };
         _loc3_.h[2] = {
            "femininity":67,
            "breasts":3,
            "butt":8,
            "hips":6
         };
         _loc3_.h[0] = {
            "femininity":71,
            "breasts":4,
            "butt":8,
            "hips":10
         };
         _loc3_.h[3] = {
            "femininity":71,
            "breasts":4,
            "butt":8,
            "hips":10
         };
         _loc2_.h[2] = _loc3_;
         _loc1_.set(Build.Large,{
            "thickness":70,
            "setTone":Option.None,
            "str":1,
            "spe":-2,
            "tou":1,
            "tone":-5,
            "mods":_loc2_
         });
         _loc2_ = new IntMap();
         _loc2_.h[1] = 26;
         _loc2_.h[2] = 50;
         _loc3_ = new IntMap();
         var _loc4_:IMap = new IntMap();
         _loc4_.h[1] = {
            "femininity":61,
            "breasts":0,
            "butt":6,
            "hips":2
         };
         _loc4_.h[2] = {
            "femininity":56,
            "breasts":0,
            "butt":6,
            "hips":2
         };
         _loc4_.h[0] = {
            "femininity":50,
            "breasts":1,
            "butt":6,
            "hips":2
         };
         _loc4_.h[3] = {
            "femininity":46,
            "breasts":1,
            "butt":6,
            "hips":2
         };
         _loc3_.h[1] = _loc4_;
         _loc4_ = new IntMap();
         _loc4_.h[1] = {
            "femininity":61,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc4_.h[2] = {
            "femininity":67,
            "breasts":0,
            "butt":2,
            "hips":0
         };
         _loc4_.h[0] = {
            "femininity":71,
            "breasts":1,
            "butt":2,
            "hips":2
         };
         _loc4_.h[3] = {
            "femininity":71,
            "breasts":1,
            "butt":2,
            "hips":2
         };
         _loc3_.h[2] = _loc4_;
         _loc1_.set(Build.Andro,{
            "thickness":50,
            "setTone":Option.Some(_loc2_),
            "str":-1,
            "spe":1,
            "tou":0,
            "tone":0,
            "mods":_loc3_
         });
         builds = _loc1_;
         _loc2_ = new IntMap();
         _loc2_.h[1] = [DynStat.Str,DynStat.Tou];
         _loc2_.h[2] = [DynStat.Spe,DynStat.Inte];
         _loc2_.h[3] = [DynStat.Str,DynStat.Spe,DynStat.Tou,DynStat.Inte];
         statBonuses = _loc2_;
         _loc3_ = new IntMap();
         _loc3_.h[1] = 1;
         _loc3_.h[2] = 10;
         _loc3_.h[3] = 10;
         defaultHairLength = _loc3_;
         _loc4_ = new IntMap();
         var _loc5_:IMap = new IntMap();
         _loc5_.h[2] = 50;
         _loc5_.h[3] = 50;
         _loc5_.h[1] = 51;
         var _loc6_:IMap = new IntMap();
         _loc6_.h[2] = 4;
         _loc6_.h[3] = 4;
         _loc6_.h[1] = 2;
         var _loc7_:IMap = new IntMap();
         _loc7_.h[2] = 30;
         _loc7_.h[3] = 30;
         _loc7_.h[1] = 35;
         _loc4_.h[1] = {
            "str":3,
            "tou":3,
            "spe":10,
            "inte":8,
            "sens":5,
            "lib":1,
            "lust":0,
            "bonus":2,
            "nippleLength":0.04,
            "clitLength":0.1,
            "cockLength":3.5,
            "cockThickness":0.6,
            "ballSize":0.5,
            "tallness":_loc5_,
            "fertility":_loc6_,
            "tone":_loc7_
         };
         _loc5_ = new IntMap();
         _loc5_.h[2] = 63;
         _loc5_.h[3] = 64;
         _loc5_.h[1] = 65;
         _loc6_ = new IntMap();
         _loc6_.h[2] = 8;
         _loc6_.h[3] = 8;
         _loc6_.h[1] = 4;
         _loc7_ = new IntMap();
         _loc7_.h[2] = 30;
         _loc7_.h[3] = 45;
         _loc7_.h[1] = 60;
         _loc4_.h[2] = {
            "str":12,
            "tou":14,
            "spe":14,
            "inte":12,
            "sens":15,
            "lib":20,
            "lust":20,
            "bonus":4,
            "nippleLength":0.2,
            "clitLength":0.3,
            "cockLength":4.5,
            "cockThickness":0.8,
            "ballSize":1,
            "tallness":_loc5_,
            "fertility":_loc6_,
            "tone":_loc7_
         };
         _loc5_ = new IntMap();
         _loc5_.h[2] = 67;
         _loc5_.h[3] = 69;
         _loc5_.h[1] = 71;
         _loc6_ = new IntMap();
         _loc6_.h[2] = 10;
         _loc6_.h[3] = 10;
         _loc6_.h[1] = 5;
         _loc7_ = new IntMap();
         _loc7_.h[2] = 30;
         _loc7_.h[3] = 45;
         _loc7_.h[1] = 60;
         _loc4_.h[0] = {
            "str":15,
            "tou":15,
            "spe":15,
            "inte":15,
            "sens":15,
            "lib":15,
            "lust":15,
            "bonus":5,
            "nippleLength":0.25,
            "clitLength":0.5,
            "cockLength":5.5,
            "cockThickness":1,
            "ballSize":1,
            "tallness":_loc5_,
            "fertility":_loc6_,
            "tone":_loc7_
         };
         _loc5_ = new IntMap();
         _loc5_.h[2] = 65;
         _loc5_.h[3] = 67;
         _loc5_.h[1] = 69;
         _loc6_ = new IntMap();
         _loc6_.h[2] = 2;
         _loc6_.h[3] = 2;
         _loc6_.h[1] = 1;
         _loc7_ = new IntMap();
         _loc7_.h[2] = 30;
         _loc7_.h[3] = 40;
         _loc7_.h[1] = 50;
         _loc4_.h[3] = {
            "str":10,
            "tou":5,
            "spe":5,
            "inte":20,
            "sens":10,
            "lib":10,
            "lust":10,
            "bonus":3,
            "nippleLength":0.25,
            "clitLength":0.5,
            "cockLength":5.5,
            "cockThickness":1,
            "ballSize":1,
            "tallness":_loc5_,
            "fertility":_loc6_,
            "tone":_loc7_
         };
         defaultStats = _loc4_;
         super();
      }
      
      public function virginPrompt() : void
      {
         var anal3:Boolean;
         var vaginal3:Boolean;
         var _g3:CharCreation;
         var anal2:Boolean;
         var vaginal2:Boolean;
         var _g2:CharCreation;
         var anal1:Boolean;
         var vaginal1:Boolean;
         var _g1:CharCreation;
         var anal:Boolean;
         var vaginal:Boolean;
         var _g:CharCreation;
         clearOutput();
         outputText("你还是处子之身吗？");
         menu();
         if(get_player().hasPerk(PerkLib.HistorySlut) && !get_player().hasCock())
         {
            addButtonDisabled(0,"是","以你放荡的过往而言，这根本不可能。");
         }
         else
         {
            _g = this;
            vaginal = true;
            anal = true;
            addButton(0,"是",function():void
            {
               _g.virginChoice(vaginal,anal);
            });
         }
         if(get_player().hasVagina())
         {
            _g1 = this;
            vaginal1 = false;
            anal1 = true;
            addButton(1,"失去处女",function():void
            {
               _g1.virginChoice(vaginal1,anal1);
            });
         }
         else
         {
            addButtonDisabled(1,"失去处女","你并没有阴道。");
         }
         _g2 = this;
         vaginal2 = true;
         anal2 = false;
         addButton(2,"后门陷落",function():void
         {
            _g2.virginChoice(vaginal2,anal2);
         });
         if(get_player().hasVagina())
         {
            _g3 = this;
            vaginal3 = false;
            anal3 = false;
            addButton(3,"两者皆失",function():void
            {
               _g3.virginChoice(vaginal3,anal3);
            });
         }
         else
         {
            addButtonDisabled(3,"两者皆失","你并没有阴道。");
         }
      }
      
      public function virginChoice(param1:Boolean = true, param2:Boolean = true) : void
      {
         if(!param1)
         {
            get_player().lostVirginity = true;
            get_player().vaginas[0].virgin = false;
            var _temp_1:* = get_player().vaginas[0];
            _temp_1.vaginalLooseness = _temp_1.vaginalLooseness + 1;
         }
         if(!param2)
         {
            var _temp_2:* = get_player().ass;
            _temp_2.analLooseness = _temp_2.analLooseness + 1;
         }
         completeCharacterCreation();
      }
      
      public function startTheGame() : void
      {
         get_player().startingRace = get_player().get_race();
         if(get_hardcore())
         {
            get_game().saves.saveGame(get_hardcoreSlot());
         }
         get_game().saves.loadPermObject();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2066,get_game().modSaveVersion);
         statScreenRefresh();
         get_player().loaded = true;
         get_player().charCreation = false;
         if(isNewCharacter())
         {
            if(get_player().get_femininity() >= 50)
            {
               get_player().setUndergarment(get_player().isChild() ? get_undergarments().LOLIPAN : get_undergarments().C_PANTY);
            }
            else
            {
               get_player().setUndergarment(get_undergarments().C_LOIN);
            }
            if(get_player().biggestTitSize() >= 2)
            {
               get_player().setUndergarment(get_undergarments().C_BRA);
            }
            else if(get_player().get_femininity() >= 50 && (get_player().biggestTitSize() >= 1 && get_player().isChild() || get_player().isTeen()))
            {
               get_player().setUndergarment(get_undergarments().LOLIBRA);
            }
            else
            {
               get_player().setUndergarment(UndergarmentLib.NOTHING,0);
            }
         }
         arrival();
      }
      
      public function sexualOrientation() : void
      {
         var orientation2:int;
         var orientation1:int;
         var orientation:int;
         var pickOrientation:Function;
         var _gthis:CharCreation;
         var _loc1_:* = null as Object;
         _gthis = this;
         pickOrientation = function(param1:int):void
         {
            _gthis.get_player().sexOrientation = param1;
            _gthis.chooseComplexion();
         };
         clearOutput();
         menu();
         outputText("你的性取向是什么？");
         outputText("[pg]某一性别对你的吸引力越强，你就越难以抗拒与该性别的生物发生性关系。你的性取向会随着你的性经历逐渐改变。");
         orientation = 100;
         addButton(0,"男性",function():void
         {
            pickOrientation(orientation);
         }).hint("你更难抗拒与男性发生性关系，而抗拒女性则更容易。");
         orientation1 = 0;
         addButton(1,"女性",function():void
         {
            pickOrientation(orientation1);
         }).hint("你更难抗拒与女性发生性关系，而抗拒男性则更容易。");
         orientation2 = 50;
         addButton(2,"双性",function():void
         {
            pickOrientation(orientation2);
         }).hint("男性和女性对你都同样具有吸引力。你不像单性恋那样容易被单一性别影响，但你很难抵抗雌雄同体者。");
         switch(gender)
         {
            case 1:
               _loc1_ = isAMan;
               break;
            case 3:
               _loc1_ = isAHerm;
               break;
            default:
               _loc1_ = isAWoman;
         }
         setExitButton("返回",_loc1_);
      }
      
      public function setHistory(param1:PerkType) : void
      {
         var _loc2_:* = null as Player;
         var _loc3_:* = null as PerkType;
         var _loc4_:* = null as Player;
         var _loc5_:* = null as Player;
         var _loc6_:* = null as Player;
         get_player().createPerk(param1,0,0,0,0);
         if(param1 == PerkLib.HistoryFighter || param1 == PerkLib.HistoryThief || param1 == PerkLib.HistoryWhore)
         {
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() + 50);
         }
         if(param1 == PerkLib.HistoryFortune)
         {
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() + 250);
         }
         if(get_player().isElder())
         {
            _loc3_ = param1;
            if(_loc3_ == PerkLib.HistoryAlchemist)
            {
               if(!get_player().hasKeyItem("Backpack"))
               {
                  get_player().createKeyItem("Backpack",3,0,0,0);
               }
               else if(get_player().keyItemv1("Backpack") < 3)
               {
                  get_player().addKeyValue("Backpack",1,3 - get_player().keyItemv1("Backpack"));
               }
               get_player().itemSlots[get_player().emptySlot()].setItemAndQty(get_consumables().H_PILL,5);
               _loc2_ = get_player();
               _loc2_.set_inte(_loc2_.get_inte() + 20);
               _loc4_ = get_player();
               _loc4_.set_gems(_loc4_.get_gems() + 250);
            }
            else if(_loc3_ == PerkLib.HistoryDEUSVULT)
            {
               if(get_player().get_weapon().isUnarmed())
               {
                  get_player().setWeapon(get_weapons().MACE);
               }
               if(get_player().get_shield() == ShieldLib.NOTHING)
               {
                  get_player().setShield(get_shields().KITE_SH);
               }
               if(get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor() == get_armors().C_CLOTH)
               {
                  get_player().setArmor(get_armors().FULLCHN);
               }
               _loc2_ = get_player();
               _loc2_.set_str(_loc2_.get_str() + 20);
               _loc4_ = get_player();
               _loc4_.set_tou(_loc4_.get_tou() + 20);
               get_player().addMastery(MasteryLib.Shield,1,0,false);
            }
            else if(_loc3_ == PerkLib.HistoryFighter)
            {
               if(get_player().get_weapon().isUnarmed())
               {
                  get_player().setWeapon(get_weapons().SPEAR);
               }
               if(get_player().get_shield() == ShieldLib.NOTHING)
               {
                  get_player().setShield(get_shields().BUCKLER);
               }
               if(get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor() == get_armors().C_CLOTH)
               {
                  get_player().setArmor(get_armors().LEATHRA);
               }
               _loc2_ = get_player();
               _loc2_.set_str(_loc2_.get_str() + 30);
               _loc4_ = get_player();
               _loc4_.set_tou(_loc4_.get_tou() + 20);
               _loc5_ = get_player();
               _loc5_.set_spe(_loc5_.get_spe() + 15);
               _loc6_ = get_player();
               _loc6_.set_gems(_loc6_.get_gems() + 150);
            }
            else if(_loc3_ == PerkLib.HistoryFortune)
            {
               if(!get_player().hasKeyItem("Backpack"))
               {
                  get_player().createKeyItem("Backpack",1,0,0,0);
               }
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + 1500);
            }
            else if(_loc3_ == PerkLib.HistoryHealer)
            {
               get_player().createStatusEffect(StatusEffects.KnowsHeal,0,0,0,0);
               _loc2_ = get_player();
               _loc2_.set_tou(_loc2_.get_tou() + 40);
               _loc4_ = get_player();
               _loc4_.set_gems(_loc4_.get_gems() + 250);
            }
            else if(_loc3_ == PerkLib.HistoryReligious)
            {
               if(get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor() == get_armors().C_CLOTH)
               {
                  get_player().setArmor(get_armors().M_ROBES);
               }
               _loc2_ = get_player();
               _loc2_.set_str(_loc2_.get_str() + 10);
               _loc4_ = get_player();
               _loc4_.set_tou(_loc4_.get_tou() + 10);
               _loc5_ = get_player();
               _loc5_.set_spe(_loc5_.get_spe() + 10);
               _loc6_ = get_player();
               _loc6_.set_inte(_loc6_.get_inte() + 5);
            }
            else if(_loc3_ == PerkLib.HistoryScholar)
            {
               if(get_player().emptySlot() >= 0)
               {
                  get_player().itemSlots[get_player().emptySlot()].setItemAndQty(get_consumables().W__BOOK,1);
               }
               if(get_player().emptySlot() >= 0)
               {
                  get_player().itemSlots[get_player().emptySlot()].setItemAndQty(get_consumables().B__BOOK,1);
               }
               _loc2_ = get_player();
               _loc2_.set_inte(_loc2_.get_inte() + 40);
               _loc4_ = get_player();
               _loc4_.set_gems(_loc4_.get_gems() + 250);
            }
            else if(_loc3_ == PerkLib.HistorySlacker)
            {
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + 50);
            }
            else if(_loc3_ == PerkLib.HistorySlut)
            {
               get_player().addMastery(MasteryLib.Tease,2,0,false);
               _loc2_ = get_player();
               _loc2_.set_tou(_loc2_.get_tou() + 5);
               _loc4_ = get_player();
               _loc4_.set_spe(_loc4_.get_spe() + 10);
               var _temp_1:* = get_player();
               _temp_1.sens = _temp_1.sens + 15;
               var _temp_2:* = get_player();
               _temp_2.lib = _temp_2.lib + 15;
            }
            else if(_loc3_ == PerkLib.HistorySmith)
            {
               if(get_player().get_weapon().isUnarmed())
               {
                  get_player().setWeapon(get_weapons().MACE);
               }
               if(get_player().get_shield() == ShieldLib.NOTHING)
               {
                  get_player().setShield(get_shields().BUCKLER);
               }
               if(get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor() == get_armors().C_CLOTH)
               {
                  get_player().setArmor(get_armors().LEATHRA);
               }
               _loc2_ = get_player();
               _loc2_.set_str(_loc2_.get_str() + 15);
               _loc4_ = get_player();
               _loc4_.set_tou(_loc4_.get_tou() + 15);
               _loc5_ = get_player();
               _loc5_.set_gems(_loc5_.get_gems() + 250);
            }
            else if(_loc3_ == PerkLib.HistoryThief)
            {
               if(get_player().get_weapon().isUnarmed())
               {
                  get_player().setWeapon(get_weapons().DAGGER);
               }
               if(get_player().get_armor() == ArmorLib.NOTHING || get_player().get_armor() == get_armors().C_CLOTH)
               {
                  get_player().setArmor(get_armors().LTHRPNT);
               }
               if(!get_player().hasKeyItem("Backpack"))
               {
                  get_player().createKeyItem("Backpack",2,0,0,0);
               }
               else if(get_player().keyItemv1("Backpack") < 2)
               {
                  get_player().addKeyValue("Backpack",1,1);
               }
               _loc2_ = get_player();
               _loc2_.set_spe(_loc2_.get_spe() + 30);
               _loc4_ = get_player();
               _loc4_.set_gems(_loc4_.get_gems() + 450);
            }
            else if(_loc3_ == PerkLib.HistoryWhore)
            {
               get_player().addMastery(MasteryLib.Tease,3,0,false);
               var _temp_3:* = get_player();
               _temp_3.sens = _temp_3.sens + 10;
               var _temp_4:* = get_player();
               _temp_4.lib = _temp_4.lib + 10;
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + 750);
            }
            else
            {
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() + 250);
            }
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,418,1);
         if(get_player().charCreation)
         {
            virginPrompt();
         }
         else
         {
            playerMenu();
         }
      }
      
      public function setHeight() : void
      {
         var _loc2_:* = null as String;
         clearOutput();
         var _loc1_:Boolean = get_game().get_displaySettings().metric;
         outputText("设置你的身高，当前的单位是[if (metric) {厘米|英寸}]。");
         outputText("\n你可以选择[if (metric) {107到244厘米|3.5英尺（42英寸）到8英尺（96英寸）}]之间的任意身高。");
         switch(get_player().get_gender())
         {
            case 0:
               _loc2_ = _loc1_ ? "175" : "69";
               break;
            case 1:
               _loc2_ = _loc1_ ? "180" : "71";
               break;
            case 2:
               _loc2_ = _loc1_ ? "170" : "67";
               break;
            case 3:
               _loc2_ = _loc1_ ? "175" : "69";
               break;
            default:
               _loc2_ = _loc1_ ? "175" : "69";
         }
         menu();
         promptInput({
            "maxChars":(_loc1_ ? 3 : 2),
            "restrict":"0-9",
            "text":_loc2_
         });
         addButton(0,"确定",confirmHeight);
         addMeasurementSystemToggle(setHeight,4);
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function setHairLength() : void
      {
         clearOutput();
         var _loc1_:Boolean = get_game().get_displaySettings().metric;
         outputText("设置你的头发长度，当前的单位是[if (metric) {厘米|英寸}].");
         outputText("\n你可以选择0（秃头）到[if (metric) {244厘米（|8英寸（96英尺，}]很可能会拖到地上）的任意数值。");
         var _loc2_:String = "";
         switch(get_player().get_gender())
         {
            case 0:
            case 1:
               _loc2_ = _loc1_ ? "15" : "6";
               break;
            case 2:
            case 3:
               _loc2_ = _loc1_ ? "41" : "16";
         }
         menu();
         promptInput({
            "maxChars":(_loc1_ ? 3 : 2),
            "restrict":"0-9",
            "text":_loc2_
         });
         addButton(0,"确定",confirmHairLength);
         addMeasurementSystemToggle(setHairLength,4);
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function setEndowment(param1:PerkType) : void
      {
         var _loc3_:* = null as Player;
         var _loc4_:Number = NaN;
         var _loc2_:PerkType = param1;
         if(_loc2_ == PerkLib.BigClit)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() - 5);
            get_player().setClitLength(1);
            get_player().createPerk(PerkLib.BigClit,1.25,0,0,0);
         }
         else if(_loc2_ == PerkLib.BigCock)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() - 5);
            var _temp_1:* = get_player().cocks[0];
            _temp_1.cockLength = _temp_1.cockLength + 2;
            _loc4_ = Math.floor((get_player().cocks[0].cockLength / 5 - 0.1) * 10);
            get_player().cocks[0].cockThickness = _loc4_ / 10;
            get_player().createPerk(PerkLib.BigCock,1.25,0,0,0);
         }
         else if(_loc2_ == PerkLib.BigTits)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() + 5);
            var _temp_2:* = get_player().breastRows[0];
            _temp_2.breastRating = _temp_2.breastRating + (get_player().isChild() ? 1 : 2);
            get_player().createPerk(PerkLib.BigTits,1.5,0,0,0);
         }
         else if(_loc2_ == PerkLib.Fast)
         {
            _loc3_ = get_player();
            _loc3_.set_spe(_loc3_.get_spe() + (get_player().isChild() ? 3 : 5));
            var _temp_3:* = get_player();
            _temp_3.tone = _temp_3.tone + 10;
            get_player().createPerk(PerkLib.Fast);
         }
         else if(_loc2_ == PerkLib.Fertile)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() + 5);
            var _temp_4:* = get_player();
            _temp_4.fertility = _temp_4.fertility + 25;
            var _temp_5:* = get_player().hips;
            _temp_5.rating = _temp_5.rating + 2;
            get_player().createPerk(PerkLib.Fertile,1.5,0,0,0);
         }
         else if(_loc2_ == PerkLib.Frigid)
         {
            var _temp_6:* = get_player();
            _temp_6.sens = _temp_6.sens - 5;
            get_player().createPerk(PerkLib.Frigid);
         }
         else if(_loc2_ == PerkLib.Lusty)
         {
            var _temp_7:* = get_player();
            _temp_7.lib = _temp_7.lib + (get_player().isChild() ? 3 : 5);
            get_player().createPerk(PerkLib.Lusty);
         }
         else if(_loc2_ == PerkLib.MessyOrgasms)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() - 2);
            get_player().cumMultiplier = 1.5;
            get_player().createPerk(PerkLib.MessyOrgasms,1.25,0,0,0);
         }
         else if(_loc2_ == PerkLib.Pervert)
         {
            var _temp_8:* = get_player();
            _temp_8.cor = _temp_8.cor + (get_player().isChild() ? 3 : 5);
            get_player().createPerk(PerkLib.Pervert);
         }
         else if(_loc2_ == PerkLib.Sensitive)
         {
            var _temp_9:* = get_player();
            _temp_9.sens = _temp_9.sens + (get_player().isChild() ? 3 : 5);
            get_player().createPerk(PerkLib.Sensitive);
         }
         else if(_loc2_ == PerkLib.Smart)
         {
            _loc3_ = get_player();
            _loc3_.set_inte(_loc3_.get_inte() + (get_player().isChild() ? 3 : 5));
            var _temp_10:* = get_player();
            _temp_10.thickness = _temp_10.thickness - 5;
            get_player().createPerk(PerkLib.Smart);
         }
         else if(_loc2_ == PerkLib.Strong)
         {
            _loc3_ = get_player();
            _loc3_.set_str(_loc3_.get_str() + (get_player().isChild() ? 3 : 5));
            var _temp_11:* = get_player();
            _temp_11.tone = _temp_11.tone + 7;
            var _temp_12:* = get_player();
            _temp_12.thickness = _temp_12.thickness + 3;
            get_player().createPerk(PerkLib.Strong);
         }
         else if(_loc2_ == PerkLib.Tough)
         {
            _loc3_ = get_player();
            _loc3_.set_tou(_loc3_.get_tou() + (get_player().isChild() ? 3 : 5));
            var _temp_13:* = get_player();
            _temp_13.tone = _temp_13.tone + 5;
            var _temp_14:* = get_player();
            _temp_14.thickness = _temp_14.thickness + 5;
            get_player().createPerk(PerkLib.Tough);
            get_player().set_HP(get_game().player.maxHP());
         }
         else if(_loc2_ == PerkLib.WetPussy)
         {
            _loc3_ = get_player();
            _loc3_.set_femininity(_loc3_.get_femininity() + 7);
            get_player().vaginas[0].vaginalWetness = 2;
            get_player().createPerk(PerkLib.WetPussy,2,0,0,0);
         }
         chooseHistory();
      }
      
      public function setComplexion(param1:String) : void
      {
         var choice6:String;
         var choice5:String;
         var choice4:String;
         var choice3:String;
         var choice2:String;
         var choice1:String;
         var choice:String;
         var _gthis:CharCreation = this;
         var setHair:Function = function(param1:String):void
         {
            _gthis.get_player().hair.color = param1;
            _gthis.genericStyleCustomizeMenu();
         };
         get_player().skin.tone = param1;
         get_player().arms.claws.tone = "";
         clearOutput();
         outputText("你选择了" + Utils.cnName(param1) + "的肤色。");
         outputText("[pg]你头发的颜色是什么？");
         menu();
         choice = "blonde";
         addButton(0,"金色",function():void
         {
            setHair(choice);
         });
         choice1 = "brown";
         addButton(1,"棕色",function():void
         {
            setHair(choice1);
         });
         choice2 = "black";
         addButton(2,"黑色",function():void
         {
            setHair(choice2);
         });
         choice3 = "red";
         addButton(3,"红色",function():void
         {
            setHair(choice3);
         });
         choice4 = "gray";
         addButton(4,"灰色",function():void
         {
            setHair(choice4);
         });
         choice5 = "white";
         addButton(5,"白色",function():void
         {
            setHair(choice5);
         });
         choice6 = "auburn";
         addButton(6,"红褐色",function():void
         {
            setHair(choice6);
         });
         setExitButton("返回",chooseComplexion);
      }
      
      public function selectBuild(param1:Build, param2:int) : void
      {
         applyStats(gender,get_player().age,param1,param2);
         sexualOrientation();
      }
      
      public function routeToGenderChoiceReincarnation() : void
      {
         clearOutput();
         genericGenderChoice(get_player().age);
      }
      
      public function respecLevelPerks() : void
      {
         var respec:Boolean;
         var _g:CharCreation;
         var _loc5_:* = null as Perk;
         clearOutput();
         if(get_player().ascensionPerkPoints < 5)
         {
            outputText("你需要至少5点飞升特质点数才能重置升级特质。你当前拥有" + get_player().ascensionPerkPoints + "点。");
            doNext(ascensionMenu);
            return;
         }
         if(get_player().perkPoints == get_player().level - 1)
         {
            outputText("没有必要重置，因为你已经重置过升级特质了。");
            doNext(ascensionMenu);
            return;
         }
         var _temp_1:* = get_player();
         _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints - 5;
         get_player().perkPoints = get_player().level - 1;
         _g = this;
         respec = true;
         var _loc1_:Function = function(param1:Perk):Boolean
         {
            return _g.isAscensionPerk(param1,respec);
         };
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = get_player().get_perks();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(Boolean(_loc1_(_loc5_)))
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc4_ = _loc2_;
         get_player().removePerks();
         _loc3_ = 0;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            get_player().createPerk(_loc5_.get_ptype(),_loc5_.value1,_loc5_.value2,_loc5_.value3,_loc5_.value4);
         }
         outputText("你的升级特质现已重置，特质点数已返还给你。");
         doNext(ascensionMenu);
      }
      
      public function renamePrompt() : void
      {
         var _g:CharCreation;
         clearOutput();
         outputText("你可以选择更改你的名字。");
         genericNamePrompt(get_player().get_short());
         menu();
         _g = this;
         addButton(0,"确定",function():void
         {
            _g.chooseName();
         });
         addButton(14,"返回",ascensionMenu);
      }
      
      public function reincarnatePrompt() : void
      {
         clearOutput();
         outputText("你想要转生并作为勇者开始新的生活吗？");
         doYesNo(reincarnate,ascensionMenu);
      }
      
      public function reincarnate() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2979,FlagDict_Impl_.arrayReadInt(_loc1_,2979) + 1);
         newGameGo();
         clearOutput();
         outputText("一切都褪成了白色，最后……变成了黑色。当你慢慢在房间里醒来时，你能感觉到自己被带回了现实。你环顾四周，几乎立刻就认出了这里；你身处英格纳姆旅馆的房间里！你站起身，四处打量。");
         if(get_player().hasKeyItem("Camp - Chest") || get_player().hasKeyItem("Camp - Murky Chest") || get_player().hasKeyItem("Camp - Ornate Chest") || get_player().hasKeyItem("Equipment Rack - Weapons") || get_player().hasKeyItem("Equipment Rack - Armor") || get_player().hasKeyItem("Equipment Rack - Shields") || get_player().hasKeyItem("Equipment Storage - Jewelry Box"))
         {
            if(get_camp().hasChest())
            {
               outputText("[pg]你瞥了一眼那个箱子；你不记得自己房间里有过这东西。你打开箱子，往里面看去。");
               if(get_inventory().hasItemsInStorage())
               {
                  outputText("你脑海中灵光一闪；这一定是你前世留下的旧东西");
               }
               else
               {
                  outputText("里面是空的，你失望地叹了口气。");
               }
            }
            if(get_player().hasKeyItem("Equipment Rack - Weapons"))
            {
               outputText("[pg]这里有一个武器架。你看着它。");
               if(get_inventory().weaponRackDescription())
               {
                  outputText("你脑海中灵光一闪；这一定是你前世留下的旧武器！");
               }
               else
               {
                  outputText("它是空的，你叹了口气，但你知道你可以把它带到玛瑞斯。");
               }
            }
            if(get_player().hasKeyItem("Equipment Rack - Armor"))
            {
               outputText("[pg]那里有一个护甲架。你打量着它。");
               if(get_inventory().armorRackDescription())
               {
                  outputText("你脑海中灵光一闪；它们一定是你前世拥有的旧护甲！");
               }
               else
               {
                  outputText("它是空的，你叹了口气，但你知道你可以把它带到玛瑞斯。");
               }
            }
            if(get_player().hasKeyItem("Equipment Rack - Shields"))
            {
               outputText("[pg]那里有一个盾牌架。你打量着它。");
               if(get_inventory().shieldRackDescription())
               {
                  outputText("你的脑海中灵光一闪；它们一定是你前世留下的旧盾牌！");
               }
               else
               {
                  outputText("它是空的，你叹了口气，但你知道你可以把它带到玛瑞斯。");
               }
            }
            if(get_player().hasKeyItem("Equipment Storage - Jewelry Box"))
            {
               outputText("[pg]梳妆台上有一个首饰盒。你走到盒子前，打开它，向里面看去。");
               if(get_inventory().jewelryBoxDescription())
               {
                  outputText("这就说得通了！里面的东西一定是你过去冒险时留下的。");
               }
               else
               {
                  outputText("它是空的，你叹了口气，但你知道你可以把它带到玛瑞斯。");
               }
            }
         }
         outputText("[pg]在房间里环顾了一会儿后，你看着镜子，开始回忆自己是谁……");
         get_player().breastRows.resize(0);
         get_player().cocks.resize(0);
         get_player().vaginas.resize(0);
         doNext(routeToGenderChoiceReincarnation);
      }
      
      public function permanentizePerk(param1:PerkType) : void
      {
         if(get_player().ascensionPerkPoints < permanentizeCost())
         {
            return;
         }
         if(get_player().perkv4(param1) > 0)
         {
            return;
         }
         var _temp_1:* = get_player();
         _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints - permanentizeCost();
         get_player().addPerkValue(param1,4,1);
         ascensionPermeryMenu();
      }
      
      public function permanentizeCost() : int
      {
         var _loc5_:* = null as PerkType;
         var _loc1_:CharCreation = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = get_permablePerks();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc1_.get_player().perkv4(_loc5_) > 0)
            {
               _loc2_.push(_loc5_);
            }
         }
         return int(_loc2_.length) + 1;
      }
      
      public function newGameGo() : void
      {
         var _g:CharCreation;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc8_:int = 0;
         var _loc10_:* = null as StatusEffect;
         var _loc12_:* = null as StatusEffect;
         var _loc13_:* = null as Perk;
         var _loc16_:* = null as KeyItem;
         var _loc1_:CharCreation = this;
         var _loc2_:Array = [];
         get_mainView().eventTestInput.x = -10207.5;
         get_mainView().eventTestInput.y = -1055.1;
         clearOutput();
         get_images().showImage("location-ingnam");
         outputText("你在英格纳姆这个小村庄长大，这是一个地处偏远荒野，但传统繁多的小村庄。自你记事以来，每年村庄都会选出一名勇者，送往被诅咒的恶魔领域。传说，如果英格纳姆多年未能选出勇者，村庄就会陷入混乱。孩子们会失踪，庄稼会枯萎，疾病会如野火般蔓延。今年，<b>你</b>被选为勇者。[pg]");
         outputText("你的名字是什么？");
         menu();
         _g = this;
         addButton(0,"确定",function():void
         {
            _g.chooseName();
         });
         genericNamePrompt();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().slotName = "VOID";
            get_player().autoSave = false;
         }
         get_game().inDungeon = false;
         get_game().dungeonLoc = 0;
         get_game().inRoomedDungeon = false;
         get_game().inRoomedDungeonResume = null;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_game().newPlayer();
         }
         get_player().charCreation = true;
         if(isNewCharacter())
         {
            get_player().set_str(15);
            get_player().set_tou(15);
            get_player().set_spe(15);
            get_player().set_inte(15);
            get_player().sens = 15;
            get_player().lib = 15;
         }
         get_player().cor = 0;
         get_player().hunger = 80;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_game().saves.notes = "没有笔记内容。";
         }
         get_player().set_lust(15);
         if(isNewCharacter())
         {
            get_player().XP = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,187);
            get_player().level = 1;
            get_player().set_gems(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,188));
         }
         get_player().set_HP(get_player().maxHP());
         get_player().hair.length = 5;
         get_player().skin.type = 0;
         get_player().underBody.restore();
         get_player().neck.restore();
         get_player().rearBody.restore();
         get_player().lowerBody.type = 0;
         get_player().lowerBody.legCount = 2;
         get_player().face.type = 0;
         get_player().eyes.count = 2;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().tail.type = 0;
         }
         get_player().tongue.type = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().set_femininity(50);
         }
         get_player().beard.length = 0;
         get_player().beard.style = 0;
         get_player().tone = 50;
         get_player().thickness = 50;
         get_player().skin.desc = "skin";
         get_player().skin.adj = "";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().balls = 0;
            get_player().ballSize = 0;
         }
         get_player().set_hoursSinceCum(0);
         get_player().cumMultiplier = 1;
         get_player().ass.analLooseness = 0;
         get_player().ass.analWetness = 0;
         get_player().ass.fullness = 0;
         get_player().fertility = 5;
         get_player().set_fatigue(0);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().horns.value = 0;
            get_player().set_tallness(60);
            get_player().tail.venom = 0;
            get_player().tail.recharge = 0;
         }
         else if(!(get_player().tail.type == 13 || get_player().tail.type == 5 || get_player().tail.type == 6 || get_player().tail.type == 20))
         {
            get_player().tail.venom = 0;
            get_player().tail.recharge = 0;
         }
         get_player().wings.type = 0;
         if(get_player().eyes.type == 5)
         {
            get_player().eyes.type = 3;
         }
         get_player().skin.tone = "light";
         get_player().arms.claws.tone = "";
         get_player().hair.color = "brown";
         get_player().hair.type = 0;
         get_player().beard.length = 0;
         get_player().beard.style = 0;
         get_player().nipplesPierced = 0;
         get_player().nipplesPShort = "";
         get_player().nipplesPLong = "";
         get_player().lipPierced = 0;
         get_player().lipPShort = "";
         get_player().lipPLong = "";
         get_player().tonguePierced = 0;
         get_player().tonguePShort = "";
         get_player().tonguePLong = "";
         get_player().eyebrowPierced = 0;
         get_player().eyebrowPShort = "";
         get_player().eyebrowPLong = "";
         get_player().earsPierced = 0;
         get_player().earsPShort = "";
         get_player().earsPLong = "";
         get_player().nosePierced = 0;
         get_player().nosePShort = "";
         get_player().nosePLong = "";
         if(isNewCharacter())
         {
            get_inventory().unlockSlots(3);
            get_inventory().emptySlots();
         }
         get_game().isabellaScene.isabellaOffspringData = [];
         get_game().set_inCombat(false);
         get_game().inDungeon = false;
         Log.trace(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) + "",{
            "fileName":"src/classes/CharCreation.hx",
            "lineNumber":345,
            "className":"classes.CharCreation",
            "methodName":"newGameGo"
         });
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            get_player().setArmor(get_armors().C_CLOTH);
            get_player().setUnarmed();
            get_inventory().clearStorage();
            get_inventory().clearGearStorage();
            get_inventory().initializeGearStorage();
         }
         else
         {
            _loc4_ = get_player().hasCock();
            _loc5_ = get_player().hasVagina();
            _loc6_ = -1;
            if(_loc5_)
            {
               _loc6_ = get_player().getClitLength();
            }
            while(int(get_player().cocks.length) > 0)
            {
               get_player().removeCock(0,1);
            }
            while(int(get_player().vaginas.length) > 0)
            {
               get_player().removeVagina(0,1);
            }
            if(_loc4_)
            {
               get_player().createCock(5.5,1,CockTypesEnum.HUMAN);
            }
            if(_loc5_)
            {
               get_player().createVagina(true);
               get_player().setClitLength(Math.min(_loc6_,1.5));
            }
            if(get_player().balls > 2)
            {
               get_player().balls = 2;
            }
            if(get_player().ballSize > 2)
            {
               get_player().ballSize = 2;
            }
            while(int(get_player().breastRows.length) > 1)
            {
               get_player().removeBreastRow(1,1);
            }
            if(get_player().nippleLength > 1)
            {
               get_player().nippleLength = 1;
            }
            while(get_player().biggestTitSize() > 14)
            {
               get_player().shrinkTits(true);
            }
            if(!(get_player().get_armor() is GooArmor))
            {
               get_player().setArmor(get_player().get_armor());
            }
            else
            {
               get_player().setArmor(get_armors().C_CLOTH);
            }
         }
         var _loc7_:Array = [];
         _loc8_ = 0;
         var _loc9_:Array = get_player().statusEffects;
         while(_loc8_ < int(_loc9_.length))
         {
            _loc10_ = _loc9_[_loc8_];
            _loc8_++;
            if(Boolean(StatusEffects.spells.contains(_loc10_.get_stype())))
            {
               _loc7_.push(_loc10_);
            }
         }
         _loc9_ = _loc7_;
         _loc10_ = get_player().statusEffectByType(StatusEffects.ParasiteNephila);
         get_player().removeStatuses(false);
         var _loc11_:Array = getPermanentPerks();
         if(get_oldAscension())
         {
            _loc8_ = 0;
            while(_loc8_ < int(_loc9_.length))
            {
               _loc12_ = _loc9_[_loc8_];
               _loc8_++;
               get_player().createStatusEffect(_loc12_.get_stype(),_loc12_.value1,_loc12_.value2,_loc12_.value3,_loc12_.value4,false);
            }
         }
         get_player().removePerks();
         _loc8_ = 0;
         while(_loc8_ < int(_loc11_.length))
         {
            _loc13_ = _loc11_[_loc8_];
            _loc8_++;
            get_player().createPerk(_loc13_.get_ptype(),_loc13_.value1,_loc13_.value2,_loc13_.value3,_loc13_.value4);
         }
         if(get_player().hasPerk(PerkLib.NephilaArchQueen) && get_player().hasVagina() && _loc10_ != null)
         {
            get_player().setClitLength(23);
            get_player().vaginas[0].vaginalLooseness = 5;
            get_player().addStatusEffect(_loc10_);
         }
         var _loc14_:Array = [];
         _loc8_ = 0;
         var _loc15_:Array = get_player().keyItems;
         while(_loc8_ < int(_loc15_.length))
         {
            _loc16_ = _loc15_[_loc8_];
            _loc8_++;
            if(_loc1_.isSpecialKeyItem(_loc16_.keyName))
            {
               _loc14_.push(_loc16_);
            }
         }
         _loc15_ = _loc14_;
         get_player().removeKeyItems();
         _loc8_ = 0;
         while(_loc8_ < int(_loc15_.length))
         {
            _loc16_ = _loc15_[_loc8_];
            _loc8_++;
            get_player().createKeyItem(_loc16_.keyName,_loc16_.value1,_loc16_.value2,_loc16_.value3,_loc16_.value4);
         }
         if(!get_oldAscension())
         {
            get_player().removeMasteries(false);
            get_inventory().clearStorage();
            get_inventory().clearGearStorage();
            get_inventory().initializeGearStorage();
            if(get_player().hasKeyItem("Camp - Chest"))
            {
               get_inventory().createStorage(6);
            }
            if(get_player().hasKeyItem("Camp - Murky Chest"))
            {
               get_inventory().createStorage(4);
            }
            if(get_player().hasKeyItem("Camp - Ornate Chest"))
            {
               get_inventory().createStorage(4);
            }
            get_player().setArmor(get_armors().C_CLOTH);
            get_player().setUnarmed();
            get_player().setJewelry(JewelryLib.NOTHING);
            get_player().setShield(ShieldLib.NOTHING);
            get_player().perkPoints = 0;
            get_player().statPoints = 0;
         }
         if(get_oldAscension())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2644,0);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2644,1);
         }
         _loc8_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979);
         if(_loc8_ > 0)
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < int(FlagLists.KEEP_ON_ASCENSION.length))
            {
               _loc2_[_loc3_] = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,int(FlagLists.KEEP_ON_ASCENSION[_loc3_]));
               _loc3_++;
            }
         }
         SelfSaver.ascend(!get_oldAscension());
         KFLAGS.flags.h = new Dictionary();
         get_game().saves.loadPermObject();
         if(_loc8_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < int(FlagLists.KEEP_ON_ASCENSION.length))
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,int(FlagLists.KEEP_ON_ASCENSION[_loc3_]),_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         get_time().days = 0;
         get_time().hours = 0;
         get_time().minutes = 0;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2677,1);
      }
      
      public function newGameFromScratchYes() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2979,0);
         newGameGo();
         addButton(14,"返回",exitCreation);
      }
      
      public function newGameFromScratch() : void
      {
         get_game().mainMenu.hideMainMenu();
         hideStats();
         hideUpDown();
         clearOutput();
         if(!get_player().charCreation && get_player().loaded)
         {
            outputText("你确定要开始新游戏吗？所有未保存的数据都将丢失。");
            doYesNo(newGameFromScratchYes,get_game().mainMenu.mainMenu);
         }
         else
         {
            newGameFromScratchYes();
         }
      }
      
      public function menuSkinComplexion() : void
      {
         var complexion6:String;
         var _g6:CharCreation;
         var complexion5:String;
         var _g5:CharCreation;
         var complexion4:String;
         var _g4:CharCreation;
         var complexion3:String;
         var _g3:CharCreation;
         var complexion2:String;
         var _g2:CharCreation;
         var complexion1:String;
         var _g1:CharCreation;
         var complexion:String;
         var _g:CharCreation;
         clearOutput();
         outputText("你的肤色是什么？");
         menu();
         _g = this;
         complexion = "light";
         addButton(0,"浅色",function():void
         {
            _g.confirmComplexion(complexion);
         });
         _g1 = this;
         complexion1 = "fair";
         addButton(1,"白皙",function():void
         {
            _g1.confirmComplexion(complexion1);
         });
         _g2 = this;
         complexion2 = "olive";
         addButton(2,"橄榄色",function():void
         {
            _g2.confirmComplexion(complexion2);
         });
         _g3 = this;
         complexion3 = "dark";
         addButton(3,"深色",function():void
         {
            _g3.confirmComplexion(complexion3);
         });
         _g4 = this;
         complexion4 = "ebony";
         addButton(4,"乌木色",function():void
         {
            _g4.confirmComplexion(complexion4);
         });
         _g5 = this;
         complexion5 = "mahogany";
         addButton(5,"红褐色",function():void
         {
            _g5.confirmComplexion(complexion5);
         });
         _g6 = this;
         complexion6 = "russet";
         addButton(6,"黄褐色",function():void
         {
            _g6.confirmComplexion(complexion6);
         });
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function menuHairColor() : void
      {
         var color6:String;
         var _g6:CharCreation;
         var color5:String;
         var _g5:CharCreation;
         var color4:String;
         var _g4:CharCreation;
         var color3:String;
         var _g3:CharCreation;
         var color2:String;
         var _g2:CharCreation;
         var color1:String;
         var _g1:CharCreation;
         var color:String;
         var _g:CharCreation;
         clearOutput();
         outputText("你头发的颜色是什么？");
         menu();
         _g = this;
         color = "blonde";
         addButton(0,"金色",function():void
         {
            _g.chooseHairColor(color);
         });
         _g1 = this;
         color1 = "brown";
         addButton(1,"棕色",function():void
         {
            _g1.chooseHairColor(color1);
         });
         _g2 = this;
         color2 = "black";
         addButton(2,"黑色",function():void
         {
            _g2.chooseHairColor(color2);
         });
         _g3 = this;
         color3 = "red";
         addButton(3,"红色",function():void
         {
            _g3.chooseHairColor(color3);
         });
         _g4 = this;
         color4 = "gray";
         addButton(4,"灰色",function():void
         {
            _g4.chooseHairColor(color4);
         });
         _g5 = this;
         color5 = "white";
         addButton(5,"白色",function():void
         {
            _g5.chooseHairColor(color5);
         });
         _g6 = this;
         color6 = "auburn";
         addButton(6,"红褐色",function():void
         {
            _g6.chooseHairColor(color6);
         });
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function menuCockLength() : void
      {
         var length10:Number;
         var length9:Number;
         var length8:Number;
         var length7:Number;
         var length6:Number;
         var length5:Number;
         var length4:Number;
         var length3:Number;
         var length2:Number;
         var length1:Number;
         var length:Number;
         var _gthis:CharCreation = this;
         var chooseCockLength:Function = function(param1:Number):void
         {
            _gthis.get_player().cocks[0].cockLength = param1;
            var _loc2_:int = int(Math.floor(10 * (param1 / 5 - 0.1)));
            _gthis.get_player().cocks[0].cockThickness = _loc2_ / 10;
            _gthis.genericStyleCustomizeMenu();
         };
         clearOutput();
         var _loc1_:Boolean = get_game().get_displaySettings().metric;
         outputText("你可以选择[if (metric) {8到20厘米|3到8英寸}]之间任意尺寸的阴茎。你初始的阴茎长度也会影响其粗细程度。");
         outputText("[pg]之后可以在游戏中，通过特定道具更改阴茎的类型与尺寸。");
         menu();
         length = 3;
         addButton(0,_loc1_ ? "8" : "3\"",function():void
         {
            chooseCockLength(length);
         });
         length1 = 3.5;
         addButton(1,_loc1_ ? "9" : "3.5\"",function():void
         {
            chooseCockLength(length1);
         });
         length2 = 4;
         addButton(2,_loc1_ ? "10" : "4\"",function():void
         {
            chooseCockLength(length2);
         });
         length3 = 4.5;
         addButton(3,_loc1_ ? "11" : "4.5\"",function():void
         {
            chooseCockLength(length3);
         });
         length4 = 5;
         addButton(5,_loc1_ ? "13" : "5\"",function():void
         {
            chooseCockLength(length4);
         });
         length5 = 5.5;
         addButton(6,_loc1_ ? "14" : "5.5\"",function():void
         {
            chooseCockLength(length5);
         });
         length6 = 6;
         addButton(7,_loc1_ ? "15" : "6\"",function():void
         {
            chooseCockLength(length6);
         });
         length7 = 6.5;
         addButton(8,_loc1_ ? "17" : "6.5\"",function():void
         {
            chooseCockLength(length7);
         });
         length8 = 7;
         addButton(10,_loc1_ ? "18" : "7\"",function():void
         {
            chooseCockLength(length8);
         });
         length9 = 7.5;
         addButton(11,_loc1_ ? "19" : "7.5\"",function():void
         {
            chooseCockLength(length9);
         });
         length10 = 8;
         addButton(12,_loc1_ ? "20" : "8\"",function():void
         {
            chooseCockLength(length10);
         });
         addMeasurementSystemToggle(menuCockLength,4);
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function menuBreastSize() : void
      {
         var size5:int;
         var _g5:CharCreation;
         var size4:int;
         var _g4:CharCreation;
         var size3:int;
         var _g3:CharCreation;
         var size2:int;
         var _g2:CharCreation;
         var size1:int;
         var _g1:CharCreation;
         var size:int;
         var _g:CharCreation;
         clearOutput();
         outputText("你可以选择一个胸部尺寸。在之后的游戏中，胸部尺寸可能会发生变化。");
         menu();
         _g = this;
         size = 0;
         addButton(0,"平胸",function():void
         {
            _g.chooseBreastSize(size);
         });
         if(get_player().get_femininity() >= 35)
         {
            _g1 = this;
            size1 = 1;
            addButton(1,"A罩杯",function():void
            {
               _g1.chooseBreastSize(size1);
            });
         }
         if(get_player().get_femininity() >= 40)
         {
            _g2 = this;
            size2 = 2;
            addButton(2,"B罩杯",function():void
            {
               _g2.chooseBreastSize(size2);
            });
         }
         if(get_player().get_femininity() >= 50)
         {
            _g3 = this;
            size3 = 3;
            addButton(3,"C罩杯",function():void
            {
               _g3.chooseBreastSize(size3);
            });
         }
         if(get_player().get_femininity() >= 60)
         {
            _g4 = this;
            size4 = 4;
            addButton(4,"D罩杯",function():void
            {
               _g4.chooseBreastSize(size4);
            });
         }
         if(get_player().get_femininity() >= 70)
         {
            _g5 = this;
            size5 = 5;
            addButton(5,"DD罩杯",function():void
            {
               _g5.chooseBreastSize(size5);
            });
         }
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function menuBeardStyle() : void
      {
         var choiceStyle3:int;
         var choiceStyle2:int;
         var choiceStyle1:int;
         var choiceStyle:int;
         var _gthis:CharCreation = this;
         var chooseBeardStyle:Function = function(param1:int = 0):void
         {
            _gthis.get_player().beard.style = param1;
            _gthis.menuBeardSettings();
         };
         clearOutput();
         outputText("你更倾向于哪种胡须样式？");
         menu();
         choiceStyle = 0;
         addButton(0,"普通胡须",function():void
         {
            chooseBeardStyle(choiceStyle);
         });
         choiceStyle1 = 1;
         addButton(1,"山羊胡",function():void
         {
            chooseBeardStyle(choiceStyle1);
         });
         choiceStyle2 = 2;
         addButton(2,"干净剃净",function():void
         {
            chooseBeardStyle(choiceStyle2);
         });
         choiceStyle3 = 3;
         addButton(3,"粗犷络腮",function():void
         {
            chooseBeardStyle(choiceStyle3);
         });
         addButton(14,"返回",menuBeardSettings);
      }
      
      public function menuBeardSettings() : void
      {
         clearOutput();
         outputText("你可以选择胡须的长度和造型。[pg]");
         outputText("胡须：" + get_player().beardDescript());
         menu();
         addButton(0,"造型",menuBeardStyle);
         addButton(1,"长度",menuBeardLength);
         addButton(14,"返回",genericStyleCustomizeMenu);
      }
      
      public function menuBeardLength() : void
      {
         var choiceLength6:Number;
         var choiceLength5:Number;
         var choiceLength4:Number;
         var choiceLength3:Number;
         var choiceLength2:Number;
         var choiceLength1:Number;
         var choiceLength:Number;
         var _gthis:CharCreation = this;
         var chooseBeardLength:Function = function(param1:Number = 0):void
         {
            _gthis.get_player().beard.length = param1;
            _gthis.menuBeardSettings();
         };
         clearOutput();
         outputText("你希望留有多长的胡须？");
         outputText("[pg]注意：胡须会像现实中一样随时间缓慢生长，除非你选择不留胡须。之后在游戏里，你仍可以选择更改胡须造型。");
         menu();
         choiceLength = 0;
         addButton(0,"不留胡须",function():void
         {
            chooseBeardLength(choiceLength);
         });
         choiceLength1 = 0.1;
         addButton(1,"精心修剪",function():void
         {
            chooseBeardLength(choiceLength1);
         });
         choiceLength2 = 0.2;
         addButton(2,"短须",function():void
         {
            chooseBeardLength(choiceLength2);
         });
         choiceLength3 = 0.5;
         addButton(3,"中等长度",function():void
         {
            chooseBeardLength(choiceLength3);
         });
         choiceLength4 = 1.5;
         addButton(4,"稍长",function():void
         {
            chooseBeardLength(choiceLength4);
         });
         choiceLength5 = 3;
         addButton(5,"长须",function():void
         {
            chooseBeardLength(choiceLength5);
         });
         choiceLength6 = 6;
         addButton(6,"非常长",function():void
         {
            chooseBeardLength(choiceLength6);
         });
         addButton(14,"返回",function():void
         {
            chooseBeardLength();
         });
      }
      
      public function lengthConfirmed(param1:Number) : void
      {
         get_player().hair.length = param1;
         genericStyleCustomizeMenu();
      }
      
      public function isSpecialKeyItem(param1:String = undefined) : Boolean
      {
         if(!(param1 == "Camp - Chest" || param1 == "Camp - Murky Chest" || param1 == "Camp - Ornate Chest" || param1 == "Equipment Rack - Weapons" || param1 == "Equipment Rack - Armor" || param1 == "Equipment Rack - Shields" || param1 == "Equipment Storage - Jewelry Box" || param1 == "Backpack"))
         {
            return param1 == "Nieve\'s Tear";
         }
         return true;
      }
      
      public function isPermable(param1:PerkType) : Boolean
      {
         return Boolean(get_permablePerks().contains(param1));
      }
      
      public function isNewCharacter() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) != 0)
         {
            return !get_oldAscension();
         }
         return true;
      }
      
      public function isAscensionPerk(param1:Perk, param2:Boolean = false) : Boolean
      {
         if(!param1.get_ptype().keepOnAscension(param2))
         {
            if(param1.value4 > 0)
            {
               return isPermable(param1.get_ptype());
            }
            return false;
         }
         return true;
      }
      
      public function isAWoman() : void
      {
         var age:int;
         var _g5:CharCreation;
         var build3:Build;
         var _g4:Function;
         var build2:Build;
         var _g3:Function;
         var build1:Build;
         var _g2:Function;
         var build:Build;
         var _g1:Function;
         var buildGender:int;
         var _g:CharCreation;
         var _loc4_:* = null as String;
         gender = 2;
         var _loc1_:String = get_player().age == 1 ? "圆润" : "丰腴";
         var _loc2_:String = get_player().age == 3 ? "阳刚化" : "像个假小子";
         _g = this;
         buildGender = 2;
         var _loc3_:Function = function(param1:Build):void
         {
            _g.selectBuild(param1,buildGender);
         };
         clearOutput();
         switch(get_player().age)
         {
            case 0:
               _loc4_ = "你是一位女性。你的成长经历使你在速度和智力方面具有优势。";
               break;
            case 1:
               _loc4_ = "你是个女孩。你在速度和智力方面有轻微但明显的优势。";
               break;
            case 2:
               _loc4_ = "你是一位年轻女性。你的成长经历使你在速度和智力方面具有优势。";
               break;
            case 3:
               _loc4_ = "你是一位年长的女性。尽管你在速度和智力上有些优势，但你的大部分能力都取决于你迄今为止的生活方式。";
               break;
            default:
               _loc4_ = "";
         }
         outputText(_loc4_);
         outputText("[pg]你具有怎样的身材？");
         menu();
         _g1 = _loc3_;
         build = Build.Small;
         addButton(0,"苗条",function():void
         {
            _g1(build);
         });
         _g2 = _loc3_;
         build1 = Build.Medium;
         addButton(1,"常规",function():void
         {
            _g2(build1);
         });
         _g3 = _loc3_;
         build2 = Build.Large;
         addButton(2,_loc1_,function():void
         {
            _g3(build2);
         });
         _g4 = _loc3_;
         build3 = Build.Andro;
         addButton(3,_loc2_,function():void
         {
            _g4(build3);
         });
         _g5 = this;
         age = get_player().age;
         setExitButton("返回",function():void
         {
            _g5.genericGenderChoice(age);
         });
      }
      
      public function isAMan() : void
      {
         var age:int;
         var _g5:CharCreation;
         var build3:Build;
         var _g4:Function;
         var build2:Build;
         var _g3:Function;
         var build1:Build;
         var _g2:Function;
         var build:Build;
         var _g1:Function;
         var buildGender:int;
         var _g:CharCreation;
         var _loc4_:* = null as String;
         gender = 1;
         var _loc1_:String = get_player().age == 1 ? "圆润" : "肉感";
         var _loc2_:String = get_player().age == 3 ? "阴柔化" : "像个小姑娘";
         _g = this;
         buildGender = 1;
         var _loc3_:Function = function(param1:Build):void
         {
            _g.selectBuild(param1,buildGender);
         };
         clearOutput();
         switch(get_player().age)
         {
            case 0:
               _loc4_ = "你是一位男性。你的成长经历使你在力量和体质方面具有优势。";
               break;
            case 1:
               _loc4_ = "你是个男孩。你在力量和体质方面有轻微但明显的优势。";
               break;
            case 2:
               _loc4_ = "你是一位年轻男性。你的成长经历使你在力量和体质方面具有优势。";
               break;
            case 3:
               _loc4_ = "你是一位年长的男性。尽管你在力量和体质上有些优势，但你的大部分能力都取决于你迄今为止的生活方式。";
               break;
            default:
               _loc4_ = "";
         }
         outputText(_loc4_);
         outputText("[pg]你具有怎样的身材？");
         menu();
         _g1 = _loc3_;
         build = Build.Small;
         addButton(0,"精瘦",function():void
         {
            _g1(build);
         });
         _g2 = _loc3_;
         build1 = Build.Medium;
         addButton(1,"常规",function():void
         {
            _g2(build1);
         });
         _g3 = _loc3_;
         build2 = Build.Large;
         addButton(2,_loc1_,function():void
         {
            _g3(build2);
         });
         _g4 = _loc3_;
         build3 = Build.Andro;
         addButton(3,_loc2_,function():void
         {
            _g4(build3);
         });
         _g5 = this;
         age = get_player().age;
         setExitButton("返回",function():void
         {
            _g5.genericGenderChoice(age);
         });
      }
      
      public function isAHerm() : void
      {
         var age:int;
         var _g8:CharCreation;
         var buildGender7:int;
         var build7:Build;
         var _g7:CharCreation;
         var buildGender6:int;
         var build6:Build;
         var _g6:CharCreation;
         var buildGender5:int;
         var build5:Build;
         var _g5:CharCreation;
         var buildGender4:int;
         var build4:Build;
         var _g4:CharCreation;
         var buildGender3:int;
         var build3:Build;
         var _g3:CharCreation;
         var buildGender2:int;
         var build2:Build;
         var _g2:CharCreation;
         var buildGender1:int;
         var build1:Build;
         var _g1:CharCreation;
         var buildGender:int;
         var build:Build;
         var _g:CharCreation;
         var _loc1_:* = null as String;
         gender = 3;
         clearOutput();
         switch(get_player().age)
         {
            case 0:
               _loc1_ = "你是一个双性人。你的成长经历让你在各种属性上都表现平平。";
               break;
            case 1:
               _loc1_ = "你是一个小双性人。你的成长经历让你在各种属性上都表现平平。";
               break;
            case 2:
               _loc1_ = "你是一个少年双性人。你的成长经历让你在各种属性上都表现平平。";
               break;
            case 3:
               _loc1_ = "你是一个年长的双性人。尽管你各种属性上都表现平平，但你的大部分能力都取决于你迄今为止的生活方式。";
               break;
            default:
               _loc1_ = "";
         }
         outputText(_loc1_);
         outputText("[pg]你具有怎样的身材？");
         var _loc2_:String = "女性身材。[pg]这会让你成为一个扶她。";
         var _loc3_:String = "男性身材。[pg]这会让你成为一个扶他。";
         var _loc4_:String = get_player().age == 1 ? "圆润" : "丰腴";
         menu();
         _g = this;
         build = Build.Small;
         buildGender = 2;
         addButton(0,"女性化.苗条",function():void
         {
            _g.selectBuild(build,buildGender);
         }).hint(_loc2_,"Feminine, Slender");
         _g1 = this;
         build1 = Build.Medium;
         buildGender1 = 2;
         addButton(1,"女性化.常规",function():void
         {
            _g1.selectBuild(build1,buildGender1);
         }).hint(_loc2_,"Feminine, Average");
         _g2 = this;
         build2 = Build.Large;
         buildGender2 = 2;
         addButton(2,"女性化.丰满",function():void
         {
            _g2.selectBuild(build2,buildGender2);
         }).hint(_loc2_,"Feminine, " + _loc4_);
         _g3 = this;
         build3 = Build.Andro;
         buildGender3 = 2;
         addButton(3,"女性化.中性",function():void
         {
            _g3.selectBuild(build3,buildGender3);
         }).hint("Androgynous build.[pg]略带女性气质，但身材匀称苗条。","Feminine, Tomboyish");
         _g4 = this;
         build4 = Build.Small;
         buildGender4 = 1;
         addButton(5,"男性化.精瘦",function():void
         {
            _g4.selectBuild(build4,buildGender4);
         }).hint(_loc3_,"Masculine, Lean");
         _g5 = this;
         build5 = Build.Medium;
         buildGender5 = 1;
         addButton(6,"男性化.常规",function():void
         {
            _g5.selectBuild(build5,buildGender5);
         }).hint(_loc3_,"Masculine, Average");
         _g6 = this;
         build6 = Build.Large;
         buildGender6 = 1;
         addButton(7,"男性化.厚实",function():void
         {
            _g6.selectBuild(build6,buildGender6);
         }).hint(_loc3_,"Masculine, Thick");
         _g7 = this;
         build7 = Build.Andro;
         buildGender7 = 1;
         addButton(8,"男性化.纤细",function():void
         {
            _g7.selectBuild(build7,buildGender7);
         }).hint("Androgynous build.[pg]略带男性气质，但柔和纤细。","Masculine, Girly");
         _g8 = this;
         age = get_player().age;
         setExitButton("返回",function():void
         {
            _g8.genericGenderChoice(age);
         });
      }
      
      public function heightConfirmed(param1:Number) : void
      {
         get_player().set_tallness(param1);
         genericStyleCustomizeMenu();
      }
      
      public function get_reincarnating() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) != 0;
      }
      
      public function get_permablePerks() : Array
      {
         return PerkLists.PERMABLE;
      }
      
      public function getPermanentPerks() : Array
      {
         var _g:CharCreation;
         var _loc5_:* = null as Perk;
         _g = this;
         var _loc1_:Function = function(param1:Perk):Boolean
         {
            return _g.isAscensionPerk(param1);
         };
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = get_player().get_perks();
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(Boolean(_loc1_(_loc5_)))
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      public function genericStyleCustomizeMenu() : void
      {
         var choice:String;
         var _g:CharCreation;
         var _loc1_:* = null as String;
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         clearOutput();
         get_images().showImage("event-creation");
         outputText("在进行特质选择之前，你可以完成外貌定制的最终调整。在之后的游戏中，你也能通过使用某些物品来改变自己的外貌。[pg]");
         outputText("身高：" + Measurements.briefHeight(get_player().get_tallness()) + "\n");
         _loc2_ = get_player().skin.tone;
         if(_loc2_ == "dark")
         {
            _loc1_ = "深色";
         }
         else if(_loc2_ == "ebony")
         {
            _loc1_ = "乌木色";
         }
         else if(_loc2_ == "fair")
         {
            _loc1_ = "白皙";
         }
         else if(_loc2_ == "light")
         {
            _loc1_ = "浅色";
         }
         else if(_loc2_ == "mahogany")
         {
            _loc1_ = "红褐色";
         }
         else if(_loc2_ == "olive")
         {
            _loc1_ = "橄榄色";
         }
         else if(_loc2_ == "russet")
         {
            _loc1_ = "黄褐色";
         }
         else
         {
            _loc1_ = get_player().skin.tone;
         }
         outputText("肤色：" + _loc1_ + "\n");
         _loc3_ = get_player().hair.color;
         if(_loc3_ == "auburn")
         {
            _loc2_ = "赤褐色";
         }
         else if(_loc3_ == "black")
         {
            _loc2_ = "黑色";
         }
         else if(_loc3_ == "blonde")
         {
            _loc2_ = "金色";
         }
         else if(_loc3_ == "brown")
         {
            _loc2_ = "棕色";
         }
         else if(_loc3_ == "gray")
         {
            _loc2_ = "灰色";
         }
         else if(_loc3_ == "red")
         {
            _loc2_ = "红色";
         }
         else if(_loc3_ == "white")
         {
            _loc2_ = "白色";
         }
         else
         {
            _loc2_ = get_player().hair.color;
         }
         outputText("发色：" + _loc2_ + "\n");
         if(get_player().hasCock())
         {
            _loc3_ = Measurements.inchesOrCentimetres(get_player().cocks[0].cockLength);
            _loc4_ = Measurements.inchesOrCentimetres(get_player().cocks[0].cockThickness);
            outputText("阴茎尺寸：长" + _loc3_ + "，直径" + _loc4_ + "\n");
         }
         outputText("胸部尺寸：[breastcup]\n");
         menu();
         addButton(0,"肤色",menuSkinComplexion);
         addButton(1,"发色",menuHairColor);
         addButton(2,"胡须",menuBeardSettings).disableIf(get_player().mf("m","f") == "f","你太女性化了，不适合留胡子。").disableIf(get_player().isChild(),"你年纪太小，还不能留胡子。");
         addButton(3,"设置身高",setHeight);
         addMeasurementSystemToggle(genericStyleCustomizeMenu,4);
         addButton(5,"阴茎尺寸",menuCockLength).disableIf(!get_player().hasCock(),"你未拥有阴茎。");
         addButton(6,"胸部尺寸",menuBreastSize);
         addButton(7,"头发长度",setHairLength);
         addButton(9,"确定",chooseEndowment);
         _g = this;
         choice = get_player().skin.tone;
         setExitButton("返回",function():void
         {
            _g.setComplexion(choice);
         });
      }
      
      public function genericGenderChoice(param1:int) : void
      {
         var prompt:Boolean;
         var _g:CharCreation;
         get_player().set_age(param1);
         get_player().startingAge = param1;
         clearOutput();
         outputText("你是一个[if (ischild) {男孩还是女孩|男人还是女人}]？");
         menu();
         addButton(0,get_player().isChild() ? "男孩" : "男人",isAMan);
         addButton(1,get_player().isChild() ? "女孩" : "女人",isAWoman);
         if(get_hermUnlocked())
         {
            outputText("[pg]或者一个雌雄同体者，因为你已经解锁了这一选项！");
            addButton(2,"双性",isAHerm);
         }
         if(!get_reincarnating())
         {
            _g = this;
            prompt = true;
            setExitButton("返回",function():void
            {
               _g.ageChoice(prompt);
            });
         }
      }
      
      public function exitCreation() : void
      {
         get_player().charCreation = false;
         get_game().mainMenu.mainMenu();
      }
      
      public function debugSetAge(param1:int, param2:Boolean = false) : void
      {
         get_player().set_age(param1);
         get_player().startingAge = param1;
         outputText("完成。");
         get_player().set_HP(get_player().maxHP());
         doNext(param2 ? ascensionMenu : playerMenu);
      }
      
      public function debugAgeChange(param1:Boolean = false) : void
      {
         var inAscension4:Boolean;
         var newAge3:int;
         var _g3:CharCreation;
         var inAscension3:Boolean;
         var newAge2:int;
         var _g2:CharCreation;
         var inAscension2:Boolean;
         var newAge1:int;
         var _g1:CharCreation;
         var inAscension1:Boolean;
         var newAge:int;
         var _g:CharCreation;
         if(param1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2704) == 0)
         {
            var _temp_1:* = get_player();
            _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints - 10;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2704,1);
         }
         clearOutput();
         outputText("选择你的年龄。");
         outputText("[pg]你现在是一个[if (ischild) {儿童|[if (isteen) {少年|[if (iselder) {老人|成人}]}]}].[pg]");
         menu();
         _g = this;
         newAge = 1;
         inAscension1 = param1;
         addButton(0,"儿童",function():void
         {
            _g.debugSetAge(newAge,inAscension1);
         });
         _g1 = this;
         newAge1 = 2;
         inAscension2 = param1;
         addButton(1,"少年",function():void
         {
            _g1.debugSetAge(newAge1,inAscension2);
         });
         _g2 = this;
         newAge2 = 0;
         inAscension3 = param1;
         addButton(2,"成人",function():void
         {
            _g2.debugSetAge(newAge2,inAscension3);
         });
         _g3 = this;
         newAge3 = 3;
         inAscension4 = param1;
         addButton(3,"老人",function():void
         {
            _g3.debugSetAge(newAge3,inAscension4);
         });
         addButton(14,"返回",param1 ? ascensionMenu : playerMenu);
      }
      
      public function confirmHistory(param1:PerkType) : void
      {
         var choice1:PerkType;
         var _g:CharCreation;
         clearOutput();
         var _loc2_:PerkType = param1;
         if(_loc2_ == PerkLib.HistoryAlchemist)
         {
            if(get_player().isElder())
            {
               outputText("你曾作为炼金术士工作多年，精通各种药剂，并懂得如何充分激发材料的潜能。这是你所经历的吗？");
            }
            else
            {
               outputText("你当过一阵炼金术士的助手，炼金物品在你手中似乎总是效果更强。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryDEUSVULT)
         {
            outputText("你从出生起便受训为神圣意志而战，誓要铲除世间一切腐化！");
            outputText("[pg]你对欲望的抵抗力更强（欲望抗力+15%），可以通过杀死低阶恶魔来满足自己的欲望，每杀死一个恶魔你的伤害便会提升（每杀一个+1%，最多50%）。但你无法自慰，一旦偏离正道，神赐之力便会消失殆尽！这是你所经历的吗？");
         }
         else if(_loc2_ == PerkLib.HistoryFighter)
         {
            if(get_player().isElder())
            {
               outputText("你年轻时大多在打斗中度过，后来以此为生当了守卫。你精通战斗，尽管年岁见长，身体依然保持得不错。这是你所经历的吗？");
            }
            else
            {
               outputText("你小时候经常和其他孩子打架，曾打算长大后找份守卫的差事。你的物理攻击伤害增加10%。初始携带50颗宝石。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryFortune)
         {
            if(get_player().isElder())
            {
               outputText("你天生擅长碰运气的游戏。你充分利用这一点，一生都在赌博下注，最终攒下了可观的财富。这是你所经历的吗？");
            }
            else
            {
               outputText("你总觉得自己财运不错。因此，你总能攒下宝石以备不时之需，并懂得如何让收益最大化（战斗胜利获得宝石+15%）。初始携带250颗宝石。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryHealer)
         {
            if(get_player().isElder())
            {
               outputText("你是村里的医师，毕生致力于照顾病患伤员。凭借医术，你虽年迈却格外健康，使用治疗物品和技能的效果也更好。这是你所经历的吗？");
            }
            else
            {
               outputText("你闲暇时，经常跟着村里的医师学习处理伤口。治疗物品和效果增强20%。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryReligious)
         {
            if(get_player().isElder())
            {
               outputText("你曾是虔诚的僧侣，大半辈子都在寺庙中度过。冥想对你而言轻而易举，抵抗诱惑与腐化对你来说也不在话下。这是你所经历的吗？");
            }
            else
            {
               outputText("你常去村里的寺庙，学会了如何冥想。当腐化不高于66时，原本的“自慰”选项会被替换为“冥想”。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryScholar)
         {
            if(get_player().isElder())
            {
               outputText("你一生致力于尽可能多地学习知识，并与他人分享。你能轻松理解魔法的奥秘，并从经历中快速吸取经验。这是你所经历的吗？");
            }
            else
            {
               outputText("你大部分时间都花在学业上，甚至央求镇上最有钱的" + (get_silly() ? "萨文" : "塞莱特") + "先生让你读他的藏书。你比常人更专注，施法增加的疲劳值减少20%。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistorySlacker)
         {
            outputText("你花了很多时间偷懒、逃避工作，总之就是四处讨人嫌。你在偷懒方面的努力让你极其擅长休息，疲劳值恢复速度加快20%。这是你所经历的吗？");
         }
         else if(_loc2_ == PerkLib.HistorySlut)
         {
            if(get_player().isElder())
            {
               outputText("你大部分时间都在做爱，总能找到不同的情人供养你，往往同时有好几个。尽管上了年纪，你仍风姿不减，身体也依旧柔韧有力。这是你所经历的吗？");
            }
            else
            {
               outputText("你成功地把大部分时间都用在了做爱上面。简而言之，在性事上你就是村里的“公交车”——人人都上过。因此，你的身体对插入造成的松弛更有抵抗力，而且能容纳的插入物上限也更高。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistorySmith)
         {
            if(get_player().isElder())
            {
               outputText("你曾是锻造大师，能打造各种武器盔甲。你的经验让你懂得如何改进和保养装备，使其发挥最大效能。这是你所经历的吗？");
            }
            else
            {
               outputText("你成功当上了本地铁匠的学徒。因为跟在铁匠身边学习，你学会了如何让护甲提供最大程度的防护。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryThief)
         {
            if(get_player().isElder())
            {
               outputText("你曾是手法最高超的盗贼，时至今日也从未失手。在寻找值钱目标和毫发无伤地脱离险境方面，无人能与你匹敌。这是你所经历的吗？");
            }
            else
            {
               outputText("你大部分时间都在街头混迹，扒窃钱包、入室行窃。你已相当擅长找出值钱的目标并安然脱身。这是你所经历的吗？");
            }
         }
         else if(_loc2_ == PerkLib.HistoryWhore)
         {
            if(get_player().isElder())
            {
               outputText("你年纪轻轻就开始卖身，后来更是经营起了村里的妓院。你精于诱惑之道，并且从这门生意中赚了不少钱。这是你所经历的吗？");
            }
            else
            {
               outputText("你成功找到了卖春的营生。因为长期靠出卖色相赚钱，你更擅长挑逗（挑逗伤害+15%）。这是你所经历的吗？");
            }
         }
         else
         {
            outputText("错误：无效的经历选择，程序出错了。");
         }
         menu();
         _g = this;
         choice1 = param1;
         addButton(0,"确定",function():void
         {
            _g.setHistory(choice1);
         });
         addButton(1,"取消",chooseHistory);
      }
      
      public function confirmHeight() : void
      {
         var finalHeight1:Number;
         var _g:CharCreation;
         clearOutput();
         var _loc1_:Boolean = get_game().get_displaySettings().metric;
         var _loc2_:String = getInput();
         var _loc3_:Object = Std.parseInt(_loc2_);
         var _loc4_:int = _loc1_ ? 107 : 42;
         var _loc5_:int = _loc1_ ? 244 : 96;
         if(_loc2_ == "" || _loc3_ == null)
         {
            outputText("请输入具体的身高。");
            doNext(setHeight);
            return;
         }
         if(_loc3_ < _loc4_)
         {
            outputText("这低于你能选择的最低身高！");
            doNext(setHeight);
            return;
         }
         if(_loc3_ > _loc5_)
         {
            outputText("这高于你能选择的最高身高！");
            doNext(setHeight);
            return;
         }
         var _loc6_:Number = _loc1_ ? _loc3_ / 2.54 : Number(_loc3_);
         outputText("你的身高将被设置为" + Measurements.numInchesOrCentimetres(_loc6_) + "。是否确定？");
         _g = this;
         finalHeight1 = _loc6_;
         doYesNo(function():void
         {
            _g.heightConfirmed(finalHeight1);
         },setHeight);
      }
      
      public function confirmHairLength() : void
      {
         var finalLength1:Number;
         var _g:CharCreation;
         clearOutput();
         var _loc1_:Boolean = get_game().get_displaySettings().metric;
         var _loc2_:String = getInput();
         var _loc3_:Object = Std.parseInt(_loc2_);
         var _loc4_:Number = get_player().hair.length;
         if(_loc2_ == "" || _loc3_ == null)
         {
            outputText("请输入具体的身高。");
            doNext(setHairLength);
            return;
         }
         if(_loc3_ < 0)
         {
            outputText("这低于你能选择的最低身高！");
            doNext(setHairLength);
            return;
         }
         if(_loc3_ > (_loc1_ ? 244 : 96))
         {
            outputText("这高于你能选择的最高身高！");
            doNext(setHairLength);
            return;
         }
         var _loc5_:Number = _loc1_ ? _loc3_ / 2.54 : Number(_loc3_);
         get_player().hair.length = _loc5_;
         if(_loc5_ != 0)
         {
            outputText("[pg]你将拥有" + Measurements.inchesOrCentimetres(get_player().hair.length) + "长，" + Appearance.hairDescription(get_player()) + "。是否确定？");
         }
         else
         {
            outputText("[pg]你将拥有" + Appearance.hairDescription(get_player()) + "。是否确定？");
         }
         get_player().hair.length = _loc4_;
         _g = this;
         finalLength1 = _loc5_;
         doYesNo(function():void
         {
            _g.lengthConfirmed(finalLength1);
         },setHairLength);
      }
      
      public function confirmEndowment(param1:PerkType) : void
      {
         var choice1:PerkType;
         var _g:CharCreation;
         clearOutput();
         var _loc2_:PerkType = param1;
         if(_loc2_ == PerkLib.BigClit)
         {
            outputText("你的阴蒂很大吗？(+1英寸或+2.5厘米)");
            outputText("[pg]足够大的阴蒂甚至可以长得像阴茎一样。它也会让你在口交或指交时欲望上升更快。");
         }
         else if(_loc2_ == PerkLib.BigCock)
         {
            outputText("你有一根大肉棒吗？(+2英寸或+5厘米 阴茎长度)");
            outputText("[pg]更大的肉棒更容易让床伴满足，但前提是对方能承受得住你的尺寸。");
         }
         else if(_loc2_ == PerkLib.BigTits)
         {
            outputText("你的胸部比一般人大吗？（罩杯上升[if (ischild) {1级|2级}]）");
            outputText("[pg]更大的胸部能让你分泌更多的乳汁，用乳交取悦更大的肉棒，通常来说就是显得更加性感撩人。");
         }
         else if(_loc2_ == PerkLib.Fast)
         {
            outputText("你行动非常敏捷吗？（+[if (ischild) {3|5}] 速度）");
            outputText("[pg]速度能让你更容易脱离战斗与摆脱擒抱，同时提升闪避敌人攻击的几率，以及提升追上试图逃跑的敌人的成功率。");
         }
         else if(_loc2_ == PerkLib.Fertile)
         {
            outputText("你的家族生育能力特别强吗？（+15% 生育力）");
            outputText("[pg]较高的生育力会让你更容易怀孕。怀孕可能带来：奇怪的孩子、变大的胸部、变宽的臀部、变肥的屁股以及其他怪异事件。");
         }
         else if(_loc2_ == PerkLib.Frigid)
         {
            outputText("你对触碰是不是没什么感觉？（-5 敏感度）");
            outputText("[pg]敏感度会影响爱抚效率，以及影响某些魔法让你兴奋起来的难易程度。极低的敏感度将导致难以达到高潮。");
         }
         else if(_loc2_ == PerkLib.Lusty)
         {
            outputText("你的性欲是否异常高涨？（+[if (ischild) {3|5}] 性欲）");
            outputText("[pg]性欲会影响你随时间自然积累的欲望速度。过高的性欲可能会带来许多不必要的麻烦……");
         }
         else if(_loc2_ == PerkLib.MessyOrgasms)
         {
            outputText("你的高潮是不是特别量大，容易弄得到处一团糟？（+50% 爱液倍率）");
            outputText("[pg]更高的爱液倍率会让你的每次高潮都弄得一塌糊涂。");
         }
         else if(_loc2_ == PerkLib.Pervert)
         {
            outputText("你是不是异常变态？（+[if (ischild) {3|5}] 腐化）");
            outputText("[pg]腐化会影响某些特定剧情，较高的腐化会让你更容易迎来糟糕的结局。");
         }
         else if(_loc2_ == PerkLib.Sensitive)
         {
            outputText("你的肌肤是否异常敏感？（+[if (ischild) {3|5}] 敏感度）");
            outputText("[pg]敏感度会影响爱抚效率，以及影响某些魔法让你兴奋起来的难易程度。极低的敏感度将导致难以达到高潮。");
         }
         else if(_loc2_ == PerkLib.Smart)
         {
            outputText("你学东西很快吗？（+[if (ischild) {3|5}] 智力）");
            outputText("[pg]智力有助于你避开危险的怪物，让你操作机械装置时更加轻松，同时也能增强你在旅途中习得的任何法术的威力。");
         }
         else if(_loc2_ == PerkLib.Strong)
         {
            outputText("你比常人更强壮吗？（+[if (ischild) {3|5}] 力量）");
            outputText("[pg]力量可提升你的战斗伤害，以及擒抓敌人和挣脱敌人的能力。");
         }
         else if(_loc2_ == PerkLib.Tough)
         {
            outputText("你体质超乎常人吗？（+[if (ischild) {3|5}] 体质）");
            outputText("[pg]坚韧能提升你的生命值上限，并增加敌人攻击无法对你造成创伤的几率。");
         }
         else if(_loc2_ == PerkLib.WetPussy)
         {
            outputText("你的小穴是不是特别容易湿？（+1 阴道湿润度）");
            outputText("[pg]阴道湿润度会让你更容易容纳尺寸较大的阴茎，从而帮助你更快让天赋异禀的伴侣达到高潮。");
         }
         menu();
         _g = this;
         choice1 = param1;
         addButton(0,"确定",function():void
         {
            _g.setEndowment(choice1);
         });
         addButton(1,"取消",chooseEndowment);
      }
      
      public function confirmComplexion(param1:String) : void
      {
         get_player().skin.tone = param1;
         genericStyleCustomizeMenu();
      }
      
      public function completeCharacterCreation() : void
      {
         clearOutput();
         get_player().set_HP(get_player().maxHP());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) == 0)
         {
            chooseGameModes();
         }
         else
         {
            startTheGame();
         }
      }
      
      public function chooseName(param1:Boolean = false) : void
      {
         var retry:Boolean;
         var _g:CharCreation;
         var _loc2_:String = getInput();
         if(_loc2_ == "")
         {
            if(!param1)
            {
               outputText("[pg+]<b>你必须设置一个名字。</b>");
               _g = this;
               retry = true;
               addButton(0,"确定",function():void
               {
                  _g.chooseName(retry);
               });
            }
            return;
         }
         clearOutput();
         get_player().set_short(_loc2_);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            clearOutput();
            outputText("你现在将被称作[name]。");
            ascensionMenu();
            return;
         }
         menu();
         ageChoice();
      }
      
      public function chooseHistory() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,418) == 2)
         {
            outputText("<b>创建角色时新增了历史背景特质。由于此角色创建时该功能尚未开放，现在你可以选择一个特质！</b>[pg]");
         }
         if(get_player().isElder())
         {
            outputText("在你成为勇者之前，你已度过了漫长的时光。你以前是什么职业？");
            _loc1_ = ["炼金术士","守卫","赌徒","医师","僧侣","教师","懒汉","盗贼","浪子","铁匠","老鸨","圣骑士"];
         }
         else
         {
            outputText("在你成为勇者之前，你对自己的人生另有规划。你以前是做什么的？");
            _loc1_ = ["炼金","斗殴","敛财","治疗","宗教","求学","偷懒","偷窃","滥交","锻造","卖春","圣骑士"];
         }
         var _loc3_:Array = [PerkLib.HistoryAlchemist,PerkLib.HistoryFighter,PerkLib.HistoryFortune,PerkLib.HistoryHealer,PerkLib.HistoryReligious,PerkLib.HistoryScholar,PerkLib.HistorySlacker,PerkLib.HistoryThief,PerkLib.HistorySlut,PerkLib.HistorySmith,PerkLib.HistoryWhore,PerkLib.HistoryDEUSVULT];
         menu();
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc1_.length))
         {
            if(!get_player().hasPerk(_loc3_[_loc4_]))
            {
               addNextButton(_loc1_[_loc4_],(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var choice:Array = param2;
                  return function():void
                  {
                     _g[0].confirmHistory(choice[0]);
                  };
               })([this],[_loc3_[_loc4_]]));
            }
            else
            {
               addNextButtonDisabled(_loc1_[_loc4_],"你已经拥有这项历史特质了。");
               _loc2_++;
            }
            _loc4_++;
         }
         if(_loc2_ >= 1)
         {
            addButton(14,"跳过",get_player().charCreation ? virginPrompt : playerMenu);
         }
      }
      
      public function chooseHairColor(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         get_player().hair.color = param1;
         genericStyleCustomizeMenu();
      }
      
      public function chooseGameModes() : void
      {
         get_game().gameSettings.enterSettings(3);
      }
      
      public function chooseEndowment() : void
      {
         clearOutput();
         outputText("每个人都有与生俱来的特质，你的特质是什么？");
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = ["强壮","坚韧","敏捷","聪慧","性欲旺盛","敏感体质","性冷淡"];
         var _loc3_:Array = [PerkLib.Strong,PerkLib.Tough,PerkLib.Fast,PerkLib.Smart,PerkLib.Lusty,PerkLib.Sensitive,PerkLib.Frigid];
         if(get_player().hasCock())
         {
            _loc2_ = _loc2_.concat(["巨根","精量充沛"]);
            _loc3_ = _loc3_.concat([PerkLib.BigCock,PerkLib.MessyOrgasms]);
         }
         if(get_player().hasVagina())
         {
            _loc2_ = _loc2_.concat(["巨乳","肥大阴蒂","善于生育","淫穴"]);
            _loc3_ = _loc3_.concat([PerkLib.BigTits,PerkLib.BigClit,PerkLib.Fertile,PerkLib.WetPussy]);
         }
         var _loc4_:int = 0;
         while(_loc4_ < int(_loc2_.length))
         {
            if(!get_player().hasPerk(_loc3_[_loc4_]))
            {
               addNextButton(_loc2_[_loc4_],(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var choice:Array = param2;
                  return function():void
                  {
                     _g[0].confirmEndowment(choice[0]);
                  };
               })([this],[_loc3_[_loc4_]]));
            }
            else
            {
               addNextButtonDisabled(_loc2_[_loc4_],"你已经拥有这项初始特质了。");
               _loc1_++;
            }
            _loc4_++;
         }
         if(_loc1_ >= 4)
         {
            addButton(14,"跳过",chooseHistory);
         }
      }
      
      public function chooseComplexion() : void
      {
         var choice6:String;
         var _g6:CharCreation;
         var choice5:String;
         var _g5:CharCreation;
         var choice4:String;
         var _g4:CharCreation;
         var choice3:String;
         var _g3:CharCreation;
         var choice2:String;
         var _g2:CharCreation;
         var choice1:String;
         var _g1:CharCreation;
         var choice:String;
         var _g:CharCreation;
         clearOutput();
         outputText("你的肤色是什么？");
         menu();
         _g = this;
         choice = "light";
         addButton(0,"浅色",function():void
         {
            _g.setComplexion(choice);
         });
         _g1 = this;
         choice1 = "fair";
         addButton(1,"白皙",function():void
         {
            _g1.setComplexion(choice1);
         });
         _g2 = this;
         choice2 = "olive";
         addButton(2,"橄榄色",function():void
         {
            _g2.setComplexion(choice2);
         });
         _g3 = this;
         choice3 = "dark";
         addButton(3,"深色",function():void
         {
            _g3.setComplexion(choice3);
         });
         _g4 = this;
         choice4 = "ebony";
         addButton(4,"乌木色",function():void
         {
            _g4.setComplexion(choice4);
         });
         _g5 = this;
         choice5 = "mahogany";
         addButton(5,"红褐色",function():void
         {
            _g5.setComplexion(choice5);
         });
         _g6 = this;
         choice6 = "russet";
         addButton(6,"黄褐色",function():void
         {
            _g6.setComplexion(choice6);
         });
         setExitButton("返回",sexualOrientation);
      }
      
      public function chooseBreastSize(param1:int) : void
      {
         get_player().breastRows[0].breastRating = param1;
         genericStyleCustomizeMenu();
      }
      
      public function ascensionPermeryMenu() : void
      {
         var _loc6_:* = null as Perk;
         var _loc1_:CharCreation = this;
         clearOutput();
         outputText("只需花费几点，你就可以让某些特质永久化，它们将在未来的飞升中保留。此外，如果这些特质来自形态变化，即使你不再满足条件，它们也会保留下来。");
         outputText("[pg]当前花费：" + permanentizeCost() + " 飞升点数");
         outputText("[pg]飞升特质点数：" + get_player().ascensionPerkPoints);
         menu();
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         var _loc5_:Array = get_player().get_perks();
         while(_loc4_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc4_];
            _loc4_++;
            if(_loc1_.isPermable(_loc6_.get_ptype()))
            {
               _loc3_.push(_loc6_);
            }
         }
         _loc5_ = _loc3_;
         while(_loc2_ < int(_loc5_.length))
         {
            _loc6_ = _loc5_[_loc2_];
            _loc2_++;
            addNextButton(_loc6_.get_ptype().get_id(),(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var perk:Array = param2;
               return function():void
               {
                  _g[0].permanentizePerk(perk[0]);
               };
            })([this],[_loc6_.get_ptype()])).hint(_loc6_.get_perkDesc()).disableIf(_loc6_.value4 != 0,"此特质已永久化，并将在所有后续飞升中保留。");
         }
         setExitButton("返回",ascensionMenu);
      }
      
      public function ascensionPerkSelection(param1:PerkType, param2:int = 10) : void
      {
         var maxLevel1:int;
         var perk1:PerkType;
         var _g:CharCreation;
         clearOutput();
         outputText("天赋效果：" + Utils.cnName(param1.get_longDesc()));
         outputText("\n当前等级：" + get_player().perkv1(param1) + (param2 > 0 ? " / " + param2 : " (无等级上限)") + "");
         if(get_player().perkv1(param1) >= param2 && param2 > 0)
         {
            outputText("<b>(已满级)</b>");
         }
         var _loc3_:int = int(get_player().perkv1(param1) + 1);
         if(_loc3_ > 5)
         {
            _loc3_ = 5;
         }
         if(get_player().perkv1(param1) < param2 || param2 < 0)
         {
            outputText("\n下一级消耗：" + _loc3_);
         }
         else
         {
            outputText("\n下一级花费：<b>N/A</b>");
         }
         outputText("[pg]飞升特质点数：" + get_player().ascensionPerkPoints);
         menu();
         if(get_player().ascensionPerkPoints >= _loc3_ && (get_player().perkv1(param1) < param2 || param2 < 0))
         {
            _g = this;
            perk1 = param1;
            maxLevel1 = param2;
            addButton(0,"增加1级",function():void
            {
               _g.addAscensionPerk(perk1,maxLevel1);
            });
         }
         addButton(14,"返回",ascensionPerkMenu);
      }
      
      public function ascensionPerkMenu() : void
      {
         var maxLevel9:int;
         var perk9:PerkType;
         var _g9:CharCreation;
         var maxLevel8:int;
         var perk8:PerkType;
         var _g8:CharCreation;
         var maxLevel7:int;
         var perk7:PerkType;
         var _g7:CharCreation;
         var maxLevel6:int;
         var perk6:PerkType;
         var _g6:CharCreation;
         var maxLevel5:int;
         var perk5:PerkType;
         var _g5:CharCreation;
         var maxLevel4:int;
         var perk4:PerkType;
         var _g4:CharCreation;
         var maxLevel3:int;
         var perk3:PerkType;
         var _g3:CharCreation;
         var maxLevel2:int;
         var perk2:PerkType;
         var _g2:CharCreation;
         var maxLevel1:int;
         var perk1:PerkType;
         var _g1:CharCreation;
         var maxLevel:int;
         var perk:PerkType;
         var _g:CharCreation;
         clearOutput();
         outputText("你可以花费飞升特质点数来购买升级时无法获得的特殊特质！");
         outputText("[pg]飞升特质点数：" + get_player().ascensionPerkPoints);
         menu();
         _g = this;
         perk = PerkLib.AscensionDesires;
         maxLevel = 10;
         addButton(0,"欲望",function():void
         {
            _g.ascensionPerkSelection(perk,maxLevel);
         }).hint(Utils.cnName(PerkLib.AscensionDesires.get_longDesc()) + "[pg]当前等级：" + get_player().perkv1(PerkLib.AscensionDesires) + " / " + 10);
         _g1 = this;
         perk1 = PerkLib.AscensionEndurance;
         maxLevel1 = 10;
         addButton(1,"耐力",function():void
         {
            _g1.ascensionPerkSelection(perk1,maxLevel1);
         }).hint(Utils.cnName(PerkLib.AscensionEndurance.get_longDesc()) + "[pg]当前等级：" + get_player().perkv1(PerkLib.AscensionEndurance) + " / " + 10);
         _g2 = this;
         perk2 = PerkLib.AscensionFertility;
         maxLevel2 = 15;
         addButton(2,"生育力",function():void
         {
            _g2.ascensionPerkSelection(perk2,maxLevel2);
         }).hint(Utils.cnName(PerkLib.AscensionFertility.get_longDesc()) + "[pg]当前等级：" + get_player().perkv1(PerkLib.AscensionFertility) + " / " + 15);
         _g3 = this;
         perk3 = PerkLib.AscensionFortune;
         maxLevel3 = -1;
         addButton(3,"幸运",function():void
         {
            _g3.ascensionPerkSelection(perk3,maxLevel3);
         }).hint(Utils.cnName(PerkLib.AscensionFortune.get_longDesc()) + "[pg]当前等级：" + get_player().perkv1(PerkLib.AscensionFortune) + " (无等级上限)");
         _g4 = this;
         perk4 = PerkLib.AscensionMoralShifter;
         maxLevel4 = 10;
         addButton(4,"道德转换",function():void
         {
            _g4.ascensionPerkSelection(perk4,maxLevel4);
         }).hint(Utils.cnName(PerkLib.AscensionMoralShifter.get_longDesc()) + "[pg]当前等级: " + get_player().perkv1(PerkLib.AscensionMoralShifter) + " / " + 10);
         _g5 = this;
         perk5 = PerkLib.AscensionMysticality;
         maxLevel5 = 10;
         addButton(5,"神秘",function():void
         {
            _g5.ascensionPerkSelection(perk5,maxLevel5);
         }).hint(Utils.cnName(PerkLib.AscensionMysticality.get_longDesc()) + "[pg]当前等级: " + get_player().perkv1(PerkLib.AscensionMysticality) + " / " + 10);
         _g6 = this;
         perk6 = PerkLib.AscensionTolerance;
         maxLevel6 = 20;
         addButton(6,"耐受",function():void
         {
            _g6.ascensionPerkSelection(perk6,maxLevel6);
         }).hint(Utils.cnName(PerkLib.AscensionTolerance.get_longDesc()) + "[pg]当前等级: " + get_player().perkv1(PerkLib.AscensionTolerance) + " / " + 20);
         _g7 = this;
         perk7 = PerkLib.AscensionVirility;
         maxLevel7 = 15;
         addButton(7,"雄风",function():void
         {
            _g7.ascensionPerkSelection(perk7,maxLevel7);
         }).hint(Utils.cnName(PerkLib.AscensionVirility.get_longDesc()) + "[pg]当前等级: " + get_player().perkv1(PerkLib.AscensionVirility) + " / " + 15);
         _g8 = this;
         perk8 = PerkLib.AscensionWisdom;
         maxLevel8 = 5;
         addButton(8,"智慧",function():void
         {
            _g8.ascensionPerkSelection(perk8,maxLevel8);
         }).hint(Utils.cnName(PerkLib.AscensionWisdom.get_longDesc()) + "[pg]当前等级: " + get_player().perkv1(PerkLib.AscensionWisdom) + " / " + 5);
         _g9 = this;
         perk9 = PerkLib.AscensionMartiality;
         maxLevel9 = 10;
         addButton(9,"武道",function():void
         {
            _g9.ascensionPerkSelection(perk9,maxLevel9);
         }).hint(Utils.cnName(PerkLib.AscensionMartiality.get_longDesc()) + "[pg]当前等级：" + get_player().perkv1(PerkLib.AscensionMartiality) + " / " + 10);
         addButton(14,"返回",ascensionMenu);
      }
      
      public function ascensionMenu() : void
      {
         var inAscension:Boolean;
         var _g:CharCreation;
         hideStats();
         clearOutput();
         hideMenus();
         get_game().displayHeader("飞升");
         outputText("你离开的那个世界已无关紧要，此刻你正身处一个点缀着数以万计星辰的无尽黑色虚空中。你包容万物，万物亦包容于你。");
         outputText("[pg]飞升特质点数：" + get_player().ascensionPerkPoints);
         outputText("[pg](完成后，请选择转生。)");
         menu();
         addButton(0,"特质选择",ascensionPerkMenu).hint("消耗飞升特质点数来获取特殊特质！","特质选择");
         addButton(1,"永久特质",ascensionPermeryMenu).hint("消耗飞升特质点数使某些特质永久保留。","永久特质");
         if(get_oldAscension())
         {
            addButton(2,"洗点",respecLevelPerks).hint("花费5点飞升特质点数重置所有升级特质？");
         }
         if(!get_oldAscension())
         {
            addButton(3,"永久大师",ascensionMasteryMenu).hint("花费飞升特质点数来保留你在某些大师头衔中的等级。","大师菜单");
         }
         addButton(4,"改名",renamePrompt).hint("免费更改你的名字？");
         _g = this;
         inAscension = true;
         addButton(5,"更改年龄",function():void
         {
            _g.debugAgeChange(inAscension);
         }).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2704) == 1 ? "免费更改你的年龄。" : "支付10点飞升特质点数永久解锁更改年龄菜单。").disableIf(get_player().ascensionPerkPoints < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2704) != 1,"你需要10点飞升特质点数才能解锁此菜单。");
         addButton(9,"转生",reincarnatePrompt).hint("转生并开始一场全新的冒险？");
      }
      
      public function ascensionMasteryPerm(param1:MasteryType) : void
      {
         var _loc2_:int = ascensionMasteryCost();
         if(get_player().ascensionPerkPoints < _loc2_)
         {
            return;
         }
         if(!get_player().permMastery(param1))
         {
            return;
         }
         var _temp_1:* = get_player();
         _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints - _loc2_;
         ascensionMasteryMenu();
      }
      
      public function ascensionMasteryMenu() : void
      {
         var _loc3_:* = null as Mastery;
         var _loc4_:* = null as String;
         clearOutput();
         outputText("花费少量特质点数，你可以将你的专精等级永久保留，避免在未来的飞升中需要重新训练它们。某些特殊的专精无法被保留。");
         outputText("[pg]当前花费：" + ascensionMasteryCost() + " 飞升点数");
         outputText("[pg]飞升特质点数：" + get_player().ascensionPerkPoints);
         menu();
         var _loc1_:int = 0;
         var _loc2_:Array = get_player().get_masteries();
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_.get_mtype().get_permable())
            {
               _loc4_ = _loc3_.get_desc();
               if(_loc4_ == null || _loc4_ == "")
               {
                  _loc4_ = _loc3_.get_name() + "专精";
               }
               addNextButton(_loc3_.get_name(),(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var mastery:Array = param2;
                  return function():void
                  {
                     _g[0].ascensionMasteryPerm(mastery[0]);
                  };
               })([this],[_loc3_.get_mtype()])).hint(_loc4_).disableIf(_loc3_.get_isPermed(),"此专精已被保留。");
            }
         }
         setExitButton("返回",ascensionMenu);
      }
      
      public function ascensionMasteryCost() : int
      {
         var _loc4_:* = null as Mastery;
         var _loc1_:int = 1;
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().get_masteries();
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.get_isPermed())
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function arrivalPartTwo() : void
      {
         clearOutput();
         get_images().showImage("monster-zetaz");
         hideUpDown();
         dynStats(DynStat.Lust(40),DynStat.Cor(2));
         get_time().hours = 18;
         outputText("你在一阵剧烈的头痛和浑身灼烧般的欲望中醒来。一道阴影短暂地掠过你的视线，你的训练本能瞬间启动。你翻身滚过光秃秃的地面，一跃而起。几步之外，站着一个一脸惊讶的小恶魔，手里握着一只空瓶。[if (ischild) {尽管那些恐怖传说里描绘的都是些高大如塔的恶魔，可他居然比你还矮！}]他全身一丝不挂，一双瘦骨伶仃的腿之间，垂着一根大到不可思议的、脉搏跳动的红色大肉棒。一股欲望的浪潮席卷了你，你的脸一下子烧了起来，脑子里一片眩晕，但你竭力抵抗着");
         spriteSelect(SpriteDb.get_s_zetaz_imp());
         if(get_player().get_gender() == 2)
         {
            outputText("想要扑向他的肉棒然后骑上去的冲动。[pg]");
         }
         else
         {
            outputText("想要把你的肉棒狠狠捅进他喉咙里的冲动。这个念头的怪异程度让你自己都吃了一惊。[pg]");
         }
         outputText("小恶魔开口了，[say: 我很惊讶你居然还没追着我的鸡巴跑，人类。上一任勇者醒过来的时候，马上就变成了一个对我饥渴难耐的婊子。[if (ischild) {看来英格纳姆的长老们这次换了路数？选了个小孩送过来，指望[he]的身体不会被我的春药那么快拿下……|这春药保证你乖乖就范。}]]");
         doNext(arrivalPartThree);
      }
      
      public function arrivalPartThree() : void
      {
         clearOutput();
         hideUpDown();
         dynStats(DynStat.Lust(-30));
         get_images().showImage("item-draft-lust");
         if(!get_player().isChild())
         {
            outputText("小恶魔晃了晃空瓶，像是在强调自己的话。你因这真相惊愕不已——才踏入恶魔领域，竟然就已经被下了药！你浑身发颤，胯间传来难耐的欲求，但你强忍了下来，正义的怒火赋予了你力量。[pg]你绝望地扑向小恶魔，高兴地看着他那得意的笑容变成了纯粹的恐惧。这个矮小的生物根本无法抵挡你的蛮力，被你毫不留情地一顿狠揍。你拎起这矮小的恶魔，一脚把他踢飞到半空中。看着他展开双翼开始向远处逃窜，你神情严峻地皱起了眉头。[pg]");
         }
         else
         {
            outputText("小恶魔晃了晃空瓶，像是在强调自己的话。你因这真相惊愕不已——才踏入恶魔领域，竟然就已经被下了药！一股诡异而令人晕眩的燥热不断席卷全身，你发着颤，却暂且稳住了心神。绝望中你扑向小恶魔，勇敢地挥起你那小小的拳头。这个不堪一击的恶魔似乎大大低估了一个体型与其相近的人类所能爆发的凶悍。他疯狂挣扎着，总算设法挣脱了你，旋即展开双翼腾空而起，逃离了你那触及不到的范围。[pg]");
         }
         outputText("小恶魔说道：[say: 蠢货！你本可以享受无尽的快感……如果我们再次相遇，我会让你因为羞辱我而后悔的！记住泽塔兹这个名字，因为你很快就会面临我主人的怒火！][pg]");
         outputText("击败恶魔的喜悦荡然无存，因为你想到自己已经被药剂污染了。你暗自发誓，一定要找到那个害你和其余勇士们沦落至此的恶魔，将他和他那只小恶魔一并挫骨扬灰。");
         if(get_creepingTaint())
         {
            outputText("[pg]你感到胸口有一阵奇怪的寒意。小恶魔的药剂似乎对你产生了永久性的影响。");
            outputText("[pg-]泽塔兹的药剂正在腐蚀你的灵魂！<b>在你想出办法逆转这种影响之前，你每天都会慢慢增加腐化。</b>");
         }
         doNext(arrivalPartFour);
      }
      
      public function arrivalPartFour() : void
      {
         clearOutput();
         hideUpDown();
         if(!get_player().isChild())
         {
            outputText("你环顾四周，审视着这片地狱般的景象，盘算着下一步的行动。传送门就在几码之外，嵌在一片岩石之间。它似乎不再散发出在另一侧时那种撩拨人心的影响了。地面和天空都被染上了深浅不一的红色，但脚下的泥土踩起来却和任何一片毫无生机的荒地没什么两样。你打定主意在这里扎营，加固传送门的这一侧。有你在，绝不让任何恶魔践踏你深爱的家乡。[pg]你很快就搭好了帐篷，布下了几个简单的陷阱。你还需要四处探索、收集更多物资，才能进一步加强防御。说不定你还能追查到那些一直在掳走其他勇者的恶魔的踪迹！");
         }
         else
         {
            outputText("你环顾四周，看着这片地狱般的景象。这里曾吞噬过体型是你两倍的勇者，这让你对自己的使命并没有什么信心。失去了那个充满更睿智、更强壮之人的村庄给予的指引和庇护，这种焦虑深深刺痛了你。传送门就在几码之外，嵌在一片岩石之间。它似乎不再散发出在另一侧时那种令人不舒服的温热影响了。地面和天空都被染上了深浅不一的红色，但脚下的泥土踩起来却和任何一片毫无生机的荒地没什么两样。你打定主意在这里扎营，加固传送门的这一侧。教官们为此训练了你。绝不让任何恶魔从你这里通过。你很快就搭好了帐篷，布下了你勉强学会的那几个简单陷阱。你还需要四处探索、收集更多物资，才能进一步加强防御。说不定你还能追查到那些一直在掳走其他勇者的恶魔的踪迹！");
         }
         spriteSelect(null);
         imageSelect(null);
         awardAchievement("初来乍到",0,true,true);
         doNext(playerMenu);
      }
      
      public function arrival() : void
      {
         showStats();
         statScreenRefresh();
         get_time().hours = 11;
         clearOutput();
         get_images().showImage("arrival");
         if(!get_player().isChild())
         {
            outputText("你已经做好了迎接一切的准备。过去一年的大部分时间里，你都在磨炼自己的身体与意志，为前方的挑战积蓄力量。你是英格纳姆的勇者，是那个将要前往恶魔领域、以自身换取亲友平安的人——尽管你再也见不到他们了。你拭去眼角的一滴泪水，踏入庭院，看见诺穆尔长老正在等着你。你准备好了。[pg]");
            outputText("前往腐化洞穴的路途漫长而寂静。诺穆尔长老一言不发，言语在这里是空洞的。你们在默契的宁静中结伴前行。渐渐地，伊尔加斯特山的黑色岩石越来越近，气温也随之下降。你打了个寒颤，瞥了一眼长老，发现他丝毫没有表现出寒冷的样子。尽管他已年近八旬，却依然保持着中年人般的活力。你为他的强健感到庆幸，因为在这段路程中搀扶他会消耗你的体力，而你必须为接下来的考验保存体力。[pg]");
            outputText("洞穴入口豁然洞开，锋利的钟乳石悬垂其上，让它看起来就像一张怪兽的巨口。诺穆尔长老停下脚步，向你点了点头，示意你独自前行。[pg]");
            outputText("洞穴里反常地温暖潮湿，");
            if(get_player().get_gender() == 2)
            {
               outputText("而你的身体似乎也有同样的感觉，你的脸颊泛起红晕，而双腿之间则感到一阵温暖与湿润。");
            }
            else
            {
               outputText("而你的身体也做出了反应，一股不断升温的燥热集中在你的腹股沟，你的肉棒莫名其妙地硬了起来。");
            }
            outputText("你曾被警告过这种情况，所以你继续向前，无视身体愈发强烈的渴求。洞穴深处，一个散发着紫色与粉色光芒的漩涡在岩壁上翻涌跳跃，恶魔的光辉在其中明灭不定。你咬紧牙关迈步上前，无比清醒地意识到自己的身体似乎正在期待与这道被污染的魔法构造物接触。闭上眼睛，你凝聚起全部的决心，纵身跃入。天旋地转般的眩晕攫住了你，你眼前一黑……");
         }
         else
         {
            outputText("你已经做好了迎接一切的准备。过去一年里，在教官们所能提供的最高强度的训练之下，你已竭尽全力弥补自己娇小身材带来的劣势。你是英格纳姆的勇者，是那个将要前往恶魔领域、以自身换取亲友平安的人——尽管你再也见不到他们了。你拭去眼角的一滴泪水，踏入庭院，看见诺穆尔长老正在等着你。你准备好了。[pg]");
            outputText("前往腐化洞穴的路漫长而沉默。诺穆尔长老一言不发，该说的早已说尽。你们二人在一种默契的沉默中并肩前行。渐渐地，伊尔加斯特山黝黑的岩壁越来越近，空气的温度也随之骤降。你打了个寒颤，瞥了长老一眼，却发现他丝毫没有表现出任何觉得寒冷的迹象样子。尽管他已年近80岁高龄八旬，但他却依然保持着只有他一半岁数的中年人才有般的活力。你暗自庆幸他的强健，因为你自己实在没什么余力可以消耗，必须把体力留给前方的试炼。[pg]");
            outputText("洞穴入口豁然洞开，锋利的钟乳石悬垂其上，让它看起来就像一张怪兽的巨口。诺穆尔长老停下脚步，向你点了点头，示意你独自前行。[pg]");
            outputText("洞穴里异常温暖而潮湿，你尚未发育完全的身体泛起一阵酥麻的刺痒感。一股不自然的暖意和" + get_player().mf("硬度","湿意") + "在你双腿之间蔓延，那是一种你鲜少——甚至从未体验过的奇异感觉。这种感觉对你尚未进入青春期的身体来说太过陌生，你猜这就是教官们含糊其辞地警告过你的那种东西。你继续向前，无视自己年轻躯体愈发强烈的渴求。洞穴深处，一个散发着紫色与粉色光芒的漩涡在岩壁上翻涌跳跃，恶魔的光辉在其中明灭不定。你咬紧牙关迈步上前，无比清醒地意识到自己的身体似乎正在期待与这道被污染的魔法构造物接触。闭上眼睛，你凝聚起全部的决心，纵身跃入。天旋地转般的眩晕攫住了你，你眼前一黑……");
         }
         dynStats(DynStat.Lust(15));
         doNext(arrivalPartTwo);
      }
      
      public function applyStats(param1:int, param2:int, param3:Build, param4:int) : void
      {
         var newVagina:Function;
         var newCock:Function;
         var _gthis:CharCreation;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as Function;
         var _loc15_:Number = NaN;
         var _loc16_:* = null as IMap;
         _gthis = this;
         newCock = function(param1:Number, param2:Number, param3:Number):void
         {
            _gthis.get_player().balls = 2;
            _gthis.get_player().ballSize = param3;
            _gthis.get_player().createCock(param1,param2,CockTypesEnum.HUMAN);
         };
         newVagina = function(param1:Number):void
         {
            _gthis.get_player().balls = 0;
            _gthis.get_player().ballSize = 0;
            _gthis.get_player().createVagina();
            _gthis.get_player().setClitLength(param1);
         };
         var _loc5_:* = defaultStats.h[param2];
         var _loc6_:Array = statBonuses.h[param1];
         var _loc7_:* = builds.get(param3);
         if(isNewCharacter())
         {
            dynStats(DynStat.NoScale,DynStat.Str(int(_loc5_.str) + int(_loc7_.str),DynStatOp.Eq),DynStat.Tou(int(_loc5_.tou) + int(_loc7_.tou),DynStatOp.Eq),DynStat.Spe(int(_loc5_.spe) + int(_loc7_.spe),DynStatOp.Eq),DynStat.Inte(int(_loc5_.inte),DynStatOp.Eq),DynStat.Sens(int(_loc5_.sens),DynStatOp.Eq),DynStat.Lib(int(_loc5_.lib),DynStatOp.Eq),DynStat.Lust(int(_loc5_.lust),DynStatOp.Eq));
            _loc8_ = 0;
            _loc9_ = int(_loc5_.bonus);
            while(_loc8_ < _loc9_)
            {
               _loc10_ = _loc8_++;
               _loc11_ = _loc6_[int(_loc10_ % int(_loc6_.length))];
               dynStats(DynStat.NoScale,_loc11_(1));
            }
            hideUpDown();
         }
         get_player().clearGender();
         switch(param1)
         {
            case 1:
               newCock(Number(_loc5_.cockLength),Number(_loc5_.cockThickness),Number(_loc5_.ballSize));
               break;
            case 2:
               newVagina(Number(_loc5_.clitLength));
               break;
            case 3:
               newVagina(Number(_loc5_.clitLength));
               newCock(Number(_loc5_.cockLength),Number(_loc5_.cockThickness),Number(_loc5_.ballSize));
         }
         var _loc12_:Object = defaultHairLength.h[param1];
         get_player().hair.length = _loc12_;
         var _loc13_:* = _loc7_.mods.h[param4].h[param2];
         if(int(get_player().breastRows.length) == 0)
         {
            get_player().createBreastRow(int(_loc13_.breasts));
         }
         else
         {
            get_player().breastRows[0].breastRating = int(_loc13_.breasts);
         }
         get_player().hips.rating = int(_loc13_.hips);
         get_player().butt.rating = int(_loc13_.butt);
         get_player().set_femininity(int(_loc13_.femininity));
         var _loc14_:Option = _loc7_.setTone;
         switch(_loc14_.index)
         {
            case 0:
               _loc16_ = _loc14_.params[0];
               _loc15_ = Number(_loc16_.h[param4]);
               break;
            case 1:
               _loc15_ = int(_loc5_.tone.h[param1] + int(_loc7_.tone));
         }
         get_player().tone = _loc15_;
         get_player().nippleLength = Number(_loc5_.nippleLength);
         var _loc17_:Object = _loc5_.tallness.h[param1];
         get_player().set_tallness(_loc17_);
         var _loc18_:Object = _loc5_.fertility.h[param1];
         get_player().fertility = _loc18_;
      }
      
      public function ageChoice(param1:Boolean = true) : void
      {
         var age3:int;
         var _g3:CharCreation;
         var age2:int;
         var _g2:CharCreation;
         var age1:int;
         var _g1:CharCreation;
         var age:int;
         var _g:CharCreation;
         if(param1)
         {
            clearOutput();
            outputText("你的年龄区段是？");
         }
         menu();
         _g = this;
         age = 1;
         addButton(0,"儿童",function():void
         {
            _g.genericGenderChoice(age);
         });
         _g1 = this;
         age1 = 2;
         addButton(1,"少年",function():void
         {
            _g1.genericGenderChoice(age1);
         });
         _g2 = this;
         age2 = 0;
         addButton(2,"成人",function():void
         {
            _g2.genericGenderChoice(age2);
         });
         _g3 = this;
         age3 = 3;
         addButton(3,"老人",function():void
         {
            _g3.genericGenderChoice(age3);
         });
         setExitButton("返回",newGameFromScratchYes);
      }
      
      public function addMeasurementSystemToggle(param1:Function, param2:int = 4) : void
      {
         var returnTo:Function = param1;
         var _gthis:CharCreation = this;
         var _loc3_:String = get_game().get_displaySettings().metric ? "英制单位" : "公制单位";
         addButton(param2,"使用" + _loc3_,function():void
         {
            _gthis.get_game().get_displaySettings().metric = !_gthis.get_game().get_displaySettings().metric;
            returnTo();
         });
      }
      
      public function addAscensionPerk(param1:PerkType, param2:int = 10) : void
      {
         var _loc3_:int = int(get_player().perkv1(param1) + 1);
         if(_loc3_ > 5)
         {
            _loc3_ = 5;
         }
         var _temp_1:* = get_player();
         _temp_1.ascensionPerkPoints = _temp_1.ascensionPerkPoints - _loc3_;
         if(get_player().hasPerk(param1))
         {
            get_player().addPerkValue(param1,1,1);
         }
         else
         {
            get_player().createPerk(param1,1,0,0,0);
         }
         ascensionPerkSelection(param1,param2);
      }
   }
}

