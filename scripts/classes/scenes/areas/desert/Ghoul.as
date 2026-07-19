package classes.scenes.areas.desert
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
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
   
   public class Ghoul extends Monster
   {
      
      public var spellCostGhoulMagic:int;
      
      public var spellCostBlind:int;
      
      public var revealedDesc:String;
      
      public var ghoulReveal:Boolean;
      
      public var WING_VARIATIONS:Array;
      
      public var WEAPON_VARIATIONS:Array;
      
      public var VIRGIN_VARIATIONS:Array;
      
      public var TONGUE_VARIATIONS:Array;
      
      public var TAIL_VARIATIONS:Array;
      
      public var SKINTYPE_VARIATIONS:Array;
      
      public var SKINCOLOR_VARIATIONS:Array;
      
      public var LEG_VARIATIONS:Array;
      
      public var HORN_VARIATIONS:Array;
      
      public var HIP_VARIATIONS:Array;
      
      public var HAIRTYPE_VARIATIONS:Array;
      
      public var HAIRCOLOR_VARIATIONS:Array;
      
      public var FACE_VARIATIONS:Array;
      
      public var EYES_VARIATIONS:Array;
      
      public var EARS_VARIATIONS:Array;
      
      public var BUTT_VARIATIONS:Array;
      
      public var ARM_VARIATIONS:Array;
      
      public var ARMOR_VARIATIONS:Array;
      
      public function Ghoul()
      {
         var _loc42_:int = 0;
         var _loc46_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         WING_VARIATIONS = ["无","小巧的，蜜蜂般的","巨大的，蜜蜂般的","鹰身女妖","小恶魔","大型小恶魔","微小的，蝙蝠般的","巨大的，蝙蝠般的","鲨鱼鳍","巨大的，长满羽毛的","小型，龙族","大型，龙族","巨型蜻蜓"];
         HORN_VARIATIONS = ["无","恶魔","牛","牛头人","2个龙族","4个12英寸长的龙族","鹿角","山羊","独角兽","犀牛"];
         TAIL_VARIATIONS = ["不存在","马","狗","恶魔","牛","蜘蛛腹部","蜜蜂腹部","鲨鱼","猫娘","蜥蜴人","兔子","鹰身女妖","袋鼠人","狐狸","龙族","浣熊","老鼠","雪貂","猪","蝎子","山羊","犀牛","针鼹","鹿","火蜥蜴","狼"];
         ARMOR_VARIATIONS = ["蜜蜂铠甲","锁子甲","龙鳞铠甲","凝胶铠甲","皮甲","板甲","武士铠甲","鳞甲","蛛丝铠甲","舞会礼服","皮袍","束缚带","锁子甲比基尼","高级西装","舒适的衣服","绿色冒险者服装","和服","护士服","背带裤","长袍","橡胶服","紧身衣","淫荡泳装","蛛丝长袍","香艳诱惑铠甲","巫师长袍","裸体"];
         WEAPON_VARIATIONS = ["剑","刺剑","弯刀","武士刀","戟","斧","匕首"];
         EYES_VARIATIONS = ["无","人类","四蜘蛛","黑沙陷阱","蜥蜴人","龙","蛇怪","狼"];
         TONGUE_VARIATIONS = ["不存在","人类","蛇","恶魔","龙族","针鼹","蜥蜴人"];
         EARS_VARIATIONS = ["无","人类","马","狗","牛","精灵","猫娘","蜥蜴人","兔娘","袋鼠人","狐狸","龙","浣熊","老鼠","雪貂","猪","犀牛","针鼹","鹿","狼"];
         FACE_VARIATIONS = ["没有","人类","马","狗","牛","牛头人","长着鲨鱼牙齿的鲨鱼","长着蛇牙的蛇","猫娘","蜥蜴人","兔娘","袋鼠人","长着蜘蛛毒牙的蜘蛛","狐狸","龙","浣熊面纹","浣熊","像老鼠一样，长着龅牙","老鼠","雪貂面具","雪貂","猪","野猪","犀牛","针鼹","鹿","狼"];
         HAIRTYPE_VARIATIONS = ["普通","羽毛","幽灵","粘液","海葵","翎毛","蛇怪棘刺","蛇怪翎毛"];
         HAIRCOLOR_VARIATIONS = ["赤褐色的","黑橙相间的","黑白斑点的","黑黄相间的","黑色的","金色的","金色的","蓝色的","棕色的","蔚蓝色的","深蓝色的","深红色的","翠绿色的","金黄色的","金黄色的","灰色的","绿色的","浅金色的","漆黑色的","橙色","粉色","白金色","紫色","红色","红橙色","沙金色","沙棕色","亮黑色","银金色","银白色","银色","透明","黑白相间","白色"];
         SKINTYPE_VARIATIONS = ["皮肤","皮毛","蜥蜴人鳞片","粘液","龙鳞"];
         SKINCOLOR_VARIATIONS = ["白化","无光蓝黑色","苍灰蓝色","苍灰色","黑色的","蓝色的","棕色的","蔚蓝色的","深绿色","深色","乌黑色","翠绿色的","惨白色","灰色的","灰蓝色","绿色的","靛蓝色","浅色","乳白色","橄榄色","橙黑相间的条纹","橙色","苍白色","淡黄色","苍白","粉色","紫色","红色","粗糙的灰色","黑貂色","血红色","亮黑色","银色","棕褐色","白色"];
         ARM_VARIATIONS = ["无","人类","鹰身女妖","蜘蛛","掠食者","火蜥蜴","狼"];
         LEG_VARIATIONS = ["没有","人类","有蹄的","狗","娜迦","恶魔高跟鞋","恶魔之爪","蜂娘","粘液","猫娘","蜥蜴人","小马","兔娘","鹰身女妖","袋鼠人","几丁质蜘蛛腿","蛛化精灵下半身","狐狸","龙","浣熊","雪貂","偶蹄","针鼹","火蜥蜴","狼"];
         BUTT_VARIATIONS = ["开裆","紧致","普通","明显","大","颤巍巍的","丰盈的","巨大的","大到不可思议"];
         HIP_VARIATIONS = ["男孩气的","苗条的","普通","丰满","曲线优美","多产","宽得非人"];
         VIRGIN_VARIATIONS = [true,false];
         spellCostGhoulMagic = 12;
         spellCostBlind = 8;
         ghoulReveal = false;
         super();
         var _loc1_:Array = VIRGIN_VARIATIONS;
         var _loc2_:Boolean = Boolean(_loc1_[Utils.rand(int(_loc1_.length))]);
         var _loc3_:Array = HIP_VARIATIONS;
         var _loc4_:String = _loc3_[Utils.rand(int(_loc3_.length))];
         var _loc5_:Array = BUTT_VARIATIONS;
         var _loc6_:String = _loc5_[Utils.rand(int(_loc5_.length))];
         var _loc7_:Array = LEG_VARIATIONS;
         var _loc8_:String = _loc7_[Utils.rand(int(_loc7_.length))];
         var _loc9_:Array = ARM_VARIATIONS;
         var _loc10_:String = _loc9_[Utils.rand(int(_loc9_.length))];
         var _loc11_:Array = SKINCOLOR_VARIATIONS;
         var _loc12_:String = _loc11_[Utils.rand(int(_loc11_.length))];
         var _loc13_:Array = SKINTYPE_VARIATIONS;
         var _loc14_:String = _loc13_[Utils.rand(int(_loc13_.length))];
         var _loc15_:Array = HAIRCOLOR_VARIATIONS;
         var _loc16_:String = _loc15_[Utils.rand(int(_loc15_.length))];
         var _loc17_:Array = HAIRTYPE_VARIATIONS;
         var _loc18_:String = _loc17_[Utils.rand(int(_loc17_.length))];
         var _loc19_:Array = FACE_VARIATIONS;
         var _loc20_:String = _loc19_[Utils.rand(int(_loc19_.length))];
         var _loc21_:Array = EARS_VARIATIONS;
         var _loc22_:String = _loc21_[Utils.rand(int(_loc21_.length))];
         var _loc23_:Array = TONGUE_VARIATIONS;
         var _loc24_:String = _loc23_[Utils.rand(int(_loc23_.length))];
         var _loc25_:Array = EYES_VARIATIONS;
         var _loc26_:String = _loc25_[Utils.rand(int(_loc25_.length))];
         var _loc27_:Array = WEAPON_VARIATIONS;
         var _loc28_:String = _loc27_[Utils.rand(int(_loc27_.length))];
         var _loc29_:Array = ARMOR_VARIATIONS;
         var _loc30_:String = _loc29_[Utils.rand(int(_loc29_.length))];
         var _loc31_:Array = TAIL_VARIATIONS;
         var _loc32_:String = _loc31_[Utils.rand(int(_loc31_.length))];
         var _loc33_:Array = HORN_VARIATIONS;
         var _loc34_:String = _loc33_[Utils.rand(int(_loc33_.length))];
         var _loc35_:Array = WING_VARIATIONS;
         var _loc36_:String = _loc35_[Utils.rand(int(_loc35_.length))];
         set_a("");
         set_short("");
         imageName = "ghoul";
         set_long("");
         set_race("");
         if(Utils.rand(2) == 0)
         {
            createCock(Utils.rand(4) + 5,Utils.rand(2) + 1,CockTypesEnum.DISPLACER);
            balls = 2;
            ballSize = Utils.rand(2) + 1;
            createBreastRow();
         }
         else
         {
            createVagina(_loc2_,Utils.rand(6) + 1,Utils.rand(7) + 1);
            createBreastRow(Utils.rand(5) + 1,Utils.rand(2) + 1);
         }
         var _loc37_:int = Utils.rand(4);
         ass.analLooseness = _loc37_ + 1;
         var _loc38_:int = Utils.rand(4);
         ass.analWetness = _loc38_ + 1;
         pronoun1 = "它";
         pronoun2 = "它";
         pronoun3 = "它的";
         set_tallness(Utils.rand(18) + 59);
         var _loc39_:int = Utils.rand(19);
         hips.rating = _loc39_ + 1;
         var _loc40_:int = Utils.rand(19);
         butt.rating = _loc40_ + 1;
         var _loc41_:int = Utils.rand(25);
         lowerBody.type = _loc41_ + 1;
         arms.set_type(Utils.rand(5) + 1);
         skin.tone = _loc12_;
         skin.setType(Utils.rand(5));
         hair.length = Utils.rand(25);
         if(hair.length > 0)
         {
            hair.color = _loc16_;
            _loc42_ = Utils.rand(7);
            hair.type = _loc42_ + 1;
         }
         else
         {
            hair.type = 0;
         }
         _loc42_ = Utils.rand(23);
         face.type = _loc42_ + 1;
         var _loc43_:int = Utils.rand(19);
         ears.type = _loc43_ + 1;
         var _loc44_:int = Utils.rand(4);
         tongue.type = _loc44_ + 1;
         var _loc45_:int = Utils.rand(5);
         eyes.type = _loc45_ + 1;
         initStrTouSpeInte(45,30,55,25);
         initLibSensCor(0,0,50);
         set_weaponName(_loc28_);
         set_weaponVerb("slash");
         set_weaponAttack(Utils.rand(4) + 2);
         set_armorName(_loc30_);
         set_armorDef(Utils.rand(5) + 2);
         bonusHP = 100;
         set_lust(0);
         lustVuln = 0;
         temperment = 0;
         set_fatigue(0);
         level = 4;
         set_gems(Utils.rand(25) + 5);
         set_drop(new WeightedChoice(get_consumables().ECTOPLS,1));
         tail.type = Utils.rand(26);
         horns.value = Utils.rand(4);
         if(horns.value > 0)
         {
            _loc46_ = Utils.rand(7);
            horns.type = _loc46_ + 1;
         }
         else
         {
            horns.type = 0;
         }
         wings.type = Utils.rand(13);
         antennae.type = Utils.rand(2);
         if(antennae.type == 2)
         {
            antennae.type = 2;
         }
         else
         {
            antennae.type = 0;
         }
         var _loc47_:String = horns.type != 0 ? _loc34_ + "角，" : "";
         revealedDesc = "The ghoul is one of the more bizarre things you\'ve seen, with a " + _loc20_ + " face, " + _loc10_ + " arms, and a " + _loc8_ + " lower body." + ("Its face is complete with " + _loc26_ + " eyes and a " + _loc24_ + " tongue.") + ("It also has " + _loc36_ + " wings, " + _loc47_ + " and a " + _loc32_ + " tail above its [ass].") + ("It has " + _loc16_ + " " + _loc18_ + " hair, " + _loc12_ + " " + _loc14_ + ", " + _loc4_ + " hips, and a " + _loc6_ + " butt.") + ("It wields a " + _loc28_ + " for a weapon and wears " + _loc30_ + " as armor.");
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("\n食尸鬼发出厌恶的声音，一言不发地消失了。");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().desert.ghoulScene.ghoulWon();
         }
         ghoulReveal = false;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 1)
         {
            if(!ghoulReveal)
            {
               outputText("你的[weapon]击中了鬣狗，它向后退缩，随后在一阵沙尘中消失了。你惊讶地踉跄后退，抬头看到空中有一只咆哮着的幽灵般的生物。你的敌人根本不是鬣狗。<b>那是一只食尸鬼！</b>[pg]");
               if(get_game().get_silly())
               {
                  outputText("<b>野生食尸鬼的幻象消失了！</b>[pg]");
               }
               ghoulReveal = true;
            }
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(hyenaClaw,1,!ghoulReveal,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(hyenaBite,1,!ghoulReveal,0,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(ghoulMagic,2,ghoulReveal && !get_player().hasStatusEffect(StatusEffects.Blind),spellCostGhoulMagic,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(ghoulBlind,2,ghoulReveal,spellCostBlind,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(eAttack,6,ghoulReveal,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function hyenaClaw() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("鬣狗挥爪向你抓来，但因为失明抓空了！");
            return;
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("鬣狗挥爪向你抓来，但你轻松地躲开了。");
            return;
         }
         outputText("鬣狗挥爪向你抓来，重重地挠下，疼得你大叫起来。");
         _loc1_ = Utils.rand(5) + 5;
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function hyenaBite() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind))
         {
            outputText("鬣狗向你扑来，想要咬你，但因为失明完全扑了个空！");
            return;
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("鬣狗向你扑来，想要咬你，但你轻松地躲开了。");
            return;
         }
         outputText("鬣狗向你扑来，将牙齿深深地刺入你的身体。");
         _loc1_ = Utils.rand(10) + 5;
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function ghoulMagic() : void
      {
         var _loc1_:int = 0;
         outputText("食尸鬼念诵着咒语，一个黑暗的炼金法阵在你的脚下形成。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("在发生任何事情之前，你跳出了法阵。你刚才所在的地方喷发出了火焰。");
            return;
         }
         outputText("黑色的火焰从法阵中喷涌而出，剧痛让你全身抽搐，仿佛每一寸肌肤都被烧灼。");
         _loc1_ = Utils.rand(10) + 10;
         _loc1_ = get_player().reduceDamage(_loc1_,this);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function ghoulBlind() : void
      {
         outputText("食尸鬼怒视着你，并用手指着你！一道强光在你面前爆发！");
         if(Utils.rand(get_player().get_inte() / 5) <= 4)
         {
            outputText("<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
         }
         else
         {
            outputText("你在千钧一发之际闭上了眼睛！");
         }
      }
      
      override public function get_short() : String
      {
         var _loc1_:String = "";
         if(ghoulReveal)
         {
            _loc1_ += "食尸鬼";
         }
         else if(!ghoulReveal)
         {
            _loc1_ += "鬣狗";
         }
         return _loc1_;
      }
      
      override public function get_long() : String
      {
         if(ghoulReveal)
         {
            return revealedDesc;
         }
         return "这只鬣狗看起来像是一只普通的斑鬣狗，淡棕色的皮毛上布满了深棕色的斑点。它的前躯强壮有力，而相比之下，它的后躯则明显发育不良。它有一个扁平的鼻子，末端是一个黑色的鼻子，还有弯曲直立的耳朵，尖端是黑色的。它的眼睛紧紧地盯着你，以防你有什么突然的动作。视线内似乎没有其他鬣狗，你忍不住去想，沙漠里竟然有一只鬣狗，这有多奇怪。";
      }
      
      override public function defeated(param1:Boolean) : void
      {
         clearOutput();
         outputText("食尸鬼发出了一声愤怒的尖叫，你的攻击已经让它无法承受，它随即化作一团沙尘消散。你盯着那个位置，怀疑刚才发生的一切是不是幻觉。");
         get_game().combat.cleanupAfterCombat();
         ghoulReveal = false;
      }
   }
}

