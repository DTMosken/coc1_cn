package classes.scenes.areas.mountain
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Minotaur extends Monster
   {
      
      public var hasAxe:Boolean;
      
      public function Minotaur(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         hasAxe = false;
         super();
         hasAxe = param1 || Utils.rand(3) == 0;
         var _loc2_:Array = ["黑","棕"];
         var _loc3_:String = _loc2_[Utils.rand(int(_loc2_.length))];
         skin.furColor = _loc3_;
         set_a("");
         set_short("minotaur");
         imageName = "minotaur";
         set_long("");
         createCock(Utils.rand(13) + 24,2 + Utils.rand(3),CockTypesEnum.HORSE);
         balls = 2;
         ballSize = 2 + Utils.rand(13);
         cumMultiplier = 1.5;
         set_hoursSinceCum(ballSize * 10);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(Utils.rand(37) + 84);
         hips.rating = 4;
         butt.rating = 4;
         lowerBody.type = 1;
         skin.tone = skin.furColor;
         skin.type = 1;
         skin.desc = "shaggy fur";
         hair.color = skin.furColor;
         hair.length = 3;
         initStrTouSpeInte(hasAxe ? 75 : 50,60,30,20);
         initLibSensCor(40 + ballSize * 2,15 + ballSize * 2,35);
         face.type = 3;
         set_weaponName(hasAxe ? "斧头" : "拳头");
         set_weaponVerb(hasAxe ? "cleave" : "punch");
         set_armorName("thick fur");
         bonusHP = 20 + Utils.rand(ballSize * 2);
         set_lust(ballSize * 3);
         lustVuln = hasAxe ? 0.84 : 0.87;
         temperment = 1;
         level = hasAxe ? 6 : 5;
         set_gems(Utils.rand(5) + 5);
         if(hasAxe)
         {
            set_drop(new ChainedDrop().add(get_consumables().MINOBLO,0.5).add(get_player().get_tallness() < 78 && get_player().get_str() < 90 ? get_consumables().SDELITE : get_weapons().L__AXE,0.5).elseDrop(null));
         }
         else
         {
            set_drop(new ChainedDrop().add(get_consumables().MINOCUM,0.2).add(get_consumables().MINOBLO,0.5).elseDrop(null));
         }
         tail.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]牛头人把你拎起来，强行把你扔出他的洞穴，不满地咕哝着。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().mountain.minotaurScene.getRapedByMinotaur();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(get_game().mountain.minotaurScene.minoPheromones,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function handleAwardItemText(param1:ItemType) : void
      {
         var _loc2_:Boolean = false;
         if(param1 == get_consumables().SDELITE == true)
         {
            outputText("\n你在牛头人身上找到了一把大斧，但对于你这种身材的人来说，它太大了，无法舒适地携带。");
         }
         else
         {
            _loc2_ = param1 == get_weapons().L__AXE;
            if(_loc2_ != true)
            {
               if(hasAxe)
               {
                  outputText("\n牛头人的斧头似乎在战斗中损坏了，变得毫无用处。");
               }
            }
         }
         if(param1 != null)
         {
            outputText("\n在你击败的对手身上有" + Utils.cnName(param1.get_longName()) + "。");
         }
      }
      
      override public function get_long() : String
      {
         return "一个面带怒容的牛头人正居高临下地俯视着你。这头野兽浑身覆盖着毛茸茸的" + hair.color + "色皮毛，看起来气势逼人。他身上几乎什么都没穿，只围着一条明显被撑得鼓鼓囊囊的遮阴布，显然已经在盘算着该怎么惩罚你了。和大多数牛头人一样，他长着蹄子、牛一样的尾巴和脸庞、突出的角，以及令人惊叹的肌肉。" + (ballSize > 4 ? " 在那破烂不堪的遮阴布下，隐约可见" + Appearance.ballsDescription(true,true,this) + "，它们因为牛头人长期压抑的欲望而肿胀着。" : "") + (hasAxe ? " <b>这个牛头人似乎从哪儿弄来了一把看起来很致命的斧头！</b>" : "");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         get_game().mountain.minotaurScene.minoVictoryRapeChoices();
      }
   }
}

