package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.Bazaar;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   
   public class Roxanne extends BazaarAbstractContent implements TimeAwareInterface
   {
      
      public function Roxanne()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:* = null as Player;
         var _loc3_:* = null as Player;
         var _loc4_:* = null as Player;
         var _loc5_:int = 0;
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,225,FlagDict_Impl_.arrayReadInt(_loc1_,225) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 300 && get_game().time.hours == 1 && Utils.rand(5) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,225,1);
         }
         if(get_player().hasStatusEffect(StatusEffects.Hangover))
         {
            if(get_player().statusEffectv1(StatusEffects.Hangover) <= 0)
            {
               outputText("[pg]<b>随着宿醉的消退，你的头脑终于清醒了。和那个扶她蜥蜴人喝酒绝对是个坏主意。</b>[pg]");
               _loc2_ = get_player();
               _loc2_.set_str(_loc2_.get_str() + get_player().statusEffectv2(StatusEffects.Hangover));
               _loc3_ = get_player();
               _loc3_.set_spe(_loc3_.get_spe() + get_player().statusEffectv3(StatusEffects.Hangover));
               _loc4_ = get_player();
               _loc4_.set_inte(_loc4_.get_inte() + get_player().statusEffectv4(StatusEffects.Hangover));
               dynStats(DynStat.Cor(0));
               get_player().removeStatusEffect(StatusEffects.Hangover);
               return true;
            }
            get_player().addStatusValue(StatusEffects.Hangover,1,-1);
         }
         if(get_game().time.hours > 23 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,227) > 0)
         {
            _loc5_ = 227;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc5_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc5_) - 1);
         }
         return false;
      }
      
      public function roxanneRimjob() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("你扭动着脱下你的[armor]，得意地笑着，转过身靠在桌子上");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("，你的乳房为你缓冲了下方坚硬的木头");
         }
         outputText("。毒尾盯着你那" + get_player().assholeDescript() + "的圆环，流着口水，用她长满鳞片的手抓住了你的[ass]。她以令人痛苦的缓慢速度，尽可能地把你的臀瓣掰开。在你发出同样的声音的前一秒，你听到她发出了愉悦的喘息。她的舌头从嘴里射出，立刻找到了你的[asshole]！现在她正用舌头在你敏感的圆环周围打圈，让那里的皮肤收紧并抽动。[pg]");
         outputText("罗克珊呻吟着，给了你的[ass]一个下流的揉捏，在她的舌头膜拜你的屁眼时，与你的臀瓣做爱。她喃喃地说：[say: 如果这只是前戏，那就太好了。下次你输给我好不好，宝贝？]当她的舌头回到它的工作时，你大声呻吟，弓起背，因为强烈的肛门快感而呜咽。");
         if(get_player().hasCock())
         {
            outputText(get_player().SMultiCockDesc() + "");
            if(get_player().get_lust100() < 70)
            {
               outputText("变硬了");
            }
            else
            {
               outputText("因渴望而跳动");
            }
            outputText("，顶端已经挂着一滴先列腺液。");
         }
         if(get_player().hasVagina())
         {
            outputText("与此同时，你被冷落的阴道变得越来越湿，而且没有停止的迹象。蜥蜴人那巨大、探索的舌头忽略了它。");
         }
         outputText("罗克珊完全专注于你的肛门环，她的舌头保持在原来的位置，不断地刺激着你直肠周围闪烁的神经。[pg]");
         if(get_player().hasCock())
         {
            outputText("令人惊讶的是，海盗的一只手离开了你的[ass]，拉扯着");
            if(get_player().totalCocks() > 1)
            {
               outputText("其中一根");
            }
            outputText("你的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，像挤牛奶一样挤压着阴茎干。光滑、长满鳞片的手指在根部环绕着它，慢慢向下滑动，拉扯着你的皮肤，每一次拉扯都挤出浓稠的先列腺液。[pg]");
         }
         else if(get_player().hasVagina())
         {
            outputText("令人惊讶的是，海盗的一只手离开了你的[ass]，开始玩弄你的[vagina]。长而锋利的指甲在你外阴敏感的皮肤上游走，而柔软、长满鳞片的拇指则在它们之间按压。多汁的淫液很快覆盖了她的手指，但她似乎一点也不在意。[pg]");
         }
         outputText("那条长长的、奇妙的舌头向前推进，在你体内蠕动。起初只是舌尖，但醉酒的蜥蜴人以持续的强度将它一寸寸地强行塞入你体内。你能感觉到她的唾液在你的[asshole]周围起泡，当她用越来越多沾满唾液的舌头填满你的后庭时，气泡不断冒出。这种插入似乎永无止境，夺走了你的力气，用几十寸的长度填满了你。罗克珊对着你幽暗的洞口哼着歌，让她的舌头在你体内震动，同时它还拱起去爱抚最敏感的部位。[pg]");
         outputText("高潮猛烈地袭来，你的[asshole]尽力去绞紧里面那条巨大的粉色舌头。你仰起头，舒服得嚎叫起来，你的[ass]下意识地撞到了你蜥蜴人情人的鼻子上。她心领神会地捏了你一下，同时她的舌头继续进攻，将一波波纯粹的、原始的快感强行送入你的小脑。");
         if(get_player().hasCock())
         {
            outputText("你在她的手中喷射，任由她挤出一团又一团的精液。不知怎的，你尽量压低了呜咽声，而那条长长的、完美的舌头摩擦着你的前列腺，她的手将最后一滴精液挤到了泥土里。");
            if(get_player().cumQ() >= 500)
            {
               if(get_player().cumQ() < 1000)
               {
                  outputText("在地面将其吸收之前，它形成了一个大小适中的水洼。");
               }
               else if(get_player().cumQ() < 1500)
               {
                  outputText("在地面将其吸收之前，它形成了一个大水洼。");
               }
               else
               {
                  outputText("在地面将其吸收之前，它形成了一个巨大的水洼。");
               }
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你颤抖着在她的手指上高潮，");
            if(get_player().wetness() >= 4)
            {
               outputText("用你喷涌的高潮浸湿它们");
            }
            else
            {
               outputText("用大量的淫液弄得它们黏糊糊的");
            }
            outputText("同时她用那些慢得可怕的触摸挑逗着你的[clit]。");
         }
         outputText("[pg]");
         outputText("彻底结束后，你只能颤抖着，而罗克珊将她的舌头从你的直肠中抽出，伴随着响亮的吧唧声从你的后庭拔出。她立刻倒在地上咯咯地笑了起来，完全醉了，但她不知怎么又摇摇晃晃地站了起来，在你的屁股上拍了一下。你学着她的样子，挣扎着站起来，虽然因为后庭高潮而感到疲惫，但觉得相当放松。当你准备好后，你意识到罗克珊的船员们在你周围围成了一个半圆。你注意到有许多恶魔在那个保护圈外徘徊，不过既然事情已经结束，它们似乎正在散去。看起来安全后，你走回去检查营地。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Inte(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function roxanneReamsYouNormal() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("一只脚挡在了你和桌子之间，猛地一推让你脸朝下摔在浸满酒的木板上，最后几寸的下落被罗克珊有力的双手减缓了。一根长着鳞片的手指伸进你的[armor]下，拉扯着。随着每一件装备被强行脱下，你变得越来越赤裸，完全暴露在火堆的热量和蜥蜴人光滑的鳞片下。当你试图移动并阻止她时，房间倾斜了，你又摔了回去，不再理会周围醉醺醺的旋转。海盗开怀大笑，俯身将你的双手按在桌子上。虽然她的姿势达到了限制你的预期效果，但也让你获得了令人羡慕的能力——感觉到罗克珊坚硬如铁的乳头压在你的背上。[pg]");
         outputText("你在蜥蜴人身下咯咯地笑，你的脸擦干了之前狂饮时洒出的起泡酒。你舔着它，忘记了自己的困境，适应着覆盖在你身上温暖、长满鳞片的身体。罗克珊任由你分心，而她则扭动着脱下裤子，她的尾巴摇摆着，以平衡现在释放出来的巨大阴茎。湿透的肉棒翘起，撞在你的屁股上，当它在你的臀瓣间扭动时，滴落着先列腺液。它戳着你的[asshole]，把你从醉酒的昏迷中唤醒，让你回头看了一眼，但海盗开始用舌头舔你的耳垂，让你咯咯地笑起来，在酒精润滑的性感中放松下来，顺从了她。[pg]");
         outputText("毒尾船长缓慢而稳定地推进，将她滴水的龟头强行穿过你被酒精放松的后庭，进入你的体内。结肠突然被拉直，你因为不适而闷哼，无法默默承受这样的巨物。这足以将你从半昏迷的沉默中唤醒，你试图要求她慢一点，流着口水，用麻木的嘴唇含糊不清地抗议。[say:放松，我无助的猎物。别反抗。就躺在那儿，接受你应得的，]仍然有些清醒的蜥蜴人命令道，同时用近乎恶意的表情色眯眯地看着你。她的话是真的，你喝醉了，无力抵抗那几寸粗壮的扶他肉棒滑入你被撑开的后庭。");
         get_player().buttChange(Math.floor(30 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) / 4),true,true,false);
         outputText("[pg]");
         outputText("你醉得无法控制自己，你的括约肌反复收缩，将罗克珊粗壮的肉棒又吸入了几寸。它将你完全填满，这种充实感让你有限的思绪全都集中在肛门里那团球状肿块的感觉上。虽然蜥蜴人从头到脚" + (get_noFur() ? "几乎" : "") + "长满了鳞片，但她的阴茎显然不是。你根据塞满你的形状判断，她的肉棒就像人类的一样，是一根长着青筋的肉棒，顶端是圆润的龟头。她的蛋蛋拍打着");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋，" + Utils.num2Text(get_player().balls + 2) + "个球体在它们出汗的阴囊里相互滚动");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[vagina]，出汗的球体因为你日益增长的渴望而变得湿滑");
         }
         else
         {
            outputText("你的会阴，出汗的皮肤在你们的身体之间紧紧贴合");
         }
         outputText(".[pg]");
         outputText("除了躺在那里接受，别无他法。你醉得太厉害了，就算你真的把那个好斗的扶他从你的直肠里弄出来，你也跑不掉。更糟糕的是，她的男性蜥蜴人“船员”在你们俩周围围成一圈站岗。尽管他们似乎专注于防范外部威胁，但你知道，如果不被尾巴绊倒或被强壮、清醒的手臂抓住，你永远也过不去。你打了个嗝，放松下来，你的脸在浸满酒的桌子上滑动，而罗克珊开始猛烈地抽插你被撑开的");
         if(get_player().tail.type > 0)
         {
            outputText("尾穴");
         }
         else
         {
            outputText("肛门");
         }
         outputText("。这感觉开始变得很舒服");
         if(get_player().hasCock())
         {
            outputText("，非常舒服，");
         }
         outputText("当她在你最深处撞击研磨时，从她肿胀的肉棒中喷出几滴压抑已久的渴望。[pg]");
         outputText("[say:嗯……你真他妈的紧，[name]！天哪，我讨厌塞拉芙的诅咒和这个该死的世界……但你的屁股……你那华丽的、吸吮着鸡巴的屁眼……简直是神圣的，]罗克珊赞美道，在她缓慢而填满臀部的抽插间隙拍打着你的臀瓣。她伴随着抽插继续咆哮，加快了速度，同时说道，[say:太性感了……我美丽的、喝醉的肛交荡妇。看看你……你浑身湿透了洒出来的啤酒，在我操你屁股的时候喘着粗气。你真的想赢吗？我打赌你心里其实很想要这个，对吧？继续，点头告诉我你有多想要这个。][pg]");
         outputText("你摇了摇头，而你得到的回报是一记猛烈的、让屁股颤抖的尾巴抽打。你因疼痛而喘息，你的[asshole]不由自主地收缩，从罗克珊的阴茎中挤出几滴先列腺液。这只咄咄逼人的蜥蜴人真的进入了状态，她巨大的、DD罩杯的乳房将你压在桌子上，同时用她灵活的蜥蜴人尾巴拍打你的脸颊。她一边抽插一边拍打你，为了你每一次挤压她鸡巴的动作而虐待你，");
         if(!get_player().hasPerk(PerkLib.Masochist))
         {
            outputText("直到你为了避免疼痛而自愿收缩腹肌。");
         }
         else
         {
            outputText("直到你在每一次让屁股发红的抽打中发出愉悦的呻吟。");
         }
         outputText("在猛烈的攻势下崩溃，你醉醺醺地呜咽着，[say:操我的屁眼……用你的精液塞满我，]并怀疑自己是否真的是这个意思。[pg]");
         if(get_player().hasCock())
         {
            outputText("她不断抽插的压力似乎直接流向了[eachcock]，仿佛罗克珊每一次撞击前列腺都在向你注入她的欲望。");
            if(get_player().cockTotal() == 1)
            {
               outputText("它随着你的心跳在你的肚子上弹跳，享受着被迫的肛门压力。");
            }
            else
            {
               outputText("它们随着你的心跳在你的肚子上弹跳，享受着肛门压力。");
            }
            outputText("粘稠的先列腺液从你身上漏出，你无法抑制从嘴里爆发出的愉悦喘息。");
            if(get_player().hasVagina())
            {
               outputText("令你既高兴又羞愧的是，你的小穴同样被这动作唤起，因为海盗淫荡的肛门猛击而变得充满麝香且湿润。");
            }
            outputText("[pg]");
         }
         else if(get_player().hasVagina())
         {
            outputText("她不断抽插的压力似乎直接流向了你的[vagina]，让你湿润的阴唇发炎。你能感觉到她的重量压迫着你的女性器官，摩擦着你的内壁。绝妙的内部摩擦释放了你天然的润滑液，");
            if(get_player().wetness() < 2)
            {
               outputText("弄脏了你准备好的外阴。");
            }
            else if(get_player().wetness() <= 3)
            {
               outputText("浸湿了你准备好的外阴。");
            }
            else if(get_player().wetness() <= 4)
            {
               outputText("从你准备好的外阴滴落。");
            }
            else
            {
               outputText("，它们正从你早已准备就绪的阴户中源源不断地流出。");
            }
            outputText("[pg]");
         }
         if(get_player().get_tallness() <= 50)
         {
            outputText("罗克珊向前挪了挪，把她的乳房贴在你的头上，让" + (get_noFur() ? "" : "她那光滑的鳞片和") + "巨大的双峰用柔软的拥抱包裹住你。");
         }
         else
         {
            outputText("罗克珊微微向前挪了挪，将" + (get_noFur() ? "" : "她那光滑的鳞片和") + "巨大的双峰在你的背上又往上抬了抬。");
         }
         outputText("她突然加快了速度，一边淫荡地呻吟嚎叫，一边让睾丸重重地拍打着你。你感觉到肠道里传来即将高潮的明显膨胀感，她的睾丸在你的[skindesc]上摩擦，准备喷吐出滚烫的货物。蜥蜴人抓住你的头发，手指在其中扭动，同时将肉棒齐根没入，大声尖叫着让所有人都能听到她的快感。[pg]");
         outputText("你的体内翻江倒海，被蜥蜴人积压已久的精液填满。扶她那对睾丸在你身上弹跳，随着射入你肠道的浓浆而剧烈地收缩放松。湿润感完全占据了你，但喷射却毫不留情地继续着。突然，小股滚烫的精液从你娇嫩的[asshole]中溢出，顺着罗克珊仍在跳动的睾丸流下。这个动作将精液涂抹得到处都是，虽然被完全填满的不适感在增加，但快感也同样在增长，直到你带着淫荡的愉悦抽搐呻吟。[pg]");
         outputText("结束了淫秽的高潮，罗克珊叹了口气，将最后一团浓稠的精液注入你肛门里的精液湖中。她在你耳边轻声说道，[say:真不错……我都能看到你在发抖。你就这么喜欢当个失败者吗？]你顺从地点点头，尴尬地嘟囔着表示同意。[say:真可悲。你明天大概还会回来继续输，对吧？真是个不知廉耻的屁眼荡妇。][pg]");
         outputText("罗克珊向后拉扯，但即使你体内充满了她留下的生殖产物，你依然将她紧紧锁在深处，在她的肉棒上挤压扭动。她越拉越用力，闪亮的紫色鳞片下的肌肉紧绷起来，直到伴随着一声暴力的“啵”，她滑了出来。你在那一刻达到了高潮，在精液如河流般从你大张的肛门涌出时释放了自己。你哭泣着呻吟，颤抖着，沾满啤酒的嘴唇流下幸福的口水。");
         if(get_player().hasCock())
         {
            outputText("");
            if(get_player().cumQ() >= 1500)
            {
               outputText("倾盆大雨般的精液从[eachcock]涌出，顺从地稳定流淌，汇聚成一个");
               if(get_player().cumQ() <= 2500)
               {
                  outputText("水洼");
               }
               else
               {
                  outputText("湖泊");
               }
               outputText("在桌子下面。");
            }
            else
            {
               outputText("精液从[eachcock]流出，顺从地喷洒在桌子下面。");
            }
         }
         if(get_player().biggestLactation() >= 2)
         {
            outputText("阵阵乳汁从你被按住的[nipples]中喷涌而出，在你高潮时喷射出来，将桌子染成白色。");
         }
         outputText("随着一切平息，你陷入了沉睡，在被侵犯后幸福地打着呼噜。[pg]");
         outputText("<b>稍后……</b>[pg]");
         outputText("你在蜥蜴人的床上醒来，<b>宿醉严重</b>，她的手臂环绕着你咕噜作响的肚子。从你后庭的酸痛感来看，她至少又“赢”了两三次。你的头在隐隐作痛，[legs]发软，每次移动都会滴下精液。你费了好大劲才从罗克珊沉睡的身体中挣脱出来，找到你的装备离开，在商队众人色眯眯的注视下羞愧地低着头。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Inte(-1));
         applyHangover();
         resetRoxanneSexTimeCounter();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function roxanneGivesABlowjob() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你打开[armor]的下半部分，把它拉起来，露出你的[cocks]；");
         if(get_player().get_lust100() < 70)
         {
            outputText("它完全变硬，昂然挺立。");
         }
         else
         {
            outputText("那已经硬梆梆的肉棒昂首挺立。");
         }
         outputText("罗克珊醉醺醺地咯咯笑着，她半闭的眼睛向上瞄着，同时双膝跪地，身体前后摇晃。[say: 我其实不太常干这个，不过要是你的家伙有我这么大……你就知道哪里最爽了。][pg]");
         outputText("罗克珊那光滑、带鳞的手握住了你的");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("肉结");
         }
         else if(get_player().hasSheath())
         {
            outputText("肉鞘");
         }
         else
         {
            outputText("根部");
         }
         outputText("，一边轻柔地挤压着，一边靠着你的" + get_player().cockDescript(_loc1_) + "稳住自己。她痴痴笑着，让几寸舌头滑出嘴唇，包住你敏感的" + get_player().cockHead(_loc1_) + "，带着醉醺醺的口水，绕着那饱胀的阴茎肉打转。");
         if(get_player().balls > 0)
         {
            outputText("一双温热、长着长指甲的手捏住你的[balls]，尖利的指尖沿着囊袋的下侧划过，逗弄着那对可怜巴巴、装满了精液的蛋蛋。");
         }
         outputText("这位蜥蜴女醉眼朦胧地回头望着你；她半是空洞的眼神与你做着爱，粉红的舌头则膜拜着你那根沾满了啤酒和唾液的肉棒。[pg]");
         outputText("你瘫坐在椅子上，[legs]向四周伸展，在酒精和绝妙口交的双重作用下彻底放松下来。罗克珊将注意力转回你的" + get_player().cockDescript(_loc1_) + "上，更多的舌头从她大张的嘴里溢出，卷住你因欲望而肿胀的肉棒。这个喝醉的蜥蜴人的口腔器官吞噬了");
         if(get_player().cockArea(_loc1_) < 60)
         {
            outputText("你" + get_player().cockDescript(_loc1_) + "的整个长度");
         }
         else
         {
            outputText("她尽可能多地包住你那尺寸惊人的阴茎");
         }
         outputText("，像蛇一样收缩着，将你紧紧裹在湿滑温暖的怀抱中。突然，一根尖锐的指甲划过你的会阴，按压的力度刚好能让你保持不动，而扶他海盗则用她的舌头伺候着你的" + get_player().cockDescript(_loc1_));
         if(get_player().hasVagina())
         {
            outputText("，在快要碰到你女性入口的地方停了下来");
         }
         outputText(".[pg]");
         outputText("伴随着吸吮和抽插声，那根跳动的舌头在你的" + get_player().cockDescript(_loc1_) + "上滑动，完美地贴合成一个肉棒套。起初，她只是缓慢而逐渐地抽插，用带着酒味的唾液涂抹你的肉棒，但当第一滴先列腺液滚落到这个灵活的口交工具上时，海盗便开始超负荷运转，疯狂地抽插起来。她的尾巴来回甩动，兴奋地拍打着桌子、椅子和泥土。[pg]");
         outputText("几个恶魔开始靠近，但蜥蜴人船员挡在他们的船长和闯入者之间，在他们惹事之前把他们赶走了。你几乎没有注意到这些，因为你完全沉浸在唾液顺着你的" + get_player().cockDescript(_loc1_) + "流下的感觉，以及那柔软、顺从的口腔肌肉试图从你的肉棒中榨取精液的感觉中。高潮的温暖开始在你的下体聚集，你本能地开始迎合着舌头抽插，尽管有尖锐指甲的警告，你的臀部还是从椅子上抬了起来。[pg]");
         outputText("啪！罗克珊的尾巴拍打在你的[ass]上，刺痛了暴露在外的[skindesc]。她不悦地皱起眉头，双臂环抱住你的腰，稳住她失去平衡的身体，同时在醉酒的狂热中拍打并抽插着你。你挺动腰肢迎合她的脸，将你的" + get_player().cockHead(_loc1_) + "压在她的嘴唇上，涂上一层渗出的先列腺液。你抓住她的角，在快感中大叫出声，试图把她拉下来，但她狠狠地打了你一下。你痛得叫了一声，松开她的角，完全屈服于她的舌头和它带来的快感。[pg]");
         outputText("扭动着、灵活的舌尖压在你的尿道上，将精液堵在你的体内。细小的白色粘液绕过粉红色的阻碍喷射和渗漏出来，滚过舌头上的许多纹理，而你的尿道则膨胀变宽。蜥蜴人抬起头，她那呆滞、迷离的眼睛锁定着你的眼睛，然后她移开了堵住你射精口的舌头，接着颤抖着，因为一股");
         if(get_player().cumQ() >= 1500)
         {
            outputText("巨大的洪流彻底浸透了她的脸、角、脖子和紧身的上衣");
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("巨大的喷射物浸透了她的脸和角");
         }
         else
         {
            outputText("大股的喷射物溅满了她的脸");
         }
         outputText("的精液。她柔软的口腔器官挤压着被唾液润滑的表面，将你" + get_player().cockDescript(_loc1_) + "和[balls]里剩下的精液挤出来。[pg]");
         outputText("海盗向后退去，卷起舌头吸吮她脸上的浓稠液体");
         if(get_player().cumQ() >= 1500)
         {
            outputText("和身体上的");
         }
         outputText("。[say:天哪，憋了很久了吧？]她笑着说，一边挣扎着站起来，一边为自己自以为是的聪明咯咯地笑。你对比赛的结果很满意，把[eachcock]塞回[armor]里，摇摇晃晃地走回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Inte(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function roxanneFucksYourAssOHGODITSHUGE() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("天哪，罗克珊力气真大……她真是个好朋友，帮你上了她的马车，即使她还得拖着那根巨大的肉棒。蜥蜴人将你搂在怀里转了一圈，然后深深地吻了你的脸，她巨大的舌头粗暴地撬开你的嘴唇，探索你依然松弛的口腔深处。片刻之后，你迟钝的反应才跟上这个吻，你舔吮着她的舌头，紧紧依偎着这个");
         if(get_player().get_tallness() >= 80)
         {
            outputText("娇小的");
         }
         else if(get_player().get_tallness() < 50)
         {
            outputText("高大的");
         }
         outputText("扶她寻求支撑。当你努力保持直立时，房间在你脚下摇晃，你尽可能协调地用舌头回应这位甜美的蜥蜴“女士”。她笑着把你推倒在床上，当你像只三条腿的狗一样毫无优雅可言地摔在床垫上时，她咯咯地笑了起来。[pg]");
         outputText("[say:哦，我等这一刻等了太久了，[name]。你根本不知道这种需求……它只会不断累积，变得越来越大，直到每走一步都是永无止境的快感交响乐。我永远无法满足……永远无法休息……我甚至无法取悦自己。我只能让它生长……不断生长，直到我能找到像你这样喝醉的" + get_player().mf("男孩","荡妇") + "来平息我的需求，让我从这诅咒中得到喘息，]罗克珊一边解释，一边疯狂地撕碎自己的衣服。她那柔软、布满鳞片的身体在烛光下闪闪发光，那对下垂的巨大乳房几乎要把你的目光从她双腿间那头充血的野兽身上吸引过去。蜥蜴人的尾巴在她前进时左右甩动，暴露了她体内汹涌澎湃的狂热情绪。[pg]");
         outputText("赤身裸体的扶他扑了上来，她那大腿粗细的怪物肉棒在你的肚子上喷出先列腺液，并因为即将到来的侵犯而兴奋地抽搐着。她的渴望是如此可爱……甚至让人觉得讨喜，但直到你的装备被脱下，你才想起罗克珊打算把那东西连根插进你体内。你瞪大了眼睛，嘴里结结巴巴地嘟囔着那绝对塞不进去。她用长着鳞片的手指按住你带着酒气的嘴唇，低语道：[say: 嘘，别挣扎。你早就知道会发生什么，" + get_player().mf("亲爱的","性感的女孩") + "。你不会在赌约上赖账的，对吧？再说，现在你想做什么都太晚了……我赤裸的、喝醉的肉便器。][pg]");
         outputText("哦，天哪，罗克珊说得对。她说话的时候已经把你扒光了，你现在完全暴露在外。她的双手抓住你的手臂一拉，把你翻转过来趴着，让你的[legs]悬在床边垂向地板。这个姿势太傻了，你几乎忘了这让你的[ass]成了一个多么完美的靶子！现在自信满满的蜥蜴人拍了一下你的屁股，当你惊讶地跳起来时，她咯咯地笑了起来。");
         if(get_player().tail.type > 0)
         {
            outputText("她抬起你的尾巴");
         }
         else
         {
            outputText("她掰开你的臀瓣");
         }
         outputText("检查你的[asshole]，舔了舔那个小圈，然后用指尖轻轻戳了戳。兴奋的海盗惊呼道，");
         if(get_player().analCapacity() < 150)
         {
            outputText("[say: 哦，可怜的[boy]！我觉得你这样受不了我。让我拿点药膏……毕竟，我还想让你再来找我呢。]");
         }
         else
         {
            outputText("[say: 哦，哇！它好……有弹性。嗯，我甚至都不用给你涂药膏了。你可能已经习惯这种事了，对吧？]");
         }
         outputText("[pg]");
         if(get_player().analCapacity() < 150)
         {
            outputText("冰冷的黏液涂抹在你的菊穴周围，让你在喷嘴完全插入肛门环之前打了个寒颤。罗克珊挤压着，在你的体内涂抹了厚厚一层这种东西，然后拔出来笑了笑。[say: 这应该能让它变得又好又有弹性。如果我没遇到那些地精，我都不知道该怎么办了！] 渴望的扶他惊呼道。");
         }
         else
         {
            outputText("当她的手指和舌头在你的菊穴周围游走，拉扯和扩张它，以确保它能承受她计划注入的巨大注射物时，你打了个寒颤。[say: 是的，你准备好了——它已经试图榨取我的手指了。我等不及想感受它对我的肉棒做什么了！] 渴望的扶他惊呼道。");
         }
         outputText("你回头看了一眼，撅起嘴唇，感觉到温暖的肉棒在你的会阴处摩擦，寻找目标。罗克珊亲昵地捏了捏你的脸颊，当她终于把龟头对准那个湿润的洞口时，她发出了愉悦的哼声，但她很享受这一刻，忍耐着，同时色眯眯地看着你颤抖的身体。[pg]");
         outputText("突然，她所有的犹豫或克制都烟消云散了；蜥蜴人向前推进，将她巨大的龟头的前几英寸埋入你紧紧抓握、大张的后庭中。");
         if(get_player().analCapacity() < 150)
         {
            outputText("多亏了药膏，这种撑开肠道的插入几乎没有带来什么不适。");
         }
         else
         {
            outputText("多亏了你对那个洞的经验，这种撑开肠道的插入几乎没有带来什么不适。");
         }
         outputText("她太大了……大得不自然。罗克珊的肉棒感觉如此巨大，以至于你醉醺醺的大脑在试图处理这惊人的尺寸时感到一阵眩晕，把它与从棍棒到树干的一切东西进行比较。当她的龟头进入你体内，被你的肛门环紧紧挤压时，蜥蜴人发出了近乎如释重负的叹息。她没有停在那里，再次向前推进，强迫你");
         if(get_player().analCapacity() >= 150)
         {
            outputText("沾满唾液的");
         }
         else
         {
            outputText("涂满药膏的");
         }
         outputText("湿滑的屁股接受越来越多的肉棒。锋利的指甲在你的[hips]上划过");
         if(get_player().hasPlainSkin())
         {
            outputText("，在你无瑕的皮肤上留下红色的痕迹");
         }
         outputText("同时你的臀部肉眼可见地被撑开，不知怎么地接受了正常人体永远无法接受的东西。");
         get_player().buttChange(Math.floor(30 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) / 4),true,true,false);
         outputText("[pg]");
         outputText("罗克珊停下来，充满情欲地喘息着，她两英尺长、能抓握的舌头垂在她深邃的乳沟里，同时她抚摸着她那根暴露在外的一半肉棒。她用一根手指在你左边臀瓣的隆起处划过，让她的指甲留下");
         if(get_player().hasScales())
         {
            outputText("你的鳞片上有一个粗糙的“X”抓痕");
         }
         else
         {
            outputText("你的皮肤上有一个发红的“X”抓痕");
         }
         outputText("。你因为疼痛和那种奇怪的饱胀感而呜咽，但她却问道：[say:我们要不要在这里纹个身？一个漂亮的红色“X”，用来标记罗克珊·毒尾最喜欢的宝藏……那不是很好吗？]你顺从地发出一声呜咽，试图集中注意力听她说话，但酒精和身体的极度膨胀让你疲惫的意识除了更多的肉棒之外什么也消化不了。[pg]");
         outputText("随着抽插的继续，你体内的压力又增加了一分，在晕眩的大脑中绽放出快感和痛苦的烟花。你翻着白眼，呜咽着哭泣，你的器官在移动，以适应那个已经推到肚脐以上的凸起。双手抚摸着你的肚子，隔着你的[skindesc]挤压着那团肉块，你晕眩的潜意识试图控制自己，以应对屁股被完全撑开的局面。罗克珊得意地笑着往下看，她那爬行动物的目光在完全自信的伪装和疯狂的欲望之火之间摇摆不定。每隔几秒钟就会冒出巨大的先列腺液气泡，在它们被蜥蜴人不断侵入的肉棒填满之前，浸透了你被拉伸的内脏。[pg]");
         outputText("你浅浅地呼吸着，试图看看还剩下多少；谢天谢地，看起来只有几英寸就能完全没入你的屁眼了。罗克珊的手掌在你的后腰上摩擦，用力把你压在垫子上，让你被肉棒填满的身体紧紧包裹住她那饥渴、跳动的肉棒。最后她终于插到底了，她那沉重、肿胀的睾丸弹在你的");
         if(get_player().balls > 0)
         {
            outputText("自己的");
         }
         else if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText("现在变得狭窄的会阴");
         }
         outputText("上，翻滚着，肿胀着，准备喷吐出沉重的负荷。[pg]");
         outputText("[say:哦……哦……太舒服了……我觉得那只被拉伸的老鼠无论如何也不会有这么舒服，]罗克珊评论道，她一边完全插在里面，一边来回拍打着你的屁股，享受着你扭动、被肉棒扭曲的身体无意中带来的肉棒按摩。她呻吟着喘息着，[say:我-呃……我想我快要……射了。太紧了……海神作证，我爱死你的屁股了！]她的双手抓住你并挤压，同时她的睾丸紧紧地贴在海盗肿胀的肉棒根部。[pg]");
         outputText("[say:我要射了了了了了了了了了！]她发出女妖般的哀号，她那尖锐的快感几乎让你头疼。她的根部膨胀起来，迫使你被侵犯的后庭变得更宽，因为她巨大的精管里充满了精液。你在沉重的肉棒长矛末端扭动着，而你的肠子被塞满了一周量的、被诅咒的精液，在被塞满时发出隆隆的晃动声。这对你脆弱的神经来说太难以承受了，对你醉醺醺、充满欲望的身体的彻底侵犯引发了一场让身体扭曲的高潮。你翻着白眼，然后翻白眼，你的身体在蜥蜴人烤肉般的肉棒周围痉挛。快感如瀑布般流过你的全身，在整个高潮过程中洗去了这种行为带来的不适和痛苦，在你恢复平静之前，你陷入了昏迷");
         if(get_player().hasCock() && get_player().cumQ() >= 1000)
         {
            outputText("，口水流到了你在她床上弄出的一大滩精液里");
         }
         else if(get_player().hasVagina() && get_player().wetness() >= 4)
         {
            outputText("，口水流到了你溅在床垫上的那滩泥泞的淫液里");
         }
         outputText("。");
         outputText("<b>你醒来后会带着严重的宿醉回到营地。</b>");
         get_player().orgasm("Anal");
         dynStats(DynStat.Inte(-1));
         applyHangover();
         resetRoxanneSexTimeCounter();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function roxanneDrinkingContestNo() : void
      {
         var _loc1_:* = null as IMap;
         if(get_game().time.hours == 19 || get_game().time.hours == 20)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,872,FlagDict_Impl_.arrayReadInt(_loc1_,872) + 1);
            if(int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,872) % 4) == 0 && get_player().get_gender() == 1)
            {
               get_bazaar().nightBazaarButtfuck();
               return;
            }
         }
         get_bazaar().enterTheBazaarAndMenu();
      }
      
      public function roxanneDrinkingContestLoseDeliberately() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,226,1);
         roxanneDrinkingContest();
      }
      
      public function roxanneDrinkingContest() : void
      {
         var _loc2_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("罗克珊");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 200)
         {
            outputText("被她巨大的阳具绊了一下，跌跌撞撞地走向");
         }
         else
         {
            outputText("漫步走向");
         }
         outputText("那个在酒桶前工作的恶魔般的鹿半人马，给了他一个沉甸甸的宝石袋，提前支付了比赛和她同伴喝酒的费用。她让酒保把杯子倒满，然后仰头喝下，熟练地咽了几口就轻松喝光了。她的尾巴拍打着你面前的桌子，戏弄道，[say: 你打算看我一整天还是喝个烂醉？来吧！][pg]");
         outputText("你拿起杯子，递给在酒桶前工作的被腐化的半人马。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) <= 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 2)
         {
            outputText("他一边给你倒酒一边对你坏笑，对你试图在拼酒上胜过罗克珊·毒尾感到十分好笑。看来当地人并不相信你能赢");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 2)
            {
               outputText("——尤其是在你上次受辱之后。");
            }
            else
            {
               outputText("——面对如此著名的对手。");
            }
         }
         else
         {
            outputText("他在给你倒酒时色眯眯地看着罗克珊，回想起她上次的败北，大概是希望他也能像你一样感受到她的舌头。");
         }
         outputText("你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) < 3)
         {
            outputText("犹豫地闻了闻这杯酒，感受着它深邃的颜色和令人陶醉的啤酒花香气，然后");
         }
         else
         {
            outputText("微笑着舔了舔嘴唇，吸入啤酒花的香气，然后");
         }
         outputText("你猛地把黑啤酒灌了下去。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) <= 0)
         {
            outputText("[say:你管这叫喝酒？好好看着学着点，" + get_player().mf("兄弟","姐妹") + "！]罗克珊得意地大喊，将酒杯高高举过头顶。泡沫丰富的饮料开始倾泻而下，琥珀色的醉人瀑布如雨点般落在蜥蜴人的脸上，但这位精明的海盗早有准备。她张开下巴，伸出舌头——那条超过两英尺长的粉红色器官，接住了酒精的倾盆大雨，并将其漏斗般送过她微笑的嘴唇。喝完后，她大声打了个嗝，粗鲁地向你挺了挺臀部。[say:我希望你准备好被操了！][pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) == 0)
         {
            outputText("[say:你喝酒还是像个外行。不过，你回到老毒尾船长这里，想和我的小兄弟较量一番，我倒是不觉得惊讶，]蜥蜴人海盗戏谑地说着，用舌头卷住杯柄，把它举到唇边，一口气将整杯酒咕咚咕咚地灌了下去，喉咙完全放松。罗克珊大声打了个嗝，向你挺了挺臀部，说道：[say:准备好再被操一次了吗？][pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) <= 0)
         {
            outputText("[say:上次我没准备好！好吧，我想现在开始了！这次我不会输的，你打赌我为了报复会加倍用力地骑你！]罗克珊假装自信地大喊。她迅速喝下饮料，为了不被你比下去，她急急忙忙地喝着，泡沫在她的" + (get_noFur() ? "嘴唇" : "龙吻") + "角泛起。就在你看着的时候，她舔了舔嘴唇，打了个寒颤，不舒服地扭动着，而她裤子里那根被诅咒的肉棒变得更硬了。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 1)
         {
            outputText("[say:别太得意，小狗。罗克珊·毒尾这辈子打败并占有过的水手比你大得多。上次只是个意外，]她宣称道。这位坚定的蜥蜴人晃了晃满满的酒杯，然后一口气将它吞下，喉咙鼓起。她那灵活的尾巴毫无预兆地拍打在你的[ass]上，当你惊讶地差点从座位上跳起来时，她轻笑起来。[say:这只是热身。][pg]");
         }
         else
         {
            outputText("[say:你难道没意识到之前的胜利只是个意外吗？好好看着学着点，小狗，]罗克珊嘲讽道，一口气将酒杯吞下，喉咙鼓起。你轻笑起来，一个不自觉的嗝打断了你的欢乐，因为这位海盗蜥蜴人粗鲁地向你挺了挺臀部，她那鼓胀的男性特征在突然变紧的裤子里清晰可见。[say:我等不及要把这东西再次埋进你的屁股里了！][pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,226) == 0)
         {
            outputText("酒桶旁的牛头人很快就对你和这位长满鳞片的虚张声势的海盗之间不断的斗嘴感到厌倦，只有当你们俩走回去续杯时，他才懒洋洋地看你们一眼。随着你和罗克珊变得越来越醉，比赛开始时那种暴饮暴食的狂饮让位于一种更加慵懒的节奏，你们放慢了速度，希望对方先被判定为不合适。她一直盯着你看，这确实让人有点难以集中注意力，而且她那曲线优美的身材和");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 200)
            {
               outputText("巨大到快要撑破接缝的凸起");
            }
            else
            {
               outputText("难以掩饰的凸起");
            }
            outputText("每次你回敬她的色眯眯的目光时，都会让你大饱眼福。不过，从她的肉棒弄出的一大块湿斑来看，这个长满鳞片的扶他肯定也有同感。[pg]");
            dynStats(DynStat.Lust(25));
         }
         else
         {
            outputText("酒桶旁的牛头人很快就对罗克珊不断的斗嘴和你对蜥蜴人倾注的调情感到厌倦。你迅速喝下饮料，甚至在蜥蜴人分心时偷偷续杯，以加速你不可避免的失败。她看着你，显然是在打量你，而你则毫不掩饰地盯着她那紧绷的裤子里那团跳动的肉棒。罗克珊停止喝酒，走到你身边，虽然有点不稳但仍然控制着自己，她把你的头拉向她的腹股沟，让你用鼻子蹭它，同时把装满酒的杯子塞到你手里。[say:继续喝吧……好[boy]，]当你转过头吞下更多美味的啤酒时，她柔声说道。[pg]");
         }
         var _loc1_:Number = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,226) == 0)
         {
            _loc1_ = get_player().get_tallness() * ((get_player().thickness + 100) / 200) * (get_player().get_tou() / 100) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,227);
            if(get_player().hasPerk(PerkLib.SatyrSexuality))
            {
               _loc1_ += 10;
            }
            if(get_player().hasPerk(PerkLib.Lustserker))
            {
               _loc1_ += 10;
            }
            if(get_player().hasPerk(PerkLib.Dragonfire))
            {
               _loc1_ += 10;
            }
            if(get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
            {
               _loc1_ += 10;
            }
            if(get_player().hasPerk(PerkLib.Medicine))
            {
               _loc1_ += 5;
            }
            if(get_player().hasPerk(PerkLib.Resolute))
            {
               _loc1_ += 5;
            }
         }
         if(_loc1_ < 45 + Utils.rand(20))
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,223,FlagDict_Impl_.arrayReadInt(_loc2_,223) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,224,2);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,227,FlagDict_Impl_.arrayReadInt(_loc2_,227) + 10);
            outputText("你咯咯地笑着，差点被自己的[feet]绊倒，跌跌撞撞地走到被腐化的鹿半人马面前。他看着你摇摇晃晃的站姿、几乎空洞的眼神和呆滞的笑容，然后摇了摇头，说道：[say:不行。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,226) == 0)
            {
               outputText("不！你被断酒了！这意味着罗克珊赢了……");
            }
            else
            {
               outputText("太棒啦！你终于喝得这么醉，这下罗克珊可没理由不把你这个醉醺醺的家伙灌满蜥蜴人的精液了！");
            }
            outputText("一只布满鳞片的手拍在你的[ass]上，把你转了个圈，醉醺醺地跌进这位海盗柔软舒适的胸膛里。[say: 别担心，我会温柔点的，]她低语着，用一只手臂勾住你瘫软的身躯。");
            if(get_player().butt.rating > 12 && get_player().tone <= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) > 1 && Utils.rand(2) == 0)
            {
               doNext(bigBootyRoxanneContestLoss);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 200)
            {
               doNext(roxanneFucksYourAssOHGODITSHUGE);
            }
            else
            {
               doNext(roxanneReamsYouNormal);
            }
         }
         else
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,222,FlagDict_Impl_.arrayReadInt(_loc2_,222) + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,224,1);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,227,FlagDict_Impl_.arrayReadInt(_loc2_,227) + 4);
            outputText("你放声大笑，带着一脸好笑的表情看着罗克珊踉踉跄跄地朝酒桶走去，被自己的尾巴绊倒了三次，最后还是没要到另一杯酒。那个半腐化的鹿怪摇了摇头，双臂抱在胸前。她被禁酒了！你赢了！这个好色的蜥蜴女在地上跺了跺带跟的靴子，然后摇摇晃晃地走回你身边，屁股醉醺醺地扭来扭去。她又被自己的尾巴绊倒了，这次是脸朝下栽进了你的大腿上。打着醉嗝，罗克珊含混不清地说：[say: 唔，至扫我不用走多远就能给你赢家的奖励了，对吧？][pg]");
            outputText("其他的蜥蜴人正用警惕的目光看着你。看来你得遵守比赛的约定了。你要让她提供哪种口舌服务呢？");
            menu();
            if(get_player().hasVagina())
            {
               addButton(0,"舔阴",roxanneCunnilingus);
            }
            else
            {
               addButtonDisabled(0,"舔阴");
            }
            if(get_player().hasCock())
            {
               addButton(1,"口交",roxanneGivesABlowjob);
            }
            else
            {
               addButtonDisabled(1,"口交");
            }
            addButton(2,"舔肛",roxanneRimjob);
         }
      }
      
      public function roxanneCunnilingus() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("你扭动着脱下[armor]向后靠去，将你的[vagina]暴露在喝醉的蜥蜴人的嘴前。她摇晃了一会儿，抓住你的[legs]稳住自己，然后倾身向前，用她" + (get_noFur() ? "" : "长满鳞片的") + "鼻子蹭着你的外阴。你因为突然接触到她的" + (get_noFur() ? "皮肤" : "鳞片") + "而颤抖，但她并没有急于求成，而是在湿润的入口处呼气和嗅闻。她那双带着醉意的眼睛抬头看着你，迷离的眼球显得有些困惑，她的下巴慢慢张开，释放出她的舌头。[pg]");
         outputText("毒尾那粉红色的长舌头就像一个有知觉的生物一样渗了出来，微微摇晃着，仿佛在嗅着空气，然后压在");
         if(get_player().wetness() >= 4)
         {
            outputText("滴着淫液的");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText("多汁的");
         }
         outputText("下体入口。你感到一阵眩晕，靠在椅背上，在强烈的欲望驱使下将胯部向前挪动。罗克珊的鼻尖消失在湿润的阴唇中，她那滑溜的口部器官被你充满欲望的通道吞没。它在你体内蠕动、扭动，粗大的粉色突起四处抽打，以打圈的方式舔舐着你阴道壁上的汁液。唾液开始顺着你的[legs]滴落，你看到罗克珊在为你服务时，嘴角泛起了唾沫星子。[pg]");
         outputText("你羞红了脸，呻吟着在蜥蜴人身上挺动，抓住她的角，以便将她的鼻子蹭在你的[clit]上。她向后退去，用醉酒后的力气抵抗着你坚持不懈的拉扯，但在你松手之前，她反方向将额头猛地撞向你的肚子，让你喘不过气来。你的手指立刻松开，捂着疼痛的腹部，而愤怒的蜥蜴人咆哮着，[say:你是在享受口交，不是把我当假阳具用！……不过我很抱歉打得那么重。我只是需要呼吸。放松，让我补偿你……][pg]");
         outputText("喝醉的蜥蜴人用她柔软、带有轻微鳞片的手指环绕着你，捏了捏你的[ass]，然后凑近，在你的[clit]上落下一个温柔的吻。她巨大的舌头");
         if(get_player().getClitLength() < 16)
         {
            outputText("使之相形见绌");
         }
         else
         {
            outputText("包裹住");
         }
         outputText("那个");
         if(get_player().getClitLength() < 1)
         {
            outputText("小巧的快乐按钮");
         }
         else if(get_player().getClitLength() < 3)
         {
            outputText("肿胀的爱之豆");
         }
         else
         {
            outputText("像鸡巴一样的女性器官");
         }
         outputText("，用淫荡的舌吻在上面流下口水。她那充满泡沫的唾液完全浸湿了它");
         if(get_player().getClitLength() >= 3)
         {
            outputText("然后她紧紧地卷住那个女性器官，用灵活、黏糊糊的舌头包裹住它。你及时屏住呼吸，呼出嘈杂的欢愉声，并大声呻吟。罗克珊将这听觉上的鼓励铭记在心，开始抽动她的舌头，同时将她的下唇贴在你的[vagina]上并发出嗡嗡声。似乎这还不够，她开始在你的[clit]上下扭动卷曲的舌头，在抽插你的同时旋转它。");
         }
         else
         {
            outputText("然后她让她那沾满口水的舌头穿过你那被唾液浸透的阴阜入口。你及时屏住呼吸，呼出嘈杂的欢愉声，在你被灵活、黏糊糊的舌头刺穿时大声呻吟。罗克珊将这听觉上的鼓励铭记在心，开始将她的舌头深深地抽插进你的体内，至少两英尺长、不断变粗的附肢在你的入口处盘旋，然后滑入体内亲吻你的子宫颈。似乎这还不够，片刻之后她开始发出嗡嗡声，在用舌头操你的同时用鼻子蹭你的[clit]。");
         }
         outputText("[pg]");
         outputText("你无助地在原地抽搐，与身体交配的欲望作斗争，努力不让你那颤抖的阴户刺穿海盗的鼻子。");
         if(get_player().hasFuckableNipples())
         {
            outputText("罗克珊把手从你的屁股上移开，向上伸去，摇摇晃晃地直到她抓住你的[nipples]。一秒钟后，她将手指滑入那欢迎她的乳头小穴中，用手指操着你的乳房，就像");
            if(get_player().biggestLactation() < 1.5)
            {
               outputText("下面的那个一样熟练");
            }
            else
            {
               outputText("它们开始在她周围喷出乳汁");
            }
            outputText("。");
         }
         outputText("你再也无法抑制体内的压力，以一种令人大脑空白、语无伦次的强度高潮了。当你开始痉挛时，蜥蜴人丝毫没有放松");
         if(get_player().wetness() >= 5)
         {
            outputText("以及喷出的淫液");
         }
         outputText("贴着她。她收紧了抓握，加快了舌头那性感的按摩，在你于她怀中扭动时，几乎让你爽得晕厥过去。纯粹而幸福的灼热感传遍全身，抽干了你无法控制的抽搐所带来的力量，取而代之的是慵懒的温暖。");
         if(get_player().hasCock())
         {
            outputText(get_player().SMultiCockDesc() + " 在她的头上，在她的角之间弹跳，顺着她的背脊洒下一道黏稠的精液。");
         }
         outputText("你瘫软下来，沉醉在快感中咯咯笑着，而罗克珊则把自己解脱出来。[pg]");
         outputText("这个自大、喝醉的蜥蜴人含糊不清地说：[say: 兄弟，我得睡一会儿才能缓过来。下次我要干她的屁眼！][pg]");
         outputText("你回以一个得意的笑，慢慢穿好衣服。罗克珊无法阻止你注意到她那被先列腺液浸透的裤子里，那巨大而明显的阴茎轮廓。她给了你一个充满欲望和侵略性的迷离眼神，但这次她得不到她的奖品了！");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Inte(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function resetRoxanneSexTimeCounter() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,225,1);
      }
      
      public function bigBootyRoxanneContestLoss() : void
      {
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         outputText("天哪，你的头晕乎乎的！房间在左右摇晃，你" + get_player().mf("轻笑","咯咯笑") + "着，漫不经心地想，在罗克珊的船上是不是也是这样。不过，这位天赋异禀的扶他似乎一点也不介意你醉醺醺的笨拙。她把手勾在你的[butt]下，赞赏地捏了捏那宽大的臀肉，然后咆哮道：[say:这么漂亮、圆润的屁股；简直是用来塞肉棒的完美选择！你醉得像个勇者。你更适合做个船舱[boy]，]她一边把你拖向她的马车，一边在你耳边说道。");
         outputText("[pg]当你被推到门上时，木板发出嘎嘎的响声，你柔软的脸颊向两侧挤压，撑开了你的[armor]。这位胸部丰满的胜利者用鼻子蹭着你的脖子，一路留下淫荡、醉醺醺的舔舐，直到你的下巴。她湿润的叹息声席卷了你，她开始喘息得越来越快，她不断加快的兴奋几乎夺走了你们俩口中的呼吸。蜥蜴人半软的阴茎挤压着你的大腿，慢慢地充血，随着不断膨胀的激情而变得越来越硬。在某个时刻，它挣脱了海盗皮裤的束缚，你醉醺醺地低头看着它。");
         outputText("[pg]当你低头看它时，罗克珊的阴茎条件反射般地变大，在几秒钟内长了四五英寸。在主人下一次心跳之前的瞬间，它停顿了一下，然后再次膨胀。这一次，它向上猛冲，敏感的龟头从你的[hips]弹开，然后停在你的肚子上。膨胀的肉棒滑到你的[chest]，沿途留下一道闪闪发光的先列腺液痕迹。罗克珊柔声说道：[say:哦，我们还是进屋去吧，免得弄出太大动静！]");
         outputText("[pg]下一刻，你跌跌撞撞地走进屋里，被粗暴地推到床边，然后被强行按在床上。你呻吟着，醉醺醺地抱着一个枕头，适应着这个奇怪的姿势。该死；你要被操了，不是吗？你试图站起来，但房间在旋转，你身上的[armor]正以惊人的速度消失。啪！一只手重重地拍在你的[butt]上，力道大得让你的[hips]摇晃起来，让你丰满的肉体也跟着颤动！");
         outputText("[pg][say:你的屁股真大真漂亮，]罗克珊嘟囔着，捏着其中一瓣屁股，她的手指消失在那团肉里。[say:像你这样丰满、渴望肉棒的荡妇，我怎么也操不够。]");
         outputText("[pg]这个喝醉的扶他一边热情地揉捏着你的臀部，一边拉开她裤子的拉链。她那沉甸甸、装满精液的睾丸弹了出来，自由地晃荡着。片刻之后，罗克珊的皮裤被踢开，她的夹克也紧随其后。她如释重负地呼出一口气，趁机感受你的[butt]，充满欲望地揉捏着那丰满的肉体，而她的肉棒则在上方危险地变大并摇晃着。几滴滚烫的蜥蜴人先列腺液溅在你的背上——这是罗克珊的兴奋化作了纯粹的液体。你在你这位相对清醒的同伴的服侍下呻吟着，放松下来。感觉太棒了，好到你都忘了刚才为什么要试着站起来。你让自己陷进床垫里，肌肉松弛，身体完全敞开，暴露在她那强有力的肉棒下。");
         outputText("[pg]当罗克珊抽身退开时，几滴蜥蜴人的爱液溅在你的屁股蛋上，她评论道：[say: 你的屁股真漂亮，[name]。这么厚实、柔软，而且……闪闪发光。]狭长的爬行动物手指滑过你的股沟，将海盗天然的润滑液抹得到处都是，并缓慢地在你的[asshole]周围画圈。在第一次触碰时，你本能地收紧了，这是对试探的反应，但这个扶他坚持不懈的抚摸慢慢征服了你醉醺醺、渴望快感的大脑（和后庭）。[say: 好[boy]！]蜥蜴人鼓励地喊道。");
         outputText("[pg]在经历了所有的酒精、亲吻和性感的抚摸之后，你感到渴望并准备好了，突然渴望着你的蜥蜴人情人为你保留的、即将到来的超大号侵犯。当罗克珊球状的龟头对准你的[asshole]时，你对着枕头叹息，你的括约肌因期待而颤抖。你醉醺醺地含糊不清地乞求道：[say: 进去……快点进去……我太他妈饥渴了！]");
         outputText("[pg]罗克珊高兴地拍了拍你的[butt]，反驳道：[say: 我正在准备，你这个贪婪的屁股荡妇！]她呻吟着，你感觉到她的一些糖浆状的先列腺液滑过了你润滑良好的后庭。尽管她这么说，但她已经准备好开始了，也准备好爆发了。她将滴着液体的入侵者推过你的大门，突然猛地一插，强行撑开你，用力一推，撞进了你的直肠。虽然她很大，但只有她的龟头和最初的几英寸进去了，但你感觉自己好像要被劈成两半了。那根跳动的肉矛因你内脏的温暖和你那又大又圆的屁股的挤压而快乐地抽动着。");
         get_player().buttChange(Math.floor(30 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) / 4),true,true,false);
         outputText("[pg][if (hasCock) {你的[EachCock]抽动着，只有半硬，却因为你可怜的前列腺受到的轻微撞击而颤抖。你呻吟着，俏皮地扭动着，你的屁股抚摸着球状的入侵者，把它拉得更深，摩擦你的肛门G点。一小股先列腺液喷在床单上，预示着即将到来的乐趣。}]");
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("");
         }
         outputText("[if (hasVagina) { 与此同时，你的[vagina]变得越来越湿滑，你的欲望在空气中弥漫着强烈的女性体香。哦，要是罗克珊也能操那里就好了！}]");
         outputText("罗克珊咕哝道：[say: 真是个好女孩……]");
         if(!get_player().hasVagina())
         {
            outputText("[say: 哦，我知道你没有小穴，但今晚，你就是我的大屁股精液垃圾桶！]");
         }
         else
         {
            outputText("[say: 哦，你会成为我最棒的肛门精液垃圾桶。你可怜的小穴会非常渴望精液，但你会被精液塞得满满的，看起来就像怀孕了一样！]");
         }
         outputText("[pg]当罗克珊进一步向前挺进，将几英寸长的强力蜥蜴肉棒埋入你体内时，你呜咽起来。它巨大的尺寸让你的内脏微微移位，你确信现在你的肚子上一定有明显的凸起。这个扶他幸福地叹了口气，继续将她的肉棒越来越深地插入你体内。最后，当你觉得再也装不下时，她那巨大、颤抖的睾丸压在了你的臀部上。如果你没有这么圆的屁股，她可能还会试图进入更深的地方，但你丰满的臀部实际上帮助她与你脆弱的后庭拉开了一点距离。");
         outputText("[pg]你如释重负地叹了口气，身体微微颤抖，适应着体内的肉矛，慢慢放松下来，直到你被撑开的后庭更舒适地扮演了罗克珊性玩具的角色。她高兴地呼出一口气，将光滑的手掌放在你的肩膀上，紧紧抓住你，然后再次推进。你痛苦地尖叫起来，因为海盗那巨大的肉棒至少又滑进了一英寸，她的臀部和睾丸将你摇晃的屁股蛋挤向两边。她的阴囊现在一定痛苦地压着你，但罗克珊并没有让步。她把你按在那里，强迫你容纳比以前更多的东西。");
         outputText("[pg]几秒钟后，这个喝醉了的、长着鳞片的扶他拔出了大部分，戏弄道：[say: 觉得空虚吗，亲爱的？我会把你填满的，我的船舱[boy]，]然后再次插入。罗克珊的臀部开始熟练地抽插你张开的后庭，每一次抽插都将她圆润的龟头[if (hasCock) {抹过你预先润滑过的前列腺。你忍不住在被迫的极乐中呻吟。|穿过你身体的每一个敏感部位，力度大到让你在感官的冲击下颤抖。}]罗克珊欣喜若狂地大叫，将大团的液体射入你的直肠。从你的肠子里可以听到沉闷、湿润的挤压声和明显的液体翻滚声，但你很确定这仍然只是先列腺液。");
         outputText("[pg]你毫不掩饰地呻吟和喘息着，你的脸被这个用力操你的蜥蜴人压在床垫上。她越来越快地捣弄着你，每次在她撞击你巨大的臀部时，都会气喘吁吁地享受着快感。你也忍不住收紧和挤压——你的身体正在受到无情的撞击。你的括约肌在粗大的肉棒周围痉挛，当你再也受不了时，你高潮了，醉醺醺地、顺从地胡言乱语着。");
         outputText("[pg]罗克珊呻吟着：[say: 要……来……了！]然后将自己深深地插入你体内，力度大到她的睾丸在你柔软的屁股上留下了印记。黏糊糊的精液在你体内爆发，慢慢地将你肚子上可见的凸起从尖端扩大到根部，最终从罗克珊仍在喷射的肉棒边缘喷出一股精液。精液顺着你的[legs]滴下，在地上汇成一滩。与此同时，你肿胀的肚子开始看起来相当像怀孕了。它慢慢地鼓起来，让你可怜的肚子完全、彻底地被填满了。你对这种感觉如此习惯，以至于当罗克珊终于慢下来时，你从高潮后的迷雾中醒来[if (hasCock) {，隐约意识到你把罗克珊的床单弄得一团糟}]。[if (cumQuantity >= 1000) {她的床完全湿透了，巨大的精液泡顺着粗大的河流滴落，在湿漉漉的地板上汇成水坑。哎呀。}]罗克珊毫不客气地拔了出来，从你受虐的后门释放出一股白色的洪流。");
         outputText("[pg]你的力气耗尽了，要么是因为酒，要么是因为你刚刚承受的令人难以置信的开垦和内射。无论如何，你瘫倒在一片狼藉中[if (hasCock) {，在自己的精液中睡着了}]。");
         outputText("[pg]<b>稍后……</b>[pg]");
         outputText("你在蜥蜴人的床上醒来，她的手臂环绕着你咕噜作响的肚子。从你后庭的酸痛程度来看，她可能至少又“赢”了两三次。你的头在隐隐作痛，你的[legs]发软，你的一举一动都会让精液从你的屁股里滴出来。你费了一番功夫才从罗克珊沉睡的身体中脱身，但你找到了你的装备并离开了，在商队成员色眯眯的注视下羞愧地低下了头。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Inte(-1));
         applyHangover();
         resetRoxanneSexTimeCounter();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function applyHangover() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as Player;
         if(get_player().hasStatusEffect(StatusEffects.Hangover))
         {
            get_player().changeStatusValue(StatusEffects.Hangover,1,8);
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.Hangover,8,0,0,0);
            _loc1_ = 5;
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(get_player().get_str() >= 2)
               {
                  get_mainView().statsView.showStatDown("str");
                  _loc2_ = get_player();
                  _loc2_.set_str(_loc2_.get_str() - 1);
                  get_player().addStatusValue(StatusEffects.Hangover,2,1);
               }
            }
            _loc1_ = 10;
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(get_player().get_spe() >= 2)
               {
                  get_mainView().statsView.showStatDown("spe");
                  _loc2_ = get_player();
                  _loc2_.set_spe(_loc2_.get_spe() - 1);
                  get_player().addStatusValue(StatusEffects.Hangover,3,1);
               }
            }
            _loc1_ = 15;
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(get_player().get_inte() >= 2)
               {
                  get_mainView().statsView.showStatDown("inte");
                  _loc2_ = get_player();
                  _loc2_.set_inte(_loc2_.get_inte() - 1);
                  get_player().addStatusValue(StatusEffects.Hangover,4,1);
               }
            }
         }
         statScreenRefresh();
      }
      
      public function RoxanneChooseApproachOrRepeat() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_poisontail());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,221) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,221,FlagDict_Impl_.arrayReadInt(_loc1_,221) + 1);
            outputText("你走上前，拉开一把空椅子坐下，仔细打量着这些蜥蜴人，而他们的首领也在打量着你。其他人似乎无视了你，挪到桌子的另一边低声交谈。那个身材丰满的女孩倾过身子，递给你一个马克杯，并自我介绍道：[say: 我叫罗克珊·毒尾。曾经是个著名的海盗，现在只是另一个被困在这个扭曲领域的灵魂。你可以叫我毒尾船长或者罗克珊——你的故事是什么？][pg]");
            outputText("她的目光在你身上游走，半听半不听地听着你自我介绍，解释你作为英格纳姆勇者的身份，被派到这里来保护它免受恶魔的入侵。[pg]");
            outputText("[say: 呵。我没想到会有人故意来这个地方。嗯，也许是个变态。我的意思是，如果你不介意慢慢被腐化逼疯的话，在这里你走两步就会撞见有人在做爱。周围全是这些迷人的恶魔尾巴……而我甚至不能操她们中的任何一个，否则就会慢慢迷失自我。这太让人抓狂了！] 毒尾大声说道，她卷起嘴唇，露出一排排尖锐的牙齿。她那绝望、充满欲望的眼睛盯着你，突然灵光一闪。[pg]");
            outputText("她说道：[saystart]你看起来不像她们中的一员……你甚至闻起来都不像。");
            if(get_player().cor > 66)
            {
               outputText("是的，你身上确实有些腐化，但我认为你还没有像那些恶魔和她们的同类那样具有传染性。");
            }
            outputText("我需要发泄一下，[name]。[sayend] 她张开双腿，拍了拍左腿，露出了一个危险的巨大凸起，足以与牛头人相媲美。[say: 哦，你没注意到吗？我并不完全是个女孩。我以前不长这样，但我愚蠢地从一个叫塞拉芙的恶魔那里买了一颗药丸，从那以后我就后悔了。当然，她给我的药丸让我的鸡巴变大了，但它永远不会停止生长。我唯一能让它缩回去的方法就是在别人的后庭里高潮，但很难找到能承受它的人。朱砂甚至不让我买她的服务，虽然我觉得她是在等果实成熟，可以这么说，] 她一边咯咯笑着，一边挪动着同样巨大的双胞胎睾丸。[pg]");
            outputText("[say: 现在，我想喝酒的欲望几乎和我想做爱的欲望一样强烈。我们为什么不来场拼酒比赛呢？如果我赢了，我就把这个坏男孩埋进你的屁股里，一直射到我恢复正常为止。如果你赢了，我会给你一个[guy]能得到的最好的口交服务！][pg]");
            outputText("你指出她显然占了便宜，她回答道：[say: 那又怎样？这就是我的条件。我宁愿被自己鸡巴的重量压死，也不愿让别人来决定我该怎么做爱。再说，你知道你想感受这个。] 毒尾张开嘴，让舌头伸出来。它伸长到了一个淫秽的长度，一直延伸到她大乳房的乳沟处，性感地起伏蠕动着。她说得有道理");
            if(get_player().cor < 33)
            {
               outputText("，但一个勇者真的会做这种事吗？");
            }
            else
            {
               outputText("。");
            }
            outputText("[pg]");
            outputText("这位海盗蜥蜴人把一个装满酒的马克杯推到你面前，说道：[say: 怎么样？我们一杯换一杯。谁先被管酒桶的家伙切断供应，谁就输了。见鬼，我甚至可以请客。][pg]");
            outputText("你要和她进行拼酒比赛吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,222) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,223) <= 0)
         {
            outputText("[say: 我看你又回来了，[name]。你是为了免费的酒回来的，还是……？] 罗克珊的声音渐渐变小，朝你摇晃着舌头。她拍了拍那个几乎掩饰不住的巨大凸起，问道：[say: 还是你想输？记住，如果我赢了，我就能用这头野兽塞满你的屁股。如果你赢了，我会给你只有蜥蜴人才能给的口交服务。现在来吧，让我们喝到忘记这个该死的地方。][pg]");
            outputText("你要和毒尾船长进行拼酒比赛吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 200)
         {
            outputText("[say: 哦，赞美海神乌尔伦，你回来了。[name]，好久不见，我变得好大好大，]罗克珊欣喜若狂地欢呼道。为了强调她的话，她向你展示了裤子里几乎要撑破接缝的凸起，从根部一直摩擦到顶端，那顶端就靠在她的膝盖旁边。她太大了，裤腿膝盖处出现了一块湿斑，巨大的肉肠肉眼可见地膨胀起来。毒尾船长问道，[say: 那么，我能指望你喝得烂醉，然后再帮我解决这个大家伙吗？还是你真的认为你现在有赢的机会？][pg]");
            outputText("看起来她想和你再进行一场饮酒比赛。如果你输了");
            if(get_player().analCapacity() >= 100)
            {
               outputText("她会让你一直被撑开，合不拢腿");
            }
            else
            {
               outputText("她可能会把你的屁股撑到超出正常极限");
            }
            outputText("。你要和罗克珊进行饮酒比赛吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) < 200)
         {
            outputText("[say: 欢迎回来，[name]。你是不是太想念我的抚摸了，所以又来找我了？]罗克珊问道。她拍了拍一张空椅子，张开双腿，调整了一下姿势让自己更舒服，同时提醒你最近的“失败”。谢天谢地，看起来她最近做过爱，她的老二尺寸正常多了。蜥蜴人问道，[say: 那么，准备好再来一场饮酒比赛了吗？老规矩——我赢了，我就用我的大肉棒塞满你甜美的屁股。你赢了，我就舔到你高潮。][pg]");
            outputText("你要再和罗克珊喝酒吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) < 200)
         {
            outputText("当你走近时，罗克珊瞪了你一眼，在和你打招呼之前，她仰头喝下了一杯麦酒。[say: 欢迎回来。好吧，我想我现在也不算太大。不过，把它弄小一点走起路来会轻松些。你觉得怎么样，再来一场饮酒比赛如何？老规矩——我赢了，你被操。你赢了，我会给你一个湿漉漉的口交舌浴，保证让你爽得扭来扭去。][pg]");
            outputText("罗克珊把一个空杯子滑向你。你要再试着把她喝趴下吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,224) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,225) >= 200)
         {
            outputText("当你回来时，罗克珊畏缩了一下，无聊地摩擦着裤子里巨大的凸起。先列腺液顺着布料流下，明显地弄暗了布料。她咕哝道，[say: 你回来了，嗯？我一直在练习，我需要释放。让我们再来一场饮酒比赛吧！规则不变，这次我会赢，然后操到你合不拢腿！]她看起来绝望又饥渴，显然渴望释放。[pg]");
            outputText("你接受她参加饮酒比赛的提议吗？");
         }
         else
         {
            outputText("如果你读到这个，说明出bug了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,226,0);
         unlockCodexEntry(2046);
         menu();
         addButton(0,"是",roxanneDrinkingContest);
         addButton(1,"否",roxanneDrinkingContestNo);
         addButton(2,"输掉",roxanneDrinkingContestLoseDeliberately);
      }
      
      public function RoxanneAppearance() : void
      {
         if(get_game().time.hours > 12 && get_game().time.hours < 19)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,221) == 0)
            {
               outputText("[pg]离火堆不远处有一张桌子，围坐着半打穿着奇特的蜥蜴人。几英尺外放着一个小酒桶，他们似乎玩得很开心。");
            }
            else
            {
               outputText("[pg]罗克珊和她平时的船员们正坐在火堆旁的一张桌子边，一边喝酒一边讲着下流的故事。");
            }
         }
      }
      
      public function Roxanne1stApproach() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_poisontail());
         outputText("你犹豫着走近那些正在喝酒的蜥蜴人，注意到了他们不同寻常的衣着和外貌。他们都穿着带银边的黑色夹克、紧身皮裤和高筒黑靴。奇怪的是，他们中最有女人味的那个似乎是首领。她的夹克被丰满圆润的DD罩杯双峰撑得满满的，她的靴子放弃了传统的形状，换成了更显风骚的高跟。她的鳞片是深紫色的，在光线下闪烁着暗淡的光芒" + (get_noFur() ? "，除了脸和躯干外，几乎覆盖了全身" : "") + "，虽然她的头" + (get_noFur() ? "很大程度上像人类，但没有耳朵，而且" : "呈蜥蜴状，") + "后脑勺上长出了一对像龙一样的角，代替了头发。其他的蜥蜴人似乎都是男性，但他们表现得好像很害怕这位女性首领。[pg]");
         outputText("突然，这只领头的蜥蜴人抬起头，与你四目相对，她的表情变成了一种色眯眯的冷笑，问道：[say: 看到喜欢的了吗，" + get_player().mf("伙计","小妞") + "？过来，给我们讲讲你的故事！][pg]");
         outputText("你要过去吗？");
         unlockCodexEntry(2046);
         doYesNo(RoxanneChooseApproachOrRepeat,get_bazaar().enterTheBazaar);
      }
   }
}

