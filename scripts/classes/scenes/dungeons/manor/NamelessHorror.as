package classes.scenes.dungeons.manor
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.scenes.combat.CombatRange;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class NamelessHorror extends Monster
   {
      
      public var playerStats:Array;
      
      public var originalName:String;
      
      public var doomLevel:Number;
      
      public function NamelessHorror()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         playerStats = [0,0,0,0];
         originalName = "";
         doomLevel = 1;
         super();
         set_a("");
         set_short("Nameless Horror");
         pronoun2 = "它";
         imageName = "namelesshorror";
         set_long("一个独眼畸形怪物站在你面前。这是一个十五英尺高的圆锥形怪物，立在一团蠕动的触手上。漆黑的眼睛以不规则的图案覆盖了它圆锥形身体的大部分，它的“脸”被一系列花瓣状的附肢包围着。一条条舌头偶尔从包围圈里滑出来，品尝着空气的味道。");
         createBreastRow(Appearance.breastCupInverse("A"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(180);
         hips.rating = 2;
         butt.rating = 4;
         skin.tone = "gray";
         skin.type = 0;
         set_initedGenitals(true);
         hair.color = "white";
         hair.length = 0;
         initStrTouSpeInte(100,100,100,150);
         initLibSensCor(40,50,100);
         set_weaponName("tentacle");
         set_weaponVerb("lash");
         set_fatigue(0);
         set_weaponAttack(20);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("taut flesh");
         set_armorDef(17);
         bonusHP = 99749;
         set_lust(0);
         lustVuln = 0;
         temperment = 1;
         level = 60;
         set_gems(30);
         set_drop(new WeightedChoice());
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.manor.loseToNamelessHorror();
      }
      
      override public function updateBleed() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < int(statusEffects.length))
         {
            if(statusEffects[_loc3_].get_stype().get_id() == "Izma Bleed")
            {
               _temp_1.value1 -= 1;
               _loc2_ += statusEffects[_loc3_].value1;
               _loc1_ += statusEffects[_loc3_].value2;
               if(statusEffects[_loc3_].value1 <= 0)
               {
                  statusEffects.splice(_loc3_,1);
               }
            }
            _loc3_++;
         }
         if(_loc2_ <= 0)
         {
            outputText("你在" + get_a() + Utils.cnName(get_short()) + "身上留下的伤口不再流血了。[pg]");
         }
         else
         {
            _loc4_ = maxHP() * (3 + Utils.rand(4)) / 100 * _loc1_ * 0.06;
            _loc4_ = get_game().combat.doDamage(_loc4_);
            if(get_plural())
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "的伤口因为你武器造成的锯齿状撕裂而大量出血。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc4_ + "</font>)</b>[pg]");
            }
            else
            {
               outputText(get_capitalA() + Utils.cnName(get_short()) + "的伤口因为你武器造成的锯齿状撕裂而大量出血。<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + _loc4_ + "</font>)</b>[pg]");
            }
         }
      }
      
      public function reveal() : void
      {
         outputText("怪物举起它的一根触手指向你，释放出一股无形的波浪，刺穿了你的大脑！你突然被超出你理解的知识、超出你经验的记忆所冲击。你的自我意识被淹没、粉碎！");
         originalName = get_player().get_short();
         get_player().set_short("Ephraim");
         get_player().createStatusEffect(StatusEffects.Revelation,2,50,0,0);
      }
      
      public function refashionIt() : void
      {
         outputText("怪物举起几根触手指向你，释放出一波扭曲周围光线的怪异魔法！");
         outputText("\n你被这奇怪的魔法击中，你被撕裂，碎成小块，散落在无限的宇宙空间中。");
         outputText("[pg]然而，在你意识到自己的处境之前，你发现自己又完整了。你被重塑、重构了！");
         get_player().takeDamage(25 + Utils.rand(50));
         get_player().createStatusEffect(StatusEffects.Refashioned,2,0,0,0);
         var _loc1_:int = Utils.rand(3);
         playerStats[0] = get_player()._str;
         playerStats[1] = get_player()._tou;
         playerStats[2] = get_player()._inte;
         playerStats[3] = get_player()._spe;
         var _loc2_:int = 40 + Utils.rand(180);
         get_player()._str = _loc2_ + (_loc1_ == 0 ? 30 : 0);
         var _loc3_:int = 40 + Utils.rand(180);
         get_player()._tou = _loc3_ + (_loc1_ == 1 ? 30 : 0);
         var _loc4_:int = 40 + Utils.rand(180);
         get_player()._inte = _loc4_ + (_loc1_ == 2 ? 30 : 0);
         var _loc5_:int = 40 + Utils.rand(180);
         get_player()._spe = _loc5_ + (_loc1_ == 3 ? 30 : 0);
      }
      
      override public function performCombatAction() : void
      {
         if(maxHP() - get_HP() >= 3500 * (FlagDict_Impl_.arrayReadInt(get_flags(),2644) == 1 ? 1.1 * FlagDict_Impl_.arrayReadInt(get_flags(),2979) : 1))
         {
            banish();
            return;
         }
         if(int(get_game().combat.combatRound % 5) == 0 && get_game().combat.combatRound != 0)
         {
            conjoin();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(overwhelm,1,true,0,FATIGUE_NONE,CombatRange.FlyingMelee);
         _loc1_.add(refashionIt,1,!get_player().hasStatusEffect(StatusEffects.Revelation) && !get_player().hasStatusEffect(StatusEffects.Refashioned),10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(reveal,0.33,!get_player().hasStatusEffect(StatusEffects.Revelation) && !get_player().hasStatusEffect(StatusEffects.Refashioned),10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(becomeNothingness,0.5,!get_player().hasStatusEffect(StatusEffects.Nothingness),10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.exec();
      }
      
      public function overwhelm() : void
      {
         outputText("几十根触手同时向你袭来！\n");
         createStatusEffect(StatusEffects.Attacks,4,0,0,0);
         if(get_player().get_HP() / get_player().maxHP() < 0.4)
         {
            set_spe(40);
         }
         eAttack();
         if(get_player().get_HP() / get_player().maxHP() < 0.4)
         {
            set_spe(100);
         }
      }
      
      override public function handleStun() : Boolean
      {
         if(Utils.rand(3) == 0)
         {
            outputText("这只独眼怪物蠕动着，重塑着自己的形态。它似乎已经从你的击晕中恢复过来了！[pg]");
            removeStatusEffect(StatusEffects.Stunned);
            return true;
         }
         return Boolean(super.handleStun());
      }
      
      override public function handleFear() : Boolean
      {
         outputText("怪物对你试图逃脱的举动发出尖叫！那声音刺入你的精神，用湮灭与毁灭的景象将你淹没！[pg]");
         removeStatusEffect(StatusEffects.Fear);
         if(get_player().hasStatusEffect(StatusEffects.Resolve))
         {
            get_player().removeStatusEffect(StatusEffects.Resolve);
         }
         get_game().dungeons.manor.testResolve();
         return true;
      }
      
      override public function handleDamaged(param1:Number, param2:Boolean = true) : Number
      {
         if(get_player().hasStatusEffect(StatusEffects.Nothingness))
         {
            if((get_game().combat.damageType == "MagicalM" || get_game().combat.damageType == "MagicalR") && get_player().get_inte() >= 90)
            {
               if(param2)
               {
                  outputText("你成功地部分压制了这只可怖怪物的法术，并宣告你的法术才是真实的。");
               }
               param1 *= 0.4;
            }
            else
            {
               param1 = 0;
            }
         }
         return param1;
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         return 1;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _g:NamelessHorror;
         var _loc2_:* = null as Function;
         clearOutput();
         if(get_game().get_silly())
         {
            outputText("凭借着奇迹般的力量和运气，你成功地削弱了这只可怕的怪物，迫使它屈服。它会在片刻之后恢复过来，并将你永远放逐，但这可能足以让你做一些你确信宇宙中没有其他存在做到过的事情……");
            get_game().menu();
            get_game().addButton(0,"口交",areYouFuckingSerious).hint("冲进去，让无名恐怖给你口交。");
            _g = this;
            _loc2_ = function():void
            {
               _g.banish();
            };
            get_game().addButton(1,"等待",_loc2_).hint("最好谨慎行事，等待时机。");
         }
         else
         {
            banish(true);
         }
      }
      
      public function conjoin() : void
      {
         outputText("怪物发出尖叫，导致你的视线模糊，空间本身扭曲并弯曲成不可能的形状！凭借这种令人发狂的超维度视觉，你瞥见了考验你核心的宇宙现实；你是它的一部分，它也是你的一部分。");
         outputText("[pg]幻象破灭了，你也是。");
         get_player().takeDamage(get_player().get_HP() * 0.25 * doomLevel,true);
         doomLevel += 1;
      }
      
      public function becomeNothingness() : void
      {
         outputText("怪物发出尖叫，用一波震撼你核心的声波冲击你。当你恢复过来时，你被一种奇怪的感觉击中——就好像你根本不存在一样。<b>你是无形的，你的伤害降为零！</b>");
         get_player().createStatusEffect(StatusEffects.Nothingness,2,0,0,0);
      }
      
      public function banish(param1:Boolean = false) : void
      {
         get_game().dungeons.manor.banish(param1);
      }
      
      public function areYouFuckingSerious() : void
      {
         var defeatedHorror:Boolean;
         var _g:NamelessHorror;
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(get_flags(),2709,1);
         if(!get_player().hasCock())
         {
            outputText("你突然长出了一根临时的肉棒，为什么不呢。[pg]");
         }
         outputText("这只令人毛骨悚然的怪物支离破碎，发出刺耳的尖叫声，然后崩溃了。在你的强大力量面前，没有神明。");
         outputText("[pg]你走近这个无定形的构造体，同时露出你坚挺的肉棒。随着你每一次靠近，这只怪物那明显的巨口变得越来越难以追踪。这种怪物的本质呈现出一种对物理空间的复杂诠释，但这并不能阻止你。你将双手伸入其中，向前挺动你的肉棒，让创造了这个该死实体的任何东西引导你找到目标。");
         outputText("[pg]熟悉的尖叫声再次响起，现在被阳具的阻挡声所掩盖。看来你成功了。你要求这个可怜的东西为你口交；如果你必须这样做，你会毫不犹豫地进一步痛击它。肉质的黑暗触手开始蔓延到你的身体上，似乎在吞噬你，但它似乎也在顺从。湿润的褶皱滑过你的肉棒，从中间开始，同时向根部和顶部蔓延。这种感觉反复出现，总是从中间开始。在持续的动作中，你感觉到浑浊的液体轻轻地喷洒在每一寸没有被抚摸的肌肤上。");
         outputText("[pg]触手仍在你的身体上爬行。你不知道自己发生了什么，只知道天堂般的幸福在等待着你。你是一个充满快感的生物，漂浮在黑色的海洋中，彩虹的缕缕光芒昏暗地照亮了虚空。你身体的颤抖表明高潮即将来临，你做好了准备，但时间流逝。超越肉体的自我核心融化并重塑，最终在性高潮的幸福中爆发。如此甜蜜和完整，因为无限带走了你。\n");
         get_game().awardAchievement("修格斯领主假说",282,true,true);
         _g = this;
         defeatedHorror = true;
         doNext(function():void
         {
            _g.banish(defeatedHorror);
         });
      }
   }
}

