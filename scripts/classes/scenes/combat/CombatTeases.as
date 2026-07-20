package classes.scenes.combat
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.items.Undergarment;
   import classes.scenes.dungeons.lethicesKeep.Doppelganger;
   import classes.scenes.dungeons.lethicesKeep.JeanClaude;
   import flash.Boot;
   
   public class CombatTeases extends BaseContent
   {
      
      public function CombatTeases()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function teaseAttack() : void
      {
         if(get_monster().lustVuln == 0)
         {
            clearOutput();
            get_monster().outputDefaultTeaseReaction(0);
            get_combat().startMonsterTurn();
         }
         else if(get_monster().get_short() == "worms")
         {
            clearOutput();
            outputText("你想利用它的人形，于是你挥舞着你的鸡巴，拍打着你的屁股，动作相当下流。然而，这只生物对你充满暗示的动作毫无反应。[pg]");
            get_combat().startMonsterTurn();
         }
         else
         {
            tease();
            if(!get_combat().combatRoundOver())
            {
               get_combat().startMonsterTurn();
            }
         }
      }
      
      public function tease(param1:Boolean = false) : void
      {
         var _loc17_:int = 0;
         var _loc18_:* = null as Array;
         if(!param1)
         {
            clearOutput();
         }
         if(get_monster().hasStatusEffect(StatusEffects.Blind))
         {
            outputText("你尽力用你的身体去挑逗[themonster]。但这没用——你弄瞎了[monster.him]，还记得吗？[pg]");
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv2(StatusEffects.Sealed) == 1)
         {
            outputText("你尽力用你的身体去挑逗[themonster]。你那毫无技巧的旋转毫无效果，因为<b>你挑逗的能力被封印了。</b>[pg]");
            return;
         }
         if(get_monster().get_short() == "Sirius, a naga hypnotist")
         {
            outputText("他太专注于你的眼睛了，根本没有注意你挑逗的动作，<b>看来你必须揍他一顿了。</b>[pg]");
            return;
         }
         if(get_monster().get_short() == "outsider")
         {
            outputText("你试图勾引这个异界生物的尝试没有奏效。至少，你认为没有奏效，但它体内闪过一丝粉红色的光芒。这难道意味着……？");
            return;
         }
         get_combat().fatigueRecovery();
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Array = [];
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = true;
         var _loc13_:Number = 60;
         _loc13_ += get_player().masteryLevel(MasteryLib.Tease) * 5;
         _loc13_ += get_player().get_upperGarment().get_sexiness();
         _loc13_ += get_player().get_lowerGarment().get_sexiness();
         if(get_player().hasPerk(PerkLib.Seduction))
         {
            _loc13_ += 10;
         }
         _loc13_ += get_player().getBonusStat("挑逗几率");
         if(get_player().hasPerk(PerkLib.BimboBody))
         {
            _loc2_ = true;
         }
         if(get_player().hasPerk(PerkLib.BroBody))
         {
            _loc3_ = true;
         }
         if(get_player().hasPerk(PerkLib.FutaForm))
         {
            _loc4_ = true;
         }
         var _loc14_:Number = 6 + Utils.rand(3);
         _loc14_ += get_player().getBonusStat("挑逗伤害");
         if(_loc2_ || _loc3_ || _loc4_)
         {
            _loc2_ = true;
         }
         if(get_player().level < 30)
         {
            _loc14_ += get_player().level;
         }
         else if(get_player().level < 60)
         {
            _loc14_ += 30 + (get_player().level - 30) / 2;
         }
         else
         {
            _loc14_ += 45 + (get_player().level - 60) / 5;
         }
         _loc14_ += get_player().masteryLevel(MasteryLib.Tease) * 2;
         if((_loc4_ || _loc2_) && get_player().get_gender() >= 2)
         {
            _loc5_[int(_loc5_.length)] = 4;
            if(get_player().butt.rating >= 7)
            {
               _loc5_[int(_loc5_.length)] = 4;
            }
            if(get_player().butt.rating >= 10)
            {
               _loc5_[int(_loc5_.length)] = 4;
            }
            if(get_player().butt.rating >= 14)
            {
               _loc5_[int(_loc5_.length)] = 4;
            }
            if(get_player().butt.rating >= 20)
            {
               _loc5_[int(_loc5_.length)] = 4;
            }
            if(get_player().butt.rating >= 25)
            {
               _loc5_[int(_loc5_.length)] = 4;
            }
            if(get_player().biggestTitSize() >= 2)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 4)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 8)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 15)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 30)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 50)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 75)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().biggestTitSize() >= 100)
            {
               _loc5_[int(_loc5_.length)] = 5;
            }
            if(get_player().hasVagina())
            {
               _loc5_[int(_loc5_.length)] = 2;
               if(get_player().wetness() >= 3)
               {
                  _loc5_[int(_loc5_.length)] = 6;
               }
               if(get_player().wetness() >= 5)
               {
                  _loc5_[int(_loc5_.length)] = 6;
               }
               if(get_player().vaginalCapacity() >= 30)
               {
                  _loc5_[int(_loc5_.length)] = 6;
               }
               if(get_player().vaginalCapacity() >= 60)
               {
                  _loc5_[int(_loc5_.length)] = 6;
               }
               if(get_player().vaginalCapacity() >= 75)
               {
                  _loc5_[int(_loc5_.length)] = 6;
               }
            }
            if(get_player().hasVagina() && get_player().butt.rating >= 8 && get_player().hips.rating >= 6 && get_player().biggestTitSize() >= 4)
            {
               _loc5_[int(_loc5_.length)] = 7;
               _loc5_[int(_loc5_.length)] = 7;
               _loc5_[int(_loc5_.length)] = 7;
               _loc5_[int(_loc5_.length)] = 7;
            }
            if(_loc4_ && get_player().hasCock())
            {
               _loc5_[int(_loc5_.length)] = 10;
               _loc5_[int(_loc5_.length)] = 11;
               if(get_player().cockTotal() > 1)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().cockTotal() >= 2)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 10)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().biggestCockArea() >= 25)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 50)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 75)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 300)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
            }
         }
         else if(_loc3_)
         {
            if(get_player().biggestTitSize() < 1 && get_player().tone >= 60)
            {
               _loc5_[int(_loc5_.length)] = 8;
               if(get_player().tone >= 70)
               {
                  _loc5_[int(_loc5_.length)] = 8;
               }
               if(get_player().tone >= 80)
               {
                  _loc5_[int(_loc5_.length)] = 8;
               }
               if(get_player().tone >= 90)
               {
                  _loc5_[int(_loc5_.length)] = 8;
               }
               if(get_player().tone == 100)
               {
                  _loc5_[int(_loc5_.length)] = 8;
               }
            }
            if(get_player().tone >= 60 && get_player().get_str100() >= 50)
            {
               _loc5_[int(_loc5_.length)] = 9;
               if(get_player().tone >= 80)
               {
                  _loc5_[int(_loc5_.length)] = 9;
               }
               if(get_player().get_str100() >= 70)
               {
                  _loc5_[int(_loc5_.length)] = 9;
               }
               if(get_player().tone >= 90)
               {
                  _loc5_[int(_loc5_.length)] = 9;
               }
               if(get_player().get_str100() >= 80)
               {
                  _loc5_[int(_loc5_.length)] = 9;
               }
            }
            if(get_player().hasCock())
            {
               _loc5_[int(_loc5_.length)] = 10;
               _loc5_[int(_loc5_.length)] = 11;
               if(get_player().cockTotal() > 1)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().cockTotal() >= 2)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 10)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().biggestCockArea() >= 25)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 50)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 75)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  _loc5_[int(_loc5_.length)] = 11;
               }
               if(get_player().biggestCockArea() >= 300)
               {
                  _loc5_[int(_loc5_.length)] = 10;
               }
            }
         }
         else
         {
            _loc5_[int(_loc5_.length)] = 0;
            if(get_player().butt.rating >= 7)
            {
               _loc5_[int(_loc5_.length)] = 0;
            }
            if(get_player().butt.rating >= 10)
            {
               _loc5_[int(_loc5_.length)] = 0;
            }
            if(get_player().butt.rating >= 14)
            {
               _loc5_[int(_loc5_.length)] = 0;
            }
            if(get_player().butt.rating >= 20)
            {
               _loc5_[int(_loc5_.length)] = 0;
            }
            if(get_player().butt.rating >= 25)
            {
               _loc5_[int(_loc5_.length)] = 0;
            }
            if(get_player().biggestTitSize() >= 2)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 4)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 8)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 15)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 30)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 50)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 75)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().biggestTitSize() >= 100)
            {
               _loc5_[int(_loc5_.length)] = 1;
            }
            if(get_player().hasVagina())
            {
               _loc5_[int(_loc5_.length)] = 2;
               if(get_player().wetness() >= 3)
               {
                  _loc5_[int(_loc5_.length)] = 2;
               }
               if(get_player().wetness() >= 5)
               {
                  _loc5_[int(_loc5_.length)] = 2;
               }
               if(get_player().vaginalCapacity() >= 30)
               {
                  _loc5_[int(_loc5_.length)] = 2;
               }
               if(get_player().vaginalCapacity() >= 60)
               {
                  _loc5_[int(_loc5_.length)] = 2;
               }
               if(get_player().vaginalCapacity() >= 75)
               {
                  _loc5_[int(_loc5_.length)] = 2;
               }
            }
            if(get_player().hasCock())
            {
               _loc5_[int(_loc5_.length)] = 3;
               if(get_player().cockTotal() > 1)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().cockTotal() >= 2)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 10)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 25)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 50)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 75)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 100)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
               if(get_player().biggestCockArea() >= 300)
               {
                  _loc5_[int(_loc5_.length)] = 3;
               }
            }
         }
         if(get_player().hasPerk(PerkLib.Flexibility) && get_player().isBiped() && get_player().hasVagina())
         {
            _loc5_[int(_loc5_.length)] = 12;
            _loc5_[int(_loc5_.length)] = 12;
            if(get_player().wetness() >= 3)
            {
               _loc5_[int(_loc5_.length)] = 12;
            }
            if(get_player().wetness() >= 5)
            {
               _loc5_[int(_loc5_.length)] = 12;
            }
            if(get_player().vaginalCapacity() >= 30)
            {
               _loc5_[int(_loc5_.length)] = 12;
            }
         }
         if(get_player().get_pregnancyIncubation() <= 216 && get_player().get_pregnancyIncubation() > 0)
         {
            _loc5_[int(_loc5_.length)] = 13;
            if(get_player().biggestLactation() >= 1)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 180)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 120)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 100)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 50)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 24)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 24)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 24)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
            if(get_player().get_pregnancyIncubation() <= 24)
            {
               _loc5_[int(_loc5_.length)] = 13;
            }
         }
         if(get_monster().hasCock() && get_player().hasVagina() && get_player().hasPerk(PerkLib.BroodMother) && (get_player().get_pregnancyIncubation() <= 0 || get_player().get_pregnancyIncubation() > 216))
         {
            _loc5_[int(_loc5_.length)] = 14;
            _loc5_[int(_loc5_.length)] = 14;
            _loc5_[int(_loc5_.length)] = 14;
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
            if(get_player().get_inHeat())
            {
               _loc5_[int(_loc5_.length)] = 14;
            }
         }
         if(get_player().hasFuckableNipples())
         {
            _loc5_[int(_loc5_.length)] = 15;
            _loc5_[int(_loc5_.length)] = 15;
            if(get_player().hasVagina())
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().hasVagina())
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().hasVagina())
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().wetness() >= 3)
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().wetness() >= 5)
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().biggestTitSize() >= 3)
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
            if(get_player().nippleLength >= 3)
            {
               _loc5_[int(_loc5_.length)] = 15;
            }
         }
         if(get_player().ass.analLooseness >= 4)
         {
            _loc5_[int(_loc5_.length)] = 16;
            if(get_player().ass.analLooseness >= 5)
            {
               _loc5_[int(_loc5_.length)] = 16;
            }
         }
         if(get_player().tail.type == 6)
         {
            _loc5_[int(_loc5_.length)] = 17;
            _loc5_[int(_loc5_.length)] = 17;
         }
         if(get_player().dogScore() + get_player().wolfScore() >= 4 && get_player().hasVagina() && get_player().isBiped())
         {
            _loc5_[int(_loc5_.length)] = 18;
            _loc5_[int(_loc5_.length)] = 18;
         }
         if(get_player().get_femininity() >= 100)
         {
            _loc5_[int(_loc5_.length)] = 19;
            _loc5_[int(_loc5_.length)] = 19;
            _loc5_[int(_loc5_.length)] = 19;
         }
         if(get_player().get_femininity() <= 0)
         {
            _loc5_[int(_loc5_.length)] = 20;
            _loc5_[int(_loc5_.length)] = 20;
            _loc5_[int(_loc5_.length)] = 20;
         }
         if(get_player().get_femininity() == 50)
         {
            _loc5_[int(_loc5_.length)] = 21;
            _loc5_[int(_loc5_.length)] = 21;
            _loc5_[int(_loc5_.length)] = 21;
         }
         if(get_player().tail.type == 5)
         {
            _loc5_[int(_loc5_.length)] = 22;
            _loc5_[int(_loc5_.length)] = 22;
            _loc5_[int(_loc5_.length)] = 22;
            if(get_player().spiderScore() >= 4)
            {
               _loc5_[int(_loc5_.length)] = 22;
               _loc5_[int(_loc5_.length)] = 22;
               _loc5_[int(_loc5_.length)] = 22;
            }
         }
         if(get_player().get_inRut() && get_monster().hasVagina() && get_player().hasCock())
         {
            _loc5_[int(_loc5_.length)] = 23;
            _loc5_[int(_loc5_.length)] = 23;
            _loc5_[int(_loc5_.length)] = 23;
            _loc5_[int(_loc5_.length)] = 23;
            _loc5_[int(_loc5_.length)] = 23;
         }
         if(get_player().get_weaponName() == "wizard\'s staff" && get_player().biggestTitSize() >= 1 && get_player().get_gender() > 0)
         {
            _loc5_[int(_loc5_.length)] = 24;
            _loc5_[int(_loc5_.length)] = 24;
            _loc5_[int(_loc5_.length)] = 24;
            _loc5_[int(_loc5_.length)] = 24;
            _loc5_[int(_loc5_.length)] = 24;
         }
         if(get_player().get_tallness() - get_monster().get_tallness() >= 24 && get_player().biggestTitSize() >= 4)
         {
            _loc5_[int(_loc5_.length)] = 25;
            _loc5_[int(_loc5_.length)] = 25;
            _loc5_[int(_loc5_.length)] = 25;
            _loc5_[int(_loc5_.length)] = 25;
            _loc5_[int(_loc5_.length)] = 25;
         }
         if(get_player().get_inte100() >= 70 && get_player().hasStatusEffect(StatusEffects.KnowsArouse))
         {
            _loc5_[int(_loc5_.length)] = 26;
            _loc5_[int(_loc5_.length)] = 26;
            _loc5_[int(_loc5_.length)] = 26;
         }
         if(get_player().hasPerk(PerkLib.Feeder) && get_player().biggestTitSize() >= 4)
         {
            _loc5_[int(_loc5_.length)] = 27;
            _loc5_[int(_loc5_.length)] = 27;
            _loc5_[int(_loc5_.length)] = 27;
            if(get_player().biggestTitSize() >= 10)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
            if(get_player().biggestTitSize() >= 15)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
            if(get_player().biggestTitSize() >= 25)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
            if(get_player().biggestTitSize() >= 40)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
            if(get_player().biggestTitSize() >= 60)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
            if(get_player().biggestTitSize() >= 80)
            {
               _loc5_[int(_loc5_.length)] = 27;
            }
         }
         if(get_player().get_armorName() == "backless female teacher\'s clothes" && get_player().get_gender() == 2)
         {
            _loc5_[int(_loc5_.length)] = 28;
            _loc5_[int(_loc5_.length)] = 28;
            _loc5_[int(_loc5_.length)] = 28;
            _loc5_[int(_loc5_.length)] = 28;
         }
         if(get_player().get_armorName() == "formal vest, tie, and crotchless pants" && get_player().get_gender() == 1)
         {
            _loc5_[int(_loc5_.length)] = 29;
            _loc5_[int(_loc5_.length)] = 29;
            _loc5_[int(_loc5_.length)] = 29;
            _loc5_[int(_loc5_.length)] = 29;
         }
         if(get_player().get_armorName() == "headdress, necklaces, and many body-chains")
         {
            _loc5_[int(_loc5_.length)] = 30;
            _loc5_[int(_loc5_.length)] = 30;
            _loc5_[int(_loc5_.length)] = 30;
            _loc5_[int(_loc5_.length)] = 30;
         }
         if(get_player().get_armorName() == "bridle bit and saddle set")
         {
            _loc5_[int(_loc5_.length)] = 31;
            _loc5_[int(_loc5_.length)] = 31;
            _loc5_[int(_loc5_.length)] = 31;
            _loc5_[int(_loc5_.length)] = 31;
         }
         if(get_player().get_armorName() == "servant\'s clothes" && get_player().get_gender() == 0)
         {
            _loc5_[int(_loc5_.length)] = 32;
            _loc5_[int(_loc5_.length)] = 32;
            _loc5_[int(_loc5_.length)] = 32;
            _loc5_[int(_loc5_.length)] = 32;
         }
         if(get_player().get_armorName() == "crotch-revealing clothes" && get_player().get_gender() == 3)
         {
            _loc5_[int(_loc5_.length)] = 33;
            _loc5_[int(_loc5_.length)] = 33;
            _loc5_[int(_loc5_.length)] = 33;
            _loc5_[int(_loc5_.length)] = 33;
         }
         if(get_player().get_armorName() == "maid\'s clothes" && get_player().hasVagina())
         {
            _loc5_[int(_loc5_.length)] = 34;
            _loc5_[int(_loc5_.length)] = 34;
            _loc5_[int(_loc5_.length)] = 34;
            _loc5_[int(_loc5_.length)] = 34;
         }
         if(get_player().get_armorName() == "cute servant\'s clothes" && get_player().hasCock())
         {
            _loc5_[int(_loc5_.length)] = 35;
            _loc5_[int(_loc5_.length)] = 35;
            _loc5_[int(_loc5_.length)] = 35;
            _loc5_[int(_loc5_.length)] = 35;
         }
         if(get_player().get_armorName() == "bondage patient clothes")
         {
            _loc5_[int(_loc5_.length)] = 36;
            _loc5_[int(_loc5_.length)] = 36;
            _loc5_[int(_loc5_.length)] = 36;
            _loc5_[int(_loc5_.length)] = 36;
         }
         if(get_player().kitsuneScore() >= 2 && get_player().tail.type == 13)
         {
            _loc5_[int(_loc5_.length)] = 37;
            _loc5_[int(_loc5_.length)] = 37;
            _loc5_[int(_loc5_.length)] = 37;
            _loc5_[int(_loc5_.length)] = 37;
            _loc5_[int(_loc5_.length)] = 38;
            _loc5_[int(_loc5_.length)] = 38;
            _loc5_[int(_loc5_.length)] = 38;
            _loc5_[int(_loc5_.length)] = 38;
            _loc5_[int(_loc5_.length)] = 39;
            _loc5_[int(_loc5_.length)] = 39;
            _loc5_[int(_loc5_.length)] = 39;
            _loc5_[int(_loc5_.length)] = 39;
            _loc5_[int(_loc5_.length)] = 40;
            _loc5_[int(_loc5_.length)] = 40;
            _loc5_[int(_loc5_.length)] = 40;
            _loc5_[int(_loc5_.length)] = 40;
         }
         if(get_player().kitsuneScore() >= 2 && get_player().tail.type == 13)
         {
            _loc5_[int(_loc5_.length)] = 41;
            _loc5_[int(_loc5_.length)] = 41;
            _loc5_[int(_loc5_.length)] = 41;
            _loc5_[int(_loc5_.length)] = 41;
         }
         if(get_game().urtaQuest.isUrta())
         {
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
            _loc5_[int(_loc5_.length)] = 42;
         }
         if(get_player().hasVagina() && get_player().lactationQ() >= 500 && get_player().biggestTitSize() >= 6 && get_player().cowScore() >= 3 && get_player().tail.type == 4)
         {
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
            _loc5_[int(_loc5_.length)] = 43;
         }
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armorName() == "lusty maiden\'s armor")
         {
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
            _loc5_[int(_loc5_.length)] = 44;
         }
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 4)
         {
            _loc5_[int(_loc5_.length)] = 46;
            if(get_player().biggestLactation() >= 1)
            {
               _loc5_[int(_loc5_.length)] = 46;
            }
            if(get_player().biggestLactation() >= 1)
            {
               _loc5_[int(_loc5_.length)] = 46;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 4)
            {
               _loc5_[int(_loc5_.length)] = 46;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 9)
            {
               _loc5_[int(_loc5_.length)] = 46;
            }
         }
         if(get_player().hasPerk(PerkLib.NephilaQueen) && get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 9)
         {
            _loc5_[int(_loc5_.length)] = 47;
            if(get_player().biggestLactation() >= 1)
            {
               _loc5_[int(_loc5_.length)] = 47;
            }
            if(get_player().hasPerk(PerkLib.NephilaQueen) && get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 9)
            {
               _loc5_[int(_loc5_.length)] = 47;
            }
            if(get_player().hasPerk(PerkLib.NephilaQueen) && get_player().statusEffectv1(StatusEffects.ParasiteNephila) > 19)
            {
               _loc5_[int(_loc5_.length)] = 47;
            }
         }
         var _loc15_:Number = int(_loc5_[Utils.rand(int(_loc5_.length))]);
         if(get_monster().get_short().indexOf("minotaur") != -1)
         {
            if(get_player().hasVagina() && get_player().lactationQ() >= 500 && get_player().biggestTitSize() >= 6 && get_player().cowScore() >= 3 && get_player().tail.type == 4)
            {
               _loc15_ = 43;
            }
         }
         var _loc16_:Number = _loc15_;
         if(_loc16_ == 0)
         {
            outputText("你拍了拍你的[ass]");
            if(get_player().butt.rating >= 10 && get_player().tone < 60)
            {
               outputText("，让它诱人地晃动着。");
            }
            else
            {
               outputText("。");
            }
            _loc11_ = true;
         }
         else if(_loc16_ == 1)
         {
            if(int(get_player().breastRows.length) == 1)
            {
               outputText("你撩起上衣，向[themonster]露出你的[breasts]。你诱人地左右摇晃着它们。");
               if(get_player().get_lust100() >= 50)
               {
                  outputText("你的[nipples]似乎在要求[monster.his]的注意。");
               }
            }
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("你撩起上衣，让你那一排排的[breasts]自由地晃动。你诱人地左右摇晃着它们");
               if(get_player().get_lust100() >= 50)
               {
                  outputText("，你的[nipples]清晰可见。");
               }
               else
               {
                  outputText("。");
               }
               _loc13_++;
            }
            _loc6_ = true;
         }
         else if(_loc16_ == 2)
         {
            if(get_player().isTaur())
            {
               outputText("你向毫无防备的敌人疾驰而去，躲过他们的防御并将他们撞倒在地。在他们恢复过来之前，你将你巨大的半人马屁股重重地压在他们身上，在即将用粉碎性的力量将他们压在身下时停了下来。在这个姿势下，你对手的脸正埋在你粗壮的马逼里。你把你的逼在[monster.his]脸上磨蹭了一会儿才站起来。当你站起来时，你很高兴地看到你的敌人身上沾满了你的淫液，散发着强烈的马逼味。");
               _loc13_ += 2;
               _loc14_ += 4;
            }
            else
            {
               outputText("你敞开你的[armor]，露出你的");
               if(int(get_player().cocks.length) > 0)
               {
                  _loc13_++;
                  _loc14_++;
                  if(int(get_player().cocks.length) == 1)
                  {
                     outputText(get_player().cockDescript(0));
                  }
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText(get_player().multiCockDescriptLight());
                  }
                  outputText("和");
                  if(get_player().hasPerk(PerkLib.BulgeArmor))
                  {
                     _loc14_ += 5;
                  }
                  _loc7_ = true;
               }
               outputText(get_player().vaginaDescript(0));
               outputText("。");
            }
            _loc9_ = true;
         }
         else if(_loc16_ == 3)
         {
            if(get_player().isTaur() && get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
            {
               outputText("你发出一声野兽般的嘶鸣，向你的敌人跺着蹄子。他们准备迎接攻击，但你却将前蹄抬离地面，露出挂在腹部下方的粗大马鸡巴。你让它甩来甩去，很快就变得坚硬并达到完全勃起的长度。你挺动臀部，就像在操一匹发情的母马一样，让你的对手知道如果他们屈服于快感会有什么下场……");
               if(get_player().hasPerk(PerkLib.BulgeArmor))
               {
                  _loc14_ += 5;
               }
            }
            else
            {
               outputText("你敞开你的[armor]，露出你的");
               if(int(get_player().cocks.length) == 1)
               {
                  outputText(get_player().cockDescript(0));
               }
               if(int(get_player().cocks.length) > 1)
               {
                  outputText(get_player().multiCockDescriptLight());
               }
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
               if(get_player().hasPerk(PerkLib.BulgeArmor))
               {
                  _loc14_ += 5;
                  _loc13_++;
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText(get_player().vaginaDescript(0));
                  _loc9_ = true;
               }
               outputText("。");
            }
            _loc7_ = true;
         }
         else if(_loc16_ == 4)
         {
            outputText("你转过身，充满诱惑地上下晃动你的[ass]");
            if(get_player().butt.rating >= 10)
            {
               outputText("，让它欢快地摇晃着。[Themonster]甚至瞥见了你臀瓣间的[asshole]。");
               _loc13_ += 3;
            }
            else
            {
               outputText("，让[themonster]好好看清你的[asshole]和" + get_player().vaginaDescript(0) + "。");
               _loc13_++;
               _loc9_ = true;
            }
            _loc11_ = true;
            _loc10_ = true;
         }
         else if(_loc16_ == 5)
         {
            outputText("你向前倾身，向[themonster]展示你" + get_player().allBreastsDescript() + "圆润的曲线。");
            outputText("你用手掌托起它们，淫荡地颠动着，一边表演一边咯咯地笑。你的[armor]一寸一寸地滑落，极其缓慢地褪下，直到你的[nipples]弹了出来。");
            if(get_player().get_lust100() >= 50)
            {
               if(get_player().hasFuckableNipples())
               {
                  _loc13_++;
                  outputText("透明的粘液从里面漏出，很明显它们不仅仅是乳头。");
               }
               else
               {
                  outputText("你坚挺的乳头似乎在要求[monster.his]注意。");
               }
               _loc13_++;
               _loc14_ += 2;
            }
            _loc6_ = true;
         }
         else if(_loc16_ == 6)
         {
            if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
            {
               outputText("你娇羞地敞开你的[armor]并咯咯笑道，[say: 这就是，你想看的吗？]");
            }
            else
            {
               outputText("你娇羞地敞开[armor]，发出撩人的轻哼，[saystart]一想到一个火辣的，");
               if(_loc4_)
               {
                  outputText("扶他");
               }
               else if(get_player().hasPerk(PerkLib.BimboBody))
               {
                  outputText("无脑花瓶");
               }
               else
               {
                  outputText("性感的");
               }
               outputText("身体，你就会兴奋吗？[sayend]");
            }
            if(get_monster().get_plural())
            {
               outputText("当你诱惑地在你的阴唇上上下抚摸时，[Themonster]的目光紧紧盯着你的腹股沟。");
            }
            else
            {
               outputText("当你诱惑地在你的阴唇上上下抚摸时，[Themonster]的目光紧紧盯着你的腹股沟。");
            }
            if(get_player().getClitLength() > 3)
            {
               outputText("你微笑着，你的[clit]从阴唇中肿胀起来，骄傲地挺立着，乞求被触摸。");
            }
            else
            {
               outputText("你微笑着拉开你的下唇，露出你的[clit]，给出了完美的视角。");
            }
            if(get_player().cockTotal() > 0)
            {
               outputText("同时，[eachcock]随着你扭动的臀部前后摆动，为这场表演增添了色彩。");
            }
            if(get_player().hasCock())
            {
               if(get_player().hasPerk(PerkLib.BulgeArmor))
               {
                  _loc14_ += 5;
               }
               _loc7_ = true;
            }
            _loc9_ = true;
         }
         else if(_loc16_ == 7)
         {
            outputText("闪烁的光芒吸引了你的注意，你猛地转过身去检查那个闪闪发光的物体，背对着[themonster]。你锁住膝盖，深深地弯下腰，[chest]在半空中摇晃，而你的[ass]则向[themonster]撅起。你丰满的臀瓣和[hips]形成了一个摇晃的心形，你急切地摩擦着大腿。[pg]");
            outputText("你因兴奋而分泌的清澈温暖的液体从你的下体滴落，将你的[skin]润滑得闪闪发光，充满诱惑。你捡起那个没用但闪亮的小玩意儿，保持姿势多待了一会儿，嘴角挂着一丝狡黠的微笑，再次扭动了一下你的屁股，然后才直起身转过头来。");
            _loc9_ = true;
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 8)
         {
            outputText("你双手叉腰，反复用力，熟练地让你的胸肌交替跳动，跳起了一支肌肉之舞。");
            if(get_player().hasPerk(PerkLib.BroBrains))
            {
               outputText("该死，[themonster]肯定会喜欢这个的！");
            }
            else
            {
               outputText("[Themonster]可能会喜欢这场表演，但你觉得这样做有点傻。");
            }
            _loc13_ += (get_player().tone - 75) / 5;
            _loc14_ += (get_player().tone - 70) / 5;
            _loc12_ = false;
         }
         else if(_loc16_ == 9)
         {
            outputText("你抬起双臂，展示着你那令人难以置信的肌肉，同时露出你最迷人的微笑。");
            if(get_player().hasPerk(PerkLib.BroBrains))
            {
               outputText("[Themonster]无法抗拒如此英勇的姿势！");
            }
            else
            {
               outputText("至少你身体上的物理变化证明是有用的！");
            }
            _loc13_ += (get_player().tone - 75) / 5;
            _loc14_ += (get_player().tone - 70) / 5;
            _loc12_ = false;
         }
         else if(_loc16_ == 10)
         {
            outputText("你向后倾斜，对着[themonster]挺动你的臀部，展示着极其粗俗的姿态。你那鼓胀的、几乎无法掩饰的[cock]轮廓紧紧地压在你的装备上。");
            if(get_player().hasPerk(PerkLib.BroBrains))
            {
               outputText("[monster.he]绝对无法抗拒你巨大的肉棒！");
            }
            else
            {
               outputText("这太粗俗了，但同时，你知道这很可能会有效。");
            }
            outputText("你就这样继续，为了你的敌人的利益而在空气中挺动");
            outputText("的");
            outputText("，试图用你的男根诱惑他们。");
            if(get_player().hasPerk(PerkLib.BulgeArmor))
            {
               _loc14_ += 5;
            }
            _loc7_ = true;
         }
         else if(_loc16_ == 11)
         {
            if(get_silly() && Utils.rand(2) == 0)
            {
               outputText("你摆出大力士般的姿势，绷紧肌肉，对[themonster]低声说道：[say:你练过吗？]。");
            }
            else
            {
               outputText("你解开你的[armor]，刚好让你的[cock]和[balls]自由晃动。一条闪亮的先列腺液从你的肉棒上垂下，表明你的生殖系统和你身体的其他部分一样健康。");
               if(get_player().hasPerk(PerkLib.BroBrains))
               {
                  outputText("母狗们喜欢漏精的肉棒。");
               }
               else
               {
                  outputText("你不得不承认，你下面看起来相当不错。");
               }
            }
            if(get_player().hasPerk(PerkLib.BulgeArmor))
            {
               _loc14_ += 5;
            }
            _loc7_ = true;
         }
         else if(_loc16_ == 12)
         {
            outputText("你伸手向下，抓住一只脚踝并向后拉，将其向上绕过，让脚碰到你的[hair]。你将腿向侧面伸出，透过你的[armor]展示你的" + get_player().vaginaDescript(0) + "。你脸上毫无不适的表情以及你轻松摆出姿势的样子，向[themonster]展示了和你在一起会有多开心。");
            _loc9_ = true;
            if(get_player().thickness < 33)
            {
               _loc13_++;
            }
            else if(get_player().thickness >= 66)
            {
               _loc13_--;
            }
            _loc14_ += (get_player().thickness - 50) / 10;
         }
         else if(_loc16_ == 13)
         {
            outputText("你向后倾斜，假装晕倒，同时将一只手压在后腰上。这个姿势让你巨大、怀孕的肚子向前突出，让那闪亮的球形肚子看起来更大。伴随着挑逗的呻吟，你轻轻抚摸着突出的肚子，轻轻咬着嘴唇，透过半闭的眼睛盯着[themonster]。[say: 所有的这些雌激素让我变得很饥渴，]你呻吟着，抚摸的手逐渐移向你大孕肚的南半球。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("你的另一只手移开以露出你的[chest]，托住并挤压出一股乳汁，顺着你的[armor]前面流下。[say: 帮帮妈妈吧。][pg]");
               _loc13_ += 2;
               _loc14_ += 4;
            }
            if(get_player().get_pregnancyIncubation() < 100)
            {
               _loc13_++;
               _loc14_ += 2;
            }
            if(get_player().get_pregnancyIncubation() < 50)
            {
               _loc13_++;
               _loc14_ += 2;
            }
         }
         else if(_loc16_ == 14)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("你撕开自己的[armor]，将几根手指滑入你那被人操过无数次的骚穴，让你的对手好好看看他们错过了什么。 [say: 来吧，种马，] 你说，声音里满是欲望与渴求， [say: 到妈妈[name]这儿来，用你的大鸡巴干我的骚穴，直到你的精液像洪水一样涌出来。我想要你的孩子在我体内，我想要你的种从这骚穴里爬出来，求着我的奶喝。来吧，把我操到怀孕！]");
            }
            else
            {
               outputText("你对着敌人扭动你的[hips]，让他们长时间、充满诱惑地看着这孕育过无数后代的臀部。[say:哦，喜欢你看到的吗，坏男孩？那为什么不直接过来，把那根肉棒塞进我身体里呢？给我你的种子，我会给你生下非——常漂亮的后代。哦？这让你兴奋了吗？确实如此！来吧，放纵一下，用你的宝宝把我操满吧！]");
            }
            _loc13_ += 2;
            _loc14_ += 4;
            if(get_player().get_inHeat())
            {
               _loc13_ += 2;
               _loc14_ += 4;
            }
            _loc9_ = true;
         }
         else if(_loc16_ == 15)
         {
            if(get_player().biggestTitSize() > 1 && get_player().hasVagina() && Utils.rand(2) == 0)
            {
               outputText("你闭上眼睛，身子前倾，将一只手伸进你的" + Utils.cnName(get_player().get_armorName()) + "下。当你的手指找到你那流着口水的蜜壶时，你发出了最轻微的喘息，温暖的指尖一个接一个地戳进你肿胀的阴唇之间。当你抽出手时，你的手指已经被你小穴里滴落的激情浸透，半透明的水珠滚落下来，弄湿了你的手掌。你用另一只手拉下你的[armor]的上半部分，向[themonster]露出你的[chest]。[pg]");
               outputText("你将沾满淫液的手伸向你的[nipples]，你那像小穴一样的乳头柔软的肉在挑逗的手指前分开。用你自己的淫水作为额外的润滑剂，你的手指在乳头里抽插着，当你逐渐增加手指的数量，直到只剩下拇指来抚摸你过度刺激的胸部发炎的肉时，你呻吟着。你的喉咙发出了最微弱的近乎高潮的欢愉尖叫，你喘着粗气，抽出手，重新整理好你的护甲。[pg]");
               outputText("尽管你很安静，但很明显，你发出的每一个淫荡、绝望的声音都被[themonster]听到了。");
               _loc13_ += 2;
               _loc14_ += 4;
            }
            else if(get_player().biggestTitSize() > 1 && Utils.rand(2) == 0)
            {
               outputText("你猛地扯下[armor]的上半部分，露出你的" + get_player().chestDesc() + "和上面张开的乳头小穴。你带着淫荡的坏笑，将两根手指滑入你[chest]的乳头中，将乳头小穴的阴唇拉宽，露出里面长而紧致的通道。你用手指操着你的乳头小穴，给你的敌人上演了一出好戏，然后重新穿上护甲，让你那张开的乳头小穴的诱人画面在敌人的脑海中挥之不去。");
               _loc13_++;
               _loc14_ += 2;
            }
            else
            {
               outputText("你脱下[armor]的前面，露出你的[chest]。你用双手将两根手指插入你的乳头小穴，乳白色的淫水浸透了你的双手和手指。[say: 你不想也试试这些洞吗？]");
            }
            _loc6_ = true;
         }
         else if(_loc16_ == 16)
         {
            outputText("你迅速脱下[armor]并转过身，用力拍打了一下你的[ass]，向敌人展示真正的战利品：你的[asshole]。你带着坏笑，轻松地将手插进去，直到手腕都没入你的肛门。你快速地给自己来了一次拳交，一边越过肩膀看着敌人，一边淫荡地呻吟，确保给他们一场好戏。你抽出手，又性感地拍了一下屁股，然后再次准备战斗。");
            _loc10_ = true;
            _loc11_ = true;
         }
         else if(_loc16_ == 17)
         {
            outputText("你转过身，褪去腰间的[armor]，向[themonster]露出你的[ass]。你用双手托起你那巨大的蜂娘腹部，举起它并挑逗地挥舞着。毒液滴滴答答地落下，有几滴危险地靠近了[monster.him]。[say: 也许如果你表现得够好，我甚至会在你的肚子里产下几枚卵，]你轻声说道，然后放下腹部让它悬垂在你的屁股上方，并重新穿好衣服。");
            _loc11_ = true;
            _loc13_ += 0.5;
            _loc14_ += 0.5;
         }
         else if(_loc16_ == 18)
         {
            outputText("你像一只" + (get_player().wolfScore() > get_player().dogScore() ? "狼" : "狗") + "一样坐下，你的[legs]张开，露出你的");
            if(get_player().hasVagina())
            {
               outputText("分开的阴唇");
            }
            else
            {
               outputText("紧缩的肛门，悬垂的、勃起的阳具，");
            }
            outputText("，双手撑在身前。你吐出舌头，大口喘着粗气，保证会做一个乖巧的小母狗。");
            _loc9_ = true;
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 19)
         {
            outputText("你确保吸引了敌人的注意力，然后缓慢而有条理地让舌头滑过你丰满的嘴唇。留在它们丰满美丽上的闪亮水分诉说着深深的欲望和更深的喉咙。你眨了几下长长的睫毛，将它们撅起，送出一个俏皮的飞吻，并伴随着一声轻微的呻吟。你美丽的女性特征暗示着激动人心的激情时刻，仅凭你的脸就能让别人兴奋起来。");
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 20)
         {
            outputText("当你的敌人注视着你时，你意识到他们的注意力集中在你的上半身。你向前挺起强壮的下巴，展示你轮廓分明的下巴，英俊的五官标志着你是一个完美无瑕的标本。你转动宽阔的肩膀，向敌人点点头。你散发出的强大、威严的存在感可以融化冰冷修女的心。你完美的男子气概说明了你的自信，让你仅凭你的脸就能让别人兴奋起来。");
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 21)
         {
            outputText("你伸出手，顺着你精致、雌雄同体的五官抚摸。拥有男人的力量，却又有着女人的精致，看着你的眼睛会让人产生一种诱人的神秘感。你向敌人送出一个简短的飞吻，同时散发出一种令人性奋的自信。没有人能通过看你的五官来辨别你的性别，它们所激发的强烈好奇心仅凭你的脸就能让别人兴奋起来。");
            _loc14_ -= 3;
         }
         else if(_loc16_ == 22)
         {
            outputText("你向后伸手，从你蜘蛛般的腹部挤出一些湿润的丝，展示给[themonster]，在[monster.he]好奇的注视下塑造着这种粘性物质。片刻之后，你举起一个丝制的心形雕塑，眨了眨眼，把它扔向[monster.him]。它粘在[monster.his]的身上，这种感觉让[monster.him]急忙把心拍掉。" + get_monster().mf("He","She") + "把[monster.his]的目光转回你身上，发现你转过身来，露出了[ass]，腹部慵懒地弹跳着。[say: 我想知道如果我在里面产下一些卵后把你的洞用网封住会发生什么？]你调皮地嘶嘶说道。" + get_monster().mf("He","She") + "咽了口唾沫。");
            _loc11_ = true;
         }
         else if(_loc16_ == 23)
         {
            if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0 && get_player().longestHorseCockLength() >= 12)
            {
               outputText("你掏出巨大的马屌，立刻被一股浓烈、令人头晕目眩的麝香所包围。你的敌人一阵晕眩，在你的气味攻势下几乎要跪倒在地。你咧嘴一笑，抓住她的肩膀，强迫她跪下。在她来得及防御之前，你把马屌拍在她的头上，在她的脸上来回摩擦，她的鼻子就像飞机杯里性感的凸起。你操了她的脸——字面意思上的——片刻之后，把她推开并收起了肉棒。");
            }
            else
            {
               outputText("你对眼前这个美味、可以受孕的小穴充满了无法抑制的欲望，气喘吁吁地用非人发情期带来的力量扯下你的[armor]，并迅速向敌人挥舞你完全勃起的肉棒。她眼中闪过一丝情欲，很快就感受到了你男人麝香的醉人效果。你冲上前去，趁着她发情的状态抓住了她的肩膀。");
               outputText("在她来得及反应之前，你把她按倒，直到她与你的肉棒齐平，然后开始转圈甩动它，用你散发着麝香的男根直直地拍打她的脸。当你用肉棒抽打她的脸时，她的眼神迷离，试图跟上你甩屌的动作！心满意足后，你放开她，准备战斗！");
            }
            _loc7_ = true;
         }
         else if(_loc16_ == 24)
         {
            outputText("你将法杖插在地上，舌头舔过嘴唇。在敌人反应过来之前，你已经转身上了这根长长的木杆，把它当成一根临时的钢管。你向后靠在插好的法杖上，让敌人好好欣赏你的身体。你像猫一样向后伸展，指尖几乎触到了身下的地面，现在只用一条腿勾住法杖。你把自己拉直，轻轻拍了一下你的" + get_player().buttDescript() + "，并抖动了一下你的[chest]，然后拉开你的" + Utils.cnName(get_player().get_armorName()) + "，让木杆滑入你的双乳之间。你蹲下身子，只用手遮住你的生殖器，同时调皮地摇晃着你的[ass]。你对着敌人微微一笑，重新穿上你的[armor]，拿起你的法杖。");
            _loc11_ = true;
            _loc6_ = true;
         }
         else if(_loc16_ == 25)
         {
            outputText("你贴近敌人，灵巧地闪过[monster.his]的防御一击，随后直接凑到[monster.his]面前，让[monster.him]好好饱览一下你的乳沟。你微笑着，[say:嘿，小" + get_monster().mf("家伙","妞儿") + "，]没等[monster.he]反应过来，你就一把抓住[monster.him]，把[monster.his]的脸埋进你的[fullchest]里，差点让[monster.him]在你的乳沟峡谷里窒息。" + get_monster().mf("他","她") + "挣扎了一会儿，你在[monster.his]头上轻轻一吻，然后退后一步，摆出战斗架势。");
            _loc6_ = true;
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 26)
         {
            outputText("趁着战斗的间隙，你将[weapon]插在地上，让魔力在体内流淌。你召唤出一丝魔力，凝聚成一个缓慢变大的黑色浓稠欲望之球。你在身前挥舞着这个球，跳起了一段小小的脱衣舞，慢慢地用潜藏的性爱魔法浸透了这片区域。");
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 27)
         {
            outputText("你向[themonster]展示你那胀满乳汁的双乳，并说道：[say: 难道你不想躺在我的怀里，享受我能给你的一切吗？]");
            _loc6_ = true;
            _loc13_++;
            _loc14_++;
         }
         else if(_loc16_ == 28)
         {
            outputText("你侧过身，让[themonster]看清你的全身。你问他们下课后是否需要一堂私人的性爱辅导课。");
            _loc11_ = true;
         }
         else if(_loc16_ == 29)
         {
            outputText("你把玩着衣服上的系带，问[themonster]到底有多想看他们的老师把它们扯下来？");
            _loc13_++;
            _loc14_ += 3;
         }
         else if(_loc16_ == 30)
         {
            outputText("你前后摇摆着身体，为[themonster]跳起了一段色情的舞蹈。");
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 31)
         {
            outputText("你向后仰起身子，大声宣布：[say: 这匹马已经准备好被骑了，一整夜都没问题！]");
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 32)
         {
            outputText("你背对着敌人，掀起屁股上的布料片刻。你下半身能提供的确实只有你的[ass]了。");
            _loc11_ = true;
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 33)
         {
            outputText("你摆出一系列姿势，强调你那暴露胯部的衣服所展示的内容，同时询问你的[master]是否想品尝一下展示的东西。");
            _loc13_ += 2;
            _loc14_ += 4;
         }
         else if(_loc16_ == 34)
         {
            outputText("你向[themonster]行了一个相当露骨的屈膝礼，并问他们你的[master]今天是否对其他服务感兴趣。");
            _loc13_++;
            _loc14_ += 2;
            _loc6_ = true;
         }
         else if(_loc16_ == 35)
         {
            outputText("你拨开胯部的布料片刻，然后问[themonster]，" + get_player().mf("主人","女主人") + "是否想让你用你的[cocks]伺候他们？");
            _loc7_ = true;
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 36)
         {
            outputText("你拉开拘束服上的一根带子，然后让它弹回去。[say:我需要一些医疗护理，有兴趣吗？]你调戏道。");
            _loc14_ += 2;
            _loc13_++;
         }
         else if(_loc16_ == 37)
         {
            outputText("你娇羞地撅起嘴唇，调皮地眯起眼睛，用火热的诱惑眼神向[themonster]招手。你向前漫步，将臀部向一侧翘起，摆出一个卖弄风骚的姿势，用" + (get_player().tail.venom > 1 ? "你的一条尾巴" : "你的尾巴") + "在[monster.his]身上性感地上下游走。");
            _loc13_ += 6;
            _loc14_ += 3;
         }
         else if(_loc16_ == 38)
         {
            outputText("你舔了舔嘴唇，眯起眼睛，露出一种炽热、饥渴的目光。你舔了舔食指的指尖，让它缓慢而性感地顺着你的[armor]前面滑下，挑逗地沿着你的[chest]的曲线移动。你用拇指勾住上衣，以极其缓慢的速度将其向下拉。就在你的[nipples]弹出来的瞬间，你的尾巴交叉在前面，挡住了[themonster]的视线。");
            _loc6_ = true;
            _loc13_++;
            _loc14_++;
         }
         else if(_loc16_ == 39)
         {
            outputText("你向前倾身，深深地鞠了一躬，将一只手举到唇边，向[themonster]飞吻。你站直身子，诱惑地前后扭动着你的[hips]，同时手指缓慢地顺着你的身前滑下，端庄地撅起嘴。你的");
            if(get_player().tail.venom == 1)
            {
               outputText("的尖端");
            }
            else
            {
               outputText("一条");
            }
            outputText("浓密的尾巴卷在你的[leg]上，然后像鞭子一样甩开，在空气中发出一声清脆的爆裂声。");
            _loc11_ = true;
            _loc13_++;
            _loc14_++;
         }
         else if(_loc16_ == 40)
         {
            outputText("你转过身，从肩膀上方娇羞地看着[themonster]，含情脉脉地眨着眼睛。");
            if(get_player().tail.venom == 1)
            {
               outputText("你的尾巴扭动着，甩来甩去，在你的[hips]周围缓慢地划出一道弧线，当你慢慢掀起你的[armor]时，恰到好处地衬托出你的臀部。");
            }
            else
            {
               outputText("你的尾巴散开，性感地扭动和甩动着，在你的[legs]上下滑动，当你慢慢掀起你的[armor]时，恰到好处地衬托出你的臀部。");
            }
            outputText("当你的[butt]显露出来时，你用尾巴拂过它，半遮半掩，极尽挑逗之能事。");
            _loc11_ = true;
            _loc10_ = true;
            _loc13_++;
            _loc14_ += 2;
         }
         else if(_loc16_ == 41)
         {
            outputText("你娇媚地笑着，左右摇摆，舌头诱惑地舔过上排牙齿。你将拇指勾进[armor]，将其拉开，半露出了");
            if(get_player().cockTotal() > 0)
            {
               outputText(get_player().sMultiCockDesc());
            }
            if(get_player().get_gender() == 3)
            {
               outputText("和");
            }
            if(get_player().get_gender() >= 2)
            {
               outputText("你的" + get_player().vaginaDescript(0));
            }
            outputText("。你毛茸茸的尾巴" + (get_player().tail.venom > 1 ? "" : "") + "在身前交叉" + (get_player().tail.venom > 1 ? "" : "") + "，缠绕在你的下体上，充满挑逗地遮挡住了视线。");
            _loc9_ = true;
            _loc7_ = true;
            _loc14_ += 2;
            _loc13_++;
         }
         else if(_loc16_ == 42)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("你掀起裙子，向对手展示你那巨大的马根，它已经完全出鞘并滴落着先列腺液。[say:来吧；如果你想要的话，我这里有足够大的扶他肉棒给你！]你大喊道。");
               _loc7_ = true;
               _loc14_ += 3;
               _loc13_--;
            }
            else
            {
               outputText("你半转过身，然后弯下腰，用最轻浮的姿态左右摇晃着尾巴，诱惑地扭动着臀部，裙摆随着动作飘动。[say:来吧，你还在等什么？这可是个极品美臀，]你咧嘴一笑，用力拍了一下自己的屁股，发出一声清脆的响声。");
               _loc11_ = true;
               _loc13_ += 2;
               _loc14_ += 3;
            }
         }
         else if(_loc16_ == 43)
         {
            _loc17_ = Utils.rand(7);
            if(_loc17_ == 0)
            {
               outputText("你把手托在下巴下面，用手臂将你那巨大沉重的乳房挤在一起。乳汁从你挺立的乳头中喷射而出，空气中弥漫着浓郁香甜的气味。");
               _loc6_ = true;
               _loc13_ += 2;
               _loc14_++;
            }
            else if(_loc17_ == 1)
            {
               outputText("你呻吟着向前弯下腰，丰满的乳房几乎碰到了地面，同时你左右摇晃着你的[hips]。你半眯着迷离的双眼向上看，微启双唇舔了舔，发出一声低沉而充满情欲的[say:哞哞……]");
               _loc6_ = true;
               _loc13_ += 2;
               _loc14_ += 2;
            }
            else if(_loc17_ == 2)
            {
               outputText("你把一根手指放在唇边，无辜地眨了眨眼，然后甩了甩尾巴，将你");
               if(get_player().wetness() >= 3)
               {
                  outputText("滴着淫液的");
               }
               outputText("下体的气味散发到空气中。");
               _loc9_ = true;
               _loc13_++;
               _loc14_++;
            }
            else if(_loc17_ == 3)
            {
               outputText("你托起乳房，手指张开按在[nipples]上，用力挤压。乳汁顺着你的手和乳房巨大的曲线流下，甜美粘稠的乳汁浸透了你的胸前。");
               _loc6_ = true;
               _loc13_ += 3;
               _loc14_++;
            }
            else if(_loc17_ == 4)
            {
               outputText("你把巨大的乳房举到嘴边，大声地吸吮着自己，最后伴随着“啵”的一声松开乳头，发出一声响亮而满足的喘息，乳汁顺着你的下巴流了下来。");
               _loc6_ = true;
               _loc13_++;
               _loc14_ += 3;
            }
            else if(_loc17_ == 5)
            {
               outputText("你蹲下身子，让乳房在身前垂下。双手轮流抚摸着它们，慢慢地将乳汁挤到大腿上，白色的浓稠乳汁溅落在你的臀部和私处。");
               _loc9_ = true;
               _loc6_ = true;
               _loc13_++;
            }
            else
            {
               outputText("你将一只乳房举到嘴边，深深地吸了一大口自己的乳汁，然后仰起头。伴随着一声低吟，你让乳汁顺着身前流下，在双乳之间蜿蜒流淌，直到从你的胯下甜美地滴落。");
               _loc9_ = true;
               _loc6_ = true;
               _loc14_ += 2;
            }
            if(get_monster().get_short().indexOf("minotaur") != -1)
            {
               _loc14_ += 6;
               _loc13_ += 3;
            }
         }
         else if(_loc16_ == 44)
         {
            _loc17_ = Utils.rand(5);
            _loc14_ += 5;
            _loc13_ += 3;
            if(_loc17_ == 0)
            {
               outputText("你自信地向前走去，挺起胸膛，弓起背，以凸显你的[chest]。你慢慢地开始前后摇晃你的躯干，让你被锁子甲包裹的乳房一次又一次地拍打在一起。你的一只手摸索到那片柔软的区域并抓住它，手指透过精细的锁子甲陷入柔软的乳房中。你停止摇晃，用手指顺着暴露在外的乳沟中心划下，问道，[say:难道你不想依偎在里面吗？]");
               _loc6_ = true;
            }
            else if(_loc17_ == 1)
            {
               outputText("你蹦蹦跳跳地来到[themonster]面前，转过身，将你几乎没被遮住的屁股在[monster.him]身上摩擦。在[monster.he]反应过来之前，你正慢慢地将你的[butt]在[monster.his]腹股沟上上下弹跳。当[monster.he]伸手向下时，你抓住[monster.his]手，将它向上按，伸进你的裙子下面，紧紧贴在你性器上那热气腾腾的封印上。你那势不可挡的欲望所散发出的沸腾热量，甚至能让[monster.him]透过贴身的皮革感觉到，你让[monster.him]在你的[leg]内侧划过片刻，然后笑着跳开。");
               _loc11_ = true;
               _loc9_ = true;
            }
            else if(_loc17_ == 2)
            {
               outputText("你掀起那条你称之为裙子的、几乎起不到遮羞作用的锁子甲，向[themonster]露出你的丁字裤。你慢慢地摇晃着你的[hips]，将一根手指按在有折痕的裆部护甲上，夸张地发出一声淫荡的呻吟，变成一声充满诱惑和性愉悦的低沉呼噜声。你的目光与[monster.his]相遇，你低声耳语道，[saystart]");
               if(get_player().hasVirginVagina())
               {
                  outputText("觉得你能承受一个处女无尽的欲望吗？");
               }
               else
               {
                  outputText("觉得你有能力满足这个完美的小穴吗？");
               }
               outputText("[sayend]");
               _loc9_ = true;
               _loc14_ += 3;
            }
            else if(_loc17_ == 3)
            {
               outputText("你风情万种地扭动着身子来到[themonster]面前，在[monster.he]对你淫荡的举动做出反应之前，你猛地抬起一条[leg]，如果不是你只是把它抬起来把[foot]放在[monster.his]肩膀上，这本该是一记凶狠的踢击。你的大腿张开得如此完美，你的裙子被掀起，[themonster]可以完美地看到你被丁字裤凸显的骆驼趾，以及在你那不太端庄的遮蔽物边缘凝结的水珠。");
               _loc9_ = true;
            }
            else
            {
               outputText("你弯下腰，把你的[butt]高高撅起。你那几乎没被遮住的屁股大部分都暴露在外，但锁子甲裙的下摆仍然保护着你肛门的一点点端庄。但这并没有持续多久。你开始以一种听不见的节奏上下前后摇晃你的[butt]，把那毫无意义的遮蔽物甩开，这样[themonster]就可以凝视你曲线优美的臀部，欣赏它所有华丽的细节。你的一部分希望[monster.he]能注意到你丁字裤背面的复杂花丝，尽管在[monster.him]看来，那就像是雪白背景上的一堆闪闪发光的箭头，全都直指你的[asshole]。");
               _loc11_ = true;
               _loc13_ += 2;
            }
         }
         else if(_loc16_ == 45)
         {
            _loc18_ = [];
            _loc18_[int(_loc18_.length)] = 0;
            if(get_player().get_gender() == 1 && !get_player().isTaur())
            {
               _loc18_[int(_loc18_.length)] = 1;
            }
            if(get_player().get_gender() == 2 && !get_player().isTaur())
            {
               _loc18_[int(_loc18_.length)] = 2;
            }
            if(get_player().get_gender() == 3 && get_player().hasVagina() && !get_player().isTaur())
            {
               _loc18_[int(_loc18_.length)] = 3;
            }
            switch(int(_loc18_[Utils.rand(int(_loc18_.length))]))
            {
               case 0:
                  outputText("你把手放在覆盖着忘忧石的肚子上，将手向上滑过肚子，移向你的[chest]。利用胸甲上的小开口，你捏弄并揉捏着你暴露在外的[nipples]。");
                  _loc6_ = true;
                  _loc13_ += 3;
                  _loc14_++;
                  break;
               case 1:
                  outputText("你把手移向你的[cocks]，没有受到忘忧石的阻碍。你好好地撸动了一下你的[cock]，并前后摇晃你的臀部，强调你的男子气概。");
                  _loc7_ = true;
                  _loc13_++;
                  _loc14_ += 2;
                  break;
               case 2:
                  outputText("你把手移向你的[pussy]，没有受到忘忧石的阻碍。你好好地挑逗了一下你的[clit]，用手指抠弄你的[pussy]，并前后摇晃你的臀部，强调你的女性魅力。");
                  _loc9_ = true;
                  _loc13_++;
                  _loc14_ += 2;
                  break;
               case 3:
                  outputText("你把手移向你的[cocks]和[pussy]，没有受到忘忧石的阻碍。你好好地撸动了一下你的[cock]，挑逗你的[clit]，并前后摇晃你的臀部，强调你的双性特征。");
                  _loc7_ = true;
                  _loc9_ = true;
                  _loc13_++;
                  _loc14_ += 3;
                  break;
               default:
                  outputText("哎呀，出错了！请告诉Kitteh6660！不管怎样，你上演了一场挑逗秀。");
            }
         }
         else if(_loc16_ == 46)
         {
            outputText("你向后靠去，假装要晕倒，同时将一只手按在后腰上。这个姿势让你那因寄生虫而肿胀的巨大肚子向前突出，让那闪亮的球形胃部看起来更大了。伴随着一声挑逗的呻吟，你轻轻地抚摸着突出的肚子，轻轻咬着嘴唇，透过半闭的眼睛盯着[themonster]。[say:我的宝宝们饿了，]你呻吟着，抚摸的手逐渐移向你那令人衰弱的巨大“孕肚”的南半球。");
            if(get_player().biggestLactation() >= 1)
            {
               outputText("你的另一只手移开，露出你的[chest]，托起并挤压出一股乳汁，顺着你的[armor]前面流下。[say:每次它们吃东西，都会把我填得越来越满。你不喂喂它们吗？][pg]");
               _loc13_ += 2;
               _loc14_ += 4;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) > 4)
            {
               _loc13_++;
               _loc14_ += 2;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) > 9)
            {
               _loc13_++;
               _loc14_ += 2;
            }
         }
         else if(_loc16_ == 47)
         {
            if(get_player().hasPerk(PerkLib.NephilaQueen))
            {
               outputText("你让你的宝宝们把你向前滚，这样你就可以顺着你巨大肚子的弧度俯视[themonster]，你咬着下唇，透过半闭的眼睛打量着它们。[say:<b>哦哦哦哦哦哦</b>，宝贝，]你呻吟着，当你趴在上面时，抚摸的双手在你巨大的“孕肚”的顶部两侧盘旋，[say:妈妈的胃口被吊得<b>这么</b>大。][pg]");
               outputText("寄生在你子宫里的史莱姆成群结队地从你体内涌出，在你巨大的母性隆起的宽阔曲线上上下翻滚。你从肚子上摘下一个特别喜欢冒险的史莱姆，把它拿到脸前，亲吻它；然后，给了[themonster]一个意味深长的眼神，你开始深喉这个阴茎形状的生物，当它在你的嘴唇间扭动时，你像个荡妇一样吸吮着。");
            }
            if(get_player().hasPerk(PerkLib.NephilaQueen) && get_player().biggestLactation() >= 1)
            {
               outputText("你的另一只手移开，露出你的[chest]，托起并挤压出一股乳汁，顺着你巨大的隆起前面流下，你的触手宝宝们在你的乳沟间钻进钻出，蹂躏着你的乳头，让你分泌的乳汁洪流浸透了所有参与其中的人。[pg]");
               _loc13_ += 2;
               _loc14_ += 6;
            }
            if(get_player().hasPerk(PerkLib.NephilaQueen) && get_player().statusEffectv1(StatusEffects.ParasiteEel) < 20)
            {
               outputText("当你觉得你已经给你的对手上演了一场足够令人满意的表演时，你把触手孩子从嘴里放出来，小心翼翼地把它放回你肚子的侧面。它接着在你隆起的肚子上嬉戏，穿过你的[ass]，钻回你的[cunt]里，去享受一个当之无愧的小憩。当你体内目前仍然装满的其他幼崽因为这次入侵而躁动时，你那占据了整个房间的肚子发出了不祥的隆隆声，但你很快就准备好再次战斗了。[pg]");
               _loc13_++;
               _loc14_ += 2;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteEel) > 19)
            {
               outputText("当你觉得已经给对手展示了足够令人满意的表演后，你将触手从嘴里松开，小心翼翼地放回你的腹侧。它接着欢快地爬过你隆起的腹部，穿过你的[ass]，钻回你的[cunt]里去睡个好觉。你那谷仓般巨大的肚子随着你的动作震颤着，你嘘声安抚着你庞大的子嗣，拍了拍你能够到的那一点点肚皮，试图让它们平静下来，以便你能回到战斗中。你的对手呆呆地盯着你，看着你的举动和那庞大无比的体型。[pg]");
               _loc13_++;
               _loc14_ += 4;
            }
         }
         else
         {
            outputText("你性感地扭动着身体。（发生错误。）");
         }
         _loc16_ = 0;
         var _loc19_:Number = 0;
         if(_loc12_)
         {
            if(_loc6_)
            {
               if(get_player().bRows() > 1)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().bRows() > 2)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().bRows() > 4)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestLactation() >= 2)
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
               if(get_player().biggestLactation() >= 3)
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
               if(get_player().biggestTitSize() >= 4)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestTitSize() >= 7)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestTitSize() >= 12)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestTitSize() >= 25)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestTitSize() >= 50)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hasFuckableNipples())
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
               if(get_player().averageNipplesPerBreast() > 1)
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
            }
            if(_loc9_)
            {
               if(get_player().hasVagina() && get_player().wetness() >= 2)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hasVagina() && get_player().wetness() >= 3)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hasVagina() && get_player().wetness() >= 4)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hasVagina() && get_player().wetness() >= 5)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hasVagina())
               {
                  if(get_player().getClitLength() > 1.5)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
                  if(get_player().getClitLength() > 3.5)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
                  if(get_player().getClitLength() > 7)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
                  if(get_player().getClitLength() > 12)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
               }
               if(get_player().vaginalCapacity() >= 30)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().vaginalCapacity() >= 70)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().vaginalCapacity() >= 120)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().vaginalCapacity() >= 200)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
            }
            if(_loc7_)
            {
               if(get_player().cockTotal() > 1)
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
               if(get_player().biggestCockArea() >= 15)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestCockArea() >= 30)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestCockArea() >= 60)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().biggestCockArea() >= 120)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().cumQ() >= 50)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().cumQ() >= 150)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().cumQ() >= 300)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().cumQ() >= 1000)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(_loc8_)
               {
                  if(get_player().balls > 2)
                  {
                     _loc16_++;
                     _loc19_ += 2;
                  }
                  if(get_player().ballSize > 3)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
                  if(get_player().ballSize > 7)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
                  if(get_player().ballSize > 12)
                  {
                     _loc16_ += 0.5;
                     _loc19_++;
                  }
               }
               if(get_player().biggestCockArea() < 8)
               {
                  _loc16_--;
                  _loc19_ -= 2;
                  if(get_player().biggestCockArea() < 5)
                  {
                     _loc16_--;
                     _loc19_ -= 2;
                  }
               }
            }
            if(_loc11_)
            {
               if(get_player().butt.rating >= 6)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().butt.rating >= 10)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().butt.rating >= 13)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().butt.rating >= 16)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().butt.rating >= 20)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hips.rating >= 6)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hips.rating >= 10)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hips.rating >= 13)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hips.rating >= 16)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().hips.rating >= 20)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
            }
            if(_loc10_)
            {
               if(get_player().ass.analLooseness == 0)
               {
                  _loc16_ += 1.5;
                  _loc19_ += 3;
               }
               if(get_player().ass.analWetness > 0)
               {
                  _loc16_++;
                  _loc19_ += 2;
               }
               if(get_player().analCapacity() >= 30)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().analCapacity() >= 70)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().analCapacity() >= 120)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().analCapacity() >= 200)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().ass.analLooseness == 4)
               {
                  _loc16_ += 0.5;
                  _loc19_++;
               }
               if(get_player().ass.analLooseness == 5)
               {
                  _loc16_ += 1.5;
                  _loc19_ += 3;
               }
            }
            if(_loc16_ > 5)
            {
               _loc16_ = 5;
            }
            if(_loc19_ > 10)
            {
               _loc19_ = 10;
            }
         }
         if(Utils.rand(100) <= _loc13_ + Utils.rand(_loc16_))
         {
            _loc14_ *= 0.7;
            _loc19_ *= 0.7;
            if(get_player().hasPerk(PerkLib.HistoryWhore))
            {
               _loc14_ *= 1.15;
               _loc19_ *= 1.15;
            }
            if(get_player().hasPerk(PerkLib.ChiReflowLust))
            {
               _loc14_ *= 1.1;
            }
            if(get_player().hasPerk(PerkLib.AscensionSeduction))
            {
               _loc14_ *= 1 + get_player().perkv1(PerkLib.AscensionSeduction) * 0.05;
            }
            if(get_monster().get_plural())
            {
               _loc14_ *= 1.3;
            }
            _loc14_ = (_loc14_ + Utils.rand(_loc19_)) * get_monster().lustVuln;
            if(get_monster() is JeanClaude)
            {
               get_monster().handleTease(_loc14_,true);
            }
            else if(get_monster() is Doppelganger && !get_monster().hasStatusEffect(StatusEffects.Stunned))
            {
               get_monster().mirrorTease(_loc14_,true);
            }
            else if(!param1)
            {
               get_monster().teased(_loc14_);
            }
            if(get_game().ceraphScene.hasExhibition() && !get_game().urtaQuest.isUrta())
            {
               if(get_player().get_lust100() < 75)
               {
                  outputText("\n这样卖弄你的身体让你感到有些燥热难耐。");
               }
               else
               {
                  outputText("\n如果你继续暴露自己，你会变得太发情而无法还击。这种暴露癖让你很难忍住不脱光衣服直接投降。");
               }
               if(!param1)
               {
                  dynStats(DynStat.Lust(2 + Utils.rand(3)));
               }
            }
            if(!param1 && !get_game().urtaQuest.isUrta())
            {
               get_player().masteryXP(MasteryLib.Tease,1 + Utils.rand(9));
            }
         }
         else
         {
            if(!param1 && !get_game().urtaQuest.isUrta())
            {
               get_player().masteryXP(MasteryLib.Tease,4 + Utils.rand(33));
            }
            if(get_monster() is JeanClaude)
            {
               get_monster().handleTease(0,false);
            }
            else if(get_monster() is Doppelganger)
            {
               get_monster().mirrorTease(0,false);
            }
            else if(!param1)
            {
               outputText("\n[Themonster]似乎无动于衷。");
            }
         }
         outputText("[pg]");
      }
   }
}

