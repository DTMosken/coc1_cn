package classes.scenes.dungeons.factory
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Mutations;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class OmnibusOverseerScene extends BaseContent
   {
      
      public function OmnibusOverseerScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstOmnibus() : void
      {
         var willing:Boolean;
         var _g:OmnibusOverseerScene;
         clearOutput();
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("双性魅魔站在原地颤抖着，她骄傲的恶魔阴茎抽搐着、跳动着，因为她的欲望完全压倒了她。覆盖在紫红色双性人阴茎上的受污染的结节从根部向尖端起伏肿胀，最终爆发性地喷射出粘稠的白色恶魔种子。她带着羞愧和快感呻吟着，将越来越多的精液泵到她办公室的地板上。她跪倒在地，因为过早的高潮而过于疲惫和羞愧，无法继续战斗。[pg]");
            outputText("[say: 噢，不。你不能告诉其他恶魔我这么容易就高潮了！我永远都抬不起头了，]她哭喊着，[say: 你打败了我，求求你，如果你放我走，并保证不告诉其他恶魔，我就用我的魔法送你一份礼物！我的魔法很强大，只要对象渴望改变，我几乎可以做到任何事情。][pg]");
         }
         else
         {
            outputText("双性魅魔浑身颤抖，跪倒在地，彻底被打败了。[pg]");
            outputText("[say: 求求你，如果你放我走，我可以用我的魔法给你几乎任何你想要的东西！只求你别告诉其他恶魔这里发生的事，我永远都抬不起头了，]她哀求道。[pg]");
         }
         outputText("你该怎么做？你可以利用她的恩赐来增加你的天赋尺寸，或者恢复一些失去的人性！或者你可以稳妥起见，拒绝她的提议。不过那样的话，你就得决定是放她走还是杀了她。");
         menu();
         addButton(0,"长出乳房",chooseBreasts).hint("如果是平胸，则长出一对新的乳房，或者让现有的乳房变大。[pg]并获得其他东西。");
         addButton(1,"长出阴茎",chooseDick).hint("长出一根新的阴茎。不知为何，你有一种感觉，你将获得的新鸡巴不会是一根普通的鸡巴。[pg]并获得其他东西。");
         addButton(2,"正常脸庞",normalFace).hint("让你的脸恢复正常。这也会移除你的角或触角，并把你的耳朵变回人类的耳朵！[pg]并获得其他东西。");
         addButton(3,"正常胸部",normalChest).hint("让你的胸部恢复正常。这会将大于E罩杯的乳房缩小到合理的尺寸，并移除它们的其他异常特征（如果有的话）。这也会将你的皮肤变回人类皮肤。[pg]并获得其他东西。");
         addButton(4,"正常腹股沟",normalGroin).hint("让你的腹股沟恢复正常，移除任何多余的阴茎，并将剩余的阴茎重置为正常状态（如果有的话）。或者为无性别者长出生殖器。[pg]并获得其他东西。");
         addButton(5,"正常双腿",normalLegs).hint("让你的双腿恢复正常。这也会移除你的尾巴（如果有的话）！[pg]并获得其他东西。");
         if(get_creepingTaint() && !get_player().hasPerk(PerkLib.PurityBlessing))
         {
            addButton(6,"解除诅咒",removeCurse).hint("解除泽塔兹的部分诅咒。[pg]并获得其他东西。");
         }
         _g = this;
         willing = true;
         addButton(7,"更多欲望",function():void
         {
            _g.postOmnibusBoon(willing);
         }).hint("随时准备做爱。[pg]你觉得这真的是个好主意吗？");
         addButton(9,"不（放走）",letGoOmnibus).hint("拒绝提议并放走恶魔。");
         addButton(10,"不（杀掉）",killOmnibus).hint("拒绝提议并杀掉恶魔。");
      }
      
      public function removeCurse() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         outputText("[say:那种诅咒……我以前只听说过这种事！我——][pg]你握紧双拳，死死地盯着她。[say:但我能应付的，我确定！等一下……]");
         outputText("[pg]双性魅魔用双手编织出一些魔法，并朝你释放过来。你还在思考接受恶魔这种交易是否明智，但现在已经太迟了。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2666,1);
         outputText("你感觉到胸口的寒意消退了一些。你还没有完全痊愈，但你确信<b>泽塔兹的药剂不会对你产生那么大的影响了。</b>");
         postOmnibusBoon();
      }
      
      public function postOmnibusBoon(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("在你检查身体变化的时候，双性魅魔消失了。你猜你确实得到了你想要的。你红着脸笑了，感觉非常饥渴。你决定利用办公室的私密性来缓解你自到达以来积累的紧张感。");
            outputText("[pg]你快速而有效地自慰，渴望平静下来并继续你的探索。没过多久，一阵高潮席卷了你的身体。你伸了个懒腰站起来，发现自己仍然处于兴奋状态。");
            outputText("[pg]你得到了你想要的东西——<b>恶魔的魔法让你永远无法完全满足！</b>");
            outputText("[pg]（获得特质：双性魅魔的恩赐 - 最低欲望值增加了！）");
         }
         else
         {
            outputText("[pg]在你检查身体变化的时候，双性魅魔消失了。你猜你确实得到了你想要的。你红着脸笑了，仍然感觉非常饥渴。你决定利用办公室的私密性来缓解你自到达以来积累的紧张感。[pg]你快速而有效地自慰，渴望平静下来并继续你的探索。没过多久，一阵高潮席卷了你的身体。你伸了个懒腰站起来，发现自己仍然处于兴奋状态。[pg]你猛地拍了一下额头，恍然大悟——<b>恶魔的魔法让你永远无法完全满足！</b>[pg]（获得特质：双性魅魔的恩赐 - 最低欲望值增加了！）");
         }
         get_player().createPerk(PerkLib.OmnibusGift,0,0,0,0);
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function normalLegs() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         if(get_player().lowerBody.type == 0)
         {
            outputText("你觉得自己真该为自己的愚蠢扇自己一巴掌。你的腿本来就是正常的！当腐化魔法席卷你全身时，你羞得满脸通红，但什么也没改变。");
         }
         else
         {
            outputText("你的[legs]无法支撑你，你瘫倒在地。骨头断裂和重塑的声音充满了房间，但奇怪的是你没有感到疼痛，只有轻微的兴奋。你眨了眨眼，叹了口气，当你再次低头看时，<b>你长出了正常的人类双腿</b>！");
         }
         get_player().lowerBody.type = 0;
         get_player().lowerBody.legCount = 2;
         if(get_player().tail.type > 0)
         {
            outputText("片刻之后，你感觉有什么东西从你的臀部上方脱落了。<b>你不再有尾巴了！</b>");
            get_player().tail.type = 0;
            get_player().tail.venom = 0;
            get_player().tail.recharge = 5;
         }
         postOmnibusBoon();
      }
      
      public function normalGroin() : void
      {
         var _loc2_:int = 0;
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         var _loc1_:int = 0;
         outputText("你感觉到一种奇怪的颤抖感传遍全身。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("你的[cocks]颤抖着缩回你的身体。当这个过程结束时，你只剩下你的[cock]。");
            get_player().removeCock(1,int(get_player().cocks.length) - 1);
            _loc1_++;
         }
         if(get_player().hasCock())
         {
            if(get_player().cocks[0].cockLength > 12)
            {
               outputText("一种刺痛感在你的[cock]中蠕动，它缩小到更适中的十一英寸。");
               get_player().cocks[0].cockLength = 11;
               _loc1_++;
            }
            if(get_player().cocks[0].cockThickness > 2)
            {
               outputText("你的[cock]那淫秽的粗细萎缩到大约两英寸的周长。");
               get_player().cocks[0].cockThickness = 2;
               _loc1_++;
            }
            if(get_player().cocks[0].get_cockType() != CockTypesEnum.HUMAN && get_player().cocks[0].get_cockType() != CockTypesEnum.DEMON)
            {
               outputText("你的[cock]非人的外观发生了变化，血肉重新排列成更像人类的结构。几秒钟后，你有了一个看起来非常正常的阴茎。");
               get_player().cocks[0].set_cockType(CockTypesEnum.HUMAN);
               _loc1_++;
            }
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("你的[cock]感到刺痛，因为那些凸起开始消退。片刻之后，肉体变暗，每一个肉突都重新出现。<b>你堕落的阴茎抵抗了魔法！</b>");
               _loc1_++;
            }
         }
         if(get_player().ballSize > 5)
         {
            _loc1_++;
            outputText("一直沉重地坠在腹股沟的[balls]感到一阵刺痛，随后缩小到了更容易控制的尺寸。");
            _loc2_ = Utils.rand(3);
            get_player().ballSize = 2 + _loc2_;
         }
         if(_loc1_ > 0)
         {
            outputText("[pg]");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().vaginas[0].vaginalWetness >= 3)
            {
               outputText("你的" + get_player().vaginaDescript(0) + "不断渗出的液体减缓了，然后停止了流出。");
               get_player().vaginas[0].vaginalWetness = 2;
               _loc1_++;
            }
         }
         if(get_player().get_gender() == 0)
         {
            if(get_player().balls > 0 || get_player().get_femininity() < 35 || Utils.rand(3) == 0)
            {
               get_player().createCock();
               get_player().cocks[0].set_cockType(CockTypesEnum.DEMON);
               get_player().cocks[0].cockLength = 10;
               get_player().cocks[0].cockThickness = 2;
               outputText("腹股沟突然传来一阵压力。你惊讶地低头看去，一想到自己要长出阴茎，你就感到异常兴奋。你的皮肤泛起涟漪并向外凸起，那种压力感转变成了强烈的温暖感。凸起物不断膨胀，长到三英寸时，顶端变成了紫色。你摸了摸它，舒服得叫出了声，看着它在你的抚摸下又往前窜了一英寸。随着它越长越大，你那小巧的阴茎冠部变得越来越清晰，直到它看起来像一根正常的六英寸阴茎。你对新长出的器官感到无比幸福和渴望，不禁叹了口气。还没等你好好享受，又一阵热浪席卷全身，让你的新器官产生了反应。它硬得发痛，长度达到了八英寸。");
               if(get_player().cor < 80)
               {
                  outputText("你惊恐地看着皮肤变成闪亮的深紫色。微小而蠕动的结节开始从紫色的皮肤上冒出来，让你的阴茎看起来更像是一个疯狂的性玩具，而不是一根正常的阴茎。你喘着粗气，在它最后一次伸长时几乎要高潮了，它的长度达到了十英寸。最后一圈结节在你那恶魔阴茎的冠部边缘形成，随着你惊恐的心跳，暗暗地跳动着。");
               }
               else
               {
                  outputText("你好奇地看着皮肤变成闪亮的深紫色。微小而蠕动的结节开始从紫色的皮肤上冒出来，让你的阴茎看起来更像你在恶魔身上看到的那些神奇的肉棒！你喘着粗气，幸福地呻吟着，因为它最后一次伸长，达到了十英寸。拥有如此宏伟的欢愉工具的兴奋感让你高潮了。当最后一圈结节在你新长出的恶魔阴茎冠部边缘形成时，你惊讶地发现你射出的液体是漆黑的！但随着你的新阴茎随着你的心跳暗暗地跳动，你脑子里唯一想的就是尽快试用它……");
               }
               if(get_player().balls == 0)
               {
                  get_player().balls = 2;
                  outputText("[pg]一阵剧痛掠过你的胯部，让你弯下了腰。在震惊中，你勉强看清了眼前的景象：<b>你长出了睾丸！</b>");
                  get_player().ballSize = 1;
               }
            }
            else
            {
               get_player().createVagina();
               outputText("你的胯部开始发痒，并垂直蔓延开来。你伸手往下摸，发现了一个开口。你长出了一个<b>新的" + get_player().vaginaDescript(0) + "</b>！");
            }
            _loc1_++;
            outputText("[pg]");
         }
         if(get_player().ass.analWetness >= 3)
         {
            outputText("你的" + get_player().assDescript() + "不断渗出的液体减缓了，然后停止了流出。");
            get_player().ass.analWetness = 2;
            _loc1_++;
         }
         if(_loc1_ == 0)
         {
            outputText("你感到一阵短暂的刺痛，但没有感觉到明显的变化。你的胯部并不需要变得更像人类。");
         }
         postOmnibusBoon();
      }
      
      public function normalFace() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         if(get_player().horns.value > 0 || get_player().antennae.type > 0)
         {
            outputText("你的额头奇痒无比。你忍不住疯狂地抓挠它。");
            if(get_player().horns.value > 0)
            {
               outputText("你的角掉了下来，重重地砸在地板上。");
               get_player().horns.value = 0;
               get_player().horns.type = 0;
            }
            get_mutations().removeAntennae(true);
         }
         if(get_player().ears.type != 0)
         {
            outputText("你的头部两侧爆发出剧痛，你的耳朵重新成型并移动，恢复成你以前的人类耳朵的样子！");
            get_player().ears.type = 0;
         }
         if(get_player().face.type != 0)
         {
            outputText("你的面部结构重新排列成一张正常的人类面孔，就像你来到这个可怕的地方之前一样。");
            get_player().face.type = 0;
         }
         postOmnibusBoon();
      }
      
      public function normalChest() : void
      {
         var _loc2_:int = 0;
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         var _loc1_:int = 0;
         if(int(get_player().breastRows.length) > 1)
         {
            get_player().removeBreastRow(1,int(get_player().breastRows.length) - 1);
            outputText("你的胸部感到一阵刺痛，开始觉得变轻了。你急忙拉开你的[armor]，意识到你现在只有" + get_player().allBreastsDescript() + "了！");
            if(get_player().nippleLength > 1)
            {
               outputText("你的乳头缩小到更正常的大小。");
               get_player().nippleLength = 0.75;
            }
            _loc1_++;
         }
         if(get_player().breastRows[0].breastRating > 7)
         {
            outputText("一直挂在你胸前的沉重肉团变得越来越轻，迅速消失。");
            _loc2_ = Utils.rand(5);
            get_player().breastRows[0].breastRating = 3 + _loc2_;
            outputText("你现在有" + get_player().allBreastsDescript() + "。");
            _loc1_++;
         }
         if(get_player().nippleLength > 1)
         {
            outputText("你的乳头缩小到更正常的大小。");
            get_player().nippleLength = 0.75;
            _loc1_++;
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("你乳头上类似阴道的开口闭合了，将自己封死。");
            get_player().breastRows[0].fuckable = false;
            _loc1_++;
         }
         if(!get_player().hasPlainSkin())
         {
            outputText("你身上的皮肤奇痒无比，因为它褪去了[skindesc]，露出了[skintone]的皮肤。");
            get_player().skin.desc = "skin";
            get_player().skin.type = 0;
            get_player().underBody.restore();
            _loc1_++;
         }
         if(_loc1_ == 0)
         {
            outputText("你感到短暂的刺痛，但没有感觉到明显的变化。你的胸部已经相当像人类了。");
         }
         postOmnibusBoon();
      }
      
      public function letGoOmnibus() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         outputText("你拒绝落入她的圈套，决定不接受她的提议。然而，既然她已经被彻底击败，你允许她逃跑，并警告她如果将来再敢与你作对，下场会惨得多。");
         outputText("[pg][say:谢谢你，仁慈的英雄！]她说着，冲出了门。翅膀从她背上展开，她腾空而起，消失在主厂房上方的天窗外。");
         get_combat().cleanupAfterCombat();
      }
      
      public function killOmnibus() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         if(get_player().get_weapon().isHolySword())
         {
            outputText("你感觉到剑中有一股正义的力量，敦促你净化这个腐化的副官。你顺应了这股力量，将剑刺入了双性魅魔的胸膛。她只有片刻的时间来表达她的震惊和恐惧，随后剑闪耀着光芒，烧毁了这个没有灵魂的恶魔的心脏。你倾身向前，将尸体从剑上推开。你感觉你的武器因为净化了像监工这样的腐化者而变得稍微强大了一些。");
         }
         else if(get_player().get_weapon().isScythe())
         {
            outputText("这个工厂的监工在你之前已经摧毁了许多勇者，现在却在乞求怜悯？你一边解释着不会有任何怜悯，一边举起镰刀准备行刑。她蓝色的皮肤因即将到来的死亡而变得苍白。[say:求求你！我不该攻击你的！我——]当你挥下镰刀时，她结结巴巴地说着。镰刀干净利落地切断了她的脖子。你这是罪有应得。");
         }
         else if(get_player().get_weapon() == get_weapons().BLUNDER)
         {
            outputText("你不会对这个监督摧毁你同伴勇者的人手下留情。你把你的霰弹枪顶在她的脸上，近距离开火，把脑浆喷洒在办公室的地板上。");
         }
         else if(get_player().get_weapon().isFirearm())
         {
            outputText("你挥舞着你的[weapon]砸向她的太阳穴，将这个恶魔工头击倒在地。你近距离朝她头部开了几枪，结束了她的生命。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你紧紧握住你的[weapon]，用尽全力砸向双性魅魔的头骨，将其砸得粉碎。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("你重重地一拳打在她的胸口，将工厂监工击倒并让她喘不过气来。趁她还没恢复过来，你迅速上前，站在她身侧，将斧头挥向她的脖子。你看着被砍下的头颅滚到一边，心想，这是一次传统的处决。");
         }
         else if(get_player().get_weapon().isSharp())
         {
            outputText("你没有再耽搁片刻，向监工逼近，将你的[weapon]挥向她的脸。刀刃深深地嵌入，她猛地向后一缩，差点把刀柄从你手中扯掉。你把刀从她身上拔出来，任由尸体在原地腐烂。");
         }
         else
         {
            outputText("你走上前去，抓住她的头。你猛地一扭，扭断了她的脖子，至少终结了恶魔威胁的一小部分。");
         }
         get_player().upgradeBeautifulSword();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1250,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function encounterOmnibus() : void
      {
         menu();
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         outputText("[pg]一个几乎全裸的恶魔女人站在桌子后面，打量着你。从古典意义上讲，她非常漂亮，拥有曲线优美的沙漏型身材，散发着纯粹的性感，不受任何对得体外表的渴望的束缚。闪亮的黑色唇彩包裹着她丰满的嘴唇，而深色的眼影则突出了她明亮的红眼睛。她身上最接近衣服的东西是一条窄窄的布带，缠绕在她丰满的胸部，几乎无法掩盖她勃起的乳头那尖尖的凸起。她的胯部完全没有遮挡，露出了她闪闪发光的女性特征那无毛的嘴唇。[pg]");
         outputText("她在桌子边缘踱步，舔着嘴唇说道：[say: 所以你一路来到了这里，是吗，“勇者”？太糟糕了，你浪费了时间。你弄明白了吗？你发现为什么你被送到这里时没有武器或受祝福的物品了吗？你发现为什么这里的人类比这个领域的任何地方都多吗？我来告诉你为什么。你不是勇者。你是一头祭祀用的奶牛，注定要加入我们的牛群。你只是运气好才重获自由。][pg]");
         outputText("你的一部分想要否认她，尖叫着说她错了。但这太有道理了，不可能是谎言……而且证据就在你身后，在工厂的地板上。所有这些女人一定都是以前的勇者，为了喂养这些贪得无厌的恶魔，她们被活活留下来，高潮了数年。女恶魔看着你的反应，带着一种近乎性福的表情，仿佛这一切可怕的背叛让她兴奋起来。[pg]");
         outputText("[say: 是的，]她娇声说道，[say: 你属于这里。问题是，你是接受你的命运，还是反抗它？]");
         addButton(0,"战斗",doFightOmnibus);
         addButton(1,"接受",acceptOmnibus);
      }
      
      public function doLossOmnibus() : void
      {
         doBadEndOmnibusPart1();
      }
      
      public function doFightOmnibus() : void
      {
         clearOutput();
         outputText("你摆出战斗姿势，准备好你的[weapon]。她微笑着在桌子周围闲逛，让一个球状的肉质物体从她的下唇之间掉落出来。你震惊地看着它硬化成一根阴茎，正好从她阴蒂应该在的地方长出来。");
         outputText("[pg]她嘲笑道：[say: 喜欢你看到的吗，奶牛？我一定会去围栏里看你的。]");
         outputText("[pg]一股看不见的力量关上了北面的玻璃门，阻止你逃跑！");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2023,1);
         startCombat(new OmnibusOverseer(),true);
         spriteSelect(SpriteDb.get_s_factory_omnibus());
      }
      
      public function doBadEndOmnibusPart2() : void
      {
         clearOutput();
         if(int(get_player().cocks.length) > 1)
         {
            outputText("在她的手中是一团闪闪发光的绿色物质。她转过身来面对你，把它拿得更近，让你看到它发光表面上不断变化的光芒。[pg]");
            outputText("[say:对于像你这样……与众不同的人，我们将不得不尝试这种生物。我是用植物触手、眩晕草和我们称之为阴道草的混合物培育出来的，]她提到，双手在桌子上打开那团东西。内部表面是一团黏糊糊的起伏突起，暴露在空气中时狂热地蠕动着。她把那东西抱在怀里，继续对你说话，[say:你看，我的植物会紧紧包裹住你的器官，用黏稠的液体包裹它们。它的体液是催情剂、润滑剂和削弱意志的麻醉剂的完美混合物。你会喜欢的。][pg]");
            outputText("你拼命试图逃离她的椅子，但你的身体除了在原地扭动之外，什么也做不了。她把那个生物直接扔到你的胯部，然后跳到她的桌子上观看。成千上万个微小的湿润结节立即开始按摩你的[cocks]");
            if(get_player().balls > 0)
            {
               outputText("和[ballsfull]");
            }
            outputText("。快感如潮水般席卷全身，你忍不住呻吟出声。你不再挣扎，臀部开始在半空中抽搐，仿佛在乞求更多的刺激。这感觉太棒了，简直不公平……你无法控制自己，这实在太难抗拒了。[pg]");
            outputText("你带着一种超然的迷恋，看着你的" + get_player().multiCockDescript() + "被闪亮的绿色物质紧紧包裹。在跳动的绿色物质下，每根阴茎的形状依然清晰可见，尽管你能看到它在你的长度上移动和起伏，为你带来快感。它看起来几乎就像某种变态的捆绑玩具。似乎察觉到了你的注意力，绿色物质紧紧地挤压着你，并开始在其表面闪烁出美丽的生物发光彩色图案，分散了你的思绪。你眨了几下眼睛，绿色的物质继续展开，卷过你的");
            if(get_player().balls > 0)
            {
               outputText("蛋蛋");
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("和" + get_player().vaginaDescript(0));
               }
            }
            else if(int(get_player().vaginas.length) > 0)
            {
               outputText(get_player().vaginaDescript(0));
            }
            else
            {
               outputText("会阴");
            }
            outputText("，滑上你的腹部，渗下你的臀部。随着它的蔓延，色彩占据了你越来越多的思绪，清除了你抵抗的念头。[pg]");
            outputText("一个温柔的女性声音从某处传来，[say: 我有没有提过，它专门被调整为用漂亮的颜色来迷惑意识？我一定是忘了。好吧，我看到你自己发现了。这些颜色太适合向我敞开你的心扉了，不是吗？它们赶走了你的思绪，让我的话语深深滑入你的潜意识。我敢打赌，只专注于颜色，让我的宠物挑逗你的肉棒，感觉一定很好，对吧？][pg]");
            outputText("你毫无意识地点了点头。");
            outputText("[pg]那个声音笑着继续说道，同时那生物绕过你的[hips]，在你的臀瓣间滑入一根触须，完成了对你腹股沟的紧密环绕，[say: 很好。你想让这生物尽可能多地覆盖你。作为共生植物的性食物，这无比令人兴奋。]你感觉到那生物舔舐着你的[asshole]，直到它放松下来，然后滑入某种东西。一股温暖的湿润感在你的肠道中蔓延，某种东西开始从你体内抚摸你的前列腺。[pg]");
            outputText("快感超载，你感觉到你的[cocks]跳动并射精，产生了半透明的绿色精液气球，大小如同");
            if(get_player().cumQ() < 50)
            {
               outputText("苹果");
            }
            if(get_player().cumQ() >= 50 && get_player().cumQ() < 300)
            {
               outputText("哈密瓜");
            }
            if(get_player().cumQ() >= 300)
            {
               outputText("西瓜");
            }
            outputText("在你的每根阴茎末端。生物的闪烁加剧，而你的臀部不受控制地颤抖，将你最后的精液泵入这奇妙的植物中。灯光秀变得更加明亮，完全清空了任何残留的杂念，让你感到奇妙的敞开。[pg]");
            outputText("[say: 被用来榨取精液感觉很棒，]那个声音说道，你同意了，这确实很棒。[pg]");
            outputText("[say: 你最大的性癖是让恶魔生物吸食你的精液，]她说道，这感觉如此正确。你的精液注定要让恶魔和植物享用。仅仅是这个想法就让你想再次高潮。[pg]");
            outputText("[say: 既然你提供食物来源，那你一定就是家畜。你喜欢做家畜。家畜不需要思考。家畜服从命令。最棒的是，作为家畜，你可以实现你最喜欢的性癖，每天每小时都被榨干所有的精液，]那个声音说道，让你的脑海中充满了新的想法。当然，它是对的，你只需要让恶魔或触手植物榨取你，并做所有困难的事情，比如思考。你所要做的就是射精。当植物服吸收了被包裹的精液气泡时，这个想法让你不寒而栗。当它吸收营养时，耀眼的光芒变得更加明亮。[pg]");
            outputText("*闪烁* [say: 你想为植物射精。][pg]");
            outputText("植物的卷须爬上你的肚子，在你身上涂满粘液，按摩着你的每一寸肌肤。[pg]");
            outputText("*闪光* [say: 你需要为植物高潮。][pg]");
            if(int(get_player().breastRows.length) == 1)
            {
               outputText("它们爬到了你乳房的下缘。[pg]");
            }
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("它们滑过你最下面的一对乳房，将它们包裹在蠕动的紧致感中。[pg]");
            }
            outputText("*闪光* [say: 你喜欢为任何事物和任何人高潮。][pg]");
            if(int(get_player().breastRows.length) == 3)
            {
               outputText("当你中间的乳房也被紧紧包裹时，它们因绝对的快感而刺痛。[pg]");
            }
            if(int(get_player().breastRows.length) == 2)
            {
               outputText("当植物生长到你最上面乳房的顶端，覆盖了你乳晕的下半部分时，你呻吟出声。[pg]");
            }
            if(int(get_player().breastRows.length) == 1)
            {
               outputText("当滑腻的快感如潮水般涌过时，你的[nipples]变得像钢铁一样坚硬。[pg]");
            }
            outputText("*闪光* [say: 你喜欢被命令高潮。][pg]");
            if(int(get_player().breastRows.length) == 1)
            {
               outputText("蠕动的肿块滑上你乳房的最顶端，缩小成两根细小的卷须，环绕在你的脖子上。[pg]");
            }
            if(int(get_player().breastRows.length) >= 2)
            {
               outputText("蠕动的肿块轻松地爬上你最上面的一对乳房，用粘液和快感包裹住你坚如钻石的乳头。它继续向上攀爬，缩小成两条带子，环绕在你的脖子后面。[pg]");
            }
            outputText("*闪光* [say: 高潮就是服从。你喜欢高潮。你喜欢服从。你比任何其他声音都更喜欢服从我的声音。服从我的声音给了你这些高潮。既然你喜欢服从我，你必须成为我的宠物。][pg]");
            outputText("你主人的另一只宠物缠绕在你的脖子上，形成了一个由变幻的绿色组成的项圈。你微笑着意识到它完成了——你已经成为了她的宠物牛之一。你的身体被包裹在变幻的绿色快感海洋中，正如你主人所希望的那样。如果不是你[cocks]明显的凸起，你看起来就像穿着一件极其暴露的连体泳衣。对你胯部的不断挑逗仍在继续，即使你刚刚高潮过，你仍然坚硬如石。被挤奶来喂养你的新衣服的想法让你如此兴奋，你敢打赌你正在为你新的绿色主人不断地流出先列腺液。[pg]");
            outputText("闪光消退，你新的想法涌入虚空。当你试图服从时，你立即开始自慰你被包裹的阴茎。高潮就是服从。服从就是高潮。你发现你可以通过你“衣服”的皮肤感觉到每一次触摸。你加快了节奏，知道你的高潮将喂养现在生活在你身上的生物，满足你最深最黑暗的欲望。你再次高潮，和以前一样猛烈，用你服从的证明给" + Utils.num2Text(int(get_player().cocks.length)) + "个闪亮的绿色气球充气。[pg]");
            if(get_game().marbleScene.marbleFollower())
            {
               outputText("突然，工厂车间传来一声大叫。你和你的女主人转过头，看到玛布尔正冲上通往工头办公室的楼梯。你的女主人看着她，有些好笑地说，[say: 呵呵！看来又有一头母牛来凑热闹了。][pg][say: 亲爱的！她对你做了什么？] 玛布尔大喊道，[say: 她给你穿了什么？！][pg][say: 哦，原来你认识这个女孩？] 你的女主人问你，[say: 看起来是个泌乳牛娘，看来这次我要往牛栏里添一头真正的母牛了。] 玛布尔转向你的女主人，挥舞着她的锤子，但一想到你的女主人会受伤，你就感到一阵恐惧，这让你猛地扑上前去抓住了玛布尔。这短暂的分神让你的女主人有机会将注射器扎进玛布尔的肩膀，没过一会儿，她就瘫倒在地上，失去了知觉。\"[pg]");
               outputText("你的女主人转过身来，对你笑了笑。");
               outputText("[pg][say: 嗯，她应该能很好地代替你在牛栏里的位置，]她说着，若有所思地敲了敲下巴，回头看着你，[say: 真的太方便了，我现在不用担心我的新宠物会死掉了，亲爱的。]然后她把你推回椅子上，说道[say: 但首先……][pg]");
            }
            else
            {
               outputText("你的主人赞许地低头看着你，说道，[saystart]非常好。");
            }
            outputText("我要你待在这里，一直高潮到天亮。我的宠物需要大量的营养来补充能量，我计划明天用新的方法教你服从。[sayend][pg]");
            outputText("很高兴有这样一个美妙的任务，你第二天都在被下药的催情剂中沐浴，一次又一次地高潮。每天早上，这个生物都会闪烁着让你服从，而那个声音则教你越来越多关于如何思考的知识。一周后，你成为了完美的宠物。在你服役的第一个月底，任何关于你过去生活的记忆都消失了。你余生都在喂养你的主人和她的宠物，并帮助她改良和繁殖她的宠物，以便向其他人传授这种方法。");
            get_game().gameOver();
            return;
         }
         if(int(get_player().cocks.length) == 1)
         {
            outputText("在她的手里是一团蠕动的紫色肿块。它有一个光滑的外表面，上面点缀着深紫色的彩虹色斑点。另一侧由光滑的粘液膜组成，上面覆盖着蠕动的粉红色纤毛。[pg]");
            outputText("她带着掠食者般的微笑俯身看着你，[say: 这个小家伙是我的最爱。我甚至给它做过一点“实地测试”。]她指着一个小小的、滴着液体的孔洞，解释道，[saystart]你看，一旦我把它戴在你身上，它就会张得大大的。它会把你那可爱的小鸡巴吸进嘴里，然后用它那细小的触手开始挤压和按摩你，直到你忍不住释放出你所有的");
            if(get_player().cor < 33)
            {
               outputText("甜美");
            }
            if(get_player().cor >= 66)
            {
               outputText("污秽");
            }
            outputText("性爱能量，深深地射进它的食道里。而这仅仅是个开始！[sayend]她的手松开了那团蠕动的肉块，把它径直扔到了你的大腿上。[pg]");
            if(get_player().averageCockLength() < 15)
            {
               outputText("那野兽动作敏捷，一口就将你的[cock]吞进了它黏糊糊的嘴里。");
            }
            else
            {
               outputText("那野兽淫秽地膨胀着，开始将你的[cock]吞进它黏糊糊的嘴里，顺着它的长度一直往下，直到你再也看不见你的欢愉工具。");
            }
            outputText("黏糊糊的触手没有浪费时间，以机械般的精准度按摩着你。你在无助的快感中呻吟着，在生物蠕动的束缚中变得坚硬而痛苦。三个突起从生物的核心长出，滴着它们自己的黏液，内侧覆盖着同样蠕动的突起，现在正按摩着你被困住的阴茎。其中两个卷住你的[hips]，而最后一个");
            if(get_player().balls > 0)
            {
               outputText("闷住你的蛋蛋，将它们困在黏糊糊的感觉中，同时继续穿过你的会阴，来到你的臀瓣之间。");
            }
            else
            {
               outputText("穿过你的会阴，然后来到你的臀瓣之间。");
            }
            outputText("这三根触须在后面汇合在一起，形成了一个无缝的小紫色三角形。它真的提得很高，不断地挑逗着你的[asshole]。你正穿着一条有机的紫色丁字裤！[pg]");
            outputText("你试图忍受，但这羞辱对你来说太难以承受了。快感和羞耻将你推过了极限。你发出一声混合着痛苦和愉悦的尖叫，你欢愉的证明沸腾着涌入那生物体内。你喘息着、抽搐着，无力抵抗高潮的强度，你的精液填满了那生物，使它在你的阴茎周围明显变形。你叹了口气，随着袭击的平息，你放松下来，蠕动的触手在努力消化它们的“美餐”时，明显放松了。[pg]");
            outputText("[say: 享受吗？最精彩的部分才刚刚开始，]她眼中闪烁着邪恶的光芒说道。你猛地坐直了身子，因为你那活生生的丁字裤在蠕动和移动，有什么坚硬的东西压在了你的[asshole]上。你伸手往下，试图把那生物扯下来，但它的外壳出奇地坚硬，而且几乎完美地贴合着你的[skindesc]。你抬起头，眼中充满恐惧，脸上写满了恳求。[pg]");
            outputText("她歪着头，带着探究的神情问道，[say: 看来它找到你的后门了？]你局促不安地点点头，当那坚硬的生长物穿过你的括约肌，彻底侵犯你时，你尖叫起来。她用漫不经心的语气继续说道，尽管她的眼睛似乎在贪婪地注视着这一幕，[say: 你感觉到钻进你屁股里的那个东西了吗？那是一个精心进化出的注射附肢。别担心，一旦它安顿下来，就不会怎么动了。它只会和你的前列腺以及几根主要血管变得舒舒服服的。然后它会奖励你的高潮！][pg]");
            outputText("你感觉到它钻得更深了一点，然后向上弯曲。它以一种让你的[cock]不受控制地抽搐的方式压迫着你体内的某个东西。你确信，如果不是因为你阴茎周围那贪婪的触手内裤，你肯定会看到一大团先列腺液挤出来。你充满焦虑和担忧地问，[say: 呃，它、它、它要怎么奖励我？][pg]");
            outputText("她眨了眨眼，抚摸着你那紫色阴茎监狱斑驳的表面，同时你感觉到后庭传来一阵温暖湿润的感觉。与此同时，你感觉到前列腺传来一阵痛苦的刺痛，差点跳了起来。恶魔女舔了舔嘴唇，回答道，[say: 嗯，它会用两种方式奖励你，宠物。第一：它会将一种特别设计的混合药物直接排入你的肠道，在那里它们会被身体慢慢吸收。]仿佛是配合她的话，一股温柔的暖意传遍你的躯干，辐射到你的四肢，并像平静的薄雾一样在你的脑海中沉淀下来。你彻底放松了，尽管有担忧，但还是享受着这种感觉。[pg]");
            outputText("她轻声细语，抚摸着你仍然坚硬的阴茎和周围的生物。奇迹般地，你既能感觉到她丝滑手指的触摸，也能感觉到内裤本身不断带来的愉悦蠕动。你在她的手上抽动着你的[cock]，开心地咯咯笑着。[pg]");
            outputText("[say: 没错，这是个很好的奖励，不是吗？]她一边继续抚摸你一边问道，[saystart]那些药物让你变得温顺，而且极易受暗示。例如——每次我说话，你都能感觉到我的手在抚摸和爱抚你的阴茎");
            if(get_player().balls > 0)
            {
               outputText("并挑逗你的蛋蛋");
            }
            outputText("。你看到了吗？我甚至都没有再碰你了，你还在抽搐。天哪，你会成为一个多么听话的奴隶啊。[sayend][pg]");
            outputText("当她对你说话时，你喘息着、呻吟着，仍然感觉到内裤生物和你主人那双美妙的手的共同作用，[say: 我甚至还没告诉你奖励的第二部分。如果你想让我告诉你，你需要大声承认我们都已经知道的事实——你是我听话的奴隶玩具。说吧，玩具。][pg]");
            outputText("[say: 我-我-我是你顺从的——啊啊——玩-玩-玩具，]你呻吟着。话刚出口，你就知道这是真的，但这念头很快就被抛到了脑后。你迫不及待地想知道，这个生物和你的女主人会如何奖励你这个听话的玩具。当然，你更想让她继续说话，这样你就能再次感受到她那光滑的指尖抚摸你的感觉。[pg]");
            outputText("[say: 你已经是我乖巧的玩具了，不是吗？]她沉思着，[say: 你就是喜欢取悦我，对吧，玩具？]你狂热地点头，惹得你的女主人开心地笑了起来，她教导你，[say: 你的第二部分奖励是直接将它的毒液注射到你的前列腺里。你可能没有注意到，在你的肉棒不断受到挑逗的时候，你的前列腺现在应该已经增大了一倍。如果我把你和你的训练服分开，你会发现你分泌的先列腺液多到一直都在往下滴。你的高潮不会变得更强烈，但你会发现随着你越来越兴奋，先列腺液会不断涌出。毕竟，我的小宝贝需要进食。][pg]");
            outputText("你的女主人温柔地拍了拍你那淫秽的紫色内裤，在你耳边低语，[say: 做个乖玩具，为女主人高潮吧。]你咧开嘴笑了，你的臀部在空中像活塞一样抽动，仿佛在操一个想象中的小穴。精液从你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]和");
            }
            outputText("肿大的前列腺中喷涌而出，浓稠的精液填满了包裹着你肉棒的腔室。你开心地笑着，触手腔室为了容纳你的精液而变形，鼓成了一个更圆的形状。高潮结束后，你瘫倒下来，开始感觉到更多的“奖励”填满了你现在贪婪的洞穴。[pg]");
            if(get_game().marbleScene.marbleFollower())
            {
               outputText("突然，工厂车间传来一声大叫。你和你的女主人转过头，看到玛布尔正冲上通往工头办公室的楼梯。你的女主人看着她，有些好笑地说，[say: 呵呵！看来又有一头母牛来凑热闹了。][pg][say: 亲爱的！她对你做了什么？] 玛布尔大喊道，[say: 她给你穿了什么？！][pg][say: 哦，原来你认识这个女孩？] 你的女主人问你，[say: 看起来是个泌乳牛娘，看来这次我要往牛栏里添一头真正的母牛了。] 玛布尔转向你的女主人，挥舞着她的锤子，但一想到你的女主人会受伤，你就感到一阵恐惧，这让你猛地扑上前去抓住了玛布尔。这短暂的分神让你的女主人有机会将注射器扎进玛布尔的肩膀，没过一会儿，她就瘫倒在地上，失去了知觉。\"[pg]");
               outputText("你的女主人转过身来，对你笑了笑。");
               outputText("[pg][say: 嗯，她应该能很好地代替你在牛栏里的位置，]她说着，若有所思地敲了敲下巴，回头看着你，[say: 真的太方便了，我现在不用担心我的新宠物会死掉了，亲爱的。]然后她把你推回椅子上，说道[say: 但首先……][pg]");
            }
            outputText("你的女主人拍着你的头，在你耳边低语着命令，而那只现在已经吃饱的奴隶制造生物吞噬着你的精液，将其转化为更多的“奖励”。你没有注意她的话，重要的是服侍女主人，尽可能多地为你的内裤玩具高潮。你不需要担心，她会告诉你该怎么想。她是如此完美和惊人，你不知道为什么有人会想要伤害她或她奇妙的创造物。“天哪，服从的感觉真好”是你脑海中最后一次为自己思考的念头。[pg]");
            outputText("在接下来的日子里，你把时间都花在了被新女主人挑逗上，直到你感觉自己快要爆炸，然后被带入突然爆发的高潮，填满你的内裤监狱。每次结束后你都会晕倒，但每次你都越来越不在意。你想要留在这里，享受这些美妙的高潮，服从你美丽的女主人。[pg]");
            outputText("一个月后，她开始让你在没有你最喜欢的内裤的情况下生活。你求她把它们给你穿上，但她经常让你在工厂里爬来爬去，你肿胀的肉棒到处滴落着先列腺液，你乞求她把你放回快乐内裤里。有时，如果你运气好，她会操你，或者派你去抓另一个冒险者。没有什么比在你的触手内裤里高潮，同时看着女主人的另一个创造物教导一个荡妇如何拥抱她的本性更让你喜欢的了。");
            get_game().gameOver();
            return;
         }
         if(int(get_player().vaginas.length) == 1 || get_player().get_gender() == 0)
         {
            outputText("她手里拿着一条无缝内裤。它的表面完美地反射着光线，仿佛它鲜艳的粉红色表面涂抹了光滑的油，或者是用乳胶制成的。");
            if(get_player().get_gender() == 0)
            {
               outputText("恶魔微笑着，带着邪恶的意图，一把扯下了你[armor]的下半部分。你没有生殖器并没有让她感到困扰，她迅速拿出一根针，注射了你的腹股沟。几秒钟内，你的胯部裂开，露出了一个新鲜的处女小穴。她满怀期待地舔了舔完美的嘴唇，把内裤翻过来，举起来给你看。[pg]");
               get_player().createVagina();
            }
            else
            {
               outputText("恶魔微笑着，带着邪恶的意图，一把扯下了你[armor]的下半部分。她凑近了，微笑着，吸入你下体的气味，像品尝美酒的香气一样品味着它。她满怀期待地舔了舔完美的嘴唇，把内裤翻过来，举起来给你看。[pg]");
            }
            outputText("那根本不是内裤，而是一种活物。这件活体衣物的整个内表面都覆盖着肉色的粉红色结节，它们不断地蠕动着，几乎滴下一种刺鼻的润滑剂，闻起来和你的体液没什么两样。令人毛骨悚然的是，前面有一大块肉疙瘩。它的表面有棱纹，并且在跳动，不断地膨胀和收缩。它显然是为了进入任何穿戴者的通道而设计的。更糟糕的是，背面有一个更小、更窄的突起。这个……生物……肯定会尽力堵住你的两个洞。[pg]");
            outputText("你的俘虏者把它拉回来，凑得更近了，让她自己芬芳的小穴气味弥漫在空气中。它闻起来酸甜可口，让你");
            if(get_player().vaginas[0].vaginalWetness <= 2)
            {
               outputText("湿润");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("滴在椅子上");
            }
            else
            {
               outputText("浸湿了椅子");
            }
            outputText("因为萦绕在你鼻尖的令人陶醉的味道。她自信地说，[say: 你不用担心，亲爱的。我把这个小生物叫做我的荡妇内裤。你看，当你穿上它们时，它们会刺激你的每一个部位。它们会吸吮你的阴蒂，而那两个大肉丘会在你体内生长，让你充满蠕动的快感。它们的粘液是一种极好的润滑剂，也是一种温和的催情剂。在不断的触摸和它的分泌物之间，你很快就会发情，处于高潮的边缘。][pg]");
            outputText("你绝望地摇着头，开始哭泣，因为你意识到她打算把你锁在某种地狱般的快感监狱里。内裤轻松地滑上你的双腿，恶魔迅速地将你的屁股抬起，伴随着湿润的“噗嗤”声，将它们穿好。当它开始工作时，你呻吟出声，滑腻紧致地包裹住你的[clit]。你观察到的那两个“肿块”伸长了，起伏的表面让你的" + get_player().vaginaDescript(0) + "在快感中颤抖跳跃。仅仅几秒钟，你就已经气喘吁吁，准备好高潮了。你的哭泣变成了充满快感和渴望的火热呻吟。");
            get_player().cuntChange(6,true,false);
            get_player().buttChange(6,true,false);
            outputText("[pg]明亮的红眼睛占据了你的视线，那张美丽的脸庞靠得更近了。她在你耳边火热地低语，[say: 我打赌这感觉很好，不是吗？你觉得湿润和饥渴吗？我打赌你现在就想扑到我的肉棒上，好好发泄一下。][pg]");
            outputText("你眨去泪水，疯狂地点头；你离高潮那么近！但每次你感觉到高潮开始积聚时，那生物就会稍微放松一点，刚好让你无法达到高潮。[pg]");
            outputText("[say: 你看，这些内裤是为我们同类量身定做的。我费了好大劲才培育出这么一条，可以被训练成只有在恶魔射在里面或上面时才提供释放。对你来说幸运的是，这些小结节实际上会打开，允许恶魔的肉棒进入任何一个通道。而且只是为了我们的魅魔朋友，它们可以从前面长出一个突起，并将感觉传递给你，]她一边说，一边演示着将她那根跳动的紫红色肉棒靠近你被粉色包裹的腹股沟。内裤的表面从前面裂开一条缝，重新塑形，露出了你被粉色覆盖的骆驼趾。[pg]");
            outputText("她问道，[say: 亲爱的，我不会做强奸犯的。只有当你渴望这根肉棒能带给你的快感时，它才会进入你。你可以说不，然后享受在边缘徘徊的感觉，直到你的意志最终崩溃。][pg]");
            if(get_game().marbleScene.marbleFollower())
            {
               outputText("突然，工厂车间传来一声大叫。你和你的女主人转过头，看到玛布尔正冲上通往工头办公室的楼梯。你的女主人看着她，有些好笑地说，[say: 呵呵！看来又有一头母牛来凑热闹了。][pg][say: 亲爱的！她对你做了什么？] 玛布尔大喊道，[say: 她给你穿了什么？！][pg][say: 哦，原来你认识这个女孩？] 你的女主人问你，[say: 看起来是个泌乳牛娘，看来这次我要往牛栏里添一头真正的母牛了。] 玛布尔转向你的女主人，挥舞着她的锤子，但一想到你的女主人会受伤，你就感到一阵恐惧，这让你猛地扑上前去抓住了玛布尔。这短暂的分神让你的女主人有机会将注射器扎进玛布尔的肩膀，没过一会儿，她就瘫倒在地上，失去了知觉。\"[pg]");
               outputText("你的女主人转过身来，对你笑了笑。");
               outputText("[pg][say: 嗯，她应该能很好地代替你在围栏里的位置，]她说着，若有所思地敲了敲下巴，然后回头看着你，[say: 现在我不用担心我的新宠物死掉了，真是太方便了，亲爱的。]然后她把你推回椅子上，说道[say: 但首先，你不是想从我这里得到什么吗？][pg]");
            }
            outputText("不到一秒钟，你就呻吟出声，[say: 操我！][pg]");
            outputText("她笑了笑，用强壮的手臂把你从椅子上抱起来，然后坐在桌子上。她让你那被共生体覆盖的嘴唇贴在她的恶魔肉棒上，当你顺着她的长度滑下，将整根肉棒吞入你贪婪的深处时，她高兴地咕哝着。如果说有什么不同的话，那就是你体内的生物让性爱变得更美妙了——你感觉到她那布满小结节的肉棒在操你，同时内裤生物的起伏也在继续刺激你。这让你在快感中发狂，你开始上下弹跳，用恶魔的肉棒刺穿你的" + get_player().vaginaDescript(0) + "。[pg]");
            outputText("她咯咯地笑着，伸出手。你太兴奋了，根本不在乎，只是继续操她，在快乐中呻吟。她的手伸上来，开始按摩和揉捏你的" + get_player().allBreastsDescript() + "，特别注意捏和拉扯你的乳头。它们变得像");
            if(get_player().nippleLength < 0.5)
            {
               outputText("橡皮擦一样硬");
            }
            else if(get_player().nippleLength < 3)
            {
               outputText("子弹一样硬");
            }
            else
            {
               outputText("小肉棒一样硬");
            }
            outputText("在片刻之间");
            if(get_player().biggestLactation() > 2)
            {
               outputText("并开始滴下乳汁");
            }
            outputText("。当她的手垂下时，你失望地叹了口气。你离高潮那么近。她再次伸出手，将一些湿润温暖的东西放在");
            if(int(get_player().breastRows.length) <= 1)
            {
               outputText("你的[nipple]上");
            }
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("你最上面的[nipple]上");
            }
            outputText("。你低下头，看到两个由闪亮的粉红色（就像你的内裤一样！）制成的星形生物附着在你的[nipples]上。它们在不断按摩和吸吮时跳动和起伏。");
            if(get_player().biggestLactation() > 1)
            {
               outputText("你的乳汁喷涌而出，从星星中心的一个小孔喷洒出来。作为回应，这生物加大了吸吮的力度，让你不断地喷出乳汁。");
            }
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("当你继续操着那根肉棒，看着那些生物在你的乳头上蠕动时，更多的生物附着在你剩下的[nipples]上，直到每一个乳头都被它自己的微型快感生物覆盖。[pg]");
            }
            outputText("一股滚烫的恶魔精液倾泻进你酸痛的" + get_player().vaginaDescript(0) + "，让你充满了温暖。你后庭的内裤塞似乎也爆发了，将大量未稀释的催情剂倾倒进你的身体。你尖叫着高潮了，当你沉降在俘获者颤抖的阴茎上时，你的眼睛因快感而翻白。你抽搐着呻吟，高潮的时间比你体内的阴茎还要长得多。快感持续了一分钟又一分钟。你的[nipples]都散发着满足和快感，因为它们成功地为你提供了属于它们自己的微型高潮。你呻吟着，终于感到解脱，迷失在充满你身体的满足感中。[pg]");
            outputText("你眨了眨眼，坐了起来，发现自己回到了椅子上。你粉红色的内裤生物已经重新闭合，将恶魔的精液困在你的体内。那堕落的种子如此强效，你甚至能感觉到它在蔓延到你的核心时进一步污染了你的身体。当你试图从你生命中最棒的高潮中恢复过来时，你慵懒地伸展着身体。也许你能逃跑？不，你不能离开，内裤已经在按摩你酸痛的阴户，并玩弄你仍然坚挺的[clit]。当它影响你时，你扭动着身体，将你身体的欲望重新提升到最大。也许如果你同时在前面和后面都接纳一发，它就能让这生物满足足够长的时间让你逃跑……[pg]");
            outputText("你动身进入工厂，寻找双性魅魔和男魅魔来帮忙。[pg]");
            outputText("<b>一个月后：</b>");
            outputText("[pg]你舔掉嘴唇上的恶魔精液，伸了个懒腰，很高兴你的女主人为你提供了今天早上的第五次高潮。通常她只让她最喜欢的荡妇在午餐前让她高潮三四次。当你的内裤开始工作时，你扭动着身体，带你回到那个只有你的主人和女主人才能把你带下来的美妙快感巅峰。回想起来，这真的是最好的结局。你感谢你的女主人，并问你是否可以看看有没有小恶魔想再次让你怀孕。她居高临下地笑了笑，点了点头，让你的阴户因幸福而紧缩。小恶魔的精液真是太棒了！");
            get_game().gameOver();
            return;
         }
      }
      
      public function doBadEndOmnibusPart1() : void
      {
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你踉踉跄跄地走到桌子前，紧紧抓住它才勉强站稳。");
         }
         else
         {
            outputText("你忘记了战斗，靠在桌子上，将空闲的手滑进你的[armor]下，寻求任何你能得到的快感。");
         }
         outputText("感觉到胜利在望，恶魔女走到你身边，把你推到椅子上。你无力反抗，只能眼睁睁地看着她解开你的[armor]，以便更容易接触。她退后一步，欣赏着自己的杰作，把你从头到脚仔细打量了一番。[pg]");
         outputText("[saystart]我正好有适合");
         if(get_player().get_gender() <= 1)
         {
            outputText("男人");
         }
         else
         {
            outputText("女人");
         }
         outputText("像你这样的东西。我一直在杂交在丛林深处发现的寄生虫，试图创造出完美的奴隶制造者。你将成为我的第一个测试对象，[sayend]她说道。[pg]");
         outputText("她看到你眼中流露出的恐惧，安慰地拍了拍你，[say:哦，别担心。这感觉会非常棒的。如果有的话，你应该感到荣幸能协助一个双性魅魔进行她的实验。][pg]");
         outputText("她打开桌子的一个抽屉，短暂地翻找了一下，然后眼睛一亮，认出了什么。[say:找到了，]她说着，拿出了什么东西……");
         doNext(doBadEndOmnibusPart2);
      }
      
      public function chooseDick() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         if(int(get_player().cocks.length) == 0)
         {
            outputText("腹股沟突然传来一阵压力。你惊讶地低头看去，一想到自己要长出阴茎，你就感到异常兴奋。你的皮肤泛起涟漪并向外凸起，那种压力感转变成了强烈的温暖感。凸起物不断膨胀，长到三英寸时，顶端变成了紫色。你摸了摸它，舒服得叫出了声，看着它在你的抚摸下又往前窜了一英寸。随着它越长越大，你那小巧的阴茎冠部变得越来越清晰，直到它看起来像一根正常的六英寸阴茎。你对新长出的器官感到无比幸福和渴望，不禁叹了口气。还没等你好好享受，又一阵热浪席卷全身，让你的新器官产生了反应。它硬得发痛，长度达到了八英寸。");
            if(get_player().cor < 80)
            {
               outputText("你惊恐地看着皮肤变成闪亮的深紫色。微小而蠕动的结节开始从紫色的皮肤上冒出来，让你的阴茎看起来更像是一个疯狂的性玩具，而不是一根正常的阴茎。你喘着粗气，在它最后一次伸长时几乎要高潮了，它的长度达到了十英寸。最后一圈结节在你那恶魔阴茎的冠部边缘形成，随着你惊恐的心跳，暗暗地跳动着。");
            }
            else
            {
               outputText("你好奇地看着皮肤变成闪亮的深紫色。微小而蠕动的结节开始从紫色的皮肤上冒出来，让你的阴茎看起来更像你在恶魔身上看到的那些神奇的肉棒！你喘着粗气，幸福地呻吟着，因为它最后一次伸长，达到了十英寸。拥有如此宏伟的欢愉工具的兴奋感让你高潮了。当最后一圈结节在你新长出的恶魔阴茎冠部边缘形成时，你惊讶地发现你射出的液体是漆黑的！但随着你的新阴茎随着你的心跳暗暗地跳动，你脑子里唯一想的就是尽快试用它……");
            }
            get_player().createCock();
            get_player().cocks[0].set_cockType(CockTypesEnum.DEMON);
            get_player().cocks[0].cockLength = 10;
            get_player().cocks[0].cockThickness = 2;
         }
         if(int(get_player().cocks.length) == 1)
         {
            if(get_player().countCocksOfType(CockTypesEnum.DEMON) < 1)
            {
               outputText("你微笑着，看着你的[cock]变长。在双性魅魔的黑魔法作用下，你的胯部突然长出了几英寸长的崭新鸡巴肉。还没等你把玩你那变形的工具，一股燃烧的欲望之波就穿透了你的身体。");
               if(get_player().cor < 80)
               {
                  outputText("你惊恐地看着你的[cock]的皮肤变成闪亮的紫黑色。");
               }
               else
               {
                  outputText("你好奇地看着你的[cock]的皮肤变成闪亮的深紫色。");
               }
               get_player().increaseCock(0,3 + Utils.rand(5));
               get_player().cocks[0].thickenCock(2);
               get_player().cocks[0].set_cockType(CockTypesEnum.DEMON);
               if(get_player().cor < 50)
               {
                  outputText("腐化的结节开始在它的整个长度上冒出来。<b>你的阴茎正在变成" + get_player().cockDescript(0) + "！</b>除了龟头，这些新长出的肉突在每一寸表面上蠕动着。你无能为力，只能在被迫的快感和恐惧中呻吟，眼睁睁地看着这一切。最后一批结节在你的[cock]冠状沟周围形成了一圈，似乎完成了它的变形，直到你几乎要吐出来地注意到，在你无助的注视下，你的睾丸也被黑色的血管覆盖了！");
               }
               else
               {
                  outputText("在你满怀期待的注视下，微小蠕动的结节开始从紫色的皮肤上爆发出来，就像你在恶魔身上看到的那些宏伟的阴茎一样！<b>你的阴茎正在变成" + get_player().cockDescript(0) + "！</b>当它最后一次变长时，你幸福地喘息和呻吟着。当你用双手抚摸它那惊人的长度时，拥有如此美丽的欢愉工具的兴奋感让你高潮了。当最后一圈结节在你的" + get_player().cockDescript(0) + "的冠状沟边缘形成时，你注意到从你的马眼喷出的液体并不完全是白色的，而是逐渐变暗，最后几滴竟然是漆黑的！你新的[cock]随着你的每一次心跳暗暗地搏动着，但那些即将覆盖你睾丸的粗大、跳动的血管里装的不是血液，而是一种显然已经将它们腐化的黑色液体。你思考着它的目的可能是什么，但随后你决定，当你抚摸着这根巨大、黑暗、布满凸起的肉棒时，如果这感觉和看起来一样好，那也就无所谓了。");
               }
            }
            else
            {
               outputText("你的" + get_player().cockDescript(0) + "向前挺立，轻松地接受了黑魔法。随着你的[cock]变得更长更粗，一寸又一寸的新长度从你的腹股沟爆发出来。它搏动着，仿佛在承诺着黑暗的欢愉，随后稳定在它新的增强尺寸上。");
               var _temp_1:* = get_player().cocks[0];
               _temp_1.cockLength = _temp_1.cockLength + (6 + Utils.rand(10));
               get_player().cocks[0].thickenCock(3);
            }
         }
         if(int(get_player().cocks.length) > 1)
         {
            if(get_player().countCocksOfType(CockTypesEnum.DEMON) == get_player().cockTotal())
            {
               outputText("你的" + get_player().multiCockDescriptLight() + "向前挺立，轻松地接受了黑魔法。随着你的[cocks]变得更长更粗，一寸又一寸的新长度从你的腹股沟爆发出来。它们搏动着，仿佛在承诺着黑暗的欢愉，随后稳定在它们新的增强尺寸上。");
               _loc1_ = int(get_player().cocks.length);
               while(_loc1_ > 0)
               {
                  _loc1_--;
                  get_player().increaseCock(_loc1_,6 + Utils.rand(10));
                  get_player().cocks[_loc1_].thickenCock(3);
               }
            }
            else
            {
               outputText("你微笑着，看着你的[cocks]变得更长。在双性魅魔的黑暗魔法作用下，你的胯部爆发出几英寸长的新生肉棒。还没等你把玩你那变形的快感工具，一阵燃烧的欲望就穿透了你的身体。你");
               if(get_player().cor < 80)
               {
                  outputText("惊恐地");
               }
               else
               {
                  outputText("好奇地");
               }
               outputText("看着你的[cocks]的皮肤变得闪亮且呈紫黑色。堕落的结节开始在每根肉棒的整个长度上涌现。");
               _loc1_ = int(get_player().cocks.length);
               while(_loc1_ > 0)
               {
                  _loc1_--;
                  var _temp_2:* = get_player().cocks[_loc1_];
                  _temp_2.cockLength = _temp_2.cockLength + (3 + Utils.rand(5));
                  get_player().cocks[_loc1_].thickenCock(2);
                  get_player().cocks[_loc1_].set_cockType(CockTypesEnum.DEMON);
               }
               if(get_player().cor < 50)
               {
                  outputText("<b>你的阴茎正在变成" + get_player().multiCockDescriptLight() + "！</b> 新的肉突在除了龟头以外的每一寸表面上发芽并蠕动着。除了在被迫的快感和恐惧中呻吟之外，你什么也做不了，只能眼睁睁地看着。最后一批结节在你的[cocks]冠状沟周围形成了一圈，似乎完成了它的转变，直到你注意到，几乎要吐出来，你的睾丸也在你无能为力的注视下被黑色的血管覆盖！");
               }
               else
               {
                  outputText("<b>你的阴茎正在变成" + get_player().multiCockDescriptLight() + "！</b>除了龟头，每一寸表面都长出了新的肉突，并不断蠕动着。当它们最后一次伸长时，你幸福地喘息呻吟着。当你用双手抚摸它们惊人的长度时，拥有如此宏伟的快感工具的兴奋感让你射了出来。你急切地舔着手指，品尝着你新的精液，同时最后一圈肉突在你美丽的" + get_player().multiCockDescriptLight() + "的冠状沟周围形成。你新的[cocks]随着你的心跳暗暗地跳动着，但那些正在覆盖你睾丸的粗大、跳动的血管里装的不是血液，而是一种黑色的液体，显然是它使它们堕落了。你思考着它的目的可能是什么，但随后你决定，当你抚摸着一根巨大、黑暗、凹凸不平的肉棒时，如果它们感觉和看起来一样好，那就不重要了。");
               }
            }
         }
         postOmnibusBoon();
      }
      
      public function chooseBreasts() : void
      {
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         clearOutput();
         if(int(get_player().breastRows.length) == 0)
         {
            outputText("<b>你的胸部膨胀起来，形成了圆润的C罩杯球体，顶端点缀着小巧挺立的乳头！</b>");
            get_player().createBreastRow();
            get_player().breastRows[0].breastRating = 3;
            get_player().nippleLength = 0.25;
         }
         else if(int(get_player().breastRows.length) <= 1)
         {
            outputText("当魔法生效时，你的" + get_player().allBreastsDescript() + "感到一阵愉悦的刺痛。你着迷地看着它们开始膨胀，就像吸水的海绵一样。你的[armor]顶部被变化拉紧，直到你的胸部似乎要撑破衣服。<b>你的罩杯增加了3个尺寸！</b>");
            var _temp_1:* = get_player().breastRows[0];
            _temp_1.breastRating = _temp_1.breastRating + 3;
            if(get_player().nippleLength < 0.75)
            {
               var _temp_2:* = get_player();
               _temp_2.nippleLength = _temp_2.nippleLength + 0.5;
               outputText("你的[nipples]变得坚挺而敏感，在你的[armor]里变得更加显眼。看来你的乳头也变大以相匹配了。");
            }
         }
         else
         {
            outputText("当魔法生效时，你最上面的[breasts]感到一阵愉悦的刺痛。你着迷地看着它们开始膨胀，就像吸水的海绵一样。你的[armor]顶部被变化拉紧，直到你的胸部似乎要撑破衣服。<b>你的罩杯增加了4个尺寸！</b>");
            var _temp_3:* = get_player().breastRows[0];
            _temp_3.breastRating = _temp_3.breastRating + 4;
            outputText("下一排" + get_player().breastDescript(1) + "的晃动和刺痛感比第一排还要强烈。它们跳动了几秒钟，迅速缩小又变大，直到稳定在一个刚好比你最上面的[breasts]小一点的尺寸。");
            get_player().breastRows[1].breastRating = get_player().breastRows[0].breastRating - 1;
            if(int(get_player().breastRows.length) >= 3)
            {
               outputText("你的第三对" + get_player().breastDescript(2) + "似乎效仿了它们姐妹的榜样，短暂地刺痛了一下，然后稳定在比上方乳房略小一点的尺寸。");
               get_player().breastRows[2].breastRating = get_player().breastRows[1].breastRating - 1;
            }
            if(int(get_player().breastRows.length) >= 4)
            {
               outputText("你剩下的" + get_player().breastDescript(3) + "感觉太棒了，当它们重塑形状以完美契合你其他的乳房时，你忍不住去捧起并揉捏它们。");
               get_player().breastRows[3].breastRating = get_player().breastRows[2].breastRating - 1;
               if(int(get_player().breastRows.length) == 5)
               {
                  get_player().breastRows[4].breastRating = get_player().breastRows[3].breastRating - 1;
               }
            }
            if(get_player().nippleLength < 0.75)
            {
               var _temp_4:* = get_player();
               _temp_4.nippleLength = _temp_4.nippleLength + 0.5;
               outputText("你的[nipples]变得坚挺而敏感，在你的[armor]里变得更加显眼。看来你的乳头也变大以相匹配了。");
            }
         }
         outputText("[pg]");
         postOmnibusBoon();
      }
      
      public function acceptOmnibus() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_factory_omnibus());
         outputText("她微笑着，漫步走近。你的眼睛震惊地睁大，因为她的外阴被她体内的某种东西撑开了。一根光滑且不断生长的阴茎出现了，从她阴蒂应该在的位置发芽。她是个双性人。你没有时间思考这意味着什么，因为女恶魔利用你暂时的分心，将一根针扎进了你的脖子。你叹了口气，几乎瞬间就晕了过去，让她用强壮的手臂和柔软的胸部接住了你。");
         doNext(get_game().dungeons.factory.doBadEndGeneric);
      }
   }
}

