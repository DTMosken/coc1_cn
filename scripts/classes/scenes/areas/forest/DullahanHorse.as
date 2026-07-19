package classes.scenes.areas.forest
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Weapon;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import flash.Boot;
   import haxe.IMap;
   
   public class DullahanHorse extends Monster
   {
      
      public var isCharging:Boolean;
      
      public var couchedLanceSpeedBonus:int;
      
      public function DullahanHorse()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         couchedLanceSpeedBonus = 0;
         isCharging = false;
         super();
         extraDistance = 2;
         distance = CombatDistance.Distant;
         set_a("");
         set_short("Dark Knight");
         imageName = "dullahan";
         set_long("在战场上骑着黑马飞驰的是一名披着斗篷的骑士。你看不清它的任何特征，尽管它显然是人形。它挥舞着一把巨大的镰刀，再加上它那匹速度极快的坐骑，使它成为一个极其可怕的对手。你看不见它的脸，但每当你看着它脸应该在的地方时，你的脊背就会发凉。");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("E"));
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(60);
         hips.rating = 2;
         butt.rating = 4;
         skin.tone = "pale blue";
         skin.type = 0;
         hair.color = "white";
         hair.length = 20;
         initStrTouSpeInte(85,70,100,60);
         initLibSensCor(40,50,15);
         set_weaponName("rapier");
         set_weaponVerb("lunge");
         set_weaponAttack(14);
         set_armorName("black and gold armor");
         set_armorDef(17);
         bonusHP = 380;
         set_lust(25 + Utils.rand(15));
         lustVuln = 0;
         temperment = 1;
         level = 18;
         set_gems(30);
         set_drop(new WeightedChoice());
         special1 = knightCharge;
         createPerk(PerkLib.Immovable);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().forest.dullahanScene.dullahanVictory();
      }
      
      override public function performCombatAction() : void
      {
         knightCharge();
      }
      
      public function moveDistant(param1:int) : void
      {
         var _loc2_:Boolean = extraDistance == 0 || get_player().get_weapon().isRanged() || get_player().get_weapon().isChanneling();
         if(_loc2_)
         {
            get_game().combatRangeData.moveMonsterDistant(this);
         }
         else
         {
            get_game().combatRangeData.moveDistantSafe(this);
         }
         extraDistance += param1;
      }
      
      public function knightCharge() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:int = 0;
         if(!isCharging)
         {
            outputText("黑暗骑士开始向你冲锋，可怕的镰刀已经伸出！[pg]");
            couchedLanceSpeedBonus += 1;
            isCharging = true;
            return;
         }
         switch(extraDistance)
         {
            case 0:
               if(FlagDict_Impl_.arrayReadInt(get_flags(),22) == 0)
               {
                  outputText("现在已经进入攻击范围，骑士挥舞着镰刀，划出一道宽阔的弧线，发动了毁灭性的攻击！");
                  _loc1_ = ["[BLIND]\n\n骑士没有击中你，它被致盲了，无法准确攻击。","[SPEED]\n\n你成功躲开了它可怕的冲锋！","[EVADE]\n\n你预判了它的挥击，凭借惊人的闪避能力躲开了！","[MISDIRECTION]\n\n你使用了从拉斐尔那里学到的技巧，侧身完全避开了它的攻击！","[FLEXIBILITY]\n\n你利用惊人的柔韧性勉强折叠身体，避开了它的攻击！","[UNHANDLED]\n\n你成功躲开了它可怕的冲锋！"];
                  if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null),_loc1_))
                  {
                     outputText("长长的弯曲镰刀击中了你，撕裂了你的血肉，造成了巨大的伤害。");
                     _loc2_ = 0;
                     _loc2_ = int(get_str() * 3 + Utils.rand(50) + couchedLanceSpeedBonus * 30);
                     _loc2_ = get_player().reduceDamage(_loc2_,this);
                     get_player().takeDamage(_loc2_,true);
                  }
               }
               else
               {
                  outputText("你花时间准备闪避，在骑士开始攻击的瞬间，你迅速翻滚躲开。镰刀仅仅擦伤了你，骑士继续向前疾驰。");
                  get_player().takeDamage(10 + Utils.rand(10) * couchedLanceSpeedBonus,true);
                  isCharging = false;
               }
               moveDistant(2);
               break;
            case 1:
               outputText("黑暗骑士几乎已经到了你面前！");
               couchedLanceSpeedBonus += 1;
               get_game().combatRangeData.closeDistance(this);
               if(get_player().get_inte() > 50)
               {
                  outputText("\n准备闪避可能是一个好主意。");
               }
               break;
            case 2:
               outputText("黑暗骑士继续向你冲锋！");
               couchedLanceSpeedBonus += 1;
               get_game().combatRangeData.closeDistance(this);
         }
      }
      
      override public function handleStun() : Boolean
      {
         removeStatusEffect(StatusEffects.Uber);
         outputText("骑士停下脚步，摇了摇头，然后让坐骑后退，准备再次冲锋。你为自己争取到了一些时间！");
         moveDistant(2 - extraDistance);
         return Boolean(super.handleStun());
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().forest.dullahanScene.dullahanPt2();
      }
   }
}

