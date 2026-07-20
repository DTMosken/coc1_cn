package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Useable;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs.pregnancies.PlayerAnemonePregnancy;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class AnemoneScene extends BaseContent implements TimeAwareInterface
   {
      
      public function AnemoneScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         CoC.timeAwareClassAdd(this);
         new PlayerAnemonePregnancy(param1);
      }
      
      public function weaponNameLong() : String
      {
         if(!(457 in KFLAGS.flags.h))
         {
            return "<b>错误：没有武器</b>";
         }
         var _loc1_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457));
         if(_loc1_ is Weapon || _loc1_ is Shield)
         {
            return _loc1_.get_longName();
         }
         return _loc1_.get_name();
      }
      
      public function weaponName() : String
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(!(457 in KFLAGS.flags.h))
         {
            return "<b>错误：没有武器</b>";
         }
         var _loc1_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457));
         if(_loc1_ is Weapon || _loc1_ is Shield)
         {
            return _loc1_.get_name();
         }
         if(_loc1_ == get_consumables().W__BOOK == true)
         {
            return "白皮书";
         }
         _loc4_ = _loc1_ == get_consumables().B__BOOK;
         if(_loc4_ == true)
         {
            return "黑皮书";
         }
         _loc3_ = _loc1_ == get_consumables().W_STICK;
         if(_loc3_ == true)
         {
            return "回旋镖";
         }
         _loc2_ = _loc1_ == get_useables().TELBEAR;
         if(_loc2_ == true)
         {
            return "泰迪熊";
         }
         return "<b>错误：未知物品，请更新 AnemoneScene.weaponName()</b>";
      }
      
      public function victoryButtholeRape() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         get_images().showImage("anemone-getanal");
         outputText("你打量着面前的海葵。你的注意力集中在她蓝色的肉棒上；那些较小的触手里应该也有很多令人愉悦的毒液。脱下你的[armor]，你走近她，把她向后推。她的鳃从乳房上滑落，漂浮在身体两侧，露出一对可爱的乳头。你趁机抚摸她阴茎的轴部，揉搓了一下她的阴道，吸收了一些毒液，让你的手感到一阵刺痛。[pg]");
         outputText("很快，你就几乎无法忍受自己的欲火，而你情人的阴茎也变得又硬又挺。你跨坐在海葵身上，将你的[asshole]对准她色彩鲜艳的肉棒，慢慢地坐了下去。那华丽的冠状物滑入你的后庭，带来了预期的冲击，身后传来一声喘息，伴随着海葵的手移到了你的臀部。");
         if(!get_player().buttChange(get_monster().cockArea(0),true))
         {
            outputText("");
         }
         outputText("尽管你因为期待而身体僵硬，但你发现自己浑身颤抖，肌肉无力，但凭借着极大的努力，你设法集中注意力，轻轻地放低身体，享受着温暖在你的[asshole]里缓慢蔓延的感觉。你很快就到达了海葵短小肉棒的根部，停顿了一分钟；你回头看着海葵，注意到她不耐烦地咬着下唇。你在心里记下她可爱的表情，以此来激发你的想象力，然后你转过身，双手撑地，开始在她勃起的阴茎上起伏。[pg]");
         outputText("你的[asshole]已经被催情剂加热，摩擦足以让它升温到狂热的程度。你一次又一次地将自己刺穿在女孩的肉棒上，在你的直肠里拖拽出毒液和热量的痕迹。");
         if(get_player().cockTotal() > 0)
         {
            outputText("一只手不自觉地移向你的[cock]，开始撸动起来，把前列腺刺激而流出的丰沛先列腺液涂抹在[eachcock]上。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你举起一只手伸向你的" + get_player().vaginaDescript(0) + "，开始自慰。这在一段时间内满足了你，但最终你想要更多，于是抓起漂浮在你身旁水中的一束触手，将它们塞进你贪婪的小穴里，四处涂抹。这引得你发出一声充满情欲的呻吟，也让你的情人咯咯笑了起来。");
         }
         outputText("当你的[asshole]在工具上套弄时，某种事情发生了，以惊人的速度将你推向高潮……[pg]");
         outputText("你蓝色的情人现在焦躁不安，不再满足于仅仅躺在那里，她开始用自己的双手和臀部配合你的节奏抽插，将做爱的速度翻倍。她狂热的抽插强度让毒液在下一次刺入到来之前根本没有时间消散，这感觉就像你的" + get_player().assholeDescript() + "被一根巨大、滚烫的肉棒填满，尽管它保持不动，却依然在进进出出。这种感觉迅速将你推向高潮，你的[asshole]紧紧夹住海葵的阴茎");
         if(get_player().cockTotal() > 0)
         {
            outputText("当[eachcock]抽搐着射出");
            if(get_player().cumQ() < 50)
            {
               outputText("一股");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("一阵");
            }
            else
            {
               outputText("如洪流般");
            }
            outputText("的精液");
            if(get_player().hasVagina())
            {
               outputText("并且你的小穴痉挛着");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("并且你的" + get_player().vaginaDescript(0) + "在触手和你的手指周围痉挛着");
         }
         outputText("。海葵一定和你一样处于高潮的边缘，因为在你饥渴的后庭中又抽插了几下之后，她也达到了自己的高潮，将几股冰凉、浓稠的精液射入你的体内。你向后瘫倒在伴侣身上，她漫不经心地抚摸着你的[nipple]。在温暖的水中放松了几分钟后，你坐起身，将自己从海葵疲软的阴茎上推开，这从你的[asshole]中拉出了一丝精液，并引得");
         if(get_player().totalCocks() > 0 || get_player().get_gender() == 0)
         {
            outputText("一声");
         }
         else if(get_player().hasVagina())
         {
            outputText("又一声");
         }
         outputText("蓝色的女孩发出一阵咯咯的笑声。你站起身来，收拾好装备，离开前给了她一个飞吻。她的肤色变深了，她的伪装反射让她在这种示爱举动下不舒服地\'脸红\'起来。");
         get_player().orgasm("Anal");
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function tutorAnemoneKid() : void
      {
         clearOutput();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你现在欲火焚身，根本无法集中精力进行任何武器指导，海葵从你的表情中看出了这一点，你的目光在她的身体上游移；她羞得满脸通红，变成深蓝色，带着羞涩的眼神缩回了她的桶里。");
            doNext(approachAnemoneBarrel);
            return;
         }
         outputText("海葵顺从地爬出她的桶，");
         if(kidAXP() < 33)
         {
            outputText("将" + weaponNameLong() + "护在胸前。");
         }
         else
         {
            outputText("手里拿着" + weaponNameLong() + "，摆出专注的姿势。");
         }
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_useables().TELBEAR.get_id())
         {
            outputText("为了能够独立应对，她应该知道如何发挥自己的优势。尽管她可能很有潜力，但以她这样的身体去战斗，显然处于劣势。");
            outputText("[pg]在你的指导下，小海葵尽其所能地抱着她的熊。训练很严格，" + (kidAXP() < 33 ? "她经常怀疑自己，" : "") + "但她尽力吸收你教给她的一切。每一个姿势和细致的技巧都经过了有条理的详细演示，以便她能有效地学习。没过多久，她对自己的能力感到更加自信了。作为对她不断增长的技能的最后测试，你让她放下熊，直接和你较量。");
         }
         else
         {
            outputText("你花了一些时间指导小A使用你提供给她的装备的细节，然后以一场练习决斗结束。");
         }
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().PIPE.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().MACE.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().W_STAFF.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().E_STAFF.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().L_STAFF.get_id())
         {
            outputText("[pg]虽然她表现得好像不认真，而且经常收回她的挥击，但");
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().PIPE.get_id())
            {
               outputText("管子");
            }
            else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().MACE.get_id())
            {
               outputText("狼牙棒");
            }
            else
            {
               outputText("棍子");
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) != get_weapons().MACE.get_id())
            {
               outputText("的重量仍然足以让你受点瘀伤。");
            }
            else
            {
               outputText("设法让你受了很多瘀伤。");
            }
            get_player().HPChange(-5,false);
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().MACE.get_id())
            {
               get_player().HPChange(-15,false);
            }
            kidAXP(6);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().RIDINGC.get_id())
         {
            outputText("[pg]她似乎很享受用马鞭抽打你，每当她在你的[butt]或[chest]上抽出一道裂痕时，她都会向你抛媚眼并撅起嘴唇。事实上，她自己的阴茎也暴露了她的兴奋，随着她挥舞武器而上下摆动。这种羞辱");
            if(get_player().lib < 50)
            {
               outputText("是");
            }
            else
            {
               outputText("不是");
            }
            outputText("足以阻止你产生抓住她那调皮、挑逗的脸，把它按进你胯下的下流想法。");
            get_player().HPChange(-5,false);
            if(get_player().lib >= 50)
            {
               dynStats(DynStat.Lust(5),DynStat.NoScale);
            }
            kidAXP(6);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().L_DAGGR.get_id())
         {
            outputText("[pg]这把附魔匕首很轻，海葵单手就能使用。她很好地练习了用它拨开你假装的攻击，同时用另一只手伸过来刺激你。为了保险起见，每当她的抚摸让你分心脸红时，她就会用刀刃轻轻划你一下。");
            get_player().HPChange(-5,false);
            dynStats(DynStat.Lust(10),DynStat.NoScale);
            kidAXP(5);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().DAGGER.get_id())
         {
            outputText("[pg]这把匕首很轻，海葵单手就能使用。她很好地练习了用它拨开你假装的攻击，同时用另一只手伸过来刺激你。为了保险起见，每当她的抚摸让你分心脸红时，她就会用刀刃轻轻划你一下。");
            get_player().HPChange(-5,false);
            dynStats(DynStat.Lust(5),DynStat.NoScale);
            kidAXP(5);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().B_SWORD.get_id())
         {
            outputText("[pg]这把剑似乎在空中飞舞，仿佛它的重量和平衡对你的女儿来说是完美的。她对你进行了几次顽皮的刺击，虽然你挡开了除了最后一次之外的所有攻击，但那一次还是穿过了你的防守。当剑尖刺向你的胸膛时，女孩的眼睛睁得大大的，但它在扭开之前几乎没有造成任何划痕。");
            outputText("[pg]也许海葵有点太堕落了，无法有效地使用这把剑？");
            get_player().HPChange(-1,false);
            kidAXP(-2);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().RRAPIER.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().JRAPIER.get_id())
         {
            outputText("[pg]这把刺剑对女孩来说很轻，但你需要提醒她很多次，她才能以应有的谨慎和风格来处理这把细长的剑刃。她似乎把它看作是一个用来打你屁股的工具，只是碰巧有一个尖头。");
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().L__AXE.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().L_HAMMR.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().WARHAMR.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().L__AXE.get_id())
         {
            outputText("[pg]她几乎举不起你给她的武器，尽管有一段时间她确实设法用地面支撑一端，并倾斜手柄，巧妙地挡开了你的攻击。你用假动作分散了她的注意力，把她和武器分开，带着充满顽皮威胁的微笑向前走去……这时她尖叫着把你向后推，导致你被武器绊倒，轰隆一声摔倒在地。");
            kidAXP(-4);
            get_player().HPChange(-5,false);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().KATANA.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().S_BLADE.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().SCIMITR.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().B_SCARB.get_id())
         {
            outputText("[pg]轻剑和轻盈的海葵似乎很相配，在你的指导下，她实际上设法用它做出了几个灵巧的动作。其中一个动作有点太灵巧了，因为她没能控制住自己的挥舞，划出了一道长长的伤口，砍到了你的[leg]。");
            kidAXP(4);
            get_player().HPChange(-20,false);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().SPEAR.get_id())
         {
            outputText("[pg]长矛的自然长度和海葵种族喜欢靠近并通过触摸交流的心态不太吻合；尽管你反复指导，她还是握在手柄的一半以上，并在近距离用很小的力气戳你，武器闲置的一端在她身后在空中摇摆。");
            kidAXP(-1);
            get_player().HPChange(-5,false);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().WHIP.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().SUCWHIP.get_id())
         {
            outputText("[pg]一旦她认定鞭子的目的是缠住东西，而不是抽打和撕裂血肉，鞭子似乎就成了她手的延伸。她一次过分热情的挥舞让你们<i>俩</i>都被缠在了鞭子里；她娇小的身体紧贴着你，羞得满脸通红。她心烦意乱地挣扎着想松开束缚，结果除了把她敏感的部位在你的部位上摩擦之外，什么也没做成。");
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().SUCWHIP.get_id())
            {
               outputText("恶魔的附魔这时启动了，随着她的欲望达到顶峰，她的脸色变得更深了，你的欲望也一样。");
            }
            outputText("当她的肉棒变硬并停止挣扎时，你感觉到一个尖端顶在你的腹股沟上；她开始在兴奋中公开呻吟。当她放松下来时，鞭子的线圈终于松开，足以让你脱身。");
            dynStats(DynStat.Lust(10),DynStat.NoScale);
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().SUCWHIP.get_id())
            {
               dynStats(DynStat.Lust(10),DynStat.NoScale);
            }
            kidAXP(6);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().S_GAUNT.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().H_GAUNT.get_id())
         {
            outputText("[pg]海葵戴着护手很轻松舒适，但似乎不明白要攻击她需要握紧拳头并挥舞它们，无论你告诉她多少次。她最多只能用指关节上的金属将你的一些假装刺击拨开。");
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().W_STICK.get_id())
         {
            outputText("[pg]女孩盯着棍子，仍然不明白你打算让她怎么用它。最后一次，你从她手中拿过武器，做了一个投掷的动作，然后还给她。她再次看了看武器，又看了看你，然后把它扔向你的头。当它发出“砰”的一声撞击，你的视线震动时，她捂着肚子大笑起来。");
            get_player().HPChange(-10,false);
            KFLAGS.flags.remove(457);
            kidAXP(5);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_shields().DRGNSHL.get_id())
         {
            outputText("[pg]你的门徒对盾牌适应得很好，躲在它后面就像……嗯，就像一个便携式水桶。甚至她从上面偷看的方式也让人想起。她有效地利用了她的掩护，无情地向前推进，并进行轻柔的头锤，将毒液传播到未受保护的区域。");
            kidAXP(5);
            dynStats(DynStat.Lust(10),DynStat.NoScale);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().W__BOOK.get_id())
         {
            outputText("[pg]一部分是识字训练，一部分是魔法指导，你在这本书上的进展非常缓慢。在花了将近一个小时试图让海葵集中注意力在文字上之后，她终于设法在她面前的书页上引起了一小道白光——这时她尖叫着扔下书，用手臂护住头，向后退去。");
            kidAXP(-5);
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().B__BOOK.get_id())
         {
            outputText("[pg]女孩专注地和你坐在一起，头靠在你的手臂上，你教她唤起书中公式所需的单词。然而，当你建议她尝试一个时，她睁大眼睛摇了摇头。你坚持要她试，于是你站开，双臂交叉。海葵羞得满脸通红，只好把注意力集中在你的胯部，嘴里无声地念着音节。过了一会儿，你真的感觉到她盯着的地方有一股小小的欲望之火。女孩紧张地咯咯笑着，把目光移开，而你则脸红了，你的衣服");
            if(get_player().hasCock())
            {
               outputText("变紧了");
            }
            else if(get_player().hasVagina())
            {
               outputText("变湿了");
            }
            else
            {
               outputText("成了阻碍");
            }
            outputText("……尽管她双腿之间的那个部位仍然指着你。");
            dynStats(DynStat.Lust(20));
            kidAXP(4);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().S_BLADE.get_id())
            {
               outputText("[pg]在你的坚持下，海葵试图拔出那把嗜血的军刀。但当她把它从刀鞘里拔出来时，它猛地从她手中挣脱，划过她的大腿，然后哐当一声掉在地上，旋转着飞远了。当浓稠透明的液体从伤口渗出时，她震惊地用双手捂住嘴，用可怜巴巴、湿润的眼睛抬头看着你。");
               KFLAGS.flags.remove(457);
               kidAXP(-5);
               get_inventory().takeItem(get_weapons().SCARBLD,get_camp().returnToCampUseOneHour);
               kidAXP(-5);
               return;
            }
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().FLINTLK.get_id())
            {
               outputText("[pg]海葵女孩仿佛已经知道如何使用枪支，她轻松地扣动扳机，向你发射了一连串子弹！");
               if(get_silly())
               {
                  outputText("砰砰砰！");
               }
               if(get_player().get_spe() >= 70)
               {
                  outputText("多亏了你的速度，你轻松地躲过了子弹！");
               }
               else if(get_player().get_spe() >= 40 && get_player().get_spe() < 70)
               {
                  outputText("你试图躲避朝你飞来的子弹。你成功躲开了一些，但不幸的是，你还是被击中了。你看到自己流血了。你叫她停下，她乖乖听话了。");
                  get_player().HPChange(-10,false);
               }
               else
               {
                  outputText("你尽力躲避，但根本躲不开。海葵看到你流血时停止了射击，并给了你一个羞涩的笑容。");
                  get_player().HPChange(-40,false);
               }
               kidAXP(5);
            }
            else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().CROSSBW.get_id())
            {
               outputText("[pg]海葵女孩仿佛已经知道如何使用弩，她轻松地拉动控制杆，向你发射了一支弩箭！她重新装填弩箭，再次射击。");
               if(get_player().get_spe() >= 60)
               {
                  outputText("多亏了你的速度，你轻松地躲过了飞来的弩箭！");
               }
               else if(get_player().get_spe() >= 30 && get_player().get_spe() < 60)
               {
                  outputText("你试图躲避朝你飞来的弩箭。你成功躲开了一些，但不幸的是，你还是被击中了。你看到自己流血了。你叫她停下，她乖乖听话了。");
                  get_player().HPChange(-10,false);
               }
               else
               {
                  outputText("你尽力躲避，但根本躲不开。海葵看到你流血时停止了射击，并给了你一个羞涩的笑容。");
                  get_player().HPChange(-40,false);
               }
               kidAXP(5);
            }
            else
            {
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_weapons().FLAIL.get_id())
               {
                  outputText("[pg]女孩毫不费力地举起连枷，你教她如何使用这种武器。然而，在挥舞了几十次之后，她不小心用带刺的铁球打到了自己，呜咽着看着你。你叫她停下；也许这不适合她？");
                  get_player().HPChange(-10,false);
                  kidAXP(-2);
                  return;
               }
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_useables().TELBEAR.get_id())
               {
                  outputText("[pg]小A转过身，把熊整齐地靠在她的桶上，并向你展示了她最坚定的表情。你做好了准备。她冲过来，张开双臂，紧紧地抱住了你的身体！女孩咯咯地笑着，你也回抱她，用脸蹭了蹭她的头。");
                  kidAXP(5);
               }
               else
               {
                  outputText("[pg]小A怎么也学不会如何使用你给她的" + weaponName() + "。你不得不为了解释而多次中断练习，以至于你们根本没有进行任何对练。");
               }
            }
         }
         if(get_player().get_HP() < 1)
         {
            outputText("[pg]伴随着一声呻吟，你仰面躺下，闭上了眼睛。仿佛从很远的地方，你听到了");
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) != get_weapons().S_GAUNT.get_id() && FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) != get_weapons().H_GAUNT.get_id())
            {
               outputText("什么东西掉在地上的砰砰声和");
            }
            outputText("海葵的喘息声，然后世界离你远去。");
            outputText("[pg]<b>八小时后……</b>");
            outputText("[pg]你睡眼惺忪地睁开眼睛，看到一张熟悉的倒置的蓝色脸庞。过了一分钟，你的大脑才重构了你失去意识前发生的事情；一旦你的表情流露出一丝理解，小A就羞涩地向你打招呼。");
            outputText("[pg][say: 嗯……嗨。]");
            get_player().sleeping = true;
            doNext(get_camp().returnToCampUseEightHours);
            get_player().createStatusEffect(StatusEffects.PostAnemoneBeatdown,0,0,0,0);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,758) > 0 && kidAXP() >= 40 && get_player().get_lust() >= get_player().maxLust())
         {
            if(kidASex())
            {
               return;
            }
            if(kidAXP() >= 40 && get_player().get_lust() >= get_player().maxLust())
            {
               outputText("[pg]你仰面瘫倒，在干燥的空气中喘息着你的情欲。女孩起初很害羞，但随着你没有反应，她越来越自信，把手伸进你的衣服，摸向你的胯部。当她的手指最初摸到时，她停了下来，睁大了眼睛");
               if(get_player().hasCock())
               {
                  outputText("太大的东西");
               }
               else
               {
                  outputText("没用的东西");
               }
               outputText("来缓解你的负担，然后带着一丝绝望继续寻找。最后，在彻底的摸索之后，她抽回了手，惊愕地咬着嘴唇。");
               outputText("[pg]她似乎做出了决定，伸出手歉意地拍了拍你的头，然后站起来走回她的桶里。");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            if(get_player().level < 10)
            {
               var _temp_1:* = get_player();
               _temp_1.XP = _temp_1.XP + 30;
            }
            get_player().changeFatigue(10);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) >= 5 && get_game().time.hours > 10 && get_game().time.hours < 18 && Utils.rand(4) == 0)
            {
               kidABabysitsCows();
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) == 1 && get_game().time.hours > 10 && get_game().time.hours < 18 && Utils.rand(4) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,757,2);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) == 2)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,757,1);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.AnemoneArousal))
         {
            if(get_player().get_pregnancyIncubation() > 1)
            {
               get_player().removeStatusEffect(StatusEffects.AnemoneArousal);
               outputText("<b>你体内那个像海葵一样的生物强加给你的近乎持续的兴奋终于消退了。你把手指伸进体内，惊奇地发现——它不见了！你不确定它是滑出来了，还是你的身体不知怎么地把它吸收了，但能有一个更清醒的头脑真是太好了。</b>[pg]");
            }
            else if(!get_player().hasVagina())
            {
               get_player().removeStatusEffect(StatusEffects.AnemoneArousal);
               outputText("<b>你体内那个像海葵一样的生物强加给你的近乎持续的兴奋终于消退了。你不确定它是因为你的阴道被移除而被吸收了，还是在这个过程中逃脱了，但能换个清醒的头脑真是太好了。</b>[pg]");
            }
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function takeOutOfAnemone() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你把物品拿了回来。");
         var _loc1_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457));
         if(get_camp().isGuard("小A"))
         {
            outputText("你的海葵女儿如果没有武器，晚上就无法保护你。如果你想让她守卫，你需要给她一把新武器，并告诉她晚上再次守卫。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,456,0);
         }
         get_inventory().takeItem(_loc1_,approachAnemoneBarrel);
         KFLAGS.flags.remove(457);
      }
      
      public function spiderOvipositAnAnemone() : void
      {
         clearOutput();
         get_images().showImage("anemone-egg");
         outputText("随着女孩的抵抗减弱，");
         if(get_player().get_HP() < 1)
         {
            outputText("眼睛因疲劳而无法聚焦");
         }
         else
         {
            outputText("两根手指急切地插入她的小穴");
         }
         outputText("，你向她逼近。你的腹部向前弯曲，产卵器官滑出，滴着黏液落入水中，发出轻微的“噗通”声；女孩尽管觉得奇怪，但还是被迷住了，坐起身来，爬上前去触摸它。");
         outputText("[pg]当她冰凉湿润的手指触碰到你产卵管敏感的末端时，你忍不住挤出了一大团令人陶醉的润滑液。她好奇地用手掌接住，然后举到唇边，用舌头舔了舔。她的脸皱成一团，小巧的长春花色三角形舌头从嘴里伸出来，像个孩子一样摇着头喊道：[say: 噫！]");
         outputText("[pg]这可不是你想听到的答案。当你将滴着液体的管子倾向她时，她试图逃跑，翻过身子，手脚并用地在水里扑腾。你可不吃这一套，伸手抓住了她的脚。她尖叫着，用触手抽打你，其中一下带有毒液的抽打擦过你的手臂，让你感到一阵刺痛——其余的则无害地落在了坚硬的甲壳上。然而，当你靠近她真正准备产卵时，它们会是个麻烦……除了先把难办的部分解决掉，别无他法。");
         outputText("[pg]你迎难而上，双手抓住她扭动挣扎的头发，将其拉紧，然后用最前面的腿引导喷出的一股丝线将其套住。你的吐丝器在她的头发上编织出长长的交叉丝线来束缚她——在上面喷洒白色粘稠的丝线——这种感觉变得越来越性感，因为她的毒液通过你的双手渗入了你的血液");
         if(get_player().hasCock())
         {
            outputText("，随着[eachCock]的肿胀，你的[armor]也变得紧绷起来");
         }
         else if(get_player().hasVagina())
         {
            outputText("，你的[vagina]在空气中收缩时留下的润滑液弄湿了你的[armor]内部");
         }
         outputText("；你必须强迫自己完成工作，然后才能沉迷其中。完成束缚后，你松开了她的触手。它们像一条长长的、可爱的马尾辫一样在她身后聚成一团，只有末端可以自由扭动。当她意识到这一点时，她的行为发生了戏剧性的变化。");
         outputText("[pg][say: 解开，]海葵呜咽着，拍打着水面，转过头试图够到丝带。[say: 解开！]");
         outputText("[pg]即使她的手脚自由，头发被绑住似乎也给海葵带来了创伤……你试探性地束缚住她的双手，她泪眼汪汪地看着你；一滴眼泪真的从一只眼睛里掉了下来，顺着她的脸颊滚落。[say: 解开……]她撅着嘴恳求道。[say: 求你了？]");
         outputText("[pg][say: 很快，]你回答道。首要任务是毫无阻碍地清除腹部不舒服的压力");
         if(get_player().cor < 60)
         {
            outputText("，尽管她那可爱又有点超现实的小狗般的眼睛在恳求你不要这样做");
         }
         outputText("。[say: 让我先完成我需要做的事情。]");
         outputText("[pg]女孩皱着眉头摇了摇头。[say: 不……]她坚持说，[say: 先解开！]好吧，这绝对不可能；她只会用毒液淹没你，然后");
         if(get_player().get_gender() > 0)
         {
            outputText("直奔你的");
            if(get_player().hasCock())
            {
               outputText("肉棒");
            }
            else
            {
               outputText("小穴");
            }
            outputText("，留下");
         }
         else
         {
            outputText("留下");
         }
         outputText("你拿着一袋……可以说是卵。你下定决心，跨坐在她身上，将她马尾辫松散扭动的末端无害地压在你甲壳状的下腹部，并将你的一些重量压在她的背上，迫使她的双手放在身下。");
         outputText("[pg][say: 只要一分钟，]你咕哝着，用你的产卵工具寻找她的小穴。触角的抚摸和毒液的刺痛告诉你，你已经找到了它，你向前挺进，刺穿了蓝色女孩的小穴。");
         outputText("[pg]她对此感到惊讶，呻吟着，你伸手用双手托住她的下巴，抬起她的脸看着你。[say: 没那么糟，对吧？]你逗她。当你将产卵管推向她的入口时，海葵的嘴巴无言地张开，她外阴上粗糙的蓝色触角向内弯曲，随着你的抽出描绘出线条，让你们交缠的身体一阵颤栗。");
         outputText("[pg][say: 哦……]她叹息着，在你身下放松下来。[say: 还、还要……]女孩现在已经完全忘记了她的头发，被情欲吞噬了。当你抽插时，她的小穴湿漉漉地紧贴着你的产卵管；她没有足够的力气夹紧这根滑溜溜的器官，她的挤压只会让你插入的通道变得更紧，当你在她体内摩擦时，还会刺激到顶端。这种感觉超乎你的想象，你的第一颗卵子被推入位置，顺着输卵管平稳地滑入她的花径。");
         outputText("[pg][say: 啊——啊！]当它进入时，她大叫起来。海葵的通道在你的高潮中荡漾，在她的身体下方，你看不见的地方，她蓝色的小鸡巴将精液滴入湖中。当你的产卵管塞满她紧致的阴道时，她的手肘弯曲了，但你抓住她的下巴，防止她脸朝下掉进水里；她充满爱意地抬头看着你，眼中闪烁着深情的光芒。");
         outputText("[pg][say: 别担心，]你低语道，");
         if(get_player().get_gender() > 0)
         {
            outputText("一边用一只手解开你的[armor]，");
         }
         outputText("[say: 绝对还有更多。]你说话的时候，接下来的两颗卵子滑入她体内，让她的身体一阵抽搐。她的小穴再次痉挛，将你的产卵管包裹得更紧了；你这次已经准备好迎接这种感觉，任由它在你体内回荡，逼出你湿润的高潮。你捧着她的脸，释放着自己");
         if(get_player().hasCock())
         {
            outputText("并且用你抽搐的男根射出的更多白色丝线覆盖了她的头发");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
         }
         if(get_player().eggs() >= 40)
         {
            outputText("；太多的卵子泵入她体内，以至于当她鼓胀的肚子触碰到下方温热的水面时，她微微颤抖了一下");
         }
         outputText("……最后，当你完全排空时，你放开了她，伴随着淫荡的吸吮声，将你的肉茎从她体内拔出。当她瘫倒在一侧时，一点绿色的粘液从她的小穴里滴落下来，你准备把她留在那里——肚子鼓鼓的，怀着孕，旁边水面上还漂浮着她的一缕精液。");
         outputText("[pg][say: 等、等等，]她喘息着，你转过身。[say: 解开……]乞求的海葵用绝望、恳求的目光注视着你，试图绕过身体去够她的头发。");
         if(get_player().cor < 75)
         {
            outputText("[pg]好吧，你确实说过你会的。你弯下腰，用一条尖锐的腿切断了绑住她触手的绳子，让它们再次自由活动。");
            outputText("[pg][say: 谢谢……你……]她喘息着，闭上眼睛睡着了。");
         }
         else
         {
            outputText("[pg][say: 哦，那个？我骗你的，]你说。[say: 但说真的，这很适合你。非常可爱。就留着吧。]");
            outputText("[pg]女孩用惊恐的眼神看着你离去的背影，挣扎着想把她突然变得沉重的身体拉直，去够她的头发，你走的时候还能听到她哀怨的呜咽声好一会儿。");
         }
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function repeatCowSitting() : void
      {
         spriteSelect(SpriteDb.get_s_kida());
         outputText("玛布尔从工作中抬起头，温和地看着你。[say:谢谢你的好意，[name]。我已经找人帮忙了，但如果你想去帮忙，我相信总有你能做的事。] 她指了指你肩膀后方的一个方向。");
         outputText("[pg]你顺着她视线的方向转过身，发现了你的孩子们，他们目前正在折磨你的海葵。小A正试图阻止一个孩子向另一个孩子扔小石头，而第三个孩子则跟在她后面，拽着她的手，不停地求她大声朗读一本破旧的书。看到帮助这个几乎不说话的海葵最明显的方法，你拦住了最后一个孩子，牵起她的手，把她带走了。小A设法瞥了你一眼，然后她的注意力又被那个扔石头的捣蛋鬼拉了回去。");
         outputText("[pg]这本图画书很旧了，从褪色插图里的小犬科英雄来看，它在被慷慨捐赠给你的家庭之前，可能曾经属于惠特尼。你讲着故事，在适当的地方营造出悬念和惊奇；从你女儿不怎么惊讶的反应来看，她已经听过好几次这个故事了。尽管如此，当你读完后，她还是要求你再读一遍，你照做了，并且在字里行间投入了双倍的情感；当你假装成故事书里的怪物，把她倒吊起来，借口用你“咬牙切齿的尖牙”咬她一口，在她的肚子上吹响屁时，你女儿咯咯地笑着尖叫起来。");
         outputText("[pg]没过多久，玛布尔就来找你了。[say:我的家务都做完了。你对[name]乖不乖？]");
         outputText("[pg][say:乖，妈妈，] 你的女儿回答道。[say:我让[him]把我吃掉了。] 玛布尔笑着把小女孩领走了，你也往回走。小A正拖着疲惫的身躯走向她的水桶，疲惫不堪地看着地面。当你经过时，她目不转睛地盯着你看了很久，最后简短地点了点头，算是对你的回应。");
         outputText("[pg][say:...亲爱的。]");
      }
      
      public function reallyEvictDaAnemone() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("是时候收回你的木桶了。你打手势引起她的注意，抓住海葵的上臂把她拉了起来。她困惑地看着你，但你板起脸，拉着她一路走向湖边。");
         outputText("[pg]到了岸边，你把小A推下水，指着湖心，她跪倒在浪花中。她看起来可怜极了……直到一团绿色和紫色的漩涡在她旁边浮出水面。新来的家伙高兴地向你的前房客打招呼，从后面抱住她的腰，惹得她发出一声惊呼。");
         outputText("[pg]小A转过头看着这个陌生人。[say: 嗯……嗨？]她犹豫地打着招呼。");
         outputText("[pg][say: 嗯……嗨！]另一个学着她的样子，脸上绽放出灿烂的笑容。");
         outputText("[say: 嗯……嗨！]你的海葵回应道，这次热情多了，她拉了拉新来者的一根触手作为身体接触的回应。");
         outputText("[pg]两个女孩继续用这种方式互相打招呼，她们的注意力从你身上移开了，你不知道你到底给海葵群落带来了什么样的有害模因。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeAnemoneWithPussy() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         get_images().showImage("anemone-female-fuck");
         outputText("当你欣赏着自己的杰作时，你女性一面的冲动将你的注意力集中在了海葵的阴茎上。上面那些较小的触手应该也含有大量令人愉悦的毒液。你下定决心要让它们为你所用。[pg]");
         outputText("当你靠近时，海葵茫然地抬头看着你。你伸出手，握住她的肉棒");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("在把她的手拨开后");
         }
         outputText("并开始抚摸那长着滑溜溜触手的冠部。不出所料，她的毒液流入你的手中，传递出一种热感，顺着你的手臂向上蔓延，扩散成一种温和的暖意。揉搓了几下后，你俯下身，小心翼翼地将她的阴茎含入口中。它尝起来有湖水的味道，像温暖你的手一样温暖了你的口腔；");
         if(get_monster().get_HP() < 1)
         {
            outputText("你能感觉到它变硬了，当");
         }
         outputText("你用舌头爱抚它，然后把它拔出来捏了捏。蓝色的女孩颤抖着，一滴先列腺液被挤了出来。[pg]");
         if(!get_player().isNaked())
         {
            outputText("接下来，你花时间脱下你的[armor]，确保给她一场精彩的表演；海葵则一边抚摸着自己勃起的肉棒，把先列腺液抹得到处都是，一边咧嘴笑着看你。");
            if(get_player().biggestTitSize() > 2)
            {
               outputText("你特别注意展示你的[breasts]，以极其诱人的缓慢动作脱下上衣，让每一侧乳房滑出，像熟透的果实一样悬在你们之间，然后确保诱惑地揉搓它们，以进一步唤起你们俩的性欲。");
            }
            if(get_player().hips.rating > 6)
            {
               outputText("你也充分利用了你的[hips]，轻轻扭动，炫耀你明显的曲线。");
            }
            outputText("等你完成时，海葵的胯部闪烁着她双性分泌的体液[if (isSwimming) {；那里可能和她在水下时一样湿润}]。");
         }
         outputText("你靠向海葵，给了她一个深吻，");
         if(get_player().biggestTitSize() > 2)
         {
            outputText("确保让你的" + get_player().allBreastsDescript() + "与她的摩擦，");
         }
         outputText("然后从她身上离开，然后");
         if(get_player().isTaur())
         {
            outputText("转过身[if (isSwimming) {，跪下来}]，准备好展示你那充满兽性的小穴。");
         }
         else
         {
            outputText("[if (isSwimming) {张开|向后靠在你的[legs]上。[if (tailLeg) {你|张开双腿，你}]伸出两根手指，拉开}]你的" + get_player().vaginaDescript(0) + "，表示欢迎；这是你这场性爱表演的最后一幕。");
         }
         outputText("[pg]");
         outputText("海葵毫不犹豫地领会了你的意图，[if (isSwimming) {游|爬}]到你身上，以同样的热情回吻你。");
         if(!get_player().isTaur())
         {
            outputText("你抓住她的上臂，把她拉到你身上，然后你躺在[if (isSwimming) {湖底柔软的泥土里|被太阳晒暖的浅滩上}]。");
         }
         outputText("当她将阴茎对准你的" + get_player().vaginaDescript(0) + "时，她的头发[if (isSwimming) {随着她的动作飘动，披散|披散}]在你身上，为你的身体带来热量，但与她第一次将肉棒插进来的感觉相比，这简直微不足道。");
         get_player().cuntChange(get_monster().cockArea(0),true);
         outputText("插入感与直接注入你饥渴小穴的催情剂结合在一起，产生了一种类似极乐的感觉。你再也无法集中注意力，任由海葵主导，她开始在你体内抽插，用她的先列腺液和你自己的分泌物混合涂抹在你的阴唇上。很快，你就不顾一切地淫荡呻吟起来，除了你们之间的快感，你什么都不在乎，因为你的爱人加快了速度；");
         if(!get_player().isTaur())
         {
            outputText("当她快速而用力地抽插时，她的头发在你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("[breasts]和");
            }
            outputText("[nipples]，");
         }
         else
         {
            outputText("当她深深插入你的小穴时，她的头发向前飞舞，掠过你的上半身，拂过你的肌肤。在一次掠过时，你抓住了一些头发，把它当作取悦自己的工具，用力地摩擦你的");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("[breasts]和");
            }
            outputText("[nipples]，");
         }
         outputText("让热量在你的胸前蔓延，几乎与你阴道的热度相媲美。[pg]");
         outputText("这压倒性的快感将你推向了高潮，你的" + get_player().vaginaDescript(0) + "饥渴地收缩着，紧紧包裹住海葵肉棒散发出的热量。当你高潮的阴户");
         if(get_player().vaginas[0].vaginalWetness >= 4)
         {
            outputText("用淫水浸湿了她的胯部，并且");
         }
         outputText("紧紧绞住她的阴茎，那根蓝色的肉棒热情地回应着；当它开始痉挛并喷射出精液时，她深深地顶入你的体内。当你把精液从她体内榨出时，你的伴侣张着嘴；她失去了所有的肌肉控制，头无力地垂下");
         if(get_player().isTaur())
         {
            outputText("在你的背上");
         }
         else if(get_player().biggestTitSize() < 1)
         {
            outputText("在你的胸前");
         }
         else
         {
            outputText("在你的双乳之间");
         }
         outputText("当她将几股精液射入你的子宫时。最后，她的肉棒在最后几次喷射后排空了；她射了很多，你的女性部位感到愉悦的充实。你们俩在那里躺了一会儿，直到她恢复了足够的体力，才从你体内滑出。当她拔出时，一串精液从你被蹂躏的小穴中滴落，与[if (!isSwimming) {下方的}]水混合在一起.[pg]");
         outputText("解了痒之后，你又给了她一个吻，让她吃了一惊。当你收拾衣服时，她羞涩地对你微笑，然后[if (!isnaked) {当你开始重新穿衣服时}]，悄然[if (isSwimming) {悄然潜入|滑入}]水里。");
         anemonePreg();
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeAnemoneWithDick() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         get_images().showImage("anemone-male-fuck");
         if(get_player().cockThatFits(36) >= 0)
         {
            _loc1_ = get_player().cockThatFits(36);
            outputText("你[if (hasarmor){隔着[armor]}]用力揉搓着自己，打量着海葵；你的视线顺着她的躯干向下游移，落在了她双腿间那道蓝色的缝隙上");
            if(get_monster().get_lust100() >= 100)
            {
               outputText("，她正用那只没在抚摸自己肉棒的手把玩着那里");
            }
            outputText("。解开衣物，你抚摸着[eachcock]直到完全勃起，然后走向她。海葵抬头看着你，依然有些迷糊；接着，当你站在她面前时，她向前倾身，诱人地张开了嘴。[pg]");
            outputText("你对她如此渴望你感到好笑，但还是摇了摇头。海葵闭上嘴，疑惑地看着你。[say:不要吗？]她问道。直到这时，她才顺着你的目光看向自己的小穴。当她意识到你的意图时，她脸上的皮肤变暗了一些……从她接下来给你的羞涩眼神来看，这原来是脸红了！[say:嗯。]海葵的手指");
            if(get_monster().get_HP() < 1)
            {
               outputText("移到她阴道的嘴唇上，并且");
            }
            outputText("拉开她羽毛状的阴唇，露出天鹅绒般的内部。[say:好吧……]她吞吞吐吐地说。你急忙接受了邀请，跪下来抓住她的臀部，然后引导你的" + get_player().cockDescript(_loc1_) + "进入她。[pg]");
            outputText("在回味了片刻这种感觉后，你将阴茎完全推入，引得你的伴侣发出一声娇喘，双眼也随之睁大。");
            if(get_player().cockTotal() > 1)
            {
               outputText("当你完全推入她体内时，你的另一根阴茎");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("摩擦");
               if(get_player().cockTotal() == 2)
               {
                  outputText("");
               }
               outputText("到了她小穴周围的触须。出乎意料的是，这些触须也含有她触手上的毒刺细胞，仅仅这一击，[eachcock]就剧烈地跳动起来，将先列腺液挤满了她的腹股沟。她伸手下去把玩着它");
               if(get_player().cockTotal() > 2)
               {
                  outputText("，还有它们，");
               }
               outputText("随着你开始抽插。");
            }
            outputText("随着你展示出你所知道或能想象到的所有技巧，这场性爱正式开始；海葵似乎对你的表现越来越印象深刻，她娇喘着、呻吟着，用手和头发缠绕着你的臀部，用化学物质刺激你，鼓励你继续。她的小乳房也跟着跳动");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("与你同步");
            }
            outputText("；偶尔的跳动会拂开她的鳃，让你瞥见诱人的乳头。");
            if(get_player().balls > 0)
            {
               outputText("随着你的抽插越来越快，你的[sack]开始拍打她小穴边缘那些痒痒的、有毒的触须，随着春药在你的[balls]中积聚，你的阴囊变得越来越热。你的身体以肿胀作为回应，每一次拍打都让你的阴囊感觉更大更紧。");
            }
            else if(get_player().getClitLength() >= 6)
            {
               outputText("随着你在这个蓝色女孩体内的抽插让你兴奋起来，你的" + get_player().clitDescript() + "开始充血肿胀。很快，它就勃起得如此厉害，以至于一次特别猛烈的抽插将它挤压到了她阴唇底部的触须上，带来了一阵几乎让你崩溃的电击感。海葵的遐想被你暂时的停顿打断，她低下头。注意到从你的" + get_player().vaginaDescript(0) + "中伸出的巨大女孩鸡巴，她伸手到两腿之间，弹了一下顶端，带着施虐的顽皮笑容咧嘴笑着。你的眼睛因此而交叉，让她陷入了一阵咯咯的笑声。虽然被激怒，但这种对你[clit]的虐待也让你兴奋，你将拇指移到她自己的蓝色小豆豆上，开始弹拨它作为报复，同时重新开始抽插。");
            }
            outputText("[pg]");
            outputText("海葵的眼睛翻白，她先达到了高潮，臀部颤抖着，阴茎喷出一团精液，顺着一侧流下。");
            if(get_player().hasPerk(PerkLib.Flexibility))
            {
               outputText("你俯下身，在海葵继续高潮时，将她的阴茎含入自己口中，吞咽着那冰凉、滑溜的精液——它的味道并不像你希望的那样咸腥，而是有些淡淡的藻类味道。海葵稍微恢复了理智，茫然地看着你，似乎无法理解为什么有人会想喝<i>她</i>的精液，而不是反过来。作为回应，你的眼睛里闪烁着愉悦的光芒，你吸吮并吞下了她最后的精液。");
            }
            outputText("你自己的高潮来得稍微晚一些，但她小穴痉挛的肉壁尽力帮助你达到顶点，她阴唇边缘的触须也以同样的节奏在你的[cocks]上蠕动，注入了它们最后的毒液。伴随着最后一次深深的抽插，[eachcock]在她的阴道内爆发。");
            if(get_player().cumQ() > 500)
            {
               outputText("即使在她的痉挛停止后，你仍继续向她体内倾注，将她的肚子撑大");
               if(get_player().cumQ() > 2000)
               {
                  outputText("到了惊人的尺寸。[say:哦……]她呻吟着，她的腰围膨胀到了原来纤细直径的四倍多");
               }
               outputText("。她看起来");
               if(get_player().cumQ() < 2000)
               {
                  outputText("完全");
               }
               else
               {
                  outputText("极其");
               }
               outputText("像怀孕了一样，当你结束时，她蓝色的小阴茎从肿胀的肚子下面探出来……实际上，这看起来还不错。这个想法让你有点兴奋。");
            }
            outputText("当最后一滴精液被挤出后，你拔出了你的" + get_player().cockDescript(_loc1_) + "，[if (!isSwimming) {在湖水中冲洗干净。你}]收拾好装备，而海葵则捂着肚子，平静地微笑着，凝视着天空。");
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("你[if (hasarmor){隔着[armor]}]用力揉搓着自己，打量着海葵；你的视线顺着她的躯干向下游移，落在了她双腿间那道蓝色的缝隙上");
            if(get_player().get_lust100() >= 100)
            {
               outputText("，她正用那只没在抚摸自己肉棒的手把玩着那里");
            }
            outputText("。解开衣物，你将[eachcock]抚弄至完全勃起，然后走向她。海葵抬头看着你，眼神仍有些迷离；接着，当你站");
            if(get_player().get_tallness() > 48)
            {
               outputText("在");
            }
            else
            {
               outputText("在");
            }
            outputText("她面前时，她睁大了眼睛，因为她看到了你那惊人数量的肉棒。[pg]");
            outputText("你对她被你惊呆的样子感到好笑，左右摇晃着你勃起的[cocks]。海葵顺从地看着它摆动，就像看着催眠师的钟摆；她所有的意识暂时被转移，嘴巴反射性地张开。你用一只手推着肉棒，将顶端相对她的身体向下移动，饶有兴致地看着女孩试图让她的嘴与它保持在同一水平线上，直到它低得超过了她脖子的极限，才让她从恍惚中惊醒。她闭上嘴，疑惑地看着你。[say:不？]她问道。你微微向前推，用[cock]的头部撞击她的<i>阴阜</i>作为回答。当她意识到你的意图时，她脸上的皮肤变暗了一些……从她接下来给你的羞涩一瞥来看，那原来是脸红了！[say:嗯。]她担忧地研究了一会儿，然后她的本能接管了身体，海葵的手指");
            if(get_monster().get_HP() < 1)
            {
               outputText("移到她阴道的嘴唇上，并且");
            }
            outputText("拉开她羽毛状的阴唇，露出天鹅绒般的内部。[say:好吧……]她说道，显然对这样做的明智性感到不确定。你示意她躺下，尽可能高地抬起她的小穴以减小角度，然后试图将你的[cock]引导进她体内。");
            if(get_player().get_tallness() > 84)
            {
               outputText("最后，在甚至跪下来使自己与她对齐之后，你开始向里推进。");
            }
            outputText("[pg]");
            outputText("最初的几英寸进展缓慢，因为你试图将这个蓝色女孩大约人类大小的小穴撑开，以容纳你超乎常人的粗壮。当你努力将你" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "的冠部推入而不弯曲肉棒时，她露出了担忧的表情。不过，女孩的身体证明比你预期的更有弹性；随着你的每一次推进，她的阴道承受了更多的宽度，却没有受到任何明显的伤害。最终，你将你" + get_player().cockDescript(0) + "的头部送入她体内，并试探性地抽插了一下以测试她的深度。你滑入她体内的深度令人惊讶，你巨大的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "在她的骨盆处顶出了一个凸起；海葵已经抛开了担忧，正幸福地捏着自己的乳头。你将海葵的腿夹在腋下，开始在她身上抽插，享受着至少将你那笨重工具的一部分放入某人体内的感觉。你的蓝色伴侣在你操她时发出可爱的呻吟，这让你咧嘴一笑，但你的大部分注意力都集中在保持[cock]的角度上。当你专注于抽插时，你逐渐注意到那个凸起随着每次推进在她的骨盆上滑得更高……现在几乎到了她的胃部！你迅速下定决心测试她不同寻常的生理结构，紧紧抓住她的腿，在每次推进时都用力推。海葵现在也像你一样专注地追踪着代表你" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "的凸起的进展；当你的头部在她胸前双乳之间向上推时，她将它们挤压在凸起上，隔着皮肤在肉棒上按摩它们。");
            if(get_player().cocks[0].cockLength > 60)
            {
               outputText("这画面和刺激激发了你更加卖力，你更用力地推入她体内，直到你的[cock]滑入她的喉咙，将她纤细的脖子撑大到正常宽度的两倍。当压力迫使她的头向后仰时，海葵的嘴反射性地张开，仿佛要作呕，但她并没有停止呻吟或在你身上摩擦。这似乎是你所能达到的最深处了；你肉棒的顶端现在正抵在她的下巴底部。");
            }
            outputText("[pg]");
            outputText("因为将你的[cock]插得如此之深而感到异常高兴，你开始大幅度地抽插，交替进行巨大的前后抽动和臀部旋转，将你压在伴侣的两侧。海葵");
            if(get_player().cocks[0].cockLength > 60)
            {
               outputText("，尽管由于她身体前方隆起的巨大凸起而无法看向除了头顶以外的任何地方，");
            }
            outputText("显然很享受这种待遇；很快她开始在高潮中抽搐，她的小穴在你" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "的根部痉挛，将有毒的触手弹入其中，同时她用手揉捏着自己的乳房。她的身体试图抽搐，使你的" + get_player().cockDescript(0) + "微微弯曲，而她被忽视的肉棒喷出了一小股珍珠般的精液，落在她身体中央凸起的线上，顺着滚落形成了一条小小的痕迹。她扭动的压力和她的小穴用催情剂舔舐你肉棒的感觉足以让你也达到高潮。你的[cock]抽搐着，当你将精液卸入你的蓝色伴侣体内");
            if(get_player().cumQ() > 500)
            {
               outputText("直到它撑鼓了她的脸颊");
            }
            outputText("。");
            if(get_player().cumQ() > 1500)
            {
               outputText("最终她无法容纳你射出的巨大精液量，它化作白色的喷雾从她嘴里喷发出来。一股接一股的精液射入然后流出她体内，从她松弛的嘴里滴落，顺着她的脸流下，直到她的头发被精液覆盖。");
            }
            outputText("她趁机沿着你肉棒的长度挤压，尽可能多地挤出你所能提供的精液，同时在液体注入时发出狂欢般的呻吟。");
            outputText("[pg]");
            outputText("最终，你和她都精疲力竭，瘫软下来。你把你的[cock]从她体内拔出，发出一声长长的、湿润的吸吮声。当你穿好装备，走上沙滩时，");
            if(get_player().cumQ() < 500)
            {
               outputText("她的双手依然迷迷糊糊地在双乳之间游走，那里曾是你的肉棒停留的地方。");
            }
            else
            {
               outputText("她还在不停地咳嗽，吐出你精液的泡沫。");
            }
            get_player().orgasm("Dick");
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function placeInAnemone(param1:int) : void
      {
         clearOutput();
         if(get_player().itemSlots[param1].itype.get_id() == get_useables().TELBEAR.get_id())
         {
            outputText("你把毛绒玩具留在她的桶边。");
         }
         else
         {
            outputText("你把物品留在她的桶边。");
         }
         spriteSelect(SpriteDb.get_s_kida());
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,457,get_player().itemSlots[param1].itype.get_id());
         get_player().itemSlots[param1].removeOneItem();
         doNext(approachAnemoneBarrel);
      }
      
      public function mortalAnemoneeeeee() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,453) == 0 || get_player().hasItem(get_consumables().MINOCUM))
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,453,FlagDict_Impl_.arrayReadInt(_loc1_,453) + 1);
            if(get_player().location == "swim")
            {
               outputText("沿着肥沃的湖底缓慢漂流，水中近乎失重的感觉让你放松下来。在这一刻，你似乎很容易就能找到简单的乐趣，你环顾四周，看着各种覆盖着岩石的树根、水草等等，直到你看到一大团粗壮的触手从一块岩石中伸出来。触手的颜色很鲜艳，有绿色、蓝色和紫色。你躺在下面，透过触手向上看，悠闲地欣赏着从触须间洒落的[sun]光，但随后你的余光捕捉到了别的东西。");
               outputText("[pg]你往植物下方看去，看到了一个屁股。深蓝色、看起来很女性化的臀部悬挂在植物和岩石之间。游到它周围，你看了看另一边，发现这株“植物”是一个女孩的头发，她正靠在石头上休息。所有的动作把她吵醒了，她用迷人深邃、不透明的眼睛盯着你。");
               outputText("[pg]海葵女孩调情地笑了笑，站了起来，然后你注意到她双腿之间有一根粗壮、正在变硬的阴茎，周围环绕着触须。她带着明显的欲望靠近了！");
            }
            else
            {
               outputText("你踏上小船，正准备解开缆绳，却被湖面下的一团鲜艳色彩吸引了注意力。当你探出船舷，想仔细看看那团摇曳的绿色和紫色时，那团漩涡开始向小船靠近，似乎在回应你的兴趣；随着距离的拉近，它变得越来越大，越来越亮。云团散开，露出一张深蓝色的迷人女性面孔。它那双不透明的眼睛从深处打量着你，颜色也随之变浅。那团令人困惑的色彩原来是她头上长出的两英寸粗的海葵触手，代替了头发！[pg]");
               outputText("海葵女孩浮出水面，调情地对你笑了笑。出于礼貌，你也回以微笑，不知道该怎么看待她，也不习惯这个地方的居民如此不具攻击性的接近。她身体的蓝色轮廓衬托出一朵鲜艳的花朵，让你进一步探出身子，因为你的注意力重新集中在她的腰部以下，你看到一圈较小的触手从一根正在变硬的阴茎头部后面向你挥舞！受到关注的刺激，海葵抓住船舷，试图把自己拉上来，但她增加的重量让你失去了平衡，把你抛出船外，落入她等待的触手中！[pg]");
               if(get_player().hasItem(get_consumables().MINOCUM))
               {
                  minoCumForAnemonieeeeez();
                  return;
               }
               outputText("最初的惊讶消退后，随之而来的是头晕目眩和轻微的兴奋感，因为她触手上的刺细胞找到了暴露的皮肤。在溺水的恐慌中，你挣脱了那团绳索般的触手，向后划水远离女孩，直到你的[feet]再次令人安心地触及湖底的浅滩，并且你离水面足够高，可以进行战斗。[pg]");
            }
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,453,FlagDict_Impl_.arrayReadInt(_loc1_,453) + 1);
            if(get_player().location == "swim")
            {
               outputText("一个长划水让你毫不费力地漂流，当你准备再次划水时，绿色的触手从下面伸出来困住你！触须一接触就刺痛了你，但在你调整姿势准备战斗时，它们没能抓住你！[pg]");
            }
            else
            {
               outputText("当你解开小船并起航时，你听到船中部传来轻柔的冒泡声。你环顾四周，只看到几根绿色的触手滑过船舷，突然向下拉，使小船倾斜，把你抛出船外，落入一个咧嘴笑的海葵的怀抱！她游在你身边，当你挣扎着游回岸边时，她给了你几次顽皮的爱抚，你已经因为有毒的接触而感到头晕目眩和兴奋了。[pg]");
            }
         }
         outputText("你正在与一只海葵战斗！");
         unlockCodexEntry(2036);
         var _loc2_:Anemone = new Anemone();
         startCombat(_loc2_);
         dynStats(DynStat.Lust(4));
         _loc2_.applyVenom(1);
      }
      
      public function minoCumForAnemonieeeeez() : void
      {
         var _loc1_:* = null as Anemone;
         spriteSelect(SpriteDb.get_s_anemone());
         outputText("最初的惊讶消退为头脑发昏和轻微的兴奋，因为她触手上的刺细胞找到了暴露的肉体。在溺水的恐慌中，你挣脱了那团绳索状的物体，向后划水远离女孩，直到你的[feet]令人安心地触碰到湖底的浅滩。当你摇摇头以清除阴霾时，你注意到你的一些物品从你的袋子里掉了出来，漂浮在水面上。海葵特别捡起了一个正在检查；一瓶牛头人精液。当液体来回晃动时，她的眼睛亮了起来，她恳求地看着你，把它抱在脸颊旁。[say: 给我？]她问道，试图让自己看起来尽可能甜美。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 0)
         {
            outputText("你想把这个瓶子当礼物送人吗？");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) != 1)
            {
               outputText("哦，见鬼，你自己的瘾还没过呢，怎么可能把那瓶药给她！你举起你的[weapon]，眼神狂野地向女孩逼近。她被你的表情吓得哆嗦了一下，扑通一声扔下了瓶子，然后恢复了镇定，后退了几步。你迅速抓起漂浮的瓶子和你剩下的东西。");
               _loc1_ = new Anemone();
               startCombat(_loc1_);
               dynStats(DynStat.Lust(4));
               _loc1_.applyVenom(1);
               return;
            }
            outputText("你上一剂药效还在，正处于兴奋状态；你想和这个女孩分享你的快感吗？这可能会带来一些有趣的事情……");
         }
         menu();
         addButton(0,"给她",giveMino);
         addButton(1,"不给",dontGiveMino);
      }
      
      public function loseToAnemone() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         var _loc1_:int = get_player().cockThatFits(36);
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你脸朝下倒在湖里，因为受伤而虚弱不堪。在你昏过去之前，你听到的最后一件事是一声微弱的[say: 什么？][pg]");
            outputText("几分钟后你醒来，感觉自己被冲到了沙滩上，浑身酸痛。[say: 你……死了吗？] 海葵还在你身边；她一定是从哪里找来了一根棍子，正坐在你旁边，小心翼翼地戳你。当你强迫自己睁开眼睛作为回答时，她发出一声惊呼扔掉了棍子，并把膝盖抱在胸前。你伤得太重，什么也说不出来，只能盯着她看，这让她更加不安。[say: 嗯……再见，] 她说着站了起来。她再次走向水里，留下你一个人恢复。");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().get_gender() == 0)
         {
            outputText("你颤抖着瘫倒在海葵面前，开始尝试脱下你的[armor]。她高兴地拍手欢呼，向你泼水。她推开你颤抖的双手，解开你的衣服，把它们从你身上扯下来……然后停了下来。你不解地看着女孩的脸，她也用同样困惑的眼神回应你。你转过头跟着她，她上下打量着你，甚至绕着你转了一圈，检查每一寸肌肤，焦急地咬着嘴唇。");
            if(get_player().biggestLactation() > 1)
            {
               outputText("检查在你的[nipples]漏出的乳汁处停顿了片刻。她用一根手指沾了一点尝了尝，结果做了个鬼脸，吐了吐舌头。");
            }
            outputText("回到正面，海葵摊开双手，疑惑地指向你空荡荡的腹股沟。你顺着她的手势看向自己光秃秃的下体，然后又抬起头。她的下唇在颤抖，而且——是的，看起来她的眼眶里开始涌出泪水。[pg]");
            outputText("你急忙开始为你的身体构造编造一个解释，但在你刚告诉她因为来到这里后发生的一些事导致你没有生殖器时，她就放声大哭起来。");
            if(get_player().cor < 33)
            {
               outputText("你本能地伸出手想安慰她，但是");
            }
            else
            {
               outputText("你得意地笑了笑，被这反转逗乐了，直到");
            }
            outputText("海葵猛地扇了你一巴掌，把你脸上的表情打得烟消云散，震得你耳膜嗡嗡作响。[say: 笨蛋！]她大喊着，猛地转过身；她转身时，触手从你身边扫过。她潜入水下，游走时还恶意地把水踢到你脸上。你吐着水，揉了揉下巴，然后站起身，晕乎乎地走回营地。");
            get_player().takeDamage(10);
            dynStats(DynStat.Lust(-20));
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().cockTotal() > 0)
         {
            get_images().showImage("anemone-male-fuck");
            if(get_player().hasCockThatFits(36))
            {
               outputText("你瑟瑟发抖，瘫倒在海葵面前，开始试图脱下你的[armor]。她高兴地拍手欢叫，溅着水花朝你走来。她推开你颤抖的双手，解开你的衣物并为你褪下，趁机伸手抚过你的" + get_player().cockDescript(_loc1_) + "。");
               if(get_player().cumQ() < 50)
               {
                  outputText("一滴");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("一股");
               }
               else
               {
                  outputText("一股稳定的");
               }
               outputText("先列腺液随着她的抚摸从里面涌了出来。她将手指触碰你敏感的尿道口，然后拉开，在空气中拉出一条长长的淫液丝。她把手指放进嘴里，品尝着你的味道；那条丝线成功地转移到了她的下唇上，随后被她用舌尖轻轻一舔弄断了。[pg]");
               outputText("她把你推得向后跌坐在脚后跟上，然后俯身靠近你的腹股沟。她的触手头发滑过肩膀向前垂落");
               if(!get_player().isTaur())
               {
                  outputText("到你的大腿上，");
               }
               else
               {
                  outputText("下来，落在你的臀腿上，");
               }
               outputText("将毒液如长矛般注入你的下半身。刺痛感温暖了你的腹股沟，更多的先列腺液从[eachcock]中漏出。她的目光锁定在一滴闪闪发光的液体上，迅速俯下身，用冰凉的小嘴包裹住你" + get_player().cockDescript(_loc1_) + "的龟头。她的舌头在你" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "的冠状沟周围舞动，清理掉那些黏糊糊的先列腺液。向");
               if(get_player().get_tallness() > 48)
               {
                  outputText("上");
               }
               else
               {
                  outputText("下");
               }
               outputText("看着你，你可以看到她眼角的笑意，尽管她的嘴紧紧地含着你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "。");
               if(get_player().cockTotal() > 1)
               {
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("你的另一根肉棒摩擦着");
                  }
                  else
                  {
                     outputText("你剩下的[cocks]摩擦着");
                  }
                  outputText("蹭着她的脸颊，在她蓝色的脸上抹上一层湿滑的液体。");
               }
               outputText("[pg]");
               outputText("她的双手从水中伸出，将两束长长垂下的头发推向你的[cocks]。她将这些触手般的发束缠绕在你的" + get_player().cockDescript(_loc1_) + "上，用一只手将它们固定住，然后开始在你的肉棒上下来回滑动。你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "因为她的注入和头发的摩擦而变得越来越热，分泌出更多的先列腺液，流进她那顺从的嘴里。");
               if(get_player().hasVagina())
               {
                  outputText("她的另一只手滑了进去");
                  if(get_player().vaginalCapacity() < 15)
                  {
                     outputText("几根手指");
                  }
                  else if(get_player().vaginalCapacity() < 30)
                  {
                     outputText("进了一半");
                  }
                  else
                  {
                     outputText("到底");
                  }
                  outputText("进入你的" + get_player().vaginaDescript(0) + "，让你的下唇感到一阵刺痛，并暴露了你的阴蒂。");
                  if(get_player().getClitLength() > 5)
                  {
                     outputText("完成这些后，她抽出手，用另一束触手缠住你的[clit]，然后开始配合她在你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "上的动作，一起套弄它。你双眼翻白，嘴巴不由自主地张开，承受着对你肿胀的阴蒂的粗暴刺激。");
                  }
               }
               outputText("[pg]");
               outputText("摩擦你阴茎的热量");
               if(get_player().hasVagina())
               {
                  outputText("和阴蒂");
               }
               outputText("很快就让你达到了高潮，第一次高潮开始在你的[cocks]中蔓延。你的" + get_player().cockDescript(_loc1_) + "射进了海葵女孩的嘴里");
               if(get_player().cumQ() > 500)
               {
                  outputText("，撑鼓了她的脸颊");
               }
               if(get_player().cumQ() > 2000)
               {
                  outputText("，浓稠的精液像丝带一样从她的鼻子里喷射出来");
               }
               if(get_player().totalCocks() > 1)
               {
                  outputText("当");
                  if(get_player().totalCocks() == 2)
                  {
                     outputText("你的肉棒射出");
                  }
                  else
                  {
                     outputText("你剩下的[cocks]射出");
                  }
                  outputText("弄得她满脸满头都是，");
                  if(get_player().cumQ() < 500)
                  {
                     outputText("在她蓝色的皮肤上画出像乐谱一样的图案");
                  }
                  else if(get_player().cumQ() < 2000)
                  {
                     outputText("把她的皮肤染成白色，她退缩着，紧紧闭上眼睛");
                  }
                  else
                  {
                     outputText("把她的整个上半身都染白了，精液流下来，直到乳白色的扇形在你周围的水中散开");
                  }
               }
               outputText("。海葵贪婪地吞咽着，每一次抽插都将精液泵入她的口中");
               if(get_player().cumQ() >= 500)
               {
                  outputText("，她紧绷的蓝色腹部随着精液的注入而鼓胀起来");
               }
               outputText("。[pg]");
               outputText("在海葵吞咽你的精液时，你得到了片刻令人感激的休息，但随后她的手又开始套弄起来。哦，天哪！在催情剂的重新攻势下，你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "迅速恢复了勃起");
               if(get_player().cockTotal() > 1)
               {
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("，你的另一根" + get_player().cockDescript(1) + "也紧随其后");
                  }
                  else
                  {
                     outputText("，你的其他肉棒也紧随其后");
                  }
               }
               outputText("。这个蓝色的女孩继续用她的触手头发抚摸你的私处，用舌头舔弄你的尿道，直到你又射了两次。她似乎没有任何停下来的打算，但幸运的是，你两眼一黑，瘫倒在水里。海葵半皱着眉头，耸了耸肩，将你失去知觉的身体推到了沙滩上。");
               get_player().orgasm("Dick");
               get_combat().cleanupAfterCombat();
            }
            else
            {
               outputText("你浑身发抖，瘫倒在海葵面前，开始试图脱下你的[armor]。她开心地拍着手，发出清脆的笑声，踩着水花向你走来。她推开你颤抖的双手，解开你的衣服，开始把它们从你身上扒下来，但你的[cocks]弹了出来，打在了她的鼻子上！当你笨拙地解开剩下的扣子，脱下装备时，蓝色的女孩被眼前跳动的肉棒迷住了，光滑的先列腺液从顶端渗出");
               if(get_player().cumQ() > 500)
               {
                  outputText("，汇成一股细流");
               }
               outputText("。[pg]");
               outputText("她几乎是带着敬意地抚摸着你" + get_player().cockDescript(0) + "的柱身，沿着它巨大的长度轻轻套弄。她把它拉到与视线齐平的位置，从几个角度打量着龟头。她试探性地张开嘴，将你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "含入其中，试图将你粗大的肉棒塞进那个连你被欲望冲昏头脑的心智都觉得太小的洞里。尽管她尽了最大努力，但也只能勉强让冠状沟越过她的嘴唇，不过她舌头在尿道口周围和里面来回舔弄的反射性动作让你浑身发抖，挤出了更多的先列腺液。海葵最终将你的[cock]从嘴里吐了出来，沮丧地皱起了眉头。几秒钟后，她似乎做出了决定。她把你的肉棒拨到一边，绕到你身后。她把一只手放在你的");
               if(!get_player().isTaur())
               {
                  outputText("腰上");
               }
               else
               {
                  outputText("侧腹上");
               }
               if(!get_player().isTaur())
               {
                  outputText("，另一只手把你的肩膀往下压");
               }
               outputText("。当她把你向后拉时，你被迫把自己的");
               if(!get_player().isTaur())
               {
                  outputText("双手");
               }
               else
               {
                  outputText("前腿膝盖-");
               }
               outputText("撑在身前，以免脸朝下摔倒。");
               if(!get_player().isTaur())
               {
                  outputText("你的[cock]的龟头浸入了微温的湖水中，一阵酥麻感传遍了柱身。");
               }
               outputText("在你身后，海葵已经把她那根蓝色的触手肉棒握在手里，套弄着并抚摸着顶端，挤出她自己的先列腺液并涂抹在整根肉棒上。对它的润滑度感到满意后，她向前挪动，直到她的肉棒抵在你的[ass]上。她把臀部向后拉，对准你的[asshole]，然后向前挺进，同时把你的腰向后拉。蠕动的触须滑过你的后庭，用她强效的毒液点燃了你的体内。");
               get_player().buttChange(get_monster().cockArea(0),true);
               outputText("[pg]");
               outputText("海葵女孩花了一点时间将她现在空出的手移到你的另一侧臀部，然后开始将她坚硬的肉棒抽插进你的[asshole]，每抽插几下就停下来扭动一下臀部，用她的触手按摩你的前列腺，并将毒液涂抹在上面。这种刺激让你在几分钟内就达到了极限；你的阴茎痉挛般地抽搐着");
               if(get_player().balls > 0)
               {
                  outputText("并且你的[sack]收紧了");
               }
               outputText("。这并没有逃过你蓝色情人的注意，她很快停止了抽插。被留在高潮边缘的你惊慌失措地回头看着她。从她咧嘴笑的神态来看，她似乎在盘算着什么邪恶的计划。你困惑地盯着她，直到你感觉到你的[cocks]根部传来一阵新的热量。低头一看，你发现她的触手头发已经缠绕在[eachcock]上，并且紧紧地挤压着！海葵对这个安排很满意，又开始抽插并摩擦你的前列腺，让新的温暖在你的[asshole]中蔓延。你延迟的高潮终于到来，但这个<i>事实上的</i>屌环");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("阻止了");
               if(get_player().cockTotal() == 1)
               {
                  outputText("");
               }
               outputText("任何精液流出！随着你的高潮徒劳地过去，感觉膨胀又消退，而你蓝色的伴侣依然像往常一样快乐地操着你。[pg]");
               outputText("将近一个小时，海葵继续着她的表演，甚至用她空闲的触手抚摸你肿胀的[cocks]。又有几次高潮降临又离你而去，却没有减轻你");
               if(get_player().balls > 0)
               {
                  outputText("[balls]和");
               }
               outputText("[cocks]上的压力。最终你到了无法忍受的地步，当你感觉到下一次高潮临近时，你直起身子，开始");
               if(!get_player().isTaur())
               {
                  outputText("抓挠折磨你的触手，试图用蛮力把它们从[eachcock]上撬开。");
               }
               else
               {
                  outputText("挣扎着跺脚，想要把触手甩掉，但你的手却够不到它们。");
               }
               outputText("看到你想结束她的乐趣，海葵显得有些恼火，但还是妥协了，松开了紧握你[cocks]的手。当你看到释放的途径变得清晰，喜悦之情涌上心头时，海葵趁你分心，抓住你的手臂，把你拉向她，同时把你的[legs]从你身下推开。你们俩向后倒在浅水中，[eachcock]开始以高高的弧线释放出大量积聚的精液。这");
               if(get_player().cumQ() < 500)
               {
                  outputText("细线般的");
               }
               else if(get_player().cumQ() < 2000)
               {
                  outputText("水流般的");
               }
               else
               {
                  outputText("喷涌而出的");
               }
               outputText("精液");
               if(get_player().get_tallness() < 48 && !get_player().isTaur())
               {
                  outputText("飞过你的头顶，你转过身，看到海葵正张着嘴伸出舌头试图接住它们。");
               }
               else if(get_player().get_tallness() < 84 && !get_player().isTaur())
               {
                  outputText("在空中飞舞，像雨点一样落在你们俩的脸上，落入水中时发出轻微的飞溅声。");
               }
               else
               {
                  outputText("正好落在你的");
                  if(get_player().biggestTitSize() >= 1)
                  {
                     outputText("乳房和");
                  }
                  outputText("脸上。当你从白色的阵雨中退缩时，你听到海葵在咯咯地笑。");
               }
               outputText("几分钟的高潮过后，你射出的精液比你想象的还要多，海葵在你的[asshole]上敲打着伴奏，你终于开始平静下来。海葵显然被这惊人的射精量给刺激到了，她把自己的蓝色肉棒射进了你的屁眼。她的精液温度比你的低，在你的[ass]里形成了一个凉爽的小水洼。她漫不经心地在");
               if(get_player().cumQ() >= 500)
               {
                  outputText("精液颜色的");
               }
               outputText("水中挥舞着触手，而你则排出了最后一股精液，陷入了沉睡。[pg]");
               outputText("她把你瘫软的身体从她的肉棒上推开，从你身下滑出，坐在你旁边。");
               if(get_player().get_tallness() < 48 && !get_player().isTaur())
               {
                  outputText("她打量了你一下，然后弯下腰，尽可能多地喝掉附近漂浮在水面上的精液。");
               }
               else
               {
                  outputText("她俯身在你身上，开始舔舐你身上的精液，直到你被清理干净（虽然还有点黏糊糊的）才停下来。");
               }
               outputText("吃饱喝足后，她调皮地咧嘴一笑，抓住你的[cock]，拖着你漂浮的身体向岸边游去。她把你滚到沙滩上，然后游向深水区，消失不见了。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-1));
               get_combat().cleanupAfterCombat();
            }
         }
         else
         {
            get_images().showImage("anemone-female-fuck");
            outputText("你颤抖着跪在海葵面前，开始试图脱下你的[armor]。她高兴地拍着手，欢快地叫着，溅起水花向你走来。她推开你颤抖的双手，解开你的衣服并将它们脱下，但当她只看到你的" + get_player().vaginaDescript(0) + "时，她明亮的表情黯淡了一些。");
            if(get_player().biggestLactation() > 1)
            {
               outputText("当她注意到你的[nipples]漏出的一滴乳汁时，她的表情又亮了一下。她用一根手指收集了一点尝了尝，结果却做了个鬼脸，吐出了舌头。");
            }
            outputText("[say: 没有吃的……]她若有所思地说，脸上流露出一丝失望。你抬头看着她，同情地皱着眉头。她想了一会儿，盯着你的胯部，然后露出了一个轻佻的笑容");
            if(get_player().get_tallness() < 48)
            {
               outputText("，把你拉了起来");
            }
            outputText("。[pg]");
            outputText("她坐在浅水中，脸对着你，拉着你的手把你拉向前，直到你趴在她的腿上。她长长的触手整齐地排列着，垂在她的背上，遮住了一只眼睛，让她看起来狡黠而温文尔雅。她的目光顺着你的躯干向下移动，她空出的手也紧随其后，抚摸着你的");
            if(get_player().biggestTitSize() > 1)
            {
               outputText("[breasts]和");
            }
            outputText("[nipples]，然后顺着你的肚脐滑下。它在你的外阴处停下，挑逗着你最敏感的区域，让你的[clit]肿胀起来，证明了你的愉悦。那只手开始往回游走，向上抚摸了一下你现在充血的阴蒂，让一股电流窜上你的脊背。它停在你的臀部，海葵缓慢但坚决地将你向下压，直到你的" + get_player().vaginaDescript(0) + "停在她坚硬的蓝色肉棒上方。她两根较长的触手从水中伸出，触碰你的下唇，将它们拉开，并释放出阵阵催情毒素，让你的" + get_player().vaginaDescript(0) + "痉挛般地收缩和放松。她的手继续向下施压，引导你抽搐的小穴靠近她勃起的蓝色肉棒；肉棒上的小触手向上弯曲，就像一朵向日葵转向太阳一样。在令人窒息的一瞬间，龟头接着是柱身突破了你张开的双唇的边界，这最初的侵入注入了它自己的毒液，将你推下了摇摇欲坠的理智悬崖。");
            get_player().cuntChange(get_monster().cockArea(0),true);
            outputText("[say: 哦——哦！]海葵惊呼道，因为你高潮的阴道中不断加剧的收缩让阴道壁舔舐着她的阴茎。[pg]");
            outputText("海葵松开你的手，把她的手转移到你的另一个臀部，就在你最后的意志力蒸发的时候；你开始在抽搐的蓝色肉棒上上下挺动臀部，像一个疯狂的艺术大师一样，用她的毒液涂抹你小穴的内壁。随着你" + get_player().vaginaDescript(0) + "中的痉挛随着每一次新的高潮而起伏，海葵冷酷的做作变成了一副摇摇欲坠的决心面具，这与她试图尽可能坚持下去的尝试相匹配，而你疯狂的小穴则尽最大努力把她榨干。从你们脸上的表情来看，现在还不清楚到底是谁打算蹂躏谁！最终，可怜的女孩再也受不了了，她跳动的肉棒，比进去时肿胀了将近一英寸，疯狂的触手向四面八方抽打，抽搐着释放出她的第一股精液。她的精液实际上比你被毒液挑逗的小穴要冷得多，当她将几股精液射到你的" + get_player().vaginaDescript(0) + "壁和子宫口时，形成了强烈的对比。这种二分法加上终于得到你小穴想要的东西的满足感，引发了有史以来最大的高潮，而惊呆了的海葵的下巴几乎要掉下来了，因为你的" + get_player().vaginaDescript(0) + "在她自己高潮后，比以往任何时候都更快地挤压她敏感的肉棒。[pg]");
            outputText("在经历了这最后一次高潮的几分钟后，你扑通一声向后倒在浅水中，带着幸福的表情晕了过去，漂浮在你疯狂骑乘而变得波涛汹涌的水面上。可怜的海葵花了一段时间才恢复过来，然后慢慢地把她疲软的肉棒从你的" + get_player().vaginaDescript(0) + "中拔出来，把你拖上海滩，越过潮汐线，这样你在昏迷时就不会脸朝下滚进水里。她弯下腰吻了你，描摹着你的[nipple]；她太累了，无法支撑她的头发，当她倾身释放最后一剂药物以确保你的梦里有她时，头发垂在你俯卧的身体上。");
            anemonePreg();
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(1),DynStat.Lust(10));
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function kidAXP(param1:int = 0) : int
      {
         if(param1 == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,756,FlagDict_Impl_.arrayReadInt(_loc2_,756) + param1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,756,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,756,100);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756);
      }
      
      public function kidAWatchesSharks() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("当你看着你的鲨鱼一家在浅溪里玩耍时，身后传来一阵轻柔、湿润的脚步声。当你转过身时，小A站在那里，拿着空水袋，绝望地看着流水。");
         if(kidAXP() < 40 || !(457 in KFLAGS.flags.h))
         {
            outputText("[pg]鲨鱼们也注意到了，站了起来，露出牙齿，露出宽阔、不友善的笑容。小A呜咽着，拖着脚步走到你身后，把手放在你的背上，试图把你推到她前面。你的鲨鱼女儿们饶有兴致地看着她试图移动到足够近的地方装满水袋，同时仍然把你当成掩护。她笨拙地设法盖上盖子，然后以最快的速度离开了。");
         }
         else if(kidAXP() < 40 && (FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().B__BOOK.get_id() || FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().W__BOOK.get_id()))
         {
            outputText("[pg]海葵仔细观察了一会儿，然后把水袋挂在肩上，打开了她的书。她专注于她能看懂的几个词，指着鲨鱼一家，并且");
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_consumables().W__BOOK.get_id())
            {
               outputText("用一道突如其来的白光闪瞎了她们");
            }
            else
            {
               outputText("脸涨得通红，而那些鲨鱼女孩们则尴尬地夹紧双腿，互相避开视线");
            }
            outputText("。还没等她们反应过来，她就潜入水中，装满水袋，然后逃之夭夭。");
         }
         else if(kidAXP() < 75)
         {
            outputText("[pg]鲨鱼们停下玩耍，向海葵龇牙咧嘴。她强作镇定，尽可能凶狠地将她的" + weaponName() + "举在身前，然后踏入溪流，装满水袋。偶尔会有一个鲨鱼女孩向海葵佯攻，海葵便将武器指向攻击者，直到她退下。水袋装满后，小A把它们挂在肩上，一边后退，一边仍然举着武器面对着鲨鱼们。");
         }
         else
         {
            outputText("[pg]海葵毫不犹豫，像炸弹一样冲进鲨鱼女孩中间，尖叫着溅起巨大的水花，把她们吓得四散奔逃。她迅速舀满两袋水，然后咯咯笑着跑开了，鲨鱼女孩们紧追不舍，直到她跑回营地一半的路程。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidASexMenu() : void
      {
         var cont:Boolean;
         var _g:AnemoneScene;
         menu();
         if(kidAXP() < 40)
         {
            addButtonDisabled(0,"性爱","小A现在还不够自信，无法进行性爱……也许你可以用她似乎同意的武器指导她？");
         }
         else
         {
            _g = this;
            cont = false;
            addNextButton("性爱",function():Boolean
            {
               return _g.kidASex(cont);
            }).hint("她抬起头想找点乐子。").disableIf(!get_player().hasVagina() && get_player().cockThatFits(60) < 0,"你的肉棒太大了，小A没法做任何事。").sexButton(-1);
            addNextButton("做爱",kidALovemaking).hint("拥抱你的女儿，关注她女性化的一面。").sexButton(2);
         }
         addNextButton("自慰",kidAMasturbation);
         setExitButton("返回",approachAnemoneBarrel);
      }
      
      public function kidASex(param1:Boolean = true) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!param1)
         {
            clearOutput();
            outputText("你色眯眯地对着小A微笑，手穿过她的头发，深吸一口气，任由她的毒液越来越深地影响你。她脸红了，但还是热切地看着。很快，那种令人发麻的欲望就让你无法自拔……");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) == 2 && get_player().hasCockThatFits(36))
         {
            _loc2_ = get_player().cockThatFits(36);
            outputText("[pg]");
            get_images().showImage("anemone-kid-male-vagfuck");
            outputText("你仰面瘫倒，在干燥的空气中喘息着你的情欲。一开始很害羞，但随着你没有反应，她的自信心越来越强，你的女儿把手伸进你的衣服，摸到了你的胯部。当她的手碰到你的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "的根部时，她咬着嘴唇，脸红了，然后她的决心似乎坚定了，她把它从你的[armor]里拽了出来。一开始，什么也没发生，你勃起的肉棒只是在空荡荡的空气中上下摆动，但随后你感觉到柔软的指尖引导着它，并在你的肉棒末端温暖而紧致地挤压了一下。你惊讶地抬起头，看到海葵已经骑到了你身上！她脸红了，避开了眼神接触，但当她开始扭动臀部，将你的" + get_player().cockDescript(_loc2_) + "滑入她体内更深处时，她张开嘴，露出了狡黠的笑容。");
            outputText("[pg]当你沉入她体内时，她涨红了脸，皱起了眉头，随着她的小穴被撑开，她的小肉棒在你身上变硬，她大口喘着粗气。天哪，太紧了；当你惊讶地看着她时，她的眼睛闪烁着光芒。她吃力地吞下你最后一点肉棒，然后放松下来，向前倾身，在你的胸膛上印下一个吻，以回答你未说出口的问题。这女孩居然把她的第一次留给了你？你用手肘撑起身体，把她的脸拉向你，给了她一个短暂的吻；她羞涩地笑了笑，然后挣脱你的怀抱，直起身子坐着，双手放在你的肚子上。");
            outputText("[pg]她开始扭动臀部，用你的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "搅动自己，同时旋转着，稍微放松了自己；你趁机急切地脱下你的[armor]的上衣，她用一只手将她的肉棒压在你的皮肤上作为回应，随着她的动作，她那长满触手的冠部在你的皮肤上涂抹，将有毒的热量扩散到你的躯干，同时她呻吟着，顶端在你的肚子上流口水。经过两分钟的挑逗，她再次咧嘴一笑，站起身来，将你的肉棒拔出一半；你紧张地闭上眼睛，期待着接下来会发生什么，但她只是停留在那里。你好奇地再次睁开眼睛看着她——这似乎正是她所等待的。在你放下防备的第一时间，她的眼睛闪烁着怀疑的光芒，她开始认真地骑乘你，用她那紧致得令人难以置信的小穴在你的肉棒上上下抽插；你那被感觉淹没的身体带着你飘飘欲仙，当她下降时，你开始向后推她，这样你们的腹股沟就在空中相遇了。她喘着粗气，仰着头张着嘴笑着，把还在你肚子上的手拿开，在把你操得神魂颠倒的同时抚摸着她的乳房。在每一次弹跳的最低点，她肉棒和阴道上的触须都会摩擦你裸露的皮肤，释放出新鲜的海葵毒液，让你突飞猛进地接近高潮。");
            outputText("[pg]女孩自己的情况似乎也好不到哪里去；她骑乘时，左手疯狂地撸动着她的肉棒，右手挤压着她的小乳房，同时她张着嘴，每一次抽插都发出微小的愉悦咕噜声。不出所料，她抽搐着，最后一次沉下去，因为她的肉棒痉挛了，她大叫起来。她再次将她蓝色的小肉棒压在你的肚子上，来回摩擦，同时射在你的[chest]上；与此同时，她紧握的小穴用力地拧着你的肉棒，让你的脊背发凉，引发了毒液诱发的高潮，从你体内倾泻而出。当你的肉棒排空到这个苗条的蓝色女孩的子宫里时，你的双手抓住了她的臀部，随着她抽搐时抚摸其根部的阴道触须不断释放的催情剂，你喷射精液的狂热更加强烈。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当你倾注进她体内时，被精液填满的感觉在颤抖的女孩体内引发了第二次高潮，她自己的肉棒无力地流口水到你的肚子上");
            }
            if(get_player().cumQ() >= 2000)
            {
               outputText("；即使是你女儿的第二次高潮，在长度上也无法与你的一次相提并论。你那产量惊人的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "填满了她，直到她的肚子膨胀得再也装不下更多，它开始突破她的小穴在你周围形成的密封，即使它很紧，当你排出最后的精液时，它也会以慵懒的团块喷射出来");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你另一根肉棒的精液");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("顺着你的[legs]渗下来，在她的重量下被引导到那里。");
            }
            outputText("[pg]筋疲力尽的蓝色女孩瘫倒在你的胸膛上，甚至懒得避开她自己的一滩精液，也没有把你的肉棒拔出来，很快就睡着了。当睡意袭来时，你也闭上了眼睛，尽管当她把头靠在你的胸膛上时，毒液滴入你的胸膛，确保这一幕会在你的梦中一遍又一遍地重演……");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lust(30));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) < 3)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,3);
            }
            doNext(get_camp().returnToCampUseTwoHours);
            return true;
         }
         if(get_player().hasCockThatFits(60))
         {
            _loc2_ = get_player().cockThatFits(60);
            _loc3_ = -1;
            _loc4_ = 0;
            while(_loc4_ < get_player().cockTotal())
            {
               if(_loc4_ != _loc2_)
               {
                  _loc3_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            outputText("[pg]");
            get_images().showImage("anemone-kid-male-bj");
            outputText("你仰面瘫倒，在干燥的空气中喘息着你的情欲。一开始很害羞，但随着你没有反应，她的自信心越来越强，你的女儿把手伸进你的衣服，摸到了你的胯部。当她的手碰到你的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "的根部时，她咬着嘴唇，脸红了，然后她的决心似乎坚定了，她把它从你的[armor]里拽了出来。你的肉棒末端突然感到一阵湿润，你惊讶地抬起头；那个顶着拖把头的女孩正跪在你身上，嘴里含着你的冠部，当你和她眼神接触时，她变成了你见过的最深的蓝色。");
            outputText("[pg]不过，她的羞涩显然无法抑制她的本能，因为她的嘴继续在你的" + get_player().cockDescript(_loc2_) + "上套弄，即使她垂下目光以避免与你对视。仿佛是为了隐藏自己，她齐肩的触手向前移动，垂在她的脸上，擦过你的肉棒末端，就在龟头后面。一股毒液刺穿了你的皮肤；你的眼睛翻白，随着理智的丧失，你的臀部开始轻轻地向她的嘴里挺动。");
            if(_loc3_ >= 0 || get_player().balls > 0 || get_player().hasVagina())
            {
               outputText("[pg]你感觉到她羞怯的手指再次潜入你的[armor]，并迅速找到了你的");
               if(_loc3_ >= 0)
               {
                  outputText(get_player().cockDescript(_loc3_));
               }
               else if(get_player().balls > 0)
               {
                  outputText(get_player().sackDescript());
               }
               else if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript(0));
               }
               if(_loc3_ >= 0 || get_player().balls > 0)
               {
                  outputText("，也将它从你的护甲中拉了出来");
               }
               outputText("。当你的头无力地倒在泥土中，呆呆地望着天空时，她灵巧的手指变得更加大胆，迅速开始抚摸它们的发现。");
               if(_loc3_ >= 0)
               {
                  outputText("另一只手迅速加入，抚摸着你第二根肉棒的长度，当它");
                  if(get_player().cocks[_loc3_].cockLength >= 36)
                  {
                     outputText("高耸在她的头顶");
                  }
                  else
                  {
                     outputText("颤抖着抽动进她带毒的头发里");
                  }
                  outputText("。每次它擦过她的头发，又一阵电流射向你的脊椎底部，你的两根肉棒都挤出另一团先列腺液，并很快被她吸溜干净。");
               }
               else if(get_player().balls > 0)
               {
                  outputText("一只手托住你的[ballsfull]下方，将它们举到她的下巴处，而另一只原本沿着你的肉棒轻轻画圈的手，抓起她头上的一根触手开始逗弄。");
               }
               else if(get_player().hasVagina())
               {
                  outputText("她的手指分开你的阴唇，露出你的[clit]，");
                  if(get_player().getClitLength() >= 6)
                  {
                     outputText("将它也弄了出来，让她能用手和头发像对待肉棒一样挑逗和抚摸它。");
                  }
                  else
                  {
                     outputText("以便将注意力集中在这个敏感的豆豆上。");
                  }
                  outputText("她的另一只手跟着第一只手滑进你的衣服，顺着它向下到达你的腹股沟，滑进你的小穴里轻轻地来回抽插。");
               }
            }
            outputText("[pg]她对你腹股沟的关注达到了顶峰，当");
            if(get_player().balls > 0)
            {
               outputText("你的蛋蛋收紧");
            }
            else
            {
               outputText("你的身体紧绷");
            }
            outputText("；看到这里，她猛地扑向你的肉棒，强行让龟头越过嘴唇和舌头的轻柔呵护，进入她热情的喉咙。她的头发垂在你的腹股沟周围，触碰着暴露的肌肤，她摇晃着头，喉咙起伏着，诱导你达到高潮。你的身体在你反应过来之前就做出了反应，随着你精液的喷发，你的臀部向上挺进她的脸。");
            if(get_player().balls > 0 || _loc3_ >= 0)
            {
               outputText("随着她眼中闪烁着光芒，放在你");
               if(_loc3_ >= 0)
               {
                  outputText(get_player().cockDescript(_loc3_));
               }
               else
               {
                  outputText(get_player().sackDescript());
               }
               outputText("上的手重新开始动作，用有节奏的套弄和挤压榨出一股股精液。");
            }
            else if(get_player().hasVagina())
            {
               outputText("随着她眼中闪烁着光芒，一只手径直插入了你的小穴，你寂寞的肌肉本能地夹紧了入侵者，试图绞紧她的手指。");
            }
            outputText("当你将精液射入她的喉咙时，她贪婪地吞咽着");
            if(_loc3_ >= 0)
            {
               outputText("，还有些溅到了她的头发上");
            }
            outputText("，口腔的收缩挤压着你的龟头，让你的身体一阵颤抖。");
            if(get_player().cumQ() >= 500)
            {
               outputText("一股接一股巨大的精液消失在这个饥饿女孩的食道里，毫无遗漏地滑入她的腹中，直到");
               if(get_player().cumQ() < 1000)
               {
                  outputText("你的高潮结束。");
               }
               else
               {
                  outputText("她再也装不下了，精液开始从她嘴里流出；尽管身体已经到了极限，她还是尽力吞咽着越来越多的精液。你顺势抓住她的头按向自己，指尖传来毒液的刺痛感，将你高潮的后半段全部倾注进她体内。她的脸被死死按在你的胯部，无路可逃，精液除了顺着喉咙流下别无他处，撑大了她紧绷的胃，随着她紧贴着你的双腿像气球一样膨胀，她瘦弱的屁股也被顶到了半空中。随着压力的增加，她睁大眼睛抬头看着你，试图抗议时发出的呜咽声顺着你的肉棒传了过来。");
               }
            }
            outputText("[pg]最后，你射空了最后一滴精液，软了下来；当她退开时，你感觉到她的喉咙紧紧包裹着你的龟头，伴随着一阵小小的余韵，又从顶端挤出了一点。她津津有味地将其舔舐干净，");
            if(get_player().cumQ() < 1000)
            {
               outputText("然后站起身，回到她的木桶里去消化这顿大餐。");
            }
            else
            {
               outputText("但由于肚子惊人的膨胀，她几乎无法从原地挪动。她手脚并用地勉强把自己拖到木桶边，但无论如何也爬不进去，只好瘫坐在旁边，在肚子消瘪的过程中偶尔往自己身上洒点水。");
            }
            outputText("[pg]当你疲惫地抬起头看她时，她又脸红了，但并没有移开视线；相反，她的眼中闪烁着淫靡的光芒，并对你报以一个浅浅的微笑。");
            outputText("[pg]你精疲力尽地躺下，失去了意识。");
            get_player().orgasm("Dick");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,2);
            }
            doNext(get_camp().returnToCampUseTwoHours);
            return true;
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]");
            get_images().showImage("anemone-kid-female-sex");
            outputText("你仰面瘫倒，在干燥的空气中喘息着你的情欲。起初有些害羞，但随着你毫无反应，她的胆子越来越大，你的女儿将一只手伸进你的衣服，摸向你的胯部。当她的手指只摸到你的" + get_player().vaginaDescript(0) + "时，她懊恼地停了下来，然后似乎做出了决定，拉下了你[armor]的下装。她轻柔地抚摸着阴唇，引得你发出一声轻哼，听到声音后她紧张地抬起头查看你的反应。当你继续盯着空荡荡的天空时，她抽回手，你感觉到有手将你的双腿推开。即使这样也不足以将你从情欲的迷雾中唤醒，被同样的手抬起臀部的感觉也不能。然而，当你感觉到发炎的小穴入口处传来一阵持续的、蠕动的压力时，你开始回到现实。你抬起头看向那个海葵，看到她把你的大腿举在半空中，试图调整姿势对准你，脸上写满了极度的专注。她成功了，滑入了你的体内，然后再次抬头查看你的脸……在突然的注视下，她把你的身体丢到了她的腿上，防备地把手缩到身前。");
            outputText("[pg]尽管她的反应很可笑，但现在流经你" + get_player().vaginaDescript(0) + "的毒液让你连一声轻笑都发不出来；你的臀部开始在她的腿上扭动，试图在这个蓝色女孩身上找到着力点，以便更好地榨取她肉棒里的精液。");
            if(get_player().vaginas[0].vaginalLooseness >= 3)
            {
               outputText("在你被撑开的小穴里，你几乎感觉不到她那根小肉棒，但触手抚摸你体内带来的化学刺激很大程度上弥补了这一点。");
            }
            outputText("受到鼓励，她迟疑地抬起你的双腿，然后开始在你的深处抽插起来。");
            outputText("[pg]带着初学者的笨拙，女孩笨手笨脚地俯下身想吻你，但没够着，只在你依然穿着衣服的[chest]上印下了一个吻。尽管如此，她还是热情地继续抽插着，当你没有责备她的鲁莽，反而发出充满情欲的呻吟时，她眉宇间的担忧和羞愧便烟消云散了。她停下来用一只手支撑着你，同时用手指将你的阴唇扒得更开，让你的[clit]暴露在空气中。");
            if(get_player().getClitLength() < 6)
            {
               outputText("就在她恢复抽插的同时，她那试探的手指揉弄着那颗小豆豆，加速了你即将到来的高潮。");
            }
            else if(get_player().getClitLength() < 36)
            {
               outputText("随着她更用力地操弄你，那根巨大的肉棒在空中上下晃动；单是微风就足以让你更加兴奋，但海葵抓住了它，开始像撸管一样套弄着那根布满神经的肉棒，这让你的背部一阵痉挛。");
            }
            else
            {
               outputText("你的阴蒂长得惊人，以至于海葵在琢磨该怎么处理它时，抽插的速度慢得像蜗牛爬一样；最后，她凭借着种族本能，把它含进嘴里，开始用牙齿和舌头温柔地爱抚着顶端，同时她短短的头发也凑过来给肉棒挠痒痒。你的身体无力地瘫软下来，阴蒂传来的快感让你彻底失去了意识的控制。");
            }
            outputText("[pg]虽然她的技巧依然没什么值得称赞的，但不断涂抹在你小穴里、带着热度的毒液却在勤奋地发挥着作用，你的高潮是被强行逼出来的，而不是靠技巧。你喘息着、呻吟着，紧紧夹住她的肉棒，你那高潮中的小穴拼命地榨取着它——很快就有了结果。她用手和膝盖撑着身体，发出高亢的呻吟声，第一股、接着是第二股冰凉的液体射入了你过热的小穴中。即使她的手肘支撑不住，仰面躺倒在地，她的肉棒依然在流淌、滴落着精液。");
            outputText("[pg]你从她身边抽身离开，踉跄着站起来，然后重新穿好衣服。小A躺在地上，已经因为过度劳累而睡着了；你咧嘴一笑，从她身上跨了过去。");
            anemonePreg();
            get_player().slimeFeed();
            get_player().orgasm("Vaginal");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,2);
            }
            doNext(get_camp().returnToCampUseEightHours);
            return true;
         }
         return false;
      }
      
      public function kidAMasturbation() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你把海葵从她的木桶里叫了出来。意识到她更感官的需求，你决定帮她自慰。");
         outputText("[pg]小A对你的想法羞红了脸，紧张地捂着自己的胯部；然而，她的努力几乎掩盖不住她正在变硬的阴茎。尽管她很害羞，但她似乎很渴望知道你为她准备了什么。你向小海葵保证她没有什么好担心的，同时你把手滑进她的双腿之间，揉搓着她的肉棒。她在接触时紧张起来，颤抖着顺从了，任由你为所欲为。");
         if(kidAXP() < 33)
         {
            outputText("[pg]你的手继续向下滑动，当你摸得更低时，你按压着她的阴唇。你的女儿完全被整个经历所淹没，她颤抖着当场高潮，并在过程中摔倒了。她完全被尴尬所吞噬，笨拙地冲回她的木桶，爬进去隐藏她的羞耻。任何试图安抚她的尝试似乎都被当成了耳旁风。你叹了口气，走开了。");
            dynStats(DynStat.Lust(5));
            kidAXP(1);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg]你向你蓝色的小女儿解释说，自慰对一个成长中的女孩来说是健康的。她应该理解并对给自己带来快乐感到舒适。你让她坐在你的[legs]上，用手指轻轻揉搓她的阴唇。她喘着粗气，本能地试图再次掩盖，但你并没有放慢速度。她肿胀的蔚蓝色外阴在这样的刺激下迅速升温，但这本身对海葵来说是不够的。你将拇指向上滑动，抵住她阴茎的根部，也就是它与她小穴相遇的地方，引得她发出一声大叫。");
         outputText("[pg]颤抖着，小A在体验她[father]专业的抚摸时，只能嘟囔着[say: 啊……啊……]。你转动着拇指，让她熟悉这些感觉，然后慢慢地将它拖到她的双唇之间。此时，她温暖而多肉的峡谷已经被浸透了。在她柔软盆地的底部，她的阴道口充满期待地颤抖着。你挑逗并戳弄着那个洞，在它周围摩擦。你的女儿向后仰起头，呻吟着，本能地向前磨蹭着她的臀部。现在轮到她了。");
         outputText("[pg]小A没有立即做出反应。然而，缺乏刺激很快就让她回过神来，她开始再次集中注意力。轮到她自己揉搓并展示她学到的东西了。海葵的眼睛睁得大大的，但你已经把她挑逗得太厉害了，她无法屈服于焦虑。她需要释放，即使这意味着要在她的[dad]面前自慰。尽管并非没有犹豫，她还是顺从了，开始揉搓她的小穴。她的手指一开始平放在她的外阴上，没有任何特别的技巧地揉搓着。然而，很快，她就通过将指尖向上滑动到她小穴和阴茎之间的根部来寻求更强烈的刺激，达到了你之前给她的那种令人触电般的刺激。");
         outputText("[pg]小A皱着眉头，更用力、更快地摩擦着手指，无意识地也开始摩擦双腿。不出所料，她发出大声的喘息和呻吟，达到了高潮的极乐。你充满爱意地拥抱着颤抖的海葵，很快就把她抱起来放进她的木桶里，以免她在休息时脱水。");
         dynStats(DynStat.Lust(15));
         kidAXP(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidALovemaking3() : void
      {
         clearOutput();
         outputText("当她俯身靠近你的双唇时，一团蓝色的模糊影像出现在你的视野中，你本能地用新生的力量抓住她的双腿，将你的[claws]刺入她的皮肤。尖锐的刺痛让她惊讶地跳了起来，这正是将这只小海葵拉近的绝佳机会，近到你每一次颤抖的呼吸都能让她战栗。她的湿润顺着你的手流下，单是那气味就足以让你的思绪变得模糊。现在，除了直接品尝她，没有什么能满足你了，但你满足于用舌头沿着她大腿的柔软处游走，却始终没有达到她想要的高度。");
         outputText("[pg]虽然她试图向下压以缩短距离，但你稳稳地抱住她，让她的渴望再延长一点。毕竟，看到你平时犹豫不决的女儿如此急切，是一个值得的奖励，尤其是当她忍不住因为你嘴唇的轻微张开而紧张时。不过，这并不完全是你想要的，你给她的只是在她的触须上轻轻呼出一口气，当那些羽毛状的触须向你伸展并召唤你时，你的身体因兴奋而嗡嗡作响。尽管她很害羞，但她再也无法否认自己的需求，你微微起身，刚好擦过它们，享受着她唇边的呜咽和你自己唇上的电流般的刺痛。");
         outputText("[pg]新鲜的毒液让[if (isgoo) {热量在你体内膨胀|你的[if (tailLeg) {尾巴|脚趾}]蜷缩}]，但她的情况也好不到哪里去，她向前瘫倒，[if (hasbreasts) {捧住你的乳房|撑在你的胸前}]以获得支撑。你的头向后仰去，迷失在欲望中，她的头发垂在你的肚子上，将脉动的热量直接送入你的核心。[if (isgoo) {你融化在温暖中|汗水顺着你的背流下}]，床单现在无疑已经[if (isgoo) {被弄脏了|湿透了}]，但当你的大脑变得模糊，甚至她手掌压在你乳头上的感觉都让你的[if (isgoo) {视线模糊|眼睛湿润}]时，这一切似乎都变得那么遥远。");
         outputText("[pg]就这样，你女儿原始而诱人的气味淹没了你的感官，她闪闪发光的褶皱近在咫尺。她的触须随着你的每一次呼气而抽动，它们的尖端已经沾满了催情剂和情欲的混合物。你微微向上移动，轻轻挤压她的大腿，让她充满期待地紧紧抱住你，当你凑上去亲吻时，她在你的脸上痒痒的。与以前不同，湖水的柔和味道中夹杂着海水的咸味，当你沿着她的入口游走，却始终没有深入时，你能感觉到她身体里颤抖的紧张。");
         outputText("[pg]但她想要的更多，无声地反抗着你的嘴唇，当她分开双腿接纳你的舌头时，你屈服于在[if (isgoo) {表面|[skinshort]}]下肆虐的炽热。即使在内部，她也出奇地凉爽，但这只会让你的温暖更加明显，因为她在你周围颤抖，她的每一部分都在呼唤你的抚摸。你很难想到比安抚女儿的需求更符合[father]职责的事情了，你的拇指第一次擦过她的阴蒂，就足以让她的双腿夹得更紧。甚至她的触手也抓住了你的手指，尽力让你留在原地，看到她的身体背叛了她平静的镇定，这真是一个令人陶醉的惊喜。");
         outputText("[pg]就像她散落在你[if (isgoo) {底部|[if (tailLeg) {下腹|腿部}]}]的头发带来的火辣辣的刺痛感一样，小海葵的鳃滑过你的肚子，让你对接下来会发生的事情屏住呼吸。即使你知道它会来，她舌头的第一次接触还是让你在她的褶皱中喘息，但当她舔舐[if (vaginalwetness > 2) {她能舔到的|你所能给予的}]一切时，震惊很快就变成了快感。她有一种饥渴，" + (get_player().isGoo() || get_player().lib > 50 || get_player().hasStatusEffect(StatusEffects.Heat) || get_player().hasStatusEffect(StatusEffects.Rut) ? "你太了解了" : "你无法想象") + "，每一次舔舐都充满了她的爱意，让你忍不住给她她需要的东西。");
         outputText("[pg]当你潜得更低时，她的臀部有一个令人愉快的停顿和推力，[if (haslongtongue) {用你长长的舌头包裹|用你的舌头旋转过}]她的阴蒂，然后滑回她的深处。仿佛在跟随你的引导，她也移动了，当她冰冷的吻遇到她毒液的热量并点燃你的世界时，你的整个身体在女儿身下紧绷。当你的呻吟穿过她时，她的腿在你的抓握中颤抖，你没有放松，滑得更深，而她尽力把你固定在原地。");
         outputText("[pg]没过多久，她的嘴唇刷过你的[clit]，用永远不会到来的柔软戏弄你。每次你在她体内旋转舌头时，她的动作都变得越来越不稳定，她的触角抵着你的下巴的刺痛感让你有了一个把她推向边缘的想法。当你把它们夹在手指间时，她惊讶地绷紧了，抚摸着她的双腿让她平静下来，因为它们的温暖渗入你体内，直到你担心你可能会[if (isgoo) {融化|断成两半}]。她快乐的低语没有逃过你的注意，她发出的每一声小小的呻吟只会让你更加兴奋。");
         outputText("[pg]她一定比你想象的更需要这个，你很乐意帮助她。当你拉开时，她的小触手紧紧抓住你的手，但她几乎没有时间注意到你的离开，你就张开她的褶皱，把涂满毒液的指尖滑了进去。在第一次接触时，她的整个身体都在你身上颤抖，当剂量渗入她的身体时，她的内壁挤压着你的舌头。随着每一次缓慢的舔舐，她一次又一次地颤抖，看到她屈服于自己的刺痛是如此迷人，你永远无法移开视线。流过她的每一次颤抖似乎都在你的肠道中回荡，但你不会分心，你要给你的女儿她应得的一切。");
         outputText("[pg]考虑到她平时有多[if (kidaxp > 66) {安静|害羞}]，听到她在你的抚摸下失控是一种令人愉悦的奖励。当你把她拉近贴在脸上，毫不在意她的淫液顺着你的下巴流下时，你几乎想不出还有什么声音比这更美妙了。她双腿紧紧环绕着你的力道，随着你的拇指拂过她的阴蒂而有所松懈，但一旦你开始认真揉搓，她惊讶地喘息时，那股力道又迅速恢复了。当你从她的深处滑出时，她的双腿夹得更紧了，你停顿了一下，让她的急不可耐沉淀片刻，然后品尝你女儿的味道，尽可能地延长她的快感。");
         outputText("[pg]只有当她在你的怀抱中平静下来时，你才终于放慢速度，当你把嘴唇贴在她的嘴唇上时，她贴着你的胸膛扭动着，这让你感到高兴。在你狂热的体温之上，她依然保持着令人神清气爽的凉爽，当她向下移动时，她依偎在你的温暖中。有那么一瞬间，你想知道她是否能感觉到你的欲望，或者感觉到毒液仍在你的[if (isgoo) {身体|血管}]中流淌，但她的手指沿着你大腿内侧划过的刺骨寒意让你很难集中注意力在其他任何事情上。");
         outputText("[pg]尤其是当她把你的湿润涂抹在你的[skindesc]上，她手的每一次抚摸都越来越靠近你最需要她的地方。带着一种好奇的犹豫，小海葵终于触碰到了你的入口，但你臀部的挺动似乎让她确信该怎么做。尽管知道接下来会发生什么，但当她的冰冷沉入你的核心时，你还是忍不住夹紧了。每次你放松时，她都会压得更深，震惊很快就消退为一种令人刺痛的快感，当她探索你体内的每一寸时，你都喘不过气来。");
         outputText("[pg]受到你反应的鼓励，她尽可能深地滑入，当你每次她的手掌撞击你的[clit]而颤抖时，她变得更加兴奋。你抓住她的腿，寻找可以抓住的东西，这似乎是[if (kidaxp > 66) {恢复了她|给了她}]真正占有你的信心的回应，因为她把手指埋在里面，四处抽插，直到她击中了一个让你惊讶地把背从[if (builtbed) {床|床单}]上拱起的地方。她的热情很快就让你的[cabin]充满了你女儿求爱的湿滑声音，但当她的头低到足以让她的头发垂在你的嘴唇上，明亮而炽热的快感在你的眼前闪烁时，你根本不在乎是否有人能听到。");
         outputText("[pg]她的手从未停止移动，即使你的[vagina]紧紧抓住她，你的[claws]深深地陷入她的大腿。她刺痛的持续热量夺走了你的呼吸，在你的[skindesc]下向上翻滚，直到你的每一部分都在颤抖，你发誓如果不是因为她压在你胸口的重量，整个[if (builtbed) {床|地板}]都会飞走。你很感激她紧紧地贴着你，她的身体与你的身体融为一体，当你的快感在她卷曲的触摸下达到顶峰时，你的肉壁紧紧地夹住她的手指，徒劳地挤奶。当她再次刺入你时，一切都比以前更热、更模糊，最后她毒液的持续脉动达到了一种刺痛的高潮，笼罩着你，[if (isgoo) {浸透了你的核心|从头到[if (tailLeg) {尾尖|[if (isdrider) {spinneret|[if (ishoofed) {蹄|脚趾}]}]}]}]。");
         outputText("[pg]当你从恍惚中醒来时，你隐约意识到她的动作变慢了，当她最终从你体内滑出，你的汁液从她的手指滴落到你的[skindesc]上时，那种明显的空虚感让你措手不及。她毫不犹豫地向前倾身，把它们都舔干净，让你在她冰凉舌头的轻柔抚摸下颤抖。只有当她做完后，她才转过身来，虽然很难看透她蓝眼睛的迷雾，但你毫不怀疑她和你一样享受。她在[if (hasbreasts) {安顿在|躺在}]你的[chest]上之前给出的[if (kidaxp > 66) {明亮|害羞}]的微笑回答了你所有的问题，你很满足于和你的女儿依偎在这里，同时你们都在恢复体力。尽管她现在很平静，你几乎想让她的头发在你的手指间穿过，但你很快就回过神来，转而描绘她温柔的曲线。");
         outputText("[pg]当她终于动弹时，你扶她[if (builtbed) {到地上|站起来}]，牵着她的手，离开你的[cabin]，走到[day]中。走到她木桶的路程在舒适的沉默中度过，她毫不浪费时间地跳进你的怀里，这样你就可以帮她进去。当水冲刷着她时，她似乎几乎在发光，当你最后一次吻她的嘴唇时，她熟悉的蓝色加深成一种可爱的色调。");
         outputText("[pg]一个小小的波浪，几乎没有超过边缘，是她沉入水面之前你看到的最后一件事。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidALovemaking2() : void
      {
         clearOutput();
         outputText("[if (builtbed) {你爬上床躺在她身边，将|虽然空间勉强够你们两个人用，但你有足够的空间将}]她的手指与你的交缠在一起，同时吸入她毒液那令人陶醉的气味。你的脉搏随着每一次呼吸跳动得越来越快，尽管她很苗条，但你毫不费力地凑上前，直到你的嘴唇擦过她的胸膛。落在她柔软光滑肌肤上的第一个吻让她全身颤抖，看到你的女儿如此渴望她[father]的抚摸，你的内心深处燃起了一团火。现在，你比任何时候都需要她，无论[if (cor < 50) {这是否错误|别人怎么想}]。");
         outputText("[pg]她的手从你的手中滑落，环抱住你的背，将你紧紧抱住，以至于她的鳃弄得你的[chest]痒痒的。这种羽毛般的触感很快让你们俩都[if (ischild || isteen) {咯咯笑起来|大笑起来}]，直到你抬起头喘口气时才终于消散。当你看到她好奇的微笑时，你可能有的任何疑虑都烟消云散了，当你再次吻上她的嘴唇时，她几乎无法保持静止。随着她所有的毒液在你体内流淌，即使是最轻柔的接触也会让你的[skinshort]因渴望而刺痛，当她紧贴着你并加深这个吻时，你的大脑很快就变得一片模糊。");
         outputText("[pg]尽管她缺乏经验，但她舌尖冰凉的抚摸与你的舌头交织在一起，形成了令人窒息的对比。说来也怪，你发誓能在她唇间尝到湖水的味道。随着时间的推移，你的女儿变得越来越[if (kidaxp > 66) {热情|自信}]，她的手很快顺着你的[skindesc]向下滑去，直到指尖拂过你的[ass]。这触碰[if (kidaxp > 66) {让她停顿了一下|让她瞬间紧张起来}]，但你不会让她担心，你没有放慢动作，直到她在亲吻中放松下来。只有当她更紧地抓住你，用她柔软而犹豫的手指捧住你的脸颊时，你才离开她的嘴唇。当你顺着她的脖子向下亲吻时，她那没有焦点的眼睛似乎看穿了你。");
         outputText("[pg]每一次揉捏，你都会俯下身，用另一个吻来奖励她。当你拨开她的鳃，将她的乳头含入口中开始吮吸时，她高兴地扭动着身体。由于她独特的生理结构，你不需要隐藏你的爱意。当你的[if (hasfangs) {尖牙拂过|牙齿轻轻刮过}]她敏感的肌肤时，她的手惊讶地握紧了。她的反应让你的[if (isgoo) {理智更深地陷入欲望之中|血液流淌得更快}]，但你不知怎么地找到了足够的控制力停下来，确保她没事。毕竟，你不想吓到她，而且她那么[if (kidaxp > 66) {安静|害羞}]，很难知道她到底在想什么。");
         outputText("[pg]她的膝盖紧紧压在你的[vagina]上，这足以作为回答。当你呻吟着埋入她的脖颈，双手紧紧抓住她的后背时，余震[if (isgoo) {传遍你的全身|顺着你的脊椎蔓延}]。在催情剂的作用下，即使是她大腿最轻微的移动，也会让你越来越紧绷。当你埋首于她柔软的肌肤中时，湖岸的气息充满了你的鼻腔。很难[if (cor < 40) {相信你女儿的触碰会对你产生这样的影响|满足于你女儿的触碰}]，尤其是当她的手指紧紧抓住你的[ass]，将你紧紧贴向她时。");
         outputText("[pg]你怀疑[if (builtcabin) {墙壁|帐篷}]是否能掩盖她抽插时发出的湿润而疯狂的声音，但笼罩在你脑海中的浓重雾霾冲淡了所有关于[if (camppop > 1) {你的营地|附近的人}]会怎么想的念头。除了你身边的海葵和你肠胃里翻滚的紧张感，其他一切都不重要了。每次她的头发拂过你的脸颊，你都会屏住呼吸。与她相比，你简直要燃烧起来了，[if (isgoo) {看不到任何缓解的迹象|汗水已经[if (hashair) {浸湿了你的头发|在你的额头上渗出}]}]，你正把自己推向边缘。");
         outputText("[pg]你一心一意地用双臂环抱住她，依偎在她的脖颈处，让世界褪去，只剩下她肌肤那绚丽的蓝色。每次你急促的呼吸拂过她的喉咙，她都会和你一起颤抖。你的眼睛很快闭上，无法再承受更多的刺激。你身上的每一寸肌肤都绷得紧紧的，仿佛随时都会断裂。当你最后一次紧紧贴向她时，你的哭喊声消失在她的肩膀里。当火热的温暖席卷你并[if (isgoo) {一直滚落到你的根部|顺着你的脊椎滚落}]时，你更紧地抱住你的女儿。当她继续在你的[vagina]里摇晃时，你喘息了一声，你的淫液已经[if (vaginalwetness > 2) {流下|涂抹在}]她的膝盖上。每次压迫你的[clit]时，你的大腿都会紧紧夹住她，绝望地想让她靠近。只有当你的呼吸最终平缓下来时，她才[if (singleleg) {滑开|从你的双腿间滑出}]。");
         outputText("[pg]尽管快感仍在你的体表下涌动，但哪怕只是她的肌肤擦过[if (hasplainskin) {你的肌肤|你的[skindesc]}]，也会让你的核心阵阵战栗，你[if (isgoo) {体内|血液中}]的毒素在她的触碰下再次爆发。无论你做什么，[if (isgoo) {她每一个细微的动作|你的每一次心跳}]都让你渴望更多。你的脑海中已经充斥着新生的欲望，你发现自己根本无法平静下来。在这令人窒息的灼热中，你几乎无法呼吸，她的手在你的背上越滑越高，但无论你多么需要她，哪怕只是将自己推向她的双唇，都感觉是一项不可能完成的任务。幸运的是，你的女儿来帮你了，当她从你的怀抱中滑出，轻轻地将你翻转平躺时，你没有做任何抵抗。当她站在你身后时，她的[if (kidaxp > 66) {目光迅速|羞涩的目光慢慢}]转变为半睁半闭的饥渴，她俯下身，直到一只手掌触碰到你的胸膛，你的脑海中充满了期待的眩晕。");
         get_player().dynStats(DynStat.Lust(30),DynStat.NoScale);
         doNext(kidALovemaking3);
      }
      
      public function kidALovemaking() : void
      {
         clearOutput();
         outputText("当你[if (singleleg) {move|step}]靠近她的木桶时，你海葵女儿的脸上露出了好奇的微笑，当你把手臂放在边缘上时，她的肤色变得更加明亮。不过，她[if (kidaxp > 66) {looks|sneaks glances}] [if (tallness > 70) {up at|[if (tallness < 60) {down at|[if (kidaxp > 66) {straight at|towards}]}]}]你，毫无疑问[if (cor > 50) {she knows what you want|the two of you have the same idea in mind}]。" + (get_player().cor > 50 || get_player().lib > 50 ? "有你这样的[father]" : "考虑到她的饮食") + "，毕竟这几乎是本能。");
         outputText("[pg]她的目光追随着你手指在水中慵懒的漂流，当你滑开时，每一次触碰她充满活力的蓝色皮肤都会让她颤抖。尽管她平时[if (kidaxp > 66) {confidence|curiosity}]，但她只是向后靠，似乎满足于看着你的手潜入水面以下，沿着她鳃的羽毛描绘。当然，这很好。[if (lust > 50) {You can hold out a little longer|You\'re in no rush}]，你非常乐意给你女儿所有她需要的关爱。");
         outputText("[pg]你从轻柔的抚摸开始，顺着她身体柔和的轮廓，唯一的声音来自你的手离开水面，水滴划过她的皮肤。正如你所知，她似乎并不介意这种安静，当你向上移动时，她的眼睛追随着你的路径，只有当你滑过她的肩膀并从视线中消失时，她才会移开视线。你停留在那里，让她娇嫩的头发刺痛你的手指，直到温暖在你[skinshort]下[if (lust > 50) {rages|blossoms}]。随着她的毒液渗入你的体内，她冰凉的皮肤与你手掌的热度形成鲜明对比，这更让人感到惊讶，尽管无论你的触摸多么刻意，她似乎仍然有点[if (kidaxp > 66) {confused|unsure}]。这可不行，你花了一点时间引导她靠近，当你把她拉到边缘时，她发出了一声微小的喘息，这让你很高兴。当她感觉到你不断增长的欲望时，她浑浊的眼睛害羞地向上瞥向你，但你不会错认她内心翻腾的饥渴。");
         outputText("[pg][if (isday) {Sunlight glitters across every inch of her skin that peeks above the surface|The reddish light of the moon paints her a rich purple}]，赋予了她一种似乎与她平时截然不同的优雅。她[if (kidaxp > 66) {eager|nervous}]的点头并不令人意外，当你引导她的手到你的[if (isgoo) {neck|collarbone}]并让她的手指顺着你[if (isnakedupper) {bare}]胸膛滑下时，她整个身体都在颤抖。[if (!isnakedupper) {Even through your [armor], the anticipation of h|H}]她娇嫩的触碰让你敏感的[skinshort]一阵战栗，每一次都让你的女儿变得更加大胆。当她靠近时，一种毛茸茸的刺痛感拂过你的脸颊，她带有毒液的头发立刻让你的脸[if (hasscales || isgoo) {hot|flushed}][if (isfluffy) { beneath your [skindesc]}]。");
         outputText("[pg]你的[if (isgoo) {desire|heart}]在你的[if (isgoo) {head|skull}]中因它们的刺痛而怦怦直跳，你很难集中注意力去想除了你女儿的嘴唇之外的任何事情，现在它们离你只有几英寸远。它们引人注目的蓝色吸引了你的目光，如果她再靠近一点，你[if (lib > 50) {know you couldn\'t|don\'t think you could}]忍住。也许她知道，这就是为什么她停留在你够不着的地方，等待她的[father]迈出最后一步。毕竟，如果发生任何事情，那完全是你的错，她似乎满足于让你来做这个决定。");
         outputText("[pg]你怎么能不呢？她的嘴唇已经闪烁着水光，用不可抗拒的邀请向你招手，当你向前移动时，她颤抖着，无法掩饰自己的兴奋。当你的呼吸的温暖吹到她冰凉的皮肤上时，甚至她的眼睛也闭上了，但这只会让你想更多地挑逗她。教她耐心的价值是你的[paternal]责任，你几乎想不出她会更喜欢哪一课。");
         outputText("[pg]当你从她脸上拂去一缕头发时，你的[if (isnaked) {body flares up again|[armor] seems to grow a bit more stuffy}]。从你大腿间汇聚的[if (vaginalwetness > 2) {wetness|heat}]来看，你不确定自己还能承受多少，但当你的嘴唇轻轻滑过她的嘴唇时，你尽力把这个想法抛在脑后。这轻柔得让她惊讶地咯咯笑了起来，看到你的女儿如此[if (kidaxp > 66) {caught off-guard|shy}]，当你压进去把她据为己有时，她变得更加美味。");
         outputText("[pg]她似乎有点惊呆了，所以你给她一个机会[if (kidaxp > 66) {compose herself|relax}]，同时你在她的脸颊上印满吻。她的蓝色皮肤随着每一个吻而加深，当你再次像幽灵一样掠过她的嘴时，她几乎和大海一样深邃。[if (cor < 50) {Even though she\'s your own child, e|E}]当你的嘴唇再次与她的相遇，她的手[if (isnaked) {dig into your [skin]|cling to your [armor]}]，永远不想让你走时，一切感觉都是对的。在她甜美的味道和你[if (isgoo) {core|veins}]中她毒液的隐隐作痛之间，你可以品尝她一整[day]，用你所知道的最好的方式与她分享你对女儿的激情。");
         outputText("[pg]当你退开时，她的双眼蒙上了一层情欲的迷雾，她几乎整个人都缠在你身上，试图从桶里爬出来。她纤细的身体在你的臂弯里[if (str < 50) {出乎意料地}]轻盈，当水滴从她的皮肤上滑落，流过你的[if (hasplainskin) {皮肤|[skindesc]}]时，你不禁打了个寒颤。虽然她被举得太高，不方便好好接吻，但这个高度刚好让你能凑上前，将嘴唇贴在她柔软的小腹上。当你一路向上游走时，小海葵在你怀里愉悦地扭动着，当你触碰到她微微隆起的乳房时，她发出的微弱声音绝对不会被你错过。当你继续向上时，她的鳃擦过你的鼻子，而当你的舌头带着温度滑过她的乳头时，她把你抱得更紧了。");
         outputText("[pg]由于她自身体温较低，你的每一次触碰对她来说肯定都被放大了许多倍，这个想法让你脑海中浮现出许多点子。不过，你[if (isday) {不确定她能在太阳下待多久|不想在黑暗中被突袭}]，所以你把她抱到你的[cabin]前放下。当你推开[if (builtcabin) {门|门帘}]时，你女儿的眼睛睁得大大的，你毫不怀疑，如果不是她脸颊上泛起的暗蓝色，以及她大腿上点缀着的不只是水珠，你这个好奇的小女孩肯定会想四处看看。");
         outputText("[pg]相反，当你再次把她抱起并[if (singleleg) {进入|走进}]屋内时，她[if (kidaxp > 66) {微笑着|害羞地移开视线}]，当她在你怀里放松下来时，她的头发点燃了你的[if (isgoo) {感官|神经}]。走向[bed]的整个过程似乎只是一段火热、令人窒息的模糊记忆，当你把她放下时，你根本不在乎床单会不会弄湿[if (!isnaked) {，片刻后，你的[armor]便" + (["Light","Adornment"].indexOf(get_player().get_armor().get_perk()) > -1 ? "飘落" : "哐当一声掉落") + "在地上}]。");
         doNext(kidALovemaking2);
      }
      
      public function kidADreams() : void
      {
         spriteSelect(SpriteDb.get_s_kida());
         outputText("[pg]<b><u>午夜时分……</u></b>[pg-]");
         if(get_player().hasCock() && (!get_player().hasVagina() || get_player().get_femininity() < 50))
         {
            get_images().showImage("anemone-kid-male-masti");
            outputText("当你注视着对面的人影时，头顶的教堂钟声敲响了。确实，你的家人选择了这个女人并安排了这场婚姻，但如果你说你对这件你母亲传给她的婚纱下那苗条、戴着面纱的身影一点都不感兴趣，那显然是不公平的。");
            outputText("[pg]牧师礼貌地咳嗽了一声。[say: 那么……你愿意吗？娶这个女人？]");
            outputText("[pg]你心不在焉地点点头，依然盯着你的新娘。牧师向她重复了这个问题，她也点了点头，同样盯着你。");
            outputText("[pg][say: 既然如此，我宣布你们结为夫妻。你可以吻新娘了。]");
            outputText("[pg]你举起双手想掀开面纱，但你的新娘害羞地抓住了它们，用戴着手套的拇指在你的手掌上画着小圈，并开始拉着你沿着过道走向大门，引得在场的见证人们发出一阵轻笑。她急切地拉着你穿过拱门，穿过街道，来到你父母为了你们的新生活而帮忙建造的小屋，只在门外停了下来。她一手抓着面纱，另一手牵着你，把你拉近，让你把她抱在怀里；她出奇地轻，双臂环绕着你的脖子，幸福地在你的胸前蹭着。你抱着你那奇怪的配偶穿过屋子走进卧室；当你小心翼翼地把她放在床上，双手抚摸着她的身体时，她的胯部开始鼓起一个小包，顶起了白色连衣裙的褶皱。你爬到她身上，想毫无阻碍地掀开面纱，她把胯部贴在你的胯部上摩擦，开始轻声呻吟——你能感觉到你的肉棒硬了起来，因为你那深情的陌生人把她的性器推向你的，留下了一点点先列腺液的污迹，这些污迹渗透了你母亲的婚纱，变成了一个越来越大的黑斑。你抓住面纱，屏住呼吸，掀开了它……");
            outputText("[pg]一张蓝宝石般的脸庞回望着你。透过那不透明的眼睛，她不知怎的依然表达出了你大半辈子都没见过的爱慕之情。她把一只手放在你的");
            if(get_player().isTaur())
            {
               outputText("大腿");
            }
            else
            {
               outputText("脸颊");
            }
            outputText("，她倾身吻你，轻声呢喃着你的名字。[say: [name]……[name]……]");
            outputText("[pg]你猛地睁开眼睛，看到头顶上那轮无处不在的红月。一只");
            if(!get_player().isTaur())
            {
               outputText("一只柔软的手抚摸着你的脸庞，一个");
            }
            outputText("胯下传来轻微的重量；你低头一看，你的海葵正把她的小穴压在你装备下鼓起的勃起上，她停在半空中，脸红得你几乎认不出她来。");
            outputText("[pg][say: 嗯……嗨？] 她慢慢退入夜色中，留下你带着被唤醒的性欲努力入睡。");
         }
         else
         {
            get_images().showImage("anemone-kid-female-masti");
            outputText("村长的儿子肯定又躲在校舍后面了。你注意到他这周好几天都往那儿跑。你悄悄地从书桌后溜出来，走出这间只有两个房间的小学校。当然，他现在可能已经到了下地干活的年纪，但这不能成为他在最后学业中偷懒的借口。");
            outputText("[pg]当你走到拐角处时，你能听到他发出轻柔、像女孩一样的喘息声。你小心翼翼地探头看去，发现他坐在地上，肩膀靠着墙，背对着你；越过他的肩膀，他那蓝色的小龟头在紧握的拳头上方清晰可见。他继续自慰着，没有察觉到你的存在，你看着他，惊叹于这个佝偻的身影与记忆中那个英俊、受欢迎的男孩相比，变得如此消瘦和女性化。");
            outputText("[pg][say: [name]！] 他突然叫出声来，脑海中想着你，用力地撸动着。你被吓了一跳，也许还有点受宠若惊，你后退了半步，这声音引起了他的注意。他惊讶地半转过身，半摔倒地面对着你，那张蓝得惊人的脸上，宽大的、不透明的眼睛震惊地看着你，他那根小鸡巴抽搐着，朝你的大腿喷出了一串黏液。");
            outputText("[pg]你的同学变成蓝宝石色的奇异景象让你惊醒，你猛地坐了起来。你眨了眨眼，向左看去，发现你的海葵正虚弱地抚摸着她那根正在变软的鸡巴，满足地叹了口气。当她的目光与你相遇时，她僵住了；一股潮湿的气味吸引了你的注意力，你低头一看，大腿上有一道精液的痕迹。蓝色的女孩脸红得厉害");
            if(get_player().cor >= 66)
            {
               outputText("，你叹了口气，抓住她的头，强迫她低下头去清理那摊污迹，逼她舔干净。");
            }
            else
            {
               outputText("，你们俩谁也没说话，她跪在地上慢慢地往后退。");
            }
            outputText("你叹了口气，翻了个身，尽管周围弥漫着精液的味道，你还是试图继续睡觉。");
         }
         dynStats(DynStat.Lust(50 + get_player().sens / 2),DynStat.NoScale);
         doNext(playerMenu);
      }
      
      public function kidABabysitsCows() : void
      {
         spriteSelect(SpriteDb.get_s_kida());
         outputText("<b>[say: 快点，从你的小洞里出来帮忙！]</b>");
         outputText("[pg]一声沮丧的叫喊声让你转过头去。玛布尔站在你那装满水的水桶前，身后跟着几个你那调皮捣蛋的孩子，正在斥责被困在里面的海葵。你往前走了几步，那个蓝色的女孩恳求地转向你，但还没等你走近说话，玛布尔又开始说了。");
         outputText("[pg][say: ……真不知道你为什么这么害羞和不成熟，] 牛娘继续说道，虽然声音小了些，但语气依然坚定。[say: 你比这些孩子高了将近两英尺，为什么你不能别像个孩子一样，表现得像个成年人？这里有很多活要干，人手根本不够！]");
         outputText("[pg]玛布尔摆出骑马的姿势，等待着回答；海葵不高兴地考虑了一会儿，然后爬出了水桶。玛布尔满意地转过身，把她的孩子们赶走了。");
         if(kidAXP() >= 66)
         {
            outputText("然而，没走几步她就发现小A一动不动。牛娘转过身，冷冷地瞪着她，现场死一般的寂静，甚至让人觉得有些毛骨悚然。你不太确定小海葵在想什么，但她的表情中没有一丝犹豫。两人互相盯着对方。");
            outputText("[pg][say:你到底听懂我的话没有？我说——]");
            outputText("[pg]小A用力地摇着头，头上发光的触手随之旋转飞舞。她双臂交叉抱在娇小的胸前，摆出和玛布尔一样的姿势，而牛娘则难以置信地看着她。你为她稳稳扎根在泥土中的双脚感到自豪，这清楚地表明她今天不会任人摆布。你很清楚，她以前可没法在这里为自己挺身而出，这只会让你更加骄傲。");
            outputText("[pg][say:...好吧。随便你。又多了一件要我自己处理的事。] 玛布尔转向她的孩子们，开始用甜美得多的语气说话，尽管你能清楚地听出她语气下的烦躁。[say:妈妈现在要教你们缝纫——这难道不好玩吗？]");
            outputText("[pg]她的孩子们嘟囔着作为回应。随着牛娘不情愿地退下，你走到水桶边，称赞女儿的勇气。当你对她大加赞赏时，小A对你露出灿烂的笑容，她头上的触手也像她的笑容一样明亮。当你讲完后，她向前扑去，差点被自己的脚绊倒，但她优雅地稳住了身子，然后给了你一个拥抱。");
            outputText("[pg]拥抱虽然短暂，但当你向海葵女孩挥手告别时，你心里明白，胸中那股温暖的感觉不会那么快消散。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,757,-1);
         }
         else
         {
            outputText("起初，小A只是跟在她后面慢吞吞地走着，但考虑了片刻后，她回到水桶旁，抓起她的" + weaponName() + "，然后才不情愿地加入到开阔牧场上的其他人中。");
            outputText("[pg][say:好吧，] 玛布尔说道，此时海葵从后面走到了她身边。这位体型更大的女性转过身，面对着蓝色的女孩。[say:我要坐在这里给他们的衣服补几个洞，你来看着这些孩子……你带那个来当保姆干什么？！]");
            outputText("[pg]海葵把武器抱得更紧了，指了指牛娘那把从不离身的锤子。");
            outputText("[pg][say:那不一样！如果有一大群怪物入侵我的家并袭击我，我需要我的武器！] 玛布尔大声说道。小A停下来想了想，瞥了一眼那群不守规矩的孩子，然后小心翼翼地点了点头表示同意。");
            outputText("[pg]玛布尔喘着粗气，在一块平坦的石头上坐下，从一个小袋子里拿出一些破烂的儿童衣物，还有一根粗糙的针和一些筋线。[say: 随便吧。下次别带了。] 她转向聚集的乌合之众，而海葵则在消化“下次”的含义。");
            outputText("[pg][say:我给你们缝背带裤的时候，这个蓝色的野蛮人会照顾你们。你们要乖乖的。] 警告的话音刚落，一个牛孩就抓住了海葵的手把她拉走了，显然把“乖乖的”抛到了九霄云外。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,757,1);
         }
      }
      
      public function kidAAppearance() : void
      {
         clearOutput();
         outputText("当你的海葵女儿还在桶里时，要检查她有点困难，但凭经验，你知道她大约有[if (metric) {165厘米|五英尺半}]高。她最引人注目的特征是她种族特有的奇特头发——不是真正的发丝，而是一团从头皮上垂下的细长触手，你很清楚它们可能出奇地危险。她的整体体型相当苗条，即使对海葵来说也是如此，但她的曲线仍然相当赏心悦目。她的端庄由从胸部中央长出的一对几乎过大的鳃来维持，尽管她的资本本身相当适中，最多只有A罩杯左右。");
         outputText("[pg]想多看一点，你让她从桶里站起来，她[if (kidaxp < 25) {紧张地|迅速地}]照做了，展示了她的全身。你的女儿引人注目的蓝色皮肤在你的营地背景下显得特别有异国情调。她的生殖器也有点奇特——肉棒和肉缝都装饰着一圈小触须，时不时地蠕动一下。");
         outputText("[pg]当你看着她时，小A[if (kidaxp >= 75) {甜甜地笑了|[if (kidaxp < 25) {躲避|迎上}]你的目光}]，看起来她好像想说些什么，但不管是什么，语言障碍目前显然太大了，所以她只是简单地坐回水里，发出了一声轻叹。");
         doNext(approachAnemoneBarrel);
      }
      
      public function keepAnemoneKid() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你皱着眉头，盯着那双不透明的眼睛。除了把她强行拖进荒野，让她听天由命地繁衍或死亡之外，你想不出任何办法把她从木桶里弄出来，而你又没有狠心去做这种事。啊……她双手托着下巴坐在那里，看起来也很开心。好吧，可能会发生更糟糕的事情——但可能不会有更奇怪的事情了。");
         outputText("[pg]你问应该叫她什么，但她只是疑惑地看着你。你继续沉思，大声地想知道你甚至会给一个海葵孩子起什么名字。");
         outputText("[pg][say:孩子……？]女孩开始尝试模仿你的说话。你试图澄清，但她似乎没有听到，继续发出这些词的声音，并掌握它们的形状。");
         outputText("[pg]你挥了挥手，打断了她的思绪。你解释说，一旦你出生了，你就会得到一个名字；女孩会变成莎拉或维多利亚，而男孩会变成碎骨者或饮泪者。她不能只是“孩子”。");
         outputText("[pg][say:那么，]她回答道，歪着头思考着吸收她还落后几行的对话，[say:孩子……Aeh？]");
         outputText("[pg]真的吗？“小A”？");
         outputText("[pg][say:莎拉们，你出生了！]");
         outputText("[pg]天哪，小鱼儿，你教会了她怎么说双关语。你在心里记下，要找另一个水桶，最好是没有人住的，并把它藏在视线之外。你短暂而半心半意地玩味着在这个世界上寻找构成小B到小Z的物种的想法，但把它放在了一边。");
         outputText("[pg](<b>小A已添加到追随者菜单中！</b>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,1);
         get_camp().saveContent.didSoakInABarrel = false;
         doNext(playerMenu);
      }
      
      public function hotdogTheAnemone() : void
      {
         clearOutput();
         get_images().showImage("anemone-doggy");
         var _loc1_:Boolean = get_player().hasCockThatFits(48);
         var _loc2_:int = 0;
         if(_loc1_)
         {
            _loc2_ = get_player().cockThatFits(48);
         }
         outputText("好吧……心意最重要，对吧？那个蓝色的屁股看起来还是很诱人。你再次把海葵往前推，把她的臀瓣挤在一起；她咯咯笑着，再次试图把她的阴道推向你，但你再次把它按下去，把你的");
         if(_loc1_)
         {
            outputText("[cockFit 48]");
         }
         else
         {
            outputText("[clit]");
         }
         outputText("塞进她小巧圆润的臀瓣之间，两只手各抓住一边，强迫它们尽可能多地包裹住你的长度。女孩回头看着你，满脸困惑，但你根本不在乎。当你穿过她冰凉的屁股时，感觉就像在另一个世界，把你的顶端从股沟里探出来，然后再拉回来；");
         if(_loc1_)
         {
            outputText("先列腺液");
         }
         else
         {
            outputText("你的汁液");
         }
         outputText("在你动作的一端滴落在她身上，用一条滚烫的润滑河填满了你寻欢作乐的小峡谷，你将其肆意涂抹。");
         outputText("[pg][say:嘿，]你喊道，[say:你可以帮帮忙。用你的触手什么的。]");
         outputText("[pg]海葵，");
         if(_loc1_)
         {
            outputText("被你先列腺液的触感和视觉所兴奋");
         }
         else
         {
            outputText("看起来几乎有些无聊");
         }
         outputText("，顺从地向你伸出几根触手；它们停在你最深冲刺范围的边缘，诱人地掠过，仿佛在乞求你插进去。起初你很警惕，但你还是照做了，它们温柔地抚摸着");
         if(_loc1_)
         {
            outputText("你的[cockHead " + (_loc2_ + 1) + "]");
         }
         else
         {
            outputText("你[clit]神经密集的末端");
         }
         outputText("，几乎自主地做出反应将其包裹起来。不过，这种握力不足以阻止你拔出来，它们松开了你的肉棒，让你的顶端覆盖着一层温暖的毒液网，浸透了你的全身。一阵战栗传遍全身，你急切地再次挺进，首先滑入她的臀瓣，然后顺着你润滑液形成的湿滑通道，最后进入她触手那温暖身体的拥抱中。当你的");
         if(_loc1_)
         {
            outputText("现在正跳动着的肉棒");
         }
         else
         {
            outputText("肿胀发红的阴蒂");
         }
         outputText("吸收了她更多的毒液，你的臀部开始不受控制，随着每一次毒液的注入，你的抽插越来越快，将海葵的脸按进了湖底；她手肘弯曲，手指张开，但在你猛烈的攻势下，她依然无法抬起头来。");
         outputText("[pg]在你快要把");
         if(_loc1_)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("上的皮都磨破之前，你高潮了。你的身体颤抖着，几乎要倒在你的情人身上；");
         if(_loc1_)
         {
            outputText("你肿胀得发疼的坚硬肉棒喷射出精液，将海葵的背部和头发染成白色。你体内的毒液将你的高潮拉长到了不可思议的地步，[eachcock]一遍又一遍地射精，直到你感到头晕目眩。");
            if(get_player().cumQ() >= 500)
            {
               outputText("当你结束时，海葵的背上已经没有一处还是蓝色的了；这个晕乎乎的女孩正用她的触手和双手将你的精液塞进嘴里，吞下的湖水几乎和精液一样多。");
            }
         }
         else
         {
            outputText("你的小穴紧紧地夹住，试图寻找可以挤压的东西，但却徒劳无功，并且");
            if(get_player().wetness() < 4)
            {
               outputText("淫液顺着你的大腿流下。");
            }
            else
            {
               outputText("向后喷射出精液，如雨点般落在你伴侣的小腿和湖面上。");
            }
            outputText("当你在她身上抽搐时，海葵不耐烦地叹了口气，等着你完事。");
         }
         outputText("[pg]你从蓝皮肤女孩的臀沟间滑出，瑟缩着收起仍然敏感的下体，把她留在身后。海葵");
         if(_loc1_)
         {
            outputText("不敢从跪姿起身，小心翼翼地顶着你刚射在她背上的精液，试图用触手把它推向自己的脸。");
         }
         else
         {
            outputText("慵懒地看着你离去。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-0.5),DynStat.Sens(-0.5));
         get_combat().cleanupAfterCombat();
      }
      
      public function goblinNightAnemone() : void
      {
         spriteSelect(SpriteDb.get_s_kida());
         outputText("<b>那天晚上……</b>");
         outputText("[pg]远处一团吵闹的绿色身影吵醒了你，引起了你的注意。随着它靠近你的营地，你可以辨认出上面那一簇簇颜色鲜艳的头发，然后是清晰的轮廓。那团风景中的污点变成了一群地精，显然是想进入你的营地周边。你的海葵也注意到了，为了履行她的租约条款，她拿起她的" + weaponName() + "，准备拦截她们。你在一段距离外跟着，躲在掩体后面，已经猜到了入侵者的身份。");
         outputText("[pg]当地精们看到海葵挡在她们面前时，她们放慢了脚步，然后停了下来。双方互相打量了一分钟，然后那群地精散开，露出了其中体型最大的一个。");
         outputText("[pg][say: 让开，蓝皮婊子，]她命令道。[saystart]塔米说要注意一个");
         if(get_player().get_tallness() > 48)
         {
            outputText("高个子");
         }
         else
         {
            outputText("矮个子");
         }
         outputText("，" + get_player().mf("英俊的","华丽的") + "[race]；告诉我们[he]能像让[he]怀孕一样让我们所有人都怀孕，而且家族外面的一些小地精流浪汉在这个营地里见过一个。我们要得到我们的孩子。[sayend] 小A保持沉默，但不确定地摇了摇头，把她的装备抱得更紧了。");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,457) == get_useables().TELBEAR.get_id())
         {
            outputText("[pg]她把毛绒玩具紧紧贴在脸上，将她的训练付诸实践，向地精们展示了她最拿手的狗狗眼。你觉得你甚至能听到一声微弱的呜咽。");
            outputText("[pg]地精被搞得不知所措，结结巴巴地说，[say: 呃，抱歉。别哭。我不是故意要那么凶的。]她尴尬地揉了揉头。");
            outputText("[pg]另一个地精插嘴道，[say: 她太可爱了！肯定是那个种马的另一个孩子。]");
            outputText("[pg]第一个地精咳嗽了一声，回到了她最初的话题。[say: 听着，甜心，我们得去弄点精液，所以请让开，好吗？]地精向前倾身，拍了拍海葵以示安慰。");
            outputText("[pg]小A摇了摇头，拒绝让地精通过营地。虽然你从后面看不到她的表情，但她无疑看起来和往常一样天真可爱。");
            outputText("[pg][say: 好吧，如果你非要这样，我们就把你揍一顿，知道吗？]地精举起拳头强调她的观点，吓得小A退缩并哭了起来。");
            outputText("[pg][say: 等、等等！不——对不起。听着，算了。我们走，]她沮丧地说。地精们集体叹了口气，开始离开，其中一个说，[say: 还有，去睡一觉吧，孩子，大半夜的很危险，知道吗？]");
            outputText("[pg]地精们离开后，小A转过身来，脸上带着灿烂的笑容，成功后蹦蹦跳跳地回到了营地。");
         }
         else
         {
            outputText("[pg]地精看起来有点惊讶。[say: 你挡我们的路是什么意思？我警告你一次；让开，让我们搜查那个营地找精液，否则我会让你后悔的。]她愤怒地打量着海葵，然后向她的随从做手势，补充道，[say: 我会让这些婊子骑你那可怜的小鸡鸡，惩罚你这个荡妇，但我们不能从你们这些人身上得到地精——只能得到更多的蓝皮婊子。]");
            outputText("[pg]虽然你从后面看不到小A的表情，但从她摆出的攻击姿态来看，她可能正努力让自己的脸看起来尽可能严厉——尽管她仍然试图用" + weaponNameLong() + "尽可能地保护自己的身体。当海葵向前迈出一步时，除了首领之外，所有的地精都向后退了一步。两人现在正互相盯着对方；一个抬头，一个低头。");
            outputText("[pg][say: 哟，我们这儿有个蓝色的硬茬，]地精说着，举起双手做作地摆出警惕的姿势。还没等任何人反应过来，她就伸手到背后抓起一个绑在那里的药瓶，咕哝着从头顶朝海葵扔去。药瓶砸在小A的肩膀上碎裂开来，绿色的液体溅满了她的一侧鳃和胸口。当地精得意地大笑时，蓝色的女孩低头看了一眼。");
            outputText("[pg][say: 感觉怎么样，你……你……你不觉得恶心吗？一点都不？]当地精发言人看到海葵小心翼翼地从皮肤上刷掉玻璃碎片，似乎完全没有受到毒药的影响时，她短暂地吃了一惊。小A再次抬起头，继续与地精对视，而那群地精则在她身后呈半圆形散开，警惕地与两人保持着宽阔的距离。");
            outputText("[pg][say: 听着，小丫头，]那个孤零零的地精继续说道，明显有些动摇。[say: 马上让开，不然……不然我就……他妈的揍扁你！]地精摆出了一个明显的重拳姿势，当她的对手没有动弹时，她直接一拳打向小A，而小A则睁大了好奇的眼睛，用肚子接下了这一拳。地精的拳头收了回来，她的眼睛瞪得大大的，因为海葵有弹性的表皮又弹回了原状；几乎在同一时间，那群地精又向后退了一步。小A再次抬起头，地精发言人一边后退一边结结巴巴地说着。");
            outputText("[pg][say: 别以为这事就这么完了，你这个蓝色的怪物！]她转过身大喊道。[say: 我们会回来的！走吧，你们这些贪婪的婊子。]伴随着许多抱怨声，那群地精在她周围集结并开始离开。小A看着她们走了一会儿，然后转过身来看着你，脸上写满了困惑。你感激地笑了笑，然后回到了床上。[pg]");
         }
      }
      
      public function giveMino() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         get_player().consumeItem(get_consumables().MINOCUM);
         outputText("你对女孩点点头，她笑了笑，非常小声地回了一句[say: 耶。] 当你捡起剩下的东西时，她拔掉瓶塞，像个勇者一样一饮而尽，甚至连气都不喘。当药效发作时，她的眼睛微微睁大，然后眯成一条缝，眼神迷离。她扑通一声扔下瓶子，又扑通一声跪倒在地。她看着你，舔了舔嘴唇，开始玩弄自己的乳头。显然，她感觉很爽。");
         if(get_player().get_lust() < 30)
         {
            outputText("看着她的爱抚演变成彻底的自慰，你自己的");
            if(get_player().cockTotal() > 0)
            {
               outputText("[cock]变得有些勃起");
            }
            else if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0) + "因渴望而有些隐隐作痛");
            }
            else
            {
               outputText("[asshole]开始因渴望而发麻");
            }
            outputText("。你摆脱了这种感觉，转身走回营地，留她自己寻欢作乐。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("随着她的爱抚演变成真正的自慰，你意识到这是一个解决你自己欲望的好机会。如果你要这么做，你会怎么做？");
         menu();
         addButton(0,"你的屁股",victoryButtholeRape);
         if(get_player().hasCock())
         {
            addButton(1,"你的肉棒",rapeAnemoneWithDick);
         }
         else
         {
            addButtonDisabled(1,"你的肉棒");
         }
         if(get_player().hasVagina())
         {
            addButton(2,"你的小穴",rapeAnemoneWithPussy);
         }
         else
         {
            addButtonDisabled(2,"你的小穴");
         }
         setExitButton();
      }
      
      public function giveAnemoneWeapon() : void
      {
         var giveableToAnemone:Function;
         var _gthis:AnemoneScene;
         var _loc4_:int = 0;
         _gthis = this;
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你想给她什么？");
         giveableToAnemone = function(param1:ItemType):Boolean
         {
            if(!(param1 == _gthis.get_consumables().W__BOOK || param1 == _gthis.get_consumables().B__BOOK || param1 == _gthis.get_consumables().W_STICK || param1 == _gthis.get_useables().TELBEAR && _gthis.get_silly() || param1 is Weapon))
            {
               return param1 == _gthis.get_shields().DRGNSHL;
            }
            return true;
         };
         menu();
         get_game().output.hideUpDown();
         var _loc1_:ButtonDataList = new ButtonDataList();
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = _loc3_++;
            if(get_player().itemSlots[_loc4_].quantity > 0 && Boolean(giveableToAnemone(get_player().itemSlots[_loc4_].itype)))
            {
               _loc1_.push(get_player().itemSlots[_loc4_].buttonData((function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var slot:Array = param2;
                  return function():void
                  {
                     _g[0].placeInAnemone(int(slot[0]));
                  };
               })([this],[_loc4_])));
               _loc2_ = true;
            }
         }
         if(!_loc2_)
         {
            outputText("[pg]<b>你没有合适的物品让你的子嗣拿着。</b>");
         }
         _loc1_.submenu(approachAnemoneBarrel,true);
      }
      
      public function getRidOfAnemone() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("够了。你鼓起勇气，抓住海葵的上臂，把她拉了起来；她轻得像一根装饰性的羽毛，一旦她明白了你的意图，她的伪装反射就会接管，她的蓝色就会加深一倍。你把一只手臂放在她身下，把她的腿从下面抱出来，把她整个从木桶里举起来，然后把她放在坚硬的地上。她泪眼汪汪地向你撅起嘴，但你把头转了过去。你拿起几乎空了的容器，把它放在肩膀上，开始向小溪走去。女孩跌跌撞撞地跟在你后面，脚步不稳。");
         outputText("[pg]到达目的地后，你把海葵以前公寓里的东西倒进了潺潺的小溪里，然后指着下游的湖泊，咬紧牙关。看着你冷酷的神情，蓝色的女孩走进水里，弄湿了她的鳃，然后开始了回到她祖先家园的漫长跋涉。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,454,-1);
         doNext(playerMenu);
      }
      
      public function getAnemoneItem() : void
      {
         var _loc1_:* = null as ItemType;
         var _loc2_:* = null as Array;
         var _loc3_:Number = NaN;
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你弯下腰捡起她的礼物。今天，她给你留下了");
         if(kidAXP() == 0)
         {
            _loc1_ = get_consumables().DRYTENT;
         }
         else if(kidAXP() < 50)
         {
            _loc2_ = [get_consumables().INCUBID,get_consumables().SUCMILK,get_consumables().IMPFOOD,get_consumables().GOB_ALE,get_consumables().SLIMYCL,get_consumables().L_DRAFT,get_consumables().W_FRUIT,get_consumables().EQUINUM,get_useables().GREENGL];
            _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
         }
         else if(kidAXP() < 75)
         {
            _loc2_ = [get_consumables().W__BOOK,get_consumables().BEEHONY,get_consumables().OVIELIX,get_consumables().SHARK_T,get_armors().S_SWMWR,get_consumables().L_DRAFT,get_useables().B_CHITN];
            _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
            if(Utils.rand(100) == 0)
            {
               _loc1_ = get_consumables().BIMBOLQ;
            }
         }
         else if(kidAXP() < 100)
         {
            _loc2_ = [get_consumables().MINOBLO,get_weapons().L__AXE,get_armors().C_CLOTH,get_consumables().L_DRAFT,get_weapons().L_DAGGR];
            _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
            if(Utils.rand(100) == 0)
            {
               _loc1_ = get_consumables().BROBREW;
            }
         }
         else
         {
            _loc3_ = Utils.rand(100);
            if(_loc3_ == 0)
            {
               _loc1_ = get_consumables().BROBREW;
            }
            else if(_loc3_ == 1)
            {
               _loc1_ = get_consumables().BIMBOLQ;
            }
            else
            {
               _loc2_ = [get_consumables().TSTOOTH,get_consumables().S_GOSSR,get_consumables().B_GOSSR,get_useables().T_SSILK,get_consumables().REPTLUM];
               _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
            }
         }
         outputText(_loc1_.get_longName() + "。");
         if(_loc1_ == get_weapons().L__AXE)
         {
            outputText("天哪……她是怎么把这东西拖回家的！？");
         }
         outputText("[pg]");
         get_inventory().takeItem(_loc1_,approachAnemoneBarrel);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,455,get_game().time.days);
      }
      
      public function fuckingAssholelessAnemoneeeez() : void
      {
         clearOutput();
         outputText("该死。你的兴致全被毁了，现在软得像泡在牛奶里的吐司。你猛地直起身子，收起你的宝贝。");
         outputText("[pg][say: 没有吃的吗？]她转过身，撅起嘴看着你说道。");
         outputText("[pg][say: 别担心，我给你准备了点东西。]你把一只手放在背后，看着她的脸亮了起来，然后把手抽出来，中指直指天空。[say: 吃这个吧。]当她意识到被拒绝时，你把湖底的湿沙踢到她备受打击的脸上，气呼呼地大步走开。");
         dynStats(DynStat.Lust(-20));
         get_combat().cleanupAfterCombat();
      }
      
      public function evictANemone() : void
      {
         clearOutput();
         outputText("真的要赶走海葵吗？");
         spriteSelect(SpriteDb.get_s_kida());
         doYesNo(reallyEvictDaAnemone,approachAnemoneBarrel);
      }
      
      public function dontGiveMino() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         outputText("你严厉地看着这个蓝色的女孩，伸出了手。当她意识到你不打算把瓶子给她时，她的脸变成了半撅嘴半皱眉的表情。见你没有反应，她把瓶子扔在你脚边，大喊道：[say: 小气鬼！] 你弯腰捡起瓶子和其他东西，当你直起身子时，她看起来非常生气，触手到处挥舞。糟了。你举起武器，海葵发出施虐般的咯咯笑声，发起了攻击！[pg]");
         var _loc1_:Anemone = new Anemone();
         startCombat(_loc1_);
         dynStats(DynStat.Lust(4));
         _loc1_.applyVenom(1);
      }
      
      public function defeatAnemone() : void
      {
         var _g:LustyMaidensArmor;
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("海葵的膝盖弯曲，她瘫倒在地，双手撑在身后，溅起一片水花。你站在她上方，取得了胜利。[pg]");
         }
         else
         {
            outputText("海葵瘫倒在地，开始自慰，疯狂地抚摸着她的阴茎。你觉得你能从她不透明的眼睛里察觉到类似绝望的东西。看起来她不会再找你麻烦了。[pg]");
         }
         menu();
         addButtonDisabled(0,"你的屁股");
         addButtonDisabled(1,"你的肉棒");
         addButtonDisabled(2,"你的小穴");
         addButtonDisabled(3,"她的屁股");
         addButtonDisabled(4,"产卵");
         if(get_player().get_lust() >= 33)
         {
            outputText("你总是可以随心所欲地对待她。如果你这样做，你会用哪些部位来办事？");
            addButton(0,"你的屁股",victoryButtholeRape);
            if(get_player().hasCock())
            {
               addButton(1,"你的肉棒",rapeAnemoneWithDick);
            }
            if(get_player().hasVagina())
            {
               addButton(2,"你的小穴",rapeAnemoneWithPussy);
            }
            if(get_player().hasVagina() && get_player().getClitLength() >= 4 || get_player().hasCockThatFits(48))
            {
               addButton(3,"她的屁股",anemoneButtPlugginz);
            }
            if(get_player().canOviposit())
            {
               addButton(4,"产卵",anemoneGetsLayedByBeePositor);
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
            {
               addButton(12,"吞噬入腹",anemoneFunWithUnbirthing).hint("喂养你子宫里的寄生虫。");
            }
            if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armor() is LustyMaidensArmor)
            {
               _g = get_player().get_armor();
               addButton(5,"B.Titfuck",function():void
               {
                  _g.lustyMaidenPaizuri();
               });
            }
         }
         setSexLeaveButton();
      }
      
      public function approachAnemoneBarrel() : void
      {
         var _g:Camp;
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你走到木桶边。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,455) != get_game().time.days)
         {
            outputText("旁边放着一件物品，是海葵留给你的礼物。或者如果你愿意这么想的话，也可以说是“租金”。");
         }
         if(457 in KFLAGS.flags.h)
         {
            outputText("她把" + weaponNameLong() + "放在旁边。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) > 1)
         {
            outputText("小A现在不在，去帮忙调教玛布尔的孩子们了。如果你想留下或拿走一件物品，她回来时会发现的。");
         }
         else if(kidAXP() < 25)
         {
            outputText("小A沉到边缘以下，紧张地看着你。");
         }
         else if(kidAXP() < 75)
         {
            outputText("小A探出头来，对你微笑。");
         }
         else
         {
            outputText("小A把头和肩膀探出木桶，手肘撑在边缘，双手托着下巴，毫不掩饰地盯着你。");
         }
         outputText("你需要她做什么？");
         if(get_camp().isGuard("小A"))
         {
            outputText("[pg]<b>小A目前正在夜间放哨。</b>");
         }
         menu();
         if(457 in KFLAGS.flags.h)
         {
            addButton(5,"拿走武器",takeOutOfAnemone).hint("拿走她的武器。");
         }
         else
         {
            addButton(5,"给予武器",giveAnemoneWeapon).hint("给她一把武器。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,455) != get_game().time.days)
         {
            addButton(6,"物品",getAnemoneItem).hint("收下她的礼物。");
         }
         else
         {
            addButtonDisabled(6,"物品","她现在没有什么可以给你的。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) <= 1)
         {
            addButton(0,"外貌",kidAAppearance).hint("看看小A");
            if(457 in KFLAGS.flags.h && get_player().fatigueLeft() >= 10)
            {
               addButton(1,"指导",tutorAnemoneKid).hint("和她进行一次训练。");
            }
            else if(!(457 in KFLAGS.flags.h))
            {
               addButtonDisabled(1,"教导","你应该先给她某种武器。");
            }
            else if(get_player().fatigueLeft() < 10)
            {
               addButtonDisabled(1,"教导","你太累了，无法教导小A。");
            }
            if(get_camp().isGuard("小A"))
            {
               addButton(4,"停止守卫",anemoneWatchToggle).hint("让小A晚上不要再防备敌人了。");
            }
            else if(!(457 in KFLAGS.flags.h))
            {
               addButtonDisabled(4,"守卫营地","你的海葵女儿如果没有武器，晚上就无法保护你。");
            }
            else
            {
               addButton(4,"守卫营地",anemoneWatchToggle).hint("让小A晚上防备敌人。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,758) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) >= 2)
            {
               addButton(2,"性爱",kidASexMenu);
            }
            else
            {
               addButton(2,"自慰",kidAMasturbation);
            }
            addButton(10,"驱逐",evictANemone);
         }
         _g = get_camp();
         addButton(14,"返回",function():void
         {
            _g.campFollowers();
         });
      }
      
      public function anemoneWatchToggle() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         if(get_camp().isGuard("小A"))
         {
            outputText("你告诉小A晚上不用守夜了。她朝你点了点头。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,456,0);
         }
         else if(!(457 in KFLAGS.flags.h))
         {
            outputText("你不会真的打算让这个手无寸铁的小家伙在晚上守夜吧？！她的头发甚至还没长出来！你最好给她一把武器。");
         }
         else
         {
            outputText("小A笑着欢呼道，[say:守卫！]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,456,1);
         }
         doNext(approachAnemoneBarrel);
      }
      
      public function anemoneQuoteUnquoteAnal() : void
      {
         clearOutput();
         var _loc1_:Boolean = get_player().hasCockThatFits(48);
         var _loc2_:int = 0;
         get_images().showImage("anemone-bj");
         if(_loc1_)
         {
            _loc2_ = get_player().cockThatFits(48);
         }
         outputText("你现在满脑子都是肛交，那就来肛交吧。");
         if(!get_player().isTaur())
         {
            outputText("作为一个纯粹主义者，你抚摸着你的");
            if(_loc1_)
            {
               outputText(get_player().cockDescript(_loc2_));
            }
            else
            {
               outputText(get_player().clitDescript());
            }
            outputText("直到它从你[armor]的开口处挺立出来，恢复了完全勃起的状态。");
         }
         outputText("当你靠近她时，海葵目不转睛地注视着你，然后");
         if(!get_player().isTaur())
         {
            outputText("抓住她的头");
         }
         else
         {
            outputText("骑上她的头");
            if(!_loc1_)
            {
               outputText("，将你的阴蒂抵在海葵的额头上，使其顺着你的小腹向前挺立");
            }
         }
         outputText("；她的头发拂过你的皮肤，带来阵阵毒液的刺痛感，同时她的双手也在你的[skin]上调皮地游走。你二话不说，把她的头按向你的腹股沟，同时将你肿胀的");
         if(!_loc1_)
         {
            outputText("带把妹的-");
         }
         outputText("肉棒塞进她渴望的脸庞。");
         outputText("[pg]她湿润的小嘴迎接你快速插入的");
         if(_loc1_)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("，起初有些惊讶，随后便津津有味地享受起来。当你滑过她的双唇时，你的");
         if(_loc1_)
         {
            outputText("[cockHead " + (_loc2_ + 1) + "]");
         }
         else
         {
            outputText("顶端");
         }
         outputText("被她喉咙里起伏的肉壁紧紧包裹，已经开始试图榨取你的精液");
         if(!_loc1_)
         {
            outputText("，尽管你并射不出来");
         }
         outputText("。那紧致感似乎在自动适应");
         if(_loc1_)
         {
            outputText("你肉棒的粗细");
         }
         else
         {
            outputText("你肿胀阴蒂的粗细");
         }
         outputText("；海葵抬起头，用");
         if(get_player().isTaur())
         {
            outputText("看不见的");
         }
         outputText("双眼闪烁着光芒");
         if(get_player().balls > 0)
         {
            outputText("，她的头发向前伸来抚摸你的[sack]，透过薄薄的皮肤注入针刺般的毒液，让你的性欲和精液分泌都进入了超负荷状态");
            if(!get_player().hasCock())
            {
               outputText("。随着你的[balls]因充血和精液而肿胀，你忍不住呻吟起来；这些多余的液体无处可去，只能留在你体内直到被身体重新吸收——或者你给自己找个发泄口");
            }
         }
         outputText("。你的臀部接管了控制权，粗暴地向她挺进，撞得她的头前后摇晃。她的触手狂乱地飞舞着，在你猛烈抽插她的嘴时，拂过你的肚子和臀部，在你的[skin]上留下一道道微热的痕迹，这些热量渗入你的身体，只会让你更想高潮。");
         outputText("[pg]没过多久，在她的刺细胞的触摸辅助下，那条顺从、自我调节的通道就让你达到了高潮……你试图放慢臀部的节奏，以延长乐趣，但你的情人可不答应。当你慢慢拔出准备再次缓缓插入时，她的头发缠绕住了你的");
         if(_loc1_)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("，猛烈地套弄起来，甚至沿着你的柱身抹上一层灼热的快感。[say: 操——操，]你呻吟着，被这突如其来的一击推向了失控的边缘。");
         if(_loc1_)
         {
            outputText("你的[cockFit 48]开始射精，用你的精液填满了蓝皮肤女孩的嘴；她贪婪地吸吮着，吞下每一滴。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("你射入她体内的精液如此之多，以至于她的肚子实际上因为这庞大的体积而变圆了，从平坦光滑的腹部变成了一个几乎装不下的、晃荡着液体的圆球");
            }
            if(get_player().cumQ() >= 2000)
            {
               outputText("；甚至当她肚皮上的皮肤无法再拉伸时，你的身体依然没有停止填满她，隆起的部分沿着她的食道向上扩张，撑起了她的胸部和喉咙，直到她被填得满满当当，看起来颇像一个巨大的蓝色梨子");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("。");
            }
            outputText("[pg]心满意足后，你从海葵的喉咙里拔了出来，带出一条从她嘴角流下的精液。她打了个嗝，醉醺醺地咯咯笑着，然后把它擦掉，并从手上舔干净。[say: 谢谢！]她欢快地说；她撅起嘴唇想要一个吻，但你把她推开了。");
            outputText("[pg][say: 不客气……]你把她留在那里，");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她试图从浅水区离开时，圆滚滚的身体在水里上下浮动，");
            }
            outputText("然后转身回营地。");
         }
         else
         {
            outputText("你那布满神经的阴蒂在她的套弄下颤抖着，引发了你的高潮，你仰起头，把它埋进她的喉咙里。海葵退缩了一下，你没有注意到，因为你的阴道");
            if(get_player().wetness() < 4)
            {
               outputText("沿着你的柱身流下润滑液。");
            }
            else
            {
               outputText("淫荡地喷出潮吹，用你女性高潮的淫液涂满了你的柱身和她的脸。");
            }
            outputText("当近乎痛苦的快感折磨着你时，你的身体颤抖着，被海葵那探索的通道所吞没");
            if(get_player().balls > 0)
            {
               outputText("。你的情人满怀希望地看着，等待着你的睾丸升入腹股沟并卸下它们的货物");
            }
            if(get_player().cockTotal() == 0)
            {
               outputText("；她甚至试图自己用手把它们推上去，就好像那样能让你的阴蒂产生里面的精液一样");
            }
            outputText("。");
            if(get_player().hasCock())
            {
               outputText("你的阴蒂依然没有产出；你的男性高潮无用地在她头部周围喷射而出，与湖水混合在一起。女孩看到这一幕表情痛苦，她试图挣脱去追逐那些呈弧线飞出的白色精液，但失败了，这让你的敏感阴蒂肉棒传来一阵阵快感的痉挛。");
            }
            outputText("最终，你的身体平静下来，能够回应你的冲动，你小心翼翼地将你的[clit]从情人的喉咙里抽出来。");
            outputText("[pg][say:没有食物，]她撅着嘴抱怨道。你漫不经心地摇了摇头");
            if(get_player().hasCock())
            {
               outputText("，指着在湖水中慵懒漂浮的弯曲精液，");
            }
            outputText("然后离开了她。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-0.5),DynStat.Sens(-0.5));
         get_combat().cleanupAfterCombat();
      }
      
      public function anemonePreg() : void
      {
         get_player().knockUp(10,256,101);
      }
      
      public function anemoneKidBirthPtII() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kida());
         outputText("你醒来，抬头看向太阳，想知道现在是什么时间。映入眼帘的更像是一场日食；一个形状挡住了你的视线。当你的眼睛适应了光线后，它变成了一张倒置的蓝眼睛、蓝皮肤的脸，周围环绕着紫色和绿色相间的及肩短触手。当你盯着它看时，沉默还在继续，直到你准备从坚硬的地面上爬起来。一有动静，那个脑袋就伴随着水声消失在水桶里。你站稳[feet]，回头看向它；那双眼睛现在正过来了，害羞地从水桶边缘的一双蓝色手指上方偷看。");
         outputText("[pg]你试探性地打了个招呼。");
         outputText("[pg]眼睛抬了起来，下面露出了微笑。[say: 嗯……嗨！]");
         outputText("[pg]你跨过几步走到水桶和里面的住客面前；灿烂的笑容依然存在");
         if(get_player().get_tallness() > 48)
         {
            outputText("即使脸向上倾斜以保持眼神交流");
         }
         outputText("。往桶里看，你能看清一点，尽管她大部分的乳沟都被一双瘦长的膝盖遮住了。之前注意到的脑袋位于一双狭窄、单薄的肩膀上，肩膀上长着同样看起来很结实的手臂。她举起一只手，用小指跟你挥了挥。");
         outputText("[pg]你问她是否愿意从桶里出来。由于她随后没有反应，你补充说你碰巧从那里喝水。");
         outputText("[pg]她依然待在原地。好吧，既然如此……你抓起挂在木桶边的水瓢，做了一个舀水的动作——做完后指了指容器——然后把它倾斜到嘴边，深深地咽了一口。她的眼睛亮了起来，急切地向你点头。她从你手中接过水瓢，站了起来。");
         outputText("[pg]现在她小腿以上的部分都露了出来，你可以看清她更多的细节。她胸部所暗示的笨拙棱角感贯穿了全身；虽然她的身高已经达到了她这个种族的极限，但她那对小乳房——绝对不超过A罩杯——几乎被下垂的鳃完全遮住了，这些鳃对她的胸部来说大得有些滑稽。她的躯干很苗条，相比之下，臀部则显得更有曲线，在腰部以下平缓地向外倾斜，向下延伸成细长的双腿，形成了一个大致的女性结构，尽管看起来像是资金不足的建筑商建造的。一根蓝色的肉棒挂在她的骨盆上，在双腿之间的空隙中晃荡。无论你怎么看，这个女孩都很瘦。");
         outputText("[pg]然后……她把水瓢伸进脚踝周围的木桶里。你可以听到水瓢在桶壁和桶底刮擦的声音，她正把它晃来晃去地装满水。她礼貌而小心地把水瓢递还给你，然后重新坐下，水位微微上升，盖住了她的腿。你盯着水瓢，又看了看她；她毫不退缩地回望着你，一只手闲散地把一些液体泼在她裸露的鳃上。");
         outputText("[pg]她指望你喝这个吗？她打算住在你的营地里吗？如果不说一句他们的语言或使用武力，要把一个人从你的水桶里赶出去，难道不是极其费力吗？你的大脑不愿意去思考这些问题的答案——这也难怪，因为答案都是各种形式的“是的”——而是像抓住救命稻草一样抓住了一些琐碎的事情。水位绝对比你小睡前离开时要低。也许她在长大的过程中通过皮肤吸收了水分？这或许可以解释为什么她的臀部和大腿比她的胸部和“头发”发育得更好。");
         outputText("[pg]为了让你犹豫不决的大脑转到真正的问题上，你改变了策略，再次向她搭话；在笨拙的哑剧动作的辅助下，你问她是否打算永远呆在你的木桶里。她咧嘴笑了，眼睛亮了起来，然后装模作样地优雅地鞠了几次躬。哦……她以为这是一个邀请。面对她那令人愉快的镇定自若，你泄了气，肩膀也耷拉了下来。看来言语是行不通了；你必须用拳头来对付她。你要把这只海葵赶出你的营地吗？");
         menu();
         addButton(0,"留下她",keepAnemoneKid);
         addButton(1,"赶走她",getRidOfAnemone);
      }
      
      public function anemoneGetsLayedByBeePositor() : void
      {
         if(get_player().canOvipositSpider())
         {
            spiderOvipositAnAnemone();
            return;
         }
         clearOutput();
         get_images().showImage("anemone-egg");
         outputText("当你把产卵管插入她体内时，这个女孩身上的触手唱起了塞壬之歌，乞求你品尝它们那充满毒液的贪婪爱抚……甚至连周围那些蓝色的小触须也");
         if(get_monster().get_HP() < 1)
         {
            outputText("斜倚着");
         }
         else
         {
            outputText("用力自慰");
         }
         outputText("女孩的小穴在呼唤你。你昆虫般的腹部随着卵的移动而跳动，排成一列准备产卵，你那又长又黑的产卵管滑了出来，随着你的心跳而跳动。让那些触角抚摸你奇怪的器官，同时卸下你积压的卵，这个想法听起来太棒了，以至于渗出了一滴蜂蜜，空气中弥漫着甜美的气味，让你的");
         if(get_player().antennae.type > 0)
         {
            outputText("触角");
         }
         else
         {
            outputText("鼻子");
         }
         outputText("刺痛。当你的黑色肉棒流出汁液时，海葵的眼睛亮了起来，她向前倾身，用手指接住花蜜，然后送到唇边。");
         outputText("[pg]你看着她用舌头卷起你的花蜜，性欲不断高涨；她尝到味道后睁大了眼睛，讨好地对你微笑。[say:好甜……还要吗？]她娇声说道，向你撅起嘴唇。");
         outputText("[pg][saystart]只要你别再做那个愚蠢的");
         if(get_silly())
         {
            outputText("鸭子");
         }
         outputText("脸，[sayend]你回答道。");
         outputText("[pg]海葵看起来有些疑惑，但还是用一只手握住你的产卵管，把它拉近。你任由她把你拉近，将那黑色的、湿润的尖端贴在她的嘴上，她举起另一只手开始抚摸。当又一团花蜜形成时，你舒服地打了个寒颤，而海葵看着你的反应，狡黠地笑了。她将两根触手滑入掌心，在手淫中加入了她刺细胞那令人爱抚、黏糊糊的感觉！你的血管放松，产卵管充满了温暖、颤动的热量，你的[legs]开始摇晃；感觉如此模糊，以至于你甚至没有注意到它什么时候开始不断渗出你的花蜜。然而，当她把你的肉棒举到唇边，并大胆地把舌头直接伸进洞里时，你确实注意到了！");
         outputText("[pg]当女孩那小巧冰凉的肌肉探入你的产卵管内部时，你发出一声无言的呻吟。她急切地抚摸着根部，迫使更多的蜂蜜涌向末端供她舔舐；每当一团蜂蜜涌上来，她的舌头就会贪婪地将其卷起，在你黑色的蜜蜂肉棒内部的神经上留下一道令人酥麻发痒的痕迹。操，你根本忍不住了……你的第一枚卵被推了出来，撑开了海葵的嘴唇，进入了她的嘴里。");
         outputText("[pg][say: 疙疙瘩瘩的……？]你选中的容器皱着眉头退开，更多的卵从你的器官中喷出，她把嘴里的那个和它们一起吐到了湖水里。被她握在手里的产卵管在手和触手的包裹下蠕动着，缓慢而令人不满地将球体排入水中，而她则在决定该怎么做。");
         if(get_player().sens >= 50 || get_player().isTaur())
         {
            outputText("[pg][say: 真奇怪，]她简短地说着，再次用双手开始套弄你的产卵管；你浑身颤抖，试图用意志控制双臂去阻止她那令人愉悦的攻势，但它们根本不听使唤。当她用触手在你那黑色的伪根上涂抹时，你的决心瞬间瓦解，很快，在海葵毒液那包容的温暖中，你的管子开始向空气中喷射卵子。这个厚颜无耻的女孩继续用四根触手和一只手抚摸着你，同时从你的分泌物中精挑细选出你那如蜜般的汁液，并将混在其中的卵子吐出来。你的身体甚至毫不在意，只是不断地将一颗又一颗的卵子排入波涛汹涌的水面上那层不断蔓延的薄膜中。");
            if(get_player().hasCock())
            {
               outputText("[pg]你急忙解开盔甲，因为你的");
               if(get_player().totalCocks() == 1)
               {
                  outputText("男性器官爆发");
               }
               else
               {
                  outputText("男性器官爆发");
               }
               outputText("出同情，将精液喷射到你的伴侣身上。令人惊讶的是，海葵甚至没有注意到，她太专注于试验你那经过改造的毒刺了。");
            }
            if(get_player().eggs() > 40)
            {
               outputText("最终，卵子太多了");
               if(get_player().hasCock() && get_player().cumQ() > 1000)
               {
                  outputText("还有那么多的精液");
               }
               outputText("以至于它们开始在她周围堆积，像码头柱子上白色的黏滑藻类一样，在她的腹部结块并层层叠叠。");
            }
            outputText("当最后一颗卵从你体内滚出时，海葵再次将你萎缩的产卵管举到唇边，急切地吸吮着最后流出的长长黏滑的甜美分泌物。");
            outputText("[pg][say:好奇怪，]她重复道，拉扯着那个试图缩回你缝隙的干瘪器官。");
            outputText("[say:呃……]你回应道，[legs]发软。你猛地一抽，把腹部从她的抓握中挣脱出来，当她的皮肤摩擦到你敏感的缝隙时，你瑟缩了一下，然后转身准备离开。她抓住你的手，看起来几乎有些担忧。");
            outputText("[pg][say:块块……]海葵指着你废弃的卵说道。[say:看……医生？]");
         }
         else
         {
            outputText("[pg]你没有这种犹豫；你要侵犯她。尽管舌头感觉很好，但你的身体想把这些卵产在什么东西里。没有骨头，你永远也够不到她的小穴，但是……只要是个洞就行。你双手抓住海葵的脸，把黑色的器官塞进她嘴里，直没至根。");
            outputText("[pg][say:唔唔！]当下一批卵滑入她体内时，蓝色的女孩挣扎着试图挣脱；她的手伸向你的手，试图掰开你的手指，但随着你专注于释放，你的握力如老虎钳般重新增强。滑溜溜的球体像弹珠一样滚下她的喉咙，疯狂席卷了你，沉甸甸地落在她的胃里。");
            if(get_player().eggs() < 20)
            {
               outputText("没过多久你就结束了，把你的货物排成整齐有序的一排推下她的通道。");
            }
            else
            {
               outputText("来得太多了，你都能在她的皮肤下看到它们，无数微小的凸起");
               if(get_player().eggs() >= 40)
               {
                  outputText("；随着你饱受折磨的腹部排出一排又一排的卵，这些凸起向上倍增，很快你就能感觉到它们反过来挤压你产卵管的尖端。你双手挤压着女孩的头，把她按在根部，集中注意力；慢慢地，产下的卵给它们的兄弟姐妹让路，把她有弹性的胃和胸部撑得宽宽的");
               }
               outputText("。");
            }
            outputText("[pg]如释重负，你从湿润的嘴里拔出缩小的管子；几颗零星的卵从上面掉下来，落入水中。海葵揉着肚子，看起来明显有些恶心。");
            outputText("[pg][say:硬硬的……]她呻吟着，按着腹部皱着眉头。[say:恶心……]");
            outputText("[pg]那太糟糕了。");
            if(get_silly() && get_player().fertilizedEggs() > 1)
            {
               outputText("你短暂地自娱自乐了一下，想象着她怀着你的卵直到足月，然后让它们在她的嘴里孵化，这样当她说话时，就会喷出蜜蜂。尼古拉斯·凯奇会为你感到骄傲的。");
            }
            outputText("收拾好你的东西，你对她" + get_player().mf("laugh","giggle") + "了一声，然后离开了。");
         }
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function anemoneFunWithUnbirthing() : void
      {
         spriteSelect(SpriteDb.get_s_anemone());
         clearOutput();
         get_player().slimeFeed();
         outputText("你让寄生虫把你翻转过来，然后退回你的子宫，这样海葵就可以用传教士体位操你，让你那如山般的肚子颤抖。在被击败的双性人面前，你享受着这种臃肿和“无助”带来的变态快感。没有了“孩子们”的帮助，你完全被自己那宽大子宫不可思议的重量压在下面。你的肋骨嘎吱作响，由于肺部被自身重量挤压，你只能短促地喘息，但你子宫里那些魔法生物的存在，让你免受自身重量带来的伤害或不适。[pg]");
         outputText("经过片刻尴尬的等待，你发出一声不满的咕哝，因为你意识到海葵并没有领会你的暗示。在你目前的姿势下，你几乎只能看到你的" + get_player().allBreastsDescript() + "和大片肚皮上的肉，但你想象着那个生物仍然坐在地上，现在正处于你肚子的阴影中。[say:来吧，小可爱，]你说，[say:别让妈妈等太久。][pg]");
         outputText("你感觉到两只手停留在你肚子底部的隆起处，远远超出了你的视线或触及范围。你把自己的手按在肚子的顶部，就在它隆起挤压你脸和乳房的地方。[say:就是这样，宝贝，]你喘着气说，[say:让妈妈舒服点。][pg]");
         outputText("触手向上推挤着你那流着粘液的爱之盒的入口，当海葵为你口交，同时挑逗着你的阴蒂和你那被粘液撑爆的婴儿气球的下部时，你发出鼓励的呼噜声。就在你的孩子们厌倦了你的游戏时，你高潮地叫了出来，它们缠住毫无防备的海葵的头，把它拉进你的子宫，速度之快，它甚至没有机会叫出声来。[pg]");
         outputText("[say:调皮，调皮，]你摇着手指对你的史莱姆宝宝们说，它们从你的私处钻出来，在你周围渗出，扶正你庞大的身躯，这样你就可以继续狩猎了。[say:妈妈还没完呢。]你的猎物通常在进入你的子宫时已经被折磨得精疲力竭了，而活泼的海葵挣扎着想要弄明白刚才发生了什么并试图逃跑的感觉，加上它那丰富的性毒液从你的核心向外渗入你身体其他部位时带来的温暖刺痛感，让你的小穴饥渴难耐，口水直流。你决定现在也许是去湖边洗个澡的好时机。[pg]");
         get_player().cuntChange(get_monster().cockArea(0),true);
         get_player().orgasm("Vaginal");
         get_player().addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,-2);
         dynStats(DynStat.Spe(-0.5),DynStat.Sens(3),DynStat.Cor(2));
         anemonePreg();
         get_combat().cleanupAfterCombat();
      }
      
      public function anemoneFollower() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0;
      }
      
      public function anemoneButtPlugginz() : void
      {
         clearOutput();
         outputText("你已经想象着自己的高潮，打量着这只海葵。你的目光在她的乳房上流连；她诱人地挺起胸膛，试图引起你的兴趣");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("，同时自慰着");
         }
         outputText("。不错，但不是你想要的……");
         if(!get_player().isTaur())
         {
            outputText("稍微解开你的[armor]，你抚摸着");
            if(get_player().hasCock())
            {
               outputText("[oneCock]");
            }
            else
            {
               outputText("你的" + get_player().vaginaDescript(0));
            }
            outputText("，同时你");
         }
         else
         {
            outputText("你");
         }
         outputText("绕到她身后。当你打量她时，海葵回头看了你一眼。就是那里……这正是你想看的。你把手放在她的肩膀上，让她向前倾斜，然后低下身子，以便更好地观察她的背面。");
         outputText("[pg]当你把手顺着她的背滑上，轻轻按压让她进一步弯下腰时，那圆润的蓝色臀瓣翘了起来。你用另一只手在上面揉捏，挤压，最后拍了一巴掌。她挨了这一下，发出一声可爱的惊呼，然后对着你扭动屁股，仿佛在进一步诱惑你。这招很管用；");
         if(get_player().hasCockThatFits(48))
         {
            if(!get_player().isTaur())
            {
               outputText("你从衣服里掏出你的[cockFit 48]并用它摩擦");
            }
            else
            {
               outputText("你摩擦着你的[cockFit 48]");
            }
            outputText("在那光滑的蓝色曲线之间");
         }
         else
         {
            if(!get_player().isTaur())
            {
               outputText("你用手指抠弄着自己的小穴");
            }
            else
            {
               outputText("你想象着她小穴的紧致");
            }
            outputText("直到你的[clit]开始充血并从包皮中探出头来");
         }
         outputText("，惹得她咯咯直笑");
         if(get_player().hasCock() && get_player().hasCockThatFits(48))
         {
            outputText("，同时你将一滴先列腺液抹在她的股沟里");
         }
         outputText("。她放下双手，试图翘起屁股，让你的位置对准她的小穴；你更用力地拍了她一下，强迫她趴回去，这让她十分困惑。那蓝色的侧脸再次从她肩头出现，这次带着担忧的表情。你张开手掌捏了一下她的屁股，然后俯下身在上面印下一吻。当你掰开她的臀瓣时，这个蓝色的女孩发出了紧张的窃笑。");
         outputText("[pg]你发现……什么都没有。没有屁眼，完全没有。只有一对光滑的蓝色曲线，中间什么都没有！这后面简直就像儿童动画片一样！[say:搞什么鬼……？]你脱口而出。");
         outputText("[pg]被你的声音和突然的寂静所惊吓，她在你身下发抖，比平时更加不知所措。[say:喂！]你大喊道，你那半软的");
         if(get_player().hasCockThatFits(48))
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("已经慵懒地垂向水面。她转过头，用眼角余光看着你，脸上写满了紧张与期待。");
         outputText("[pg][say: 洞在哪儿？]你质问道，指着自己的[ass]作为示范。");
         outputText("[pg]她明白了你的意思，眼睛一亮，但当她想起你问的是她的，而不是你自己的时候，又陷入了困惑。最后，她微微耸了耸肩，摇了摇头。");
         outputText("[pg][say: 妈的，你总得有一个吧！]你反驳道。[say: 你的食物……你吃完的食物是从哪里排出来的？]");
         outputText("[pg]听到这话，她若有所思地想了几秒钟，然后指了指自己的嘴。");
         outputText("[pg][say: 不……是从哪里</i>出来<i>？你知道的，是在你吃完</i>之后<i>！]");
         outputText("[pg]她泛起蓝色的红晕，然后再次指了指自己的嘴，向水里吐了口水作为解释。当你明白她的意思时，惊愕得张大了嘴巴。");
         outputText("[pg]好吧，你已经找到了她的肛门……现在你要做什么？");
         menu();
         addButton(0,"操它",anemoneQuoteUnquoteAnal);
         if(!get_player().isTaur())
         {
            addButton(1,"乳交",hotdogTheAnemone);
         }
         else
         {
            addButtonDisabled(1,"乳交","此场景不支持半人马形态。");
         }
         addButton(2,"不干了",fuckingAssholelessAnemoneeeez);
      }
      
      public function anemoneBarrelDescription() : void
      {
         outputText("[pg]");
         if(get_camp().isGuard("小A"))
         {
            outputText("你的海葵女儿站在营地边缘的木桶旁，她的" + weaponName() + "[if (kidaxp < 50) {紧张地|自信地}]握在手中。");
         }
         else if(get_camp().isForceSleepTime())
         {
            outputText("小A现在正在她的木桶里睡觉。");
         }
         else if(get_game().time.hours <= 10)
         {
            outputText("小A站在她的木桶旁，正用你的一个水袋往里面加水。她的肩膀上还挂着另一个装满的水袋。她冲你咧嘴一笑。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) > 1)
         {
            outputText("小A现在不在她的木桶里，又被拉去当保姆了。");
         }
         else if(get_game().time.hours < 16)
         {
            outputText("小A躲在盖着盖子的木桶深处，躲避着正午的阳光。");
         }
         else if(get_game().time.hours < 22)
         {
            outputText("小A正从她的木桶里探出头来。每当你和她有眼神交流时，她就会笑起来；否则她只是盯着远方，放松着。");
         }
         else
         {
            outputText("小A在这里，端庄地坐在她的木桶边缘，在红月的照耀下看起来有些发紫。她时不时地狡黠地瞥你一眼。");
         }
         outputText("[pg]");
      }
   }
}

