package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Marble extends Monster
   {
      
      public function Marble()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Marble");
         imageName = "marble";
         set_long("站在你面前的是一个具有许多奶牛特征的女性人形生物，比如中等大小的牛角、牛耳和牛尾。她的身材非常丰满，有着宽阔的臀部和丰满的屁股。她身高超过6英尺。她熟练地挥舞着一把巨大的双手锤，这清楚地表明她比看起来要强壮得多。");
         set_race("Cow-Girl");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("F"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(76);
         hips.rating = 10;
         butt.rating = 8;
         lowerBody.type = 1;
         skin.tone = "pale";
         hair.color = "brown";
         hair.length = 13;
         initStrTouSpeInte(75,70,35,40);
         initLibSensCor(25,45,40);
         set_weaponName("large hammer");
         set_weaponVerb("hammer-blow");
         set_weaponAttack(10);
         set_armorName("tough hide");
         set_armorDef(5);
         temperment = 2;
         level = 7;
         set_gems(Utils.rand(5) + 25);
         set_drop(new WeightedChoice(get_weapons().L_HAMMR,1));
         tail.type = 4;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().marbleScene.marbleFightLose();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(marbleSpecialAttackOne,1,true,15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(marbleSpecialAttackTwo,1,true,15,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.exec();
      }
      
      public function marbleSpecialAttackTwo() : void
      {
         var _loc1_:String = "[EVADE]你通过从下方翻滚，勉强避开了玛布尔的大范围横扫攻击。";
         var _loc2_:Number = 0;
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,false,false,null,false,get_player().standardDodgeFunc(this,-30),null,null);
         if(!playerAvoidDamage(_loc3_))
         {
            if(hasStatusEffect(StatusEffects.Blind))
            {
               outputText("玛布尔用她的锤子进行了一次大范围的横扫攻击，即使是面对一个失明的对手也很难躲避。\n");
            }
            _loc2_ = get_player().reduceDamage(get_str() + 40 + get_weaponAttack(),this);
            _loc2_ /= 2;
            if(_loc2_ <= 0)
            {
               _loc2_ = 0;
               outputText("你轻松地偏转并挡住了玛布尔大范围挥击的伤害。");
            }
            outputText("玛布尔轻松地用一次难以躲避的大范围挥击击中了你。");
            if(_loc2_ > 0)
            {
               get_player().takeDamage(_loc2_,true);
            }
         }
         statScreenRefresh();
      }
      
      public function marbleSpecialAttackOne() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:Array = ["[BLIND]玛布尔在失明状态下不明智地试图进行一次大范围挥击，你轻松地避开了。","[SPEED]你成功翻滚躲开了一次势大力沉的过肩挥击。","[EVADE]当玛布尔试图进行一次巨大的过肩挥击时，你轻松地侧步躲开。","[MISDIRECTION]拉斐尔的教导让你极其轻松地避开了玛布尔试图进行的巨大过肩挥击。\n","[FLEXIBILITY]你利用猫娘般的柔韧性扭身躲开，轻松避开了那次巨大的过肩挥击。","[UNHANDLED]你成功翻滚躲开了一次势大力沉的过肩挥击。"];
         var _loc3_:AvoidDamageParameters = new AvoidDamageParameters(true,false,false,null,false,get_player().standardDodgeFunc(this,-20),null,null);
         if(!playerAvoidDamage(_loc3_,_loc2_))
         {
            _loc1_ = get_player().reduceDamage(get_str() + 20 + get_weaponAttack(),this,100);
            if(_loc1_ <= 0)
            {
               _loc1_ = 0;
               outputText("你不知怎么地设法偏转并挡住了玛布尔巨大的过顶挥击。");
            }
            if(_loc1_ > 0)
            {
               outputText("你被愤怒的牛娘双手过顶挥击击中。");
               get_player().takeDamage(_loc1_,true);
            }
         }
         statScreenRefresh();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().marbleScene.marbleFightWin();
      }
   }
}

