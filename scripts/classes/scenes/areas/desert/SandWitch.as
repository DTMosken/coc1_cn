package classes.scenes.areas.desert
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SandWitch extends Monster
   {
      
      public function SandWitch()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         if(get_game().get_silly())
         {
            set_short("sand witch");
            imageName = "sandwidch";
         }
         else
         {
            set_short("sand witch");
            imageName = "sandwitch";
         }
         set_long("这个沙漠女巫看起来完全像个人类，在这片奇异的土地上显得格格不入。她有着一头脏金色的头发和非常黝黑的肤色，选择用与沙漠颜色相同的长袍遮盖住身体的大部分，这让她在远处几乎无法被发现。");
         set_race("Human?");
         createVagina(false,2,2);
         createBreastRow(Appearance.breastCupInverse("DD"));
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(Utils.rand(12) + 55);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "bronzed";
         hair.color = "sandy-blonde";
         hair.length = 15;
         initStrTouSpeInte(25,25,35,45);
         initLibSensCor(55,40,30);
         set_weaponName("kick");
         set_weaponVerb("kick");
         set_armorName("robes");
         bonusHP = 20;
         set_lust(30);
         temperment = 1;
         level = 3;
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice().addMany(1,get_consumables().TSCROLL,get_consumables().OVIELIX,get_consumables().LACTAID,get_consumables().LABOVA_,get_consumables().W__BOOK,get_consumables().B__BOOK,null));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]女巫脸色苍白地后退，留下你听天由命。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().desert.sandWitchScene.sandwitchRape();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI().add(eAttack);
         _loc1_.add(lustMagicAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function lustMagicAttack() : void
      {
         var _loc1_:int = 0;
         outputText("沙漠女巫指着你，在空中画了一个圈，嘴里念叨着奇怪的词语。[pg]");
         if(get_player().hasStatusEffect(StatusEffects.StoneLust))
         {
            outputText("你体内的宝珠变得温暖，甚至有些发烫，让你的身体充满了热量和情欲。");
            _loc1_ = int(8 + int(get_player().sens) / 10);
         }
         else
         {
            outputText("你感觉到[feet]边的沙子在移动，低头一看，有什么东西从沙子里滑出来，钻进了你的衣服里！它沿着你的[leg]向上滑行，感觉异常光滑圆润，你拼命想把它弄掉，却无济于事。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("它顺着你的大腿滑到你的私处入口，你恍然大悟它的意图！[pg]太迟了！你伸手去阻止，但它顶开你的阴唇，瞬间滑进了你的" + get_player().vaginaDescript(0) + "。你沮丧地呻吟着，因为它开始跳动和震动，有时甚至似乎在改变大小。");
            }
            else
            {
               outputText("它顺着你的大腿滑上来，绕过你的臀部，你恍然大悟它的意图。[pg]你拼命去抓它，但太迟了！它紧紧地顶住你的直肠，瞬间滑了进去。你沮丧地呻吟着，因为它开始跳动和震动，有时甚至似乎在改变大小。");
            }
            get_player().createStatusEffect(StatusEffects.StoneLust,0,0,0,0);
            _loc1_ = int(4 + int(get_player().sens) / 10);
         }
         get_player().takeLustDamage(_loc1_,true);
         doNext(get_game().playerMenu);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(get_player().hasStatusEffect(StatusEffects.StoneLust))
         {
            get_player().removeStatusEffect(StatusEffects.StoneLust);
         }
         get_game().desert.sandWitchScene.beatSandwitch();
      }
   }
}

