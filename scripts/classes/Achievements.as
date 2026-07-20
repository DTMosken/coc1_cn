package classes
{
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class Achievements extends BaseContent
   {
      
      public var achievementsTotal:int;
      
      public var achievementsEarned:int;
      
      public function Achievements()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         achievementsTotal = 0;
         achievementsEarned = 0;
         super();
      }
      
      public function titleAchievementSection(param1:String) : void
      {
         outputText("\n<b><u>" + param1 + "</u></b>\n");
      }
      
      public function addAchievement(param1:String, param2:int, param3:String, param4:String = undefined, param5:Boolean = false) : void
      {
         if(param4 == null)
         {
            param4 = "";
         }
         var _loc6_:Object = get_achievements().h[param2];
         if(param5 && !_loc6_)
         {
            return;
         }
         if(param4 == "")
         {
            param4 = param3;
         }
         var _loc7_:String = "";
         _loc7_ += "<li><b>" + param1 + ":</b> ";
         if(_loc6_)
         {
            _loc7_ += "<font color=\"" + get_mainViewManager().colorHpPlus() + "\">已解锁</font> - " + param4;
            achievementsEarned += 1;
         }
         else
         {
            _loc7_ += "<font color=\"" + get_mainViewManager().colorHpMinus() + "\">未解锁</font> - " + param3;
         }
         if(param5)
         {
            _loc7_ += " - <font color=\"" + (get_mainViewManager().isDarkTheme() ? "#ff00ff" : "#660066") + "\">隐藏成就</font>";
         }
         _loc7_ += "</li>";
         outputText(_loc7_);
         achievementsTotal += 1;
      }
      
      public function achievementsScreen() : void
      {
         get_game().mainMenu.hideMainMenu();
         achievementsEarned = 0;
         achievementsTotal = 0;
         clearOutput();
         get_game().displayHeader("成就");
         outputText("注意：有些成就是相互冲突的，可能需要多次通关才能获得所有成就。\n");
         titleAchievementSection("主线故事");
         addAchievement("初来乍到",0,"进入玛瑞斯的世界。");
         addAchievement("玛莱的救主",1,"完成玛莱的任务。");
         addAchievement("终得复仇",2,"击败泽塔兹并获得地图。");
         addAchievement("恶魔杀手",3,"击败莱西斯。");
         titleAchievementSection("区域");
         addAchievement("探险家",10,"发现每一个区域。");
         addAchievement("观光客",11,"发现每个地点。");
         addAchievement("我这是在哪儿？",12,"首次进行探索。");
         addAchievement("护林员",13,"探索森林100次。");
         addAchievement("度假者",14,"探索湖泊100次。");
         addAchievement("脱水",15,"探索沙漠100次。");
         addAchievement("登山者",16,"探索山脉100次。");
         addAchievement("连绵丘陵",18,"探索平原100次。");
         addAchievement("浑身湿透",19,"探索沼泽100次。");
         addAchievement("仍需深入",17,"探索深林100次。");
         addAchievement("头晕目眩",20,"探索高山100次。");
         addAchievement("一片泥泞",21,"探索泥沼100次。");
         addAchievement("冰封",22,"探索冰川裂谷100次。");
         addAchievement("炙烤",26,"探索火山峭壁100次。");
         addAchievement("考古学家",23,"探索城镇废墟15次。");
         addAchievement("农夫",24,"拜访惠特尼的农场30次。");
         addAchievement("习惯水性",25,"使用湖船15次。");
         titleAchievementSection("等级");
         addAchievement("初次升级！",30,"达到2级。");
         addAchievement("新手",31,"达到5级。");
         addAchievement("学徒",32,"达到10级。");
         addAchievement("熟练工",33,"达到15级。");
         addAchievement("专家",34,"达到20级。");
         addAchievement("大师",35,"达到30级。");
         addAchievement("宗师",36,"达到45级。");
         addAchievement("显赫",37,"达到60级。");
         addAchievement("霸主",38,"达到90级。");
         addAchievement("你是神吗？",39,"达到120级。","达到120级。",true);
         titleAchievementSection("人口");
         addAchievement("我的第一个同伴",40,"营地人口达到2。");
         addAchievement("小村庄",41,"营地人口达到5。");
         addAchievement("村庄",42,"营地人口达到10。");
         addAchievement("小镇",43,"营地人口达到25。");
         addAchievement("城市",44,"营地人口达到100。");
         addAchievement("大都会",45,"营地人口达到250。");
         addAchievement("特大城市",46,"营地人口达到500。");
         addAchievement("城邦",47,"营地人口达到1000。","",true);
         addAchievement("王国",48,"营地人口达到2500。","",true);
         addAchievement("帝国",49,"营地人口达到5000。","",true);
         titleAchievementSection("时间");
         addAchievement("完整的一月",50,"生存至第30天。");
         addAchievement("半年",51,"生存至第180天。");
         addAchievement("一年",52,"生存至第365天。（1年）");
         addAchievement("两年",53,"生存至第730天。（2年）");
         addAchievement("三年",54,"生存至第1095天。（3年）");
         addAchievement("坚持甚久",55,"生存至第1825天。（5年）");
         addAchievement("十年",56,"到达第3650 天。（10 年）","到达第 3650 天。（10 年 | 好了，你可以停下来了。）",true);
         addAchievement("世纪",57,"到达第36500 天。（100 年）","到达第 36500 天。（100 年 | 该停止游戏了，去外面走走吧。）",true);
         addAchievement("时间旅行者",59,"通过篡改存档到达第36500天以上","",true);
         titleAchievementSection("地牢");
         addAchievement("探索者",60,"通关任意地牢。");
         addAchievement("探索学徒",60,"通关3个地牢。");
         addAchievement("探索大师",61,"通关游戏中的每一个地牢。");
         addAchievement("全面停工",62,"通关工厂。");
         addAchievement("深陷其中",63,"完全通关深渊洞穴。");
         addAchievement("统治终结",69,"完全通关莱西斯要塞。");
         addAchievement("沙漠女巫之友",64,"完全通关沙漠洞穴。");
         addAchievement("凤凰陨落",65,"通关不死鸟高塔。");
         addAchievement("共犯",66,"看着赫莉娅杀死哈比女王。","",true);
         addAchievement("极度禁欲的探索者",67,"从头到尾未曾高潮的情况下通关不死鸟高塔。","",true);
         addAchievement("一线生机",279,"通关被诅咒的庄园。");
         addAchievement("我们即是火焰",280,"通关欺骗之塔。");
         addAchievement("思想交汇",281,"攀登神化之柱，并在决斗中击败一名巫师。");
         titleAchievementSection("时尚");
         addAchievement("想当巫师",70,"装备巫师长袍和魔法法杖。");
         addAchievement("角色扮演",71,"穿戴10种不同的衣服/护甲。");
         addAchievement("施虐女王",72,"穿戴任何形式的情趣服装，并装备任何形式的鞭子。");
         addAchievement("真空上阵",73,"在穿戴任何衣服或盔甲时，不穿内衣。");
         addAchievement("珠光宝气",74,"穿戴价值超过1000宝石的首饰。");
         titleAchievementSection("财富");
         addAchievement("我已富有",75,"拥有1000宝石。");
         addAchievement("囤积狂",76,"拥有10,000颗宝石。");
         addAchievement("行走的宝石库",77,"拥有100,000颗宝石。");
         addAchievement("百万富翁",78,"拥有1,000,000颗宝石。","拥有1,000,000颗宝石。你打算把这些宝石花在什么地方？",true);
         titleAchievementSection("战斗");
         addAchievement("巫师",80,"从法术书中学习所有的黑魔法和白魔法。");
         addAchievement("精液加农炮",81,"在战斗中射精。");
         addAchievement("怎么射出蛛网？",86,"向你的对手发射蛛网。");
         addAchievement("痛击",82,"单次攻击造成50点伤害。");
         addAchievement("断肢",83,"单次攻击造成100点伤害。");
         addAchievement("碎骨",84,"单次攻击造成250点伤害。");
         addAchievement("过量击杀",85,"单次攻击造成500点伤害。");
         addAchievement("伤害海绵",87,"累计承受10,000点伤害。");
         addAchievement("放血者",88,"累计造成50,000点伤害。");
         addAchievement("复仇反击",278,"用武士刀反击击败一名敌人。");
         addAchievement("夜之阳",283,"用超新星击败一名等级高于你的敌人。","",true);
         titleAchievementSection("季节活动");
         addAchievement("彩蛋猎人",90,"在复活节活动期间，通过随机掉落找到10个彩蛋。","",true);
         addAchievement("生日快乐，赫莉娅！",91,"参与赫莉娅的生日活动。（八月）","",true);
         addAchievement("感恩荡妇",92,"遇见猪猪荡妇（感恩节）","",true);
         addAchievement("咯咯咯",93,"遇见吞精火鸡（感恩节）","",true);
         addAchievement("南-瓜-瓜-瓜",94,"找到南瓜（万圣节）","",true);
         addAchievement("菲拉的仙境",95,"解救菲拉/访问她的仙境（万圣节）","",true);
         addAchievement("淘气还是乖巧",96,"遇见圣诞精灵（圣诞节）","",true);
         addAchievement("圣诞颂歌",97,"完成卡罗尔的迷你任务（圣诞节）","",true);
         addAchievement("可爱的雪人",98,"让尼芙成为你的情人（圣诞节/冬季）","",true);
         addAchievement("做我的情人好吗？",99,"在情人节期间光顾湿身婊酒馆。（情人节）","",true);
         titleAchievementSection("生存/真实模式");
         addAchievement("尝起来像鸡肉",100,"第一次恢复饥饿值。");
         addAchievement("勇者急需食物",101,"一次性将饥饿值从0瞬间恢复到100。");
         addAchievement("贪食者",103,"在饥饿值高于90时进食。");
         addAchievement("斋戒",104,"保持饥饿度在25以下持续一周，但不要让它降到0。");
         titleAchievementSection("挑战");
         addAchievement("终极菜鸟",105,"在1级时击败莱西斯。");
         addAchievement("平凡但是勇者",106,"在不掌握任何法术的情况下击败莱西斯。");
         addAchievement("禁欲英雄",107,"在从未发生过性行为或自慰的情况下完成主线故事。");
         addAchievement("和平主义",108,"在不击败或杀死任何人的情况下完成主线故事。","在不击败或杀死任何人的情况下完成主线故事。弗里斯克会为你感到骄傲的。");
         addAchievement("速通玩家",109,"在30天或更短时间内完成主线故事。不能在“新游戏+”模式下进行。");
         titleAchievementSection("常规");
         addAchievement("传送门守卫",110,"击败25只恶魔并睡眠10次。");
         addAchievement("坏结局制造者",111,"导致或见证各种NPC的3个坏结局。");
         addAchievement("游戏结束！",112,"达成一个坏结局。");
         addAchievement("尿急惹祸",113,"在玛瑞斯世界中至少排尿一次。");
         addAchievement("烂醉如泥",153,"喝得烂醉，最后尿了出来。","",true);
         addAchievement("我这是怎么了？",114,"第一次发生变形。");
         addAchievement("变形者",115,"变形10次。");
         addAchievement("千变万化",116,"变形25次。");
         addAchievement("撸啊撸",117,"第一次自慰。");
         addAchievement("淫不可挡",118,"自慰10次。");
         addAchievement("自慰大师",119,"自慰100次。");
         addAchievement("赫莉娅的子嗣",120,"让赫莉娅生下子嗣并将其抚养成年。");
         addAchievement("粘液护甲",121,"穿上粘液护甲。");
         addAchievement("乌尔塔的真爱",122,"完成乌尔塔的不孕不育任务，然后让她生下一只小狐狸。","",true);
         addAchievement("盛装达人",123,"把所有可用的服装都给鲁比。");
         addAchievement("弑神者",124,"击败堕落的玛莱。","",true);
         addAchievement("众望所归",126,"获得游戏中的所有追随者。");
         addAchievement("应收尽收",125,"获得游戏中的每一个情人。（尼芙不是必选项）");
         addAchievement("到汝之" + get_player().mf("主人","女主人") + "身边来",127,"获得游戏中的每一个奴隶。（堕落的乔乔和艾米莉，以及无脑荡妇苏菲不是必选项。）");
         addAchievement("奴隶主",128,"获得游戏中的每一个奴隶，包括堕落的乔乔和艾米莉，以及无脑荡妇苏菲。","",true);
         addAchievement("所有人都属于我",129,"获得每一个追随者、情人和奴隶。（互斥的除外）");
         addAchievement("学者",130,"解锁游戏中所有的百科条目。");
         addAchievement("白吃白喝",133,"拜访狐妖的宅邸3次。");
         addAchievement("双重人格",138,"在纯洁与堕落之间反复横跳4次。（腐化阈值为20和80）");
         addAchievement("洗心革面",139,"首次将腐化从100降至0。");
         addAchievement("天赋异禀",134,"拥有至少20个特质。");
         addAchievement("天赋超群",135,"拥有至少35个特质。");
         addAchievement("天赋绝伦",167,"拥有至少50个特质。");
         addAchievement("多面手",136,"每项属性至少达到50。（性欲、敏感度、腐化度不作要求）");
         addAchievement("超凡属性",137,"每项属性至少达到100。（性欲、敏感度、腐化度不作要求）");
         addAchievement("宛如查克·诺里斯",142,"在不穿戴任何装备的情况下击败霜巨人。","在不穿戴任何装备的情况下击败霜巨人。真是个狠角色！");
         addAchievement("触手怪杀手",144,"击杀你的第一只触手怪。");
         addAchievement("锤子时间",156,"总计购买300个钉子。");
         addAchievement("钉子拾荒者",157,"从图书馆废墟中总计拾荒200个钉子");
         addAchievement("我才不是伐木工",154,"总计购买100块木头。");
         addAchievement("森林破坏者",155,"砍伐100块木头。");
         addAchievement("呀吧嗒吧嘟",170,"总计购买100块石头。");
         addAchievement("蚂蚁工坊",171,"在菲拉的帮助下总共收集200块石头。");
         addAchievement("甜蜜的家",145,"建成小木屋并配齐家具。");
         addAchievement("露宿野外",146,"在营地外过夜。");
         addAchievement("我的帐篷比你的好（并不）",160,"在阿瑞安的帐篷里睡觉。");
         addAchievement("神圣干预",161,"完成密涅瓦的净化仪式。","",true);
         addAchievement("剑术家",162,"完成拉斐尔的刺剑训练。","",true);
         addAchievement("现在你搞上传送门了",164,"和塞拉芙进行传送门性爱。","",true);
         addAchievement("搞到木头",165,"徒手撸树直到掉出木头……等等，啥？","",true);
         addAchievement("丁丁猎人",166,"从至少三个可去势的NPC身上移除鸡巴。你不觉得他们会怀念曾经拥有的日子吗？","",true);
         addAchievement("你个混蛋",169,"做一些只有邪恶之人才会做的事。比如腐化NPC，或者从至少7个可去势的NPC身上移除鸡巴。","",true);
         addAchievement("高达十一",168,"让你的身高达到11英尺。");
         addAchievement("砍下她的头！",172,"你成功斩首了莱西斯，并向恶魔们展示了她的头颅！","",true);
         addAchievement("不——————！",173,"你在莱西斯把你收为奴隶之前成功自杀了。","",true);
         addAchievement("让玛瑞斯再次伟大",176,"在你的营地周围建一堵墙，以抵御那些烦人的小恶魔。");
         addAchievement("小恶魔兵马俑",177,"你在营地围墙周围放置了100个小恶魔雕像。不，巴西。坏巴西！坏坏的巴西先生！！！","",true);
         addAchievement("孔明的陷阱",174,"成为孔明陷阱的受害者。","",true);
         addAchievement("猎人反成猎物",179,"对魔王进行反击。");
         addAchievement("阿克巴尔至大",180,"向阿克巴尔屈服，直到获得相关增益。");
         addAchievement("乔乔的奇妙冒险",182,"通过任意方式，让乔乔加入你的营地。");
         addAchievement("寄生虫女王",277,"体内寄生了大量的鳗鱼寄生虫。");
         addAchievement("络新妇女王",290,"体内寄宿大量的络新妇寄生虫。","",true);
         addAchievement("络新妇至高女王",295,"达成络新妇至高女王的统治。","",true);
         addAchievement("修格斯领主假说",282,"你刚刚击败了一个不可名状的怪物，这证明了OCA对游戏平衡的把控非常糟糕。","",true);
         menu();
         addButton(0,"" + achievementsEarned + "/" + achievementsTotal + " 已获得",get_game().doNothing).hint("这是你目前在游戏中获得的成就总数。","已获得成就总数");
         addButton(14,"返回",get_game().mainMenu.mainMenu);
      }
   }
}

