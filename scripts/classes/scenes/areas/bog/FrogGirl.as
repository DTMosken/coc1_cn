package classes.scenes.areas.bog
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class FrogGirl extends Monster
   {
      
      public function FrogGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("frog-girl");
         imageName = "froggirlgreen";
         set_long("你面前的这只青蛙女孩看起来身高和二十岁左右的普通女性差不多，但由于她现在正蹲着，很难确切知道她到底有多高。她的黑发几乎遮住了她的五官，让你看不清她的长相。你至少能看出她迷人的脸庞扭曲成了充满敌意的表情。她那两只金色的眼睛正恶狠狠地瞪着你。青蛙女孩的皮肤是浅绿色的，闪烁着一层薄薄的粘液，不过她的腹部是乳白色的。由于她没有穿衣服，你可以很容易地看出她有一对丰满的、没有乳头的乳房，随着她的每一个动作而颤动。她有丰满的臀部，你的手指肯定会陷进去。她的双腿之间有一条光滑的缝隙，表明她确实是女性。你可以看到她的手和脚都有蹼，考虑到她看起来像什么动物，这很合适。");
         set_race("frog-girl");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(62);
         hips.rating = 10;
         butt.rating = 10;
         skin.tone = "light green";
         hair.color = "black";
         hair.length = 10;
         initStrTouSpeInte(60,75,95,45);
         initLibSensCor(50,40,50);
         set_weaponName("powerful tongue");
         set_weaponVerb("tongue-lash");
         set_weaponAttack(20);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("skin");
         set_armorDef(10);
         bonusHP = 450;
         set_lust(30);
         temperment = 3;
         level = 14;
         set_gems(10 + Utils.rand(50));
         set_drop(NO_DROP);
         createPerk(PerkLib.ExtraDodge,20,0,0,0);
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_game().bog.frogGirlScene.saveContent.analMad != 0)
         {
            get_game().bog.frogGirlScene.suwakoAnalWon();
         }
         else
         {
            get_game().bog.frogGirlScene.suwakoWon(param1);
         }
      }
      
      public function tease() : void
      {
         outputText("绿色的青蛙女孩微微向你张开双腿，露出她那即使在沼泽昏暗的光线下也闪闪发光的小穴。也许她正试图用你错过的美妙快感来嘲弄你。");
         get_player().takeLustDamage(13 + Utils.rand(10));
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(kick,1,!get_player().hasStatusEffect(StatusEffects.Stunned),15,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(tease,1,true,10,FATIGUE_MAGICAL,CombatRange.Tease);
         _loc1_.add(eAttack,2,true,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function kick() : void
      {
         outputText("绿色的青蛙女孩跳了起来，用她强壮的双腿踢向你的胸口！");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canParry().canBlock().canDodge();
         _loc1_.setCustomBlock(" 你及时举起盾牌挡住了她的双腿。");
         _loc1_.setCustomAvoid(" 你险之又险地躲开了这凶残的一击。");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            get_player().takeDamage(get_str() * 1.5 + Utils.rand(30),true);
            if(get_player().stun(1,50))
            {
               outputText("她的攻击将你肺里的空气全部挤了出去，让你暂时陷入了眩晕。");
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().bog.frogGirlScene.suwakoDefeated(param1);
      }
   }
}

