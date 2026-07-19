package classes.scenes.areas.mountain
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   import haxe.Log;
   
   public class NephilaSlimeScene extends BaseContent
   {
      
      public function NephilaSlimeScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function nephilaUpdate() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc1_:Boolean = false;
         if(get_player().hasStatusEffect(StatusEffects.ParasiteNephila))
         {
            if(!get_player().hasVagina())
            {
               outputText("[pg]没有子宫来容纳络新妇寄生虫，它们就会枯萎死亡。你想知道你的身体将如何摆脱它们，但想起你刚刚失去了一个子宫，没有任何痛苦或副作用；它们会以某种方式消失的。");
               get_player().removeStatusEffect(StatusEffects.ParasiteNephila);
               get_player().removeStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2921,0);
               if(get_player().hasPerk(PerkLib.NephilaQueen))
               {
                  get_player().removePerk(PerkLib.NephilaQueen);
               }
               if(get_player().hasPerk(PerkLib.NephilaArchQueen))
               {
                  get_player().removePerk(PerkLib.NephilaArchQueen);
               }
               _loc1_ = true;
            }
            _loc2_ = get_player().statusEffectv1(StatusEffects.ParasiteNephila);
            if(get_player().statusEffectv3(StatusEffects.ParasiteNephilaNeedCum) / _loc2_ >= 4)
            {
               _loc1_ = true;
               outputText("[pg]络新妇寄生虫注入你体内的改变心智的物质几乎让你瘫痪，但你的“冷火鸡疗法”似乎奏效了。<b>你体内的部分寄生虫饿死了，你的肚子缩小了！</b>");
               get_player().removeStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
               dynStats(DynStat.Spe(-1),DynStat.Tou(-1),DynStat.Str(-1),DynStat.Sens(2),DynStat.Cor(2));
               get_player().addStatusValue(StatusEffects.ParasiteNephila,1,-1);
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) <= 0)
               {
                  get_player().removeStatusEffect(StatusEffects.ParasiteNephila);
                  outputText("[pg]很难数清，但你相信那是<b>你体内最后一只络新妇寄生虫</b>。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2921,0);
                  if(get_player().hasPerk(PerkLib.NephilaQueen))
                  {
                     get_player().removePerk(PerkLib.NephilaQueen);
                  }
                  if(get_player().hasPerk(PerkLib.NephilaArchQueen))
                  {
                     get_player().removePerk(PerkLib.NephilaArchQueen);
                  }
               }
            }
            if(get_player().statusEffectv2(StatusEffects.ParasiteNephila) >= 2)
            {
               _loc1_ = true;
               outputText("[pg]你感觉到子宫内的蠕动蔓延得更远更广。<b>你已经喂养了络新妇寄生虫足够多次。你的肚子在一夜之间急剧膨胀，因为它们繁殖了，你的感染水平上升了。</b>");
               get_player().addStatusValue(StatusEffects.ParasiteNephila,1,1);
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 3)
               {
                  outputText("你已经成为这些寄生虫名副其实的育母。你的肚子因为蠕动的幼虫而永久肿胀，让你看起来像是怀了三胞胎的足月孕妇[pg]");
                  var _temp_1:* = get_player().hips;
                  _temp_1.rating = _temp_1.rating + (1 + Utils.rand(3));
                  get_player().vaginas[0].vaginalWetness = 5;
               }
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 5)
               {
                  outputText("你伸出手去拥抱你那巨大的肚子，然后当你意识到你现在肿得太大了，够不到你敏感的凸肚脐时，你舒服地呻吟起来。<b>你现在看起来像个怪物一样怀孕了。你那蠕动的半液体触手幼虫在你的脑海中低语，让你觉得更聪明，但你被你的负担拖慢了速度。有什么东西在你的脑海深处拉扯，敦促你去狩猎，去探索高山的最深处。</b>[pg]");
                  var _temp_2:* = get_player().hips;
                  _temp_2.rating = _temp_2.rating + (1 + Utils.rand(3));
                  dynStats(DynStat.Spe(-5),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(2));
                  get_player().vaginas[0].vaginalWetness = 5;
               }
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 10)
               {
                  outputText("你试图将饱满的身体从床上撑起来，但你的肚子现在已经肿胀到了如此巨大的程度，以至于你以前的自己都可以舒服地塞进去。你发现，无论你在它下面多么努力地蠕动，当你试图起身时，它几乎连晃都不晃一下。当你意识到自己有多么无助时，你高潮了，然后向你的“孩子们”呼喊，寻求它们愿意提供的任何帮助。寄生软泥怪从你潮红、喷涌着黏液的阴道中蜂拥而出。它们爬过你肿胀的巨大身躯，摇晃你的肚子，直到它向前移动，你才能“站起来”。然而，“站起来”是一个误导性的说法，因为你发现你<i>真的</i>必须伸展身体才能勉强让脚趾碰到地面。当你放弃再次正常行走的希望，转而靠在让你无法动弹的球状肚子上时，它们兴奋地卷曲起来。这让你的丰满臀部翘在空中，你张开双腿，以适应现在不断从你阴道中出生和吞回子宫的史莱姆。你对着蜂拥而至的孩子们咕咕叫着，它们用滋润的黏液覆盖着你紧密堆积的大片血肉，慢慢地拉着你和你美丽的肚子向前移动。你很高兴你的宝宝们在妈妈狩猎时如此努力地帮助她，并决心从现在起更加努力地工作，以确保你和它们都能吃饱。在这个体型下，你永远无法快速移动，但支撑你肚子的虫群让你感到受到保护和安全；不知何故，你觉得与你的寄生虫联系在一起。它们明白它们的生存归功于你，现在你可以在战斗中寻求帮助了！");
                  outputText("[pg]高山上深邃、隐蔽的地方的图像涌入你的脑海，你感到一种新的目标感抓住了你。获得特质：<b>络新妇女王！</b>[pg]");
                  get_player().vaginas[0].vaginalLooseness = 5;
                  var _temp_3:* = get_player().hips;
                  _temp_3.rating = _temp_3.rating + (1 + Utils.rand(3));
                  dynStats(DynStat.Spe(15,DynStatOp.Eq),DynStat.Tou(10),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(100,DynStatOp.Eq));
                  awardAchievement("络新妇女王",290,true,true);
                  get_player().createPerk(PerkLib.NephilaQueen,0,0,0,0);
                  get_player().vaginas[0].vaginalWetness = 4;
               }
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 15)
               {
                  outputText("当你意识到你已经达到了一个里程碑式的尺寸时，你对自己笑了笑。你的肚子完全让你相形见绌，无论是在身体上还是在精神上，你发现<b>你曾经怀有的关于成为勇者的任何愚蠢想法都在迅速消退。</b>[pg]");
                  get_player().vaginas[0].vaginalLooseness = 5;
                  dynStats(DynStat.Spe(15,DynStatOp.Eq),DynStat.Tou(10),DynStat.Inte(5),DynStat.Sens(2),DynStat.Cor(100,DynStatOp.Eq));
                  var _temp_4:* = get_player().hips;
                  _temp_4.rating = _temp_4.rating + (1 + Utils.rand(3));
                  get_player().vaginas[0].vaginalWetness = 4;
               }
               if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) == 20 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2921) > 0)
               {
                  outputText("你在夜里被木头开裂的声音吵醒。试图伸展身体时，你呻吟起来，因为你意识到你那大得不可思议的肚子在一夜之间经历了另一次生长突增，现在牢牢地卡在");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0)
                  {
                     outputText("现在牢牢地卡在你小屋的屋顶上，凸起到它能找到的每一毫米空间。你蠕动了一会儿，被钉在原地，相当痛苦，但当你木制的家终于放弃了抵抗，断成两半，它的屋顶滑落，你的肚子凸出在毁坏的墙壁上，让你看起来简直就像一个[race]松饼时，你松了一口气。当你意识到你已经长得太大，无法适应标准尺寸的家时，你对自己咯咯地笑了起来，然后呼唤你的一个络新妇女儿把你从木制监狱中解救出来——同时也抚慰你可怜、疼痛的肚子。");
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) == 0)
                  {
                     outputText("完全填满了络新妇之前为你建造的马戏团帐篷，折断了将它固定在地上的木桩。你咯咯地笑着，摇晃着你那谷仓般大小的肚子，看到被压碎的帐篷那鲜艳的布料在风中飘扬，挂在你那肥胖、垫子般大小的肚脐上，你感到特别高兴。布料监狱的爆炸搅动了你肚子的表面，你呼唤集会中的一个女儿来安抚你。");
                  }
                  outputText("络新妇对你的困境比你认真得多，她们重建了你的家以适应你，并承诺如果有需要，会再次升级它的尺寸。她们恳求你立即停止所有冒险，当你暂时拒绝时，她们召唤了一个用魔法构建的你的复制品。它在各方面都和你一模一样，除了它的肚子被缩小到了一个稍微合理一点的尺寸。主母解释说，你可以将你的思想投射到复制品中，用它来为你冒险，并正确地指出，以你的体型，世界上没有任何魔法能让你进入普通的地下城。你同意继续使用你的娃娃进行冒险，这样集会就可以在你醒着的每一刻照顾你真实的身体，将你真实的身体限制在营地和络新妇的宫殿里。你很高兴有这么方便的工具，但当主母解释说对你的威胁仍然非常真实时，你皱起了眉头——对娃娃的任何伤害都会反馈给你，而且，以你的体型，这可能非常危险。<b>也许现在你应该永远放弃冒险了？</b>[pg]");
                  get_player().vaginas[0].vaginalLooseness = 5;
                  var _temp_5:* = get_player().hips;
                  _temp_5.rating = _temp_5.rating + (1 + Utils.rand(3));
                  dynStats(DynStat.Spe(1,DynStatOp.Eq),DynStat.Tou(-10),DynStat.Inte(5),DynStat.Sens(10),DynStat.Cor(100,DynStatOp.Eq));
                  get_player().vaginas[0].vaginalWetness = 4;
               }
               else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 11)
               {
                  outputText("<b>你在敏捷上取得的任何进步，都再次被你那深不可测的“怀孕”肚子的膨胀所抵消。你的心思仍然集中在喂养你的后代上，你那流着粘液的阴户永远敞开着，络新妇们在里面爬进爬出。</b>[pg]");
                  get_player().vaginas[0].vaginalLooseness = 5;
                  var _temp_6:* = get_player().hips;
                  _temp_6.rating = _temp_6.rating + (1 + Utils.rand(3));
                  dynStats(DynStat.Spe(-5),DynStat.Inte(5),DynStat.Cor(100,DynStatOp.Eq));
                  get_player().vaginas[0].vaginalWetness = 4;
               }
               get_player().addStatusValue(StatusEffects.ParasiteNephila,2,-3);
            }
            if(int(get_game().time.days % 3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2918) != get_game().time.days)
            {
               if(!get_player().hasStatusEffect(StatusEffects.ParasiteNephilaNeedCum))
               {
                  _loc1_ = true;
                  Log.trace("here 3",{
                     "fileName":"src/classes/scenes/areas/mountain/NephilaSlimeScene.hx",
                     "lineNumber":140,
                     "className":"classes.scenes.areas.mountain.NephilaSlimeScene",
                     "methodName":"nephilaUpdate"
                  });
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2918,int(get_game().time.days));
                  switch(Utils.rand(4))
                  {
                     case 0:
                        if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
                        {
                           outputText("[pg]<b>你张开双腿，枕头大小的阴唇随之晃动，试图为你那张开得极其夸张的阴道腾出更多空间，让它张得更大。</b>");
                           outputText("[pg][say: 快！]你的一名侍女低声催促道，[say: 母亲大人饿了！][pg]她们把第一只挣扎的小恶魔按到你饥渴的小穴前，在它试图挣脱时扇了它一下。然而你几乎没有注意到这些，因为你的身体正被快感淹没——你那房子般大小的子宫里最粗壮的两条黏滑触手正从你那肉感、深邃的入口滑出，缠住那只惊恐万状的恶魔，将它缓缓拽入你的子宫中喂养蜂巢。此刻你的小穴已经如此宽大、永久张开，当那个幼儿大小的生物伴随最后一声尖叫消失在你体内时，你几乎浑然未觉，但当你的幼群在你体内涌动、意识到又到了进食时间时，你依然大力潮喷。[pg][say: 继续！继续！]照料你的育母大叫道。你的\"女儿们\"照做了，一次次将小恶魔塞进你那永远饥渴的阴唇，一遍又一遍，数百次——数千次——从不停歇，哪怕你睡着了也不例外。");
                           outputText("[pg]当你从睡梦中醒来时，你发现一些络新妇已经从你流着黏液的阴部逃了出来。[pg]");
                        }
                        else if(get_player().hasPerk(PerkLib.NephilaQueen))
                        {
                           outputText("[pg]<b>经过漫长的战斗，你击倒了一名小恶魔领主。</b>他仰面躺下，你舔了舔嘴唇，期待着品尝你的战利品。你走近倒下的恶魔，轻轻踢了踢他的臀部，他的阴茎立刻做出了反应。它在他的缠腰布里撑起了一个帐篷，你笑了。");
                           outputText("[pg]你抓住那根恶魔的阴茎，撸动了几下，当它在你手中变硬时，你流下了口水。小恶魔试图抓住你的手臂来控制局面，但你迅速挣脱，再次将他推倒在地。你将你那发麻的[vagina]对准他的阴茎，把寄生黏液滴在上面，使它变得肿胀，淫秽地跳动着。");
                           outputText("[pg]你放低身子，当它轻松滑入你体内时，你舒服地呻吟起来。静止片刻，欣赏了小恶魔阴茎的尺寸和质感后，你开始骑乘他。你可能要几个小时后才会结束。");
                        }
                        else
                        {
                           outputText("[pg]<b>你被击倒了，在战斗中被一群小恶魔打败。</b>");
                           outputText("[pg]他们向你走来，向你展示他们已经变硬的阴茎，跳动着，喷涌着先列腺液。你没有感到排斥，反而感到了欲望。你满怀期待地涨红了脸，" + (get_player().hasTailInsteadOfLegs() ? "手指滑过胯部" : "转身张开双腿") + "，露出你的[vagina]，准备好被占有和侵犯几个小时，也许几天。");
                        }
                        outputText("[pg]你回过神来。你在做白日梦！在阴道里接纳小恶魔的想法充斥着你的脑海，你变得很难集中注意力，也无法阻止自己不断地对着它自慰。你渴望小恶魔的阴茎，最重要的是，小恶魔的精液。");
                        get_player().createStatusEffect(StatusEffects.ParasiteNephilaNeedCum,0,1,_loc2_,0);
                        break;
                     case 1:
                        outputText("[pg]<b>你引诱一个年轻的鼠人上床，在他的阴茎上跳跃，听着他的吱吱声呻吟的画面充斥着你的脑海。</b>你感到了欲望，变得很难集中注意力，也无法阻止自己不断地对着这些画面自慰。你渴望鼠人的阴茎，最重要的是，鼠人的精液。");
                        get_player().createStatusEffect(StatusEffects.ParasiteNephilaNeedCum,0,4,_loc2_,0);
                        break;
                     case 2:
                        if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
                        {
                           outputText("[pg]<b>费了一番功夫，但牛头人领主还是倒在了你面前。</b>");
                           outputText("[pg]那生物瘫倒在地，喘着粗气，满眼不服气地盯着你。你上前，得胜者的姿态，迫不及待地准备收取战利品。你脱去衣物，露出那饥渴的[vagina]，牛头怪随之爆发出一股原始的冲动。你一拳将它再度打晕，随即决定用它自己的锁链将它的双臂束在一起。[pg]牛头怪仍在试图挣脱，但很快意识到徒劳无功。它平静下来，除了那根因你方才的展示而怒张的阴茎依然猛烈跳动。你笑了，用手指慢慢撩拨它那巨大的肉棒，令先列腺液喷涌成丝。[pg]在它意识到你渴望的远不止它那变异的阴茎之前，一切已经为时已晚。你的小穴淫荡地大张，似乎无穷无尽的络新妇软泥怪从中一个接一个地扑出，将牛头怪团团包围。它震惊地嚎叫，奋力甩动身体对抗那黏腻的束缚，却无计可施。你在高潮中失声叫喊，你的孩子们将它拖回你的阴道，让你那已然令你无法行动的巨大肚子再度膨胀到近乎现有体积的两倍。你咧嘴笑着感受它在你体内的挣扎。[say: 嘘，]你说。它那巨大阳具的浮雕轮廓顶着你的子宫外壁，你隔着腹部肉壁握住那根肉棒，以母性的方式替它手淫，同时你的幼群将它躯干上的血肉一片片从骨骼上撕碎。\"没事的，\"你说。[say: 妈妈在这里。去睡吧。]当那生物终于停止动弹，你在自己那臃肿鼓胀的躯体上轻轻摇晃，让它液化的身躯在你体内汩汩流动，令焦躁的孩子们蠕动起来。你催动蜂群向前，开始追猎下一个猎物。");
                           outputText("[pg]当你从睡梦中醒来时，你发现一些络新妇已经从你流着黏液的阴部逃了出来。");
                        }
                        else if(get_player().hasPerk(PerkLib.NephilaQueen))
                        {
                           outputText("[pg]<b>费了一番功夫，但牛头人领主还是倒在了你面前。</b>");
                           outputText("[pg]这个生物瘫倒在地，坐在地上，气喘吁吁，挑衅地盯着你。你走上前去，得意洋洋，渴望得到你的奖励。你脱下衣服，露出饥渴的[vagina]，引发了牛头人原始能量的爆发。你迅速一击，再次将他击晕，并决定用他自己的锁链将他的双臂绑在一起。");
                           outputText("[pg]牛头人仍然试图挣脱，但很快意识到这是徒劳的。他平静下来，除了他那狂暴的勃起，因为你之前的展示而跳动着。你笑了，用手指慢慢地挑逗他那巨大的尺寸，导致先列腺液大股大股地喷出。");
                           outputText("[pg]你转过身，将你的小穴滑过他的龟头，准备接纳他那巨大的阴茎。你慢慢来，享受着这头巨兽发出的沮丧呻吟。你稍微放低身子进入一点，然后退缩，对这种痛苦感到不满足。你能看出牛头人很痛苦，但你知道他最终会享受的；在被他那令人上瘾的精液填满之前，你不打算离开。");
                        }
                        else
                        {
                           outputText("[pg]<b>尽管你尽了最大努力，你还是发现自己任由牛头人摆布，被打得毫无还手之力。</b>");
                           outputText("[pg]然而，你知道你为什么大老远跑到山里来。当牛头人靠近你时，他那巨大的阴茎变硬了，你可能有的任何恐惧都被对他精液的强烈渴望所取代。");
                           outputText("[pg]他将肉棒指向你的脸，你垂涎欲滴，渴望着他的精液。想要舔舐他那膨大的龟头冠状沟，舔尽他先列腺液的欲望几乎要将你淹没，但你勉强控制住了自己。你需要他以另一种方式来满足你。");
                           outputText("[pg]你转过身，将自己展现给他。他立刻挺身刺入你的体内，快感让你的大脑一片空白。被如此迅速地贯穿可能会有些痛，但你并不介意。只有当你被他的精液灌满，肚子胀鼓鼓的时候，你才会感到满足。");
                        }
                        outputText("[pg]你猛地回过神来。你刚才在做白日梦！光是想象着某个牛头人将你大大地掰开，用他那令人上瘾的精液填满你，他的麝香味充满你的鼻腔，让你终于感到被彻底填满，你就差点高潮了。你感到了渴望，变得难以集中注意力，也很难克制自己不去对着这些画面自慰。你渴望牛头人的肉棒，最重要的是，渴望牛头人的精液。");
                        get_player().createStatusEffect(StatusEffects.ParasiteNephilaNeedCum,0,2,_loc2_,0);
                        break;
                     case 3:
                        if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
                        {
                           outputText("[pg]<b>你正在湖边沐浴，这时一只好奇的海葵从水里探出头来打量你。</b> 你那马车般大小的肚子，靠你自己根本不可能洗到边缘，而且你还没把子宫里的孩子们放出来帮忙。你侧身靠在自己那庞大得让人无法动弹的身躯上，为了更好地看清这个好奇的生物，然后冲它勾了勾手指，微笑着。");
                           outputText("[pg][say: 嗨，小可爱，]你说。[say: 见到你真高兴。我正打算在这里洗洗我的肚子，可它</i>实在太大太大了<i>，而我又</i>实在太小太小了。<i>怎么样——帮妈妈够到那些</i>难以触及的地方<i>？]你将双臂伸展到能够到的那一小片肚皮上，演示你的\"困境\"，完全清楚这看起来有多滑稽，随后扭动臀部，让那对饱满圆润的臀瓣上下弹跳，假装费力地伸手绕到身后来清洁自己。[pg]海葵从湖中升起，发丝触手挥舞，那根巨大的扶她阴茎完全勃起。[say: 哦……]你说，[say: 有人很迫不及待嘛。][pg]它从你肚子正面开始，随着它慢慢用湖水淋洗你，你轻声呻吟。它完全被遮住看不见，但随着它的触手轻柔地在你身上滚过、散布性爱毒素，你的皮肤酥麻一片，你能感受到它那苹果大小的龟头蹭着你的肚脐，在它俯身贴近以够到你肚子上半球时往里顶着渗出先列腺液。花了一个多小时，海葵终于将它能够到的每一寸肚皮都清洗干净。[pg][say: 哦宝贝，]你说。[say: 我感觉</i>好多了<i>。你真的把我的肚子里里外外都照顾到了</i>每一处<i>。现在绕到背后来，把你对妈妈的大大肚子做的事，也对妈妈其余的地方都做一遍吧？]");
                           outputText("[pg]它绕着你那严重变形的肚子转圈，来到了你的身后，然后用它那长着触手的阴茎刺入你那滴着黏液的小穴，寻求它的奖赏。你咯咯笑着，发出咕咕的娇喘声，在它的肉棒上起伏，同时将你的屁股在它那紧绷、暗淡的肚子上摩擦，以此来分散它的注意力，让它在操你的时候忽略你正在做的事情。几分钟后，当它射精到你体内时，它就已经注定要灭亡了。你的孩子们已经大量地从你体内爬出，蜂拥着爬上它的背，爬满它的全身，现在它已经取悦了你，它们立刻发动攻击，在它身上和周围涌动，将它连同肉棒一起拖入你的子宫。它在最后一次高潮中大叫，然后痛苦地惨叫，接着你只能通过你那巨大的肚子表面听到它那沉闷的声音。你拍了拍那颗圆球，然后让你的孩子们抬着你继续前进，去狩猎。");
                           outputText("[pg]当你从睡梦中醒来时，你发现一些络新妇从你那流着黏液的小穴里逃了出来。");
                        }
                        else
                        {
                           outputText("[pg]<b>你被海葵的催情液充满，然后被无情地操弄的画面充满了你的脑海。</b> 你感到了渴望，变得难以集中注意力，也很难克制自己不去对着这些画面自慰。你渴望海葵的肉棒，最重要的是，渴望海葵的精液。");
                        }
                        get_player().createStatusEffect(StatusEffects.ParasiteNephilaNeedCum,0,10,_loc2_,0);
                  }
               }
               else if(get_game().time.days != FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2918))
               {
                  _loc1_ = true;
                  if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
                  {
                     outputText("[pg]<b>你子宫里那支蠕动的络新妇软泥怪大军因饥饿而变得虚弱，你的肚子也痛苦地呻吟着。</b> 你的身体已经如此适应孕育你的后代，以至于它们经历的任何痛苦都会折磨你的身体，并极大地削弱你。你必须找到猎物，而且要快。[pg]");
                  }
                  if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) < 10)
                  {
                     outputText("[pg]<b>你体内的络新妇软泥怪变得更饿了。</b> 它们分泌出更多那种能扭曲心智的化学物质，这在身体上削弱了你，让你很难忽视自己日益增长的欲望。[pg]");
                  }
                  if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
                  {
                     dynStats(DynStat.Spe(-10),DynStat.Tou(-10),DynStat.Str(-10),DynStat.Sens(15),DynStat.Cor(15));
                  }
                  if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) < 10)
                  {
                     dynStats(DynStat.Spe(-1),DynStat.Tou(-1),DynStat.Str(-1),DynStat.Sens(2),DynStat.Cor(2));
                  }
                  get_player().addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,_loc2_);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2918,int(get_game().time.days));
               }
            }
            return _loc1_;
         }
         return _loc1_;
      }
      
      public function nephilaInfest() : void
      {
         get_player().createStatusEffect(StatusEffects.ParasiteNephila,1,0,0,0);
         if(get_player().hasStatusEffect(StatusEffects.ParasiteEel))
         {
            outputText("[pg]寄生在你体内的鳗鱼被新的寄生虫毫不费力地杀死了。");
            get_player().removeStatusEffect(StatusEffects.ParasiteEel);
            get_player().removeStatusEffect(StatusEffects.ParasiteEelNeedCum);
            get_player().removePerk(PerkLib.ParasiteQueen);
         }
      }
      
      public function loseToNephilaWithPCCunt() : void
      {
         outputText("[pg][say:哈！你不会以为在</i>我的<i>地盘上能打败我吧？]傲慢的史莱姆大笑道。她向你走来，扭动着宽大的臀部，熟练地模仿着施虐狂的姿态，一边靠近一边脱下备用的衣服，让她那看起来像怀孕一样巨大的肚子晃动着。她停下来站在你面前，那锐利、充满欲望的目光相当吓人。你想知道她到底为你计划了什么，等待着你的命运。从她眼中担忧的神情，你可以看出她根本不知道自己在做什么。");
         outputText("[pg][say:脱衣服。现在。如果逼我动手，你不会喜欢的，]她强硬地命令道。你太虚弱了，除了配合什么也做不了，只好顺从地脱下你的[armor]。");
         outputText("[pg]当你把最后一点[armor]放在碎石上时，你的胸口突然遭到重击，被推倒在地。史莱姆女孩的主触手将你死死按住，她看着你，眼中闪烁着疯狂的欲望。她突然皱起眉头。[say:希望你的小穴是个好归宿。]她脱下湿漉漉的丁字裤，坐在你旁边，把你的其中一条腿抬到她的肩膀上，然后靠近，她的小穴几乎碰到了你的。触手慢慢地从她的阴道内部伸出。史莱姆女孩本身是雪白的，但从她小穴里伸出的触手却五颜六色，尽管它们显然还是属于她的同类——由不透明的史莱姆构成，并带有随机的羽毛状附肢。触手的尖端开始在你的" + get_player().vaginaDescript(0) + "周围探测，刷过你的[clit]，摸索着你的入口。");
         outputText("[pg]她的眼睛依然死死盯着你，燃烧着欲望，要求你的配合。终于，她找到了位置，你无法抗拒，放松了小穴，任由她的一根触手滑入。她将自己的裂口贴紧你的，你感觉到触手慢慢滑得更深。");
         get_player().cuntChange(25,true,true,false);
         outputText("尽管处境堪忧，这种刺激还是唤起了你的情欲；润滑液从你的小穴滴落，促使入侵者探索你体内的每一寸。就在你以为自己再也承受不住的时候，触手缩了回去，回到了主人的体内。她恶意地咧嘴一笑，突然，触手再次爆出，猛烈地穿透了你。它缩回，然后开始在你体内抽插，同时挑逗着你和它的主人");
         outputText("[pg]当触手在你的[vagina]里进进出出时，你喘着粗气；站在你旁边的女孩看起来对自己非常满意。她开始用她的小穴轻轻地摩擦你的，它的每一次移动都让你充满快感，在被穿透的同时，你的阴唇和阴蒂也被摩擦着。你被这种感觉弄得太兴奋了，以至于无法对她占你便宜感到生气，你的爱液像水龙头一样从小穴里滴落。");
         outputText("。她看着你的呼吸因为快感而变成喘息，笑了起来。");
         outputText("[pg]被填满以及阴唇和阴蒂被挑逗的感觉实在太好了。你发出呻吟，示意你即将潮吹，她迅速用触手抓住你的手臂，确保你被锁在她身上，直到她完事。当你喷出淫水时，触手完全滑入，离开了它原来的主人，扭曲盘绕着，仿佛在寻找什么。她松开了你，你在地上翻滚挣扎，入侵者无休止的动作让你不断高潮。");
         outputText("[pg]她站起身，微笑着看着你的窘境，同时其他几根触手在她的阴道里滑进滑出，操着她直到她也高潮。[say:恭喜你，我的一个孩子喜欢你！起初，不停地渴望精液会很烦人，但你会学会享受它的。你可以把它当成一个任务！现在，我还需要我的剂量，所以我就留你享受你的新朋友吧。]");
         outputText("[pg]她把你留在地上翻滚挣扎，直到你因为不断的高潮而晕厥过去。当你晕倒时，那根黏糊糊的触手找到了你子宫的入口，并在里面安顿下来。");
         nephilaInfest();
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToNephilaWithCockAnBallsAnCunt() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("[pg][say:哈！你不会以为在</i>我的<i>地盘上能打败我吧？]傲慢的软泥怪大笑道。她向你走来，熟练地模仿着施虐狂的姿态扭动着宽大的臀部，一边走一边脱下多余的衣服。她停在你面前，那极具穿透力、充满欲望的目光相当吓人。你想知道她到底打算对你做什么，只能等待命运的降临。从她眼中担忧的神情可以看出，她根本不知道自己在做什么。");
         outputText("[pg][say:脱衣服。现在。如果逼我动手，你不会喜欢的，]她强硬地命令道。你太虚弱了，除了配合什么也做不了，只好顺从地脱下你的[armor]。");
         outputText("[pg]当你把最后一件[armor]扔到一旁的碎石中时，你的胸口突然遭到重击，被推倒在地。变色龙女孩宽大的脚将你死死踩住，她看着你，眼中满是疯狂的欲望。她突然皱起眉头。[say:你知道吗？我不想吃你的精液了。我要用另一种方式使用你。]她脱下沾满黏液的丁字裤，坐在你旁边，把你的其中一条腿抬到她的肩膀上，然后靠近你，她的小穴几乎贴上了你的。触手慢慢从她的阴道里钻出来。虽然这个黏液女孩全身雪白，但从她小穴里钻出的触手却五颜六色，不过显然都是她的同类——由不透明的黏液组成，还带着随机的羽毛状附肢。触手尖端开始在你的" + get_player().vaginaDescript(0) + "周围试探，拂过你的[clit]，摸索着你的入口。");
         outputText("[pg]她的眼睛依然死死盯着你，燃烧着欲望，要求你配合。终于，她找到了位置，你无法抗拒，只能放松小穴，任由她的一根触手滑入。她将自己的裂口紧贴着你的，你感觉到触手慢慢滑得更深。");
         get_player().cuntChange(25,true,true,false);
         outputText("尽管处境堪忧，这种刺激还是唤起了你的情欲；润滑液从你的小穴滴落，促使入侵者探索你体内的每一寸。就在你以为自己再也承受不住的时候，触手缩了回去，回到了主人的体内。她恶意地咧嘴一笑，突然，触手再次爆出，猛烈地穿透了你。它缩回，然后开始在你体内抽插，同时挑逗着你和它的主人");
         outputText("[pg]当触手在你的[vagina]里进进出出时，你喘息着；站在你旁边的女孩看起来对自己非常满意。她开始用她的小穴轻轻地摩擦你的，它的每一次移动都让你充满快感，在被穿透的同时，你的阴唇和阴蒂也被摩擦着。你被这种感觉挑逗得太兴奋了，以至于无法对她占你便宜感到生气，你的爱液像水龙头一样从你的小穴和勃起的阴茎滴落");
         outputText("[pg]你被填满你的东西固定在原地。黏液女孩摩擦得更用力了，注意到你勃起的[oneCock]，她渗出黏液向前移动，用半液态的嘴包裹住你的阴茎。她像荡妇一样吮吸着，嘴里内部类似触手的结构抚摸着你的[cockhead]和尿道");
         outputText("。她看着你的呼吸因为快感而变成喘息，笑了起来。");
         outputText("[pg]被填满以及你的" + get_player().cockDescript(_loc1_) + "被她的尾巴服侍的感觉实在太棒了，你很快就达到了高潮，滚烫的精液溅在她的尾巴上。然而，她并没有停止摩擦你，你很快又被引向了高潮，这次是在你的女性部位。你呻吟着示意你即将潮吹，她迅速抓住你的手臂，确保你被锁在她身上，直到她完事。当你喷出女性精液时，触手完全滑入，离开了它原来的主人，扭动盘旋着，仿佛在寻找什么。她松开了你，你在地上挣扎，入侵者不间断的动作让你持续高潮。");
         outputText("[pg]她站起身，微笑着看着你的窘境，同时其他几根触手在她的阴道里滑进滑出，操着她直到她也高潮。[say:恭喜你，我的一个孩子喜欢你！起初，不停地渴望精液会很烦人，但你会学会享受它的。你可以把它当成一个任务！现在，我还需要我的剂量，所以我就留你享受你的新朋友吧。]");
         outputText("[pg]她把你留在地上挣扎，直到你因持续的高潮而昏厥。当你昏过去时，黏滑的触手找到了你子宫的入口，并在里面安顿下来。");
         nephilaInfest();
         get_player().orgasm("Vaginal");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToNephilaSlime() : void
      {
         clearOutput();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你失去了对自身不断增长的性欲的控制，跪倒在地，拼命地想要脱下[armor]，抚慰你那饥渴的身体。");
         }
         else
         {
            outputText("你虚弱得无法继续战斗，踉跄着后退，跪倒在地。");
         }
         if(get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            loseToNephilaWithCockAnBallsAnCunt();
         }
         else if(get_player().get_gender() == 1 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
         {
            dudesLoseToNephila();
         }
         else if(get_player().hasVagina())
         {
            loseToNephilaWithPCCunt();
         }
         else
         {
            outputText("[pg]络新妇女孩把你从头到脚打量了一番，但没有发现生殖器，她抱怨了一声，狠狠地扇了你一巴掌，力气大到让你昏了过去。");
            get_player().takeDamage(20);
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function encounterNephila() : void
      {
         clearOutput();
         outputText("你在群山中一条你从未涉足过的偏僻支脉中穿行，拨开树枝，冒着令人压抑的昏暗，在一处特别不祥的悬崖阴影下寻找着新事物。感到疲惫的你放慢了脚步，寻找一个休息的地方；附近有一个碎石小丘，你背靠着一棵枯树坐下，喘口气。你现在已经冷得几乎感觉不到从地下渗入你[armor]的寒意了。");
         outputText("[pg]你突然听到身后传来一阵刮擦声！你及时转过身，看到一个熟悉的黏液女孩的身影从一条阴暗的沟壑中剥离出来。她动作缓慢而充满挑逗，让你有些惊讶。但最令人惊讶的是她那巨大的孕肚，以及她背上用来支撑肚子的四根羽毛状的白色触手。");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            outputText("[pg][say: 这个味道……精液，而且正是那种味道。我最近太渴望它了，简直要发疯了！你闯入了络新妇的山脉，所以我有权强暴你，直到你失去意识。]");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("[pg][say: 这个味道……一个新鲜且饥渴的小穴！络新妇会给你一份礼物，让你的子宫变得比你以前所能达到的更加不可思议，尽管你闯入了我的山脉。]");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[pg][say: 这个味——什么？！你入侵了络新妇的山脉，居然连个能让我操的东西都没有？]");
         }
         outputText("你举起你的[weapon]，准备迎接她的攻击！");
         unlockCodexEntry(2924);
         startCombat(new NephilaSlime());
      }
      
      public function dudesLoseToNephila() : void
      {
         var _loc1_:int = Utils.rand(get_player().totalCocks());
         outputText("[pg]意识到你没有危险，她微笑着向你走来。她诱惑地扭动着臀部，在碎石上慢慢地溅起水花，伴随着响亮的咂嘴声舔了舔嘴唇，然后伸出手，在你试图反抗她的进攻之前，强行将你的[armor]拉到腰部以上，把你推到一块巨石上。她匆忙地扯了几下布料，脱下了自己的衣服，把丁字裤扔到一根低垂的树枝上。她用另一条丝带迅速绑住你的手腕。如果你有任何反抗的余地，你都可以挣脱，但你太");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("被欲望淹没");
         }
         else
         {
            outputText("遍体鳞伤");
         }
         outputText("甚至无法撕开这临时的束缚。");
         outputText("[pg]她急于看到她的战利品，三下五除二就脱掉了你的[armor]，然后站起身，依然低着头，让背上的主触手像蛇一样向前伸展，向你的[oneCock]探去。在惊人的控制力下，她成功地将温暖、黏滑的白色附肢缠绕在你的身体和肉棒上，它们光滑的身体在你身上滑上滑下，几乎就像在给你按摩一样。当她只用一根触手的尖端挠你阴茎的底部，在龟头周围留下黏稠的液体时，你轻轻地颤抖着。你的阴茎很快就勃起并因渴望而跳动；她满意地将细长的物体拉回她身后的位置。");
         outputText("[pg]黏液女孩把自己拉起来，让她的性器官悬挂在你的脸前，她巨大、臃肿的肚子让你的整个身体都处于阴影之中。当她调整姿势时，你试图踉跄着躲开她的触及范围，但她用一根触手抓住了你的手腕，强行将它们举过你的头顶按在岩石上，把你的手腕背面在岩石上摩擦作为惩罚。她悬在你身旁的左腿，把你猛地拉回巨石上，让你和石头之间几乎没有移动的空间。你虚弱地试图挣脱，但她的握力惊人地大，像老虎钳一样把你困住了。伴随着一声呻吟，你放松下来，听天由命地接受了这场强暴。");
         outputText("[pg]她那淌着软泥怪的小穴在你脸上研磨，显然渴望被关注。本能让你把头转开，但她立刻又将你的手臂磨在粗粝的石壁上。你把脸埋进她的小穴，尽力舔食她，推动事情快点发展。她上方的空气中响起一声尖锐的倒吸气声；显然，她没想到对她性器的攻势来得这么快。她那奇异的甜香充满你的鼻腔，在稀薄的山间空气里格外清晰。你感觉到有什么东西抓住了你的" + get_player().cockDescript(_loc1_) + "，意识到她的触手又开始行动了。湿润光滑的肢端轻易地在你身上游走，撩拨它们能够到的每一处，一遍遍地回到你的肉棒上。一股女性液体涌出，将你的脸浸透，她呻吟着向后退开。她收起触手，小心地将身子降低一些，像躺在躺椅上一样用触手支撑着自己，并带着你被束缚的双臂随之移动，让她那庞大的肚子退后足够的距离，露出她的阴户，好让你用你的" + get_player().cockDescript(_loc1_) + "进入她。");
         outputText("[pg]她用小穴光滑的褶皱挑逗着你的龟头，一边一点点地把你拉向前，一边在周围打转。现在你的需求已经变得如此强烈，以至于你甚至不在乎自己被强暴，或者她如何进行，只在乎你必须发泄出来。你充满欲望地呻吟着，黏液女孩绽放出一个灿烂的笑容，顺着你的肉棒滑下，将你");
         if(get_player().cockArea(_loc1_) <= get_monster().vaginalCapacity())
         {
            outputText("吞没至根部");
         }
         else
         {
            outputText("尽可能深地进入她体内");
         }
         outputText("。她眯起眼睛，发出一声呻吟。她开始喘息，扭动着宽大的臀部，将你拉得更深，不让你离开她超过几英寸。在被自己那惊人的孕肚压在身下的情况下，她臀部所能展现的活动范围简直令人难以置信。你看着这个女孩有节奏地左右、前后、一圈又一圈地摇摆着臀部，一点一点地、缓慢地将你的肉棒强行塞进她体内。你不知道自己还能承受多少这样的快感。你想猛烈地冲撞她那湿滑的小穴，但你只能站在那里，感受她臀部每一次平滑的运动，被欲望逼得发疯。");
         outputText("[pg]显然，史莱姆女孩也快到极限了。她在快感中喘息呻吟，眼神几乎变得斗鸡眼，呆滞地盯着你肉棒的根部。她的臀部开始更加不规则地移动，每一次推挤都将你更多地吞入又吐出。很快，她放弃了缓慢挑逗的动作，用她的主触手将你和她自己向前拉，这样她就可以在你的肉棒上起伏，拼命地将它猛烈地插进拔出，试图达到高潮。同时，她的肚子上下拍打，一次次地把你的呼吸都撞了出来。她的乳房狂野地弹跳着，头向后仰，每次她压在你身上时，舌头都会伸出一点。快感太强烈了，你觉得你几乎无法再忍受哪怕一刻。射精的渴望在你的脑海中轰鸣，将所有其他想法都挤了出去。骑在你" + get_player().cockDescript(_loc1_) + "上的女孩的呻吟声你几乎听不见了，因为你将你的精华释放到了她体内");
         if(get_player().cumQ() > 1500)
         {
            outputText("，用如此多的精液填满她，以至于精液从她体内漏出，滴落到下面的水中");
         }
         outputText("。你惊讶地感觉到有什么东西从她的阴道里盘绕在你的肉棒上，试图强行从你身上榨出最后几滴。高潮后这么快就受到这种刺激，让你在束缚中挣扎，但无济于事。史莱姆女孩加快了速度，继续用她的臀部摩擦你的腹股沟，而她体内那个奇怪的附肢则帮助套弄你的肉棒。尽管你正在经历痛苦的快感，但它们成功地从你身上又诱发了一次高潮，几乎让你晕厥过去。");
         outputText("[pg]你那变软的阴茎从她体内滑出，她向后滚倒，摆出一个半躺的姿势，已经开始抚摸自己的阴蒂，充满了欲望。她猛地将你仍然被绑着的手腕拉向地面。你瘫倒在地，反正也站不起来了。史莱姆女孩嘟囔着，[say:我的宝宝们吃饱了。我还能再来，但操一根射不出来的肉棒也没什么意义。每次我都变得更饿了……]");
         outputText("[pg]一点精液从她的小穴里漏了出来，她迅速用手把它捞了出来。她看着它，欣赏着它的粘稠度。[say:当你充满精液、饥渴难耐的时候，随时欢迎来我这片山区，]她一边喘息着说，一边将触手从你的手腕上解开，重新穿好衣服。她蹚过水花，把你留在寂静中。你花了一段时间才从这次经历中恢复过来，然后才勉强鼓起力气爬出泥潭，回到你的营地。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function defeatNephilaSlime() : void
      {
         var _g:Combat;
         clearOutput();
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("无法控制自己的情欲，史莱姆女孩瘫倒在膝盖上，开始在丁字裤下自慰，已经完全失去了与你战斗的能力；她呻吟着，头向后仰，手在她那无定形的小穴里进进出出，水花四溅。随着她呻吟的音量和语速的增加，她那肿胀、不透明的白色肚子里模糊的阴影兴奋地蠕动着。");
            if(get_player().get_lust() >= 33)
            {
               outputText("你考虑帮她发泄一下，但突然，几根五颜六色的史莱姆触手从她流着口水的小穴里爆出，愤怒地向你猛击。你绝对不受她生殖器的欢迎。");
            }
         }
         else
         {
            outputText("史莱姆女孩太虚弱了，无法继续战斗，她精疲力竭地跪倒在地。她那巨大、黏糊糊的肚子在她面前的地上微微摊开，让她看起来像是一个疲惫而脆弱的母亲的滑稽模仿。");
            if(get_player().get_lust() >= 33)
            {
               outputText("你考虑过用她来发泄一下，但突然，几根五颜六色的史莱姆触手从她流着口水的小穴里爆出来，愤怒地朝你的方向抽打。你绝对不受她生殖器的欢迎。");
            }
         }
         if(get_player().get_lust() < 33 || get_player().get_gender() == 0)
         {
            get_combat().cleanupAfterCombat();
            return;
         }
         menu();
         _g = get_combat();
         addButton(0,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function cheatFunctiondoNotLook() : void
      {
         get_player().addStatusValue(StatusEffects.ParasiteNephila,1,1);
      }
   }
}

