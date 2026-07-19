package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class HarpyQueen extends Monster
   {
      
      public function HarpyQueen()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Harpy Queen");
         imageName = "harpyqueen";
         set_long("你正面对着鹰身女妖女王，一位体型惊人的育母——字面意义上的。她的臀部宽得惊人，至少是她自身宽度的三倍，她身体的其他部分也丰满得令人垂涎，有着柔软丰满的大腿和巨大的臀部。她宽大的翅膀偶尔拍打着，在她那颤动的身体上激起阵阵涟漪。她一手挥舞着一根高耸的白木法杖，另一只手则用来施放诡异的法术。");
         set_race("Harpy");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         lowerBody.type = 13;
         skin.tone = "red";
         skin.type = 0;
         skin.desc = "feathers";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(70,60,120,40);
         initLibSensCor(40,45,50);
         set_weaponName("eldritch staff");
         set_weaponVerb("thwack");
         set_weaponAttack(20);
         set_armorName("armor");
         set_armorDef(20);
         bonusHP = 1000;
         set_lust(20);
         lustVuln = 0.15;
         temperment = 3;
         level = 20;
         set_gems(Utils.rand(25) + 160);
         additionalXP = 50;
         tail.type = 11;
         wings.type = 9;
         set_drop(NO_DROP);
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.heltower.harpyQueenBeatsUpPCBadEnd();
      }
      
      public function windSlamAttack() : void
      {
         outputText("女王向你挥舞手臂，尽管相隔几英尺，你还是感觉到一堵动能墙猛地撞向你，你飞了出去——直接飞进了鹰身女妖群中！你感觉到爪子、牙齿和利爪刺入你的身体，但一双熟悉的鳞片手臂救了你。[say:滚回去！]赫莉娅大喊着，把你扔回了战斗中！");
         var _loc1_:Number = 100 + Utils.rand(50);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function ropeStruggles(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         clearOutput();
         if(Utils.rand(10) > 0 && get_player().get_str() / 5 + Utils.rand(20) < 23 || param1)
         {
            outputText("你用尽全力，却无法挣脱魔法绳索！鹰身女妖女王放声大笑，更用力地拉扯你的手臂。");
            if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
            {
               _loc2_ = 25 + Utils.rand(10);
               get_player().takeDamage(_loc2_,true);
            }
         }
         else
         {
            outputText("你用尽全力，挣脱了魔法绳索，导致女王摔倒在地，双手双膝着地。");
            removeStatusEffect(StatusEffects.QueenBind);
         }
         tookAction = true;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(hasStatusEffect(StatusEffects.QueenBind))
            {
               ropeStruggles(true);
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         harpyQueenAI();
      }
      
      public function lustSpikeAttack() : void
      {
         outputText("鹰身女妖女王在空中画了一个奇怪的奥术法阵，她的法杖尖端所到之处都留下了魔法线条。你试图冲向她，但法阵似乎在她周围形成了一种屏障。你只能试图强行破开它——但太迟了！一道巨大的粉色闪电从法阵中射出，猛地击中你的胸口。你突然感到头晕目眩，而且非常、非常饥渴……");
         get_player().takeLustDamage(40,true);
      }
      
      public function harpyQueenAI() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eldritchRopes,40,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(lustSpikeAttack,20,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(windSlamAttack,50,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function eldritchRopes() : void
      {
         outputText("鹰身女妖女王向你甩动左腕。你还没来得及眨眼，几条白热的魔法绳索就向你飞来。你设法躲开了几条，但还是有两条抓住了你的手腕，痛苦地拉扯着你的手臂。");
         var _loc1_:int = 25 + Utils.rand(10);
         get_player().takeDamage(_loc1_,true);
         createStatusEffect(StatusEffects.QueenBind,0,0,0,0);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.harpyQueenDefeatedByPC();
      }
   }
}

