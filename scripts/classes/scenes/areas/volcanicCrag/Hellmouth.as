package classes.scenes.areas.volcanicCrag
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.scenes.monsters.Imp;
   import flash.Boot;
   
   public class Hellmouth extends Monster
   {
      
      public function Hellmouth()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Hellmouth");
         imageName = "hellmouth";
         set_long("这只恶魔站起来大约有地精那么高，然而她没有张开的小穴，反而是她的嘴似乎能够张大到容纳任何东西。她的牙齿通常锋利而威严，有两对较长的犬齿突出。她的皮肤是浅灰色的，能看到细细的静脉。她的胸部相当平坦，与她宽阔的臀部形成鲜明对比。她的眼睛很大，在漆黑的瞳孔周围闪烁着深红色的光芒。如果她有虹膜，那也和瞳孔一样漆黑。她的精灵耳朵每只至少有一英尺长，从她飘逸的黑色长发中探出，向两侧下垂。如果不是你从那张地狱般的巨口中感觉到即将到来的死亡，她也许会很可爱。");
         set_race("Hellmouth");
         createVagina(false,1,1);
         createBreastRow(Appearance.breastCupInverse("C"));
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "pale gray";
         hair.color = "black";
         hair.length = 10;
         initStrTouSpeInte(60,60,70,50);
         initLibSensCor(25,25,60);
         set_weaponName("teeth");
         set_weaponVerb("bite");
         set_weaponAttack(30);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         bonusHP = 200;
         createPerk(PerkLib.Evade);
         set_armorName("nothing");
         set_lust(15);
         temperment = 2;
         level = 22;
         set_drop(NO_DROP);
         set_gems(Utils.rand(50) + 50);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的对手似乎并不在意。");
            doNext(get_game().volcanicCrag.hellmouthScene.loseToHellmouth);
         }
         else
         {
            get_game().volcanicCrag.hellmouthScene.loseToHellmouth();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(hellmouthBite,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(fireBreath,1,true,10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(hellmouthSummon,1,int(get_game().monsterArray.length) == 1,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(hellmaw,1,get_player().get_armorDef() >= 40,15,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function hellmouthSummon() : void
      {
         outputText("恶魔停止了对你的追击，转而张大她的嘴巴。猩红的火焰在她的喉咙里燃烧，片刻之后，清晰可见的爪子开始抓取它们能找到的任何东西。令你惊讶的是，一只小恶魔从地狱口的嘴里爬了出来，响应了她从某种深渊发出的召唤。");
         var _loc1_:Monster = new Imp();
         _loc1_.temporary = true;
         _loc1_.scaleToLevel(Utils.rand(3) + 5);
         get_game().combat.description = get_long();
         get_game().monsterArray.push(_loc1_);
      }
      
      public function hellmouthBite() : void
      {
         var _loc1_:int = 0;
         outputText("女恶魔向前跃出，张开嘴准备咬人！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,true,null,null,null)).attackFailed))
         {
            outputText("你预判了她的攻击，准备击打她的头部侧面。地狱口紧闭下巴，在你击中之前踉跄着躲到了一边。");
            return;
         }
         outputText("她的毒牙刺入了你的肩膀，轻易地穿透了你的身体。你痛苦地呻吟着将她推开，撕裂了你的血肉，造成了严重的伤口！");
         if(get_player().bleed(this,2,2))
         {
            outputText("她撕裂了你体内的一根动脉！<b>你在流血！</b>");
         }
         _loc1_ = int(get_str() / 1.25 + level);
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function hellmaw() : void
      {
         var _loc2_:int = 0;
         outputText("恶魔张开她那可怕的血盆大口咆哮着，一缕缕火焰环绕着她锋利的牙齿。她突然向你扑来，准备咬你！[pg-]");
         var _loc1_:Array = ["[BLIND]" + get_capitalA() + Utils.cnName(get_short()) + "因为失明完全没有击中。","[SPEED]你设法向旁边冲刺，避开了她火焰般的猛扑。","[EVADE]你设法向旁边冲刺，避开了她火焰般的猛扑。","[MISDIRECTION]你误导性的动作让这只生物跳错了方向，只咬到了焦土。你得意地笑了笑，嘲弄着你的对手。","[FLEXIBILITY]你在最后一秒扭动身体，这只生物的牙齿只是擦伤了你，然后她从你头顶飞过，摔在地上。","[BLOCK]你在千钧一发之际举起了盾牌！她的牙齿刺穿了盾牌，但没有伤到你。你向外挥动持盾的手臂，把她甩开。","[UNHANDLED]你设法向旁边冲刺，避开了她火焰般的猛扑。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,true,get_player().standardDodgeFunc(this,-15),null,null),_loc1_))
         {
            outputText("你没能及时躲闪或格挡，她成功地将她那烧红的獠牙刺入了你的血肉！她的牙齿轻易地穿透了你的防御，你只能在剧痛中挣扎着将她甩开，肌肉紧绷。");
            get_game().combat.monsterDamageType = "Fire";
            _loc2_ = get_player().reduceDamage(get_str() * 1.2 + level,this,85,false,true);
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function fireBreath() : void
      {
         var _loc1_:int = 0;
         outputText("火焰在她的牙齿间缭绕，这是她张开可怕的血盆大口前给你的唯一警告。一个巨大的火球");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
         {
            outputText("带着巨大的冲击力和烧焦血肉的高温向你猛冲过来！你被结结实实地击中，向后摔倒在地上，浑身燃烧冒烟！");
            get_game().combat.monsterDamageType = "Fire";
            _loc1_ = int(get_inte() * 1.3 + level);
            _loc1_ = get_player().reduceDamage(_loc1_,this,40);
            get_player().takeDamage(_loc1_,true);
         }
         else
         {
            outputText("在你疯狂闪避时险些击中你！火球砸在你旁边的地上，爆炸的威力让你庆幸自己成功躲开了。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().volcanicCrag.hellmouthScene.beatHellmouth();
      }
   }
}

