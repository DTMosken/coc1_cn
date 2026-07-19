package classes.scenes.areas.swamp
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.ItemType;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class CorruptedDrider extends AbstractSpiderMorph
   {
      
      public function CorruptedDrider()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Array = ["红色的","橙色的","绿色的"];
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         var _loc3_:Array = ["黄色的","紫色的","红色的","绿松石色的"];
         var _loc4_:String = _loc3_[Utils.rand(int(_loc3_.length))];
         get_game().registerTag("dridereyes",TagFun_Impl_.fromString(_loc4_));
         var _loc5_:Boolean = Utils.rand(2) == 0;
         set_a("");
         set_short("corrupted drider");
         imageName = "corrupteddrider";
         set_long("这个特别的蜘蛛女是一个蛛化精灵——一种上半身是人形，下半身是巨型蛛形怪物的生物。粗略一看，你就能看出她已经深深地堕落了。她一丝不挂，露出了四个圆润的D罩杯乳房，上面有着闪亮的黑色乳头。" + (_loc5_ ? "金色的穿孔和链条将这些曲线优美的乳房连接在一起，在她的四个乳房前交叉成一个“x”形。" : "") + "在她的脸和额头上，四只充满欲望的[driderEyes]眼睛正盯着你。在她的身后，这个怪物女孩的" + _loc2_ + "头发像斗篷一样披在背上。蛛化精灵的嘴唇似乎闪烁着它们自己的光芒，紫色的反光液体不断地从上面渗出并滴落。在她的腰部，有一个看起来多汁的小穴，上面有一个很大、非常显眼的阴蒂。它不时地跳动和变大，部分变成了一根恶魔肉棒。她的蜘蛛半身有八条细长的腿，上面有黑色和" + _loc2_ + "的条纹——如果你见过的话，这绝对是一个充满威胁的展示。");
         set_race("Drider");
         createCock(9,2,CockTypesEnum.DEMON);
         createVagina(false,4,3);
         createStatusEffect(StatusEffects.BonusVCapacity,70,0,0,0);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,70,0,0,0);
         set_tallness(120);
         hips.rating = 12;
         butt.rating = 9;
         lowerBody.type = 16;
         skin.tone = "pale";
         skin.setType(0);
         hair.color = _loc2_;
         hair.length = 24;
         initStrTouSpeInte(100,50,70,100);
         initLibSensCor(80,50,90);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_weaponAttack(30);
         set_armorName("carapace");
         set_armorDef(55);
         set_armorPerk("");
         set_armorValue(70);
         if(_loc5_)
         {
            nipplesPierced = 1;
            bonusHP = 325;
            set_lust(35);
            lustVuln = 0.25;
            temperment = 2;
            level = 15;
            set_gems(Utils.rand(10) + 30);
         }
         else
         {
            bonusHP = 250;
            set_lust(30);
            lustVuln = 0.4;
            temperment = 2;
            level = 14;
            set_gems(Utils.rand(10) + 20);
         }
         set_drop(new WeightedChoice().add(get_consumables().B_GOSSR,5).add(get_useables().T_SSILK,1).add(null,4));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]蛛化精灵满怀期待地舔了舔嘴唇……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().swamp.corruptedDriderScene.loseToDrider();
         }
      }
      
      override public function performCombatAction() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_drider());
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(driderMasturbate,20,get_lust100() > 70,10,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(spiderSilence,20,!get_player().hasStatusEffect(StatusEffects.WebSilence) && get_player().hasSpells(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(spiderDisarm,20,get_player().canDisarm(),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(spiderMorphWebAttack,33,get_player().get_spe() >= 2 && !get_player().hasStatusEffect(StatusEffects.Web),10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(driderKiss,25,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(eAttack,25,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(get_game().monsterAbilities.approach,10,distance == CombatDistance.Distant,15,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.exec();
      }
      
      public function driderMasturbate() : void
      {
         set_lust(get_lust() - 30);
         outputText("蜘蛛女向后退去，给了你一个充满欲望和饥渴的表情。她颤抖着呻吟道，[say: 嗯，看看你错过了什么……][pg]");
         outputText("她刚说完，她那巨大的阴蒂就膨胀起来，像气球一样。一秒钟后，它向前滑出，露出了九英寸长、沾满淫液的肉棒。结节环绕着这根堕落阴茎的表面，而顶端微小的射精孔则滴下大量的先列腺液。她抽插着这个肉体器官，另一只手则抓挠着她那晃动的乳房，拉扯着坚硬的");
         if(nipplesPierced > 0)
         {
            outputText("穿了孔的");
         }
         outputText("乳头肉。她以一种诱人的姿势弓起背，在极度的快感中发出高亢的叫声，她的肉棒在她手中跳动，喷射出一股精液，落在她面前。[pg]");
         outputText("这番景象完全分散了你的注意力，直到她结束。当你再次摆出战斗姿势时，你发现自己的需求变得更难忽视，而她的需求似乎暂时得到了满足。");
         get_player().takeLustDamage(10 + get_player().lib / 20,true);
         outputText("\n");
      }
      
      public function driderKiss() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Array = ["[BLIND]她瞎得根本无法靠近你。[saystart]","[SPEED]不知怎么的，你设法把自己拖出了攻击范围。她叹了口气，舔了舔嘴唇。[saystart]","[EVADE]不知怎么的，你设法躲开了她充满情欲的攻击。她叹了口气，舔了舔嘴唇。[saystart]","[MISDIRECTION]不知怎么的，你设法躲开了她充满情欲的攻击。她叹了口气，舔了舔嘴唇。[saystart]","[FLEXIBILITY]你在最后一秒扭动你猫娘般的身体躲开了攻击。她叹了口气，舔了舔嘴唇。[saystart]","[UNHANDLED]不知怎么的，你设法把自己拖出了攻击范围。她叹了口气，舔了舔嘴唇。[saystart]"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null),_loc1_))
         {
            if(!get_player().hasStatusEffect(StatusEffects.DriderKiss))
            {
               outputText("在你来得及移动之前，她已经压在了你身上，倾斜着");
               if(get_player().get_tallness() < 72)
               {
                  outputText("俯身");
               }
               else
               {
                  outputText("倾身");
               }
               outputText("在你的嘴唇上印下了一个湿漉漉的吻。她那充满光泽的唇毒四处流淌，顺着你们的下巴滴落，滑进你的嘴里。你浑身颤抖，试图反抗，但你的舌头背叛了你。它滑入她湿润、肿胀的入口，舔舐着她的毒液，与她的舌头交缠。");
               if(get_player().get_lust100() <= 99)
               {
                  outputText("不知怎么的，你鼓起意志力退开，但你的身体开始变得越来越热，越来越硬，被一种缓慢积聚的欲望所折磨。");
               }
               get_player().takeLustDamage(10,true);
               get_player().createStatusEffect(StatusEffects.DriderKiss,0,0,0,0);
            }
            else
            {
               get_player().addStatusValue(StatusEffects.DriderKiss,1,1);
               if(get_player().statusEffectv1(StatusEffects.DriderKiss) == 1)
               {
                  outputText("蛛化精灵再次用她那如糖浆般的吻封住了你的嘴，似乎像她的网束缚你的身体一样有效地束缚了你的嘴。她甜美的毒液在你们唇齿相依的角落里冒泡起沫，滴落到她那多乳的胸部和你的[chest]上。");
                  if(get_player().hasCock())
                  {
                     outputText("" + get_player().SMultiCockDesc() + " 喷出一股先列腺液到你的[armor]里，迫不及待地想要出来操弄。");
                  }
                  if(get_player().hasVagina())
                  {
                     outputText("淫液顺着你的[legs]滴落，而你的[clit]变得如此坚硬，你觉得它快要爆炸了。");
                  }
                  get_player().takeLustDamage(15,true);
                  outputText("这一次，是蛛化精灵打破了吻。她问道，[say: 准备好了吗，我饥渴的小点心？]\n");
                  if(get_player().get_lust100() <= 99)
                  {
                     outputText("你摇了摇头表示“不”，并坚守阵地！\n");
                  }
               }
               else
               {
                  outputText("这一次你几乎没有动弹。你的身体太沉迷于再来一个带毒的吻的想法，以至于无法抗拒。当她的嘴唇与你的相遇时，绚丽的紫色黏液涌入你的嘴里，紧紧封住，却让你的舌头进入她的嘴里打转，感受毒液从她的尖牙上滴落。这感觉简直像在天堂！你的[skin]变得滚烫发麻，你非常渴望被触摸。你的[nipples]感觉硬得能割破玻璃，你内心越来越大的一部分承认，你很想感受蛛化精灵那几丁质的手指拉扯它们。");
                  if(get_player().hasCock() || get_player().hasVagina())
                  {
                     outputText("你胯部的湿润只会变得更糟。此时，一个");
                     if(get_player().wetness() < 3 && get_player().cumQ() < 200)
                     {
                        outputText("小小的");
                     }
                     else if(get_player().wetness() < 5 && get_player().cumQ() < 500)
                     {
                        outputText("大大的");
                     }
                     else
                     {
                        outputText("巨大的");
                     }
                     outputText("散发着你纯粹性欲渴望的湿润污渍已经在你的[armor]上形成。");
                     if(get_player().get_lust100() <= 99)
                     {
                        outputText("令人惊讶的是，你抵抗住了她并退了回来，大口喘着气。");
                     }
                     get_player().takeLustDamage(20,true);
                  }
               }
            }
         }
         else
         {
            _loc2_ = Utils.rand(4);
            if(_loc2_ == 0)
            {
               outputText("我只是想给我美味的点心一个吻……[sayend]\n");
            }
            else if(_loc2_ == 1)
            {
               outputText("你为什么不让我吻你？[sayend]\n");
            }
            else if(_loc2_ == 2)
            {
               outputText("嗯，你非得这么扭动吗，猎物？[sayend]\n");
            }
            else
            {
               outputText("看看我那充满光泽、滴着水的嘴唇。想象一下，如果它们紧紧贴着你，感觉会有多棒。为什么要反抗？[sayend]\n");
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swamp.corruptedDriderScene.defeatDriderIntro();
      }
   }
}

