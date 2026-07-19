package classes.scenes.areas.lake
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class GooGirl extends Monster
   {
      
      public function GooGirl(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(param1)
         {
            return;
         }
         var _loc2_:Boolean = get_player().biggestTitSize() >= 3;
         set_a("");
         set_short("goo-girl");
         imageName = "googirl";
         set_long("这个黏液女孩年轻且闪闪发光的脸上带着好奇的表情。她的身体很苗条，黏液块经常从她的四肢滴落，溅入她臀部下方汇聚的黏液坑中。一个心形的小核心在她的胸口跳动，散发着红光。" + (_loc2_ ? " 显然，她让自己变得有点像你，因为她的胸部看起来完全复制了你的" + get_player().chestDesc() + "。" : ""));
         set_race("Goo-Girl");
         createVagina(false,5,1);
         createStatusEffect(StatusEffects.BonusVCapacity,9001,0,0,0);
         createBreastRow(_loc2_ ? get_player().biggestTitSize() : 3);
         ass.analLooseness = 1;
         ass.analWetness = 5;
         createStatusEffect(StatusEffects.BonusACapacity,9001,0,0,0);
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 6;
         butt.rating = 8;
         lowerBody.type = 8;
         var _loc3_:Array = ["blue","purple","crystal"];
         var _loc4_:String = _loc3_[Utils.rand(int(_loc3_.length))];
         skin.tone = _loc4_;
         skin.setType(3);
         skin.adj = "goopey";
         hair.color = _loc4_;
         var _loc5_:int = Utils.rand(10);
         hair.length = 12 + _loc5_;
         initStrTouSpeInte(25,25,20,30);
         initLibSensCor(50,40,10);
         set_weaponName("hands");
         set_weaponVerb("slap");
         set_armorName("gelatinous skin");
         bonusHP = 40;
         set_lust(45);
         lustVuln = 0.75;
         temperment = 3;
         level = 3;
         set_fireRes(1.5);
         set_gems(Utils.rand(5) + 1);
         set_drop(new ChainedDrop().add(get_weapons().PIPE,0.1).add(get_consumables().SLIMYCL,0.5).elseDrop(get_useables().GREENGL));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]黏液女孩似乎有些困惑，但并不介意。");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().lake.gooGirlScene.getBeatByGooGirl();
         }
      }
      
      override public function teased(param1:Number) : void
      {
         if(get_lust100() <= 99)
         {
            if(param1 <= 0)
            {
               outputText("\n黏液女孩对你的举动感到困惑，似乎在努力理解你在做什么。");
            }
            else if(param1 < 13)
            {
               outputText("\n好奇的黏液女孩开始公然抚摸自己，试图通过模仿你来理解你行为的意义。");
            }
            else
            {
               outputText("\n女孩开始明白你的意图。她张开又闭上嘴，像是在喘气，同时将黏糊糊的手指伸进大腿间，并在她晃动的乳头上游走。");
            }
         }
         else
         {
            outputText("\n看来黏液女孩已经沉迷于她的模仿中，揉捏着她的乳房，抚弄着她闪亮的" + skin.tone + "阴蒂，完全忘记了要调查你的初衷。");
         }
         applyTease(param1);
      }
      
      override public function struggle() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.GooBind))
         {
            clearOutput();
            if(Utils.rand(3) == 0 || Utils.rand(80) < get_player().get_str())
            {
               outputText("你在黏液中疯狂地抓挠，设法碰到了她心形的细胞核。女孩无声地喘息着，失去了凝聚力，让你在试图凝固的时候把自己拉出来。");
               get_player().removeStatusEffect(StatusEffects.GooBind);
            }
            else
            {
               outputText("你徒劳地扭动着，被困在黏液女孩温暖、沸腾的身体里。当你的身体被女孩脉动身体的涟漪振动所哄骗而投降时，黑暗在你的视野边缘蔓延。");
               get_game().combat.takeDamage(Math.min(0.15 * get_player().maxHP(),100 * (1 + get_player().newGamePlusMod() * 0.2)),true);
            }
            tookAction = true;
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         switch(param1.index)
         {
            case 3:
               if(get_player().hasStatusEffect(StatusEffects.GooBind))
               {
                  clearOutput();
                  outputText("你徒劳地扭动着，被困在黏液女孩温暖、沸腾的身体里。当你的身体被女孩脉动身体的涟漪振动所哄骗而投降时，黑暗在你的视野边缘蔓延。");
                  _loc2_ = get_game().combat.takeDamage(0.35 * get_player().maxHP(),true);
                  tookAction = true;
                  return false;
               }
               break;
            case 6:
               outputText("你的火焰舔舐着女孩的身体，当你蒸发掉她大部分的水分时，她张开嘴痛苦地抗议。当火势过去后，她似乎变小了一点，她那黏糊糊的" + skin.tone + "皮肤也失去了一些光泽。");
               if(!hasPerk(PerkLib.Acid))
               {
                  createPerk(PerkLib.Acid,0,0,0,0);
               }
               return true;
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(gooGalAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(gooEngulph,1,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(gooPlay,2,true,5,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      public function gooThrow() : void
      {
         outputText("女孩把手伸进自己的躯干，抓出一大团黏液，像小孩扔泥巴一样朝你扔来。黏液溅在你的胸前，爬进你的[armor]下面，像手指在你身上跳舞一样挠着你的皮肤。");
         var _loc1_:Number = 1;
         get_player().takeDamage(_loc1_,true);
         get_player().takeLustDamage(5 + Utils.rand(3) + get_player().sens / 10,true);
      }
      
      public function gooPlay() : void
      {
         outputText("黏液女孩扑了过来，用她黏滑的手臂环住你的腰，给了你一个开心的拥抱，滚烫的黏液在你身上兴奋地颤抖着。她抬起头，空洞的眼神对你的冷淡感到困惑，撅起嘴巴赌气地松开了手。你在冷空气中打了个寒颤，有些后悔失去了她的拥抱。");
         get_player().takeLustDamage(3 + Utils.rand(3) + get_player().sens / 10,true);
      }
      
      public function gooGalAttack() : void
      {
         var _loc1_:Number = 0;
         doNext(get_game().playerMenu);
         var _loc2_:* = combatAvoidDamage(new AvoidDamageParameters(null,null,null,null,true,null,null,null));
         if(hasPerk(PerkLib.Acid))
         {
            outputText("她的身体在你的火焰中颤抖，黏液女孩");
         }
         else
         {
            outputText("黏液举起双手，它们变成了一个你[weapon]的复制品。她高兴地向你挥舞着");
         }
         if(_loc2_.dodge == EVASION_SPEED)
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但你躲开了她的攻击。");
            }
            else
            {
               outputText("，当你闪到一边时，她没有打中。");
            }
            return;
         }
         if(_loc2_.dodge == EVASION_EVADE)
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但你避开了她的攻击。");
            }
            else
            {
               outputText("，但你避开了这笨拙的攻击。");
            }
            return;
         }
         if(_loc2_.dodge == EVASION_MISDIRECTION)
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌。你误导了她，避开了攻击。");
            }
            else
            {
               outputText("，当你误导她的注意力时，她没有打中。");
            }
            return;
         }
         if(_loc2_.dodge == EVASION_FLEXIBILITY)
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但由于你猫一般的闪避而打空了。");
            }
            else
            {
               outputText("，由于你猫一般的闪避而打空了。");
            }
            return;
         }
         if(_loc2_.dodge != null)
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但你成功躲开了。");
            }
            else
            {
               outputText("，因为你避开了她的攻击而打空了。");
            }
            return;
         }
         if(Boolean(_loc2_.parry))
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但你成功招架了她的攻击。");
            }
            else
            {
               outputText("，但你用武器迎击，招架住了她的攻击。");
            }
            return;
         }
         if(Boolean(_loc2_.block))
         {
            if(hasPerk(PerkLib.Acid))
            {
               outputText("试图扇你一巴掌，但你成功格挡了她的攻击。");
            }
            else
            {
               outputText("，但你及时举起盾牌，格挡了她的攻击。");
            }
            return;
         }
         if(hasPerk(PerkLib.Acid))
         {
            _loc1_ = get_player().reduceDamage(get_str() + 10 + get_weaponAttack(),this);
         }
         else
         {
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         }
         if(_loc1_ <= 0)
         {
            _loc1_ = 0;
            if(hasPerk(PerkLib.Acid))
            {
               if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
               {
                  outputText("试图扇你一巴掌，但带有酸液的巴掌软弱无力地溅在你的[armor]上。");
               }
               else
               {
                  outputText("试图用沾满酸液的手扇你，但酸液溅在你身上毫无作用。");
               }
            }
            else if(Utils.rand(get_player().get_armorDef() + get_player().get_tou()) < get_player().get_armorDef())
            {
               outputText("，她的攻击徒劳地拍打在你的[armor]上。");
            }
            else
            {
               outputText("，她的攻击毫无作用地溅在你身上。");
            }
         }
         else if(hasPerk(PerkLib.Acid))
         {
            outputText("狠狠地扇了你的脸颊一巴掌。当轻微的刺痛变成灼热的烧伤，并且似乎随着时间的推移越来越严重时，你倒吸了一口凉气！");
            if(!get_player().hasStatusEffect(StatusEffects.AcidSlap))
            {
               get_player().createStatusEffect(StatusEffects.AcidSlap,0,0,0,0);
            }
         }
         else
         {
            outputText("，用她黏糊糊的肢体狠狠地拍打你的头。你甩了甩你的[hair]，让脑袋从令人眩晕的巴掌中清醒过来。");
         }
         if(_loc1_ > 0)
         {
            if(lustVuln > 0 && get_player().get_armor() == get_game().armors.BONSTRP)
            {
               if(!get_plural())
               {
                  outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "擦过你裸露的皮肤，惊讶地猛然缩了回去，看到你暴露了这么多，脸上微微泛红。");
               }
               else
               {
                  outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "擦过你裸露的皮肤，惊讶地猛然缩了回去，看到你暴露了这么多，脸上微微泛红。");
               }
               set_lust(get_lust() + 5 * lustVuln);
            }
         }
         if(_loc1_ > 0)
         {
            get_player().takeDamage(_loc1_,true);
         }
         statScreenRefresh();
         outputText("\n");
      }
      
      public function gooEngulph() : void
      {
         outputText("黏液女孩兴高采烈地把整个身体扑向你，还没等你躲开，她就已经用她渗出的身体吞没了你！" + skin.tone + "的黏液触手滑进你的鼻孔，穿过你的嘴唇，让女孩的黏液填满你的肺部。你开始窒息了！");
         if(!get_player().hasStatusEffect(StatusEffects.GooBind))
         {
            get_player().createStatusEffect(StatusEffects.GooBind,0,0,0,0);
         }
      }
      
      public function gooColor9() : String
      {
         if(skin.tone == "blue")
         {
            return "海蓝色";
         }
         if(skin.tone == "purple")
         {
            return "李子色";
         }
         return "半透明";
      }
      
      public function gooColor8() : String
      {
         if(skin.tone == "blue")
         {
            return "海蓝色";
         }
         if(skin.tone == "purple")
         {
            return "李子色";
         }
         return "透明";
      }
      
      public function gooColor7() : String
      {
         if(skin.tone == "blue")
         {
            return "蓝莓般的";
         }
         if(skin.tone == "purple")
         {
            return "葡萄般的";
         }
         return "水晶般的";
      }
      
      public function gooColor6() : String
      {
         if(skin.tone == "blue")
         {
            return "蓝宝石般的";
         }
         if(skin.tone == "purple")
         {
            return "紫水晶般的";
         }
         return "钻石般的";
      }
      
      public function gooColor5() : String
      {
         if(skin.tone == "blue")
         {
            return "蓝宝石般的";
         }
         if(skin.tone == "purple")
         {
            return "紫水晶般的";
         }
         return "钻石般的";
      }
      
      public function gooColor4() : String
      {
         if(skin.tone == "blue")
         {
            return "青色的";
         }
         if(skin.tone == "purple")
         {
            return "淡紫色的";
         }
         return "玻璃般的";
      }
      
      public function gooColor3() : String
      {
         if(skin.tone == "blue")
         {
            return "天蓝色的";
         }
         if(skin.tone == "purple")
         {
            return "紫罗兰色的";
         }
         return "透明的";
      }
      
      public function gooColor2() : String
      {
         if(skin.tone == "blue")
         {
            return "蔚蓝色的";
         }
         if(skin.tone == "purple")
         {
            return "李子色";
         }
         return "水晶般的";
      }
      
      public function gooColor11() : String
      {
         if(skin.tone == "blue")
         {
            return "蔚蓝色调";
         }
         if(skin.tone == "purple")
         {
            return "紫罗兰色调";
         }
         return "透明的身体";
      }
      
      public function gooColor10() : String
      {
         if(skin.tone == "blue")
         {
            return "蓝莓";
         }
         if(skin.tone == "purple")
         {
            return "葡萄";
         }
         return "草莓";
      }
      
      public function gooColor() : String
      {
         return Utils.cnName(skin.tone);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lake.gooGirlScene.beatUpGoo();
      }
   }
}

