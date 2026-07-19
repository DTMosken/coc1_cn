package classes.scenes.areas.volcanicCrag
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class CorruptedWitch extends Monster
   {
      
      public function CorruptedWitch()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Corrupted Witch");
         imageName = "corrwitch";
         set_long("这个堕落魔女在女性中算是中等偏高的身材，大约五英尺八英寸。她的皮肤是暗灰色的。一层汗水覆盖着她的身体，可能是因为酷热造成的，这也凸显了她健美的身材。她的大部分脸都被一个带有精美金色装饰的红色丝绸兜帽遮住了。兜帽遮住了她丰满的嘴唇和长长的红发，让她看起来像个幽灵。她上半身只穿着一件黑色的紧身胸衣，勉强遮住乳头和挺拔的乳房，露出了她紧致的腹部。她戴着长过手肘的黑色皮手套，穿着及大腿的皮靴，还有一条长长的破旧红色丝绸裙子，裙摆拖到脚后跟。这条裙子根本遮不住她的腿，因为大部分布料都被拉到了后面，可能是故意的。");
         balls = 0;
         ballSize = 0;
         cumMultiplier = 3;
         set_hoursSinceCum(20);
         createVagina(false,5,2);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(Utils.rand(12) + 55);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "ashen";
         hair.color = "red";
         hair.length = 15;
         initStrTouSpeInte(55,65,35,85);
         initLibSensCor(55,40,80);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_armorName("robes");
         bonusHP = 300;
         set_lust(30);
         lustVuln = 0.8;
         temperment = 2;
         level = 18;
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice().addMany(1,get_consumables().LABOVA_,get_consumables().W__BOOK,get_consumables().B__BOOK,get_consumables().G__BOOK,null));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]女巫脸色苍白地后退，留下你自生自灭。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().volcanicCrag.corruptedWitchScene.loseToWitch();
         }
      }
      
      public function shellDefense() : void
      {
         outputText("堕落魔女开始进行一种听不见但优美的吟唱。她的声音在音调和强度上不断上升，直到她尖叫出充满力量的咒语。伴随着最后一声大喊，她张开双臂，一些烧焦的尘土从地上升起。尘土很快落下，但堕落魔女周围现在出现了一种闪闪发光的反光护盾！");
         createStatusEffect(StatusEffects.Shell,3,0,0,0);
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 3)
         {
            if(get_player().hasStatusEffect(StatusEffects.CorrWitchBind))
            {
               corrWitchGrabFail(true);
               tookAction = true;
               return false;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         if(HPRatio() < 0.6 && get_fatigue() <= 90 && get_player().hasCock())
         {
            corrWitchHeals();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(forceQueen,1,true,10,FATIGUE_MAGICAL,CombatRange.Melee);
         _loc1_.add(breedTrance,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(shellDefense,3,!hasStatusEffect(StatusEffects.Shell),10,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(cumHungerAttack,1,get_player().hasVagina(),10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function forceQueen() : void
      {
         outputText("堕落的女巫后退了一步，以不自然的力量和速度向你跳来。\n");
         var _loc1_:int = 5 + Utils.rand(8);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
         if(_loc4_.dodge == EVASION_EVADE)
         {
            outputText("\n你从她身边滚开，轻松避开了她的跳跃攻击。");
         }
         else if(_loc4_.dodge == EVASION_MISDIRECTION)
         {
            outputText("\n你向一个方向佯攻，然后向另一个方向移动，像专业人士一样误导她，避开了她的猛扑。");
         }
         else if(_loc4_.dodge == EVASION_FLEXIBILITY)
         {
            outputText("\n你扭身躲开，充分利用你猫一般的反应速度避开了她的跳跃攻击。");
         }
         else if(_loc4_.dodge == EVASION_SPEED || _loc4_.dodge != null)
         {
            outputText("\n你的速度足够快，在她落地之前拉开了距离，避开了攻击。");
         }
         else
         {
            outputText("\n她胯部朝下落在你的脸上，用力将你摔倒在地。然后她合拢双腿，将你的头锁在双腿之间，嘴巴贴着她流着口水的阴道。她开始取悦自己的阴蒂，你忍不住闻到她小穴的味道，喝下她的淫液。");
            outputText("[pg][say:别挣扎了！或者别停，你扭动的样子感觉棒极了。]被这样一个丰满的女人压在身下，看着她取悦自己，无疑让你兴奋起来。你必须制服她！");
            if(!get_player().hasPerk(PerkLib.Juggernaut) && get_armorPerk() != "Heavy")
            {
               get_player().takeDamage(2 + Utils.rand(20),true);
               get_player().createStatusEffect(StatusEffects.CorrWitchBind,0,0,0,0);
            }
            else
            {
               outputText("[pg]你奋力挣扎，赶在她造成太大伤害之前将她推开，这让她大吃一惊。");
            }
            get_player().takeLustDamage(5 + get_player().lib / 10);
            set_lust(-5);
            if(get_lust() < 0)
            {
               set_lust(0);
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().volcanicCrag.corruptedWitchScene.defeatWitch();
      }
      
      public function cumMagicAttack() : void
      {
         outputText("堕落魔女双手比划着，口中念出无法发音的咒语，然后紧紧握紧拳头。就在那一瞬间，你感到[balls]传来一阵暖意，蔓延的热量让你因不断增长的欲望而颤抖。一秒钟后，[eachCock]开始跳动，一股精液从[cockHead]流出，这暗示着你的男子气概被暂时增强了。");
         var _loc1_:CoC = get_game();
         var _loc2_:Array = [DynStat.Lust(5 + get_player().lib / 12)];
         if(int(_loc2_.length) == 0)
         {
            _loc1_.player.dynStats();
         }
         else if(int(_loc2_.length) == 1)
         {
            _loc1_.player.dynStats(_loc2_[0]);
         }
         else if(int(_loc2_.length) == 2)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
         }
         else if(int(_loc2_.length) == 3)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
         }
         else if(int(_loc2_.length) == 4)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
         }
         else if(int(_loc2_.length) == 5)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         }
         else if(int(_loc2_.length) == 6)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
         }
         else if(int(_loc2_.length) == 7)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(int(_loc2_.length) == 8)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
         }
         else if(int(_loc2_.length) == 9)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(int(_loc2_.length) == 10)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(int(_loc2_.length) == 11)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
         }
         else if(int(_loc2_.length) == 12)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
         }
         else if(int(_loc2_.length) == 13)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
         }
         else if(int(_loc2_.length) == 14)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
         }
         else if(int(_loc2_.length) == 15)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
         }
         else if(int(_loc2_.length) == 16)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
         }
         else if(int(_loc2_.length) == 17)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
         }
         else if(int(_loc2_.length) == 18)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
         }
         else if(int(_loc2_.length) == 19)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
         }
         else
         {
            if(int(_loc2_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
         }
         var _loc3_:Player = get_player();
         _loc3_.set_hoursSinceCum(_loc3_.get_hoursSinceCum() + 100);
      }
      
      public function cumHungerAttack() : void
      {
         outputText("堕落魔女发出淫靡的呻吟，做出几个神秘的动作，并张开手指。与此同时，你感觉到她的魔法猛击你的腹部，钻入你的子宫。");
         if(get_player().get_pregnancyIncubation() > 0)
         {
            outputText("然而，无论她试图做什么都失败了，因为她那超凡脱俗的魔法一接触到你就瓦解了。");
            return;
         }
         outputText("它在你的子宫周围蠕动，轻轻地挠痒，然后温柔地揉捏你的卵巢。随着子宫的跳动，你的[legs]发软，渴望有什么东西能填满它。魔法消退时，一股湿润的液体从你的[vagina]喷出，你因欲望高涨而扭动。要是能有什么东西让你怀孕就好了！你的目光不由自主地投向魔女的腹股沟，然后你猛地移开视线。");
         var _loc1_:CoC = get_game();
         var _loc2_:Array = [DynStat.Lust(5 + get_player().lib / 12)];
         if(int(_loc2_.length) == 0)
         {
            _loc1_.player.dynStats();
         }
         else if(int(_loc2_.length) == 1)
         {
            _loc1_.player.dynStats(_loc2_[0]);
         }
         else if(int(_loc2_.length) == 2)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
         }
         else if(int(_loc2_.length) == 3)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
         }
         else if(int(_loc2_.length) == 4)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
         }
         else if(int(_loc2_.length) == 5)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         }
         else if(int(_loc2_.length) == 6)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
         }
         else if(int(_loc2_.length) == 7)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(int(_loc2_.length) == 8)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
         }
         else if(int(_loc2_.length) == 9)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(int(_loc2_.length) == 10)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(int(_loc2_.length) == 11)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
         }
         else if(int(_loc2_.length) == 12)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
         }
         else if(int(_loc2_.length) == 13)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
         }
         else if(int(_loc2_.length) == 14)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
         }
         else if(int(_loc2_.length) == 15)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
         }
         else if(int(_loc2_.length) == 16)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
         }
         else if(int(_loc2_.length) == 17)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
         }
         else if(int(_loc2_.length) == 18)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
         }
         else if(int(_loc2_.length) == 19)
         {
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
         }
         else
         {
            if(int(_loc2_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
         }
      }
      
      public function corrWitchStruggle() : void
      {
         if(Utils.rand(100) >= get_player().get_str() || Utils.rand(10) == 0)
         {
            corrWitchGrabFail();
         }
         else
         {
            corrWitchGrabSuccess();
         }
         tookAction = true;
      }
      
      public function corrWitchHeals() : void
      {
         var _loc1_:Number = NaN;
         outputText("女巫笑了笑，在空中做了一系列神秘的动作。到最后，看起来她好像在拉扯什么东西。然后你感觉到你的" + (get_player().balls > 0 ? "睾丸从内部被挤压，精液被强行从中抽出" : "前列腺从内部被挤压，精液被强行从中抽出") + "。精液离开了你[cock largest]的尿道，你处于极度的痛苦和快感之中，什么也做不了。女巫引导着你的精液进入她的嘴里，她吞下了");
         if(get_player().cumQ() < 100)
         {
            outputText("所有的精液，舔了舔嘴唇，确保每一滴都被吞下。\n[say: 就这？你一定是个很弱的种马。]");
            _loc1_ = 0.1;
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("所有的精液，舔了舔嘴唇，确保每一滴都被吞下。\n[say: 啊，清爽又美味。你作为种马很有潜力。我会确保它得到充分发挥。]");
            _loc1_ = 0.2;
         }
         else
         {
            outputText("喝下了一部分，由于你巨大的射精量，她被呛到了。\n[say:不可思议！我们将从……检查你中了解到很多。]");
            _loc1_ = 0.3;
         }
         outputText("\n当她喝完时，你注意到她的伤口愈合了！");
         var _loc2_:int = int(maxHP() * _loc1_);
         addHP(_loc2_);
         outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + _loc2_ + "</font>)</b>");
         set_fatigue(get_fatigue() + 10);
      }
      
      public function corrWitchGrabSuccess() : void
      {
         clearOutput();
         if(get_player().get_str() >= 100)
         {
            outputText("你用非人的力量将魔女强行从你身上甩开。她迅速爬起来，惊讶于你的力量，而你则擦去嘴边的淫液。");
         }
         else
         {
            outputText("你设法抬起她的胯部，争取到足够的时间喘息，然后用新获得的力量将她推开。她迅速爬起来，你擦去嘴边的淫液。\n[say: 下次，你要乖乖躺着直到我完事，听见了吗？] 魔女用性感的嗓音说道。");
         }
         get_player().removeStatusEffect(StatusEffects.CorrWitchBind);
      }
      
      public function corrWitchGrabFail(param1:Boolean = true) : void
      {
         clearOutput();
         if(param1)
         {
            if(get_player().get_str() >= 80)
            {
               outputText("你有足够的力量制服她，但由于窒息，你无法发挥出全部力量。你的挣扎只会让魔女感到愉悦，她的呻吟声反而增加了你的欲望。");
            }
            else if(get_player().get_str() >= 60 && get_player().get_str() < 80)
            {
               outputText("你或许有足够的力量制服她，但由于窒息，你无法发挥出全部力量。你的挣扎只会让魔女感到愉悦，她的呻吟声反而增加了你的欲望。");
            }
            else if(get_player().get_str() < 60)
            {
               outputText("你几乎没有足够的力量制服她，而且窒息更是雪上加霜。你的挣扎只会让魔女感到愉悦，她的呻吟声反而增加了你的欲望。");
            }
         }
         else
         {
            outputText("你放松下来，任由魔女施为。也许这种处境也没那么糟？");
         }
         set_lust(-5);
         if(get_lust() < 0)
         {
            set_lust(0);
         }
         var _loc2_:CoC = get_game();
         var _loc3_:Array = [DynStat.Lust(5 + get_player().lib / 10)];
         if(int(_loc3_.length) == 0)
         {
            _loc2_.player.dynStats();
         }
         else if(int(_loc3_.length) == 1)
         {
            _loc2_.player.dynStats(_loc3_[0]);
         }
         else if(int(_loc3_.length) == 2)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1]);
         }
         else if(int(_loc3_.length) == 3)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2]);
         }
         else if(int(_loc3_.length) == 4)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
         }
         else if(int(_loc3_.length) == 5)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
         }
         else if(int(_loc3_.length) == 6)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5]);
         }
         else if(int(_loc3_.length) == 7)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
         }
         else if(int(_loc3_.length) == 8)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7]);
         }
         else if(int(_loc3_.length) == 9)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         else if(int(_loc3_.length) == 10)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
         }
         else if(int(_loc3_.length) == 11)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10]);
         }
         else if(int(_loc3_.length) == 12)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11]);
         }
         else if(int(_loc3_.length) == 13)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12]);
         }
         else if(int(_loc3_.length) == 14)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
         }
         else if(int(_loc3_.length) == 15)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14]);
         }
         else if(int(_loc3_.length) == 16)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15]);
         }
         else if(int(_loc3_.length) == 17)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16]);
         }
         else if(int(_loc3_.length) == 18)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17]);
         }
         else if(int(_loc3_.length) == 19)
         {
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18]);
         }
         else
         {
            if(int(_loc3_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            _loc2_.player.dynStats(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19]);
         }
         get_player().takeDamage(20);
         outputText("[pg]");
      }
      
      public function corrWitchAI() : void
      {
         if(HPRatio() < 0.6 && get_fatigue() <= 90 && get_player().hasCock())
         {
            corrWitchHeals();
            return;
         }
         var _loc1_:Array = [];
         if(get_player().hasCock())
         {
            _loc1_[int(_loc1_.length)] = cumMagicAttack;
         }
         _loc1_[int(_loc1_.length)] = forceQueen;
         _loc1_[int(_loc1_.length)] = breedTrance;
         if(!hasStatusEffect(StatusEffects.Shell))
         {
            _loc1_[int(_loc1_.length)] = shellDefense;
            _loc1_[int(_loc1_.length)] = shellDefense;
            _loc1_[int(_loc1_.length)] = shellDefense;
         }
         if(get_player().hasVagina())
         {
            _loc1_[int(_loc1_.length)] = cumHungerAttack;
         }
         _loc1_[Utils.rand(int(_loc1_.length))]();
      }
      
      public function breedTrance() : void
      {
         var _loc1_:Number = NaN;
         outputText("魔女做了一系列手势，然后指向你。你感到视线模糊，失去了平衡。\n");
         if(get_player().hasCock())
         {
            if(get_player().get_inte() < 100)
            {
               outputText("\n你正疯狂地在一个堕落魔女身上抽插，你的[cocks]因难以忍受的欲望而跳动。你今天已经让六个魔女怀孕了，但你的欲望似乎并没有减弱。她的呻吟和扭动只会助长你的欲望，随着高潮的临近，你抽插得越来越快，越来越用力。\n");
               _loc1_ = 1;
            }
            if(get_player().get_inte() < 80)
            {
               outputText("当你高潮时，你发出一声呻吟，魔女意识到这是她的信号，用她结实的双腿将你的身体锁在她的身上，确保她的子宫接收你所有的精液。\n在她的体内射了几次之后，她松开了双腿，精疲力尽，受精完成。\n");
               _loc1_ = 2;
            }
            if(get_player().get_inte() < 60)
            {
               outputText("[pg]然而，你的欲望并没有减少。你的" + (get_player().cockTotal() > 1 ? "[cocks]" : "[cock]") + "仍然因欲望而疯狂跳动，随着每一次跳动喷出先列腺液和精液，而另一个魔女躺在你旁边的床上。只需看一眼她湿润的阴唇，就足以让你失去控制。你将阴茎引导到魔女的阴道，继续你野兽般的交配。\n你感觉到身体的耐力开始下降，另一个魔女温柔地转过你的头，在你的嘴上印下一个吻，强行喂你喝下某种混合物。\n");
               _loc1_ = 3;
            }
            if(get_player().get_inte() < 40)
            {
               outputText("这种混合物瞬间让你的身体恢复了活力，你以更强的力量继续做爱。不久之后，高潮和射精降临，魔女再次用双腿锁住你，完全接收你的种子。");
               outputText("[pg]你从受精的魔女体内拔出，倒在床上，享受着高潮带来的最后几丝快感。一个年长的魔女走近你。[say: 我们拥有多么棒的种马啊。我们是多么幸运，你自愿献身，余生都为我们魔女服务。]\n");
               _loc1_ = 4;
            }
            if(get_player().get_inte() < 20)
            {
               outputText("你盲目地顺从点头。你曾有过犹豫，但成为这些堕落魔女的种马是你做过的最好的决定。除了做爱，什么都不用想，她们已经把你的身体腐化得如此彻底，以至于你的高潮无比强烈。这就是天堂。没有任何理由反抗。");
               outputText("[pg]片刻之后，你的" + (get_player().cockTotal() > 1 ? "[cocks]" : "[cock]") + "再次勃起，一滴先列腺液和精液从[cockhead]冒出。\n这种刺痛感促使你伸出手开始自慰，但被年长的魔女拍开了。[pg][say: 不。你不能那样浪费你的精子。我们会找另一个魔女来接纳你。在此期间，没有我的命令，你不能射精。跟我重复。你不会射精。]");
               outputText("[pg]你甚至没有尝试抵抗。她的话语支配着你，而服从带给你的快感不亚于任何一次高潮。");
               get_game().combat.overrideEndOfRoundFunction = get_game().volcanicCrag.corruptedWitchScene.mindControlBadEnd;
            }
            else
            {
               outputText("等一下，这是怎么回事？你摇了摇头，突然清醒过来，驱散了堕落女巫施展的某种幻象。虽然你及时打破了幻境，但它无疑对你的身体产生了影响。");
            }
         }
         else if(get_player().hasVagina())
         {
            if(get_player().get_inte() < 100)
            {
               outputText("你躺在一个昏暗洞穴里的床上。你低头看了看你的[legs]，发现自己正被一个堕落女巫狠狠地操着。你从恍惚的状态中回过神来，被如此彻底地捣弄的快感向你袭来。");
               outputText("[pg]你不断地呻吟着，双手捏着你的[nipples]，在身体上游走，以增强这美妙的感觉。");
               _loc1_ = 1;
            }
            if(get_player().get_inte() < 80)
            {
               outputText("[pg]她高潮了，出于条件反射，你");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("盘绕起来，紧紧挤压着女巫");
               }
               if(get_player().isGoo())
               {
                  outputText("将自己包裹在女巫周围");
               }
               else
               {
                  outputText("用你的[legs]将女巫紧紧锁在你身上");
               }
               outputText("随着你的[vagina]收缩，将她那根极品肉棒里的精液榨得一干二净。几次脉动之后，你松开了她，她从你体内拔出肉棒，你躺在床上，精疲力尽，已经被受精了。\n");
               _loc1_ = 2;
            }
            if(get_player().get_inte() < 60)
            {
               outputText("\n你被两个女巫轻轻扶起，拖到另一个房间，而那个让你受精的扶他则开始操另一个女巫。在那里，你被放在一张舒适的床上，被温柔地抚摸着。这是你今天第三次被这样狂野地操弄了，你的子宫被填得满满的，你几乎觉得自己怀孕了。你非常疲惫，但精液在你体内的感觉给了你一种极其愉悦、温暖的感觉，这种感觉辐射到你的整个身体。\n");
               _loc1_ = 3;
            }
            if(get_player().get_inte() < 40)
            {
               outputText("你抚摸着你的腹部。你要生好多好多孩子！");
               outputText("[pg]一个年长的女巫走近你。[say: 我们有了一个多么棒的母体啊。我们是多么幸运，你自愿献身，在你的余生中为我们女巫服务。你会给我们生几百个孩子来继续我们对抗恶魔的战斗呢？]\n");
               _loc1_ = 4;
            }
            if(get_player().get_inte() < 20)
            {
               outputText("\n很多，你心想。只要你还能生。你曾有过犹豫，但成为这些堕落女巫的母体是你做过的最好的决定。除了生孩子和被操，什么都不用想，而且每次你经历怀孕，你的身体就会变得更快，这意味着你可以更快地被操。女巫们已经极大地腐化了你的身体，以至于你的高潮变得令人难以置信地愉悦。这就是天堂。没有任何理由去抵抗。");
               outputText("[pg]过了一会儿，你的[vagina]再次因渴望而刺痛，女性的淫液从里面漏出来。你伸出手开始自慰，但被年长的女巫拍开了。[pg][say: 不。你必须为你的种马们做好准备。我们会找另一个种马带走你。在此期间，没有我的命令，你不能高潮。跟我重复一遍。你不能高潮。]");
               outputText("[pg]你甚至没有尝试抵抗。她的话语支配着你，而服从带给你的快感不亚于任何一次高潮。");
               get_game().combat.overrideEndOfRoundFunction = get_game().volcanicCrag.corruptedWitchScene.mindControlBadEnd;
            }
            else
            {
               outputText("等一下，这是怎么回事？你摇了摇头，突然清醒过来，驱散了堕落女巫施展的某种幻象。虽然你及时打破了幻境，但它无疑对你的身体产生了影响。");
            }
         }
         else
         {
            outputText("然而，你很快就恢复了，你的视线再次变得清晰。不管她试图施展什么法术，显然对你都不起作用，这让她非常愤怒。");
         }
      }
   }
}

