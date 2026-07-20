package classes.scenes.areas.bog
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class ChameleonGirl extends Monster
   {
      
      public var SKIN_VARIATIONS:Array;
      
      public function ChameleonGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         SKIN_VARIATIONS = [["red","black"],["green","yellowish"],["blue","lighter blue"],["purple","bright yellow"],["orange","brown"],["tan","white"]];
         super();
         var _loc1_:Array = SKIN_VARIATIONS;
         var _loc2_:Array = _loc1_[Utils.rand(int(_loc1_.length))];
         set_a("");
         set_short("chameleon girl");
         imageName = "chameleongirl";
         set_long("你面前站着一个高挑的蜥蜴人女孩，她有着光滑的" + Utils.cnName(_loc2_[0]) + "皮肤，从脚踝到肩膀布满了长长的" + Utils.cnName(_loc2_[1]) + "条纹。一条异常巨大的尾巴在她身后甩动，她的手相对于她的体型来说非常巨大，显然是为了轻松爬树而生的。一对小巧可爱的角从她的太阳穴长出，一对挺拔的B罩杯在暴露的衣物下呼之欲出。手指上长着巨大锋利的爪子，正充满威胁地向你比划着。");
         set_race("Chameleon-Morph");
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         set_tallness(Utils.rand(2) + 68);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = _loc2_[0];
         skin.type = 0;
         skin.desc = "skin";
         skin.adj = _loc2_[1];
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(65,65,95,85);
         initLibSensCor(50,45,50);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(30);
         set_armorName("skin");
         set_armorDef(20);
         bonusHP = 350;
         set_lust(30);
         lustVuln = 0.25;
         temperment = 3;
         level = 14;
         set_gems(10 + Utils.rand(50));
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().hasCock() && !get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && !get_player().hasPerk(PerkLib.ParasiteMusk) && !get_player().hasStatusEffect(StatusEffects.Infested) && Utils.randomChance(get_game().get_parasiteRating() * 20))
         {
            get_player().createStatusEffect(StatusEffects.ParasiteSlug,72,0,0,0);
         }
         if(param2)
         {
            outputText("[pg]变色龙女孩退缩了。[say: 呃，真恶心！]她尖叫着跑开了，留下你独自从失败中恢复。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().bog.chameleonGirlScene.loseToChameleonGirl();
         }
      }
      
      public function rollKickClawWhatTheFuckComboIsThisShit() : void
      {
         var _loc1_:Number = NaN;
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "盲目的一记翻滚踢完全没打中你！\n");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            _loc1_ = 1 + Utils.rand(10);
            outputText("变色龙女孩向你的方向跃起，翻滚，并向你踢来。你侧身躲开了她的飞踢，并从下方推了她一把，确保她脸朝下摔进泥潭里。");
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this) + 25;
            if(_loc1_ > 0)
            {
               outputText("变色龙向你的方向跃起，翻滚，并在她上升时一脚正中你的肩膀，让你踉跄后退。当一排锋利的爪子划过你的胸膛时，你痛苦地闷哼了一声。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("变色龙向你的方向翻滚，并踢向你的胸口，但你把她打到了一边，没有受到任何伤害……");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_chameleon());
         var _loc1_:MonsterAI = new MonsterAI().add(chameleonClaws,30,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(rollKickClawWhatTheFuckComboIsThisShit,10,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(chameleonTongueAttack,10,true,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function outputPlayerDodged(param1:int) : void
      {
         outputText("变色龙女孩猛地甩头，将她的舌头向你飞射而来，但你跳到一边，成功地躲开了。那团粉红色的模糊影子以和来时一样快的速度飞回了她的嘴里，她看起来因为没有击中目标而非常生气。\n");
      }
      
      override public function outputAttack(param1:int) : void
      {
         if(param1 <= 0)
         {
            outputText("变色龙女孩用她的舌头猛烈攻击，但你用手臂弹开了这个黏糊糊的抛射物，成功地防住了它。当她把那块肌肉吸回嘴里时，她看起来很不高兴。");
         }
         else
         {
            outputText("变色龙猛地向前甩头，将她的舌头向你飞射而来。它击中了你的腹部，其背后惊人的力量让你踉跄了一下。那团粉红色的模糊影子以和来时一样快的速度飞回了她的嘴里，当你恢复站立时，她嘲弄地笑着。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + param1 + "</font>)</b>");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().bog.chameleonGirlScene.defeatChameleonGirl();
      }
      
      public function chameleonTongueAttack() : void
      {
         set_weaponName("tongue");
         set_weaponVerb("tongue-slap");
         set_weaponAttack(10);
         createStatusEffect(StatusEffects.Attacks,1,0,0,0);
         eAttack();
         set_weaponAttack(30);
         set_weaponName("claws");
         set_weaponVerb("claw");
      }
      
      public function chameleonClaws() : void
      {
         var _loc1_:Number = NaN;
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "盲目的一记爪击完全没打中你！\n");
         }
         else if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,true,false,null,null,null,null,null)).attackFailed))
         {
            outputText("变色龙女孩的爪子向你挥来，但你侧身躲开了，它们化作一团无害的模糊影子从你身边掠过。");
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ > 0)
            {
               outputText("变色龙向你挥舞手臂，用她的爪子抓住了你。当它们划破你的皮肤，留下一道道细长的伤口时，你痛苦地退缩了。");
               get_player().takeDamage(_loc1_,true);
            }
            else
            {
               outputText("变色龙向你挥舞手臂，用她的爪子抓住了你。你防住了这极其锋利的攻击。");
            }
         }
      }
   }
}

