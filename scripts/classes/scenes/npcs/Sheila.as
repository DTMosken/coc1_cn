package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.ChainedDrop;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import flash.Boot;
   
   public class Sheila extends Monster
   {
      
      public var roundCounter:int;
      
      public function Sheila()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         roundCounter = 0;
         super();
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1;
         set_a("");
         set_short("Sheila");
         imageName = "sheila";
         if(_loc1_)
         {
            set_long("希拉是一个身材苗条、有些运动气息的女人，身高超过六英尺。她光滑、深色的皮肤从头到带爪的脚都暴露在外，她毫不掩饰任何可能让你目光停留的地方。她胸前那" + get_game().sheilaScene.sheilaCup() + "的乳房" + (get_game().sheilaScene.sheilaCorruption() <= 40 ? "是坚挺、有弹性的水滴状；她时不时地会心不在焉地抚摸其中一个。" : "随着她的移动而晃动，她把它们挺出来，以确保你看到自从你们第一次见面以来，她的身体变得多么淫荡。") + " 笔直、及颌的赤褐色头发与两只向两侧伸出的长而光滑的耳朵一起勾勒出她的脸庞。她对文明的唯一致敬是摇晃的紫色耳环和她手上戴的戒指，这个野性的女人毫不掩饰地盯着你，抚摸着自己。");
         }
         else
         {
            set_long("希拉是一个身材苗条、有些运动气息的女人，身高超过六英尺。她大部分浅棕色的皮肤都被隐藏起来了，要么被她的背心和短裤遮住，要么被从" + (get_game().get_noFur() ? "膝盖" : "大腿") + "一直覆盖到她突出的指甲的毛茸茸的皮毛遮住。当她摇晃着站立时，她那" + get_game().sheilaScene.sheilaCup() + "的乳房在白色的衬衫下短暂地显现出来，" + (get_game().sheilaScene.sheilaCorruption() <= 40 ? "小而圆，与她苗条的身材相匹配。" : "肿胀、晃动的球体，与她苗条的身体形成鲜明对比，诉说着所有注入她体内的堕落。") + " 她笔直、及颌的赤褐色头发毫无拘束地垂下，落在从她头上向两侧伸出的毛茸茸的耳朵周围。她通常戴的帽子用一根绳子挂在背上，被推开以防止在混乱中丢失。仅仅为了保住一顶帽子就把绳子套在自己的脖子上，这告诉你希拉的心思并没有真正留在战斗中——尽管这也可能是她眼中绝望、遥远的眼神。");
         }
         set_race("Kangaroo-Morph");
         createVagina(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) <= 3 && !_loc1_,3,1);
         createStatusEffect(StatusEffects.BonusVCapacity,30,0,0,0);
         createBreastRow(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) / 10);
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,20,0,0,0);
         set_tallness(72);
         hips.rating = 4;
         butt.rating = 5;
         lowerBody.type = 14;
         skin.tone = "tan";
         hair.color = "auburn";
         hair.length = 11;
         initStrTouSpeInte(80,45,95,50);
         initLibSensCor(30,45,25);
         var _loc2_:Number = 30;
         var _loc3_:Number = 0.4;
         var _loc4_:Number = 200;
         if(_loc1_)
         {
            set_spe(get_spe() - 15);
            set_tou(get_tou() + 30);
            set_inte(get_inte() + 30);
            _loc4_ += 200;
            _loc2_ = 50;
            _loc3_ = 0.15;
         }
         set_weaponName("foot");
         set_weaponVerb("kick");
         set_weaponAttack(10);
         set_armorName("clothes");
         set_armorDef(4);
         bonusHP = _loc4_;
         set_lust(_loc2_);
         lustVuln = _loc3_;
         temperment = 1;
         level = 14;
         set_gems(Utils.rand(5) + 5);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 0)
         {
            set_drop(new WeightedChoice(get_consumables().KANGAFT,1));
         }
         else
         {
            set_drop(new ChainedDrop(get_consumables().KANGAFT).add(get_consumables().SUCMILK,0.3333333333333333).add(get_consumables().INCUBID,0.5));
         }
         tail.type = 12;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1)
         {
            get_game().sheilaScene.loseToSheila();
         }
         else
         {
            get_game().sheilaScene.getBeatUpBySheila();
         }
      }
      
      public function tittyMonsterAttack() : void
      {
         outputText("希拉咯咯地笑着，抚摸着她那" + get_game().sheilaScene.sheilaCup() + "的乳房，试图引诱你。");
         if(get_game().sheilaScene.sheilaCorruption() < 20)
         {
            outputText("但由于她那里什么都没有，这感觉就像是被一个裁缝的人体模型挑逗一样。");
         }
         else if(get_game().sheilaScene.sheilaCorruption() < 150)
         {
            outputText("当她的手滑过那看起来很柔软的乳房，揉捏挤压着它们，无情地挑逗着乳头，直到她发出一声可爱的小呻吟，你感到血液涌向你的脸。[say:很享受这个，是吗？]她甜甜地叫道。[say:你为什么不停止反抗，也来玩玩它们呢？]");
            get_player().takeLustDamage(25 + get_player().lib / 10,true);
         }
         else
         {
            outputText("她甚至很难移动与她苗条的身材如此滑稽地不相称的乳房；当她试图将它们挤在一起时，她的手只是陷进了那庞大的肉团中，但这个恶魔并没有成功地移动这座“山”。这就像看着有人试图推着半充气的游泳设备到处走。当她放弃时，你实际上笑了一下，她抱怨着揉着自己的下背部。");
         }
      }
      
      public function suspiciousGlint() : void
      {
         var _loc1_:int = 0;
         if(hasStatusEffect(StatusEffects.Blind) && Utils.rand(2) == 0)
         {
            outputText("希拉失明的眼睛怀疑地闪烁着，她集中力量，试图将她的幻想发送给任何被她目光捕捉到的东西。这似乎奏效了——你旁边的石头微微震动了一下。");
         }
         else if(get_player().get_inte() / 15 + Utils.rand(20) + 1 > 16)
         {
            outputText("希拉的眼睛闪烁着可疑的光芒，她宣称对你的爱意，并恳求你看着她的眼睛，但你低着头，只盯着她的脚。你能感觉到她的目光像要在你身上烧出个洞来，但最终她放弃了尝试。");
         }
         else
         {
            outputText("希拉的眼睛闪烁着可疑的光芒，当你迎上她那淫荡的目光时，你感到思维变得迟缓，身体开始发热。你移开视线已经太迟了，伤害已经造成；她那");
            if(!get_player().hasCock())
            {
               outputText("将流着口水的尾巴埋入你体内直到喷水");
            }
            else
            {
               outputText("骑着你的肉棒直到根部");
            }
            outputText("的幻想在你的脑海中肆虐，排挤了其他一切。[say:你看到了吗，[name]？我对你的爱？]希拉微笑着问道。天哪，你当然看到了！你几乎无法集中注意力在任何事情上！");
            if(!hasStatusEffect(StatusEffects.TwuWuv))
            {
               createStatusEffect(StatusEffects.TwuWuv,0,0,0,0);
               _loc1_ = 40 + Utils.rand(5);
               Monster.showStatDown("inte");
               while(_loc1_ > 0)
               {
                  if(get_player().get_inte() >= 2)
                  {
                     addStatusValue(StatusEffects.TwuWuv,1,1);
                  }
                  _loc1_--;
               }
            }
            get_player().takeLustDamage(30 + get_player().lib / 10 + get_player().cor / 10,true);
         }
      }
      
      public function splashAttackLookOutShellEvolveIntoGyrados() : void
      {
         outputText("希拉耐心地等待着，盯着你，用另一只手抚摸着她那黑色的、铲状的尾巴。一条总是渗出的油液从裂缝中落下，汇聚在光滑的棕色线圈中；她迅速地解开它，调皮地将液体甩向你的脸。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackHit))
         {
            outputText("它准确地命中了目标，你被迫闭上眼睛，以免它进入眼睛！");
            get_player().createStatusEffect(StatusEffects.Blind,1,0,0,0);
            get_player().createStatusEffect(StatusEffects.SheilaOil,0,0,0,0);
         }
         else
         {
            outputText("你轻松地避开了她那被污染的液体的路径，她叹了口气。[say:你真没趣，伙计。]");
         }
      }
      
      public function sitAndPout() : void
      {
         outputText("希拉对你皱了皱眉，然后扑通一声坐在草地上，盯着自己的脚。[say:好吧。你赢了，伙计。我不想再争论了，所以……我想，你就自便吧。反正情侣吵架最棒的部分就是和好炮……]她说着，充满希望地张开双腿。在她刘海下，那撅起的嘴变成了一个非常微弱的微笑。");
         set_gems(0);
         XP = 0;
         set_lust(100);
         set_HP(0);
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]不过你并没有那么感兴趣；当你经过她身边离开时，希拉哼了一声。");
            get_game().combat.cleanupAfterCombat();
            return;
         }
      }
      
      public function sheilaFrogPunch() : void
      {
         var _loc1_:Number = 0;
         set_spe(get_spe() - 30);
         if(get_player().get_tallness() < 42 && Utils.rand(2) == 0)
         {
            outputText("希拉蹦蹦跳跳地来到你面前，蹲下身子，像发条一样蜷缩着身体。她伸展开来，拳头瞄准你的下巴，但你轻松地蹲下，躲过了她瘦长的身躯，伸直身体把她的腿往上推，她毫发无损地从你头顶飞过。在她脸朝下摔在你身后的泥土里之前，你能听到一声短促的尖叫。");
            _loc1_ = 3 + Utils.rand(10);
            _loc1_ = get_game().combat.doDamage(_loc1_,true);
         }
         else if(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed || hasStatusEffect(StatusEffects.Blind))
         {
            outputText("希拉蹦蹦跳跳地来到你面前，蹲下身子，像发条一样蜷缩着身体。女孩举起拳头伸展开来，但你躲开了上勾拳，反而迎面撞上了她的乳房！希拉尖叫着把你推开。");
            outputText("她脸红了，双臂交叉在胸前，恢复了距离。");
            get_player().takeLustDamage(10 + Utils.rand(get_player().sens / 10));
         }
         else
         {
            outputText("希拉蹦蹦跳跳地来到你面前，蹲下身子，像发条一样蜷缩着身体。女孩同样迅速地伸展开来，举起拳头扑向你的脸。她重重地打在你的下巴上，把你的头打得向后仰，视线模糊！");
            get_player().changeFatigue(5 + Utils.rand(5));
            if(get_player().stun(1,33))
            {
               outputText("<b>你被击晕了！</b>");
            }
            _loc1_ = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
            if(_loc1_ < 1)
            {
               _loc1_ = 2;
            }
            get_player().takeDamage(_loc1_,true);
         }
         set_spe(get_spe() + 30);
      }
      
      public function sheilaFlyingKick() : void
      {
         var _loc1_:Number = 0;
         set_spe(get_spe() - 60);
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,get_player().standardDodgeFunc(this,-20),null,null)).attackFailed))
         {
            outputText("希拉蹲下，然后爆发性地向你跳来！她把腿伸到前面踢，但你滚到一边，她从你肩膀滑过。你听到一声[say:哎哟！]，她一屁股坐在你身后。当你转头看时，她已经站起来了，揉着隐隐作痛的臀部，看起来有点尴尬。");
            _loc1_ = 3 + Utils.rand(10);
            _loc1_ = get_game().combat.doDamage(_loc1_,true);
         }
         else
         {
            outputText("希拉蹲下，然后脚朝前爆发性地向你跳来！就在她到达你胸前时，她轻轻地伸出一条腿，然后将身体扭向一侧，把另一条腿伸过来，踢在你的后脑勺上！当她从你胸前推开时，你的视线模糊了，脚下摇晃。");
            if(get_player().stun(2,100))
            {
               outputText("<b>你被击晕了！</b>");
            }
            _loc1_ = get_player().reduceDamage(get_str() + 50 + get_weaponAttack(),this);
            if(_loc1_ < 1)
            {
               _loc1_ = 2;
            }
            get_player().takeDamage(_loc1_,true);
            get_player().changeFatigue(10 + Utils.rand(6));
         }
         set_spe(get_spe() + 60);
      }
      
      public function pressurePointsAttack() : void
      {
         outputText("一时间，除了轻柔的沙沙声，一切都安静了下来。[pg]");
         if(get_game().sheilaScene.sheilaCorruption() < 100)
         {
            outputText("恶魔咯咯的笑声打破了沉默，她将你拥入怀中，将她那" + get_game().sheilaScene.sheilaCup() + "的乳房压向你。当她把挺拔的乳头在你的[skinfurscales]上摩擦时，你打了个寒颤，但还是把她推开了。");
            get_player().takeLustDamage(15 + get_player().sens / 20 + get_player().lib / 20,true);
         }
         else if(get_game().sheilaScene.sheilaCorruption() < 300)
         {
            outputText("一声叹息结束了沉默，你的身体被部分包裹在发情的希拉那火热的乳沟中。当恶魔抓住你，把她的奶子推向你时，皮肤与[skinfurscales]的接触让你打了个寒颤，你试图挣脱的努力遇到了一些阻力……或者说，缺乏阻力，因为柔软、有弹性的乳房肉在你的触摸下颤抖发热，而恶魔并没有移动太多。在你逃脱之前，你不小心擦到了她的乳头好几次，引发了希拉发情的呻吟，在你的脑海中挥之不去。");
            get_player().takeLustDamage(25 + get_player().sens / 20 + get_player().lib / 20,true);
         }
         else
         {
            outputText("你有点不安，但很快意识到，你可以通过倾听她那巨大的乳房在靠近你时摩擦地面的声音来判断希拉在哪里。考虑到这一点，你继续面对你的对手，一边擦眼睛一边后退。");
            outputText("[pg][say: 哎呀，来嘛！]她抱怨道。");
         }
      }
      
      override public function performCombatAction() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1)
         {
            demonSheilaAI();
            return;
         }
         if(Utils.rand(3) == 0)
         {
            eAttack();
         }
         else if(Utils.rand(2) == 0)
         {
            sheilaFlyingKick();
         }
         else
         {
            sheilaFrogPunch();
         }
      }
      
      public function lickEmAndStickEm() : void
      {
         outputText("希拉的声音越来越近，当你在黑暗中拼命擦脸时，她的声音变得令人解除武装般地充满歉意。[say:哦，天哪。我不是故意弄到你眼睛里的……让我帮你清理一下，亲爱的。]你的脸被她的双手轻轻捧住并向下拉，然后这个恶魔开始深情地用舌头舔你，用长长的、令人发痒的舔舐擦去液体，而你则等待着另一只靴子落地。");
         outputText("[say:好多了，]希拉宣布。在你挣脱之前，她用拇指小心翼翼地推起你的一只眼睑，证明了她的说法——并导致你直视她那发光的紫色虹膜。一个幻想侵入了你的脑海，在这个幻想中");
         if(get_player().hasCock())
         {
            outputText("[oneCock]将希拉操到根部，而她的尾巴像蛇一样缠绕并穿透你的[vagOrAss]");
         }
         else
         {
            outputText("你从后面进入希拉，将她那铲状的尾巴插入你的[vagina]，而她则脸朝下趴在地上，屁股撅在空中");
         }
         outputText("。");
         if(get_player().get_inte() / 15 + Utils.rand(20) + 1 > 16)
         {
            outputText("[pg]在幻想进一步发展之前，你退缩了，从恶魔的手中挣脱出来，将她推开。");
            get_player().takeLustDamage(15 + get_player().sens / 20 + get_player().lib / 20,true);
         }
         else
         {
            outputText("[pg]你自我意识发出的紧急危险警告被不断高涨的欲望之海所淹没，你发现自己被迷住了。幻象一直持续到希拉对幻想感到厌倦为止。");
            get_player().takeLustDamage(25 + get_player().sens / 20 + get_player().lib / 20,true);
         }
      }
      
      public function demonSheilaAI() : void
      {
         var _loc1_:* = null as Array;
         roundCounter += 1;
         if(roundCounter >= 5)
         {
            sitAndPout();
            return;
         }
         if(!get_player().hasStatusEffect(StatusEffects.SheilaOil))
         {
            _loc1_ = [suspiciousGlint,tittyMonsterAttack,splashAttackLookOutShellEvolveIntoGyrados];
         }
         else
         {
            _loc1_ = [pressurePointsAttack,lickEmAndStickEm];
         }
         _loc1_[Utils.rand(int(_loc1_.length))]();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1)
         {
            get_game().sheilaScene.beatUpDemonSheila();
         }
         else
         {
            get_game().sheilaScene.sheilaGotWhomped();
         }
      }
   }
}

