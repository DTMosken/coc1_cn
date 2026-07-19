package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons.helDungeon.Brigid;
   import classes.scenes.dungeons.helDungeon.HarpyMob;
   import classes.scenes.dungeons.helDungeon.HarpyQueen;
   import classes.scenes.dungeons.helDungeon.PhoenixCommander;
   import classes.scenes.dungeons.helDungeon.PhoenixGrenadier;
   import classes.scenes.dungeons.helDungeon.PhoenixPyro;
   import classes.scenes.dungeons.helDungeon.PhoenixSapper;
   import classes.scenes.npcs.GooArmor;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class HelDungeon extends DungeonAbstractContent
   {
      
      public function HelDungeon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function vaginalHarpyQueenSex() : void
      {
         clearOutput();
         outputText("你粗暴地将鹰身女妖女王扔到地板上，咧嘴笑着告诉她，既然你破坏了她繁育不死鸟的计划，那你就干脆给她一窝勇者的种。她目瞪口呆地看着你，睁大了眼睛，充满困惑和恐惧。当你脱下[armor]，露出你的[cock]时，赫尔为你按住了她。");
         outputText("[pg]赫尔转过身，跨坐在鹰身女妖女王的脸上。她蹲下身，把自己的小穴停在离女王鼻子只有一英寸的地方，她那条长长的、火红的尾巴在小穴上方来回摆动。[say: 你应该感到荣幸，婊子，]赫尔咆哮着，抓住女王的头发。[say: 我朋友的种子孕育的一颗蛋，抵得上你一千个软弱的荡妇。快，感谢[him]！]");
         outputText("[pg]鹰身女妖在赫尔有力的抓握下挣扎着，直到挨了火蜥蜴一记响亮的耳光。[say: 呃！谢谢！谢谢你赐予我孕育你后代的荣幸！]她恳求着，身体还在扭动。你大笑着抓住她粗壮的大腿，把它们分开，露出你的战利品。她的小穴是双腿间一道宽阔的裂缝，大张着，流着润滑液，被她漫长一生中生下的几十个——甚至几百个——蛋撑得超出了人类的极限。");
         outputText("[pg]你跪在她的双腿间，试探性地把你的[cock]插进她体内；她似乎只是把它吸了进去，一瞬间就吞没了你整个肉棒。天哪，她太大了！你感觉自己像是把肉棒插进了一个黑洞，一个没有尽头的洞穴。她因为插入而微微呻吟，但轻松地容纳了你的全部长度，甚至还有空余。你稍微挪动了一下，把她的双腿并拢，让那大张的小穴收缩起来。");
         outputText("[pg]终于，你感觉到她湿滑的肉壁包裹住了你的[cock]。女王颤抖了一下，但看到你打算用你的种子填满她，明显放松了下来。不过，她还是太松了，无法给你想要的快感……");
         outputText("[pg]一个邪恶的笑容在你的脸上蔓延。你向前伸出手，抓住赫尔的尾巴，因为它的高温而皱了皱眉，然后把它拉回鹰身女妖女王的胯下。赫尔回头看着你，笑着接替了你的动作。你稳住身体，她那灵活的尾巴滑了回来，在你的[cock]上缠绕了一圈，然后和你一起滑进了女王体内。当她滚烫的尾巴沿着你的肉棒爬进她大张的小穴时，你和育母同时倒吸了一口凉气，直到鹰身女妖对着赫尔的胯部发出一声尖叫。你猜火蜥蜴找到了她的子宫，正把尾巴扭动着钻进去。");
         if(get_player().cockArea(0) < 48)
         {
            outputText("你也不甘示弱，猛地向前挺动臀部，将你的[cock]撞入女王的深处，直到你追上赫尔，猛烈地撞击着她子宫的入口。");
         }
         outputText("[pg]现在鹰身女妖的产道里有了第二根柱状物，感觉没那么宽敞了。你开始像活塞一样在女王婊子体内抽插；每一次抽插，你的肉棒都会摩擦着三面湿滑的肉壁和赫尔滚烫的尾巴，让你的[cock]感觉像是在液态的炼狱中，感觉棒极了。你开始更快地操女王，已经感觉到自己的高潮正在逼近。她的体液从她松弛的小穴中自由地流出，在你和赫尔完全填满她时，在她的双腿间汇聚成一滩，给了她可能是她几年来第一次满足的性爱。");
         outputText("[pg]当鹰身女妖高潮时，你并不感到惊讶，她仰起头，在高潮时尖叫着。赫尔大笑着，开始在她体内甩动尾巴，几乎要在她体内缠住你的[cock]。随着突然的收缩和肉棒周围额外的运动，你再也坚持不住了；");
         if(get_player().cumQ() < 300)
         {
            outputText("你把[hips]撞进鹰身女妖的腹股沟，射精了，把浓稠的、充满精子的精液直接射进她等待着的子宫里。");
            outputText("[pg]你射了又射，用你所有的种子填满女王，直到你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]感觉");
            }
            else
            {
               outputText("胯部感觉");
            }
            outputText("空虚而空洞。你和赫尔都颤抖着退了出来，你的肉棒和她的尾巴上沾满了精液和淫水。");
         }
         else
         {
            outputText("你把[hips]撞进鹰身女妖的腹股沟，射精了，在女王的子宫深处释放出大量的精液，让鹰身女妖因为你射出的精子数量之多而颤抖。你继续在鹰身女妖的肉壁上涂抹了一分钟，直到你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]感觉");
            }
            else
            {
               outputText("胯部感觉");
            }
            outputText("空虚而空洞。你和赫尔慢慢退了出来，导致你的一些精液从鹰身女妖巨大的阴道中漏出，让你的肉棒和赫尔的尾巴上沾满了精液和淫水。");
         }
         outputText("[pg]在这样的一场性爱之后，育母很快就会产下一窝你的蛋。");
         get_player().orgasm("Generic");
         cheatTime(0.3333333333333333,true);
         doNext(playerMenu);
      }
      
      public function towerOutro() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,494,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 0)
         {
            outputText("你让哈康的手臂搭在你的肩膀上，扶着这位被囚禁已久的火蜥蜴走上楼梯，费了九牛二虎之力，终于走出了塔楼古老的大门。在外面，你看到了赫莉娅和她那半个不死鸟血统的姐姐奇里。当傍晚的阳光照在哈康的眼睛上时，他退缩了一下，这是他多年来第一次感受到阳光。");
            outputText("[pg]当你把哈康带到外面时，赫尔和奇里转向你，笑得合不拢嘴。");
            outputText("[pg][say: 赫尔，] 奇里拉着火蜥蜴的手说。[say: 我想让你见个人。]");
            outputText("[pg]当这位年长的火蜥蜴看到他不知情的女儿走向他并伸出手时，他勉强挤出一个微笑。[say: 嘿，老鳞片。我叫赫莉娅——简称赫尔——我……为什么大家都这么看着我？]");
            outputText("[pg][say: 赫尔，] 奇里说，[say: 这是……我们的爸爸。哈康。]");
            outputText("[pg][say: 老鳞片，是吗？] 哈康咧嘴笑着说。[say: 让我告诉你一件事，小女孩。我——哎哟！]");
            outputText("[pg]还没等“老鳞片”说完，赫尔就扑进了他的怀里，紧紧地抱住了他。你可以看到泪水顺着她的脸颊流下——而且，你觉得，他的脸上也是——当两只火蜥蜴拥抱在一起时，泪水从他们身上滑落。");
            outputText("[pg][say: 真的是……你吗？爸爸？]");
            outputText("[pg][say: 是我，小赫尔。我再也不会离开你了。]");
            outputText("[pg]接下来的几个小时，你坐在塔楼的台阶上，看着这个久别重逢的家庭重新认识彼此。你一直微笑着，看着赫尔、哈康和奇里很快就互相打趣玩闹起来，仿佛他们一直都在一起似的。");
            outputText("[pg]终于，到了该走的时候了。哈康搂着他的女儿们，走到你面前。[say: " + get_player().mf("孩子","甜心") + "，我怎么感谢你都不为过。不是因为你释放了我，而是因为……因为你让我重新回到了我的家庭。如果你需要任何东西，请毫不犹豫地开口。如果我的生命或剑能帮到你，我会毫不犹豫地去做。]");
            outputText("[pg][say: 是啊，] 赫尔咧嘴笑着说。[say: 你做得很好，我的爱人。别担心，我很快就会来找你，让你看看我有多感激你。]");
            outputText("[pg][say: 我的爱人？] 哈康轻笑着说。[say: 我想我们在下山的路上有很多话要谈，小丫头。]");
            outputText("[pg][say: 哎，操。]");
            outputText("[pg]你笑着摇了摇头，开始下山。");
         }
         else
         {
            outputText("你让哈康的手臂搭在你的肩膀上，扶着这只被囚禁已久的火蜥蜴走上楼梯，费了九牛二虎之力，终于走出了塔楼古老的大门。在外面，你看到的是一片广阔的山脉；这是一个壮丽的景色，巨大的岩石尖顶和峭壁环绕着你，直到太阳在远处只剩下一丝微光。哈康眯起眼睛，捂住双眼，这是他多年来第一次沐浴在阳光下。");
            outputText("[pg]在你身后，你听到一声突如其来的、欢快的叫喊：[say: 爸爸！]");
            outputText("[pg]哈康及时转过身，赫尔扑进了他的怀里，紧随其后的是她同父异母的不死鸟姐姐奇里。你可以看到泪水顺着女孩们的脸颊流下——而且，你觉得哈康也是——当一个父亲终于和他的女儿们团聚时，泪水从他们脸上滑落……");
            outputText("[pg][say: 是……真的是你吗？爸爸？] 赫尔毫不掩饰地哭着问。你觉得她以前从来没有见过她的父亲。");
            outputText("[pg][say: 是我，小赫尔。我再也不会离开你了。]");
            outputText("[pg]接下来的几个小时，你坐在塔楼的台阶上，看着这个久别重逢的家庭重新认识彼此。你一直微笑着，看着赫尔、哈康和奇里很快就互相打趣玩闹起来，仿佛他们一直都在一起似的。");
            outputText("[pg]终于，到了该走的时候了。哈康搂着他的女儿们，走到你面前。[say: " + get_player().mf("孩子","甜心") + "，我怎么感谢你都不为过。不是因为你释放了我，而是因为……因为你让我重新回到了我的家庭。如果你需要任何东西，请毫不犹豫地开口。如果我的生命或剑能帮到你，我会毫不犹豫地去做。]");
            outputText("[pg][say: 是啊，] 赫尔咧嘴笑着说。[say: 你做得很好，我的爱人。别担心，我很快就会来找你，让你看看我有多感激你。]");
            outputText("[pg][say: 我的爱人？] 哈康轻笑着说。[say: 我想我们在下山的路上有很多话要谈，小丫头。]");
            outputText("[pg][say: 哎，操。]");
            outputText("[pg]你笑着摇了摇头，开始下山。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2086,1);
         get_game().inDungeon = false;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function tortureGear() : void
      {
         clearOutput();
         menu();
         outputText("你走到刑架前。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,489) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,490) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,491) == 0)
         {
            outputText("刑架上放着：");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,489) == 0)
            {
               outputText("一条鞭子");
               addButton(0,"魅魔长鞭",takeWhip);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,490) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,489) == 0)
               {
                  outputText("，");
               }
               outputText("一些皮带");
               addButton(1,"骨制束带",takeStraps);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,491) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,490) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,489) == 0)
               {
                  outputText("，");
               }
               outputText("一把涂有催情药剂的匕首");
               addButton(2,"L.Daggr",takeDagger);
            }
            outputText("。");
         }
         else
         {
            outputText("刑架是空的。");
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function talkToValeria() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         outputText("现在你终于有时间喘口气了，你问你的粘液盔甲她对目前的情况有什么看法。");
         outputText("[pg][say: 哦，嗨，]她笑着说。她从你的盔甲里流出一半，在离你几英寸的地方凝聚出她的脸。奇里吓得跳了起来，睁大眼睛看着你的盔甲在你面前变成了一个新的人。");
         outputText("[pg][say: 嘿，小可爱，]瓦莱丽娅说着，对奇里眨了眨眼。鹰身女妖微微颤抖了一下，从惊讶中回过神来。");
         outputText("[pg]你清了清嗓子，重复了你的问题。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            outputText("[pg][say: 哦，对了。那个鹰身女妖育母可不是闹着玩的。她是一个强大的法师，而且是个重炮手。小心点，否则你很可能会被下药迷得神魂颠倒，然后被当作繁育母畜直到死。我见过其他来这里的冒险者落得这个下场。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,487) == 0)
         {
            outputText("[pg][say: 狱卒布里吉特是个大块头，可能是这里最刻薄的鹰身女妖。据我所见，其他人都对她敬而远之。她还用一根烧红的拨火棍作为武器。小心点，除非你想被烧伤！]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,492) == 0)
         {
            outputText("[pg][say: 楼上有一些我见过几次的怪异混血鹰身女妖。我猜他们叫不死鸟。他们会喷火，所以小心你的屁股。我可以吸收一些热量，但是……别被烤熟了，好吗？]");
         }
         doNext(playerMenu);
      }
      
      public function talkToKiri() : void
      {
         clearOutput();
         outputText("你问奇里是否介意和你分享一些情报。");
         outputText("[pg][say: 当然，]她愉快地说，[say: 这就是我在这里的原因！你想知道什么？]");
         menu();
         addButton(0,"赫尔",askKirkAboutHel).hint("问问奇里她是怎么认识赫莉娅的。");
         addButton(1,"鹰身女妖",askKiriAboutHarpies).hint("向奇里询问塔里的鹰身女妖。");
         addButton(2,"火蜥蜴",askKiriAboutSalamander).hint("向奇里询问那个火蜥蜴囚犯。");
         addButton(3,"奇里",askKiriAboutKiri).hint("问问奇里能不能讲讲她自己的事。");
         setExitButton("算了",kiriInteraction);
      }
      
      public function takeWhip() : void
      {
         get_inventory().takeItem(get_weapons().SUCWHIP,roomDungeon);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,489,1);
      }
      
      public function takeStraps() : void
      {
         get_inventory().takeItem(get_armors().BONSTRP,roomDungeon);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,490,1);
      }
      
      public function takeQueensStaff() : void
      {
         clearOutput();
         outputText("你捡起鹰身女妖女王的法杖。这是一根高大的白木法杖，将近六英尺长，上面覆盖着发光的神秘符文，顶端有一颗闪烁的水晶球，里面似乎有旋转的雾气。[pg]");
         get_inventory().takeItem(get_weapons().E_STAFF,roomThroneRoom);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,497,1);
      }
      
      public function takeGooArmorAndWearIt() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         get_armors().GOOARMR.useText();
         get_player().get_armor().removeText();
         get_combat().cleanupAfterCombat();
         outputText("[pg]令你惊讶的是，多亏了瓦莱丽娅奇特的治疗特性，战斗结束后你感到精神焕发。你得意地笑了笑，将注意力转回前方的" + (get_game().dungeons.checkPhoenixTowerClear() ? "冒险" : "地牢") + "。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,484,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2200,80);
         get_player().HPChange(get_player().maxHP(),false);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,480,1);
         var _loc1_:Armor = get_player().setArmor(get_armors().GOOARMR);
         if(_loc1_ == null)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2062) == 0)
            {
               doNext(roomGuardHall);
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2062) == 0)
         {
            get_inventory().takeItem(_loc1_,roomGuardHall);
         }
         else
         {
            get_inventory().takeItem(_loc1_,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function takeGooArmor4Realz() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         outputText("你伸出手去抓盔甲，但就在你的手指碰到那闪亮表面的瞬间，头盔里竟然浮现出一张人脸！你吓得往后一缩，只见一张娇俏的亮蓝色女性面孔凭空成型，正用怒火中烧的眼睛瞪着你。构成女孩脸部的粘液物质继续涌出，填满了盔甲，并用粘液形成的脚将它从架子上扯了下来。");
         outputText("[pg]穿着盔甲的黏液女孩低声咆哮道，[say: 凡人，你竟敢打扰我的沉睡？准备好迎接我的复仇吧！]");
         outputText("[pg]搞什么鬼！？管他呢，看来她想打一架！");
         startCombat(new GooArmor());
      }
      
      public function takeGooArmor() : void
      {
         clearOutput();
         outputText("你走近盔甲架。上面放着一套重型板甲，里面套着一件柔软的锁子甲。与这腐朽的房间形成鲜明对比的是，这套盔甲似乎完好无损，甚至还在闪闪发光。也许有人在使用这套重型装备——但肯定不是鹰身女妖吧？你觉得你可以把它拿走。");
         menu();
         addButton(0,"拿走盔甲",takeGooArmor4Realz).hint("确定拿走这套盔甲。它肯定能派上用场。" + (get_player().get_inte() >= 70 ? " 你有一种感觉，这套盔甲里可能藏着什么活物。" : ""));
         addButton(14,"返回",playerMenu);
      }
      
      public function takeGodMead() : void
      {
         get_inventory().takeItem(get_consumables().GODMEAD,roomCellar);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,486,FlagDict_Impl_.arrayReadInt(_loc1_,486) + 1);
      }
      
      public function takeDagger() : void
      {
         get_inventory().takeItem(get_weapons().L_DAGGR,roomDungeon);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,491,1);
      }
      
      public function roomThroneRoom() : void
      {
         clearOutput();
         get_game().dungeonLoc = 22;
         outputText("<b><u>王座室</u></b>\n");
         get_dungeons().setDungeonButtons(null,null,null,null);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            spriteSelect(SpriteDb.get_s_queenCalais());
            outputText("走上楼梯，你被一扇沉重的双开门挡住了去路。门上覆盖着腐烂、剥落的紫色油漆和看起来有数年历史的月桂树枝。隔壁房间传来尖锐刺耳的金属碰撞声——是战斗的声音！你踢开门，冲进了一个类似王座室的地方；一张大地毯占据了你的视线，通向一个高耸的王座，周围环绕着枕头和垫子，目前空无一人。");
            outputText("[pg]在王座室的中央站着火蜥蜴赫莉娅和一个只能被描述为育母的鹰身女妖。她看起来并不特别高大或具有威胁性，但她的臀部确实非同寻常，至少是她身体的三倍宽，她那柔软的屁股在裸露时看起来像峡谷一样，那种屁股能让你永远迷失在其中。这位鹰身女妖主母挥舞着一根法杖，目前正与赫尔那把烧得通红的弯刀进行激烈的战斗。");
            outputText("[pg]在眼角余光中看到你，赫尔从战斗中抽身而出，来到你身边，举起刀指向鹰身女妖育母。");
            outputText("[pg][say: [name]！]她说着，用尾巴戏弄地拍了一下你的屁股。[say: 你可真够慢的，是不是？我还以为我能独占这个婊子呢！]");
            outputText("[pg]你给了赫尔一个让人安心的点头，开始向鹰身女妖女王包抄，你走左翼，赫尔走右翼。女王看了看你们俩，手中变出一团白热的魔法火焰。");
            outputText("[pg][say: 你们这些蠢货！]女王嘶嘶地说，尽可能地后退。[say: 你们根本不知道自己在做什么！我的孩子们……她们存在的唯一目的就是为了玛瑞斯的利益！你们毁了一切！现在恶魔会把我们都抓走。]");
            outputText("[pg]你无视了她，专注于在你的火蜥蜴情人的帮助下就位，以便快速击倒她。然而，在你把鹰身女妖女王逼到角落之前，你听到上方传来一声爆炸般的轰鸣。你抬头一看，正好看到塔顶炸开了一个洞，一大群鹰身女妖涌了进来，至少有几十只。");
            outputText("[pg][say: 哎呀，操！]赫尔尖叫着，在鹰身女妖蜂拥而至的王座室里躲避着如雨般的攻击。在尖叫声和拍打翅膀的声音中，你只能勉强听到育母的笑声，她正命令她的孩子们前进。");
            outputText("[pg][say: 操！[name]！]赫尔大喊，用她的弯刀将一只鹰身女妖劈成两半，[say: 分头行动；你去对付女王。我来对付这些婊子！]");
            outputText("[pg]你还没来得及说一句话，赫尔就抓起两只鹰身女妖，把她们当成肉体攻城锤，一头扎进了由爪子和利爪组成的漩涡中。你转过身，举起[weapon]，面对女王。");
            outputText("[pg]她现在坐在她的王座上，法杖横放在她那鸟一样的腿上。[say: 白痴，]她冷笑着，声音刚好能盖过战斗的喧闹声。[say: 你把我们都害死了。我那么多女儿死了、被打败了或者逃跑了……不，我绝不允许你逍遥法外，即使这意味着要牺牲我的生命。]");
            outputText("[pg]她站了起来，抓起她那根巨大的白木法杖。一团神奇的白焰在她的手中形成，准备将你活活烧死。");
            outputText("[pg]<b>一股无形的力量将门猛地关上，断绝了你的退路。战斗开始了！</b>");
            startCombat(new HarpyQueen());
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) == 0)
         {
            outputText("你站在鹰身女妖的王座室里——这是一个狭长的圆形房间，中间矗立着高高的王座，周围环绕着靠垫和帷幔。一条长长的地毯从沉重的双开门一直铺到王座前，让你想起了昔日城堡里的大厅。许多鹰身女妖蜷缩在阴影中，既然她们强大的首领已经被击败，她们也不敢再反抗你了。");
         }
         else
         {
            outputText("你站在鹰身女妖的王座室里——这是一个长长的圆形房间，中间是一个高高的王座，周围环绕着垫子和窗帘。一条长长的地毯从沉重的双开门一直延伸到王座，让你想起了昔日城堡的大厅。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
         {
            outputText("鹰身女妖女王瘫倒在她的王座上，失去了知觉。");
            addButton(1,"鹰身女妖女王",harpyQueenAdvantage);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
         {
            addButton(0,"赫莉娅",HeliaThroneRoom);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,497) == 0)
         {
            addButton(1,"拿走法杖",takeQueensStaff).hint(get_weapons().E_STAFF.get_description());
         }
         setStairButtons(null,roomMezzanine);
      }
      
      public function roomStairwell() : void
      {
         var _loc1_:Number = NaN;
         get_game().dungeonLoc = 19;
         clearOutput();
         outputText("<b><u>楼梯井</u></b>\n");
         get_dungeons().setDungeonButtons(null,roomGuardHall,null,null);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,485) == 0)
         {
            spriteSelect(SpriteDb.get_s_harpyhorde());
            outputText("你推开沉重的双开门，伴随着一声响亮的[say: 嘎吱！]声，回音在下一个房间里回荡，让你不禁瑟缩了一下——这似乎是一个宽敞的楼梯井，几乎没有任何掩体。简直是鹰身女妖战斗的绝佳场所……哦，该死！");
            outputText("[pg]你准备好你的[weapon]，这时一群鹰身女妖从石头楼梯井中央的小桌旁抬起头来，停止了进食，全都用惊讶的大眼睛盯着你。还有几只鹰身女妖从上面探出头来，顺着楼梯往下看，想看看入侵者。几乎在同一时间，她们跳了起来，露出了爪子。");
            outputText("[pg]战斗开始了！");
            menu();
            startCombat(new HarpyMob());
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            outputText("地板上躺着一堆被你打败、中了药昏迷不醒的鹰身女妖，还有奇里——唯一没有攻击你的那个。你回想起她认识赫尔，并且是来帮助你们俩的。");
            _loc1_ = 0;
            if(get_player().get_armorName() == "goo armor")
            {
               addButton(2,"瓦莱丽娅",talkToValeria).hint("和瓦莱丽娅谈谈目前的情况。");
            }
            addButton(1,"奇里",kiriInteraction).hint("靠近混血女孩奇里。");
         }
         else if(get_dungeons().checkPhoenixTowerClear())
         {
            outputText("你身处一个大房间里。这里有一个宽敞开阔的楼梯井。自从你上次来过之后，这个房间就变得空荡荡的。南边是一对敞开的大双开门。你可以下楼去地牢，或者上楼去夹层。");
         }
         else
         {
            outputText("地板上躺着一堆被你打败、中了药昏迷不醒的鹰身女妖。奇里似乎已经离开了。");
         }
         setStairButtons(roomMezzanine,roomDungeon);
      }
      
      public function roomMezzanine() : void
      {
         clearOutput();
         get_game().dungeonLoc = 21;
         outputText("<b><u>夹层</u></b>\n");
         get_dungeons().setDungeonButtons(null,null,null,null);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,492) == 0)
         {
            spriteSelect(SpriteDb.get_s_phoenix_horde());
            outputText("你沿着沉重的石阶向上走，绕着塔墙盘旋而上。在通往二楼的半路上，你停在了一个小露台上，这里视野开阔，可以俯瞰高山下的山谷。当你踏上夹层时，你皱着眉头看着几个高大、肌肉发达的双性人从阴影中走出来。他们每个人都穿着厚重的锁子甲，手持长矛和血红色的盾牌，但除此之外一丝不挂，露出了他们爬行动物般的肉棒和湿润的小穴。站在你面前的士兵看起来像鹰身女妖，但他们有长满鳞片的人形腿，长长的火红色尾巴，翅膀也是最深的深红色。这些是不死鸟——你和赫尔来这里要阻止的可怕混血战士！");
            menu();
            startCombatMultiple(new PhoenixCommander(),new PhoenixGrenadier(),new PhoenixPyro(),new PhoenixSapper(),phoenixPlatoonLosesToPC,phoenixPlatoonMurdersPC,phoenixPlatoonLosesToPC,phoenixPlatoonMurdersPC,"你面对的是一排重装步兵，全副武装，穿着锁子甲，拿着盾牌。他们看起来像是火蜥蜴和鹰身女妖的杂交品种，除了深红色的翅膀、长满鳞片的脚和长长的火红色尾巴外，其他都是人形。他们站成紧密的盾墙，每只不死鸟都用塔盾保护着自己和身旁的战士。随着他们慢慢向你逼近，他们的长矛在房间里划出巨大的弧线。");
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) == 0)
         {
            outputText("你正站在塔楼的夹层里，这是一个小露台，可以欣赏到高山和下面山谷的壮丽景色。这里有上下楼梯，还有一堆被击败的不死鸟，看起来她们一时半会儿恢复不过来。");
         }
         else
         {
            outputText("你正站在塔楼的夹层里，这是一个小露台，可以欣赏到高山和下面山谷的壮丽景色。这里有上下楼梯。");
         }
         setStairButtons(roomThroneRoom,roomStairwell);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) == 0)
         {
            addButton(1,"不死鸟",checkOutDemBirdBitches).hint("检查不死鸟，也许能满足你更低级的需求。");
         }
      }
      
      public function roomGuardHall() : void
      {
         clearOutput();
         get_game().dungeonLoc = 17;
         outputText("<b><u>守卫大厅</u></b>\n");
         outputText("你站在一个曾经可能是守卫室的地方。现在它已经变成了一片废墟，被洗劫一空。它似乎已经很多年没有被使用过了，靠墙排列的桌子、椅子和长矛都已经腐烂得几乎什么都不剩了。");
         get_dungeons().setDungeonButtons(roomStairwell,null,null,null);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,482) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,481) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) == 0)
            {
               outputText("然而，东墙边放着一套半身板甲，松松垮垮地挂在架子上；看起来还能用。");
               addButton(0,"护甲",takeGooArmor).hint("靠近护甲。你确信这套护甲可能会有用。");
            }
            else
            {
               outputText("你想起这里曾有一套半身板甲。现在架子似乎空了。");
            }
         }
         outputText("你看到一扇沉重的铁门通向北方，虽然它们看起来生锈且沉重，打开它们肯定会惊动附近的任何人，还有一扇通向下方的小活板门。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) > 0)
         {
            outputText("[pg]你已经清理了这座塔。如果你想的话，可以离开了。");
            addButton(11,"离开",exitHelTower);
         }
         addButton(7,"活板门",roomCellar);
      }
      
      public function roomDungeon() : void
      {
         clearOutput();
         get_game().dungeonLoc = 20;
         outputText("<b><u>地牢</u></b>\n");
         get_dungeons().setDungeonButtons(null,null,null,null);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,487) == 0)
         {
            spriteSelect(SpriteDb.get_s_brigid());
            outputText("你顺着楼梯走下，来到一个烟雾弥漫的狭小石室。房间里弥漫着浓烈的蒸汽和烤肉的焦味，呛得你在下楼时忍不住咳嗽。当你走进这座塔的小地牢时，你很快就注意到了被锁在桌子上的火蜥蜴。他是个身材魁梧的男人，身高将近八英尺，浑身布满伤疤。他留着红色的短刺头，颜色与他的尾巴和四肢鳞片一样，左眼窝上戴着一个黑色的眼罩。他看起来糟透了，骨瘦如柴，筋疲力尽，身上沾满了浓厚的精液斑块——显然是被塔里的鹰身女妖们使用了无数次。");
            outputText("[pg]然而，在他旁边站着你见过的最高的鹰身女妖。她比大多数姐妹都要高出一英尺，除了手里拿着一根烧得通红的铁拨火棍和另一只手拿着一面沉重的铁盾外，她一丝不挂。她的粉色头发被剃成了莫西干头，脸上钉着十几个铁钉和铁环。");
            outputText("[pg][say: 你总算下来了，你这个" + get_player().mf("混蛋","婊子") + "。布里吉特妈妈可是等了很长很长时间，就盼着有人来试着劫走她的玩具呢。]她拍了拍盾牌内侧那串沉甸甸的钥匙圈，不怀好意地盯着你。");
            outputText("[pg]你举起你的[weapon]，准备从她手里把钥匙抢过来！");
            startCombat(new Brigid());
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2086) == 0)
         {
            outputText("你站在一间狭小的地牢里，几乎要被烤肉的焦味和烟味呛得作呕。墙上挂着许多恶心的刑具，房间中央摆着一张桌子，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,488) == 0)
            {
               outputText("上面躺着那个火蜥蜴囚犯");
               addButton(0,"囚犯",helDungeonPrisonerTalk).hint("和火蜥蜴囚犯谈谈。");
            }
            else
            {
               outputText("上面躺着哈康");
               addButton(0,"哈康",helDungeonPrisonerTalk).hint("和哈康交谈。");
            }
            outputText("。");
            if(get_player().hasKeyItem("Harpy Key A") && get_player().hasKeyItem("Harpy Key B"))
            {
               outputText("[pg]<b>你拿到了释放囚犯的钥匙。以后你可以通过在地牢子菜单中选择\"不死鸟高塔\"来返回这里。</b>");
            }
         }
         else
         {
            outputText("你站在一间狭小的地牢里，几乎要被烤肉的焦味和烟味呛得作呕。墙上挂着许多恶心的刑具，房间中央摆着一张空桌子。");
         }
         setStairButtons(roomStairwell);
         addButton(1,"刑具",tortureGear).hint("这里有一些变态的装备，正等着你去拿。");
      }
      
      public function roomCellar() : void
      {
         clearOutput();
         get_game().dungeonLoc = 18;
         outputText("<b><u>酒窖</u></b>\n");
         get_dungeons().setDungeonButtons(null,null,null,null);
         outputText("你掉进了一个地下的小藏身洞，里面有");
         if(get_player().get_tallness() < 60)
         {
            outputText("空间刚好够你站直");
         }
         else
         {
            outputText("天花板很低，你不得不蹲下");
         }
         outputText("。令你惊讶的是，没有什么可怕的东西跳出来试图强暴你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,486) < 5)
         {
            outputText("你看到酒架上挂着几个装满蜂蜜酒的角杯——它们闻起来有点刺鼻，但俗话说酒越陈越香……");
            outputText("这里还有 " + Utils.num2Text(5 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,486)) + " 个神之蜜酒角杯可以拿走。[pg]");
            addButton(0,"神之蜜酒",takeGodMead);
         }
         else
         {
            outputText("酒架空了。你已经拿走了所有的蜂蜜酒角杯。");
         }
         addButton(5,"爬上去",roomGuardHall);
      }
      
      public function returnToHeliaDungeon() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-phoenixtower");
         outputText("你再次沿着高山狭窄的岩架与裂隙向上攀登，向着那座熟悉的雪峰进发。最终，你回到了半山腰那座低矮厚实的石塔前。");
         get_game().dungeonLoc = 17;
         get_game().inDungeon = true;
         doNext(playerMenu);
      }
      
      public function retryDungeonFromBadEndPrompt() : void
      {
         clearOutput();
         outputText("你想重试吗？");
         doYesNo(reallyRetry,declineRetry);
      }
      
      public function refuseGooArmorOfferPolitely() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2062) == 0)
         {
            outputText("你告诉她……不，谢谢，现在不用——你现在不需要护甲。");
            outputText("[pg]她愤愤不平地哼了一声，挣扎着站了起来。[say: 好吧，也许你以后可以带上我，[madam]？] 过了一会儿，她犹豫地补充道，[say: 但如果你以后改变主意了……好吧，我们走着瞧，看你没有我能不能活着离开这个地方！但如果你以后需要我，我会在冰川裂谷。] 还没等你阻止她，她就从前门溜了出去，去了……你猜是黏黏护甲女孩该去的地方。不过，令你惊讶的是，战斗结束后你感到精神焕发，你转了转肩膀，将注意力转回前方的地牢。");
         }
         else
         {
            outputText("你告诉她……不，谢谢，现在不用——你现在不需要护甲。");
            outputText("[pg]她愤愤不平地哼了一声，挣扎着站了起来。[say: 好吧，也许你以后可以带上我，[madam]？] 过了一会儿，她犹豫地补充道，[say: 但如果你以后改变主意了……你知道去哪找我，对吧？] 你对她点了点头，然后原路返回营地。");
         }
         get_player().HPChange(get_player().maxHP(),false);
         get_combat().cleanupAfterCombat();
         doNext(playerMenu);
      }
      
      public function refuseGooArmorOffer() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2062) == 0)
         {
            outputText("你叫她滚蛋——你不需要一件可能会在半夜试图杀死或强奸你的护甲。");
            outputText("[pg]她愤愤不平地哼了一声，挣扎着站了起来。[say: 好吧，不管怎样，去你的。我希望你被鹰身女妖强奸，[madam]。] 过了一会儿，她犹豫地补充道，[say: 但如果你以后改变主意了……好吧，我们走着瞧，看你没有我能不能活着离开这个地方！] 还没等你阻止她，她就从前门溜了出去，去了……你猜是黏黏护甲女孩该去的地方。不过，令你惊讶的是，战斗结束后你感到精神焕发，你转了转肩膀，将注意力转回前方的地牢。");
            get_player().HPChange(1000,false);
            get_combat().cleanupAfterCombat();
            doNext(playerMenu);
         }
         else
         {
            outputText("你叫她滚蛋——你不需要一件可能会在半夜试图杀死或强奸你的护甲。");
            outputText("[pg]她愤愤不平地哼了一声，挣扎着站了起来。[say: 好吧，不管怎样，去你的。我希望你被霜巨人强奸，[madam]。] 过了一会儿，她犹豫地补充道，[say: 但如果你以后改变主意了……好吧，我想我会在附近转悠的！] 还没等你阻止她，她就气呼呼地去了……你猜是黏黏护甲女孩该去的地方。你原路返回营地。");
            get_player().HPChange(get_player().maxHP(),false);
            get_combat().cleanupAfterCombat();
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function reallyRetry() : void
      {
         dynStats(DynStat.Lust(-100),DynStat.NoScale);
         get_player().set_fatigue(0);
         get_player().set_HP(get_player().maxHP());
         statScreenRefresh();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,485,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,492,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,493,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,487,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,495,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,494,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,497,0);
         goToHeliaDungeon();
      }
      
      public function phoenixWanking() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:int = _loc1_ + 1;
         clearOutput();
         outputText("你从人堆顶上抓起看起来最健康的不死鸟女，把这个双性人扔到离她姐妹们几英尺远的地上。她闷哼了一声，用冷酷、凶狠的眼神抬头看着你。[say: 我绝不屈服！我是一名骄傲的战士，不是什么——] 是是是，随便吧。你撕开她的锁子甲衬衫，露出下面那对巨大柔软的D罩杯双峰。不死鸟女对这突如其来的暴露倒吸了一口凉气，转过头去，下定决心在你寻欢作乐时不与你对视。你粗暴地揉捏她的一只乳房，用手指捏住乳头，直到她因为痛苦和快感而呜咽起来。你稍微停顿了一下，告诉这个女孩，她得用她特殊的器官让你爽，否则你会让她生不如死。");
         outputText("[pg]伴随着一声呻吟，她点了点头。你松开她敏感的乳房，亮出你的[cock " + _loc2_ + "]。不死鸟女不情愿地把她燃烧的尾巴绕过来，熄灭了火焰，开始像蛇一样缠绕在你的肉棒上。你催促着她，她用长长灵活的尾巴裹住你的肉棒，随着尾巴的握力收紧，像拧海绵一样套弄着。你的双手穿过女孩鲜红的头发，温柔地抚摸着她，而她开始用尾巴给你打飞机。");
         outputText("[pg]感觉简直像在天堂一样，当她温暖、布满鳞片的尾巴摩擦、抚摸和挤压你时，你高兴得浑身发抖……但这还不够，她还有那么多其他部位没用上呢！你把她缠绕的尾巴从你的[cock " + _loc2_ + "]顶端推开，告诉不死鸟女好好利用她柔软、长满羽毛的红色翅膀。她呆呆地看着你，但你快速地揉捏了一下她的乳房，催促她开始工作。她把赤褐色的翅膀收拢在肩膀周围，让边缘抚摸和爱抚你敏感的[cockHead " + _loc2_ + "]。当她柔软的羽毛拂过你[cock " + _loc2_ + "]的头部和柱身时，你几乎无法控制自己，你用鼓励的话语和更温柔、充满爱意地揉捏和挑逗她丰满的乳房来催促她继续。");
         outputText("[pg]你注意到现在不死鸟女已经开始明目张胆地用手指抠弄自己了。你继续用手指穿过她的头发，在她继续挤压和温柔爱抚你的[cock " + _loc2_ + "]时，对她耳语着鼓励和甜言蜜语。你感觉到高潮即将来临，迅速抓住不死鸟女的肩膀把她往前推，强迫她在你射精时把你的龟头含进嘴里。");
         outputText("[pg]你的[cock " + _loc2_ + "]爆发了，将浓稠的精液泵入震惊的不死鸟女嘴里。她被你的精液呛到了，随着你最后一滴精液滴入她的嘴里，她终于咽了下去。你咧嘴一笑，在把[cock " + _loc2_ + "]从她手里抽出来时，夸奖她做得很好。随着精液顺着她的脸颊流下，这个混血儿瘫倒在地上，快速地用手指抠弄着自己。");
         get_player().orgasm("Dick");
         doNext(playerMenu);
      }
      
      public function phoenixPlatoonMurdersPC() : void
      {
         clearOutput();
         outputText("你也倒下了，太");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("兴奋了");
         }
         else
         {
            outputText("伤得太重了");
         }
         outputText("无法继续战斗。重步兵排打破了阵型，举着盾牌围着你，防止你进行任何孤注一掷的攻击。其中一个用刀背戳了戳你。[say: [he]倒下了吗？]");
         outputText("[pg][say: 是的，]另一个说。[say: 这家伙完蛋了。我们把[him]带去给妈妈吧。]");
         doNext(harpyQueenBeatsUpPCBadEnd);
      }
      
      public function phoenixPlatoonLosesToPC() : void
      {
         clearOutput();
         outputText("伴随着最后一声闷哼，最后一只不死鸟倒在了你留下的战败战士堆上。曾经强大的士兵排已经变成了一堆伤痕累累、充满欲望的肉体、鳞片和羽毛。看到战斗已经胜利，你放下你的[weapon]，环顾四周。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,492,FlagDict_Impl_.arrayReadInt(_loc1_,492) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function phoenixMissionary() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(80);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         var _loc2_:int = _loc1_ + 1;
         outputText("你从不死鸟堆顶上抓起看起来最健康的一只，把这个双性人扔到离她姐妹们几英尺远的地上，让她仰面躺着。她闷哼一声，用冷酷、凶狠的眼神抬头看着你。[say:我绝不屈服！我是一个骄傲的战士，不是什么——] 随便吧。你撕开她的锁子甲，露出下面那对巨大柔软的D罩杯双峰。突然的暴露让这只不死鸟倒吸一口凉气，她转过头去，表情凝固得像雕刻的大理石，决心在你寻欢作乐时绝不看你的眼睛。");
         outputText("[pg]你抓住她的双腿强行分开，露出她湿滑的小穴和半硬的肉棒，对于一个似乎坚持不让自己享受的人来说，她出奇地兴奋。你把手滑进她湿透的阴部，让两根手指滑入其中。她呻吟着，咬紧牙关，任由你越插越深。你咧嘴一笑，抽出手指，强行塞进她的嘴里。她睁大眼睛，结结巴巴地摇着头，但你直到她好好品尝了很久才放手。");
         outputText("[pg]你责备她，告诉她如果她不想要，为什么会这么湿？");
         outputText("[pg][say:我——我没有！这是自然的！]");
         outputText("[pg]哦，真的吗？她确定她不想要你的肉棒吗？");
         outputText("[pg][say:我……好吧……也许……]她承认了，你点点头，她原本挣扎的双腿变得有些无力。");
         outputText("[pg]你把注意力转回她的双腿之间。把她完全勃起的爬虫类肉棒拨开，你露出了你的战利品——她湿透的小穴");
         if(get_player().cockTotal() > 1)
         {
            outputText("和紧致的后庭");
         }
         outputText("。你抓住她宽阔的侧腹，将你的[cock " + _loc2_ + "]");
         if(get_player().cockTotal() > 1)
         {
            outputText("和多余的肉棒对准她的洞");
         }
         else
         {
            outputText("对准她的洞");
         }
         outputText("，推入，穿透她的小穴");
         if(get_player().cockTotal() > 1)
         {
            outputText("和屁股");
         }
         outputText("滑入她温暖湿润的通道");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。");
         outputText("[pg]当你推入她的深处时，不死鸟扭动着身体，呻吟着，越来越多的肉棒刺穿她，直到你最终没入根部。不死鸟咬紧牙关，伸出手抓住你的肩膀，紧紧抱住你，任由你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("插入");
         }
         else
         {
            outputText("插入");
         }
         outputText("她体内；你前后摆动臀部，短促而有力地抽插着她炽热的内脏。随着节奏加快，你把不死鸟女孩拉进一个漫长而温柔的吻中。这个吻很快变成了她在你嘴里的呻吟，因为你操着她的小穴");
         if(get_player().cockTotal() > 1)
         {
            outputText("和屁股");
         }
         outputText("上，将你的臀部狠狠地撞向她的。");
         outputText("[pg]她先高潮了");
         if(get_player().cockTotal() > 1)
         {
            outputText("，你的双插对她来说实在难以承受");
         }
         outputText("。不死鸟女紧紧抓住你的肩膀，爪子甚至掐进了你的肉里，她紧致的小穴");
         if(get_player().cockTotal() > 1)
         {
            outputText("和更紧的括约肌痉挛着");
         }
         else
         {
            outputText("痉挛着");
         }
         outputText("紧紧夹住你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。她在你的怀里扭动着，夹得如此之紧，让你忍不住爆发了。你用力吻住她的嘴唇，射了出来，将浓稠滚烫的精液泵入她湿润的肉穴");
         if(get_player().cockTotal() > 1)
         {
            outputText("和火热的屁眼");
         }
         outputText("。当你射进她体内时，你感觉到她的爬虫肉棒也射了，喷出一股长长的白色浓精，溅在她和你的胸膛上，直到她的乳房被自己的精液浸透。");
         outputText("[pg]你松开怀里的不死鸟女，高兴地看到她已经因为过度的快感而晕了过去。你咧嘴一笑，把你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("从她被蹂躏的洞里拔出来");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("并收拾好你的装备。");
         get_player().orgasm("Dick");
         doNext(playerMenu);
      }
      
      public function phoenixAginal() : void
      {
         clearOutput();
         outputText("你从那堆不死鸟中抓起看起来最健康的一只，把这个双性人扔到离她姐妹几英尺远的地上。她闷哼了一声，用冷酷、凶狠的眼神抬头看着你。[say: 我绝不屈服！我是一个骄傲的战士，不是什么——] 是啊，随便吧。你撕开她的锁子甲，露出下面那对巨大柔软的D罩杯双峰。不死鸟因为突然的暴露而倒吸了一口凉气，转过头去，决心在你寻欢作乐时不与你对视。你无视了她暂时的反抗，一把抓住了她的肉棒。");
         outputText("[pg][say: 嘿——] 不死鸟抱怨着，扭动着身体想要挣脱你的控制。");
         outputText("[pg]你紧紧抓住她那根长长的紫色蜥蜴肉棒，告诉她你是在帮她的忙：你要让她操你的[vagina]。听到这个邀请，她停止了挣扎。");
         outputText("[pg][say: 哦。好吧，] 她微微撇了撇嘴说道。[say: 如果你想要一点不死鸟的种子……我想我并不介意有机会当个爸爸。]");
         outputText("[pg]");
         if(get_player().hasPerk(PerkLib.BroodMother))
         {
            outputText("你向她保证她很快就会如愿以偿的");
         }
         else
         {
            outputText("你对她咧嘴一笑");
         }
         outputText("并脱下你的[armor]。不死鸟比你想象的要强势一些，她粗暴地抓住你的[chest]，捏着你的乳头，接管了从你身上榨取她肉棒的工作。好吧。你决定顺其自然，把手滑到你的[vagina]，在你的爱人热身时抚摸你的小穴。");
         outputText("[pg]当她变得坚挺时，你轻轻推了不死鸟一下，让她仰面躺下，然后爬到她的腿上，将她的蜥蜴肉棒对准你的[vagina]。然而，还没等你调整好姿势，女孩就把你拉倒在她的肉棒上，猛地一挺，将你完全贯穿。你仰起头尖叫起来，当她那根白热的肉棒猛烈地撞击你最深处时，一种混合着快感和灼痛的感觉传遍了你的全身。");
         get_player().cuntChange(12,true,true,false);
         outputText("[pg]当你从她的突然袭击中稍微恢复过来时，不死鸟女孩已经开始用她的臀部迎合你，将她长长的肉棒在你体内研磨。你粗暴地捏了捏她丰满的双乳，把她推倒，按住她的乳房，开始骑乘她的肉棒。在获得了刺激之后，不死鸟女孩向你屈服了，只敢在你操她的时候抓住你的[hips]。而你则沉浸在她粗大的肉棒在你润滑良好的深处进进出出的感觉中，用它那球状的长度摩擦和抚摸着你敏感的内壁。");
         outputText("[pg]既然你已经进入了状态，你便拉了你的不死鸟情人一把，把她拉成坐姿，将她的脸埋进你的[chest]里。她挣扎了一会儿，但在体会到依偎在你温暖的肉体上有多么舒服之后，她便在你的怀抱中放松下来。你开始在她的肉棒上弹跳，在每次弹跳的顶点将她的脸压进你的乳房，并在你落下时将她的肉棒深深地撞入你的体内。");
         outputText("[pg]不死鸟女无法承受不断累积的快感，高潮了。当她滚烫的精液涌入你等待已久的子宫，用她那嘶嘶作响、强劲有力的种子烫伤你的深处时，你瞪大了眼睛。你只能继续骑着她，让她的精液流入你的体内，直到那股热量和快感也将你推向高潮的边缘。高潮来袭时，你紧紧抱住不死鸟女，浑身颤抖，大口喘息，狂喜几乎要将你淹没。你的[vagina]榨干了爱人的最后一滴精液，直到你气喘吁吁地松开死死抱住她的手，让她失去知觉地瘫倒在地。");
         outputText("[pg]你站起身，双腿有些罗圈，看着一桶多余的精液从你湿透的小穴里流出，积聚在不死鸟女的乳房和肚子上。你咯咯笑着，跌跌撞撞地从她身上爬起来，收拾好你的[armor]。");
         get_player().knockUp(5,120,100);
         get_player().createStatusEffect(StatusEffects.Eggs,Utils.rand(6),0,5 + Utils.rand(3),0);
         get_player().orgasm("Vaginal");
         doNext(playerMenu);
      }
      
      public function pcLosesToHarpyHorde() : void
      {
         outputText("[pg]无法承受");
         if(get_player().get_HP() < 1)
         {
            outputText("残酷的攻击");
         }
         else
         {
            outputText("原始的性感");
         }
         outputText("，你倒下了，完全任由鹰身女妖摆布。这群人居高临下地看着你，脸上都挂着淫荡、邪恶的笑容，但令你惊讶的是，其中一个大喊了一声严厉的命令，让这群长着羽毛的婊子退后。一个特别瘦小的鹰身女妖，留着一头亮橙色的乱发，挥手让这群人退下，对于这窝里最弱小的一个来说，她惊人地具有指挥力。其他的鹰身女妖对她发出嘶嘶声和咆哮声，但她仍然说道，[say: 等一下！我们还不能动这个入侵者。母亲大人想先和[him]谈谈。]");
         outputText("[pg]这群人抱怨着，但你还是被拽了起来，拖上了楼……");
         doNext(harpyQueenBeatsUpPCBadEnd);
      }
      
      public function pcDefeatsHarpyHorde() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,485,1);
         outputText("鹰身女妖们在房间中央倒成一堆，全都被彻底击败了……除了一个。在整个战斗中唯一没有攻击你的鹰身女妖，一个留着亮橙色乱发的相当瘦小的女孩，仍然站着，目瞪口呆地看着你造成的破坏。最终，她的目光移向了你。");
         outputText("[pg][say: 我的天，" + get_player().mf("老兄","女士") + "。你简直就是一支他妈的单人[race]军队，不是吗？你……你一定是[name]，对吧？赫尔……呃，赫莉娅小姐跟我提起过你。我，呃……我是奇里。抱歉其他女孩的事——我刚在她们的饮料里下了药，但她们还没来得及喝完。你比我预想的要早一点。抱歉，]她紧张地低声说着，揉了揉脖子后面。");
         outputText("[pg]你问她到底是谁，怎么认识赫尔的。");
         outputText("[pg][say: 呃，好吧，是我告诉她这个地方的。你可以说我是她的线人，我想，]她耸了耸肩，把手滑到她那宽得不似人类的臀部后面。你挑起一根眉毛，注意到这个女孩其实很漂亮——她的翅膀和头发像太阳一样亮橙色，她有着诱人曲线的大腿和臀部，更不用说可爱挺拔的乳房了。注意到你色眯眯的目光，她咯咯地笑了一声，咬了咬下唇。");
         outputText("[pg][say: 总之，赫莉娅小姐让我尽我所能地帮助你，所以……如果你需要什么，尽管开口。]");
         get_combat().cleanupAfterCombat();
      }
      
      public function notYet() : void
      {
         clearOutput();
         outputText("你告诉赫尔，你只是来看看她，而且你还有些事情要做。她叹了口气，轻声让你快点。");
         doNext(playerMenu);
      }
      
      public function noDungeon() : void
      {
         clearOutput();
         outputText("你考虑了一会儿，但最终决定不参与这次冒险。");
         outputText("[pg][say:什——什么？为什么不？]赫尔结结巴巴地说，突然怒视着你。");
         outputText("[pg]你试图解释你的理由，但赫尔似乎根本听不进去。");
         outputText("[pg][say:那去你的吧！]她大喊着，跳了起来，用力挥舞着长满鳞片的手臂，锋利的爪子差点抓破你的脸。[say:我不需要你，也不需要你那些狗屁借口！我自己去搞定——走着瞧！]");
         outputText("[pg]还没等你试着让她冷静下来，赫尔就已经跑出了营地，消失在她来时的夜色中。");
         outputText("[pg]好吧。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,483,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,393,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,395,0);
         get_game().helFollower.helAffection(-70);
         doNext(playerMenu);
      }
      
      public function morningAfterHeliaDungeonAgreements() : void
      {
         outputText("[pg]当你在破晓时分睁开眼睛时，你很高兴地看到赫莉娅正趴在你的胸膛上，");
         if(get_player().biggestTitSize() > 3)
         {
            outputText("她的脑袋枕在你柔软的乳房之间，还");
         }
         outputText("粗鲁地打着呼噜。你周围的空气闻起来像热酒" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001) > 0 ? "和性爱的味道" : "") + "，但你醒来时却感觉前所未有的精神焕发。你轻轻摇了摇赫尔，把她叫醒。");
         outputText("[pg][say: 呃，什么？] 她呻吟着，揉了揉脑袋。[say: 哦，嘿，我的爱人，] 过了一会儿她补充道，在你的嘴唇上留下了一个长长的吻。你们俩从纠缠中分开，偶尔互相挑逗一下，调皮地拍拍对方的屁股，在穿衣准备迎接新的一天时肆无忌惮地调情。");
         outputText("[pg]当你们穿戴整齐准备妥当后，赫尔问道：[say: 那么，有什么计划，[name]？]");
         outputText("[pg]你告诉这只火蜥蜴，你只需要处理好手头的事情，然后就出发去鹰身女妖的巢穴。她点点头，提醒你，你每多等一刻，那个可怜的男人就多受一刻的苦。你告诉她你会很快的，然后开始着手准备。");
         outputText("[pg][b:(赫莉娅已被添加到情人菜单中！（暂时的！）)]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,479,1);
         doNext(playerMenu);
      }
      
      public function letHarpyQueenGo() : void
      {
         clearOutput();
         outputText("你告诉赫尔停手。你要放这个婊子走。");
         outputText("[pg][say: 什么。]赫尔面无表情地说。");
         outputText("[pg]你用命令的口吻让赫莉娅把脚移开。");
         outputText("[pg][say: 这是什么意思？]育母问道，[say: 怜悯？为什么？]");
         outputText("[pg]你告诉她你不是什么爱恶魔的混蛋。为了证明这一点，你打算放她走。");
         outputText("[pg][say: 就……这样？]");
         outputText("[pg]就这样。");
         outputText("[pg]你向赫尔点点头，示意她下来。她不情愿地照做了，让鹰身女妖女王站起来，转动肩膀，展开她巨大的翅膀。");
         outputText("[pg][say: 嗯。你是个傻瓜，勇者，] 她说，[say: 但也许我看错你了。来吧，我的孩子们！我们要离开这个地方！]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 1)
         {
            outputText("[pg]鹰身女妖们拍打着翅膀，高兴地低吟着，渴望远离你。当鹰身女妖女王准备起飞时，她向你感激地点了点头，甚至可能还带着微笑。看起来你今天交到了一个朋友——哦，操！");
            outputText("[pg]你试图大喊，但太迟了。赫尔向前猛扑，抓住育母的脖子，转了一圈。随着女王倒下，颈骨断裂的声音在塔楼里回荡，伴随着一声沉闷的撞击声砸在地板上。");
            outputText("[pg][say: 狗屁，] 赫尔厉声说道，把死去的女王的脖子夹在腋下。周围的其他鹰身女妖在愤怒、痛苦和恐惧中尖叫。[say: 你知道这个婊子做了什么吗？对我父亲——对我？我绝对不可能就这么让她走掉。不，[name]。没门。]");
            awardAchievement("共犯",66,true,true);
            menu();
            addButton(0,"原谅",harpyQueenLetHerGoForgive).hint("原谅赫莉娅杀死了鹰身女妖女王。");
            addButton(1,"斥责",harpyQueenLetHerGoBerate).hint("搞什么鬼？你想放鹰身女妖女王走，但赫莉娅却杀了她！斥责赫莉娅的行为。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,494,1);
         }
         else
         {
            outputText("[pg]你站在一旁，看着鹰身女妖们拍打着翅膀，高兴地低吟着，渴望远离你。当鹰身女妖女王准备起飞时，她向你感激地点了点头，甚至可能还带着微笑。看起来你可能交到了一个朋友——或者至少，少了一个敌人。鹰身女妖女王一挥手，命令她的孩子们起飞！");
            outputText("[pg]她转向你，说道，[say: 无论好坏，[name]，我们还会再见的。]");
            outputText("[pg]说完，鹰身女妖们起飞了。");
            doNext(playerMenu);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,494,-1);
         }
         dynStats(DynStat.Cor(-5));
      }
      
      public function kiriSexIntro() : void
      {
         clearOutput();
         menu();
         outputText("你问奇里能不能帮你发泄一下。");
         outputText("[pg][say: 什——什么！？]她尖叫着退缩了。[say: 嘿，听着，我欠赫尔很大的人情，但我从来没同意做……做那个！你……没门！]");
         outputText("[pg]你提醒奇里，在玛瑞斯，如果你太饥渴的话，一次不经意的挑逗或抚摸可能就是胜利和被强暴的区别。而且，她答应过赫尔会帮你的……");
         outputText("[pg][say: 我……但是……这不公平！]她呻吟着。她低下头叹了口气。[say: 我想我也不希望你被强暴，然后被关起来当生育母狗，这事让我内疚一辈子。好吧！只要……你需要，就随便用我吧。但要温柔点，好吗？]");
         if(get_player().get_gender() == 0)
         {
            outputText("不幸的是，她能为你做的不多……");
         }
         if(get_player().hasCock())
         {
            addButton(0,"肛交",kiriSexAnal).hint("把你的鸡巴插进奇里的屁股！");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"被舔",kiriSexGetLicked).hint("让奇里舔你的小穴。");
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function kiriSexGetLicked() : void
      {
         clearOutput();
         outputText("你让奇里给你舔阴。她撇了撇嘴，但还是跪了下来，解开你[armor]的下半部分，露出你充满欲望的[vagina]");
         if(get_player().hasCock())
         {
            outputText("和[cocks]");
         }
         outputText("。在你的鼓励下，她向前倾身，将脸贴在你的腹股沟上，松开舌头探索你的下唇。");
         outputText("[pg]这女孩的舌头出奇地灵巧。她迅速地在你的阴蒂上挑逗，让你发出意想不到的愉悦呻吟。她开始挑逗和把玩你的快乐按钮，用舌面挠着周围敏感的血肉；你轻轻拍打她的头和肩膀催促她，甚至伸手去托起她宽松衬裙下挺拔的乳房，或者抚摸她巨大的橙色翅膀。");
         outputText("[pg]她终于将舌头滑入，开始爱抚你[vagina]的内壁，用她柔软温暖的舌头以令人愉悦的速度和温柔舔舐你最深处。你微笑着，双手穿过她橙色的短发，抚摸着她，而她则抓住你的臀部，将脸埋在你的小穴里。");
         outputText("[pg]当她舔你的时候，你开始将你的阴唇在她的脸上摩擦，随着她灵巧舌头的节奏，将你的小穴在她的鼻子和额头上摩擦。她缓慢而稳定地向内推进，将长长的舌头越来越深地滑入你的小穴，直到你能感觉到她在你的子宫颈周围弹动。");
         outputText("[pg]你无法抵抗她灵巧的舌交太久。你抓住奇里的头，把她的脸按在你的胯下，尽可能地把她的舌头全部塞进你体内，当你高潮时，把你的淫液喷了她一脸。");
         outputText("[pg]你心满意足地从奇里身边退开，让她甩着头甩掉你的淫液。你清理干净自己，重新穿好衣服。");
         get_player().orgasm("Generic");
         cheatTime(0.3333333333333333,true);
         doNext(playerMenu);
      }
      
      public function kiriSexAnal() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(60);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         var _loc2_:int = _loc1_ + 1;
         outputText("你把你的[cock " + _loc2_ + "]从[armor]里掏出来，让奇里四肢着地。她做了个鬼脸，但还是照做了。你撩起她的裙子，露出她那可以产卵的大阴户和紧致的小菊花。");
         outputText("[pg][say: 只要确保你拔出来就行了，好吗？我不想怀孕——咿！]当你的[cock " + _loc2_ + "]顶住她的后门时，她尖叫起来。她的翅膀在你周围狂乱地拍打，几乎把你们俩都带离了地面。你在她屁股上拍了一下，帮她稳住身子，同时抓住她那异于常人的宽大臀部。她扭动了一会儿，终于平静下来，并尽力放松。");
         outputText("[pg]虽然费了点劲，但你最终还是成功地将肉棒推过了她紧致的括约肌。伴随着一声如释重负的叹息，你开始向她的屁股里推进，缓慢而稳定地将你的[cock " + _loc2_ + "]一寸寸送入，直到");
         if(get_player().cockArea(_loc1_) > 60)
         {
            outputText("你再也塞不进去了");
         }
         else
         {
            outputText("你已经没入至根部");
         }
         outputText("。在你身下，奇里痛苦又愉悦地扭动着，呻吟着，任由你用肉棒填满她的屁股。当你终于完全埋入她体内时，你轻轻捏了捏她丰满的臀瓣，开始摆动臀部。当你从她体内抽出时，奇里喘息着，突然感到一阵空虚——而当你再次猛烈撞入时，她尖叫出声。");
         outputText("[pg]你将双手陷入她柔软丰满的臀部，开始猛烈地操弄她的后穴，又快又狠地干着她，直到你们俩都像荡妇一样呻吟起来。你们混合的先列腺液和爱液弄脏了地板和她的内壁。令你惊讶的是，奇里从地上抬起身子，将背部贴在你的胸前，让她的翅膀包裹住你。你咧嘴笑着，一边继续肏她的屁股，一边揉捏她挺拔的双乳。她把手放在你的手上，捏着自己的乳头，引导你抚摸她所有最敏感的部位。");
         outputText("[pg]你很快就射了，在她耳边低吼着，猛烈地撞击着，直到你");
         if(get_player().cockArea(_loc1_) > 60)
         {
            outputText("尽可能深地埋入");
         }
         else
         {
            outputText("完全填满了她");
         }
         outputText("。你的肉棒在她体内喷射出浓稠的精液，将乳白色的精液射入她的肠道深处");
         if(get_player().cumQ() > 500)
         {
            outputText("直到你的精液顺着肉棒挤出，流到地板上");
         }
         outputText("。伴随着一声欢愉的尖叫，奇里夹紧了你的[cock " + _loc2_ + "]，也达到了高潮，在地上漏出了一滩淫液。她开始在你的肉棒上弹跳，享受着后庭高潮，直到她精疲力竭，而你在她体内软了下来。");
         outputText("[pg]你伴随着“啵”的一声拔出肉棒，让一股精液从她的屁股里流出。你清理干净肉棒，把它塞回[armor]里。");
         get_player().orgasm("Dick");
         cheatTime(0.3333333333333333,true);
         doNext(playerMenu);
      }
      
      public function kiriInteraction() : void
      {
         menu();
         addButton(0,"交谈",talkToKiri).hint("和奇里聊聊。");
         addButton(1,"性爱",kiriSexIntro).hint("让奇里满足你的欲望。毕竟，你的欲望可能会决定你的成败。");
         addButton(14,"返回",playerMenu);
      }
      
      public function killHarpyQueen() : void
      {
         clearOutput();
         outputText("你看了看赫尔，又看了看鹰身女妖女王。这个婊子本来可以繁育出一整支军队——而且可能还会再试一次。你不能允许这种事发生。");
         outputText("[pg]你伸出手，迅速地扭断了她的脖子。它很容易就被扭断了，不比拔出酒瓶塞难多少。骨头断裂的声音被鹰身女妖惊恐的尖叫声淹没了。");
         outputText("[pg]赫尔眨了眨眼，赞许地点了点头。她转向惊骇的鸟群，用剑把她们赶走。那些长翅膀的婊子大喊大叫，咒骂着，但不敢反抗你们俩。");
         outputText("[pg][say:好吧。我想事情就是这样了，]赫尔说着，把剑甩过肩膀，插回剑鞘。");
         outputText("[pg]你点头表示同意。");
         outputText("[pg][saystart]好吧。你拿到钥匙了，去把");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 1)
         {
            outputText("老爸");
         }
         else
         {
            outputText("那个可怜的火蜥蜴");
         }
         outputText("从地牢里救出来吧。我会确保不死鸟和鹰身女妖在你们出去的时候不找麻烦。[sayend]");
         outputText("[pg]说完，赫尔小跑着出了门，下了楼梯，把你一个人留在房间里。你注意到女王的法杖掉在了她的尸体旁边。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,494,1);
         doNext(playerMenu);
      }
      
      public function heliaQueenTalk() : void
      {
         clearOutput();
         outputText("你朝着那个大屁股的育母点点头。[say: 啊，女王婊子本尊，]赫尔懊恼地说着，把指关节按得咔咔作响。[say: 我们要好好跟你玩玩，小鸟儿……对吧，[name]？]");
         outputText("[pg]你问赫尔，她觉得你到底该拿那个“蜂后婊子”怎么办。");
         outputText("[pg][say: 嗯，我们可以先从把我的尾巴塞进她的小穴深处开始，让她再也生不了孩子。这他妈是个不错的开始。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 1)
         {
            outputText("[say:也许事后扭断她的脖子。]");
         }
         doNext(playerMenu);
      }
      
      public function heliaKiriTalk() : void
      {
         clearOutput();
         outputText("你向赫尔询问那个帮助你们找到这个地方，并在下面提供信息的混血女孩。");
         outputText("[pg][say: 哦！你见过奇里了？太好了，[name]。]赫尔轻笑了一声，补充道，[say: 她很可爱，不是吗？屁股也不错。]");
         outputText("[pg]你用手掌拍了一下自己的脸，要求她提供一些关于她更具体的信息。");
         outputText("[pg][say: 哦，对。几年前我见过她，那时她还是个小屁孩。我猜这只鸟妈妈当时还没完全掌握不死鸟配方。不管怎样，有个牛头人抓住了她，打算把她拖回家，让她怀上一肚子小牛头人什么的。可能因为她太红了吧，你懂的？牛头人不知怎么的就讨厌那种颜色。]");
         outputText("[pg][say: 所以，我敲了那头牛的脑袋，救了她。与其说是为了帮她，不如说是为了控制牛头人的数量，不过嘛，她确实很感激。从那以后我们就成了朋友。]");
         outputText("[pg]你带着心领神会的眼神，问她们是不是不仅仅是朋友。");
         outputText("[pg][say: " + get_player().mf("老兄","宝贝") + "，拜托，你了解我的。给我点面子好吗？我可不会让那么翘的屁股白白浪费。]");
         outputText("[pg]你翻了个白眼，和她一起笑了起来。");
         doNext(playerMenu);
      }
      
      public function heliaHakonTalk() : void
      {
         clearOutput();
         outputText("你决定告诉赫尔，楼下被锁着的到底是谁。当你这么做时，她只是睁大眼睛盯着你。");
         outputText("[pg][say: 什……什么。不，那不是……不可能……]");
         outputText("[pg]你向她保证这是真的。她来这里要救的火蜥蜴不是别人，正是她的父亲，哈康。");
         outputText("[pg][say: 我不敢相信，]赫尔揉着眼角说道。[say: 这么多年来我一直以为……我确信他已经死了。怎么……不。这不重要，]她说着，转向身下的育母。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
         {
            outputText("[say:你这婊子，我会让你为对我父亲做的事付出代价的。我保证。]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,495,1);
         doNext(playerMenu);
      }
      
      public function heliaDiscovery() : void
      {
         outputText("在就寝之前，你最后检查了一遍营地的周边，确保所有的陷阱和防御设施都完好无损，并做好了应对夜间突袭的准备。当你走到临时营地的最外围时，你注意到一个披着斗篷的陌生人从夜色中走来。你正准备拔出[weapon]，但你认出了赫尔那火蜥蜴般曼妙的身姿，她正朝你走来，宽松的旅行斗篷下，臀部微微摇曳。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0)
         {
            outputText("[pg][say:[name]！]火蜥蜴大喊着，一边走近一边用力挥手。[say:妈的，你知道找你有多难吗？我到处都在找你！]你");
            if(get_player().cor < 50)
            {
               outputText("赶紧冲过去拦住赫尔，免得她的一条腿被你的陷阱夹断");
            }
            else
            {
               outputText("慵懒地指着你的陷阱，提醒这个不速之客");
            }
            outputText("，并引导她进入营地。");
         }
         else
         {
            outputText("[pg][say:嘿，[name]！]火蜥蜴喊道，轻巧地穿过你布下的陷阱迷宫。她给了你一个快速的拥抱，然后牵起你的手，带你回到营地。");
         }
         outputText("[pg]你让火蜥蜴在营火旁坐下，问她是什么风把她从平原吹到了你这简陋的住处。她轻轻耸了耸肩，说道：[say:也许我今晚只是想找个人作伴。]");
         if(!get_player().isTaur())
         {
            outputText("她的手滑过来，放在你的大腿上。");
         }
         else
         {
            outputText("[say: 她缓慢而深情地抚摸着你的侧腹。]");
         }
         outputText("你问她那是不是真的。她眨了眨眼，回答道：[say: 嗯，也不完全是假的……]");
         outputText("[pg][say:其实，勇者，我想……嗯，那个……请你帮个忙，我想。]赫尔尴尬地说，突然避开了你的视线。[say:如果不重要，或者我自己能搞定，或者……啊，妈的。]赫尔从斗篷里拿出一个脏兮兮、凹凸不平的酒壶，猛灌了一大口闻起来像纯谷物酒精的东西。趁她喝酒的时候，你催促她说出心里的想法。");
         outputText("[pg]她打了个响亮的饱嗝，甩了甩头，叹了口气。[say:是这样的，勇者：有小道消息说，在高山上有一个巨大的鹰身女妖巢穴，几十个婊子挤在一起。这已经够糟了，对吧？但现在，她们中的一些人手臂和腿上长满了红色的鳞片……尾巴上还冒着火。]");
         outputText("[pg]你问她为什么对这事这么感兴趣；毕竟她住的地方离山里有一段距离。");
         outputText("[pg][say:通常我才不管一群长毛婊子在干什么。但鳞片和火？听起来像你认识的人吗？]还没等你回答，你就感觉到赫尔温暖的尾巴卷住了你的肩膀，把你紧紧抱在怀里。她又从酒壶里猛灌了一大口。闻起来就像有人在你旁边点燃了一家酿酒厂。[say:我的意思是，可能有一只可怜的、受虐的火蜥蜴被绑在她们的巢穴里，多年来一直被当作繁育母畜，繁衍了整整新一代的鹰身女妖。即使你不在乎那些鸟人，如果你能帮我把他救出来，对我来说……意义重大。听着，[name]，打起架来我是个狠角色——你知道的——但即使是我，也没法单挑整个鹰身女妖巢穴。而且，嗯，你是我唯一百分之百信任的人。能把后背交给你，你懂吗？]");
         outputText("[pg]在接下来的几分钟里，你把她剩下的信息都套了出来——她说，她们住在一个废弃的旧瞭望塔里，大概有两打人。在她说话的时候，你注意到赫尔的声音里带着一丝绝望，她不止一次地重复说她一个人做不到，或者除了你，她不信任任何人。");
         outputText("[pg]你同意帮助赫莉娅吗？她可能会<b>非常</b>感激……");
         doYesNo(agreeToHelpHeliaDungeon,noDungeon);
      }
      
      public function helDungeonPrisonerTalk() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,488) == 0)
         {
            outputText("你走近被绑在桌子上的火蜥蜴。他用仅剩的一只完好的眼睛看着你，在你靠近时警惕地打量着你。");
            outputText("[pg][say: 哎呀，你可真是让人眼前一亮，]他笑着说，声音沙哑得几乎听不清。[say: 终于有人把那个小婊砸揍了一顿。哈！嘿，我叫哈康。我很想和你握手，但是，呃，我现在有点被绑住了。那么，是什么风把一个外人吹到这上面来了？]");
            outputText("[pg]你告诉他，你碰巧是来救他的。");
            outputText("[pg][say: 什么！？]他瞪大了眼睛说道。[say: 嘿，我不是在抱怨，请注意，但请原谅我的惊讶。我被关在这个鬼地方已经……玛莱啊，肯定有十五、二十年了。为什么是现在？谁派你来的？我老婆？]");
            outputText("[pg]你摇了摇头，告诉他是赫莉娅派你来的。");
            outputText("[pg][say: 赫……赫莉娅？我的小赫尔？]他难以置信地问道。你微微一笑，告诉他“小”赫尔已经不小了。他笑了，但有一瞬间你觉得他可能要哭了。[say: 当……当然了。我的小女孩长大了。哦，我愿意付出一切去见她……]");
            outputText("[pg]你告诉他，她离这里一点也不远……事实上，就在楼上几层。");
            outputText("[pg][say: 什么！？]他大喊着，拼命挣脱绑着他的锁链。[say: 你把赫尔带到这里来了！？你在想什么？快去把她带出去。现在！]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,488,1);
         }
         else
         {
            if(get_player().hasKeyItem("Harpy Key A") && get_player().hasKeyItem("Harpy Key B"))
            {
               outputText("你微笑着走向火蜥蜴哈康。他又开始对你大喊大叫，但你厉声让他安静。你解释说赫尔和奇里在外面等着，育母已经被打败了。你手里叮当作响地拿着两串钥匙。他默默地看着你走近，眼神警惕但充满希望。你迅速解开他的束缚，让他多年来第一次重获自由。他挣扎着想坐起来，但差点摔倒。你在他受伤之前接住了他，把他的手臂搭在你的肩膀上，扶着这只老火蜥蜴走向楼梯……");
               doNext(towerOutro);
               return;
            }
            outputText("你走向火蜥蜴哈康。他拼命挣脱束缚，冲你大喊，让你带上赫尔赶紧离开，趁现在还来得及。你翻了个白眼，继续走你的路。");
         }
         doNext(playerMenu);
      }
      
      public function harpyQueenSexAnal() : void
      {
         clearOutput();
         outputText("赫尔抓住女王婊子的肩膀，粗暴地把她扔到地板上。当赫尔把女王按成四肢着地的姿势让你享用时，聚集的鹰身女妖群发出惊呼。你脱下衣服，把你的[armor]扔到一边，抚摸着你的[cock]直到完全硬挺。你跪在鹰身女妖女王巨大的侧腹后面，她太宽了，你觉得你甚至能把你的躯干塞进她的臀瓣之间。你费了很大的劲，才把她颤动的屁股掰开，露出她紧致的雏菊和松弛、大张的小穴。");
         outputText("[pg]当你在育母身后摆好姿势时，赫尔脱下她暴露的比基尼锁子甲，抓住那个婊子的头发，把她湿滑的小穴推到鹰身女妖的脸上。女王在赫尔的抓握下挣扎，使她那非人的臀部和屁股诱人地摇晃和颤动。你面前的景象让你的肉棒变得坚硬如石，你粗暴地把它推入鹰身女妖的臀瓣中。你松开她的屁股，当女王柔软的肉体包裹住你的[cock]时，你打了个寒颤，它像处女的小穴一样紧致，但同时又如此柔软和顺从……");
         outputText("[pg]你用双臂环抱住她那育母般的臀部，开始在她的股沟里抽插，给这个鹰身女妖婊子做热狗。你的阴茎在她柔软的肉体中进进出出，似乎像流沙一样吞噬着你的长度；你感到自己被不可阻挡地向内拉扯，你的肉棒摩擦着她湿滑的小穴和紧紧夹住的屁股。");
         outputText("[pg]你对赫尔眨了眨眼，虽然她正忙着强迫鹰身女妖舔她，但她还是勉强回了一个眼神。接着，你把你的[cock]的头部压在鹰身女妖的括约肌上。虽然你的大部分长度都被她巨大的臀瓣吞没了，但在你坚持不懈的戳刺下，她的肛门仍然可怕地紧缩着。你皱起眉头，把手向后一缩，用力地在鹰身女妖婊子的屁股上拍了一巴掌。");
         outputText("[pg]虽然她那枕头般的臀瓣吸收了大部分的冲击力，但她还是在赫尔的小穴里发出了一声可怜的尖叫，并在瞬间放松了下来。你把你的肉棒插了进去，因为她肛门通道那令人难以置信的紧致而闷哼了一声。在你占有她之前，她这里一定还是个处女；当你强行把肉棒塞进她极其紧致的屁眼时，她尖叫着扭动着，你为了能塞进她的每一寸而奋力拼搏。");
         outputText("[pg]你又拍了一下鹰身女妖让她闭嘴，但这只会让她像老虎钳一样的屁股紧紧夹住你的肉棒，痛苦地挤压着龟头。你痛得低吼了一声，为了报复，你猛地撞向她的");
         if(get_player().cockArea(0) < 100)
         {
            outputText("直到你的臀部陷入她枕头般的屁股里");
         }
         else
         {
            outputText("直到你巨大的[cock]无法再深入她体内");
         }
         outputText("。尽可能深地插进去后，你把肉棒留在原处，转而给了育母狠狠一巴掌。她尖叫着夹紧，用力地绞着你的[cock]。但这次更舒服了，因为她已经被你的肛门入侵者撑开了。");
         outputText("[pg]你又拍了她一下，又一下，打着这个鹰身女妖婊子的屁股，直到她完全在体内榨取你的" + get_player().cockDescript(0) + "。赫尔笑着开始告诉女王她是个多么好的荡妇，一边用舌头操着另一个女人，一边把你的[cock]塞进屁股里，像个妓女一样挤压着它。女王试图抗议，但你又给了她狠狠一巴掌，教她一些规矩。");
         outputText("[pg]她紧紧夹住你的肉棒，让你感觉它快要爆炸了。然而，你并没有爆炸，而是感到下腹部突然涌起一阵冲动。你只来得及将双手掐进女王的臀肉里，在射精时发出一声充满快感的狂吼，将一大股滚烫的精液射进她的屁股里。当你在她体内释放时，女王尖叫起来，而她嘴巴的突然动作也让赫尔达到了高潮。这只火蜥蜴抓住女王的头，将其按在自己的臀部上，把鹰身女妖的鼻子埋进自己的穴里，同时在这婊子的脸上高潮。");
         outputText("[pg]精疲力竭后，你从育母那现在大张着的屁眼拔了出来。然而，她巨大的臀瓣将你的精液封在了她体内，防止它流出来。你笑着最后捏了一把她柔软的屁股，然后赫尔把她翻过来再次按住。");
         get_player().orgasm("Dick");
         cheatTime(0.3333333333333333,true);
         doNext(playerMenu);
      }
      
      public function harpyQueenLetHerGoForgive() : void
      {
         clearOutput();
         outputText("你和赫尔互相盯着对方，死去的鹰身女妖的尸体是你们之间唯一的阻隔。两打愤怒的鹰身女妖在你们周围尖叫着，要求为她们死去的的女王讨回公道。");
         outputText("[pg]考虑到她现在一定经历着各种情绪，你勉强原谅了她的行为。");
         outputText("[pg]她的眼睛亮了起来。看来这不是她预料中的反应。[say: 那么……我们没事了？]");
         outputText("[pg]你点点头。");
         outputText("[pg]她从尸体上站起来，紧紧地抱住你。[say: ……谢谢你。]");
         outputText("[pg]你拍了拍赫莉娅的头，大喊一声，叫鹰身女妖们滚蛋。她们不情愿地照做了，太害怕而不敢和你战斗，但仍然对这起谋杀感到愤怒。她们起飞了，从天花板上的洞里冲出去，在身后哭喊着诅咒和墓志铭。");
         outputText("[pg][saystart]好吧。你拿到钥匙了，去把");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 1)
         {
            outputText("老爸");
         }
         else
         {
            outputText("那个可怜的火蜥蜴");
         }
         outputText("从地牢里救出来吧。我会确保不死鸟和鹰身女妖在你们出去的时候不找麻烦。[sayend]");
         outputText("[pg]说完，赫尔小跑着出了门，下了楼梯，把你一个人留在房间里。你注意到女王的法杖掉在了她的尸体旁边。");
         doNext(playerMenu);
      }
      
      public function harpyQueenLetHerGoBerate() : void
      {
         clearOutput();
         outputText("你和赫尔互相盯着对方，死去的鹰身女妖的尸体是你们之间唯一的阻隔。两打愤怒的鹰身女妖在你们周围尖叫着，要求为她们死去的的女王讨回公道。");
         outputText("[pg]你愤怒地跺脚，<i>要求</i>她给个解释。你提醒她，她的任务纯粹是拯救火蜥蜴，而不必要的杀戮，尤其是在承诺给她们自由之后，只会让她变得和恶魔一样糟糕。");
         outputText("[pg][say:你当然不会明白，]赫尔厉声说道，站起身来扔下死去的女王。[say:你的父母可能在你来的那个鬼地方安全舒适地待着。我呢？我一辈子都以为我爸爸死了；我不得不眼睁睁地看着一群豺狼人把我妈妈拖走，被强奸致死。去你的，[name]。你懂什么？]");
         outputText("[pg]你还没来得及再说一句话，火蜥蜴就跑出门，跑下楼去了。啊，该死。");
         outputText("[pg]你注意到女王的法杖掉在了她的尸体旁边。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,496,1);
         doNext(playerMenu);
      }
      
      public function harpyQueenInterrogate() : void
      {
         clearOutput();
         outputText("俯身看着被击败的鹰身女妖女王，你决定要得到一些答案。首先，你问她到底为什么要绑架一只火蜥蜴。毕竟，这就是你来这里的原因。");
         outputText("[pg]在赫尔的脚下咕哝着，女王向你吐口水，险些吐到你的脸上。[say: 这他妈算什么问题？我偷他是为了偷他的种子，愚蠢的[boy]。]");
         outputText("[pg]好吧，你觉得这是你自找的。下一个问题。她一开始是怎么弄出不死鸟的？鹰身女妖通常生不出混血儿。");
         outputText("[pg][say: 哈！地精炼金术。我那些纯血的女儿们给我带回了她们能找到的一切。我花了好几年时间做实验，试图弄对配方。加点这个药水，再加点那个毒药……但我成功了。我创造了终极战士种族。你也许能杀了我，但你无法抹去我的造物！]");
         outputText("[pg]你翻了个白眼。走着瞧吧。你问她为什么要费这么大劲去创造一个“终极战士”种族。鹰身女妖什么时候想统治世界了？");
         outputText("[pg][say: 统治世界？蠢货！那根本不是我的意图——差得远呢。]");
         outputText("[pg]哦，真的吗？");
         outputText("[pg][say: 这是实话。我看到了恶魔对我们的世界做了什么……它们对美丽的女儿们造成了怎样的破坏……我不能坐视不管。所以，必须有一个男人来承受痛苦！为了击退恶魔，这只是一点微不足道的牺牲。有了火蜥蜴的种子，加上我的魔法和强大的子宫……一支军队并非遥不可及。不死鸟本该是恶魔的末日。然而你却想毁灭我们，仅仅为了一个人。]");
         outputText("[pg]等等，什么。");
         outputText("[pg][say: 你听到了，蠢货！我本打算培育一支军队来击退恶魔。而且我差一点就成功了！我的女儿们，你在下面和她们交过手；她们难道不美丽吗？而且……非常致命。]");
         outputText("[pg][say: 你这个婊子！] 赫尔厉声说道，用脚在鹰身女妖的胸口碾压。[say: 你们这些人到底有什么毛病？你们有没有想过，哪怕是一秒钟，真的去想过，也许可以问问我们中的任何一个人？只要飞下来，问任何一个发情的火蜥蜴男孩，“想不想用你的种子填满我，直到我的卵孵化出一支军队？”猜猜怎么着——他会答应的！玛瑞斯任何一个内心纯洁的男人都会说“愿意”！]");
         outputText("[pg]鹰身女妖女王将目光转向赫尔。[say: 这个没有。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,495) == 1)
         {
            outputText("[pg][say: 那是因为他结婚了，你这个婊子！] 赫尔尖叫道，她的尾巴几乎在她身后燃烧起来。女王退缩了，但陷入了沉默。");
         }
         else
         {
            outputText("[pg]赫尔怒视着，但什么也没说。看来你无法从女王那里得到更多信息了。");
         }
         doNext(playerMenu);
      }
      
      public function harpyQueenDefeatedByPC() : void
      {
         clearOutput();
         outputText("伴随着最后一声响亮的喘息，鹰身女妖女王瘫倒在王座上，再也无力反抗。看到她们的育母被击败，原本在房间里蜂拥而至的其他鹰身女妖突然停止了攻击并撤退，退到了王座室的边缘。在你身后，赫尔跌跌撞撞地从混战中走出来，身上布满了小伤口和瘀伤，但似乎没有大碍。");
         outputText("[pg][say: 你……你会毁了一切的，]鹰身女妖女王呻吟着，徒劳地想要站起来。还没等她恢复过来，赫尔就走过去，把她长着爪子的脚踩在这个婊子的胸口上，把她按在地上。你从王座侧面的一个小钩子上，取下了她用来关押下面囚犯的钥匙圈。");
         get_player().createKeyItem("Harpy Key B",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,493,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function harpyQueenBeatsUpPCBadEnd() : void
      {
         clearOutput();
         outputText("你瘫倒在坐在王座上的鹰身女妖女王面前。她看起来并不特别高大或凶恶，但她的臀部确实非同寻常，至少有她身体的三倍宽，她那坐在垫子上的柔软屁股，在赤裸的状态下看起来就像峡谷一样，是那种能让你永远迷失在其中的屁股。这位鹰身女妖主母手里拿着一根高大的白木法杖，夹在臂弯里。");
         outputText("[pg][say: 哎呀，哎呀，看看我们发现了什么？]鹰身女妖低声说道，一边盯着你一边舔着嘴唇。战败的你完全无能为力。她的两个子嗣从阴影中走出来，用厚厚的皮带绑住了你的手臂和[legs]。");
         outputText("[pg][say: 那么，一个闯入者游荡进了我的巢穴。告诉我，蠢货，你是为恶魔工作的吗？你肯定是。没有其他人敢来这里……]");
         outputText("[pg][say: 母亲大人！]一只鹰身女妖喊道，走上王座。她身后跟着另外十二个姐妹，正努力将赫尔绑在她们中间。蝾螈尖叫、咒骂、哭泣，但这毫无用处——她无法逃脱，就像你一样。赫尔被推倒在你身边跪下，依然充满反抗，但当看到你已经被俘虏时……她眼中的斗志完全消失了。");
         outputText("[pg][say: 啊，又一只蝾螈？哎呀哎呀，真是太巧了。我不相信我们的另一个标本还能撑多久。你看起来是个健康的女孩；经过一点……改造……你会成为一个很好的替代品。]");
         outputText("[pg][say: 至于你，]女王看着你说道。[saystart]我的后宫里总是需要另一个");
         if(get_player().hasCock())
         {
            outputText("精子库");
         }
         else
         {
            outputText("孵化器");
         }
         outputText("。是的，你会做得很好的……[sayend]");
         outputText("[pg]<b>六个月后……</b>[pg]");
         outputText("你呻吟着，手腕在头顶悬挂的手铐中摩擦着。骑在你巨大、充血的阴茎上的鹰身女妖荡妇翻着白眼，尖叫着高潮了。又一波精液从你那大得惊人的睾丸中涌出，它们如此巨大，以至于拖在你[legs]之间的地板上。你微微颤抖，但射精的行为已经失去了所有意义");
         if(!get_player().hasCock())
         {
            outputText("，即使当鹰身女妖用她们的魔法在你身上长出这些巨大的男性器官时，那种突如其来的新感觉几乎让你的精神崩溃");
         }
         outputText("。的确，那个荡妇一吃饱，她的一个姐妹就粗暴地把她从你的肉棒上推开，然后骑上你，弯下腰，退到你巨大的肉棒上。当你今天服务的第二十九个荡妇开始榨取你那被魔法强化的精液时，一阵微小的快感传遍你的全身。将附魔药物直接泵入你睾丸血肉的管子开始加班加点地工作，让你的身体充满欲望和创造不死鸟的奇怪混合物。");
         outputText("[pg]当又一次高潮席卷你时，你瘫软下来，鹰身女妖的子宫肿胀得看起来像怀孕九个月一样。你几乎感觉不到，尽管当那个女人为了感谢你在你的嘴唇上印下一个充满欲望的吻时，你的皮肤滚烫发红……女王需要的是另一个蝾螈男性；你不是，但有了赫尔和那个被证明是她父亲的俘虏在身边，她也发现了你的用处：培育鹰身女妖来延续她的血脉，而不死鸟们则去对抗恶魔。");
         outputText("[pg]你凝视着这个地下繁殖室，越过覆盖着数加仑废弃精液的桌子和玩具，看向蝾螈赫莉娅和哈康被锁链锁住的地方。哈康早就昏过去了，他的年龄和多年的虐待使他虚弱到每天只能运作一小部分时间。然而，在他旁边，赫尔醒着并踢打着，在鹰身女妖女王巨大的臀部下徒劳地挣扎，女王的臀部代替了锁链将她钉在墙上。");
         outputText("[pg]赫尔大叫一声，全身的高潮震撼着她高大的身躯，最后她双腿间那根像你一样被魔法赋予的肉棒，齐根埋在鹰身女妖主母体内。女王咕哝着，揉着她那张开的小穴，瀑布般的蝾螈精液从她体内渗出，与赫尔过去十几次高潮留下的痕迹一起汇聚在地板上。尽管你曾经的爱人的高潮已经消退，鹰身女妖女王仍然牢牢地插在赫尔巨大的肉棒上，大圈地磨蹭着她的臀部，她的繁殖通道吸吮着每一滴蝾螈精子。最后，她以一个漫长而慵懒的动作把自己拔了出来，慢慢地把里面那个撑开小穴的工具弄出来，直到它软绵绵地垂向地面，仍然漏出一小滴精液。六只低等鹰身女妖急切地跳向赫尔用过的阴茎，舔舐着女王用剩下的东西，希望能生下属于她们自己的不死鸟。");
         outputText("[pg]鹰身女妖女王从赫尔身边走开时，张开宽大的翅膀，赫尔现在已经被女王的一个女儿骑上了，她漫步走向你，蝾螈的种子仍然从她张开的产卵孔中自由地漏出。她捧着你的脸颊，修长的手指滑过你敏感、完全被药物麻醉的皮肤。当她对你微笑时，你全身都在发麻，几乎没有意识到有六个荡妇在吸吮你用过的精液，而她的一个女儿正强行骑上你那被强化的器官。");
         outputText("[pg][say: 自从你来到我身边，你一直是个很好的种马，[name]，]女王轻快地笑着，拍了拍你肿胀的睾丸。[say: 自从你和赫尔“自愿”帮助我们以来，我的后代数量翻了两番。嗯，一个自由的玛瑞斯肯定会感谢你为将它从恶魔手中解放出来而建立的军队。如果你愿意，你甚至可能成为某种英雄。如果你愿意的话，自由玛瑞斯的勇者。那不会太糟，不是吗？毕竟，这就是你来这里的原因……]");
         outputText("[pg]还没等你回答，又一波高潮席卷而来，大量的精液喷射而出，射进了今天第三十一个索要你精液的荡妇体内。在她的肩膀上方，你还能看到几十只鹰身女妖，其中一半是你自己的后代，正排队等着轮到她们。");
         get_game().gameOver();
         if(!get_hardcore())
         {
            addButton(1,"重试",retryDungeonFromBadEndPrompt);
         }
      }
      
      public function harpyQueenAdvantage() : void
      {
         menu();
         clearOutput();
         outputText("你居高临下地看着被打败的鹰身女妖女王，她在赫尔踩着她胸口的脚下扭动着。");
         outputText("[pg][say: 蠢货！]她啐了一口。[say: 杀了我，一了百了！我才不会被你们这种恶魔爱好者利用！]");
         outputText("[pg]什么。");
         menu();
         if(get_player().get_lust() > 33 && get_player().hasCock())
         {
            addButton(0,"操她",fuckHarpyQueen).hint("用你的阴茎操鹰身女妖女王。你确信赫莉娅也能加入你。");
         }
         addButton(1,"审问",harpyQueenInterrogate).hint("问鹰身女妖女王为什么绑架一只火蜥蜴。");
         addButton(2,"杀了她",killHarpyQueen).hint("彻底解决鹰身女妖女王。" + (get_silly() ? " 给她个坏结局！" : ""));
         addButton(3,"放她走",letHarpyQueenGo).hint("放鹰身女妖女王走。");
         addButton(14,"返回",playerMenu);
      }
      
      public function gooArmorBeatsUpPC() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         outputText("[pg]你倒下了，无法抵抗史莱姆装甲的猛攻。她笑着从装甲下钻了出来，在你只能尖叫的时候将你完全包裹起来。史莱姆双手叉腰，居高临下地看着你，狂笑不止。[say: 啧，啧，啧。现在不那么急着偷我的装甲了吧？那么……我该拿你怎么办呢，嗯？]你挣扎着，但被紧紧地包裹在她的粘液中，你除了扭动臀部和胸部之外什么也做不了，这反而让你看起来像是在诱惑她。");
         outputText("[pg]当你意识到自己的错误时，她的脸上浮现出一丝微笑。[say: 啊，我知道了……我已经很久没有品尝过我那珍贵的体液了……]");
         if(get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("[pg]她开始用黏液剥开你的[armor]，很快就露出了你毫无防备的[vagina]。她夸张地舔了舔嘴唇，黏液触手渗入你的小穴，将你完全填满。你在黏液的束缚中扭动挣扎，但一切努力都是徒劳的。盔甲里的黏液女孩只是对你摇了摇头，然后从你的[vagina]里退了出来。");
            outputText("[pg]你只有一瞬间的时间来弄清楚即将发生什么，随后她的黏液——现在完美地塑造成了你小穴内部的形状——像一根坚硬的肉棒一样猛地插回你体内。你情不自禁地呻吟出声，声音透过覆盖在你嘴上的黏液，几乎听不见。");
            outputText("[pg][say: 噢，你喜欢这样，是吗？]盔甲史莱姆邪恶地笑着问道。[say: 好吧，也许这可以互惠……互利。]她依然咧嘴笑着，开始用她那肉棒般的附肢猛烈抽插你的小穴，用她的黏液假阳具快速而用力地操着你。");
            get_player().cuntChange(25,true,true,false);
            if(get_player().biggestTitSize() > 1)
            {
               outputText("当她猛烈地抽插你的小穴时，她身上的一些粘液在你的[chest]周围盘旋，挤压和按摩着你的乳房。当她粗暴地挑逗你的乳房，捏你的乳头，粗暴地挤压你娇嫩的肉体时，你扭动着身体。");
               if(get_player().lactationQ() > 0)
               {
                  outputText("令她高兴的是，一股温暖的乳汁从你酸痛的乳头喷射而出，乳白色混入蓝色的粘液中，就像油和水一样。[say: 嗯，真好吃！]她调侃道，从你身上按摩出越来越多的乳汁。");
               }
            }
            outputText("[pg]她继续无情地捣弄着你的小穴，当你的爱液开始流淌并渗入她那黏糊糊的插入物时，她的笑容咧到了非人的宽度。她贪婪地吸收着你的淫液，享受着这顿美餐，但她的抽插却毫不留情，直到你感觉到高潮即将来临。[saystart]噢，");
            if(get_player().get_tallness() < 70)
            {
               outputText("小");
            }
            else
            {
               outputText("大");
            }
            outputText("女孩准备好高潮了吗？好吧，那就继续吧。喂我！[sayend]");
            outputText("[pg]你爆发了，淫液从你的[vagina]喷涌而出，射入黏液肉棒中。黏液女孩大笑着吸收了你的淫水，随着你的喂食，她的体型变得越来越大，直到她高高地俯视着你，她那巨大的肉棒现在已经粗到足以痛苦地撑开你的肉壁。[say: 噢，太棒了。乖，女孩，乖。对，全释放出来，就像这样……就像这样，]她柔声哄着，吸收着你的汁液，直到你的高潮终于过去。心满意足后，她从你体内抽出，让你站起来，你的腹部留下了一种明显的空虚感。");
            outputText("[pg][say: 嗯，真好玩，]黏液女孩拍着她圆滚滚的肚子说道。你可以看到你的一些淫水");
            if(get_player().biggestTitSize() > 1 && get_player().lactationQ() > 0)
            {
               outputText("和乳汁");
            }
            outputText("在她体内打转。[say: 好吧，既然你把我喂得这么饱，我就放你走吧。就这一次！回见，小美味！]");
            outputText("[pg]还没等你缓过神来说句话，黏液女孩就大摇大摆地走出了门。令你惊讶的是，战斗结束后你感觉精神焕发，你活动了一下肩膀，将注意力转回前方的地牢。");
         }
         else if(get_player().hasCock())
         {
            outputText("她开始用她的黏液剥开你的盔甲，很快就露出了你毫无防备、半勃起的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。她夸张地舔了舔嘴唇，黏液触手像一个温暖湿润的飞机杯一样紧紧包裹住[eachCock]。你在黏糊糊的束缚中扭动挣扎，但你的努力是徒劳的。盔甲里的黏液女孩只是对你摇了摇头，把[eachCock]挤压得更紧了。");
            outputText("[pg]当她开始抚弄你的" + get_player().multiCockDescriptLight() + "时，你舒服地喘着气，她居高临下地俯视着你，邪恶地笑着为你打飞机。[say: 噢，你喜欢这样，是吗？]盔甲史莱姆问道。[say: 好吧，也许这可以互惠……互利。]她开始加快节奏，当她套弄你的[cocks]时，你扭动着身体，随着先列腺液的小气泡形成，她舔了舔嘴唇。无助的你只能屈服，在穿戴盔甲的黏液女孩继续榨取你时，试着享受这一切。");
            outputText("[pg]她继续无情地为你打飞机，当你的先列腺液开始流淌并渗入她那黏糊糊的“手”中时，她的笑容咧到了非人的宽度。她贪婪地吸收着你，享受着这顿美餐，但她的动作却毫不留情，直到你感觉到高潮即将来临。[saystart]噢，");
            if(get_player().get_tallness() < 70)
            {
               outputText("小");
            }
            else
            {
               outputText("大");
            }
            outputText("[boy]准备好高潮了吗？好吧，那就继续吧。喂我！[sayend]");
            outputText("[pg]你高潮了，浓稠的白色精液从[eachCock]喷射而出，射入黏液女孩等待着的身体里。黏液女孩笑着吸收了你的精液，随着你的喂食，她的体型越来越大，直到她高高地俯视着你，膨胀的乳房和肚子悬在你的上方。[say: 哦，太棒了。好[boy]，真棒。对，全都射出来，就是这样……就是这样，]她娇嗔着，吸吮着你的精液，直到你的高潮终于过去。心满意足后，她从你身上退开，留下你那明显空虚酸痛的[cocks]。");
            outputText("[pg][say: 嗯，真好玩，]黏液女孩拍着圆滚滚的肚子说。你可以看到你的一些精液在她的体内打转。[say: 好吧，既然你把我喂得这么饱，我就放你走吧。就这一次！回见，美味的小家伙！]");
            outputText("[pg]还没等你缓过神来说句话，黏液女孩就大摇大摆地走出了门。令你惊讶的是，战斗结束后你感觉精神焕发，你活动了一下肩膀，将注意力转回前方的地牢。");
         }
         else
         {
            outputText("你倒在地上，无法抵挡盔甲史莱姆的猛攻。黏液大笑着从盔甲底部滑出，在你只能尖叫之前将你完全包裹。黏液狂笑着，双手叉腰，居高临下地看着你。[say: 啧，啧，啧。现在不那么急着偷我的盔甲了吧？那么……我该拿你怎么办呢，嗯？]你挣扎着，但被她的黏液紧紧包裹着，你除了扭动臀部和胸部之外什么也做不了，反而不小心做出了诱人的动作。");
            outputText("[pg]当你意识到自己的错误时，她的脸上浮现出一丝微笑。[say: 啊，我知道了……我已经很久没有尝过我珍贵的体液了……]她开始用黏液剥开你的盔甲，但当她看到你光秃秃、空荡荡的胯部时，她惊恐地停了下来。");
            outputText("[pg][say: 什么。这……什么鬼。你怎么……" + get_player().mf("老兄","宝贝") + "，你怎么尿尿！？]");
            outputText("[pg]你虚弱地挣扎着，无法回应。");
            outputText("[pg][say: 哦……操。随便吧。滚开，你这个怪胎。]");
            outputText("[pg]黏液女孩耸了耸肩，大摇大摆地走出了前门。");
            outputText("[pg]你酸痛地从地上爬起来，擦掉装备上的一点黏液残留物。令你惊讶的是，战斗结束后你感觉精神焕发，你活动了一下肩膀，将注意力转回前方的地牢。");
         }
         get_player().HPChange(1000,false);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(1),DynStat.Sens(3));
         get_combat().cleanupAfterCombat();
         doNext(playerMenu);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,481,1);
      }
      
      public function goToHeliaDungeon2() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-phoenixtower");
         outputText("不到一个小时，你和赫莉娅就在高山的狭窄岩架和裂缝中跋涉，缓慢而稳定地向着白雪皑皑的山峰攀登。赫尔显然很清楚她要去哪里——她开辟出了一条确定而稳固的路线，仿佛她知道上山的每一条小径和捷径。当你接近山峰时，你确信她以前来过这里——甚至来过很多次。");
         outputText("[pg]终于，你看到山腰上有一座矮胖厚实的石塔的塔顶。赫尔轻车熟路地引导你走向那里，并在你跨越一道异常宽阔的峡谷时拉了你一把——这道峡谷足以把大多数游荡的牛头人挡在这座孤塔之外。当你爬上塔楼所在的平台时，赫尔突然抓住你的肩膀，把你按倒在地——刚好避开了一只低空飞过的鹰身女妖的视线。");
         outputText("[pg][say:安静，]她低声警告道，整个人趴在你身上，以免你突然起身暴露位置。[say:在开阔地带我们不可能同时对付她们所有人……这是一次潜行任务，明白了吗？]");
         outputText("[pg]你默默地点了点头，你们俩开始向塔楼进发，在岩石间跳跃穿梭，以避开鹰身女妖的视线。最终，你们来到了这座高耸建筑的底部。现在，在它的阴影庇护下，你可以清楚地看到数量众多的鸟身女妖在空中飞来飞去。");
         outputText("[pg]现在安全了，不用再担心天上飞的鹰身女妖和她们的哨兵了，赫尔压低声音说道，[say:好了，计划是这样的。我爬上塔顶，从上面攻击她们；你从这里的大门进去，]她指着一扇似乎已经废弃了十年的腐朽木门说道。[say:分头行动，各个击破，对吧？这里有三层，所以……我们尽快在第二层会合。好吗？]");
         outputText("[pg]你再次点头，在赫莉娅开始攀爬这座古老高塔的高墙时，给了她一点助力。而你则深吸一口气，从正门的一个缺口处走了进去。");
         get_game().dungeonLoc = 17;
         get_game().inDungeon = true;
         doNext(playerMenu);
      }
      
      public function goToHeliaDungeon() : void
      {
         clearOutput();
         outputText("你告诉赫莉娅，是的，你已经完全准备好了。她喜笑颜开，紧紧地抱住了你。[say:再次感谢你，[name]。你真他妈是个真正的勇者，你知道吗？]你一笑置之，但这只火蜥蜴对你抛了个风骚的媚眼，然后动身向群山走去。你赶紧跟上了她。");
         doNext(goToHeliaDungeon2);
      }
      
      public function gitButtRoadPhoenix() : void
      {
         clearOutput();
         outputText("你从人堆顶上抓起看起来最健康的不死鸟女，把这个双性人扔到离她姐妹们几英尺远的地上。她闷哼了一声，用冷酷、凶狠的眼神抬头看着你。[say: 我绝不屈服！我是一名骄傲的战士，不是什么——] 是是是，随便吧。你撕开她的锁子甲衬衫，露出下面那对巨大柔软的D罩杯双峰。不死鸟女对这突如其来的暴露倒吸了一口凉气，转过头去，下定决心在你寻欢作乐时不与你对视。你抓住这个战士丰满的乳房，告诉不死鸟女今天算她走运：你打算让她操你的屁股。");
         outputText("[pg]不死鸟带着混合着渴望和谨慎的目光抬头看着你。[say: 等等……你真的要让我……那么做？真的吗？]");
         outputText("[pg]你点点头。");
         outputText("[pg][say: 呃，那……好吧。如果那是你想要的……]");
         outputText("[pg]你迅速脱下你的[armor]，将女孩推倒在她的背上，然后蹲在你的战利品上方。你用手握住她坚挺的蜥蜴肉棒开始套弄，手掌顺着她紫色的球状阴茎上下滑动。当你开始为她手淫时，不死鸟发出了一声愉悦的喘息，你一边将她抚摸至完全勃起，一边漫不经心地把玩着她丰满的双乳或湿润的小穴。");
         outputText("[pg]一旦你确信她已经完全坚挺，你便移动你的[hips]，让你的[asshole]悬停在不死鸟那根粗壮的十二英寸肉棒上方。你允许她把手放在你的臀部引导你向下，直到你能感觉到她狭窄的龟头抵住了你的后庭。你咬住嘴唇，强忍住痛苦与欢愉交织的叫声，亲自完成了这一步，引导她粗大的肉棒滑过你放松的括约肌，进入你的肠道。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]当她完全没入你的体内时，你发出了一声闷哼，一种强烈的饱胀感和温暖感充斥着你。你低头看着不死鸟女孩，很高兴看到她脸上那狂喜的表情，因为你的臀部肌肉正紧紧地挤压着她坚挺的蜥蜴肉棒。你感觉到她的手紧紧抓住了你的[hips]，作为回报，你调皮地捏了捏她柔软的乳房。你开始摇晃你的臀部，让她的肉棒滑出一两英寸，然后你被撑开的[asshole]又将其吸了回去。");
         outputText("[pg]令人惊讶的是，不死鸟女孩将手从你的臀部移到了你的肩膀上，把你拉倒在她身上，将你的脸按进了她柔软如枕的乳房里。还没等你责备她，你的情人就将她的肉棒猛地撞进你的体内，让你在她柔软的肉体中发出愉悦的尖叫。她咧嘴笑着，用翅膀、腿和尾巴缠住你，让你完全无法动弹，同时她开始猛烈地操弄你的屁股，她的肉棒像活塞一样在你体内进进出出。");
         outputText("[pg]在不死鸟的突然袭击下，你毫无还手之力，只能咬紧牙关，任由快感将你淹没。你回抱住她，将她的一颗乳头含入嘴里把玩，任由她粗暴地操弄你。你能感觉到肛门高潮正在积聚，于是你迅速试着放松自己，让她的肉棒越来越深地进入，直到她再次将你完全贯穿，她的臀部猛烈地撞击着你的[butt]。");
         outputText("[pg]你无法坚持太久，一口咬住她粉红色的乳头，达到了高潮，任由直肠里的入侵者带来的快感如潮水般将你淹没。你的括约肌紧紧夹住体内的蜥蜴肉棒，像小穴一样榨取着它，直到在你的高潮和对她最敏感部位的啃咬的刺激下，不死鸟女孩也高潮了。当她滚烫的精液冲进你的屁股，烫伤你的肠壁时，你发出了一声惊呼，紧接着你感觉到一股巨大的快感向你袭来——第二次高潮！你的大脑变得完全麻木，几乎要晕厥过去，因为她的肉棒将狂喜的颤栗泵入了你的体内。");
         outputText("[pg]几分钟后，当你恢复理智时，不死鸟女孩已经睡着了，但仍然紧紧地抱着你。你将她疲软的蜥蜴肉棒从你的屁股里拔出来，当一股滚烫的精液顺着她的滴落到她的大腿和臀部时，你忍不住打了个寒颤。你从她紧紧的拥抱中挣脱出来，在她的脸颊上轻轻吻了一下，然后穿上你的[armor]离开了。");
         get_player().orgasm("Anal");
         doNext(playerMenu);
      }
      
      public function fuckHarpyQueen() : void
      {
         clearOutput();
         outputText("你决定这个女王婊子应该被教训一顿，而且你还要用她来让自己爽一爽。你把这个想法悄悄告诉了赫尔，她似乎对这个主意很感兴趣。");
         outputText("[pg][say: 哦，我正希望你这么说呢。那么，计划是什么？]");
         menu();
         if(get_player().get_gender() == 0)
         {
            outputText("[pg]<b>不幸的是，你缺乏执行此操作所需的本钱。</b>");
            if(get_silly())
            {
               outputText("<b> 又一个不要做无性人的理由。</b>");
            }
         }
         if(get_player().hasCock())
         {
            addButton(1,"肛交",harpyQueenSexAnal);
            addButton(2,"阴道交",vaginalHarpyQueenSex);
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function exitHelTower() : void
      {
         clearOutput();
         outputText("你溜出门外，将高塔抛在身后。你开始原路返回营地。");
         get_game().dungeonLoc = -1;
         get_game().inDungeon = false;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function declineRetry() : void
      {
         clearOutput();
         outputText("读取最新的存档。你随时可以稍后再试。");
         get_game().gameOver();
         removeButton(1);
      }
      
      public function checkOutDemBirdBitches() : void
      {
         clearOutput();
         menu();
         outputText("你俯视着被击败的重步兵，对她们感到惊叹。这些混血儿可能是你在玛瑞斯遇到过的最有组织、最高效的战斗单位，虽然你打败了她们，但你知道这个地区的大多数居民根本不是她们的对手。");
         if(get_player().get_lust() > 33)
         {
            outputText("[pg]你想你可以用她们中的一个来发泄一下。");
            if(get_player().hasCock())
            {
               if(get_player().hasCockThatFits(80))
               {
                  addButton(0,"传教士",phoenixMissionary).hint("用你的阴茎操其中一只不死鸟。");
               }
               else
               {
                  outputText("[pg]你太大了，无法正常地操她们中的任何一个。");
               }
               addButton(1,"手淫",phoenixWanking).hint("强迫其中一只不死鸟给你打飞机。");
            }
            if(get_player().hasVagina())
            {
               addButton(2,"骑乘(阴道)",phoenixAginal).hint("用阴道骑乘其中一只不死鸟的阴茎。");
            }
            addButton(3,"后庭骑乘",gitButtRoadPhoenix).hint("用后庭骑乘其中一只不死鸟的肉棒。");
         }
         addButton(14,"返回",playerMenu);
      }
      
      public function beatUpGooArmor() : void
      {
         spriteSelect(SpriteDb.get_s_valeria());
         clearOutput();
         outputText("屈服于你的");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("情色能力");
         }
         else
         {
            outputText("战斗技巧");
         }
         outputText("，盔甲史莱姆向后瘫倒在墙上，无法站立。你居高临下地看着她，咧嘴笑着，思考着该如何处置这个无助的对手。");
         outputText("[pg][say: 嘿……嘿，等等！]黏液喘息着，用力挥手试图阻止你。[say: 事情……事情不一定要变成这样。我想……嘿，对，我想我们可以达成共识。你是个讲道理的人，对吧？没必要动粗……]");
         outputText("[pg]你怒视着盔甲史莱姆，但还是让她把话说完。");
         outputText("[pg][say: 呃呵呵。呃，我只是在玩，明白吗？只是饿了而已。这附近没多少人来，除了那些该死的鹰身女妖，她们倒是不怎么烦我。呃，所以，我们做个交易怎么样，嗯？]你对她挑了挑眉。[say: 你刚才把我揍得很惨。这真让人印象深刻，考虑到我当年用剑可是相当厉害的。现在我，呃，没以前那么结实了……好吧，我已经不适合一个人当冒险者了。你已经证明了这一点。]");
         outputText("[pg][say: 所以你觉得怎么样……我跟你一起走？嗯？怎么样？你可以直接穿上我和这件旧盔甲，]她用黏糊糊的指关节无声地敲了敲闪亮的胸甲。她皱起眉头；拳头缺乏实体感似乎让她非常不安。[say: 说真的。你可以像穿其他盔甲一样穿上我——而且是一件非常棒的盔甲！而且，如果你在你的——我们的——冒险中感到焦躁不安，也许我也可以帮你解决这个问题？]");
         outputText("[pg]嗯，这确实是个有趣的提议。你要带上这件黏液女孩盔甲吗？");
         menu();
         addButton(0,"带上她",takeGooArmorAndWearIt).hint(get_armors().GOOARMR.get_description()).disableIf(get_player().get_armor().get_id() == get_armors().VINARMR.get_id(),"你无法脱下你的藤蔓。");
         addButton(1,"拒绝她",refuseGooArmorOffer).hint("拒绝黏黏护甲的提议。你终究还是不想要她！不过，你可能有一段时间无法得到她了。");
         addButton(2,"礼貌拒绝",refuseGooArmorOfferPolitely).hint("礼貌地拒绝黏黏护甲的提议。你现在还不想要她。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,482,1);
      }
      
      public function askKirkAboutHel() : void
      {
         clearOutput();
         outputText("你问这个鹰身女妖女孩，她到底是怎么认识赫尔的。");
         outputText("[pg][say: 哦，呃，]她紧张地开口，显然被你的问题吓了一跳。[say: 我认识赫莉娅小姐已经有一段时间了。几年前她救了我的命，然后，嗯，从那以后我们就一直是朋友。当我意识到这里发生了什么——地牢里的火蜥蜴是谁——我忍不住想告诉她发生了什么事。]");
         outputText("[pg]因为你很了解赫尔，所以你试探性地问奇里，她和赫尔是不是只是朋友。");
         outputText("[pg][say: 什——什么！？]她结结巴巴地说，大惊失色。[say: 我，我们，呃，我是说……呃。]她垂下肩膀。[say: 是的，我想你可以这么说。我们又不是在谈恋爱什么的，但是，你知道的……]鹰身女妖轻轻耸了耸肩，声音渐渐变小。[say: 她对我很好。]");
         doNext(talkToKiri);
      }
      
      public function askKiriAboutSalamander() : void
      {
         clearOutput();
         outputText("你向她询问你来这里要帮忙解救的火蜥蜴囚犯。");
         outputText("[pg][say: 哦，是的……]奇里紧张地说[say: 关于那个……]");
         outputText("[pg]哦，糟了。");
         outputText("[pg][say: 不，不！他没事！呃，好吧，考虑到所有情况，他已经尽可能地好了。我只是……呃……觉得你应该知道：他的名字是哈康·恩·卡勒辛。他是赫尔的爸爸。也是我的。]");
         outputText("[pg]好吧，见鬼。");
         outputText("[pg][say: 赫尔还不知道……我不想让她失去理智或者做出什么鲁莽的事。但是，是的，下面那个是我爸爸。我只是希望……我能做点什么来帮他。]");
         outputText("[pg]你问怎么才能救他出来。");
         outputText("[pg][say: 母亲大人一直把手铐的钥匙带在身上。布里吉特有脚镣的钥匙。你需要打败她们两个才能救他。]");
         doNext(talkToKiri);
      }
      
      public function askKiriAboutKiri() : void
      {
         clearOutput();
         outputText("你让奇里跟你说说她自己的事。");
         outputText("[pg][say: 谁，我？哦，我真的没什么特别的……]她有些不自然地轻笑着说。");
         outputText("[pg]你催促她随便说点什么。");
         outputText("[pg][say: 嗯，我想你可以说我算是个混血儿。我爸爸是楼下的火蜥蜴，妈妈是你等会儿要打的育母。我出生的时候，妈妈还没完全掌握制造不死鸟所需的魔法——所以我长得不太对劲。我真的只是一只鹰身女妖。没什么特别的。]");
         outputText("[pg]她似乎不想多说，于是你耸耸肩，继续前进。");
         doNext(talkToKiri);
      }
      
      public function askKiriAboutHarpies() : void
      {
         clearOutput();
         outputText("你向奇里询问塔里剩下的鹰身女妖，以及她们的相对实力和位置——任何能给你带来优势的信息。");
         outputText("[pg][say: 对，是的，赫尔让我四处侦察并记住这些东西。呃……哦，对了！]她清了清嗓子，开始背诵：[say: 地牢层：狱卒布里吉特，火蜥蜴囚犯。夹层：不死鸟重步兵部队，受过训练但缺乏经验。二楼：仪仗队，精锐保镖；还有我们的育母，卡莱斯，塔的女王。]");
         outputText("[pg]你点点头，然后问，[say: 不死鸟？]");
         outputText("[pg][say: 哦，是的……我想这就是赫尔来这里要阻止的。她们是母亲和下面那个火蜥蜴囚犯生下的混血儿。]");
         doNext(talkToKiri);
      }
      
      public function agreeToHelpHeliaDungeon() : void
      {
         clearOutput();
         outputText("你仔细考虑了这只火蜥蜴的提议，最终同意协助她。你不仅能阻止一种新的怪物在群山中繁衍，还能博得可爱的赫莉娅的好感——这绝对是个双赢的局面。");
         outputText("[pg]赫尔绽放出一个灿烂的笑容，向你扑来，一把将你抱住，紧紧地勒着，差点没把你勒死。你回以紧紧的拥抱，最终赫尔在你的怀里放松下来，作为对你的回报");
         if(!get_player().isTaur())
         {
            outputText("，并在你的腿上依偎着");
         }
         outputText("。她蹭了蹭你的脖子，低声说道：[say: 谢谢你，勇者。知道我能指望你……做我的后盾，这对我来说意义重大。]");
         outputText("[pg]你伸手抚摸着赫尔的头发，告诉她无论发生什么你都会支持她。你调皮地摸了一把她肌肉结实的屁股；她立刻用尾巴缠住你，把你的双臂紧紧固定在胸前。看来你现在哪儿也去不了了。火蜥蜴微微一笑，低声说道：[say: 我们就这样待到天亮吧——你觉得呢？]");
         outputText("[pg]你只好认命，和赫莉娅蜷缩在一起；她把斗篷盖在了你们俩身上。");
         if(get_game().marbleScene.marbleAtCamp() && get_silly())
         {
            outputText("[pg]就在你和赫尔开始亲热的时候，你听到了一阵熟悉的蹄声。你从毯子里探出头来，惊恐地看到玛布尔正站在你面前。");
            outputText("[pg][say: 亲、亲爱的？] 玛布尔说道，对赫尔在你怀里感到惊骇。[say: 你……你到底在干什么！？]");
            outputText("[pg]这下糟——");
            outputText("[pg][say: 滚开，母牛婊子！] 赫尔咆哮着，向这个牛女孩露出利爪。[say: [name]今晚是我的。听懂了吗！？]");
            if(get_silly())
            {
               outputText("[pg]玛布尔结结巴巴地开口，努力想找词反驳这只火蜥蜴。然而，还没等她开口，赫尔就一跃而起，朝她冲了过去！你甚至连插手的机会都没有，玛布尔的牛穴就挨了结结实实的一脚，整个人飞了出去，直直地摔向沼泽。" + (get_game().kihaFollowerScene.followerKiha() ? " 当赫尔重新回到你怀里时，你几乎可以肯定，你听到了远处传来一声巨龙般的愤怒尖叫。" : ""));
            }
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,479,-1);
         doNext(playerMenu);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2001) > 0)
         {
            get_player().orgasm("Generic");
         }
      }
      
      public function HeliaThroneRoom() : void
      {
         clearOutput();
         menu();
         outputText("你把注意力转向火蜥蜴，她目前正把那个鹰身女妖婊子按在地上，以防她飞走或做出什么过激的事情。");
         outputText("[pg][say: 嘿，[name]，]赫尔在你走近时说道。她粗暴地抓住你的[armor]，把你拉进一个长长的吻中，只有在用手臂和尾巴缠住你时才停下来。[say: 谢谢你，亲爱的。打心底里感谢。没有你我做不到。]");
         outputText("[pg]你摸了摸她的头，告诉她这是你的荣幸。");
         outputText("[pg]她咧嘴一笑。[say: 那么，有什么计划，我的爱人？给这个婊子一个她永远不会忘记的教训？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,488) > 0)
         {
            addButton(0,"哈康",heliaHakonTalk).hint("向赫莉娅询问关于哈康的事，也就是你在地牢里找到的那个火蜥蜴。");
         }
         addButton(1,"奇里",heliaKiriTalk).hint("向赫莉娅询问关于奇里的事，那个混血女孩。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
         {
            addButton(2,"女王",heliaQueenTalk).hint("向赫莉娅询问关于鹰身女妖女王的事。");
         }
         addButton(14,"返回",playerMenu);
      }
   }
}

