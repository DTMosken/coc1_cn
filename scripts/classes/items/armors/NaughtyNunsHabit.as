package classes.items.armors
{
   import classes.Appearance;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.scenes.Camp;
   import classes.scenes.areas.highMountains.MinotaurMob;
   import classes.scenes.areas.mountain.Minotaur;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class NaughtyNunsHabit extends Armor
   {
      
      public function NaughtyNunsHabit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("NNunHab","Nun\'s Habit","Naughty Nun\'s Habit","a scandalous nun\'s habit",2,200,"A navy and white nun\'s habit which looks anything but pure and pious. The short hem looks like it would barely reach its wearer\'s thighs, and hidden in its pockets are equally religious-seeming items for naughty purposes. The thick and sturdy cross that culminates in a dildo and rosary made of large rubbery beads make it questionable if this really belongs to any religious order.","Light");
         boost("挑逗几率",NumberFunc_Impl_.fromInt(4),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromInt(4),false);
      }
      
      override public function useText() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2699) == 0)
         {
            outputText("你决定穿上修女服，一边脱衣服一边从包里拿出这件丝滑的衣服。");
            outputText("[pg]你把这件海军蓝的衣服贴在身上，想在穿上之前估计一下它有多合身。当你享受着凉爽光滑的布料贴在皮肤上的感觉时，你忍不住想它是不是有点太短了。它似乎只能到你的大腿中部，大概能给你足够的遮挡以保持端庄，但又露出足够的[skin]来诱惑别人。不过你觉得你不应该感到惊讶，特别是考虑到你是从哪里得到它的。你把修女服从头上套进去，然后把它抚平。[pg]");
            if(get_player().averageBreastSize() <= Appearance.breastCupInverse("A"))
            {
               outputText("厚实光滑的布料包裹着你的胸部，以一种变态的方式紧贴着每一道曲线。它给你的胸部带来了一种中性的魅力，一定会让你的敌人带着好奇和兴趣打量你。");
            }
            else if(get_player().averageBreastSize() > Appearance.breastCupInverse("A") && get_player().averageBreastSize() > Appearance.breastCupInverse("DD"))
            {
               outputText("厚实光滑的布料紧贴着你的胸部，被你乳房的曲线撑开。光滑的布料包裹着你的胸部，微微托起，就像你戴着胸罩一样，凸显出每一道曲线。这种轻微的展示违背了这套衣服纯洁的初衷，给你带来了一种略显变态的快感。");
            }
            else
            {
               outputText("厚实光滑的缎面布料在你的[breasts]周围被撑到了极限，修女服的前襟现在就像一层海军蓝色的第二层皮肤一样包裹着它们。布料托起你乳房的方式让每一道曲线都引人注目，同时你的乳沟也被强调出来，在修女服的布料中形成了一道深邃的沟壑。这绝对是变态的，明明你被完全包裹着，却什么也藏不住。你知道你的敌人们将无法把目光从你的资本以及它们在紧绷布料下晃动的样子上移开。");
            }
            outputText("闪亮的布料在你的腹部和臀部上方微微起皱。");
            if(get_player().hips.rating <= 4)
            {
               outputText("海军蓝色的布料轻轻地垂在你的[hips]上，紧贴着它们，勾勒出淡淡的轮廓。修女服的下摆停留在你的大腿中部，给你的身姿增添了一丝天真的气息。");
            }
            else if(get_player().hips.rating > 4 && get_player().hips.rating < 10)
            {
               outputText("海军蓝色的布料紧贴着你的[hips]，很好地勾勒出它们的轮廓，同时让修女服的其余部分宽松地垂在你的大腿中部。它随着你的动作起皱，让下摆微微飘动。");
            }
            else
            {
               outputText("海军蓝色的布料在你宽大的臀部周围绷紧，像第二层皮肤一样紧贴着你。下摆到达你的大腿中部，不过由于布料比荡妇秘书的裙子还要紧贴着你，所以几乎没有什么摆动的空间。");
            }
            if(get_player().butt.rating <= 4)
            {
               outputText("虽然较短的下摆让你有些担心，但你觉得这布料大多数时候还是能遮住你小巧的臀部，通常会垂在臀部下方一英寸左右。然而，当你弯腰时，你觉得它可能会往上缩，勾勒出你的臀部轮廓，甚至可能会向周围的人走光。" + (get_player().cor < 40 ? " 一想到这里，你忍不住脸红了，试图把下摆往下拉。" : ""));
            }
            else if(get_player().butt.rating > 4 && get_player().butt.rating <= 10)
            {
               outputText("较短的下摆是个问题，但布料似乎紧紧贴着你的[butt]，使其不会缩到臀瓣以上。它将你的臀部轮廓展露无遗，这让你" + (get_player().cor < 40 ? "脸红" : "兴奋得满脸通红") + "。然而，如果你弯腰，你觉得下摆可能会往上缩一点，向周围的人露出你臀部下方的曲线。");
            }
            else
            {
               outputText("较短的下摆可能是个问题，但你很快发现你的[butt]把布料撑得紧绷绷的，展现出每一道曲线，甚至勒进了你的股沟里，下摆则停留在臀部下方。它什么都藏不住，但又刚好能把你遮好。如果你弯腰，布料会被拉扯得太厉害，导致它往上缩，向周围的人露出你一大块[butt]。");
            }
            if(get_player().longestCockLength() >= 8)
            {
               outputText("[pg]你注意到你的肉棒对于这套衣服的下摆来说似乎有点太长了，不禁暗骂一声。当你把手插进口袋准备脱下这件教袍时，你摸到了一块布料。把它掏出来，你发现这是一条纯白棉布做成的紧身丁字裤。你耸了耸肩，心想这应该是搭配教袍穿的，便把它穿上了，前面把你的肉棒包裹成一个鼓胀却整齐的包裹，而后面则摩擦着你的会阴。这条丁字裤显然被施了某种魔法，旨在舒适地将你的肉棒" + (get_player().balls > 0 ? "和蛋蛋 " : "") + "紧紧贴在身上，让你显得体面，但它所造成的淫秽凸起却能透过教袍的布料明显看出来。");
            }
            outputText("[pg]既然穿好了衣服，你忍不住在溪流中欣赏起自己的倒影。你看起来就像一个教团的成员，尽管有点变态，你觉得这虔诚的装扮与它紧贴你身体的方式相结合，会让你在敌人眼中显得更加性感。当你幻想着可能的结果时，你的脑海中突然充满了带有宗教色彩的变态幻想，让你气喘吁吁。");
            outputText("尽管这很奇怪，但你意识到你现在应该继续你的旅程了，虽然你可能会在旅途中尝试在玛瑞斯传播圣者的福音……当然，是用你自己的特殊方式。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2699,1);
         }
         else
         {
            super.useText();
         }
      }
      
      public function naughtyNunSelfBaptism() : void
      {
         clearOutput();
         outputText("感到压抑，你给自己找了一个舒适的地方[if (corruption < 40) {，避开视线，希望你不会被偶然发现|在显眼的地方，希望有人看着你}]。你掀起修女服的下摆，把它滑到肚子上，这样你的[cock]就暴露出来了。你开始慢慢地抚摸你的肉棒，你的握力松散，你的步伐慵懒。你的拇指滑过顶端，挑逗着你的马眼，你的长度因兴奋而膨胀。一旦先列腺液开始在顶端形成珠子，你就稍微用力地握住自己，停止抚摸，开始说话。");
         outputText("[pg][say: 噢，至圣者，我偏离了您的教诲。请将我这肮脏的欲望作为导管！使用我的身体，再次净化我，让我能沐浴在您的光芒中，被您的宽恕所拥抱。]");
         outputText("[pg]你开始以更快的速度抚摸你的[cock]，你的手滑过你湿滑的长度，发出轻柔的吧唧声。你不断地渗出先列腺液，水滴[if (hasballs) {顺着你的蛋蛋滑落|滴到地上}]，你闭上了眼睛。");
         outputText("[pg][say: 洗净我的罪孽。洗去这些不洁的思想，让我能继续全心全意地侍奉您。] 当你的言语和行为发生冲突时，你感觉到你的[cock]在你的握持中跳动。情欲涌遍全身，让你在这令人愉悦的堕落中喘息和脸红。当你扭动臀部时，你忍不住呻吟出声，随着你套弄的力度加大，你简直是在挺动腰部迎合拳头。你下意识地抚摸和揉捏你的[chest]，一边套弄着肉棒，一边沉醉在包裹着你滚烫肉体的凉爽光滑的布料中。");
         outputText("[pg][say: 求求你……原谅我。洗去我的污秽……] 你虚弱地呻吟着，感觉到热量在你的腹部聚集[if (hasballs) {，你的[balls]收紧[if (hasVagina) {，你的[pussy]紧缩}]|[if (hasVagina) {，你的[pussy]紧缩}]}]，你的鸡巴抽动着，你的马眼扩张。你猛烈地射精，" + get_player().lowMedHighCum("几缕精液从你的鸡巴射出","一串串浓稠的精液从你的鸡巴射出","一股荒谬的精液喷泉从你的鸡巴射出") + "，只是为了再次落在你身上。你没有停下来，直到" + get_player().lowMedHighCum("你的脸被你自己的精液覆盖","你被自己的精液涂成了白色","完全被你自己的浓稠精液覆盖") + "，你的[cock]萎缩，你在粗重的喘息中恢复呼吸。");
         outputText("[pg]你松开肉棒，疲惫地瘫倒在地。[say: 感谢您为我重新洗礼，至圣者……] 你很快就睡着了，你的身体因为这高尚的净化而被掏空了。");
         get_player().orgasm("Dick");
         get_game().masturbation.updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunRosaryCockMasturbation() : void
      {
         clearOutput();
         outputText("感到欲火焚身，你的思绪飘向了放在你教袍口袋里的那些变态玩具。");
         outputText("[pg]在避开视线的地方，随着你的性欲高涨，你越来越能感觉到它们的重量。你在一个隐蔽的地方找了个舒服的姿势，掀起教袍的下摆，将你慢慢变硬的[cockplural]掏了出来。");
         outputText("[pg]你用手握住肉棒，悠闲地套弄着，直到你的手上沾满了前列腺液，并且你的[cockhas]长到了[cockeir]最大尺寸。你空出的那只手伸进教袍的口袋，握住了那串念珠，光滑的橡胶珠子在你的指尖滚动。把它从口袋里拿出来，你惊叹于它厚实的橡胶质感，不禁想象它们贴在" + (get_player().cockTotal() > 1 ? "你的一根肉棒" : "你的[cock]") + "上会是什么感觉。");
         outputText("[pg]当你漫不经心地抚摸着肉棒，在指间滚动着沾满润滑液的珠子时，你慢慢开始将念珠缠绕在你的[cock]根部。坚硬的珠子慢慢形成了一个凹凸不平、光滑的套子，然后你顺着肉棒上下滑动它。你手的每一次套弄都让深色的木制十字架在你的指关节上弹跳，每一次挤压的动作都让这凹凸不平的通道随之脉动。");
         outputText("[pg]随着你继续套弄你的[cock]，你的前列腺液与珠子上的天然润滑液混合在一起，让你不由自主地将臀部挺进这个临时做成的凹凸不平的珠子小穴里，每一次动作都变得更加顺滑。你爽得浑身发抖，每一圈凸起的珠子都试图紧紧夹住你，将你推向高潮，你的[cock]在插到底时不断抽搐跳动。凉爽的空气拂过你[cockhead]湿润的顶端，而现在变得温暖的珠子则在根部附近摩擦，这双重感觉将你拉向极乐的深渊。");
         outputText("[pg]当你感觉到自己快要高潮时，你拉动木制十字架，将珠子紧紧勒在肉棒根部。你大叫出声，你的[cock]在试图射精时不断跳动，但厚实的橡胶珠子形成了一个超乎寻常的紧密密封，这种虚假的高潮让你气喘吁吁，双腿发抖。");
         outputText("[pg]当你从高潮的余韵中平复下来时，你的[cock]继续跳动抽搐，龟头肿胀发红，似乎在对你拒绝释放感到愤怒。你开始再次套弄你的肉棒，现在极度敏感的血肉让每一个动作都比平时强烈得多。你的臀部随着每一次套弄而挺动，你满脸通红，大声呻吟和喘息。");
         outputText("[pg]当你挑逗着[cock]的顶端时，你很快就感觉到第二次释放的压力在积聚。你开始疯狂地抽插你的拳头，渴望达到你应得的高潮，你的肉棒在你的触摸下跳动。当你的肉棒肿胀时，你发出一声呜咽，你把念珠从你的根部拔出，精液顺着你的长度涌出" + (get_player().balls > 0 ? "，同时你的蛋蛋紧绷" : "") + "。你甚至能感觉到你的尿道在精液的体积下膨胀，当你的精液以浓稠的绳状涌出，向前划出弧线，溅到几英尺外时[if (hasVagina) {，你的小穴在你身下汇成水洼}]。[if (cumhighleast) {这种情况又持续了几股，每一股都落得更近一些，形成了一条通向你休息处的浓稠白色痕迹。}]");
         outputText("[pg]最后几股精液涂满了你的肉棒和念珠，深色的木头和黑色的橡胶上点缀着你珍珠白色的精液，形成了一种纯洁与欲望的有些美丽的二元对立。你躺在那里喘息了一会儿，然后清理干净自己，把念珠放进口袋，享受着丝滑的教袍贴在你敏感肌肤上的感觉，蜷缩起来睡了一觉。");
         get_player().orgasm("Dick");
         get_game().masturbation.updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunRosaryAssMasturbation() : void
      {
         clearOutput();
         outputText("感到欲火焚身，你的思绪飘向了你教袍口袋里的变态玩具。虽然藏在视线之外，但随着你性欲的增加，你越来越能感觉到它们的重量。");
         outputText("[pg]在这个隐蔽的地方让自己舒服地待着，你掀起教袍的后摆，将你的[butt]暴露在空气中。你的手伸进教袍口袋，本能地握住那串念珠，光滑的橡胶珠子在你的指尖下滚动。把它从口袋里拿出来，你惊叹于那些深色闪亮的珠子，不禁觉得它们和肛门拉珠有多么相似。");
         outputText("[pg]这串念珠的橡胶珠子最小的也足有一英寸粗，它们表面似乎总是覆盖着一层光滑的润滑液，非常适合轻松插入。");
         outputText("[pg]你微微脸红，慢慢摆好姿势，将你的[ass]翘在半空中。你把念珠拿到你的菊穴处，让涂满润滑液的橡胶在你的股沟上滚动，当珠子碰到你的会阴时，偶尔会稍微用力按压。每次按压你都能感觉到它撑开你的[asshole]，很快你就无法再抵挡诱惑，开始用拇指将整颗珠子推入。" + (get_player().ass.analLooseness >= 3 ? " 珠子轻松滑入，你的屁眼已经习惯了被填满。" : " 它伴随着一些疼痛和努力滑入，因为你还不习惯被插入。"));
         outputText("[pg]当你的内壁在第一颗珠子被第二颗珠子连接之前紧紧抓住坚硬的橡胶时，你发出一声呻吟。你很快发现自己把越来越多的念珠推入体内，气喘吁吁地感受着每一颗珠子撑开你并填满你的内壁。当你移动时，你能感觉到珠子滚得更深，你的通道以一种近乎饥渴的热情将它们拖入。[if (hasCock) {珠子压迫并挤压着你的前列腺，随着更多慢慢变暖的橡胶滑入你的体内，压力不断增加。}]");
         outputText("[pg]你最终到达了念珠的末端，深色的木制十字架随着你的每一次扭动轻轻敲击着你的[if (hasballs) {蛋蛋|[if (hasVagina) {[vagina]|屁股}]}]。你感到令人愉悦的充实，轻轻抚摸着你的肚子，在快感中喘息。即使是最轻微的触摸也会让你的内壁收缩并颤抖作为回应。你几乎不想停下来，沉浸在你俯卧的姿势中，你游移的手指在你的肚子上游走，在开始它们再次的旅程之前，停留在你发现的敏感点上。");
         outputText("[pg]你将挑逗的手指收回你的[ass]，慢慢地握住木制十字架。一旦确定握紧了，你呼出一口气做准备，同时后穴一直在抽搐。轻轻一拉，你开始把珠子拔出来。感觉就像有多个结同时从你体内抽出，你的内壁紧紧吸附着每一颗珠子，第一颗珠子撑开你的入口，然后伴随着轻微的“啵”声滑出。你呻吟着摇晃臀部，继续将每一颗珠子从你敏感的通道中缓缓拉出，急切地将它们越拔越快。很快，你每次轻拉之间几乎没有停顿，只留下刚好能让你感受到每颗珠子被拔出的时间，汗水从你的额头滴落，你咬紧牙关呻吟着。");
         outputText("[pg]你能感觉到你的释放即将到来，迅速积聚并准备吞噬你。随着最后一次拉扯，最后一颗珠子出来了，你高潮了，你的屁眼抽搐着[if (hasCock) {，[cocks]喷出浓稠的精液}][if (hasVagina) {，你的小穴彻底湿透了}]。你在地上躺了一会儿，喘息着，沉浸在你变态行为的高潮后的迷蒙中，然后才清理干净自己。你把念珠放进口袋，蜷缩起来睡了一觉，修女服丝滑的布料贴着你泛红的皮肤，感觉凉凉的。");
         get_player().orgasm("Anal");
         get_player().buttChange(12,true);
         get_game().masturbation.updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunPunishment() : void
      {
         clearOutput();
         outputText("你感到欲火焚身，于是找了个舒服的地方[if (corruption < 40) {，希望不会被人撞见|，希望有人能看着你}]。");
         outputText("[pg]你无法摆脱需要被惩罚的感觉，你那被玷污和淫荡的作风需要纠正，这样你才能再次接近“圣者”。你知道这一定是教袍在作祟，但你现在太他妈饥渴了，根本不在乎。你俯下身子，夸张地叹了口气，将教袍的下摆撩到肚子上。");
         outputText("[pg][say: 原谅我……我那淫荡的作风。] 你说道，最后一部分是低声嘟囔的。[say: 我有罪，需要受到惩罚。] 你翻了个白眼，觉得这很荒谬，但被惩罚的渴望却在增长。[say: 我将用痛苦为你净化自己。]");
         outputText("[pg]你拍打着自己的[ass]，虽然力道并不算大。紧接着又是一下，让你的肌肤泛起一阵热意。第三下稍微重了一些，这次打在你的左臀上，力道大得让你感到刺痛。你有些惊讶，因为你知道自己并没有用那么大的力气。第四下则打在你的右臀上，尖锐的刺痛让你忍不住轻呼出声。现在你明白了；这是习惯在作祟。它让你的脑海中充满了被惩罚的幻想，你弯下腰，双颊绯红，[if (hasCock) {滴着淫液的肉棒[if (hasVagina) {和流着淫水的花穴}]|[if (hasVagina) {流着淫水的花穴}]}]，还有一张泪流满面的脸庞，这些画面不断侵入你的脑海。");
         outputText("[pg][say: 这太荒谬了……]你嘟囔着，第五下打在你的[butt]上，让你吓得噤了声，无论你多想说话，似乎都无法打破这种沉默。你能感觉到凉风吹过你发热的肌肤，让你忍不住咬住嘴唇，打了个寒颤。接下来的拍打更加用力，让你的[butt]在力道下颤动。随着拍打的继续，你忍不住呜咽起来，你的[butt]随着时间的推移变得越来越红。很快，你眼泪汪汪，你的[butt]火辣辣地疼，每一次拍打落下的位置都和之前略有不同。你的[if (hasCock) {[cock]硬挺着，滴下大量的先列腺液[if (hasVagina) {，淫水从你丰满的[pussy]顺着大腿流下}]|[if (hasVagina) {淫水从你丰满的[pussy]顺着大腿流下}]}]，你大口大口地喘着粗气。");
         outputText("[pg]操，感觉真爽。你已经不在乎自己其实并没有做错什么，也不在乎这件教袍似乎正在控制你的行为了。你现在感受到的压倒性的快感简直不可思议。当你意识到自己将在这所谓的\"惩罚\"中高潮时，充斥着你全身的变态愉悦感变得更加强烈了。");
         outputText("[pg][say: 操……你比我还要变态，“圣者”……来、来吧……再惩罚我多一点……我还没反省呢！]你呻吟着，扭动着臀部，仿佛在引诱身后的某个人。不管怎样，这似乎奏效了，因为你挨打的频率变得更快、更密集，让你在美妙的痛苦中抽泣。当一记重击落下时，你感到腹部一阵翻腾，这次比之前打得更低。它击中了你的[if (hasballs) {蛋蛋|[if (hasVagina) {小穴|会阴}]}]，伴随着一声痛苦与快感交织的原始嚎叫，你高潮了。你瘫倒在地，大口喘着粗气，你的[if (hasCock) {肉棒|[if (hasVagina) {小穴|屁股}]}]因快感而悸动。片刻之后，你失去了意识，你的感官被高潮的力量所淹没。");
         outputText("[pg]当你醒来时，你感觉休息得很充分，只是你的[butt]有点娇嫩敏感。你坏笑着，轻轻揉了揉自己的屁股。如果忏悔的感觉这么爽，为什么不继续犯罪呢？");
         outputText("[pg]你清理干净自己，然后回去继续你的职责。");
         get_player().orgasm();
         get_game().masturbation.updateMasturbation();
         if(Utils.rand(2) == 0)
         {
            get_player().dynStats(DynStat.Cor(-1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunMasturbationMenu() : void
      {
         menu();
         if(!get_player().isTaur())
         {
            if(get_player().hasCock())
            {
               addNextButton("念珠 (肉棒)",naughtyNunRosaryCockMasturbation).hint("用你的念珠满足你自己的天堂之柱。");
               addNextButton("洗礼",naughtyNunSelfBaptism).hint("用你的精液为自己洗礼。");
            }
            if(get_player().hasVagina())
            {
               addNextButton("十字架 (小穴)",naughtyNunCrossVaginalMasturbation).hint("用那件神圣的工具取悦自己。");
            }
            addNextButton("念珠 (屁股)",naughtyNunRosaryAssMasturbation).hint("用你的念珠填满你罪恶身体的深处。");
            addNextButton("十字架 (屁股)",naughtyNunCrossAnalMasturbation).hint("用那件神圣的工具插入你罪恶的身体。");
            if(get_player().cor > 40)
            {
               addNextButton("惩罚",naughtyNunPunishment).hint("你最近的罪恶行为必须得到纠正。惩罚你自己，并尽量不要去享受它。");
            }
         }
         addButton(14,"返回",get_game().masturbation.masturbateMenu);
      }
      
      public function naughtyNunCrossVaginalMasturbation() : void
      {
         clearOutput();
         outputText("感到欲火焚身，你的思绪飘向了你教袍口袋里的变态玩具。虽然藏在视线之外，但随着你性欲的增加，你越来越能感觉到它们的重量。");
         outputText("[pg]在这个隐蔽的地方让自己舒服地躺下后，你掀起教袍的下摆，把它撩到肚子上，露出你的[pussy]。当你漫不经心地把玩着自己，在湿润的阴唇上留下一道情欲的痕迹时，你把空闲的手伸进口袋。你的手指握住金色十字架坚硬的柱身，当你握得更紧时，指尖划过上面细小的青筋。你一只手慵懒地在阴蒂上画圈，同时把十字架从教袍里拿出来，粗壮柱身的头部指向你，你把它凑到唇边。");
         outputText("[pg]你将手指探入[pussy]中，开始吮吸十字架球状的头部，用唾液润滑它。你的头沿着十字架的长度前后摇晃，随着手指在你体内越探越深，你急切地发出吸溜声。当你的手指擦过G点时，你的手掌粗暴地摩擦着阴蒂，让你不由自主地呻吟，口水滴落在假阳具上，臀部也反射性地轻轻挺动。");
         outputText("[pg]一旦你觉得你已经充分准备好了你那变态的假阳具，你就把它对准你现在已经勃起的[vagina]。你伴随着一声小小的喘息，把钝头推入你的入口，金色的假阳具[if (vaginallooseness > 3) {勉强|[if (vaginallooseness == 2) {轻松地}]}]撑开你，因为它深入你的[vagina]，你的肉壁紧紧贴着雕刻的静脉。");
         outputText("[pg]你继续挺动臀部，将金色的阳具送入体内，你像握把手一样握住十字架的顶部，发出呻吟。这东西摩擦的地方真是恰到好处！");
         outputText("[pg]你最终将假阳具完全吞没，花了几分钟享受[pussy]内的充实感，收缩又放松着包裹它的通道。你忍不住惊叹于十字架精湛的雕工，每一次收缩都能得到粗大青筋摩擦和挤压你最敏感部位的强烈压迫感作为回报。");
         outputText("[pg]你抓住十字架的顶部，以一种挑逗般缓慢的速度将它拔出，它的粗度和纹理让你兴奋不已，然后你又猛地将它插回，利用顶部作为杠杆，一次挺送就尽可能深地吞入。你享受着它迅速撑开你的感觉，每一次急切的挺送，蘑菇头都会撞击你子宫的入口，同时每次拔出时都会擦过你的G点。");
         outputText("[pg]当你拼命地用玩具操自己时，你能感觉到你的高潮在积聚，你的内壁抽搐着[if (hasballs) {，你的蛋蛋紧绷[if (hasCock) {，你的肉棒肿胀}]|[if (hasCock) {，你的肉棒肿胀}]}]。随着你[clit]的最后一次弹拨和玩具的深深刺入，你高潮了，你的[pussy][if (vaginalwetness < 2) {渗出|[if (vaginalwetness < 3) {滴下|[if (vaginalwetness < 5) {喷出}]}]}]淫液，溅满了假阳具，顺着你的股沟流下。[if (hasballs) {你的蛋蛋紧绷并颤抖着[if (hasCock) {，你的[if (cocks > 1) {肉棒喷射|肉棒喷射}]}]，急切地，浓稠的精液块涂满了你的肚子，你的小穴在玩具周围颤动|[if (hasCock) {你的[if (cocks > 1) {肉棒喷射|肉棒喷射}]急切地，浓稠的精液块涂满了你的肚子，你的小穴在玩具周围颤动}]}]。");
         outputText("[pg]你将十字架从你被操得爽翻的[pussy]中抽出，由于涂上了一层新的淫水，它的金色柱身在光线下闪闪发光。你清理了自己和玩具，然后把它放进口袋，蜷缩起来睡了一觉，你的欲望得到了满足。");
         get_player().cuntChange(12,true);
         get_player().orgasm("Vaginal");
         get_game().masturbation.updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunCrossAnalMasturbation() : void
      {
         clearOutput();
         outputText("感到欲火焚身，你的思绪飘向了你教袍口袋里的变态玩具。虽然藏在视线之外，但随着你性欲的增加，你越来越能感觉到它们的重量。");
         outputText("[pg]在隐蔽的地方让自己舒服下来，你掀起教袍的下摆，把它拉上去露出你的[butt]，然后找到一个舒服的姿势，把你的[ass]翘在半空中。");
         outputText("[pg]你把手伸进教袍的口袋，手指握住十字架假阳具青筋暴起的柱身。你把它从口袋里拿出来，把假阳具蘑菇状的头部送到唇边，慢慢地舔着。你用唾液润滑假阳具，一边狂热地吸吮着头部。");
         outputText("[pg]很快，你开始在嘴里抽插这根假阳具，吸吮着它的长度，舌头在它青筋暴起的柱体上打转。唾液从玩具上滴落，你的嘴唇因为这湿滑的口交而变得亮晶晶的。你伴随着轻微的“啵”声将假阳具从唇间滑出，然后将这根被口水润滑得闪闪发亮的肉棒对准了你的后穴。");
         outputText("[pg]你把十字架对准你的[asshole]，用缓慢但持续的压力把光滑的蘑菇状头部推入体内。当你颤抖和呻吟时，你感觉到头部撑开了你，当你用十字架的顶部作为把手把它推入体内时，静脉状的轴在你的内壁上拖拽。你反射性地紧紧抓住这个肛门入侵者，在它周围弯曲，因为你感觉到钝头刺入你体内更深处。[if (hasCock) {当假阳具在你的屁股里触底时，你感觉到前列腺受到温和的压力，这让你的身体因兴奋而嗡嗡作响。}]");
         outputText("[pg]你把假阳具拔出到顶端，你的通道试图饥渴地抓住粗壮的轴并阻止它的撤退，然后伴随着气喘吁吁的呜咽把它推回去。你很快建立起一种节奏，让你在重新进入时向后摇晃进入十字架肉棒，把它深深地埋在你的屁股里，迫使钝头捣入你的[if (hasCock) {前列腺|敏感的通道壁}]。当你的兴奋迅速积聚时，你高兴地呻吟着，当你的高潮最终到来时，你全身都在颤抖。当你被快感淹没时，你的通道在假阳具周围收缩和抽搐[if (hasCock) {，你沾满先列腺液的[cock]喷出精液，以相当大的力量击中地面[if (hasballs) {，你的蛋蛋紧绷，被拉起贴着你的身体，翻滚着热量}]|[if (hasballs) {，你的[balls]紧绷并颤抖，被拉起贴着你的身体，翻滚着热量}]}]。[if (hasVagina) {你被忽视的[pussy]彻底湿透了，让你的[legs]变得湿滑}]。");
         outputText("[pg]你花了一点时间瘫倒在地上，从高潮的余韵中恢复过来，然后你从[ass]中取出十字架，你的欲望现在得到了满足。[if (hasCock) {你的肌肉在你神圣工具留下的空隙周围收缩，当你从[cock]中喷出最后一滴精液时，你呻吟着。}]你清理干净自己和假阳具，然后把它放回修女服的口袋里，蜷缩起来睡了一个满足、虔诚的觉。");
         get_player().buttChange(12,true);
         get_player().orgasm("Anal");
         get_game().masturbation.updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function naughtyNunCockWorship(param1:Object = undefined) : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         outputText("当[themonster]战败倒地时，你双手合十祈祷。");
         outputText("[say: 感谢您赐予我又一次胜利，圣者。又一个敌人被击败，帮助净化这片土地并传播光明]" + (get_player().cor > 40 ? "，你用一种略带讽刺和戏剧化的口吻说道" : "") + "。");
         outputText("[pg]当你看着倒下的敌人时，一抹浅笑掠过你的唇角，你为接下来计划要做的变态事情感到愉悦。");
         outputText("[pg]你在[themonster]身边[if (tailLeg) {rest on the ground|kneel down}]，慢慢开始抚摸[monster.his]阴茎。[Monster.he]困惑地看着你，但随着[monster.his]肉棒开始变硬，[monster.he]闭上眼睛向后靠去，用手掌在身后支撑着[monster.himself]。");
         outputText("[pg]当[monster.his]阴茎在你的抓握中开始膨胀时，你收紧了握力，用缓慢而有意的长动作抚摸着它们。");
         outputText("[pg][say: 圣者啊，请允许我用这可悲生物的身体来感谢您。愿您能感受到您忠诚的仆人对这不知您光芒的怪物所做的一切。让我通过侍奉这迷失者的肉体，就如同侍奉您自己的一样，来向您展示我是多么地忠诚。]");
         outputText("[pg]你加快了套弄的速度，当你到达顶端时，稍微扭动你的手，抚摸他们阴茎敏感的头部。当预精开始从他们阴茎的顶端流出时，你用它涂满你的手掌，伴随着淫荡的吧唧声润滑他们的长度。[Themonster]在你挤压[monster.his]阴茎根部时抽动[monster.his]臀部，舒服地发出一点咕噜声。");
         outputText("[pg][say: 看我如何尽职尽责地用我的嘴来净化这个迷失者。我将把这根肉柱当作您神圣的身体一样来擦拭，]" + (get_player().cor > 40 ? " 你一边宣告，一边对着[monster.his]阴茎光滑的顶端轻轻呼出热气，你的拇指向上挑逗地按摩着系带" : "") + "。你一个敏捷的动作，吞没了[monster.his]" + get_monster().cockAdjective() + "肉棒的头部，将其困在你嘴里火热的洞穴中。[Themonster]的喘息让你感到有趣，你吸吮着顶端，凹陷你的脸颊，舌头在[monster.his]精液裂口上弹动。");
         outputText("[pg]你继续有节奏地挤压和套弄[monster.his]阴茎的根部，随着你舌头的每一次弹动，感觉到它在你的手掌上弯曲。你上下摆动你的头，拖着你的舌头沿着[monster.his]阴茎的底部，挑逗地让顶端戳你喉咙的入口，但从不让它进去。每一次向上滑动，麝香般的预精都会涂满你的舌头，唤起的味道和气味充满了你的感官。你能看出他们现在快到了，[monster.his]阴茎在你的抓握中跳动，你开始更快地套弄他们，当你的手掌穿过[monster.his]长度时，你的握力收紧了。");
         outputText("[pg]你停止了吸吮[monster.his]的肉棒，伴随着“啵”的一声轻响，一缕唾液和前列腺液在你们之间拉出银丝。");
         outputText("[pg][say: 圣主啊，请继续以您的名义支持我的征途。向您卑微的仆人展示我通过这具淫乱的化身让您有多么愉悦吧。降下您神圣的雪白精华吧！]");
         outputText("[pg]当你喊出这最后的话语时，你看到[themonster]的马眼胀大，感觉到[monster.his]的释放冲破了你的握持。浓稠的精液如绳索般喷射而出，如雨点般落在你跪着的身躯上，点缀着你深蓝色的教袍。它成股地粘附在" + get_player().smallMedBigBreasts("你的胸膛上","你的乳房上","你的乳房和乳沟之间") + "，大团大团地滴落在你的大腿上。你再次双手合十祈祷，尽管现在它们已经沾满了黏糊糊的精液。");
         outputText("[pg][say: 感谢您，圣主，感谢您赐予我接受您祝福的机会。愿这具替代血肉产生的精华能成为您纯洁的导管。]你慢慢站起身，精液像水过鸭背一样从你教袍光滑的布料上滑落。" + (get_player().cor > 40 ? " 你用手指抹过残留在[themonster]肉棒上的精液水珠，然后把手指吸吮干净。[say: 而这崇拜则是我淫乱的导管，]你轻声笑道" : "") + "。清理完所有精液后，你轻轻拍打了几下理平教袍，继续上路。");
         get_player().slimeFeed();
         dynStats(DynStat.Sens(2));
         if(get_player().hasVirginVagina())
         {
            dynStats(DynStat.Cor(-1));
         }
         if(get_monster() is Minotaur || get_monster() is MinotaurMob)
         {
            get_player().minoCumAddiction(3);
         }
         if(get_monster().get_short() == "Ceraph")
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,291,FlagDict_Impl_.arrayReadInt(_loc2_,291) + 1);
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat(param1);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
   }
}

