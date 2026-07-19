package classes.scenes.areas.bog
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class Phouka extends Monster
   {
      
      public function Phouka(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short(param1);
         imageName = "phouka";
         set_long("这只" + get_short() + "在你附近飞来飞去，寻找着破绽。他的外表看起来像个妖精，不过体型稍大，皮肤和翅膀都是煤黑色的。一根巨大的肉棒在他双腿间高高挺立。他那充满欲望的猫一般绿色的眼睛，紧紧跟随着你的一举一动。");
         set_race("Faerie?");
         createCock(1,0.5,CockTypesEnum.HUMAN);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 5;
         set_hoursSinceCum(20);
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(5);
         hips.rating = 2;
         butt.rating = 2;
         lowerBody.type = 0;
         arms.set_type(0);
         skin.tone = "black";
         hair.color = "black";
         hair.length = 1;
         ears.type = 4;
         initStrTouSpeInte(55,25,80,40);
         initLibSensCor(75,35,100);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(15);
         set_armorName("skin");
         set_armorDef(80);
         bonusHP = 300;
         set_lust(30);
         lustVuln = 0.5;
         level = 14;
         set_gems(0);
         set_drop(new WeightedChoice().add(get_consumables().BLACK_D,20).add(get_consumables().RIZZART,10).add(get_consumables().GROPLUS,2).add(get_consumables().SDELITE,13).add(get_consumables().P_WHSKY,35).add(null,20));
         wings.type = 14;
         wings.color = "黑色的";
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
            outputText("[pg]" + get_short() + "饶有兴致地看着。[saystart]真变态！不过那些小东西可受不了威士忌，所以我对它们免疫。现在做个乖");
            if(get_player().hasVagina())
            {
               outputText("女孩，把你的腿给我张开。[sayend][pg]");
            }
            else
            {
               outputText("男孩，把你的屁股给我掰开。[sayend][pg]");
            }
            doNext(get_game().combat.endLustLoss);
         }
         else if(get_player().hasVagina())
         {
            if(get_player().isTaur() || Utils.rand(2) == 0)
            {
               get_game().bog.phoukaScene.phoukaSexHorse(true,!param1);
            }
            else
            {
               get_game().bog.phoukaScene.phoukaSexBunny(true,!param1);
            }
         }
         else
         {
            get_game().bog.phoukaScene.phoukaSexGoat(true,!param1);
         }
      }
      
      override public function teased(param1:Number) : void
      {
         if(param1 >= 10)
         {
            outputText("[pg]面对你的挑逗，" + get_short() + "停止了攻击。它流着口水的肉棒在地上留下了一道先列腺液的痕迹，你感觉它需要尽快结束这场战斗。");
         }
         else if(param1 >= 5)
         {
            outputText("[pg]" + get_short() + "暂时停止了攻击。一团先列腺液从它的肉棒中渗出，然后它摇了摇头，准备再次攻击。");
         }
         else if(param1 > 0)
         {
            outputText("[pg]" + get_short() + "犹豫了一下，放慢了速度。你看到它的肉棒抽动了一下，然后它准备进行下一次攻击。");
         }
         applyTease(param1);
      }
      
      public function phoukaTransformToPhouka() : void
      {
         if(PhoukaScene.phoukaForm == 0)
         {
            return;
         }
         if(PhoukaScene.phoukaForm == 1)
         {
            outputText("兔兽人从你身边跳开，身体开始融化缩小。几秒钟后，原本兔子所在的地方只剩下一个小小的妖精漂浮在空中。[pg]");
         }
         else if(PhoukaScene.phoukaForm == 2)
         {
            outputText("山羊兽人从你身边跳开，身体开始融化变形。几秒钟后，原本山羊所在的地方只剩下一个小小的妖精漂浮在空中。[pg]");
         }
         else
         {
            outputText("马兽人从你身边冲过。你回头看去，纳闷那匹种马跑哪去了。然后你看到那个小小的妖精正飞速折返，准备发动下一次攻击。[pg]");
         }
         set_long("这只" + get_short() + "在你附近飞来飞去，寻找着破绽。他的外表看起来像个妖精，不过体型稍大，皮肤和翅膀都是煤黑色的。一根巨大的肉棒在他双腿间高高挺立。他那充满欲望的猫一般绿色的眼睛，紧紧跟随着你的一举一动。");
         cocks[0].set_cockType(CockTypesEnum.HUMAN);
         cocks[0].cockLength = 1;
         cocks[0].cockThickness = 0.5;
         set_tallness(5);
         set_armorValue(80);
         set_spe(80);
         PhoukaScene.phoukaForm = 0;
      }
      
      public function phoukaTransformToHorse() : void
      {
         if(PhoukaScene.phoukaForm == 3)
         {
            return;
         }
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("妖精突然从空中落下。它的脸上露出专注的神情，身体开始变得越来越大。你惊讶地看着这个生物的形态不断拉长。最后它似乎无法再长大了，定型成了一匹巨大的种马。[pg]");
         }
         else if(PhoukaScene.phoukaForm == 1)
         {
            outputText("兔兽人从你身边跳开，身体开始变大并融化。你惊讶地看着这个生物的形态不断拉长。最后它似乎无法再长大了，定型成了一匹巨大的种马。[pg]");
         }
         else
         {
            outputText("山羊兽人盯着你，似乎觉得再次冲锋不是个好主意。它向后退去，身体开始变得越来越大，特征和体型都在扭曲重塑。最后它似乎无法再长大了，定型成了一匹巨大的种马。[pg]");
         }
         set_long("这只" + get_short() + "绕着你跑大圈，寻找着破绽。他的外表看起来像一匹长着煤黑色皮毛的种马。一根巨大的肉棒在他双腿间高高挺立。他那充满欲望的猫一般绿色的眼睛，紧紧跟随着你的一举一动。");
         cocks[0].set_cockType(CockTypesEnum.HORSE);
         cocks[0].cockLength = 20;
         cocks[0].cockThickness = 2.5;
         set_tallness(86);
         set_armorValue(75);
         set_spe(55);
         PhoukaScene.phoukaForm = 3;
      }
      
      public function phoukaTransformToGoat() : void
      {
         if(PhoukaScene.phoukaForm == 2)
         {
            return;
         }
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("妖精突然从空中落下。它的脸上露出专注的神情，身体开始膨胀扭曲。你眨了眨眼，发现面前现在站着一个4英尺高的山羊兽人。[pg]");
         }
         else if(PhoukaScene.phoukaForm == 1)
         {
            outputText("兔兽人从你身边跳开，身体开始融化改变。你眨了眨眼，发现面前现在站着一个4英尺高的山羊兽人。[pg]");
         }
         else
         {
            outputText("当马兽人向你冲来时，它突然缩小了。你不得不调整防御，因为它现在变成了一个4英尺高的山羊兽人。[pg]");
         }
         set_long("这只" + get_short() + "在刚好够不着的地方来回冲锋，寻找着破绽。他的外表看起来像" + (get_game().get_noFur() ? "长着毛茸茸山羊腿的人类" : "长着煤黑色皮毛的山羊") + "。他长着巨大的黑色亮角，双腿间有一根巨大的肉棒。他那充满欲望的猫一般绿色的眼睛，紧紧跟随着你的一举一动。");
         cocks[0].set_cockType(CockTypesEnum.HUMAN);
         cocks[0].cockLength = 10;
         cocks[0].cockThickness = 1.5;
         set_tallness(48);
         set_armorValue(60);
         set_spe(70);
         PhoukaScene.phoukaForm = 2;
      }
      
      public function phoukaTransformToBunny() : void
      {
         if(PhoukaScene.phoukaForm == 1)
         {
            return;
         }
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("妖精突然从空中落下。它的脸上露出专注的神情，身体开始膨胀扭曲。你眨了眨眼，发现面前现在站着一个5英尺高的兔兽人。[pg]");
         }
         else if(PhoukaScene.phoukaForm == 2)
         {
            outputText("当山羊兽人向你冲来时，它的身体开始变大。等它靠近时，它已经完全变了样，你现在面对的是一个5英尺高的兔兽人。[pg]");
         }
         else
         {
            outputText("当马兽人向你冲来时，它突然缩小了。你不得不调整防御，因为一个5英尺高的兔兽人正朝你跳过来。[pg]");
         }
         set_long("这只" + get_short() + "在你附近跳来跳去，寻找着破绽。他的外表看起来像" + (get_game().get_noFur() ? "除了长耳朵和长着毛茸茸爪子的四肢外，就像个人类" : "长着煤黑色皮毛的兔子") + "。一根巨大的肉棒在他双腿间高高挺立。他那充满欲望的猫一般绿色的眼睛，紧紧跟随着你的一举一动。");
         cocks[0].set_cockType(CockTypesEnum.HUMAN);
         cocks[0].cockLength = 10;
         cocks[0].cockThickness = 1.5;
         set_tallness(60);
         set_armorValue(60);
         set_spe(90);
         PhoukaScene.phoukaForm = 1;
      }
      
      public function phoukaFightSilence() : void
      {
         var _loc1_:* = null;
         outputText(get_capitalA() + get_short() + "从地上抓起一些泥巴，用力糊在自己的肉棒上。撸动几下后，他把泥巴和先列腺液揉成一个球，猛地朝你的脸砸来。");
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 2)
         {
            outputText("因为他瞎了，所以这一击偏得离谱，完全没有打中你。");
         }
         else
         {
            _loc1_ = combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null));
            if(_loc1_.dodge == EVASION_SPEED)
            {
               outputText("你向后仰身，让泥球从一侧飞过，避开了攻击。");
            }
            else if(_loc1_.dodge == EVASION_EVADE)
            {
               outputText("你向后并向一侧拉开距离，用手臂挡住了这一击。泥巴溅在上面，毫无用处。");
            }
            else if(_loc1_.dodge == EVASION_MISDIRECTION)
            {
               outputText(get_capitalA() + get_short() + "在投掷前一直仔细盯着你。但这反而成了他的败笔，你极具误导性的动作让他找错了投掷泥巴的时机");
            }
            else if(_loc1_.dodge == EVASION_FLEXIBILITY)
            {
               outputText("当泥球离开他的手指时，你向后倒去，脊椎以一种非人的方式弯曲。你感觉到泥球从你胸前几英寸的地方飞过。");
            }
            else if(_loc1_.dodge != null)
            {
               outputText("你在最后一刻躲开了！");
            }
            else
            {
               outputText("泥球像湿雪球一样砸在你的脸上。它用一层粘稠、咸涩的泥巴覆盖了你的大部分鼻子和嘴巴，让你很难呼吸。在你挣扎着呼吸的时候，你将无法使用魔法！\n");
               get_player().createStatusEffect(StatusEffects.WebSilence,0,0,0,0);
            }
         }
      }
      
      public function phoukaFightLustAttack() : void
      {
         var _loc1_:* = null as CoC;
         var _loc2_:* = null as Array;
         if(PhoukaScene.phoukaForm == 0)
         {
            outputText("这只" + get_short() + "用他的翅膀爬升到你上方的高空中。然后他开始用一只手对着你撸动他的肉棒，同时用另一只手抚摸他的蛋蛋。");
         }
         else if(PhoukaScene.phoukaForm == 1)
         {
            outputText("兔兽人向前跃出，试图趁你不备抓住你。");
         }
         else
         {
            outputText("种马用后腿站立起来，向你挥舞着他巨大的肉棒。");
         }
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            if(PhoukaScene.phoukaForm == 1)
            {
               outputText("你在最后一刻躲开了，并成功让" + get_short() + "失去了平衡。他踉跄着退开，攻击落空了。\n");
            }
            else
            {
               outputText("你及时移开视线，" + get_short() + "的淫荡展示对你没有产生任何实质性的影响。\n");
            }
         }
         else
         {
            if(PhoukaScene.phoukaForm == 0)
            {
               outputText("一阵先列腺液像毛毛雨一样落在你周围。看到" + get_short() + "抽动着他的肉棒，闻着那咸甜的体液味道，让你恨不得停止战斗，专心取悦自己。");
            }
            else if(PhoukaScene.phoukaForm == 1)
            {
               outputText("他抓住你，在你的身体上摩擦。有那么一瞬间，你迷失在他" + (get_game().get_noFur() ? "光滑的黑色皮肤" : "柔软的黑色皮毛") + "的触感中。然后你感觉到他的肉棒压在你的肋骨上，你一把推开了他。");
            }
            else
            {
               outputText("你被那根在空气中戳刺的马肉棒催眠了。然后" + get_short() + "从你身边冲过，你能尝到空气中麝香的味道。");
            }
            _loc1_ = get_game();
            _loc2_ = [DynStat.Lust(15 + get_player().lib / 10 + get_player().cor / 5 + Utils.rand(10))];
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
      }
      
      public function phoukaFightAttack() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(3) < 1)
         {
            outputText(get_capitalA() + Utils.cnName(get_short()) + "因为失明完全没有打中你！\n");
         }
         else if(PhoukaScene.phoukaForm == 1)
         {
            _loc1_ = get_player().reduceDamage(100,this);
            outputText("兔兽人向你跳来。在最后一秒，他改变了方向，用强壮的后腿向你踢来。");
            if(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).dodge != null)
            {
               outputText("\n你闪身躲开，成功避开了这一踢。" + get_short() + "跳到攻击范围之外，准备发动下一次攻击。");
            }
            else if(_loc1_ <= 0)
            {
               outputText("\n你凑近肩膀挡住了他的攻击，毫发无伤地吸收了这一踢的力道。");
            }
            else
            {
               outputText("\n这一踢结结实实地命中了，让你踉跄后退。");
               get_player().takeDamage(_loc1_,true);
            }
         }
         else if(PhoukaScene.phoukaForm == 2)
         {
            _loc1_ = get_player().reduceDamage(130,this);
            outputText("山羊兽人低下头，向你冲来。");
            if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
            {
               outputText("\n你猛地闪开，成功避免了被刺穿的下场。");
            }
            else if(_loc1_ <= 0)
            {
               outputText("\n你成功地击中了山羊兽人的头部侧面。那对角从你身边擦过，没有造成任何伤害。");
            }
            else
            {
               outputText("\n它的头和角狠狠地撞向你，让你喘不过气来，身上也留下了瘀伤。");
               get_player().takeDamage(_loc1_,true);
            }
         }
         else
         {
            _loc1_ = get_player().reduceDamage(160,this);
            outputText("这匹种马向你冲来，显然是想把你踩在蹄下。");
            if(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed || _loc1_ <= 0)
            {
               outputText("\n当种马经过时，你原地扭转身体，成功避开了它的腿。");
            }
            else
            {
               outputText("\n种马冲锋时，你被它的腿和蹄子擦伤了。当它转过身准备再次冲锋时，你检查了一下自己的身体，惊讶地发现自己竟然没有骨折。");
               get_player().takeDamage(_loc1_,true);
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = hasStatusEffect(StatusEffects.Blind);
         if(!_loc1_ && !get_player().hasStatusEffect(StatusEffects.WebSilence) && Utils.rand(4) == 0)
         {
            phoukaTransformToPhouka();
            phoukaFightSilence();
         }
         else
         {
            _loc2_ = Utils.rand(9);
            if(PhoukaScene.phoukaForm == 0)
            {
               if(_loc1_)
               {
                  _loc2_ = Utils.rand(3);
               }
               else
               {
                  _loc2_ = Utils.rand(4);
               }
            }
            switch(_loc2_)
            {
               case 0:
                  phoukaTransformToBunny();
                  break;
               case 1:
                  phoukaTransformToGoat();
                  break;
               case 2:
                  phoukaTransformToHorse();
            }
            if(PhoukaScene.phoukaForm == 0)
            {
               phoukaFightLustAttack();
            }
            else if(PhoukaScene.phoukaForm == 1 && Utils.rand(4) != 0 && !_loc1_)
            {
               phoukaFightLustAttack();
            }
            else if(PhoukaScene.phoukaForm == 3 && Utils.rand(4) == 0 && !_loc1_)
            {
               phoukaFightLustAttack();
            }
            else
            {
               phoukaFightAttack();
            }
         }
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(get_player().get_gems() > 1)
         {
            outputText("一重获自由，你检查了一下你的宝石袋，发现" + get_short() + "拿走了你" + param2 + "颗宝石。");
         }
         else if(get_player().get_gems() == 1)
         {
            outputText("挣脱后，你检查了一下宝石袋，发现" + get_short() + "拿走了你仅有的一颗宝石。");
         }
         return 1;
      }
      
      override public function handleAwardText() : void
      {
      }
      
      override public function handleAwardItemText(param1:ItemType) : void
      {
         outputText("你正准备离开，突然想起附近那棵树的树洞里闪过的光芒。");
         if(param1 == null)
         {
            outputText("[pg]你走过去看了一眼，忍不住咒骂起" + get_short() + "。看来它是用一块碎玻璃瓶把你引诱过来的。至少你学到了更多对付这些小害虫的经验。你从胜利中获得了" + XP + "点经验值。");
         }
         else
         {
            outputText("[pg]你往树洞里看去，高兴地发现了" + Utils.cnName(param1.get_longName()) + "。你还从胜利中获得了" + XP + "点经验值，因为你学到了更多对付这些小害虫的经验。[pg]");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().bog.phoukaScene.phoukaPlayerWins(param1);
      }
   }
}

