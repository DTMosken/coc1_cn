package classes.scenes.areas.mountain
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   import haxe.IMap;
   
   public class WormMass extends Monster
   {
      
      public function WormMass()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("worms");
         imageName = "worms";
         set_long("在你面前的是一团可怕的蠕虫。它改变了形态，现在呈现出完全由群体中的蠕虫组成的人形。它那模糊的人形以一种明显具有攻击性的方式向你蹒跚走来。");
         set_race("Abomination");
         set_plural(true);
         initGenderless();
         pronoun1 = "they";
         pronoun2 = "他们";
         pronoun3 = "他们的";
         createBreastRow(0,0);
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(1);
         hips.rating = 2;
         butt.rating = 0;
         skin.tone = "white";
         initStrTouSpeInte(35,5,10,1);
         initLibSensCor(90,60,90);
         set_weaponName("worm");
         set_weaponVerb("slap");
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("skin");
         set_lust(30);
         lustVuln = 0;
         temperment = 3;
         level = 3;
         set_gems(0);
         special1 = wormAttack;
         special2 = wormsEntice;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      public function wormsEntice() : void
      {
         if(Utils.rand(2) == 0)
         {
            if(get_player().get_lust100() < 50)
            {
               outputText("蠕虫群站在你面前，开始分泌大量的粘液。你对蠕虫为什么这样做感到困惑。你耸了耸肩，继续保持警惕。\n");
            }
            else
            {
               outputText("蠕虫群蹒跚着向你走来，试图抓住你。你迅速侧身躲开了这怪物笨拙的动作，避免了可怕的命运，而这团怪物在试图吞噬你失败后摔倒并溅了一地。\n");
            }
            return;
         }
         if(get_player().get_lust100() < 50)
         {
            outputText("蠕虫群站在你面前，开始分泌大量的粘液。莫名其妙地，你发现你的[cock]已经勃起并跳动着。这种勃起非常碍事，你发现自己被这不想要的性奋分散了注意力。");
            get_player().takeLustDamage(10 + get_player().lib / 20 + get_player().cor / 20);
         }
         else
         {
            outputText("蠕虫群蹒跚着向你走来，试图抓住你。你试图躲闪，但没能及时逃脱，倒在地上被这团怪物吞没了。你完全被黏糊糊的蠕虫覆盖了！你无法避开它们的任何动作，感觉到它们的粘液涂满了你身体的每一寸，当它们在你身上爬行时，你能感觉到每一条蠕虫的挣扎和拉扯。你立刻开始疯狂地挥舞四肢，因为你甚至无法呼吸！");
            if(get_player().hasStatusEffect(StatusEffects.InfestAttempted))
            {
               outputText("无论你如何挣扎，这些生物还是淹没了你的身体，让你根本没有任何机会把它们弄下来。你的头很快就露了出来，让你得以呼吸，但你只能无助地盯着困住你的蠕虫茧。[pg]");
               get_game().mountain.wormsScene.infest1();
               return;
            }
            outputText("[pg]你拼命挣扎，与蠕虫群搏斗，既为了呼吸，也为了把这些东西从身上弄下去。单条蠕虫分泌的粘稠粘液大大增加了你的难度。在挣脱了一只手臂后，你露出了脸，让自己得以呼吸，并开始将这些野兽从身上扫落。被你重新焕发的活力所震慑，这团怪物失去了凝聚力，让你得以迅速清除身上的蠕虫。散开的蠕虫群退到离你一段距离的地方，在你清理身上的环节动物时，它们开始重新聚集。");
            get_player().createStatusEffect(StatusEffects.InfestAttempted,0,0,0,0);
         }
      }
      
      public function wormAttack() : void
      {
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("蠕虫群挥舞着它模拟出的手臂向你打来，但由于缺乏协调性，你轻松躲开了它的攻击。\n");
            return;
         }
         outputText("蠕虫群用它临时拼凑的肢体向你发动攻击。这一击打中了，肢体随之溅开，组成假臂的蠕虫散落一地。");
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0)
         {
            _loc1_ = 1;
         }
         if(_loc1_ > 0)
         {
            get_player().takeDamage(_loc1_);
         }
         statScreenRefresh();
         outputText("\n");
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         outputText("被你的" + (param1 ? "伤势" : "欲望") + "所击垮，你跪倒在地，蠕虫群蜂拥而上，爬满了你的全身……[pg]");
         get_game().mountain.wormsScene.infest1();
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         switch(param1.index)
         {
            case 0:
               if(Utils.rand(100) + get_player().get_inte() / 3 >= 50)
               {
                  _loc2_ = int(get_player().get_str() / 5 - Utils.rand(5));
                  if(_loc2_ == 0)
                  {
                     _loc2_ = 1;
                  }
                  outputText("你攻击这个混合体，将无数蠕虫碾成肉酱，造成了<b><font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc2_ + "</font></b>点伤害。[pg]");
                  set_HP(get_HP() - _loc2_);
                  if(get_game().combat.totalHP() <= 0)
                  {
                     doNext(get_game().combat.endHpVictory);
                     return false;
                  }
               }
               else
               {
                  outputText("你试图用反击碾碎这些蠕虫，但这群怪物却移动了它们各自的个体，在撞击点制造了一个空隙，让你只打到了空气。[pg]");
               }
               if(get_player().hasStatusEffect(StatusEffects.FirstAttack))
               {
                  get_game().combat.attack();
                  return false;
               }
               return false;
               break;
            case 10:
               outputText("箭矢从蠕虫之间穿过，插在了地上。[pg-]");
               return false;
            default:
               return true;
         }
      }
      
      override public function performCombatAction() : void
      {
         if(Utils.rand(2) == 0)
         {
            special1();
         }
         else
         {
            special2();
         }
      }
      
      override public function maxHP() : Number
      {
         return 40 + get_player().newGamePlusMod() * 20;
      }
      
      override public function describeDodge(param1:String = undefined, param2:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "攻击";
         }
         if(param2 == null)
         {
            param2 = "攻击";
         }
         outputText(get_Themonster() + "在最后一秒从你的" + Utils.cnName(param1) + "中挣脱出来。");
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _loc2_:* = null as IMap;
         if(param1)
         {
            _loc2_ = get_flags();
            FlagDict_Impl_.arrayWriteInt(_loc2_,2375,FlagDict_Impl_.arrayReadInt(_loc2_,2375) + 1);
         }
         get_game().combat.finishCombat();
      }
   }
}

