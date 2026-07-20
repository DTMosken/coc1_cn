package classes.scenes
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.Vagina;
   import classes.display.SpriteDb;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.monsters.Goblin;
   import classes.scenes.monsters.Imp;
   import classes.scenes.monsters.ImpScene;
   import flash.Boot;
   import haxe.ds.Either;
   
   public class CommonEncounters extends BaseContent implements Encounter
   {
      
      public var _withImpGob:Encounter;
      
      public var _tce:Encounter;
      
      public var _impEncounter:Encounter;
      
      public var _goblinEncounter:Encounter;
      
      public function CommonEncounters()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _tce = null;
         _withImpGob = null;
         _goblinEncounter = null;
         _impEncounter = null;
         super();
      }
      
      public function twoImpsClashing() : void
      {
         clearOutput();
         outputText("一只小恶魔从岩石后突然窜出，嗡嗡地向你飞来。你准备好战斗，但它只是高高地飞过你的头顶。突然，另一只小恶魔不知从哪里冒出来，攻击了第一只。在扭打中，其中一只掉落了一件物品，你顺手接住了它，而这两只打架的恶魔则一路打着飞出了你的视线。");
         unlockCodexEntry(2044);
         var _loc1_:Inventory = get_inventory();
         var _loc2_:Array = [get_consumables().SUCMILK,get_consumables().INCUBID,get_consumables().IMPFOOD];
         _loc1_.takeItem(_loc2_[Utils.rand(int(_loc2_.length))],get_camp().returnToCampUseOneHour);
      }
      
      public function lethiteMod() : Number
      {
         if(get_player().hasPerk(PerkLib.PiercedLethite))
         {
            return 3;
         }
         return 1;
      }
      
      public function impMultiCombatEncounter() : void
      {
         var impAmount4:int;
         var lustVictory3:Boolean;
         var _g3:ImpScene;
         var impAmount3:int;
         var lustVictory2:Boolean;
         var _g2:ImpScene;
         var impAmount2:int;
         var lustVictory1:Boolean;
         var _g1:ImpScene;
         var impAmount1:int;
         var lustVictory:Boolean;
         var _g:ImpScene;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null as Array;
         var _loc13_:* = null as Array;
         var _loc14_:* = null as Monster;
         var _loc15_:* = null as Monster;
         var _loc16_:* = null as Monster;
         var _loc17_:* = null as Monster;
         var _loc18_:* = null as Function;
         var _loc19_:* = null as Function;
         var _loc20_:* = null as Function;
         clearOutput();
         var _loc1_:int = int(Math.floor(get_player().statusEffectv1(StatusEffects.BirthedImps)));
         var _loc2_:int = int(Math.floor(Math.max(get_player().level,get_time().days / 6)));
         var _loc3_:int = 1;
         var _loc4_:int = 5;
         var _loc5_:int = 0;
         if(get_game().dungeons.checkFactoryClear())
         {
            _loc3_++;
            _loc4_ += 10;
            _loc5_ += 20;
         }
         if(_loc2_ >= 2 && _loc1_ > 0)
         {
            if(_loc1_ >= 20)
            {
               _loc3_++;
            }
            _loc4_ += _loc1_ * 2;
            _loc5_ += _loc1_ * 3;
         }
         if(_loc2_ >= 5)
         {
            _loc3_++;
            _loc4_ += Utils.boundInt(0,_loc2_ * 2,50);
            _loc5_ += Utils.boundInt(0,_loc2_ * 3,50);
         }
         var _loc6_:int = 1;
         if(_loc4_ <= 90 || Utils.randomChance(90))
         {
            _loc7_ = 1;
            _loc8_ = _loc3_;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc7_++;
               _loc10_ = _loc4_ - (_loc9_ - 1) * 25;
               if(Utils.randomChance(_loc10_))
               {
                  _loc6_++;
               }
            }
         }
         switch(_loc6_)
         {
            case 1:
               _loc11_ = {
                  "text":"一只小恶魔从天而降并发起攻击！",
                  "debuff":function(param1:Array):void
                  {
                  }
               };
               break;
            case 2:
               _loc12_ = [{
                  "text":"不远处传来两只小恶魔扭打的声音，不幸的是，它们发现了你，放弃了争吵朝你扑来。",
                  "debuff":function(param1:Array):void
                  {
                  }
               },{
                  "text":"两只喋喋不休的小恶魔引起了你的注意，你的[ears]竖了起来。其中一只很快就发现了你，并迅速演变成了一场战斗。",
                  "debuff":function(param1:Array):void
                  {
                  }
               },{
                  "text":"小恶魔们从天而降，眼中充满了恶意与欲望。",
                  "debuff":function(param1:Array):void
                  {
                  }
               },{
                  "text":"伴随着小翅膀用力的扑腾声，一只小恶魔从你前方的藏身处冲了出来！当你举起[weapon]时，第二只小恶魔试图从你头顶飞过，却笨拙地落在了另一边。现在是二打一了。",
                  "debuff":function(param1:Array):void
                  {
                     param1[1].takeDamage(10);
                     param1[1].changeFatigue(20);
                  }
               }];
               _loc13_ = _loc12_;
               _loc11_ = _loc13_[Utils.rand(int(_loc13_.length))];
               break;
            case 3:
               _loc12_ = [{
                  "text":"三只四处乱窜的小恶魔引起了你的注意，当其中一只发现你时，它吓得向后倒去。这群家伙做好了战斗的准备。",
                  "debuff":function(param1:Array):void
                  {
                  }
               },{
                  "text":"小恶魔们从天而降，眼中充满了恶意与欲望。",
                  "debuff":function(param1:Array):void
                  {
                  }
               },{
                  "text":"三只小恶魔在不远处的地上爬行，弄出了一点骚动。其中一只趴在地上，看起来很烦躁，它看到了你。[say: 伙计们，我们换这个目标！]它大喊道。另外两只放弃了打斗，开始向你逼近。",
                  "debuff":function(param1:Array):void
                  {
                     var _loc3_:* = null as Monster;
                     var _loc2_:int = 0;
                     while(_loc2_ < int(param1.length))
                     {
                        _loc3_ = param1[_loc2_];
                        _loc2_++;
                        _loc3_.takeDamage(_loc3_.maxHP() / 100 * 10);
                        _loc3_.changeFatigue(20);
                     }
                  }
               },{
                  "text":"头顶三只小恶魔扑腾飞舞，\"偏偏\"其中两只相互撞上，急速坠落，险些砸到你。第三只随后落地，扇了另外两只一巴掌，将它们朝你的方向指去。",
                  "debuff":function(param1:Array):void
                  {
                     param1[0].takeDamage(10);
                     param1[1].takeDamage(10);
                  }
               }];
               _loc13_ = _loc12_;
               _loc11_ = _loc13_[Utils.rand(int(_loc13_.length))];
               break;
            default:
               _loc11_ = {
                  "text":"小恶魔们从天而降，眼中充满了恶意与欲望。",
                  "debuff":function(param1:Array):void
                  {
                  }
               };
         }
         outputText(_loc11_.text);
         unlockCodexEntry(2044);
         _loc12_ = [];
         _loc12_.push(_loc6_ > 0 ? new Imp(false,Utils.randomChance(_loc5_) ? 2 : 1) : null);
         _loc12_.push(_loc6_ > 1 ? new Imp(false,Utils.randomChance(_loc5_) ? 2 : 1) : null);
         _loc12_.push(_loc6_ > 2 ? new Imp(false,Utils.randomChance(_loc5_) ? 2 : 1) : null);
         _loc12_.push(_loc6_ > 3 ? new Imp(false,Utils.randomChance(_loc5_) ? 2 : 1) : null);
         _loc13_ = _loc12_;
         if(_loc6_ == 1)
         {
            startCombat(_loc13_[0]);
         }
         else
         {
            _loc14_ = _loc13_[0];
            _loc15_ = _loc13_[1];
            _loc16_ = _loc13_[2];
            _loc17_ = _loc13_[3];
            _g = get_game().impScene;
            lustVictory = false;
            impAmount1 = _loc6_;
            _loc18_ = function():void
            {
               _g.impMultiVictory(lustVictory,impAmount1);
            };
            _g1 = get_game().impScene;
            lustVictory1 = false;
            impAmount2 = _loc6_;
            _loc19_ = function():void
            {
               _g1.multiImpSpitroastLoss(lustVictory1,impAmount2);
            };
            _g2 = get_game().impScene;
            lustVictory2 = true;
            impAmount3 = _loc6_;
            _loc20_ = function():void
            {
               _g2.impMultiVictory(lustVictory2,impAmount3);
            };
            _g3 = get_game().impScene;
            lustVictory3 = true;
            impAmount4 = _loc6_;
            startCombatMultiple(_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,function():void
            {
               _g3.multiImpSpitroastLoss(lustVictory3,impAmount4);
            });
         }
         _loc11_.debuff(_loc13_);
         spriteSelect(SpriteDb.get_s_imp());
      }
      
      public function impEncounterBaseChance() : Number
      {
         var _loc1_:Number = 5;
         if(get_player().totalCocks() > 0)
         {
            _loc1_--;
         }
         if(get_player().hasVagina())
         {
            _loc1_++;
         }
         if(get_player().totalFertility() >= 30)
         {
            _loc1_++;
         }
         if(get_player().cumQ() >= 200)
         {
            _loc1_--;
         }
         return _loc1_ / 10;
      }
      
      public function goblinCombatEncounter() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            outputText("一只地精从灌木丛中漫步而出，眼中闪烁着危险的光芒。[pg]她说道，[say: 是时候挨操——哦，妈的，你连个能玩的东西都没有！这是为了报复你浪费我的时间！]");
         }
         else if(get_player().isChild())
         {
            outputText("一只地精从灌木丛中漫步踱出，眼中闪烁着危险的光芒。[pg][say: 难得碰到个跟我个头差不多的旅人，而且你看起来也绝不像我见过的任何一只小恶魔，]她说着，继续道，[say: 这样一来，把你按倒、像操个小骚货一样操你，可就更有意思了。]");
         }
         else
         {
            outputText("一只地精从灌木丛中漫步而出，眼中闪烁着危险的光芒。[pg]她说道，[say: 是时候挨操了，" + get_player().mf("种马","荡妇") + "。]");
         }
         unlockCodexEntry(2040);
         startCombat(new Goblin());
         spriteSelect(SpriteDb.get_s_goblin());
      }
      
      public function get_withImpGob() : Encounter
      {
         return _withImpGob = _withImpGob != null ? _withImpGob : Encounters.group("common",get_impEncounter(),get_goblinEncounter(),get_theCommonEncounters());
      }
      
      public function get_theCommonEncounters() : Encounter
      {
         return _tce = _tce != null ? _tce : Encounters.group("common",get_game().helScene.helSexualAmbushEncounter);
      }
      
      public function get_impEncounter() : Encounter
      {
         var fn:FnHelpers;
         var _gthis:CommonEncounters = this;
         if(_impEncounter != null)
         {
            return _impEncounter;
         }
         fn = Encounters.fn;
         var _loc1_:Function = EncounterChance_Impl_.fromFloatConst(1);
         var _loc2_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("twoimpsclash",fn.lineByLevel(1,20,0.1,0.01),null,OneOf_Impl_.fromA(twoImpsClashing),null));
         var _loc3_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("imp",fn.lineByLevel(1,20,1,0.5),null,OneOf_Impl_.fromA(impMultiCombatEncounter),null));
         var _loc4_:Either = OneOf_Impl_.fromB(get_game().aliceScene);
         var _loc5_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.get_allowChild();
         });
         var _loc6_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("alice",fn.lineByLevel(1,20,0.1,0.3),_loc5_,_loc4_,null));
         var _loc7_:Either = OneOf_Impl_.fromA(get_game().plagueRatScene.plagueEncounter);
         var _loc8_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.get_filthEnabled())
            {
               return Number(fn.ifLevelMin(8)()) != 0;
            }
            return false;
         });
         var _loc9_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("plaguerat",fn.lineByLevel(8,16,0.5,1),_loc8_,_loc7_,null));
         var _loc10_:Either = OneOf_Impl_.fromA(get_game().ivorySuccubusScene.encounter);
         var _loc11_:Object = fn.ifLevelMin(12);
         _impEncounter = Encounters.build(new EncounterDef(null,impEncounterBaseChance,null,OneOf_Impl_.fromB(Encounters.complex(_loc1_,"imps",_loc2_,_loc3_,_loc6_,_loc9_,EncounterOrDef_Impl_.fromDef(new EncounterDef("ivorysuccubus",fn.lineByLevel(12,20,0.25,1.5),_loc11_,_loc10_,null)))),[lethiteMod]));
         return _impEncounter;
      }
      
      public function get_goblinEncounter() : Encounter
      {
         var _loc2_:* = null as Encounter;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Function;
         var _loc5_:* = null as Encounter;
         var _loc6_:* = null as Either;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as Encounter;
         var _loc9_:* = null as Either;
         var _loc10_:* = null as Object;
         var _loc11_:* = null as Encounter;
         var _loc12_:* = null as Either;
         var _loc13_:* = null as Object;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_goblinEncounter != null)
         {
            _loc2_ = _goblinEncounter;
         }
         else
         {
            _loc3_ = EncounterChance_Impl_.fromFloatConst(0.5);
            _loc4_ = EncounterChance_Impl_.fromFloatConst(1);
            _loc5_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("goblin",_loc1_.lineByLevel(1,20,1,0.5),null,OneOf_Impl_.fromA(goblinCombatEncounter),null));
            _loc6_ = OneOf_Impl_.fromA(get_game().goblinAssassinScene.goblinAssassinEncounter);
            _loc7_ = _loc1_.ifLevelMin(10);
            _loc8_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("gobass",_loc1_.lineByLevel(10,14,0.5,2),_loc7_,_loc6_,null));
            _loc9_ = OneOf_Impl_.fromA(get_game().goblinWarriorScene.goblinWarriorEncounter);
            _loc10_ = _loc1_.ifLevelMin(12);
            _loc11_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("gobwar",_loc1_.lineByLevel(12,18,0.5,3),_loc10_,_loc9_,null));
            _loc12_ = OneOf_Impl_.fromA(get_game().goblinShamanScene.goblinShamanEncounter);
            _loc13_ = _loc1_.ifLevelMin(12);
            _loc2_ = Encounters.build(new EncounterDef(null,_loc3_,null,OneOf_Impl_.fromB(Encounters.complex(_loc4_,"goblins",_loc5_,_loc8_,_loc11_,EncounterOrDef_Impl_.fromDef(new EncounterDef("gobsha",_loc1_.lineByLevel(12,18,0.5,3),_loc13_,_loc12_,null)))),null));
         }
         return _goblinEncounter = _loc2_;
      }
      
      public function furriteMod() : Number
      {
         if(get_player().hasPerk(PerkLib.PiercedFurrite))
         {
            return 3;
         }
         return 1;
      }
      
      public function execEncounter() : void
      {
         get_theCommonEncounters().execEncounter();
      }
      
      public function encounterName() : String
      {
         return "common";
      }
      
      public function encounterChance() : Number
      {
         return get_theCommonEncounters().encounterChance();
      }
      
      public function bigJunkForestScene(param1:Boolean = false) : void
      {
         clearOutput();
         var _loc2_:int = get_player().longestCock();
         outputText("沿着");
         if(param1)
         {
            outputText("长满草且泥泞的湖岸");
         }
         else
         {
            outputText("森林中各种各样的小径");
         }
         outputText("走着，你发现自己越来越被你那庞大的" + get_player().cockDescript(_loc2_) + "所阻碍，它在");
         if(param1)
         {
            outputText("你身后的湿地上拖行。");
         }
         else
         {
            outputText("你身后的泥土上拖行。");
         }
         if(int(get_player().cocks.length) == 1)
         {
            if(param1)
            {
               outputText("当它在湖边的泥巴里拖行时，那种感觉迫使你想象着一个巨大肉穴的柔软褶皱正滑过你" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "的龟头，温柔地试图吸吮它。");
            }
            else
            {
               outputText("当它在草地、树枝和裸露的树根上拖行时，那种感觉迫使你想象着一只巨手的手指正滑过你" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "的龟头，温柔地套弄着它。");
            }
         }
         else if(int(get_player().cocks.length) >= 2)
         {
            if(param1)
            {
               outputText("随着你所有的[cocks]在泥巴里拖行，它们开始感觉就像" + Utils.num2Text(get_player().cockTotal()) + "个不同肉壶的嘴唇在每一个上面流着口水。");
            }
            else
            {
               outputText("随着你所有的[cocks]在草地、树枝和裸露的树根上拖行，它们开始感觉就像" + Utils.num2Text(get_player().cockTotal()) + "只不同的巨大怪物手的粗糙手指在滑过每一根肉棒，温柔地套弄着它们。");
            }
         }
         outputText("[pg]");
         if(!get_player().isTaur())
         {
            outputText("即将到来的勃起似乎无法阻止。你的性挫败感迫使你的" + get_player().multiCockDescriptLight() + "变得坚挺，这迫使你的躯干贴向地面。通常你的勃起只会直指天空，但你的生殖器长得太大太重，你的[hips]无法将它们举起。相反，你感觉到你的身体被迫在臀部枢轴转动，直到你的躯干被迫面朝下趴在你的[cocks]上。");
            if(get_player().biggestTitSize() >= 35)
            {
               if(param1)
               {
                  outputText("你的[chest]淫荡地从你的躯干垂下，搁在湖边的泥巴里，覆盖了你两侧的大部分地面。它们巨大的重量锚定了你的身体，进一步阻止了你的躯干抬起。泥巴结块在它们的底部，并覆盖了你的[nipples]。");
               }
               else
               {
                  outputText("你的[chest]淫荡地垂在你的躯干上，压在树枝和泥土上，覆盖了你身体两侧的大片地面。它们巨大的重量固定了你的身体，进一步阻止了你的躯干抬起。各种树根上粗糙的树皮无情地挑逗着你的[nipples]。");
               }
            }
            if(get_player().balls > 0)
            {
               outputText("你的[skintone][sack]停留在你高高撅起的[ass]下方。你的[balls]脉动着，渴望通过你的[cocks]释放精液，并");
               if(param1)
               {
                  outputText("射入附近湖泊的水中。");
               }
               else
               {
                  outputText("射在森林肥沃的土壤上。");
               }
            }
            if(int(get_player().vaginas.length) >= 1)
            {
               outputText("你的[vagina]和[clit]被彻底挤压在男性生殖器从臀部和上方[ass]之间突出的庞大肉体之间。");
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("汁液从你的女性私处流出，开始在你身下的泥土和树枝上汇聚。");
                  if(param1)
                  {
                     outputText("滴落的淫液只会让地面变得更加泥泞。");
                  }
                  else
                  {
                     outputText("黏稠的淫液立刻渗入了肥沃的土壤中。");
                  }
               }
            }
         }
         else if(get_player().isTaur())
         {
            outputText("即将到来的勃起似乎无法阻止。你的性挫败感迫使你的" + get_player().multiCockDescriptLight() + "变得坚硬，这也迫使你兽性躯干的腹部贴向地面。通常情况下，你的勃起只会悬停在你双腿之间的地面上方，但你的生殖器已经变得太大太重，你的[hips]无法将它们高高举起。相反，你感觉到你的身体被后腿强行拉下，直到你兽性的身体趴在你的[cocks]上。");
            if(get_player().biggestTitSize() >= 35)
            {
               if(param1)
               {
                  outputText("你的[chest]将你的人类躯干向前拉，直到它也被迫面向地面，被乳肉遮蔽。你的乳房停留在你身体两侧潮湿的泥土上。它们巨大的重量固定了你，进一步阻止了你马身任何部分的抬起。泥土结块在它们的底部，并覆盖了你的[nipples]。");
               }
               else
               {
                  outputText("你的[chest]将你的人类躯干向前拉，直到它也被迫面向地面，被乳肉遮蔽。你的乳房停留在你身体两侧的泥土和树枝上。它们巨大的重量固定了你，进一步阻止了你马身任何部分的抬起。各种树根上粗糙的树皮无情地挑逗着你的[nipples]。");
               }
            }
            if(get_player().balls > 0)
            {
               outputText("你的" + get_player().skin.tone + get_player().sackDescript() + "停留在你高高撅起的[ass]下方。你的[balls]脉动着，渴望通过你的[cocks]释放精液，并");
               if(param1)
               {
                  outputText("射入附近湖泊的水中。");
               }
               else
               {
                  outputText("射在森林地面肥沃的土壤上。");
               }
            }
            if(int(get_player().vaginas.length) >= 1)
            {
               outputText("你的[vagina]和[clit]被彻底挤压在男性生殖器从臀部和上方[ass]之间突出的庞大肉体之间。");
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  if(param1)
                  {
                     outputText("一片树叶从树上落下，落在你湿润的阴唇上，它轻柔的触碰挑逗着你敏感的肌肤。就像发情的母马或母牛一样，汁液从你的女性私处流出，汇聚在你身下的泥浆中。泥泞的淫液只会让地面变得更加泥泞。");
                  }
                  else
                  {
                     outputText("一片树叶从树上落下，落在你湿润的阴唇上，它轻柔的触碰挑逗着你敏感的肌肤。就像发情的母马或母牛一样，汁液从你的女性私处流出，汇聚在你身下的泥土和树枝中。");
                  }
               }
            }
         }
         outputText("[pg]");
         outputText("你意识到自己实际上已经被自己的身体困在了这里。");
         if(get_player().cor < 33)
         {
            outputText("恐慌涌上心头，你意识到如果任何危险的掠食者在这个状态下发现你，你将毫无还手之力。你必须立刻找到恢复行动能力的方法！");
         }
         else if(get_player().cor < 66)
         {
            outputText("你意识到如果任何危险的掠食者在这种状态下发现你，你将毫无防备！你必须找到恢复行动能力的方法……然而，想象一个性掠食者利用你淫秽的身体会有多爽，这有一种难以言喻的吸引力。");
         }
         else
         {
            outputText("你的天赋让你在遇到任何掠食者时都毫无还手之力。在内心深处，你甚至觉得这种前景令人兴奋。成为游荡野兽无助的性玩具的想法，对你来说有着异乎寻常的吸引力。如果不是想到可能会饿死，你真的会非常想就待在原地不走了。");
         }
         if(param1)
         {
            if(get_player().canFly())
            {
               outputText("你展开翅膀，拼尽全力拍打，直到最后，你终于设法减轻了身体的重量。这刚好能让你把生殖器从泥里拖出来，然后回到营地。这场折磨花了你将近一个小时才回到营地并处理好。");
            }
            else if(get_player().isTaur())
            {
               outputText("你挣扎着，用你的多条腿在湿润的地面上用力。你的[feet]一直很难找到立足点，因为泥泞无法提供足够的杠杆力来支撑你庞大的身躯。你深吸一口气，身体左右倾斜，试图在脚下找到一些更容易垂直发力的地方。最终，通过粗笨的爬行，你的腿设法将你庞大的身躯推到了更坚实的地面上。你艰难地花了接下来的一个小时，拖着你的生殖器回到了营地。");
            }
            else
            {
               outputText("你挣扎着，用你的[legs]拼尽全力推，但无济于事。你只能做唯一能做的事，开始用你能鼓起的最大力气抚摸你的[cocks]。最终，你的身体紧绷，一股少量的精液从你的体内喷发出来，但与你所需要的相比，这次高潮真的太微弱了。你因为挣扎而疲惫不堪，无法给自己真正需要的自慰，但你还是继续尝试。将近一个小时后，[eachcock]已经软化到足以让你再次站起来，你拖着生殖器穿过泥泞，回到了营地。");
            }
         }
         else if(get_player().canFly())
         {
            outputText("你展开翅膀，拼尽全力拍打，直到最后，你终于设法减轻了身体的重量。这刚好能让你把生殖器从森林里拖出来，然后回到营地。这场折磨花了你将近一个小时才回到营地并处理好。");
         }
         else if(get_player().isTaur())
         {
            outputText("你挣扎着，用你的多条腿在松软的泥土上用力。你的[feet]一直很难找到立足点，因为地面无法提供足够的杠杆力来支撑你庞大的身躯。你深吸一口气，身体左右倾斜，直到最后，你的脚撑住了周围树木的各种根部。通过粗笨的爬行，你的腿设法将你的身体和生殖器拖出森林，回到了营地。");
         }
         else
         {
            outputText("你挣扎着，用你的[legs]拼尽全力推，但无济于事。你只能做唯一能做的事，开始用你能鼓起的最大力气抚摸你的[cocks]。最终，你的身体紧绷，一股少量的精液从你的下体喷发出来，但与你所需要的相比，这次高潮真的太微弱了。你因为挣扎而疲惫不堪，无法给自己真正需要的自慰，但你还是继续尝试。将近一个小时后，[eachcock]已经软化到足以让你再次站起来，你拖着生殖器穿过森林的地面，回到了营地。");
         }
         dynStats(DynStat.Lust(25 + Utils.rand(get_player().cor / 5)),DynStat.NoScale);
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bigJunkDesertScene() : void
      {
         clearOutput();
         var _loc1_:int = get_player().longestCock();
         outputText("走在沙漠的沙丘上，你发现自己越来越被身后在沙地上拖行的庞大" + get_player().cockDescript(_loc1_) + "所阻碍。沙漠表面难以置信的炎热让你的下体大量出汗，并充满了无情的灼热感。");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("当它在沙丘上拖行时，那种感觉让你不禁想象一只巨大野兽粗糙的舌头正滑过你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "。");
         }
         else if(int(get_player().cocks.length) >= 2)
         {
            outputText("随着你所有的[cocks]在沙地上拖行，它们开始感觉就像" + Utils.num2Text(get_player().cockTotal()) + "只不同的巨大野兽粗糙的舌头在每一个上面流口水。");
         }
         outputText("[pg]");
         if(!get_player().isTaur())
         {
            outputText("即将到来的勃起似乎无法停止。你的性挫折感迫使你的" + get_player().multiCockDescriptLight() + "变得僵硬，这迫使你的躯干贴在地面上。通常你的勃起只会直指天空，但你的生殖器已经变得太大太重，你的[hips]无法将它们举起。相反，你感觉到你的身体在臀部被强行扭转，直到你的躯干被迫面朝下趴在你淫秽的[cocks]上。");
            if(get_player().biggestTitSize() >= 35)
            {
               outputText("你的" + get_player().allBreastsDescript() + "淫荡地悬挂在你的躯干上，贴在沙漠的沙子上，似乎把你两侧的沙丘都掩埋了。它们巨大的重量固定了你的身体，进一步阻止了你的躯干抬起。沙漠的灼热无情地挑逗着你的[nipples]，因为它们在沙子里摩擦。");
            }
            if(get_player().balls > 0)
            {
               outputText("你的" + get_player().skin.tone + get_player().sackDescript() + "位于你抬起的[ass]下方。沙漠火热的温暖抚摸着它，导致你的[balls]脉动着，需要通过你的[cocks]释放它们的精液。");
            }
            if(int(get_player().vaginas.length) >= 1)
            {
               outputText("你的[vagina]和[clit]被彻底挤压在男性生殖器从臀部和上方[ass]之间突出的庞大肉体之间。");
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("汁液从你的女性部位流出，开始在你身下滚烫的沙子上汇聚。一缕缕蒸汽升入空中，只会进一步挑逗你的生殖器。");
               }
            }
         }
         else
         {
            outputText("即将到来的勃起似乎无法停止。你的性挫折感迫使你的" + get_player().multiCockDescriptLight() + "变得僵硬，这迫使你像马一样的躯干贴在地面上。通常你的勃起只会悬停在你半人马的腿之间的地面上，但你的生殖器已经变得太大太重，你的[hips]无法将它们举起。相反，你感觉到你的身体在后躯被强行拉下，直到你趴在你的[cocks]上。");
            if(get_player().biggestTitSize() >= 35)
            {
               outputText("你的" + get_player().allBreastsDescript() + "将你人类的躯干向前拉，直到它也被迫面朝下趴着，就像你的马半身一样。你的乳房贴在你两侧的沙漠沙子上。它们巨大的重量固定了你，进一步阻止了你马身任何部分抬起。沙漠的灼热不断地挑逗着你的[nipples]。");
            }
            if(get_player().balls > 0)
            {
               outputText("你的" + get_player().skin.tone + get_player().sackDescript() + "位于你抬起的[ass]下方。沙漠通风的温暖挑逗着它，导致你的[balls]脉动着，需要通过你的[cocks]释放它们的精液。");
            }
            if(int(get_player().vaginas.length) >= 1)
            {
               outputText("你的[vagina]和[clit]被彻底挤压在男性生殖器从臀部和上方[ass]之间突出的庞大肉体之间。");
               if(get_player().vaginas[0].vaginalWetness >= 4)
               {
                  outputText("沙漠的太阳照射在你的身体上，其火热的温度点燃了你阴唇的感觉。汁液从你的女性部位流出，开始在你身下滚烫的沙子上汇聚。");
               }
            }
         }
         outputText("[pg]");
         outputText("你意识到自己实际上已经被自己的身体困在了这里。");
         if(get_player().cor < 33)
         {
            outputText("恐慌涌上心头，你意识到如果任何危险的掠食者在这个状态下发现你，你将毫无还手之力。你必须立刻找到恢复行动能力的方法！");
         }
         else if(get_player().cor < 66)
         {
            outputText("你意识到如果任何危险的掠食者在这个状态下发现你，你将毫无还手之力。你必须找到恢复行动能力的方法……然而，想象一个性掠食者利用你这淫秽的身体会有多爽，这想法竟有一种莫名的吸引力。");
         }
         else
         {
            outputText("你的天赋让你在遇到任何掠食者时都完全无能为力。但在你内心的某个角落，你却对这种前景感到兴奋。成为游荡野兽无助的性玩具的想法对你来说异常诱人。如果不是想到你可能会在沙漠中渴死，你真的会非常想就这么待在原地。");
         }
         if(get_player().canFly())
         {
            outputText("你展开翅膀，拼命拍打，直到最后你终于设法减轻了身体的重量——足以让你拖着生殖器穿过滚烫的沙地回到营地。这场折磨花了将近一个小时。");
         }
         else if(get_player().isTaur())
         {
            outputText("你挣扎着，用你的马腿蹬着困住你的沙丘表面。你的[feet]一直很难找到落脚点，松软的沙子无法提供足够的杠杆力来抬起你庞大的身躯。你深吸一口气，身体左右倾斜，试图找到一些更容易的垂直杠杆力。最终，通过粗略的爬行，你的腿设法将你庞大的身躯推到了更坚实的地面上。你费了九牛二虎之力，花了接下来一个小时的时间，拖着生殖器穿过沙地回到了营地。");
         }
         else
         {
            outputText("你挣扎着，用你的[legs]拼命推，但无济于事。你只能做你唯一能做的事，开始用你所能聚集的最大活力抚摸你的[cocks]。最终你的身体紧绷，一股淡淡的精液从你体内喷发出来，但与你所需要的相比，这次高潮真的太温和了。你只是因为挣扎而太累了，无法给自己真正需要的自慰，但你继续尝试。将近一个小时后，[eachcock]软化到足以让你再次站起来，你回到营地，仍然拖着生殖器穿过温暖的沙地。");
         }
         dynStats(DynStat.Lust(25 + Utils.rand(get_player().cor / 5)),DynStat.NoScale);
         get_player().changeFatigue(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bigJunkChance() : Number
      {
         if(get_player().longestCockLength() >= get_player().get_tallness() && get_player().totalCockThickness() >= 12)
         {
            return 1 + (get_player().longestCockLength() - get_player().get_tallness()) / 24;
         }
         return 0;
      }
   }
}

