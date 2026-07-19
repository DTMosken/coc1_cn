package classes.scenes.areas.desert
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class DemonPack extends Monster
   {
      
      public function DemonPack()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("demons");
         imageName = "demonmob";
         set_long("这群恶魔大约由二十个棕褐色皮肤的恶魔组成，大多是人形，但整个群体中有着许多各种各样的腐化特征。你看到了恶魔高跟鞋、扭曲的角以及各种形状和大小的摇晃着的肉棒。里面似乎甚至还有一个牛头。你还辨认出了许多乳房，从微小的到需要第二个人帮忙托着的巨乳应有尽有，伴随着这些乳房的是各种各样的小穴，有的湿润滴液，有的干燥，有时还依偎在某种恶魔肉棒下方。这个小部落没有携带任何武器，他们穿的那点衣服也已经破烂不堪，除了一个魁梧的雄性，他宽阔的肩膀上披着一件似乎是蛇皮做成的斗篷。" + (get_game().get_silly() ? " 你发现他肩膀上有一块奇怪的臂章，上面写着：[say: 第41工程连：阴道清理]。" : ""));
         set_race("Demons");
         set_plural(true);
         pronoun1 = "他们";
         pronoun2 = "他们";
         pronoun3 = "他们的";
         createCock(18,2);
         createCock(18,2,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         createVagina(false,3,2);
         createBreastRow(0);
         ass.analLooseness = 4;
         ass.analWetness = 5;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(80,10,10,5);
         initLibSensCor(50,60,80);
         set_weaponName("claws");
         set_weaponVerb("claw");
         set_armorName("demonic skin");
         bonusHP = 200;
         set_lust(30);
         temperment = 3;
         level = 6;
         set_gems(Utils.rand(25) + 10);
         set_drop(new WeightedChoice().addMany(1,get_consumables().SUCMILK,get_consumables().INCUBID,get_consumables().OVIELIX,get_consumables().B__BOOK));
         special1 = get_game().combat.packAttack;
         special2 = get_game().combat.lustAttack;
         tail.type = 3;
         horns.type = 1;
         horns.value = 2;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            if(param1)
            {
               outputText("你在恶魔面前倒下，它们嘲笑你完全没有男性或女性的特征，并殴打你直到你昏迷过去。");
            }
            else
            {
               outputText("你向恶魔们献上自己，但它们立刻开始嘲笑你缺乏性征。它们一拥而上，将你打得失去了意识。");
            }
            get_game().combat.cleanupAfterCombat();
         }
         else if(param1)
         {
            outputText("恶魔们终于将你击倒，你瘫倒在绿洲的沙地上。几乎立刻，你感觉到恶魔的手在按压和试探你俯卧的身体。你听到这群恶魔的首领用一种奇怪的语言说了些什么，但你觉得你知道那是什么意思。恶魔们带着明确的意图扑向你毫无生气的身体，开始在你身上摩擦……");
            doNext(get_game().desert.oasis.oasisSexing);
         }
         else
         {
            outputText("你努力想把注意力集中在战斗上，但失败了。");
            if(param2)
            {
               outputText("[pg]恶魔们开着玩笑，微笑着，显然对你的状态毫不关心。[pg]");
            }
            if(int(get_player().cocks.length) > 0)
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的每");
               }
               else
               {
                  outputText("你");
               }
               outputText("根[cocks]都在");
               if(get_player().hasVagina())
               {
                  outputText("并且你的");
               }
            }
            if(int(get_player().vaginas.length) > 0)
            {
               if(!get_player().hasCock())
               {
                  outputText("你的");
               }
               outputText(get_player().vaginaDescript(0) + "发烫");
            }
            outputText("因性奋而跳动。你伸手抓向最近的恶魔，抓住了一把摇晃的乳房。你拼命想用另一只手臂把她拉近，以解你的饥渴，但你们俩都摔倒在地上。恶魔首领大笑出声，部落的其余成员扑向你，抓取它们能找到的任何东西。");
            doNext(get_game().desert.oasis.oasisSexing);
         }
      }
      
      override public function teased(param1:Number) : void
      {
         outputText("\n");
         if(param1 == 0)
         {
            outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + "似乎无动于衷。");
         }
         else if(param1 > 0 && param1 < 5)
         {
            outputText("恶魔们攻击的强度有所减弱，有些甚至在攻击你时打量着你的本钱。");
         }
         else if(param1 >= 5 && param1 < 10)
         {
            outputText("恶魔们显然在避免损坏任何你可能用来做爱的东西，并且在每次击打后，它们的手在你身上停留的时间开始变长。有些恶魔开始用另一只手快速地摸你，你能闻到空气中弥漫着十几个身体散发出的恶魔般的欲望。");
         }
         else if(param1 >= 10)
         {
            outputText("恶魔们越来越不愿意打你，越来越愿意只是用手在你身上性感地抚摸。空气中弥漫着浓烈的恶魔欲望的气味，部分恶魔只是站在那里公然地抚摸自己。");
         }
         applyTease(param1);
      }
      
      public function rapeDemons() : void
      {
         clearOutput();
         outputText("你张开双臂，走进渴望的恶魔群中。它们急切地跳起来触摸你，每一秒都变得越来越狂热。你抓住最近的恶魔，把它扔到地上，不假思索地，其余的恶魔也跳过来加入你，陷入了无脑的欲望疯狂中……");
         doNext(get_game().desert.oasis.oasisSexing);
      }
      
      override public function performCombatAction() : void
      {
         if(Utils.rand(2) == 0)
         {
            special1();
         }
         else
         {
            special2();
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _g:Combat;
         var _loc2_:* = null as Output;
         clearOutput();
         if(param1)
         {
            outputText("你猛然出击，最后一个恶魔砰的一声倒在地上。你站在那里，周围是死去的或失去知觉的恶魔，感觉自己就像一个战神。然后你意识到，如果战神真的存在，他大概就住在这样恶魔横行的位面——为了不冒犯他，你把手从腰间放下，把[legs]从恶魔首领的脑袋上挪开，然后才开始搜刮尸体。");
            if(int([DynStat.Lust(1)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(1)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0]);
            }
            else if(int([DynStat.Lust(1)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1]);
            }
            else if(int([DynStat.Lust(1)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2]);
            }
            else if(int([DynStat.Lust(1)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3]);
            }
            else if(int([DynStat.Lust(1)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4]);
            }
            else if(int([DynStat.Lust(1)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5]);
            }
            else if(int([DynStat.Lust(1)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6]);
            }
            else if(int([DynStat.Lust(1)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7]);
            }
            else if(int([DynStat.Lust(1)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8]);
            }
            else if(int([DynStat.Lust(1)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9]);
            }
            else if(int([DynStat.Lust(1)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10]);
            }
            else if(int([DynStat.Lust(1)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11]);
            }
            else if(int([DynStat.Lust(1)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12]);
            }
            else if(int([DynStat.Lust(1)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13]);
            }
            else if(int([DynStat.Lust(1)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14]);
            }
            else if(int([DynStat.Lust(1)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15]);
            }
            else if(int([DynStat.Lust(1)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16]);
            }
            else if(int([DynStat.Lust(1)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17]);
            }
            else if(int([DynStat.Lust(1)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18]);
            }
            else
            {
               if(int([DynStat.Lust(1)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18],[DynStat.Lust(1)][19]);
            }
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            outputText("恶魔们停止了攻击，并伸出手触摸你的身体。有些已经开始自慰了，就好像这是世界上唯一的事情，你知道现在，如果你愿意，你可以让它们每一个都操你。");
            outputText("你要强暴它们吗？");
            _loc2_ = get_game().output;
            _g = get_game().combat;
            _loc2_.doYesNo(rapeDemons,function():void
            {
               _g.cleanupAfterCombat();
            });
         }
      }
   }
}

