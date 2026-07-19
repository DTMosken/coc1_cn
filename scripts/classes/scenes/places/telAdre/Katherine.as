package classes.scenes.places.telAdre
{
   import classes.Appearance;
   import classes.BreastStore;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Katherine extends TelAdreAbstractContent implements TimeAwareInterface
   {
      
      public static var KBIT_CLOTHES_TATTERED:int = 0;
      
      public static var KBIT_CLOTHES_UNIFORM:int = 1;
      
      public static var KBIT_CLOTHES_C_CLOTH:int = 2;
      
      public static var KBIT_CLOTHES_BODYSUIT:int = 4;
      
      public static var KBIT_CLOTHES_B_DRESS:int = 8;
      
      public static var KBIT_CLOTHES_SS_ROBE:int = 16;
      
      public static var KBIT_CLOTHES_TUBETOP:int = 32;
      
      public static var KBIT_CLOTHES_NURSECL:int = 64;
      
      public static var KBIT_TRIED_RECEIVE_ANAL:int = 1;
      
      public static var KBIT_TRIED_RECEIVE_SUCK_N_FUCK:int = 2;
      
      public static var KBIT_TRIED_RECEIVE_ORAL:int = 4;
      
      public static var KBIT_TRIED_GIVE_VAGINAL:int = 8;
      
      public static var KBIT_TRIED_GIVE_ANAL:int = 16;
      
      public static var KBIT_TRIED_GIVE_DOUBLE_PEN:int = 32;
      
      public static var KBIT_TRIED_GIVE_SUCK_N_FUCK:int = 64;
      
      public static var KBIT_TRIED_DOUBLE_HELIX:int = 128;
      
      public static var KBIT_TRIED_BATH:int = 256;
      
      public static var KBIT_TRIED_BEDROOM_BONDAGE:int = 512;
      
      public static var KBIT_TRIED_DRUNK_BAR_FUCK:int = 1024;
      
      public static var KBIT_MILK_TOLD_PLAYER_SHES_DRY:int = 1;
      
      public static var KBIT_MILK_SHARE_WITH_FRIENDS:int = 2;
      
      public static var KBIT_MILK_SHARE_WITH_OLD_GANG:int = 4;
      
      public static var KBIT_MILK_SHARE_WITH_HELENA:int = 8;
      
      public static var KBIT_MILK_SHARE_WITH_URTA:int = 16;
      
      public static var KBIT_MILK_SHARE_WITH_VALA:int = 32;
      
      public static var KBIT_SUB_HIGH_CUM:int = 1;
      
      public static var KBIT_SUB_BED_BOND:int = 2;
      
      public static var KBIT_SUB_ORGASM_DENIAL:int = 4;
      
      public static var KBIT_SUB_CALL_MASTER:int = 8;
      
      public static var KBIT_SUB_GROW_KNOT:int = 16;
      
      public static var KBIT_SUB_CAT_DICK:int = 32;
      
      public static var KBIT_SUB_GROW_BIG_BOOBS:int = 64;
      
      public static var KBIT_SUB_GROW_BIG_DICK:int = 128;
      
      public static var KBIT_SUB_CAT_GIRL:int = 256;
      
      public static var KBIT_SUB_HIGH_LACTATION:int = 512;
      
      public static var KBIT_SUB_REM_BALLS:int = 1024;
      
      public static var KBIT_SUB_GROW_BIG_BALLS:int = 2048;
      
      public static var KBIT_SUB_PUBLIC_EXHIBITION:int = 4096;
      
      public static var KBIT_SUB_REM_COCK:int = 8192;
      
      public static var KBIT_SUB_START_LACTATION:int = 16384;
      
      public static var KLOC_STREETS:int = 0;
      
      public static var KLOC_KATHS_APT:int = 1;
      
      public static var KLOC_URTAS_APT:int = 2;
      
      public static var KLOC_URTAS_HOME:int = 3;
      
      public static var KLOC_BAR:int = 4;
      
      public static var KLOC_BAR_DRUNK:int = 5;
      
      public static var KLOC_BAR_URTA_REFUSED:int = 6;
      
      public static var KLOC_LAKE:int = 7;
      
      public static var KLOC_DESERT:int = 8;
      
      public static var KDATE_LITTLE:int = 0;
      
      public static var KDATE_WHENEVER:int = 1;
      
      public static var KDATE_LOTS:int = 2;
      
      public static var KBIT_LOVER_AMILY:int = 1;
      
      public static var KBIT_LOVER_COTTON:int = 2;
      
      public static var KBIT_LOVER_EDRYN:int = 4;
      
      public static var KBIT_LOVER_HELIA:int = 8;
      
      public static var KBIT_LOVER_URTA:int = 16;
      
      public static var KBIT_LOVER_VALA:int = 32;
      
      public var _breasts:BreastStore;
      
      public function Katherine()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         _breasts = new BreastStore(1217);
         CoC.saveAwareClassAdd(_breasts);
         CoC.timeAwareClassAdd(this);
      }
      
      public function visitKatherine() : void
      {
         clearOutput();
         katherineSprite();
         get_images().showImage("katherine-visit-alley");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 1)
         {
            if(get_telAdre().katherineEmployment.initiateTraining())
            {
               return;
            }
         }
         outputText("奥斯瓦尔德当铺后面的小巷很不起眼，只是相当干净。一些空板条箱、旧毯子和破布条被组装成一个临时的[say: 窝，]那种无家可归的流浪汉会用来休息的地方。[pg]");
         katherineVisitNormal();
      }
      
      public function visitAtHome() : void
      {
         var urtaIsDrunk:Boolean;
         var _g:KatherineThreesome;
         clearOutput();
         if(isAt(1))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 31)
            {
               katherineSprite();
               outputText("当你打开凯丝住处的门时，你看到凯丝和乌尔塔都坐在床上。她们一看到你，凯丝就勾了勾手指，挪了挪身子，在她和乌尔塔之间留出了一个空位。[pg]");
               outputText("你一坐下，乌尔塔就笑着说，[say: 所以你的大计划成功了。你让我们做爱了，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 2 ? "见鬼，你还鼓励我们一有机会就做爱！所以" : "所以") + "我们变得亲密也就不足为奇了。][pg]");
               outputText("[say: 非常亲密，]凯丝说着，把她的臀部贴在你的臀部上摩擦。[pg]");
               outputText("[say: 总之，]乌尔塔继续说道，[say: 我们俩依然爱你，毕竟我们是因为你才相遇的。但现在我们也爱上了彼此。我想你肯定早就料到了，所以别装出一副惊讶的样子。][pg]");
               outputText("[say: 你想怎么庆祝？]凯丝问道。你可以看到她们两边都有着相配的" + (hasCock() ? "隆起" : "笑容") + "。她们都用手臂搂住你，故意把乳房贴在你身上。不过嘿，你有什么好抱怨的呢？三人行听起来是个非常不错的主意。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1232,32);
               menu();
               if(get_player().hasCock())
               {
                  addNextButton("369",get_telAdre().katherineThreesome.threeSixtyNine);
               }
               if(hasCock())
               {
                  addNextButton("被前后夹击",get_telAdre().katherineThreesome.roastYou);
               }
               else
               {
                  _g = get_telAdre().katherineThreesome;
                  urtaIsDrunk = false;
                  addNextButton("观看",function():void
                  {
                     _g.watch(urtaIsDrunk);
                  });
               }
               if(get_player().hasCock() || get_player().hasVagina())
               {
                  addNextButton("前后夹击凯丝",get_telAdre().katherineThreesome.spitroastKath);
               }
            }
            else
            {
               katherineSprite();
               outputText("看来凯丝听到了你过来的动静。你发现她在卧室里等着，脸上挂着性感的微笑，暗示着她什么都愿意做。");
               clothes();
               outputText("[pg]她站在床边，等着你" + (playerMaster() ? "告诉她该怎么做。" : "采取主动。"));
               katherineMenu();
            }
         }
         else if(get_game().time.hours < 10)
         {
            outputText("凯丝的公寓空无一人。这不应该让你感到惊讶，在早上的这个时候，她肯定在市场上巡逻。[pg]");
            katherineApartmentEmptyLeave();
         }
         else if(isAt(2) || isAt(3))
         {
            outputText("公寓里空无一人。这很不寻常，但也许凯丝在乌尔塔家过夜了——你总可以去那里找找她。");
            menu();
            addButton(0,"去乌尔塔家",katherineAtUrtas);
            addButton(1,"离开",katherineApartmentEmptyLeave);
         }
         else
         {
            outputText("看来凯丝出去了。她可能还在湿身婊酒馆。");
            doNext(get_telAdre().telAdreMenu);
         }
      }
      
      public function useRreductoOnKatsBreasts() : void
      {
         clearOutput();
         outputText("你上了床，躺在凯丝旁边，把罐子放在她的肚子上。当你把冰凉的药膏涂在手上时，凯丝闭上眼睛，开始发出呼噜声。当你把药膏揉进她" + get_breasts().adj() + "的" + get_breasts().cup() + "乳房时，似乎没有任何变化。直到罐子快用完时，它们才开始变硬并收缩。");
         if(get_breasts().lactating())
         {
            outputText("凯丝的尾巴变得僵硬并蓬松起来，因为她的乳房缩小了，你很快就明白了原因。");
            if(get_breasts().milkIsOverflowing())
            {
               outputText("乳汁从她刚刚缩小的胸部喷涌而出，长长的水柱几乎触及天花板。整张床都湿透了，你不得不感叹，有多少人能说自己被女朋友的乳汁淋过呢。她似乎僵在原地，直到喷射结束，才松开紧握的双拳，深深地叹了口气。");
            }
            else if(get_breasts().milkIsFull())
            {
               outputText("乳汁从她刚刚缩小的胸部喷射出来，淅淅沥沥地洒在凯丝和床上。她咬紧牙关，直到喷射结束，才松开紧握的双拳，深深地叹了口气。");
            }
            else
            {
               outputText("乳汁从她刚刚缩小的胸部滴落，在她的胸前留下一道道痕迹。");
            }
         }
         var _loc1_:BreastStore = get_breasts();
         _loc1_.set_cupSize(_loc1_.get_cupSize() - 1);
         outputText("[pg]凯丝坐起身，开始把玩她那变得更小更轻的胸部。[pg]");
         if(get_breasts().get_cupSize() == 1)
         {
            outputText("[say: 这么小，别人可能会以为我是个男孩子。看来我只能表现得更女孩子气一点来弥补了，对吧？]");
         }
         else if(get_breasts().get_cupSize() == 2)
         {
            outputText("[say: 终于回到我原本的尺寸了。真好，我好怀念它们这么大时的平衡感。太感谢你了，" + playerText() + "。]");
         }
         else if(get_breasts().get_cupSize() == 6)
         {
            outputText("[say: 噢，这样好多了。它们轻了好多。感觉不再像是在胸前绑了两个大西瓜了。]");
         }
         else if(get_breasts().get_cupSize() > 6)
         {
            outputText("[say: 噢，感谢玛莱。也谢谢你，" + playerText() + "。我能感觉到我下背部的一些肌肉开始放松了。]");
         }
         else
         {
            outputText("[say: 是的，我想我会很快习惯这对小一点的小白兔的。]");
         }
         outputText("[pg]她躺在床上，双腿大张，她的" + (hasCock() ? "肉棒" + cockMultiple("","s") + "直指天花板" : "入口滴着淫液") + "。[say: 既然你摸了我的胸，把我弄得这么兴奋，我希望你没打算马上就走。]");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().REDUCTO);
         katSexMenu();
      }
      
      public function useReductoOnKatsKock() : void
      {
         clearOutput();
         outputText("你做了一个手势，示意她暴露自己。她顺从地开始抚摸自己的包皮，露出里面的东西，起初还有些害羞，但随着勃起的加剧，她的动作越来越用力。很快，她就闭着眼睛，头向后仰，快乐地自慰起来，几乎忘记了自己一开始在做什么。你");
         if(get_player().lib > 50)
         {
            outputText("让她继续，直到" + (hasBalls() ? "她的阴囊紧绷，" : "") + "看起来只要再碰一下她就会射出来，然后");
         }
         outputText("大声清了清嗓子，让她重新集中注意力。她" + catGirl("脸红得像个熟透的苹果","在黑貂皮毛下泛起红晕") + "，内疚地把手从她那颤抖的肉棒" + cockMultiple("","们") + "上移开。[pg]");
         outputText("你俏皮地挑了挑眉，单膝跪在她那根硬邦邦的肉棒" + cockMultiple("","们") + "前，打开了药膏的盖子。你像是在戏弄她一样，蘸了一点药膏，然后以极慢的速度将药膏靠近她的肉棒" + cockMultiple("","们") + "，同时评论说这药膏比沙漠的空气还要冷。她听到这话颤抖了一下，让她的" + cockMultiple("肉棒","双根肉棒") + "上下晃动");
         if(get_player().lib > 50)
         {
            outputText("，然后又颤抖了一下，因为这个动作让她离高潮又近了一步");
         }
         outputText("。[pg]");
         outputText("你小心翼翼地抬起空闲的手，将她的" + cockType("小狗鸡巴","小猫肉棒") + cockMultiple("","们") + "向她的脸和胸部倾斜；当你触摸到敏感的底部" + cockMultiple("","们") + "时，她颤抖了一下。当你保持她在这个姿势时，");
         if(get_player().lib > 50)
         {
            outputText("带着淫荡的笑容盯着凯丝，看着她颤抖并试图保持控制，");
         }
         outputText("你抬起那只手，开始快速上下摩擦，将药膏涂抹在阴茎" + cockMultiple("","s") + "上。");
         if(get_player().lib > 50)
         {
            outputText("没过多久，凯瑟琳发出一声夹杂着抗议与顺从的沙哑呻吟，开始释放她滚烫的体液；第一股喷射物" + (isAt(0) ? "弄脏了她的衬衫" : "覆盖了她的胸膛") + "，而随后更猛烈的喷射则一路溅到了她的脖子上，甚至飞溅到她的下巴上。");
         }
         outputText("凯瑟琳颤抖着，");
         if(get_player().lib > 50)
         {
            outputText("她的高潮还在继续，");
         }
         outputText("与此同时，你涂抹了大量的药膏，将其涂满那根抽搐的阴茎" + cockMultiple("","s") + "的每一寸，并与她因过度自慰而分泌的大量前列腺液混合在一起。突然，你的猫科同伴发出一声喘息，打断了她低沉的呻吟，因为药效开始发作了。她的肉棒" + cockMultiple("痉挛并缩小，","痉挛并缩小，"));
         if(get_player().lib > 50)
         {
            outputText("仍然在将高潮的余韵喷射到她的肚子上，");
         }
         outputText("最终比之前缩短了两英寸。[pg]");
         outputText("[say:天哪，那真是……呃，]凯瑟琳呻吟着，擦拭着她的" + catGirl("皮肤","皮毛") + "。[say:我还是那么硬，那么饥渴……感觉我现在永远也软不下来了。你能不能……帮帮我？]她满怀希望地转向你");
         if(get_player().lib > 50)
         {
            outputText("，虽然有些疲惫，");
         }
         outputText("看着你。[pg]");
         set_cockLength(get_cockLength() - 2);
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4 ? 6 : 8;
         if(get_cockLength() < _loc1_)
         {
            set_cockLength(_loc1_);
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().REDUCTO);
         katSexMenu();
      }
      
      public function useReductoOnKat() : void
      {
         var _g1:Katherine;
         var _g:Katherine;
         clearOutput();
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4 ? 6 : 8;
         if(get_cockLength() <= _loc1_ && get_ballSize() <= 1 && get_knotSize() <= 2 && get_breasts().get_cupSize() == 1)
         {
            outputText("她看了看罐子，明显思考了一下，但还是摇了摇头。[saystart]对不起，" + playerText() + "，但我觉得那东西不可能让我剩下的任何部位再缩小了……...");
            if(playerMaster())
            {
               outputText("[sayend][pg]你叹了口气，把罐子收了起来。");
            }
            else
            {
               outputText("或者说，我不想变得比现在更小了，谢谢你。[sayend][pg]你理解地点点头，把罐子收了起来。");
            }
            outputText("她看起来有些歉意。[say:你也许想做点别的？]她问道。");
            _g = this;
            doNext(function():void
            {
               _g.giveKatherineAnItem();
            });
         }
         else
         {
            outputText("你拿出那小罐药膏递给她。她的脸庞因高兴而亮了起来。[say:缩形膏？！给我的？这可太贵了！]看到你点头，她开心地叫了一声，一把抢过药膏，" + clothesLowerChoice("猛地拉下短裤","撩起裙子拉下内裤","解开紧身衣的褶皱","撩起裙子拉下内裤","解开长袍拉下内裤") + "，露出她的包皮。突然，她猛地停住动作，抬头看着你，眼中闪烁着危险的光芒。[say:你想不想……帮我涂上？]她轻声问道。你点点头");
            if(get_player().lib > 50)
            {
               outputText("，脸上带着淫荡的笑容");
            }
            outputText("，她开心地一屁股坐在");
            if(isAt(0))
            {
               outputText("附近的一个板条箱上，手里拿着那罐珍贵的药膏，等着你开始。[pg]");
            }
            else
            {
               outputText("她的床上，跳着诱人的小舞脱掉剩下的衣服。然后她把那罐珍贵的药膏递给你，等着你开始。[pg]");
            }
            outputText("你跪在她面前，看着她的" + (isAt(0) ? "包皮" : "裸体"));
            if(get_player().lib > 50)
            {
               outputText("，盘算着到底要怎么对付它。");
            }
            else
            {
               outputText("，想着该如何开始。");
            }
            menu();
            if(get_knotSize() > 2)
            {
               addButton(0,"肉结",useRedoctoOnKatsKnot);
            }
            else
            {
               addButtonDisabled(0,"肉结");
            }
            if(get_cockLength() > _loc1_)
            {
               addButton(1,"长度",useReductoOnKatsKock);
            }
            else
            {
               addButtonDisabled(1,"长度");
            }
            if(get_ballSize() > 1)
            {
               addButton(2,"蛋蛋",reductoBallSize);
            }
            else
            {
               addButtonDisabled(2,"蛋蛋");
            }
            if(get_breasts().get_cupSize() > 1)
            {
               addButton(3,"乳房",useRreductoOnKatsBreasts);
            }
            else
            {
               addButtonDisabled(3,"乳房");
            }
            _g1 = this;
            addButton(14,"返回",function():void
            {
               _g1.giveKatherineAnItem();
            });
         }
      }
      
      public function useReductoAndPinkEgg() : void
      {
         clearOutput();
         outputText("你向凯瑟琳展示了粉红色的蛋和那罐缩体膏。[say: 那是干什么用的？]她问道。你告诉她，你见过没有蛋蛋的扶她。你很确定，这颗蛋和药膏一起用，能让她也变成那样。[pg]");
         if(!doneSubmissive(1024))
         {
            outputText("凯丝伸手摸了摸自己的蛋蛋。然后她摇了摇头，对你说：[say: 也许在罪犯想踢我蛋蛋的时候这会有用，但我不知道这值不值得。][pg]");
         }
         if(submissiveness() < 3)
         {
            outputText("她确实犹豫了一秒钟……如果你能说服凯丝做一些她不确定的其他事情，她也许会愿意足够信任你，从而失去她的蛋蛋。");
            katherineMenu();
         }
         else
         {
            outputText("你放下药膏和蛋，给了凯瑟琳一个拥抱。当你抚摸她的尾巴并按摩她的背部时，凯丝变得越来越兴奋。当你感觉到她勃起的肉棒紧紧压在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴侧面" : "你的大腿上") + "时，你松开了手。[pg]");
            outputText("凯丝脱下衣服跳上床，眼中满是情欲。你爬到她双腿之间，将她的双膝压在床上。稍微关照一下她的肉棒" + cockMultiple("","") + "，她就像只大猫一样发出呼噜声。[pg]");
            outputText("你拿起那罐缩体膏，放在凯丝的肚子上。她睁开眼睛，看着你拧开盖子。你告诉她，你<b>知道</b>如果她的小穴前面没有挂着阴囊，她看起来会更有吸引力。[pg]");
            if(!doneSubmissive(1024))
            {
               outputText("她试图回应，但你把手指放在她的嘴唇上，让她相信你。凯丝看起来有些担忧，但最终还是点了点头，把头靠回枕头上。");
               if(get_player().cor < 25)
               {
                  outputText("知道你的爱人愿意信任你，即使是在这种事情上，你心里也感到一阵温暖");
               }
               else if(get_player().cor < 75)
               {
                  outputText("你很高兴这招奏效了。现在你只能希望药膏和蛋能如预期般发挥作用");
               }
               else
               {
                  outputText("知道凯丝愿意把自己交给你，" + get_player().genderText("让你下体勃起","让你下体湿润","让你下体勃起并让你的小穴湿润","让你产生了难以抑制的情欲") + "。你期待着随着时间的推移，能进一步改造这个年轻荡妇的身体");
               }
            }
            outputText("。");
            outputText("[pg]你敲开蛋，慢慢地将里面的东西倒进罐子里。当液体接触到药膏时，它溶解了药膏，就像脂肪在热煎锅上融化一样。你得到了一罐浓稠、冒着泡的灰白色液体。你一手握住凯瑟琳的肉棒" + cockMultiple("","") + "，另一手将混合物滴在凯丝的阴囊上，她的皮肤很快就将其吸收了。[pg]");
            outputText("凯丝说道，[say: 哦——感觉好冷，] 她的身体在你身下扭动。你把空罐子扔到一边，等待结果。她阴囊的皮肤变得更加光滑，并开始收缩。你意识到你甚至已经看不出她的睾丸了。随着凯丝的呻吟，她的阴囊向内收缩，变得完全平坦。就好像她从来没有过蛋蛋一样。[pg]");
            outputText("凯丝在你身下扭动着，呻吟着，[say: 太多了——太满了！] 然后猛地向上挺起臀部。她的结" + cockMultiple("膨胀到最大，她的肉棒将精液喷射到天花板上。你试探性地抚摸着她的肉棒","膨胀到最大，她的肉棒将精液喷射到天花板上。你试探性地抚摸着她的肉棒") + "，换来的是又一次较小的喷射。[pg]");
            outputText("凯丝开始轻轻地摸索她的胯部，精液滴落在床上。[say: 感觉好奇怪，] 她说道，声音里透着疲惫。[say: 我还是觉得自己像个双性人，有点。只是感觉不一样了。] 她用手指划过她的小穴，抚摸着她正在变软的肉棒" + cockMultiple("","") + "，说道，[saystart]");
            if(!doneSubmissive(1024))
            {
               outputText("我真的不确定，但我想你是对的。");
            }
            outputText("下次你过来的时候，我想看看这到底是怎么回事。[sayend] 凯丝嘟囔了一些听不清的话，轻轻捏了捏你的手，然后蜷缩起来睡着了。[pg]");
            outputText("你悄悄地离开了，希望她能很快准备好进行一次试运行。");
            orgasm();
            set_ballSize(0);
            get_player().consumeItem(get_consumables().PINKEGG);
            get_player().consumeItem(get_consumables().REDUCTO);
            addSubmissive(1024);
            doNext(get_telAdre().telAdreMenu);
         }
      }
      
      public function useRedoctoOnKatsKnot() : void
      {
         clearOutput();
         outputText("你轻轻伸出手，开始上下抚摸她的包皮，感受着");
         if(get_cockNumber() > 1)
         {
            outputText("她每一根" + cockType() + "肉棒，并用一根手指摩擦暴露在外的龟头。猫娘扭动着身子，在你的照料下迅速勃起，直到" + get_cockLength() + "英寸长的肉棒完全暴露出来。她的肉结在每根肉棒的根部微微隆起，你接着开始抚摸它们。随着你的手指上下滑动，凯丝发出咕噜声和呻吟，敏感的肉体开始像红色的硬气球一样膨胀。它们越胀越大，膨胀到完全尺寸，直径达到" + get_knotSize() + "英寸。准备工作完成后，你停了下来，让凯丝徘徊在释放的边缘。[pg]");
         }
         else
         {
            outputText("她的" + cockType() + "肉棒，并用一根手指摩擦暴露在外的龟头。猫娘扭动着身子，在你的照料下迅速勃起，直到" + get_cockLength() + "英寸长的肉棒完全暴露出来。肉结在她的肉棒根部微微隆起，你接着开始抚摸它。随着你的手指上下滑动，凯丝发出咕噜声和呻吟，敏感的肉体开始像红色的硬气球一样膨胀。它越胀越大，膨胀到完全尺寸，直径达到" + get_knotSize() + "英寸。准备工作完成后，你停了下来，让凯丝徘徊在释放的边缘。[pg]");
         }
         outputText("然而，她太紧张了，什么也做不了，所以你不得不从她松弛的手指间拿走缩形膏，把这难闻的药膏涂抹在她的肉结上");
         if(get_cockNumber() > 1)
         {
            outputText("。她倒吸一口凉气，突然发出一声嚎叫，随着肉结的缩小，她的肉棒明显地痉挛起来……然后立刻开始喷射精液，你");
            if(get_player().lib > 50)
            {
               outputText("高兴地试图用嘴像接雨水一样接住它");
            }
            else
            {
               outputText("惊讶地勉强躲开");
            }
            outputText("，代价是掉落并洒出了剩下的药膏。坚硬的肉体缩小，直到每个肉结的宽度都减少了整整两英寸，此时药膏的效果消失，她的高潮也结束了……不过，考虑到她的肉结仍然肿胀，肉棒仍然勃起，你觉得她可能还能再来一次。[pg]");
         }
         else
         {
            outputText("。她倒吸一口凉气，突然发出一声嚎叫，随着肉结的缩小，她的肉棒明显地痉挛起来……然后立刻开始喷射精液，你");
            if(get_player().lib > 50)
            {
               outputText("高兴地试图用嘴像接雨水一样接住它");
            }
            else
            {
               outputText("惊讶地勉强躲开");
            }
            outputText("，代价是掉落并洒出了剩下的药膏。坚硬的肉体缩小，直到宽度减少了整整两英寸，此时药膏的效果消失，她的高潮也结束了……不过，考虑到她的肉结仍然肿胀，肉棒仍然勃起，你觉得她可能还能再来一次。[pg]");
         }
         outputText("她回以一个容光焕发、高潮过后的微笑。[say: 那真是……不可思议。非常感谢你的礼物……你还想做点别的吗？也许……找点乐子？]她问道，声音低沉而沙哑，充满了欲望。[pg]");
         set_knotSize(get_knotSize() - 2);
         if(get_knotSize() < 2)
         {
            set_knotSize(2);
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().REDUCTO);
         katSexMenu();
      }
      
      public function usePinkEggOnKath() : void
      {
         clearOutput();
         if(get_cockNumber() == 1)
         {
            outputText("你向凯瑟琳展示了粉红色的蛋，并告诉她吃了它会让她变成一个完全的女人。[pg]");
            if(submissiveness() < 6)
            {
               outputText("凯丝摇了摇头，说道：[say:我真的不想失去这个，" + playerText() + "。我希望你能理解，我的意思是，我生来就是扶她，这算是我的身体的一部分。][pg]");
               katherineMenu();
               return;
            }
            if(doneSubmissive(8192))
            {
               outputText("凯丝深情地抚摸着她的肉棒，但她还是毫无怨言地接过了蛋。她");
            }
            else
            {
               outputText("凯丝摇了摇头，说道：[say:我真的不想失去这个，" + playerText() + "。我希望你能理解，我的意思是，我生来就是扶她，这算是我的身体的一部分。][pg]");
               outputText("你揉了揉她的耳朵，告诉她你知道这是她从未失去过的东西——但它很容易再长出来。纯化的男魅魔药剂绝对是特尔阿德雷的商店里卖得最常见的药剂之一。此外，她终于能体会到作为一个女人，仅仅作为一个女人是什么感觉了。你问她，在成长的过程中，她有多少次想过那会是什么感觉？[pg]");
               outputText("凯丝没有立刻回答。她深情地抚摸着自己的肉棒，最后说道：[say:我想你是对的……而且我一直都很好奇。我只是觉得那会太贵了。][pg]");
               outputText("你把蛋递给她，告诉她今天解开一生谜团的代价根本不值一提。[pg]");
               outputText("凯丝给了你一个担忧的微笑，但还是接过了蛋，仔细端详。最后，她");
               addSubmissive(8192);
            }
            outputText("敲开蛋壳，一口吞了下去。你们俩都盯着她半勃起的肉棒，寻找变化的迹象。凯丝发出一声压抑的[say:喵呜！]她紧闭双眼，你微笑着看着她的肉棒缩回体内" + (hasBalls() ? "，同时把她的蛋蛋也拉了进去" : "") + "。一大股浪费的精液喷涌而出，浸透了地板，但凯丝完全沉浸在变形中，几乎没有注意到。几秒钟内，她的男性部分就消失得无影无踪，她的小穴微微向上移动，变得更加突出。凯瑟琳的双腿张开，她的缝隙诱人地闪烁着光芒。[pg]");
            outputText("当她恢复过来时，凯丝喘着气说：[say:好吧，我现在完全是个女人了，就像你希望的那样。现在求求你，求求你占有我！我现在感觉超级饥渴，好像有什么东西我必须发泄出来。]");
            set_cockLength(6);
            set_cockNumber(0);
            set_ballSize(0);
            set_knotSize(2);
         }
         else
         {
            outputText("你向凯瑟琳展示了粉红色的蛋，并告诉她这可以用来把她的肉棒减少到只有一根。[pg]");
            outputText("她接过蛋，想了一会儿才回答。[say:好吧，有两根肉棒总是感觉有点奇怪。有时候感觉也不错，但如果你觉得我只有一根看起来更好，那我就试试这个。][pg]");
            outputText("凯丝小心翼翼地敲开蛋壳，一口吞下里面的东西。她有时间擦了擦嘴，说道：[say:有点甜，]然后你听到她的肚子发出一声响亮的咕噜声。凯丝抓住她肉棒的结，它们都肿胀到了最大尺寸。这两个结似乎粘在一起，就像涂了口香糖或树脂一样。然后，在你的眼前，它们开始重新结合在一起。随着效果蔓延到她肉棒的长度，凯丝呻吟起来。不到一分钟，凯瑟琳就只剩下一根" + cockType("狗肉棒","猫肉棒") + "，而曾经有两根。[pg]");
            outputText("[say:哇——我以为那至少会有点疼。它只是痒得要命，现在感觉就像有人在抚摸我的肉棒。]凯瑟琳对你笑了笑，补充道：[say:我真的很需要帮忙把这东西重新控制住，" + playerText() + "。]");
            set_cockNumber(1);
         }
         if(get_player().hasItem(get_consumables().PINKEGG))
         {
            get_player().consumeItem(get_consumables().PINKEGG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_PNKEG);
         }
         katSexMenu();
      }
      
      public function useIncubiDraftOnKath() : void
      {
         var _loc1_:Boolean = false;
         clearOutput();
         if(!hasCock())
         {
            outputText("你向凯丝展示了那瓶男魅魔药剂，并告诉她它已经被纯化了。凯丝急切地接过它，检查着浑浊的液体。[pg]");
            outputText("[say:嗯——我等不及了。我甚至不知道我想先操哪个洞。非常感谢你，" + playerText() + "][pg]");
            outputText("她以创纪录的速度脱下衣服，一口气喝光了瓶子里的东西。她闭上眼睛，用手指描绘着她阴唇的轮廓，说道：[say:快了，我能感觉到它要来了。][pg]");
            outputText("她的臀部向上挺起，她缝隙上方的皮肤形成了一个凸起。她的小穴被向下推，随着凸起不断拉伸，腾出空间，很快就形成了一根看起来很邪恶的紫色恶魔肉棒。当凯丝喘着气恢复过来时，肉棒改变了形状。有一瞬间它看起来像人类的，然后它呈现出更熟悉的犬科动物轮廓，在凯瑟琳的腹股沟附近鼓起一个结。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            set_cockNumber(1);
            outputText("肉棒长约6英寸，没有变软的迹象。[say:又是狗肉棒？]她说，[say:天哪，我<b>真的</b>吃了太多那种辣椒了。]");
            if(!doneSubmissive(1024))
            {
               addSubmissive(1024);
               outputText("凯丝抚摸着她全新的勃起，然后她睁大眼睛说：[say:等一下——我的蛋蛋呢？][pg]");
               outputText("你忍不住笑了，提醒她许多扶她都没有外部睾丸。[pg]");
               outputText("她揉了揉肉棒下方、阴蒂上方的裸露皮肤，说道：[say: 这还需要点时间来适应。]");
            }
            outputText("[pg]凯丝将她的肉棒对准你，问道：[say: 你有时间帮我测试一下这根小鸡鸡吗？]");
         }
         else
         {
            _loc1_ = submissiveness() >= 4 || submissiveness() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0;
            outputText("你向凯丝展示了那瓶男魅魔药剂，并告诉她这已经被净化过了。一瓶应该足以让她的" + cockType("犬科肉棒","猫咪肉棒") + "增长一两英寸。[pg]");
            if(get_cockLength() < 16)
            {
               set_cockLength(get_cockLength() + 2);
               if(get_cockLength() > 16)
               {
                  set_cockLength(16);
               }
               outputText("凯丝接过药剂，急切地打量着浑浊的液体。[say: 好！拜托了！]她说道，显然很兴奋。她拔开瓶塞，小心翼翼地不让任何奇怪的液体洒出来，然后仰起头。[say: 嗯嗯，咸咸的！但我能接受，]她充满暗示地说道。她脱下裤子，让你们俩都有机会看着她的肉棒" + cockMultiple("","们") + "抽动和伸展。神奇的液体没过多久就发挥了作用，很快凯丝就自豪地用手指揉搓着她那根" + get_cockLength() + "英寸长的新肉棒" + cockMultiple("","们") + "。");
               outputText("她呻吟着，舔掉了指尖上的一些预先分泌的淫液。凯丝用低沉诱人的声音说道：[say: " + playerText() + "，我想我也沾染了一点男魅魔的胃口。我们能做点有趣的事吗，也许——哦，就现在？]");
            }
            else
            {
               if(!(get_cockLength() < 20 && _loc1_))
               {
                  if(_loc1_)
                  {
                     outputText("她看了看瓶子，然后低头看了看自己已经巨大的胯下。[say: 拜托，" + playerText() + "]她哭喊着，跪了下来。[say: 我不能再变大了。我知道你希望我有" + cockMultiple("一根巨大的肉棒","一对巨大的肉棒") + "，但我已经这么大了。我伸展身体时必须小心——否则我会向前摔倒在地上。如果我闻到胡须果或发情女人的味道，我就会感到头晕！我已经为了你长得和" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0 ? "乌尔塔" : "大多数半人马") + "一样大了，" + playerText() + "，求求你别让我再长了。][pg]");
                     outputText("她用双臂抱住你的腿，补充道：[say: 我知道我能满足你。让我展示给你看。]");
                     katSexMenu();
                     return;
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4)
                  {
                     outputText("她看着瓶子，闭上眼睛摇了摇头。[say: 抱歉……我真的很想要一" + cockMultiple("根","对") + "更大的，但我得现实点。我已经快一英尺半长了！我妈可没把我养成个尺寸控，而且我都快跟" + (get_urtaDisabled() ? "半人马" : "乌尔塔") + "一样长了。我的意思是，我喜欢" + (get_urtaDisabled() ? "半人马" : "乌尔塔") + "，我只是觉得我不需要那么大的肉棒，]她说道。[pg]");
                     outputText("[say: 很高兴知道你在为我着想，]她补充道，迅速试图讨好你。");
                     outputText("她确实犹豫了一下……如果你能说服凯丝做一些她不太确定的其他事情，她也许会愿意再喝下一瓶男魅魔药水。");
                     katherineMenu();
                     return;
                  }
                  outputText("她看着瓶子，闭上眼睛摇了摇头。[say: 抱歉……我真的很想要一" + cockMultiple("根","对") + "更大的，但我得现实点。我已经快一英尺半长了！我妈可没把我养成个尺寸控，而且如果我再长长一点，我就会像那个可怜的卫兵队长一样——因为找不到能容纳我肉棒的人而找不到对象，]她双手交叉在胸前，态度坚决地宣布。[pg]");
                  outputText("[say: 不过，如果你还有什么想给我的东西，我相信我们还能挽回局面。否则，谢谢你想到我，]她补充道，试图迅速与你和好。");
                  katherineMenu();
                  return;
               }
               outputText("她看着瓶子，在手里滚来滚去，但随后明显克制住了自己。[say: 对不起，" + playerText() + "……我必须现实一点，]她说道，[say: 对于像我这样的小猫咪来说，更大的肉棒只会带来麻烦。我可能会被自己绊倒。][pg]");
               outputText("你走上前，深深地吻了她，阻止了她的话语。你在她的胯部拍了拍" + clothesLowerChoice(" 隔着她紧身的短裤 ","，将她的裙子压在她隐藏的肉棒上"," 隔着她半透明的紧身衣","，将她的裙子压在她隐藏的肉棒上","，很快将手指滑入她的长袍，让你能感觉到她紧身内裤里正在膨胀的肿块") + "，说道：[say: 小猫咪想太多了。更大<b>就是</b>更好，至少在我爱人的肉棒" + cockMultiple("是","们是") + "这方面。]隔着衣服轻轻揉搓了几下，她的肉棒" + cockMultiple("变得","们变得") + "火热而僵硬。[pg]");
               outputText("[say: 太大了，]是她唯一的回答。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0)
               {
                  outputText("你问凯瑟琳，她觉得你爱乌尔塔吗。[pg]");
                  outputText("她深深地呻吟了一声，回答道：[say: 是的，当然。][pg]");
                  outputText("你继续摩擦，慢慢地把凯丝往后推，直到她靠在墙上。你告诉她，乌尔塔在守卫队里需要一个朋友，一个真正理解带着这么巨大的……负担是什么感觉的人。[pg]");
                  outputText("凯丝的尾巴在墙上甩动。她张开嘴想说些什么，你把瓶子举到她眼前。她僵住了，你提醒她这味道会有多好，当她的" + cockMultiple("鸡巴变得","鸡巴们变得") + "更大时，感觉会有多棒。[pg]");
               }
               else
               {
                  outputText("你告诉凯瑟琳，到目前为止你都是对的。肉棒每增加一英寸，她就变得更性感。你喜欢她试图把巨大的肉棒" + cockMultiple("","") + "藏起来时，脸上那种可爱又尴尬的表情。[pg]");
                  outputText("她在你的手指下扭动着，终于说道：[say: 我想我可以做到……我会为你做的。][pg]");
                  outputText("你继续揉搓着，慢慢地将凯丝向后推，直到她靠在墙上。你告诉她，你希望她为了<b>她自己</b>做这件事。你希望她看看" + cockMultiple("一根巨大的肉棒","一对巨大的肉棒") + "能带来多少乐趣。然后你把瓶子举到她眼前。[pg]");
               }
               set_cockLength(get_cockLength() + 2);
               if(get_cockLength() > 20)
               {
                  set_cockLength(20);
               }
               addSubmissive(128);
               outputText("她盯着那浓稠的白色液体，仿佛它对她施了魔法。她接过瓶子，拔开瓶塞，一饮而尽。她微笑着说：[say: 我爱你。][pg]");
               outputText("你笑着，迅速脱下她的衣服。当她的" + cockMultiple("肉棒进入","双根肉棒进入") + "视线时，凯丝喘着粗气，你看着" + cockMultiple("它","它们") + "变长。" + cockMultiple("它现在几乎水平地从","它们现在几乎水平地从") + "凯丝的胯部伸出，你抚摸着" + cockMultiple("她的肉棒","一根，然后另一根") + "，凯丝喘息着。你会说她现在有" + get_cockLength() + "英寸长" + cockMultiple("","……两根都是") + "。[pg]");
               outputText("凯丝微笑着，深深地看着你的眼睛，满脸写着饥渴。[say: 我本来不确定我是否想要这个，但感觉很好。你喜欢吗？]她问道，[say: 也许你可以向我展示一下你有多喜欢，嗯？白白浪费这个机会就太可惜了……][pg]");
            }
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().P_DRAFT);
         katSexMenu();
      }
      
      public function urtaPlusKathCuddle() : void
      {
         if(get_player().get_spe() > 75)
         {
            outputText("[pg]你蹑手蹑脚地走到床边，抚摸着凯丝的尾巴。她和乌尔塔都吓了一跳。乌尔塔一意识到你是谁，以及你刚才做了什么，就在你肩膀上狠狠地拍了一下。[saystart][name]！你是该死的鬼魂还是什么？哦，天哪，你刚才让凯丝");
            if(hasCock())
            {
               outputText("把她的结从我身体里拔出来了。[sayend][pg]");
            }
            else
            {
               outputText("把她的" + catGirl("指甲","爪子") + "掐进肉里了。[sayend][pg]");
            }
            outputText("凯丝一脸窘迫地说，[saystart]抱歉，抱歉，我还以为是");
            if(get_game().urtaPregs.urtaKids() == 1)
            {
               outputText(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "你儿子" : "你女儿");
            }
            else
            {
               outputText("你的某个孩子");
            }
            outputText("，[sayend]一边轻轻抚摸着乌尔塔的耳朵。[pg]");
            outputText("乌尔塔长叹了一口气，也回以抚摸，凯丝再次放松下来，发出持续低沉的呼噜声。");
            outputText("[pg]凯丝嘟囔着，");
         }
         else
         {
            outputText("[pg]你蹑手蹑脚地走到床边，抚摸着凯丝的尾巴。她和乌尔塔都咯咯笑了起来，乌尔塔拍了拍你的手，说道：[say: 嘿，宝贝，干得漂亮，但你可没你想象的那么安静。要加入我们吗？][pg]");
            outputText("凯丝" + (hasCock() ? "轻轻地把她的结从乌尔塔的小穴里拔出来" : "从乌尔塔的肉棒上滑下来") + "，翻身仰躺着，这样她就能看到你了。[say: 希望你别介意——我们一直在互相照顾。][pg]");
            outputText("好像你看不出来似的。不过，你还是在床沿坐下，给她们俩都挠了挠痒痒。[pg]");
            outputText("凯丝在你的抚摸下扭动着身子，说道，");
         }
         outputText("[say: 我现在感觉棒极了，" + playerText() + "，但如果你想做点什么，我奉陪到底。][pg]");
         outputText("乌尔塔笑着说：[say: 哦，是啊，然后把这烂摊子留给我，是吧？]她从床上舀起一点精液，在手指间揉搓着。[say: 我想我明天早上可以收拾一下，只要能让你好好享受一下小穴，[name]。]");
         menu();
         addButton(0,"回凯丝家",dateGotoKaths);
         addButton(1,"去湖边",dateKathBath);
         addButton(2,"回酒吧",dateGotoBar);
         addButton(14,"离开",get_telAdre().telAdreMenu);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         if(get_breasts().get_lactationLevel() <= get_breasts().preventLactationIncrease)
         {
            switch(get_game().time.hours)
            {
               case 8:
                  if(milkOption(2) || milkOption(4) && int(get_game().time.days % 2) == 0)
                  {
                     get_breasts().milked();
                  }
                  break;
               case 11:
                  if(milkOption(18) && int(get_game().time.days % 5) == 0)
                  {
                     get_breasts().milked();
                  }
                  break;
               case 14:
                  if(milkOption(2) && int(get_game().time.days % 4) == 0)
                  {
                     get_breasts().milked();
                  }
                  break;
               case 16:
                  if(milkOption(14) && int(get_game().time.days % 3) == 0)
                  {
                     get_breasts().milked();
                  }
                  break;
               case 17:
                  if(milkOption(34) && int(get_game().time.days % 5) == 2)
                  {
                     get_breasts().milked();
                  }
            }
         }
         get_breasts().advanceTime();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1218,FlagDict_Impl_.arrayReadInt(_loc1_,1218) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
            return false;
         }
         if(get_game().time.hours == 6)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 1)
            {
               if(int(get_game().time.days % 4) == 0)
               {
                  katherineAndUrtaHadSex(false);
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 2)
            {
               katherineAndUrtaHadSex(false);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1236) == 1)
            {
               if(int(get_game().time.days % 4) == 0)
               {
                  katherineAndValaHadSex();
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1236) == 2)
            {
               katherineAndValaHadSex();
            }
         }
         else if(get_game().time.hours == 10)
         {
            _loc2_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1221);
            if(_loc2_ < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,-_loc2_);
            }
            else if(_loc2_ > 0 && Utils.rand(3) != 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,_loc2_);
            }
            else
            {
               _loc3_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1220);
               _loc4_ = [];
               if(_loc2_ != 2)
               {
                  _loc4_.push(2);
               }
               if(_loc2_ != 4 && (_loc3_ & 4) > 0)
               {
                  _loc4_.push(4);
               }
               if(_loc2_ != 8 && (_loc3_ & 8) > 0)
               {
                  _loc4_.push(8);
               }
               if(_loc2_ != 16 && (_loc3_ & 0x10) > 0)
               {
                  _loc4_.push(16);
               }
               if(_loc2_ != 32 && (_loc3_ & 0x20) > 0)
               {
                  _loc4_.push(32);
               }
               if(_loc2_ != 64 && (_loc3_ & 0x40) > 0)
               {
                  _loc4_.push(64);
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,int(_loc4_[Utils.rand(int(_loc4_.length))]));
            }
         }
         if(get_game().time.hours >= 14)
         {
            switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1225))
            {
               default:
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,1);
                  break;
               case 2:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 31)
                  {
                     if(Utils.rand(4) != 0)
                     {
                        if(get_player().hasKeyItem("Spare Key to Urta\'s House"))
                        {
                           FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,3);
                        }
                     }
                  }
                  else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) >= 11 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) != 0)
                  {
                     if(Utils.rand(3) != 0)
                     {
                        if(get_player().hasKeyItem("Spare Key to Urta\'s House"))
                        {
                           FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,3);
                        }
                     }
                  }
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,1);
                  break;
               case 1:
               case 3:
            }
         }
         else if(get_game().time.hours >= 10)
         {
            switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1225))
            {
               default:
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,4);
                  break;
               case 1:
               case 4:
            }
         }
         return false;
      }
      
      public function tightTopDescption() : void
      {
         switch(get_breasts().get_cupSize())
         {
            case 0:
            case 1:
            case 2:
               outputText("紧得足以凸显她那小巧的乳房");
               break;
            case 3:
            case 4:
            case 5:
               outputText("勉强能包裹住她丰满的乳房");
               break;
            default:
               outputText("她丰满的乳肉几乎要溢出来");
         }
      }
      
      public function threatenCatSluts() : void
      {
         clearOutput();
         outputText("你双臂交叉，告诉伊芙琳她的小埋伏不会再奏效第二次了。她们要么现在就滚蛋，去别的巷子设伏，要么就来试试能不能干掉你。");
         outputText("[pg]有些猫兽人看起来像是在打量你，但伊芙琳迅速开口稳住他们。[say: 这家伙是个硬茬，不值得我们冒险。带上东西，我们换个地方。天涯何处无芳草。]");
         outputText("[pg]在她说话的时候，你看到凯丝对你眨了眨眼。你等猫兽人帮派散去后，才走到街上。没过多久，你就听到身后传来脚步声。凯瑟琳独自一人站在那里。[say: 嗨，] 她说。[say: 我，嗯，在想还能不能再见到你。]");
         if(get_player().cor < 25)
         {
            outputText("这个可怜的女孩极度渴望一个朋友。你希望自己能做一个好人，帮她一把。");
         }
         else if(get_player().cor < 75)
         {
            outputText("凯瑟琳如此孤独，真是太可怜了。她本不该轻易相信像你这样几乎是陌生人的人，但她还是来了，而你也在这里。");
         }
         else
         {
            outputText("你迫不及待地想把这个顺从的小东西玩弄于股掌之间。她几乎孤立无援，这意味着几乎没有人会告诉她你会对她产生多么糟糕的影响。只要前期稍微下点功夫，你就能得到一个非常顺从的小性玩具。");
         }
         outputText("你对她笑了笑，牵起她的手，问她是否想尝尝街边那家餐厅的菜。那里看起来是个约会的好地方。");
         outputText("[pg]她" + (get_noFur() ? "羞得满脸通红" : "肯定脸红了，因为你能透过她的皮毛感觉到那份温暖") + "。她试图说话，但好一会儿都没发出声音。最后她终于说道：[say: 你真的想带<b>我</b>去约会吗？]");
         outputText("[pg]你反问带一个漂亮女孩出去约会难道犯法吗。你第二次走进那个埋伏圈可不是为了你自己。你这么做是因为你想见她。凯瑟琳的眼睛亮了起来，她紧紧地抱住你，仿佛想确认这一切都是真的。");
         doNext(secondTalkWithKatherine);
      }
      
      public function talkWetBitch() : void
      {
         clearOutput();
         outputText("你问凯瑟琳为什么下班后会在湿身婊酒馆闲逛。[pg]");
         outputText("她微笑着回答说，他们做的薯条很好吃。然后她更严肃地说：[say: 特尔阿德雷还有几家酒吧，但既然" + (get_urtaDisabled() ? "拉尼斯 " : "乌尔塔 ") + (isAt(1) ? "去那里，它" : "来这里，这") + "就算是守卫队的非官方酒吧了。对普通人来说，这意味着在这里挑起事端或抢劫醉汉是个坏主意，但对守卫队军官来说，这意味着" + (isAt(1) ? "它" : "这") + "是个打听八卦、听故事或下班后闲逛的好地方。][pg]");
         outputText((isAt(1) ? "她向你挪近了一点，说道" : "她喝了一口杯子里的酒，补充道") + "，[say: 我刚加入的时候，以为下班后就会回家睡觉，但有时候，和做同样工作的人聊聊天会有帮助。而且，事实证明在特尔阿德雷的家里很难弄到酒。城里非常担心恶魔酒，所以只有少数商人能合法出售这东西，而且他们的要价几乎和酒吧一样高。]");
         talkToKatherine(talkWetBitch);
      }
      
      public function talkWatch() : void
      {
         clearOutput();
         outputText("你问凯丝她在守卫队过得怎么样。[pg]");
         outputText("她似乎想了想，然后说道：[say: 适应早班有点困难，不过我加入之前的作息时间本来就乱七八糟的。穿着制服走来走去感觉真的很奇怪，看着外面那些眼睛努力装作没在看我的样子。这有点像被人打量，只不过他们是在担心我可能会看到什么，或者我打算做什么。][pg]");
         outputText("她把双手放在脑后伸了个懒腰，让你大饱眼福。[say: 在你帮我加入守卫队之前，我一直以为大多数警官都是喜欢欺负人的恶棍。现在我有机会近距离接触他们，发现完全不是那么回事。害群之马总是有的，但他们的队友会管束他们。][pg]");
         outputText("[say: 噢，还有些人干的那些事！有个半人马被扔了一个放了一星期的夜壶。那个罪犯在帮派里地位很高，他们抓住了他——字面意义上的脱裤子被抓。他当时正在拜访一个他认识的扶她。因为他知道自己跑不掉了，所以就试图激怒那里块头最大的家伙。他就是想挨揍。][pg]");
         outputText("[say: 我进守卫队之前从来没听说过这种事，但如果我们把人打得太惨，影响会很不好。帮派头目会借题发挥，让更多的人为了寻求保护而加入帮派，而且罪犯的老板会确保他在监狱里受到更好的待遇，并迅速交清罚款，好让他早点获释。他们这样做，让手下挨揍变得有利可图。这有多操蛋？][pg]");
         outputText("还没等你回答，凯丝就接着说道：[say: 我本来以为其他警官会给我找更多麻烦。我可能是守卫队里唯一的猫科动物了。大多数警官都是狗和狐狸形态，还有一些蜥蜴、马和半人马，我还见过一个身材非常健壮的兔子形态；但就是没有猫。所以我有点惊讶。只是偶尔会有几句闲言碎语，并没有什么真正恶毒的话。我想大家都希望我是第一个，但不是最后一个。我们真的很需要更多的新兵。我在外面巡逻就意味着其他人不需要加班。][pg]");
         outputText("凯瑟琳依偎着你说道：[say: 我想我开始安顿下来了。我年轻的时候真的很傻；我父母想让我加入的时候，我本该听他们的话的。谢天谢地，我最终还是听了你的。再次感谢你帮我。][pg]");
         if(isAt(1))
         {
            outputText("她紧紧贴着");
         }
         else if(get_player().isTaur())
         {
            outputText("她站起身，绕着桌子慢慢走过来，双臂环绕着你的腰，摩擦着你背部曲线最明显的地方。她紧紧贴着");
         }
         else
         {
            outputText("她站起身，绕着桌子慢慢走过来，坐在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴上" : "你的膝盖上") + "。她双臂环绕着你的脖子，紧紧贴着");
         }
         outputText("她的身体靠着你，问道：[say: 你想让我向你展示我有多感激你吗？]");
         katSexMenu();
      }
      
      public function talkToKatherine(param1:Object = undefined) : void
      {
         var from:Object = param1;
         var _gthis:Katherine = this;
         var _loc2_:Function = function(param1:int, param2:String = undefined, param3:Function = undefined):void
         {
            if(param2 == null)
            {
               param2 = "";
            }
            if(from != param3)
            {
               _gthis.addButton(param1,param2,param3);
            }
            else
            {
               _gthis.addButtonDisabled(param1,param2);
            }
         };
         if(from == null)
         {
            clearOutput();
            outputText("你告诉凯丝你想和她聊聊。");
         }
         if(isAt(0))
         {
            if(from == null)
            {
               outputText("这位粉发黑猫看起来有些害羞，但又很兴奋。[say:好吧……你想聊些什么？]她问道，紧张地看着自己的脚。");
            }
            menu();
            _loc2_(0,"种族矛盾",katherineRacialTension);
            _loc2_(1,"她的过去",katherinesHistory);
            _loc2_(2,"帮派",askKatherineAboutGang);
            _loc2_(3,"狗屌",askKatherineAboutDogCock);
            _loc2_(4,"流浪",askKatherineAboutVagrancy);
            _loc2_(5,"爱与欲",askKatherineAboutLoveAndLust);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) == 1)
            {
               addButton(6,"工作",get_telAdre().katherineEmployment.employmentTalk);
            }
            else
            {
               addButtonDisabled(6,"工作");
            }
            addButton(14,"返回",katherineMenu);
            return;
         }
         if(from == null)
         {
            outputText((isAt(1) ? "她坐在床沿上" : "她靠在椅背上") + "说道：[say:我很乐意聊天。你在想什么？]");
         }
         menu();
         _loc2_(0,"帮派",talkGangs);
         _loc2_(1,"守卫队",talkWatch);
         _loc2_(2,"她的家",talkHome);
         _loc2_(3,"酒吧",talkWetBitch);
         if(doneSubmissive(256))
         {
            _loc2_(4,"猫娘",talkCatGirl);
         }
         else
         {
            addButtonDisabled(4,"猫娘");
         }
         if(isAt(1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1220) >= 4)
         {
            addButton(5,"衣服",talkClothes);
         }
         else
         {
            addButtonDisabled(5,"衣服");
         }
         if(playerLovers() > 0)
         {
            addButton(6,"恋人",talkLovers);
         }
         else
         {
            addButtonDisabled(6,"恋人");
         }
         if(submissiveness() >= 4)
         {
            addButton(7,"主人",talkMaster);
         }
         else
         {
            addButtonDisabled(7,"主人");
         }
         if(get_breasts().lactating())
         {
            addButton(8,"她的奶水",talkMilk);
         }
         else
         {
            addButtonDisabled(8,"她的奶水");
         }
         addButton(14,"返回",katherineMenu);
      }
      
      public function talkMilkShareWithVala() : void
      {
         clearOutput();
         if(milkOption(32))
         {
            outputText("你要求凯丝停止与瓦拉分享她的奶水。你想为自己留更多。[pg]");
            outputText("[say: 好的，我会照做的。只是请你在我身边，我现在更需要你的帮助了。]");
            milkOptionClear(32);
         }
         else
         {
            outputText("你告诉凯丝，如果她想找人帮忙排空乳房，酒吧里总有一个妖精可以帮她。[pg]");
            outputText("凯丝咧嘴一笑，说道，[say: 我不知道妖精是不是真的喜欢奶油，但如果瓦拉愿意，我会让她吸个痛快的。]");
            milkOptionSet(32);
         }
         talkMilkMenu();
      }
      
      public function talkMilkShareWithUrta() : void
      {
         clearOutput();
         if(milkOption(16))
         {
            outputText("你要求凯丝停止与乌尔塔分享她的奶水。你想为自己留更多。[pg]");
            outputText("[say: 好的，我会照做的。只是请你在我身边，我现在更需要你的帮助了。]");
            milkOptionClear(16);
         }
         else
         {
            outputText("你告诉凯丝，如果她想找人帮忙排空乳房，她随时可以请乌尔塔帮忙。[pg]");
            outputText("凯丝咧嘴一笑，说道，[say: 听起来是个好主意！]");
            milkOptionSet(16);
         }
         talkMilkMenu();
      }
      
      public function talkMilkShareWithOldGang() : void
      {
         clearOutput();
         if(milkOption(4))
         {
            outputText("你告诉凯丝是时候停止喂养她以前的街头帮派了。你想为自己留更多她的奶油。[pg]");
            outputText("她长长地叹了口气，说道，[say: 我知道这帮了他们，但我其实有点高兴。那些挤奶的过程——那可真是一场刺激的体验。有普通的吸吮，还有半打猫人排队等着吸你的乳头。]");
            milkOptionClear(4);
            talkMilkMenu();
         }
         else
         {
            outputText("你建议凯瑟琳应该分享财富。外面有一大帮人为了奶水而拦截旅行者。[pg]");
            outputText("[say: 你想让我去见流浪猫帮并喂养他们？你不怕我出什么事吗？][pg]");
            outputText("你指出，首先，她是一名训练有素的守卫。其次，当她在帮派里的时候，如果有人因为混蛋而赶走了一个愿意提供猫咪奶油的来源，会发生什么？哦，如果这还不够，那为什么不带一个守卫队的朋友一起去呢？[pg]");
            outputText("凯丝暗自点头，说道，[say: 好的，我想这确实是一种预防犯罪的方法。而且能见到一些以前的帮派成员也会很有趣。也许我能说服他们，并非所有的守卫都是混蛋。不过有一件事——如果我给他们想要的那么多奶油，我确信我的乳房会开始分泌越来越多。你想让我限制自己吗？不让我的乳房分泌出足够几十个婴儿喝的奶油？]");
            milkOptionSet(4);
            talkMilkLimitation();
         }
      }
      
      public function talkMilkShareWithHelenaAnswer(param1:Boolean) : void
      {
         if(param1)
         {
            outputText("[pg]凯丝看起来松了一口气。[say: 谢谢" + (playerMaster() ? "你，[master]" : get_player().get_short()) + "，你最好了。]");
            milkOptionClear(8);
         }
         else
         {
            outputText("[pg]凯丝点点头说，[say: 好的，我会停止的。我确实为海伦娜感到难过。]");
         }
         talkMilkMenu();
      }
      
      public function talkMilkShareWithHelena() : void
      {
         var reallyStop1:Boolean;
         var _g1:Katherine;
         var reallyStop:Boolean;
         var _g:Katherine;
         clearOutput();
         if(milkOption(8))
         {
            outputText("你问凯丝她能不能停止与海伦娜分享她那丰富的奶水。[pg]");
            outputText("[say: 我可以，但是……帮助她感觉真的很好。我必须停止吗？]");
            menu();
            _g = this;
            reallyStop = true;
            addButton(0,"是",function():void
            {
               _g.talkMilkShareWithHelenaAnswer(reallyStop);
            });
            _g1 = this;
            reallyStop1 = false;
            addButton(1,"不要停止",function():void
            {
               _g1.talkMilkShareWithHelenaAnswer(reallyStop1);
            });
         }
         else
         {
            outputText("你向凯丝建议，你能想到有人偶尔需要加餐。她以前街头帮派里那个瘦弱的女孩海伦娜怎么样？[pg]");
            outputText("凯丝想了想说，[say: 我想找到她应该不难。而且她绝对不会拒绝新鲜的猫奶。如果你不介意的话，我很乐意和海伦娜分享我的奶油。]");
            milkOptionSet(8);
            talkMilkMenu();
         }
      }
      
      public function talkMilkShareWithFriends() : void
      {
         clearOutput();
         if(milkOption(2))
         {
            outputText("你告诉凯丝是时候停止与她所有的朋友分享了。你想为自己留一点奶油。[pg]");
            outputText("[say: 好的，我马上停止。我比我想象的更享受这个过程，但这总是有点奇怪。如果你想让我重新开始分享，就告诉我。][pg]");
            outputText("那是你的错觉，还是她的声音里有一丝渴望？");
            milkOptionClear(2);
            talkMilkMenu();
         }
         else
         {
            outputText("你告诉凯丝，你认为她那甜美、甜美的奶水是女神赐予的可爱礼物。这种礼物她应该与所有的朋友分享。肯定有守卫和酒吧顾客渴望地看着她的胸部，外面还有一整个街头帮派，她也应该和他们分享。[pg]");
            outputText("凯丝把手放在胸前，问道，[say: 你想让我和所有的朋友分享？哇……这会有点奇怪。][pg]");
            outputText("你笑着告诉她，她会喜欢的，你就是知道她会。此外，把所有的奶油都憋着也没好处。如果她能定期把它排出来，对她会好得多。[pg]");
            outputText("凯丝看起来有点纠结，但最后她说道，[say: 是的，是的，" + playerText() + "，如果那是你想要的。问别人要不要我的奶水会很奇怪，我的意思是这不正常。][pg]");
            outputText("你说你知道她会掌握窍门的。只要向她确定想要的人提供；很快她就会收到其他朋友的请求，他们暗地里早就想尝尝了。[pg]");
            outputText("凯丝沉默了一会儿，思考着。你很确定她开始接受这个想法了；她的乳头已经明显变硬了。最后她问道，[say: 好的，但如果我让我的朋友们想喝多少就喝多少，我确信我的乳房会开始分泌越来越多。你想让我限制自己吗？不让我的乳房分泌出足够几十个婴儿喝的奶油？]");
            milkOptionSet(2);
            talkMilkLimitation();
         }
      }
      
      public function talkMilkMenu() : void
      {
         var _g:Katherine;
         var _loc4_:* = null as Array;
         outputText("[pg]你会说凯丝的乳房产出");
         switch(get_breasts().get_lactationLevel())
         {
            case 2:
               outputText("只有少量的奶油。");
               break;
            case 3:
               outputText("大约和哺乳期的猫人一样多的奶油。");
               break;
            case 4:
               outputText("大量的奶油，比大多数哺乳期妇女还要多。");
               break;
            case 5:
               outputText("巨量的奶油。只有在魔法的帮助下，她的乳房才会开始分泌这么多。");
               break;
            default:
               outputText("不自然数量的奶油。她的乳房被注入了太多的催乳剂，以至于她能超过一些牛人。");
         }
         if(get_breasts().milkIsOverflowing())
         {
            outputText("它们已经满到边缘了，凯丝一定非常渴望有人能帮她释放压力。");
         }
         else if(get_breasts().milkIsFull())
         {
            outputText("它们现在非常饱满，你确信如果帮她排空，凯丝会很享受的。");
         }
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 10;
         var _loc2_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 10;
         var _loc3_:Boolean = milkOption(2);
         if(_loc3_)
         {
            outputText("[pg]<b>按照你的指示，凯瑟琳慷慨地与她的朋友和熟人分享她的奶水。</b>");
         }
         else
         {
            _loc4_ = ["你"];
            if(milkOption(4))
            {
               _loc4_.push("她以前的帮派");
            }
            else if(milkOption(8))
            {
               _loc4_.push("海伦娜");
            }
            if(_loc1_ && milkOption(16))
            {
               _loc4_.push("乌尔塔");
            }
            if(_loc2_ && milkOption(32))
            {
               _loc4_.push("瓦拉");
            }
            outputText("[pg]<b>现在凯瑟琳只与" + Utils.formatStringArray(_loc4_) + "分享她的奶水。</b>");
         }
         menu();
         if(!_loc3_ && !milkOption(4))
         {
            addButton(0,"海伦娜",talkMilkShareWithHelena);
         }
         if(!_loc3_ && _loc1_)
         {
            addButton(1,"乌尔塔",talkMilkShareWithUrta);
         }
         if(!_loc3_ && _loc2_)
         {
            addButton(2,"瓦拉",talkMilkShareWithVala);
         }
         addButton(4,"限制",talkMilkLimitation);
         if(!_loc3_)
         {
            addButton(5,"旧帮派",talkMilkShareWithOldGang);
         }
         if(submissiveness() >= 2)
         {
            addButton(6,"朋友",talkMilkShareWithFriends);
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.talkToKatherine();
         });
      }
      
      public function talkMilkLimitationChange(param1:int) : void
      {
         clearOutput();
         if(param1 == 0 && !doneSubmissive(512))
         {
            get_breasts().preventLactationIncrease = 3;
         }
         else
         {
            get_breasts().preventLactationIncrease = param1;
         }
         switch(param1)
         {
            case 2:
               outputText("你告诉凯丝，从现在起，她要控制自己的乳房，不能分泌超过一点点的奶水。");
               break;
            case 3:
               outputText("你告诉凯丝，从现在起，她要控制自己的乳房，不能分泌超过中等数量的奶水。");
               break;
            case 4:
               outputText("你告诉凯丝，从现在起，她要控制自己的乳房，不能分泌超过大量的奶水。");
               break;
            case 5:
               outputText("你告诉凯丝，从现在起，她要控制自己的乳房，不能分泌超过巨量的奶水。");
               break;
            default:
               outputText("你告诉凯丝，从现在起，她不要控制自己的乳房。上不封顶。[pg]");
               outputText("凯丝摇摇头，微笑着说，[say: " + (playerMaster() ? "是的，[master]，我猜你喝不够？" : "喝不够？好吧，[name]，") + " 我就让它们想产多少就产多少。但如果我涨得受不了，试图强行喂你，可别怪我。][pg]");
               talkMilkMenu();
               return;
         }
         outputText("[pg]凯丝微笑着说，[saystart]" + (playerMaster() ? "是的，[master]" : "好吧，" + get_player().get_short()) + "，我会照做的。");
         if(get_breasts().get_lactationLevel() > get_breasts().preventLactationIncrease)
         {
            outputText("但因为我现在分泌的奶油比那多，所以我的乳房可能需要一段时间才能降到那个水平。");
         }
         outputText("[sayend]");
         talkMilkMenu();
      }
      
      public function talkMilkLimitation() : void
      {
         var newLimit4:int;
         var _g4:Katherine;
         var newLimit3:int;
         var _g3:Katherine;
         var newLimit2:int;
         var _g2:Katherine;
         var newLimit1:int;
         var _g1:Katherine;
         var newLimit:int;
         var _g:Katherine;
         var _loc1_:Boolean = doneSubmissive(512);
         outputText("[pg]<b>目前凯丝被告知");
         switch(get_breasts().preventLactationIncrease)
         {
            case 2:
               outputText("要控制她的乳房。她不允许超过轻度的");
               break;
            case 3:
               outputText("要控制她的乳房。她不允许超过中度的");
               break;
            case 4:
               outputText("要控制她的乳房。她不允许超过强度的");
               break;
            case 5:
               outputText("要控制她的乳房。她不允许超过重度的");
               break;
            default:
               outputText("不要控制她的乳房。对她的");
         }
         outputText("泌乳没有限制。</b>");
         outputText("[pg]将来她应该把自己限制在什么程度？");
         menu();
         if(get_breasts().preventLactationIncrease != 2)
         {
            _g = this;
            newLimit = 2;
            addButton(0,"轻度",function():void
            {
               _g.talkMilkLimitationChange(newLimit);
            });
         }
         if(_loc1_ && get_breasts().preventLactationIncrease != 3)
         {
            _g1 = this;
            newLimit1 = 3;
            addButton(1,"中度",function():void
            {
               _g1.talkMilkLimitationChange(newLimit1);
            });
         }
         if(_loc1_ && get_breasts().preventLactationIncrease != 4)
         {
            _g2 = this;
            newLimit2 = 4;
            addButton(2,"强度",function():void
            {
               _g2.talkMilkLimitationChange(newLimit2);
            });
         }
         if(_loc1_ && get_breasts().preventLactationIncrease != 5)
         {
            _g3 = this;
            newLimit3 = 5;
            addButton(3,"重度",function():void
            {
               _g3.talkMilkLimitationChange(newLimit3);
            });
         }
         if(get_breasts().preventLactationIncrease != 0)
         {
            _g4 = this;
            newLimit4 = 0;
            addButton(4,"无限制",function():void
            {
               _g4.talkMilkLimitationChange(newLimit4);
            });
         }
         addButton(9,"无变化",talkMilkMenu);
      }
      
      public function talkMilk() : void
      {
         clearOutput();
         outputText("你问凯丝关于她乳房的事；她喜欢像大自然设计的那样产奶吗？[pg]");
         if(get_breasts().get_lactationLevel() <= 3)
         {
            outputText("[say: 我想是的，]她说道，[say: 当有人帮我减轻负担时，我当然很享受。你为什么问这个？][pg]");
         }
         else if(get_breasts().get_lactationLevel() <= 5)
         {
            outputText("[say: 我想是的，但我现在涨得太快了。感觉就像总有一双嘴唇裹着我的乳头……不过这也不是什么坏事。][pg]");
         }
         else
         {
            outputText("[say: 我想没人会说我的乳房是“像大自然设计的那样”工作的。你喂了我那么多催乳剂，它们都变成奶油工厂了。我每天有很大一部分时间都感觉奶水在这些小家伙里面晃荡，寻找释放压力的方法。][pg]");
         }
         talkMilkMenu();
      }
      
      public function talkMaster() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1227) & 8) > 0)
         {
            outputText("你告诉凯丝，虽然你很欣赏她的顺从和忠诚，但你不希望她再叫你[master]了。[pg]");
            outputText("她看起来有点困惑，所以你解释说这可能会传达错误的信息。[pg]");
            outputText("凯瑟琳给了你一个拥抱，说道，[say: 好的[name]，我不会再叫你[master]了……但我还是什么都愿意做。][pg]");
            outputText("你把她的舌头吸进嘴里，赞赏地揉了揉她的耳朵。看来她还是会完全按照你的意愿行事——完美。[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1227,FlagDict_Impl_.arrayReadInt(_loc1_,1227) & -9);
         }
         else
         {
            outputText("你出其不意地把凯丝拉过来吻了一下。她在你怀里软了下来，任由你为所欲为。[pg]");
            outputText("当你抚摸她的尾巴时，你问她想要什么。她看起来不太确定，所以你帮她一把，暗示这就是她想要的——她想蜷缩在你的怀里，屈服于你的欲望，就像她那只顺从的小猫一样。[pg]");
            outputText("凯丝的瞳孔放大，紧紧地抱住你。她用只有你能听到的微弱声音说道，[say: 是的，我的[master]。][pg]");
            outputText("你挠了挠她的耳朵作为奖励，凯丝发出了低沉的呼噜声。[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1227,FlagDict_Impl_.arrayReadInt(_loc1_,1227) | 8);
         }
         katherineMenu();
      }
      
      public function talkLoversValaWhenever() : void
      {
         outputText("[pg]你抚摸着凯丝的尾巴，告诉她你不介意她想和瓦拉一起发泄一下。她们都很饥渴，也都需要发泄。只要她们别把对方累坏就行。你想确保她们有足够的精力和你玩三人行。[pg]");
         outputText("凯丝咯咯笑着说：[say: 我很高兴你能这么想，" + playerText() + "。有些人占有欲很强，但你知道我们俩都迷上你了。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1236,1);
         talkToKatherine(talkLoversValaWhenever);
      }
      
      public function talkLoversValaEncourage() : void
      {
         outputText("[pg]你开始把玩凯丝的尾巴。当她开始呻吟并摩擦双腿时，你告诉她，你觉得她想照顾瓦拉真是太好了。[pg]");
         outputText("[say: 你的意思是你想让我们，呃，多花点时间在一起？][pg]");
         outputText("你告诉她，她们两个需要互相陪伴。释放积压的紧张情绪对她们来说健康得多。[pg]");
         outputText("凯丝呻吟着，你感觉到她的尾巴在你的手中抽搐。你知道她会听从你的指示——在内心深处，这也是她想要的。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1236,2);
         talkToKatherine(talkLoversValaEncourage);
      }
      
      public function talkLoversValaDont() : void
      {
         outputText("[pg]你给了凯丝一个吻，告诉她，虽然你很高兴她和瓦拉相处得这么好，但你真的更希望她能等你来了再和那个妖精服务员做些什么。你觉得有点被冷落了。[pg]");
         outputText("凯丝抱了抱你，对你说：[say: 我会乖乖的，我保证。但我们几乎每天都在酒吧见面，所以我希望你计划了很多三人行，好释放我们所有积压的精力。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1236,0);
         talkToKatherine(talkLoversValaDont);
      }
      
      public function talkLoversVala() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) == 0)
         {
            outputText("你给凯瑟琳讲了你是如何从小恶魔手中救下瓦拉的故事。你省略了很多细节，但凯丝还是打了个寒颤。当你讲完时，她说：[say: 哇。你真是个英雄，到处拯救女孩。不过她最后竟然在特尔阿德雷当了服务员，挺奇怪的，不是吗？我还以为她会去森林里的某个地方呢。]");
            outputText("[pg]凯丝");
            if(isAt(1))
            {
               outputText("躺回床上，发了一会儿呆");
            }
            else
            {
               outputText("又喝了一口饮料，四处张望看看瓦拉在不在附近" + (isValaAtBar() ? "。瓦拉注意到了她的目光，走过来问凯丝是否需要再来一杯。凯丝因为被抓包而感到尴尬，只好又点了一杯" : ""));
            }
            outputText("。");
            outputText("[pg]过了好一阵子，凯丝打破了沉默：[say: 所以她是新来的，要处理各种问题，而且在这里可能也不认识什么人。幸好没人占她便宜。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,123) > 0)
            {
               outputText("你决定最好还是别提" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,123) == 1 ? "那次" : "那些次") + "你趁瓦拉被精神控制并绑起来时占她便宜的事。[pg]");
            }
            if(isAt(1))
            {
               outputText("她把头靠在你的腿上，说道");
            }
            else
            {
               outputText("她又喝了一口饮料，握紧你的手，说道");
            }
            outputText("，[say: 我在想；也许我应该多留意她。你觉得呢，" + playerText() + "？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1235,1);
         }
         else
         {
            outputText("你提到了瓦拉，凯丝低声说，自从你上次提到那个妖精服务员后，她就更加关注她了。她觉得瓦拉总体上还不错，但凯丝偶尔能从她身上看到一丝悲伤。她怀疑瓦拉需要一个朋友，或者需要她的勇者多来看看她。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 10)
            {
               outputText("[pg]你可以告诉凯丝，除非你在场，否则不要和瓦拉做爱；也可以告诉她，她们想什么时候做爱都可以；或者鼓励她们把对方操得神魂颠倒。");
               menu();
               addButton(0,"别做爱",talkLoversValaDont);
               addButton(1,"随时",talkLoversValaWhenever);
               addButton(2,"鼓励",talkLoversValaEncourage);
               return;
            }
         }
         talkToKatherine(talkLoversVala);
      }
      
      public function talkLoversUrtaWhenever() : void
      {
         outputText("[pg]你抚摸着凯丝的尾巴，告诉她你不介意你最爱的" + (hasCock() ? "扶她" : "女孩们") + "一起发泄一下精力。只要她们别把对方榨干就行。[pg]");
         outputText("凯丝咯咯笑着说：[say: 那太好了——哦，你完全不用担心，" + playerText() + "，我们俩都很饥渴，几乎随时都准备好找点乐子。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1233,1);
         talkToKatherine(talkLoversUrtaWhenever);
      }
      
      public function talkLoversUrtaEncourage() : void
      {
         outputText("[pg]你开始摩擦凯丝的大腿内侧。当她开始呻吟，你感觉到她的胯部散发出热量时，你告诉她，你的情人们能如此“和睦相处”，让你觉得非常性感。[pg]");
         outputText("[say: 你的意思是你想让我们，呃，多花点时间在一起？][pg]");
         outputText("你让手指稍微靠近凯丝的");
         if(hasCock())
         {
            outputText("鸡巴" + cockMultiple("","s") + "和");
         }
         outputText("小穴，然后说没错，你很乐意。你知道你并不总是在镇上，所以无论她们谁需要解馋，都应该聚在一起。[pg]");
         outputText("凯丝呻吟着，尾巴来回摆动。[pg]");
         outputText("[say: 我想让你们操到忘记怎么自慰，]你告诉她。[pg]");
         outputText("[say: 哦，好啊！我想我们能做到，]她用梦幻般的语气回答道。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1233,2);
         talkToKatherine(talkLoversUrtaEncourage);
      }
      
      public function talkLoversUrtaDont() : void
      {
         outputText("[pg]你挠了挠凯丝的耳后，告诉她虽然你为她感到高兴，但你真的希望她能等你也在场的时候再和乌尔塔做爱。你感觉自己有点被冷落了。[pg]");
         outputText("凯丝抱了抱你，对你说：[say: 我会乖的，我保证。但我们确实经常见面，所以我希望你能多安排几次三人行，好释放我们积攒的精力。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1233,0);
         talkToKatherine(talkLoversUrtaDont);
      }
      
      public function talkLoversUrta() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 0)
         {
            _loc1_ = get_game().urtaPregs.urtaKids();
            outputText("你决定告诉凯瑟琳关于乌尔塔的事。令人惊讶的是，既然她们在一起工作，这事居然一直没被提起过。在你解释完之后，凯瑟琳" + (knownLovers() > 2 ? "笑着说：[say: 你把乌尔塔也当情人了？你可真是个大忙人勇者。别担心，我绝对不会离开你的。]" : "担忧地看着你，问这对你们俩意味着什么。当你告诉她你无意离开时，她跳进你的怀里，紧紧抱住你，差点把你肺里的空气都挤出来。") + "[pg]");
            outputText("你告诉凯丝，第一天你来到特尔阿德雷时，乌尔塔是如何遇见你的，以及后来你们俩是如何在这家酒吧后面的小巷里“相遇”的。听完这个故事后，凯丝说：[say: 我懂她的感受。当你觉得没人要你的时候，那真的很痛苦。]");
            if(_loc1_ > 0)
            {
               outputText("[pg]当你告诉凯丝你和乌尔塔" + (_loc1_ == 1 ? "有了一个孩子" : "一起生了" + _loc1_ + "个孩子") + "时，她差点呛到。[say: 你就是那个神秘的爸爸？大家都知道乌尔塔" + (_loc1_ == 1 ? "有孩子" : "有几个孩子") + "，但我从来不知道你就是那个" + get_player().genderText("父亲。","母亲。","父亲？还是母亲？反正就是另一个家长。","父……呃……这到底是怎么回事？") + "]");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1232,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 1)
         {
            outputText("你提起乌尔塔，凯丝笑了。[say: 是啊，乌尔塔和我一直在谈论你。很奇怪，我一直以为我会非常生气，去追杀任何操了我" + get_player().genderText("男人","女人","女人","情人") + "的女孩，但这并没有发生。实际上，我对你和她的事感觉很好。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) <= 10)
         {
            outputText("你提起乌尔塔，凯丝笑了。[say: 我还是不知道我是否应该和她上床什么的，但我们三个人在一起的那些时候，嗯，感觉相当不错。我不是要求再来一次什么的，但我知道你看中了她什么，我不怪你们俩。][pg]");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) <= 31)
            {
               outputText("你提起乌尔塔，凯丝叹了口气，给了你一个大大的笑容。她看起来真的像偷吃了金丝雀的猫，或者在这种情况下，是吃干抹净了狐狸。[say: 这都是你的错，你知道的。我本来没打算爬上我上司的床，但你就是不肯罢休。现在我们在走廊里交换眼神，我总是想，如果我们俩同时休息，她会不会把我带到什么地方去。她没有——但我总是期待着。也许只是我自己的问题，我需要再好好被操一顿。][pg]");
               outputText("她伸了个懒腰，然后继续说道，故意让你好好欣赏她的胸部。[say: 我得说——我真的很享受我们的小聚会。我们三个人能达到你们两个人做不到的境界。][pg]");
               outputText("你可以告诉凯丝，除非你在场，否则不要和乌尔塔做爱；告诉她她们想什么时候做爱都可以；或者鼓励她们把对方操得神魂颠倒。");
               menu();
               addButton(0,"别做爱",talkLoversUrtaDont);
               addButton(1,"随时",talkLoversUrtaWhenever);
               addButton(2,"鼓励",talkLoversUrtaEncourage);
               return;
            }
            outputText("当你提到乌尔塔时，凯丝站起来给了你一个拥抱。[say: 我曾经是个以为因为长着一根大狗鸡巴就永远没人会爱我的女孩。现在我有你了，你也有我，还有乌尔塔。我太开心了，每天都能锻炼——谁还需要健身房啊？而且我总有一个可以一起回家的人，一个可以倾诉的人，一个可以紧紧拥抱的人。非常感谢你，" + playerText() + "。]");
         }
         talkToKatherine(talkLoversUrta);
      }
      
      public function talkLoversHelia() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1231) == 0)
         {
            _loc1_ = knownLovers();
            outputText("你决定告诉凯瑟琳关于赫莉娅的事。在你解释完之后，凯瑟琳");
            if(_loc1_ > 5)
            {
               outputText("只是摇了摇头。[say: 你哪来那么多精力？猫人可不是以一夫一妻制出名的，但你绝对是个中翘楚。]她给了你一个吻，紧紧抱住你，低声说：[say: 我不介意你想把她们全收了。只要确保我也能有机会享受你就行。]");
            }
            else if(_loc1_ > 2)
            {
               outputText("笑着说：[say: 又一个情人？你可真是个大忙人勇者。别担心，我肯定不会离开你的。]");
            }
            else
            {
               outputText("担忧地看了你一眼，问这对你们俩意味着什么。当你告诉她你无意离开时，她跳进你的怀里，紧紧抱住你，差点把你的肺都挤空了。");
            }
            outputText("[pg]你不得不向凯瑟琳解释火蜥蜴是什么样的，因为她从未亲眼见过。你告诉她你和赫莉娅是如何在平原上相遇的，以及她是如何搬来和你同住的。你觉得你感觉到了凯丝的一丝嫉妒，直到你描述了赫莉娅似乎有过多少个伴侣，以及她对各种三人行的喜好。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
               {
                  outputText("凯丝听到你和赫莉娅有了一个火蜥蜴宝宝感到有些惊讶，但她接受得很好。事实上，她告诉你她有兴趣见见你的女儿和她的母亲。");
               }
               else
               {
                  outputText("凯丝觉得你一直在帮赫莉娅抚养她的小女孩这件事很可爱，她表示有兴趣见见她们俩。");
               }
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1231,1);
         }
         else
         {
            outputText("你向凯丝更新了营地里发生的事情。你又多聊了一些关于赫莉娅的事，凯丝再次提到她想见见你的火蜥蜴情人" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) > 0 ? "和她的女儿" : "") + "。这可能是你的错觉，但你觉得凯瑟琳想向你证明些什么。");
         }
         talkToKatherine(talkLoversHelia);
      }
      
      public function talkLoversEdryn() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1230) == 0)
         {
            _loc1_ = knownLovers();
            _loc2_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69);
            outputText("你决定把埃德琳的事告诉凯瑟琳。在你解释完之后，凯瑟琳");
            if(_loc1_ > 5)
            {
               outputText("只是摇了摇头。[say: 你哪来那么多精力？猫人可不是以一夫一妻制出名的，但你绝对是个中翘楚。]她给了你一个吻，紧紧抱住你，低声说：[say: 我不介意你想把她们全收了。只要确保我也能有机会享受你就行。]");
            }
            else if(_loc1_ > 2)
            {
               outputText("笑着说：[say: 又一个情人？你可真是个大忙人勇者。别担心，我肯定不会离开你的。]");
            }
            else
            {
               outputText("担忧地看了你一眼，问这对你们俩意味着什么。当你告诉她你无意离开时，她跳进你的怀里，紧紧抱住你，差点把你的肺都挤空了。");
            }
            outputText("[pg]你花了几分钟回答凯丝关于埃德琳的许多问题。她见过她一两次，但没听说过埃德琳下班后兼职的习惯。你解释说，这与其说是卖淫，不如说是埃德琳只是需要鸡巴。她只是觉得既然半人马母马供不应求，她不妨在满足自己的同时赚点宝石。反正那都是过去的事了，因为埃德琳现在非常享受你的陪伴，她不再向你收费了。");
            if(_loc2_ > 0)
            {
               outputText("你告诉凯瑟琳，事实上你已经和埃德琳生了" + (_loc2_ > 1 ? _loc2_ + "个孩子" : "一个孩子") + "。[say: 她有" + (_loc2_ > 1 ? _loc2_ + "个孩子" : "一个孩子") + "？]凯丝脱口而出。[say: 哇——我怎么也猜不到。]");
            }
            outputText("[pg]凯瑟琳似乎对你坦诚相待感到很高兴。显然，她很享受自己知道同事小秘密的这种感觉。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1230,1);
         }
         else
         {
            outputText("你和凯丝聊起了她的工作，并把话题引向了她的同事。凯丝很乐意爆料，她告诉你，自从你提到埃德琳后，她就开始注意她了。比如有些早晨，她来上班时看起来非常得意，步伐也有些轻浮。凯丝咧嘴一笑，说道：[say: 我敢打赌我知道是谁干的好事。]");
         }
         talkToKatherine(talkLoversEdryn);
      }
      
      public function talkLoversCotton() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1229) == 0)
         {
            _loc1_ = knownLovers();
            outputText("你决定把科顿的事告诉凯瑟琳。在你解释完之后，凯瑟琳");
            if(_loc1_ > 5)
            {
               outputText("只是摇了摇头。[say: 你哪来那么多精力？猫人可不是以一夫一妻制出名的，但你绝对是个中翘楚。]她给了你一个吻，紧紧抱住你，低声说：[say: 我不介意你想把她们全收了。只要确保我也能有机会享受你就行。]");
            }
            else if(_loc1_ > 2)
            {
               outputText("笑着说：[say: 又一个情人？你可真是个大忙人勇者。别担心，我肯定不会离开你的。]");
            }
            else
            {
               outputText("担忧地看了你一眼，问这对你们俩意味着什么。当你告诉她你无意离开时，她跳进你的怀里，紧紧抱住你，差点把你的肺都挤空了。");
            }
            outputText("[pg]你花了几分钟回答凯丝关于科顿的许多问题。她对你们俩是如何相遇的似乎并不太惊讶。凯丝假笑着说：[say: 马人在特尔阿德雷可是有一定的名声的，听起来科顿并没有打破这个传统。不过嘿，大家都开心就好，谁在乎那些恶魔来之前的老顽固会不会气得跳脚。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 0)
            {
               outputText("[pg]然后你提到了你和科顿生的孩子" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,675) > 1 ? "们" : "") + "。凯丝惊得下巴都掉下来了。[say: 哇，真的吗？据我所知，那些在健身房工作的女孩都非常注重保养自己的身体——这包括服用草药或使用魔法来确保她们永远不会怀孕。她们大多数人甚至都不愿意去想生孩子会对她们的腹肌造成什么影响。][pg]");
               outputText("你微笑着告诉她，科顿<b>确实</b>在使用草药。凯丝咧嘴一笑，说：[say: 那玩意儿威力很大，是吧？我倒也不太惊讶。我想我很幸运，我父母花钱给我弄了全套的魔法保护。他们可不想在我刚发现做爱有多爽的时候，就突然多出一打孙子孙女来。]");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1229,1);
         }
         else
         {
            outputText("你谈到了最近去健身房的事，凯丝建议她也许愿意尝试一下瑜伽。你感觉凯丝是想看看自己和科顿比起来怎么样。这肯定会是一个有趣的夜晚。");
         }
         talkToKatherine(talkLoversCotton);
      }
      
      public function talkLoversAmily() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1228) == 0)
         {
            _loc1_ = knownLovers();
            outputText("你决定把艾米莉的事告诉凯瑟琳。在你解释完之后，凯瑟琳");
            if(_loc1_ > 5)
            {
               outputText("只是摇了摇头。[say: 你哪来那么多精力？猫人可不是以一夫一妻制出名的，但你绝对是个中翘楚。]她给了你一个吻，紧紧抱住你，低声说：[say: 我不介意你想把她们全收了。只要确保我也能有机会享受你就行。]");
            }
            else if(_loc1_ > 2)
            {
               outputText("笑着说：[say: 又一个情人？你可真是个大忙人勇者。别担心，我肯定不会离开你的。]");
            }
            else
            {
               outputText("担忧地看了你一眼，问这对你们俩意味着什么。当你告诉她你无意离开时，她跳进你的怀里，紧紧抱住你，差点把你的肺都挤空了。");
            }
            outputText("[pg]你花了几分钟回答凯丝关于艾米莉的许多问题。她似乎对你们相遇的故事印象深刻，并对你们生了这么多孩子感到惊讶。在你离开之前，凯丝提到她也许有一天想见见这个鼠娘。在恶魔到来之前，猫人和鼠人并不总是和睦相处，但现在没人再在乎那些陈年旧怨了。她说这可能是恶魔带来的唯一一件好事。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1228,1);
         }
         else
         {
            outputText("你向凯丝讲述了营地最近发生的事情。你们又聊了一会儿艾米莉，凯丝再次提到她想亲自见见艾米莉。你感觉凯丝是想看看自己和她比起来怎么样。让她们俩聚在一起可能会擦出火花，也可能会很合得来。");
         }
         talkToKatherine(talkLoversAmily);
      }
      
      public function talkLovers() : void
      {
         var _g:Katherine;
         clearOutput();
         var _loc1_:int = playerLovers();
         menu();
         if((_loc1_ & 1) != 0)
         {
            addNextButton("艾米莉",talkLoversAmily);
         }
         if((_loc1_ & 2) != 0)
         {
            addNextButton("科顿",talkLoversCotton);
         }
         if((_loc1_ & 4) != 0)
         {
            addNextButton("埃德琳",talkLoversEdryn);
         }
         if((_loc1_ & 8) != 0)
         {
            addNextButton("赫莉娅",talkLoversHelia);
         }
         if((_loc1_ & 0x10) != 0)
         {
            addNextButton("乌尔塔",talkLoversUrta);
         }
         if((_loc1_ & 0x20) != 0)
         {
            addNextButton("瓦拉",talkLoversVala);
         }
         outputText("也许你应该和凯丝谈谈关于");
         if(get_output().buttonCount() > 1)
         {
            outputText("你的其他情人之一。");
         }
         else if((_loc1_ & 1) != 0)
         {
            outputText("艾米莉。");
         }
         else if((_loc1_ & 2) != 0)
         {
            outputText("科顿。");
         }
         else if((_loc1_ & 4) != 0)
         {
            outputText("埃德琳。");
         }
         else if((_loc1_ & 8) != 0)
         {
            outputText("赫莉娅。");
         }
         else if((_loc1_ & 0x10) != 0)
         {
            outputText("乌尔塔。");
         }
         else if((_loc1_ & 0x20) != 0)
         {
            outputText("瓦拉。");
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.talkToKatherine();
         });
      }
      
      public function talkHome() : void
      {
         clearOutput();
         outputText("你问起凯丝她的家，她顿时喜笑颜开。[pg]");
         outputText("[saystart]那真是太棒了。那是我在街头流浪时所没有的一切。我有一张床——我自己的床！我有一张可以做饭的桌子，一个放衣服的衣柜，一个大脸盆，我想什么时候洗澡都可以。但最棒的是我的门。我可以安心睡觉，不用担心有人会试图偷我的东西，或者发生更糟的事。");
         outputText("[pg]我知道那只是两个小房间，但与露天的小巷相比，那里简直就是天堂。[sayend]");
         if(isAt(1))
         {
            outputText("她站起身，在房间里走来走去，手划过刚粉刷过的白墙。[say: 这个地方太棒了，这一切都多亏了你。]");
         }
         else
         {
            outputText("她向后靠得更深了，脚背蹭过你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "。[say: 你知道吗，我们现在就可以去那里。只要你一句话，我们就可以开始测试我床底下的绳子有多紧了。]");
         }
         katSexMenu();
      }
      
      public function talkGangs() : void
      {
         clearOutput();
         outputText("你问凯丝，既然她现在站在了法律的另一边，她对城里的帮派有什么看法。[pg]");
         outputText("她摇了摇头，说道：[say:有时候真的挺奇怪的。我知道各个帮派为什么要那么做，也知道守卫队为什么要这么做。我是说，关于不准住在任何废弃房屋里的法律——这对流落街头的人来说毫无意义。但对在守卫队工作的人来说却很有道理。多年前，一些帮派加固了建筑物，把守卫队拒之门外。头目们被权力冲昏了头脑，有些人变得腐败——或者也许他们一开始就有点腐败。不管怎样，他们不得不请来一些法师把他们清理出去，很多无辜的人因此受了伤。][pg]");
         outputText("她站起身来，来回踱步。[say:所有的问题都是这样的。我能理解为什么" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "队长会酗酒，我也知道为什么城里的议员们都愁白了头。食物和水有限，危险物品可能会流入城内，人们沉迷于欲望以至于忘了吃饭——而这些还只是日常问题。这座城市需要人们各尽其责，否则整个地方就会变成一场巨大的狂欢，所有人都会因为没人修理从深层含水层抽水的泵而渴死。][pg]");
         outputText("她走过来，依偎在你怀里。[say:问题是，我知道从另一边看是什么样子。一群自命不凡的混蛋，就因为他们比难民先到这里，就毁了大家的日子。法师们对每个人发号施令，却不告诉任何人他们在做什么——见鬼，他们几乎从不和守卫队和议员以外的任何人说话。][pg]");
         outputText("凯丝叹了口气，然后继续说道：[say:大家常说做件难事就像放牧猫一样，这是有原因的。我们，以及其他几个种族，往往要独立得多。我们甚至有点自豪，因为我们不会仅仅因为某人说自己是管事的就听他的。新的帮派总是不断形成，因为我们宁愿追随一个我们能看到、能打交道的人。当然，帮派头目会偏袒自己人，拿走最好的食物等等，但至少我们知道他们是谁，东西去哪了。当事情出错时，我们知道该向谁抱怨。][pg]");
         outputText("[say:简而言之，至少对于特尔阿德雷的麻烦来说，没有简单的答案。]她松开你，倒回" + (isAt(1) ? "床上" : "她的椅子里") + "。[say:既然你让我满脑子都在想这座城市的事，我希望你能帮我转移一下注意力。]");
         katSexMenu();
      }
      
      public function talkClothesTubeTopSuggest() : void
      {
         outputText("[pg]你走到她身后" + (pregSize() > 0 ? "，只是抱住她，手指交错放在她的肚子上，亲吻着" : "，只是抱住她，亲吻着") + "她的后颈。你问她能不能多穿穿这套衣服，她穿着这套露出这么多" + catGirl("肌肤","皮毛") + "的衣服，看起来是那么年轻性感。[pg]");
         outputText("凯丝只是发出呼噜声，说道：[say: 我很乐意。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,32);
         katherineMenu();
      }
      
      public function talkClothesTubeTopInsist() : void
      {
         outputText("[pg]你走到她身后" + (pregSize() > 0 ? "，只是抱住她，手指交错放在她的肚子上，亲吻着" : "，只是抱住她，亲吻着") + "她的后颈。你告诉她你希望看到她一直穿着这个。这能展现她的身材，让所有人都知道她是个怎样的色情狂" + (pregSize() > 0 ? "，尤其是现在她还挺着个大肚子" : "") + "。[pg]");
         outputText("凯丝用屁股蹭着你，说道：[say: " + (playerMaster() ? "好的，[master]" : "没问题，亲爱的") + "。但现在我想要个好理由再把这些衣服脱下来。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-32);
         katSexMenu();
      }
      
      public function talkClothesTubeTopCompliment() : void
      {
         outputText("[pg]你走到她身后，只是抱住她" + (pregSize() > 0 ? "，手指交错放在她的肚子上，亲吻着" : "，亲吻着") + "她的后颈。凯丝率先打破了沉默：[say: 我觉得这套衣服让我看起来有点骚，但我喜欢为了你看起来骚一点。]");
         katSexMenu();
      }
      
      public function talkClothesTubeTop() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 32)
         {
            outputText("[pg]你告诉凯丝，她穿的这件抹胸真的很显身材。露脐装很适合她。" + (pregSize() > 0 ? "凯瑟琳把手放在肚子上，显得有些不自在。然后她摇了摇头，" : "她") + "为你摆了几个姿势，还转了个圈。");
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,32);
            outputText("[pg]你问凯丝关于你给她买的抹胸的事。凯丝咧嘴一笑，示意你等一下。她打开衣柜，背对着你脱下旧衣服。她穿上抹胸，然后" + clothesLowerChoice("穿上配套的紧身短裤。","把手放在内裤上那巨大的凸起上。她的手越过叠好的超短裤，穿上与衬衫相配的裙子。","","","") + (pregSize() > 0 ? " 看着镜子里的自己，她把手放在裸露的肚子上一会儿，陷入了沉思。" : ""));
         }
         menu();
         addButton(0,"称赞",talkClothesTubeTopCompliment);
         addButton(1,"建议",talkClothesTubeTopSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesTubeTopInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothesSSRobeSuggest() : void
      {
         outputText("[pg]你的手拂过细腻的丝绸，告诉她这件长袍看起来棒极了，就像是为她的身体量身定做的一样。你给了她一个吻，问她能不能多穿穿。你真的很喜欢看她穿丝绸的样子。[pg]");
         outputText("凯丝抱了抱你，说道：[say:我总是很乐意做让你开心的事，" + playerText() + "。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,16);
         katherineMenu();
      }
      
      public function talkClothesSSRobeInsist() : void
      {
         outputText("[pg]你把手指放在凯丝的下巴下，让她看着你的眼睛。你问她：[say:长袍最棒的地方是什么？][pg]");
         outputText("当她试图想出点什么时，你拉了拉腰带，解开它，让长袍的前襟敞开。[say:方便办事，]你自问自答道。你让手在她的皮肤和长袍之间游走，凯丝的瞳孔开始放大。你告诉她，你希望她一直穿着这件长袍，这样无论何时何地，只要你找到她，只需轻轻一拉就能让她一丝不挂。[pg]");
         outputText("凯丝颤抖了一下，你感觉到热气从她内裤" + (hasCock() ? "里巨大的凸起处" : "") + "升起。看来你的性感小猫可能有点暴露癖。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-16);
         katSexMenu();
      }
      
      public function talkClothesSSRobeCompliment() : void
      {
         outputText("[pg]你的手拂过细腻的丝绸，凯瑟琳对你的关注发出了感激的呼噜声。你将一只手滑入长袍内，问她是否想过不穿内衣，只隔着这层薄薄的丝绸走在街上。[pg]");
         outputText("凯丝给了你一个吻，说道：[say:你把我带坏了，" + playerText() + "。]");
         katSexMenu();
      }
      
      public function talkClothesSSRobe() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 16)
         {
            outputText("[pg]你告诉凯丝，她穿的这件蛛丝长袍很适合她——即使她施展不了任何魔法。她拉了拉丝袍的边缘，理平了一些皱褶，抚平了胸前的布料。");
         }
         else
         {
            outputText("[pg]你向凯丝问起你给她的那件蛛丝长袍。凯丝咧嘴一笑，示意你等一下。她打开衣柜，背对着你脱下旧衣服。她穿上长袍，在腰间系紧腰带之前，故意只让你看到她胸部的一抹春光。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,16);
         }
         menu();
         addButton(0,"赞美",talkClothesSSRobeCompliment);
         addButton(1,"建议",talkClothesSSRobeSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesSSRobeInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothesNurseOutfitSuggest() : void
      {
         outputText("[pg]你走到她身后，在她耳边低语，说你很喜欢这个提议。[pg]");
         outputText("她发出满足的呼噜声，用性感的语调问道：[say: 你喜欢我在街上展示我的身体吗？][pg]");
         outputText("你揉捏着她的乳房，告诉她你很喜欢她这么做。[pg]");
         outputText("[say: 那好吧，" + playerText() + "，]她说着，把手覆在你的手上，[say: 我想特尔阿德雷的人们以后会更多地看到我了。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,64);
         katherineMenu();
      }
      
      public function talkClothesNurseOutfitInsist() : void
      {
         outputText("[pg]你走到她身后，在她耳边低语，说你很喜欢这个提议。[pg]");
         outputText("她发出满足的呼噜声，用性感的语调问道：[say: 你喜欢我在街上展示我的身体吗？][pg]");
         outputText("你揉捏着她的乳房，告诉她从现在起你就期待她这么做。为什么要抗拒呢？她天生就该穿着这身淫荡的衣服到处走。甚至去教堂，如果她去的话。甚至去拜访她的父母。[pg]");
         outputText("这让她猛地吸了一口气，你把手伸进那条裙子底下，亲手感受她的湿润。[pg]");
         outputText("[say: 是的，" + playerText() + "，我明白。我会把我的身体展示给所有人看——他们不会知道这都是为了你，但我不在乎。我想为你打扮得像个荡妇。][pg]");
         outputText("你的手指在她的小穴上下来回滑动，试图决定你想对这只性感小猫做些什么。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-64);
         katSexMenu();
      }
      
      public function talkClothesNurseOutfitCompliment() : void
      {
         outputText("[pg]你挠了挠她的肚脐，告诉她没人能把这套衣服穿得比她更好看。[pg]");
         outputText("她被挠得咯咯直笑，然后紧紧地抱住了你。");
         if(get_player().hasVagina())
         {
            outputText("[say: 我能想到至少还有一个人，我也很想看对方穿护士服，]她回答道，手指在你的背上轻轻划过。");
         }
         katSexMenu();
      }
      
      public function talkClothesNurseOutfit() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 64)
         {
            outputText("[pg]你告诉凯丝，她穿的这套性感护士服真的很显身材。她双手叉腰，转了个圈，离你走了几步，尽情地展示着自己的魅力。");
         }
         else
         {
            outputText("[pg]你问凯丝关于那套性感护士服的事，她咧嘴一笑，示意你等一下。她打开衣柜，背对着你脱下旧衣服。没过多久，她就穿上了护士服。她停下来稍微调整了一下头上的小白帽，然后转过头看着你，朝你扭了扭屁股。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,64);
         }
         outputText("[pg]你问她，当她在大街上昂首阔步时，有多少双眼睛盯着她摇曳的屁股和甩动的尾巴。[pg]");
         outputText("[say: 非常多，]她咧嘴笑着说。");
         menu();
         addButton(0,"称赞",talkClothesNurseOutfitCompliment);
         addButton(1,"建议",talkClothesNurseOutfitSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesNurseOutfitInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothesNoPreference() : void
      {
         outputText("[pg]你走到凯丝身边，开始玩弄她的尾巴。她笑着跳进你的怀里，活泼好动，准备好找点乐子了。你告诉她，下次她穿衣服的时候，她" + (submissiveness() > 1 ? "可以自己选择" : "应该挑选") + "任何她喜欢的。就你而言，她衣柜里的每件衣服穿在她身上都很好看。当然，你更喜欢她一丝不挂的样子。[pg]");
         outputText("凯丝在你的身上扭动着，说道，[say:当你在身边的时候，我也更喜欢光着身子。真是个有趣的巧合。哦，既然你提到了……]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,0);
         katSexMenu();
      }
      
      public function talkClothesDressSuggest() : void
      {
         outputText("[pg]你双臂环抱住她，告诉她这件裙子穿在她身上简直美极了。她应该多穿穿——如果只能把它扔在衣柜里吃灰，而不是穿着它在镇上招摇过市，那真是太可惜了。像她这样的猫" + catGirl("娘","兽人") + "女士，正是特尔阿德雷的居民们需要看到的，好提醒他们猫科动物是多么的美丽与优雅。[pg]");
         outputText("她紧紧抱住你，发出呼噜声。你知道她无论去哪都会穿着这件长裙，为这座城市增添一丝优雅的气息。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,8);
         katherineMenu();
      }
      
      public function talkClothesDressInsist() : void
      {
         outputText("[pg]你双臂环抱住她，告诉她这件裙子穿在她身上美极了。凯丝叹了口气，你把手放在她裸露的背上，告诉她你希望她一有机会就穿上它。凯丝咧嘴一笑，热情地点了点头。你知道她和你喜欢看她穿这件裙子一样，喜欢穿着它。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-8);
         katherineMenu();
      }
      
      public function talkClothesDressCompliment() : void
      {
         outputText("[pg]你牵起她的手，问这位女士是否愿意与你共舞。凯丝看起来有些尴尬，嘟囔着说她才不是什么女士，但你能看出来她很喜欢你这么说。她将你拉入怀中，");
         if(hasCock())
         {
            outputText("她裙子下坚挺的突起" + cockMultiple("告诉你","告诉着你") + "，只要是水平方向的，她很乐意尝试一下“跳舞”。");
         }
         else
         {
            outputText("她的乳头摩擦着你。她已经欲火焚身，乳头挺立得就像两颗小辣椒的尖端——而你知道它们尝起来会甜得多。");
         }
         katSexMenu();
      }
      
      public function talkClothesDress() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 8)
         {
            outputText("[pg]你称赞了凯丝现在穿着的优雅舞会礼服。她在房间里旋转着，伴随着你听不见的音乐起舞，展示着她的柔韧性。她时不时地看向你，以确保你对她的表现感到满意。");
         }
         else
         {
            outputText("[pg]你向凯丝问起你送给她的那件舞会礼服。凯丝咧嘴一笑，示意你等一下。她打开衣柜，开始换衣服。因为扣子太多，这花了一点时间，但这是值得的。穿着这么漂亮的衣服，凯丝似乎都在发光。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,8);
         }
         menu();
         addButton(0,"称赞",talkClothesDressCompliment);
         addButton(1,"建议",talkClothesDressSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesDressInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothesBodysuitSuggest() : void
      {
         outputText("[pg]你用双臂环抱住她，告诉她这件紧身衣穿在她身上棒极了。只要看到她穿着这件衣服，你就会觉得今天是美好的一天。[pg]");
         outputText("你抚摸着她的耳朵，说她应该多穿穿这件衣服——如果她能穿着它在镇上招摇过市，那把它挂在衣柜里就太可惜了。这件紧身衣就是为了展示她紧致的屁股和挺拔的乳房而设计的。她弯腰在市场上检查农产品时的样子，一定会让人们大饱眼福。对于像她这样可爱的女孩来说，穿上一件几乎透明的紧身衣简直是在造福大众。[pg]");
         outputText("她紧紧抱住你，发出呼噜声。[say: " + (playerMaster() ? "好的，[master]" : "好吧，[name]") + "，如果你喜欢这样，那你以后会经常看到我性感的屁股塞进这件紧身衣里的。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,4);
         katSexMenu();
      }
      
      public function talkClothesBodysuitInsist() : void
      {
         outputText("[pg]你用双臂环抱住她，告诉她这件紧身衣穿在她身上棒极了。只要看到她穿着这件衣服，你就会觉得今天是美好的一天。[pg]");
         outputText("你用手梳理着她的头发，补充说你希望她一有机会就穿上它。凯丝睁大了眼睛，但什么也没说。你微笑着告诉她，像她这样调皮的小猫咪，就应该穿上这种能勾勒出她每一道曲线的紧身衣。只要她不值班，你就希望她无论走到哪里都骄傲地展示自己的身材。[pg]");
         outputText("凯丝看起来有点不确定，又有点兴奋。第二种情绪很快占了上风，她饥渴地看着你。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-4);
         katSexMenu();
      }
      
      public function talkClothesBodysuitCompliment() : void
      {
         outputText("[pg]你用双臂环抱住她，告诉她这件紧身衣穿在她身上棒极了。只要看到她穿着这件衣服，你就会觉得今天是美好的一天。[pg]");
         outputText("凯丝依偎在你身边，发出开心的呼噜声。紧身衣裆部" + (hasCock() ? "的凸起" : "散发出的热量") + "暗示了她有多喜欢你的赞美。");
         katSexMenu();
      }
      
      public function talkClothesBodysuit() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 4)
         {
            outputText("[pg]你称赞了凯丝现在穿着的紧身衣。她站起身来，向你展示着这件衣服，让你心跳加速。");
         }
         else
         {
            outputText("[pg]你向凯丝问起你送给她的那件紧身衣。凯丝咧嘴一笑，示意你等一下。她打开衣柜，开始换衣服。很快，她就站在了你面前，骄傲地穿着那件透明的紧身衣。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,4);
         }
         menu();
         addButton(0,"称赞",talkClothesBodysuitCompliment);
         addButton(1,"建议",talkClothesBodysuitSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesBodysuitInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothesBlouseSuggest() : void
      {
         outputText("[pg]你拉近距离给了她一个拥抱，抚摸着她的耳朵，直到你看到她的尾巴在裙子底下左右摇摆。你告诉她，她应该对自己的品味多一点自信，她穿那件衬衫看起来就像个漂亮、天真的女孩。[pg]");
         outputText("凯丝咯咯笑着说，[say: 我猜那是个很好的伪装。]");
         if(hasCock())
         {
            outputText("抵在你" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上的凸起表明了她有多么感激你的赞美。");
         }
         else
         {
            outputText("她把骨盆在你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上摩擦，尾巴卷在你的腰上。很明显，你的小猫喜欢被赞美。");
         }
         outputText("[pg]你继续按摩她的耳朵，并告诉她你想多看她穿这件衣服。[pg]");
         outputText("她在你的脖子上蹭了蹭，说道，[say: " + (playerMaster() ? "是的，[master]，你喜欢什么我就穿什么" : "你喜欢什么我就穿什么，[name]") + "。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,2);
         katSexMenu();
      }
      
      public function talkClothesBlouseInsist() : void
      {
         outputText("[pg]你拉近距离给了她一个拥抱，抚摸着她的耳朵，直到你看到她的尾巴在裙子底下左右摇摆。你告诉她，她应该对自己的品味多一点自信，她穿那件衬衫看起来就像个漂亮、天真的女孩。[pg]");
         outputText("凯丝咯咯笑着说，[say: 我猜那是个很好的伪装。]");
         if(hasCock())
         {
            outputText("抵在你" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上的凸起表明了她有多么感激你的赞美。");
         }
         else
         {
            outputText("她把骨盆在你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上摩擦，尾巴卷在你的腰上。很明显，你的小猫喜欢被赞美。");
         }
         outputText("[pg]你继续按摩她的耳朵，告诉她你想让她一直穿着这件衬衫。如果你想让她换别的衣服，你会告诉她的。[pg]");
         outputText("她在你的脖子上蹭了蹭，说道，[say: " + (playerMaster() ? "是的，[master]，你喜欢什么我就穿什么" : "你让我穿什么我就穿什么，[name]") + "。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-2);
         katSexMenu();
      }
      
      public function talkClothesBlouseCompliment() : void
      {
         outputText("[pg]你拉近距离给了她一个拥抱，抚摸着她的耳朵，直到你看到她的尾巴在裙子底下左右摇摆。你告诉她，她应该对自己的品味多一点自信，她穿那件衬衫看起来就像个漂亮、天真的女孩。[pg]");
         outputText("凯丝咯咯笑着说，[say: 我猜那是个很好的伪装。]");
         if(hasCock())
         {
            outputText("抵在你" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上的凸起表明了她有多么感激你的赞美。");
         }
         else
         {
            outputText("她把骨盆在你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "上摩擦，尾巴卷在你的腰上。很明显，你的小猫喜欢被赞美。");
         }
         katSexMenu();
      }
      
      public function talkClothesBlouse() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 2)
         {
            outputText("[pg]你称赞了凯丝穿着的衬衫。");
         }
         else
         {
            outputText("[pg]凯丝从衣柜里拿出衬衫。她当着你的面表演了一出脱衣和穿衣的小把戏，没过多久，她就穿上了那套熟悉的衬衫和裙子。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,2);
         }
         outputText("她看起来有点不好意思，说道，[say:这没有你给我的那么好。这只是我在市场上看到的第一套穿在我身上还算过得去的衣服。]");
         menu();
         addButton(0,"赞美",talkClothesBlouseCompliment);
         addButton(1,"建议",talkClothesBlouseSuggest);
         if(submissiveness() > 1)
         {
            addButton(2,"坚持",talkClothesBlouseInsist);
         }
         else
         {
            addButtonDisabled(2,"坚持");
         }
      }
      
      public function talkClothes() : void
      {
         clearOutput();
         menu();
         addButton(0,"没有偏好",talkClothesNoPreference);
         addButton(1,"衬衫",talkClothesBlouse);
         if(hasClothing(4))
         {
            addButton(2,"紧身衣",talkClothesBodysuit);
         }
         else
         {
            outputText("看着你的" + catGirl("猫娘","猫科动物") + "情人，你想象着如果她那轻盈的身体被塞进那种凸显曲线的紧身衣里会是什么样子。[pg]");
            addButtonDisabled(2,"紧身衣");
         }
         if(hasClothing(8))
         {
            addButton(2,"长裙",talkClothesDress);
         }
         else
         {
            outputText("一件舞会礼服对你的" + (hasCock() ? "扶她" : "") + "爱人来说会是一件极好的礼物。你觉得凯丝，以她相当少女的眼光，一定会珍视这样女性化的衣物。[pg]");
            addButtonDisabled(2,"长裙");
         }
         if(hasClothing(16))
         {
            addButton(3,"丝绸长袍",talkClothesSSRobe);
         }
         else
         {
            outputText("一个奇怪的念头闪过你的脑海：如果你给她弄一件非常精美的丝绸长袍穿会怎么样？也许甚至是蜘蛛丝做的？那柔软、有光泽的布料" + catGirl("滑过她的肌肤会让她发狂的","会很好地衬托她的皮毛") + "。[pg]");
            addButtonDisabled(3,"丝绸长袍");
         }
         if(hasClothing(32))
         {
            addButton(4,"抹胸",talkClothesTubeTop);
         }
         else
         {
            outputText("凯丝的衣柜里需要一件抹胸。好吧——老实说她不需要那个，但你们俩都会喜欢这个结果的。[pg]");
            addButtonDisabled(4,"抹胸");
         }
         if(hasClothing(64))
         {
            addButton(5,"护士服",talkClothesNurseOutfit);
         }
         else
         {
            outputText((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) > 0 ? "你还记得当你给你的鼠娘一件那种性感的护士服时发生了什么" : "在荒野中你到处都能看到那些性感的护士服") + "。一想到把那淫秽的衣服和你的" + catGirl("猫娘","猫科") + "爱人以及她的性欲结合起来，你就不禁打了个寒颤。[pg]");
            addButtonDisabled(5,"护士服");
         }
         outputText("你决定给凯瑟琳的服装选择提点小建议。");
         addButton(14,"返回",katherineMenu);
      }
      
      public function talkCatGirl() : void
      {
         clearOutput();
         if(get_furry())
         {
            outputText("你问凯丝，现在她又变回猫人，感觉如何。[pg]");
            outputText("[say: 我想这真的让我对变形药水和物品大开眼界，]她说道。[say: 我唯一一次重大的变形经历可算不上什么好事。现在我能理解那些一瓶接一瓶灌药水，直到连生殖器、皮肤甚至体型都变了的人了。][pg]");
            outputText("你问她这是否意味着她愿意尝试更多变形的乐趣。[pg]");
            outputText("[say: 我不是说我愿意变成蜥蜴人什么的，但就褪去毛发而言？不得不说我挺喜欢的。这是我生平第一次站在阴凉处感觉到冷。作为一个完全的猫娘，街上用异样眼光看我的人变少了，这是一点，但特别是在这沙漠里，毛发少确实有好处。唯一真正的缺点是，我害羞的时候所有人都看得出来。]");
            outputText("看她的人变少真的是个优点吗？[pg]");
            outputText((isAt(1) ? "凯丝在床上挪了挪屁股，尾巴慢慢地起伏着。" : "凯丝从杯子里喝了一大口，然后给了你一个内疚的笑容。") + " [say: 我其实有点喜欢陌生人打量我，]她承认道，你怀疑在那层毛发下她正在脸红。你轻轻揉了揉她的大腿，告诉她炫耀一下也没关系。");
         }
         else
         {
            outputText("你问凯丝作为猫娘感觉如何。[pg]");
            outputText("她用手揉了揉脸颊，对你咧嘴一笑。[say: 这和我想象的完全不同。起初我真的不确定我想要这样，但我很高兴你被说服了我。我的意思是，做个猫人也没什么不好，但我喜欢现在的一些优势。][pg]");
            outputText("她花了一点时间" + (isAt(1) ? "在床上向后挪了挪，交叉起双腿" : "在座位上重新调整了一下姿势，喝了一口饮料") + "，然后继续说道。[say: 我不再掉毛了。听起来没什么，但你试试每天毯子和衣服上都沾满黑色小毛发时，还要保持公寓干净。哦，还有衣服！它们现在的感觉完全不同了。我终于明白为什么那么多无毛种族看重丝绸了；它贴在皮肤上太光滑了。但最重要的是，我黑色的毛发总是吸收阳光。如果你只是想放松一下那还好，但当你在街上巡逻时，那简直要命。][pg]");
            outputText("她露出内疚的神情，补充道，[say: 我也喜欢被关注。这个城市里有很多猫人，但我只见过几个猫娘，而且她们都像你一样，是来自另一个世界的访客。不管怎样，这让我觉得自己很特别……我有点喜欢知道人们在看我——不是因为我可能会偷他们的钱包，而是因为他们对感兴趣。他们想知道我是什么，我怎么会变成这样，也许还想知道我在床上是什么样子。]");
         }
         katherineMenu();
      }
      
      public function takeKathToTheBar() : void
      {
         outputText("[pg]你们俩挽着手臂走在特尔阿德雷的街道上。凯丝很享受这段散步，而你则在思考到了酒馆后想和她做些什么。[pg]");
         outputText("当你们走进湿身婊酒馆的大门时，凯丝在吧台停下，买了一杯" + (pregSize() > 0 ? "奶昔" : "加了冰块、看起来像奶油一样的棕色饮料") + "，然后开始奢侈地啜饮起来。[pg]");
         outputText("既然刚好有空位，你们俩就在她常坐的卡座坐下，你感觉到凯丝的腿在摩擦" + (get_player().hasTailInsteadOfLegs() ? "你的腿。" : "你的尾巴。"));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,4);
         katherineMenu();
      }
      
      public function takeKathHome() : void
      {
         outputText("[pg]你们俩穿过街道，直奔凯丝的公寓。一路上你大多让她走在前面，这样你就能好好欣赏她紧致的小屁股。[pg]");
         outputText("凯丝简直是用钥匙在攻击门锁。门一开，她就急不可耐地把你拉进去，反锁上门，带你进了卧室。[pg]");
         clothes();
         outputText("[pg]她站在床边，等着你" + (playerMaster() ? "告诉她该怎么做。" : "采取主动。"));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,1);
         katherineMenu();
      }
      
      public function suckleTacularKats() : void
      {
         clearOutput();
         get_images().showImage("katherine-suckles-you");
         outputText("感受着你的[chest]和里面乳白色的美味，你问凯瑟琳是否像她的同伴一样喜欢牛奶。当这个猫人给你一个困惑的眼神时，你脱下[armor]的上半部分，带着得意的笑容抚摸着你的乳房，告诉她你需要一点释放。[pg]");
         outputText("凯瑟琳震惊地睁大了眼睛，难以置信地笑着，");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("走到你这边的长椅上。她托起你的乳房，掂量着你储存了多少乳汁。[say:我当然喜欢牛奶。多傻的问题——而且你知道我最喜欢你的奶水了，" + playerText() + "][pg]");
            outputText("凯瑟琳开始玩弄你的乳头，用她" + catGirl("光滑的手指","指腹") + "抚摸你的乳房，导致一缕乳汁漏了出来。[pg]");
            outputText("不想再等了，你");
         }
         else
         {
            outputText("快步走过去，不耐烦地等待着，当你" + (isAt(1) ? "在她的床上摆好姿势" : "找个舒服的姿势坐下") + "。一旦你坐好，她毫不犹豫地扑通一声坐在你面前。她用脸颊蹭着你的乳房，但随后，令你惊讶的是，她害羞地退缩了。[pg]");
            outputText("[say:我……嗯……这真的可以吗？]她问道，声音几乎听不见。带着一丝恼怒，你翻了");
            if(get_player().eyes.type == 1 || get_player().eyes.count > 2)
            {
               outputText("所有的");
            }
            outputText("你的眼睛和");
         }
         outputText("温柔地捧住她的脸颊，坚持把她的头拉近，让她的嘴唇刚好碰到你的[nipples]。她明白了这明显的暗示，急切地吞咽着，闭上眼睛凑近开始吸吮。她满足地发出呼噜声，将最美妙的震动传递到你的乳房，她粗糙、长满倒刺的舌头抚摸和爱抚着，帮助诱导你的身体交出甜美、浓郁的乳汁。[pg]");
         outputText("你不确定你抱着她坐在那里多久了，只是听着她安静地吸吮和啜饮时的呼噜声，喝下你所能给予的一切。她");
         if(!get_player().hasPerk(PerkLib.Feeder) && get_player().lactationQ() < 1000)
         {
            outputText("吸空了");
         }
         else
         {
            outputText("尽力吸空");
         }
         outputText("你的第一个乳房，然后转移到下一个。最后，她喝");
         if(!get_player().hasPerk(PerkLib.Feeder) && get_player().lactationQ() < 1000)
         {
            outputText("干了你");
         }
         else
         {
            outputText("了你似乎取之不尽的乳汁，以至于她身体上无法再喝下去了");
         }
         outputText("，她伴随着一声响亮的“啵”声松开了你的乳头。");
         if(get_player().lactationQ() >= 500)
         {
            if(get_player().lactationQ() < 1000)
            {
               outputText("她因为喝了太多而挺着一个明显的奶肚子。");
            }
            else if(get_player().lactationQ() < 2000)
            {
               outputText("她喝得太多了，看起来简直像怀孕了一样，但她似乎并不在意。");
            }
            else
            {
               outputText("凯瑟琳现在看起来更像个气球而不是猫，她的肚子因为这顿海量的液体大餐而高高隆起。当她移动并因此晃动身体时，你能听到她胃里的东西在轻轻晃荡。");
            }
         }
         outputText("你带着坏笑，问她帮你解决了这个小小的产奶问题后感觉好不好。[pg]");
         outputText("这只猫" + (hasCock() ? "扶她" : "娘") + "从你的怀抱中挣脱出来，依偎着你，用鼻子蹭着你的脖子，把下巴靠在你的肩膀上。然后她打了个响亮的嗝，回声在");
         if(isAt(1))
         {
            outputText("卧室墙壁");
         }
         else if(isAt(0))
         {
            outputText("小巷墙壁");
         }
         else
         {
            outputText("酒吧墙壁");
            if(get_game().time.hours >= 8 && get_game().time.hours <= 16 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 0)
            {
               outputText("间回荡。你注意到" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0 ? "那个巨乳猫娘" : "妮芙") + "正嫉妒地揉着自己的乳房");
            }
         }
         outputText("。[say: 感觉棒极了，]凯瑟琳毫不掩饰地告诉你。[saystart]我必须说，我以前也喝过别人的奶……但没人的奶能像你的一样美味");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1069) != 0)
         {
            outputText("……也许除了那个修女");
         }
         outputText("！[sayend][pg]");
         outputText("你对这番奉承报以微笑，帮这只吃得饱饱的猫从你腿上下来，然后安静地穿好上衣，走上街头。[pg]");
         dynStats(DynStat.Sens(-2),DynStat.Lust(-40));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         get_player().milked();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckleMenu() : void
      {
         menu();
         addButton(0,"她来吮吸",suckleTacularKats);
         addButton(1,"你来吮吸",suckleFromKath);
         addButton(14,"返回",katSexMenu);
      }
      
      public function suckleFromKath() : void
      {
         clearOutput();
         outputText("你对凯丝笑了笑，问她有没有什么想“吐露心声”的。[pg]");
         if(isAt(4))
         {
            outputText("她立刻明白了，回以微笑，双手下意识地托住她的");
         }
         else if(isAt(5) || isAt(6))
         {
            outputText("她那被酒精麻痹的大脑花了几秒钟才明白你的意思，这时她抓住了她的");
         }
         else if(isAt(1))
         {
            outputText("她咧嘴一笑，故意托起她的");
         }
         else
         {
            outputText("她上下打量了一下小巷，然后坐在一个方便的板条箱上。她的双手下意识地托住她的");
         }
         if(get_breasts().get_lactationLevel() == 1)
         {
            outputText(get_breasts().adj() + "的乳房。[pg]");
            if(!milkOption(1))
            {
               outputText("[say: 抱歉，" + playerText() + "，我好像没奶了。我甚至都没注意到自己快干了，然后有一天我的乳房就感觉没那么胀了。][pg]");
               outputText("她看起来有些担忧，可能怕你会对她不高兴，但随后她又振作起来补充道，");
               milkOptionSet(1);
            }
            outputText("[say: 我相信只要你多吸吸，我的乳房就会得到暗示，然后我就会重新为你产奶的。][pg]");
         }
         else if(get_breasts().milkIsOverflowing())
         {
            if(get_breasts().get_lactationLevel() >= 4)
            {
               outputText(get_breasts().adj() + "、充满乳汁的乳房。[pg]");
               outputText("你可以看到凯瑟琳的乳房漏出大量乳汁留下的明显污迹。你最喜欢的" + catGirl("猫娘","小猫") + "身上甚至散发着奶香。[pg]");
               outputText("[say: 是的，是的，是的！哦，" + playerText() + "，我好胀。我里面全是奶水，这都是因为你。请" + (playerMaster() ? "把我吸干吧，[master]，别让我这样难受。" : "帮帮我。") + "][pg]");
            }
            else
            {
               outputText(get_breasts().adj() + "、充满乳汁的乳房。[pg]");
               outputText("[say: 哦，谢谢你！我正需要这个，我总是胀得满满的。如果我再多存点奶，我简直得找个人来喂了。][pg]");
            }
         }
         else if(get_breasts().milkIsFull())
         {
            outputText(get_breasts().adj() + "的乳房。[pg]");
            outputText("[say: 嗯——我一直盼着你能顺道过来。当我的乳房胀满时，我的乳头就会变得坚挺又敏感，就像它们渴望被关注一样。][pg]");
         }
         else
         {
            outputText(get_breasts().adj() + "的乳房。[pg]");
            outputText("[say: 我其实并不<b>需要</b>挤奶……但我永远不会拒绝你" + (playerMaster() ? "，[master]" : "") + "——尤其是当你主动提出要吸我的乳头时。][pg]");
         }
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("你站起身，走到卡座凯瑟琳的那一边。你还没来得及坐下，凯丝就已经开始" + clothesChoice("脱下她的衬衫","从紧身衣的上半部分挣脱出来","解开她裙子的紧身胸衣","解开她丝绸长袍的上衣","脱下她的抹胸","脱下她的护士服") + "了。凯丝甩动的尾巴告诉你，当她终于脱下胸罩露出胸部时，她是多么的兴奋。[pg]");
         }
         else if(isAt(1))
         {
            outputText("凯丝在" + clothesChoice("脱下她的衬衫","从紧身衣的上半部分挣脱出来","解开她裙子的紧身胸衣","解开她丝绸长袍的上衣","脱下她的抹胸","脱下她的护士服") + "时，还稍微卖弄了一下风骚。凯丝甩动的尾巴告诉你，当她终于脱下胸罩露出胸部时，她是多么的兴奋。[pg]");
         }
         else
         {
            outputText("凯丝脱下她的胸甲，又对你笑了笑。你能看出她有些担心喂你奶时被抓包，尽管这甚至算不上特尔阿德雷的市民在街头见过的最下流的事。最后，她的胸罩脱落，乳房毫无遮掩地暴露在空气中。[pg]");
         }
         if(get_player().cor < 25)
         {
            outputText("你温柔地将凯丝的双手引导到她身体两侧。她向后靠去，心甘情愿地让你占据主导。你双手托住她的乳房，用拇指抚摸着她的乳头。它们一开始就是挺立的，但现在变成了更深的粉红色，乞求着更多的关注。当你用嘴唇封住她的" + (Utils.rand(2) == 0 ? "左" : "右") + "乳头时，凯丝闭上眼睛，发出了呼噜声。[pg]");
            outputText("你按摩着她" + get_breasts().adj() + "的乳房，");
            if(get_breasts().get_lactationLevel() == 1)
            {
               outputText("温柔地吸吮着，享受着凯瑟琳浓郁醇厚的乳汁。如果你继续这样下去，希望不久的将来凯丝的乳房能充满更多的奶水。");
            }
            else if(get_breasts().milkIsOverflowing() && get_breasts().get_lactationLevel() >= 4 || get_breasts().milkIsFull() && get_breasts().get_lactationLevel() >= 6)
            {
               outputText("哄诱它们放松，释放出浓稠的乳白色宝藏。你不停地喝着，对凯瑟琳能产出如此大量的奶水感到惊讶。");
               if(get_breasts().get_lactationLevel() >= 5)
               {
                  outputText("确信自己无法全部喝完，你在第一个乳头干涸之前就换到了另一个乳头上。");
               }
            }
            else
            {
               outputText("哄骗它们放松，释放出浓郁的奶油宝藏。你不停地喝着，试图享受凯瑟琳能产出的每一滴。");
            }
            if(get_breasts().get_lactationLevel() >= 2)
            {
               get_player().refillHunger(get_breasts().get_lactationLevel() * 15);
            }
            outputText("[pg]凯丝只是发出咕噜声，享受着你的服侍，对周围的世界浑然不觉。[pg]");
         }
         else if(get_player().cor < 75)
         {
            outputText("你急切地推开凯丝的手，换上自己的手。她向后靠去，眼神中乞求着更多。你揉捏着她的乳头，轻轻挤压她的乳房" + (get_breasts().milkIsFull() ? "，看着奶油般的液滴从她的胸前倾泻而下。你对她露出恶魔般的笑容，然后" : " 接着") + "将嘴唇贴在她的" + (Utils.rand(2) == 0 ? "左" : "右") + "乳头上。当你开始吸吮时，凯丝叹了口气。[pg]");
            outputText("你抚摸着她" + get_breasts().adj() + "的乳房");
            if(get_breasts().get_lactationLevel() == 1)
            {
               outputText("并用力吸吮，渴望带回她那天堂般的奶油。[pg]");
            }
            else if(get_breasts().milkIsOverflowing() && get_breasts().get_lactationLevel() >= 4 || get_breasts().milkIsFull() && get_breasts().get_lactationLevel() >= 6)
            {
               outputText("并用力吸吮，渴望吸出她每一滴奶油般的美味。凯瑟琳沉甸甸的乳头给你的比你能承受的还要多。");
               if(get_breasts().get_lactationLevel() >= 5)
               {
                  outputText("确信自己无法全部喝完，你在第一个乳头干涸之前就换到了另一个乳头上。");
               }
            }
            else
            {
               outputText("并用力吸吮，渴望吸出她每一滴奶油般的美味。凯瑟琳沉甸甸的乳头满足了你所有的渴望，你用舌头表达了你的感激之情。");
            }
            if(get_breasts().get_lactationLevel() >= 2)
            {
               get_player().refillHunger(get_breasts().get_lactationLevel() * 15);
            }
            outputText("[pg]至于凯丝，当你不够温柔时，她只会发出小小的“哦”和“啊”的声音。她显然很享受，似乎对周围的世界浑然不觉。[pg]");
         }
         else
         {
            outputText("你抓住她的手，把它们压在她的身体两侧，让凯丝知道你才是主导者。");
            if(get_breasts().get_lactationLevel() == 1)
            {
               outputText("所以她的身体决定停止分泌奶油了，是吗？你知道该怎么解决！你开始用拇指和手指揉搓她的乳头，用力拉扯和捏掐，让凯瑟琳发出小小的呜咽声。你揉捏着她的乳肉，提醒她这是用来做什么的。最后你含住她的" + (Utils.rand(2) == 0 ? "左" : "右") + "乳头，开始用力吸吮。[pg]");
               outputText("你揉捏着她" + get_breasts().adj() + "的乳房，希望通过足够的粗暴对待能迫使它们重新开始分泌。[pg]");
            }
            else if(get_breasts().milkIsOverflowing() && get_breasts().get_lactationLevel() >= 4 || get_breasts().milkIsFull() && get_breasts().get_lactationLevel() >= 6)
            {
               outputText("你托起她沉甸甸的乳房，挤压了一下，让里面的东西流动起来。");
               if(get_breasts().get_lactationLevel() >= 5)
               {
                  outputText("令人惊讶的是，大量的奶油流过你的手，顺着她的胸前滴落。凯丝发出呜咽声，你决定看看这些乳房能做到什么程度。更用力、更刻意的挤压带来了另一股奶油的洪流，浸透了凯丝和她的衣服。你笑着含住");
               }
               else
               {
                  outputText("一股不错的奶油流过你的手，顺着她的胸前滴落。凯丝发出呜咽声，你尝试更用力、更刻意地挤压，但结果并不比之前更令人印象深刻。不过，它闻起来很香，所以你用力捏了捏凯丝的乳头，然后含住");
               }
               outputText("她的" + (Utils.rand(2) == 0 ? "左" : "右") + "乳头，准备认真开始你的盛宴。[pg]");
               outputText("你揉捏着她" + get_breasts().adj() + "的乳房，迫使奶油般的美味进入你的嘴里。");
               if(get_breasts().get_lactationLevel() >= 5)
               {
                  outputText("你对凯丝的产奶量感到满意，她过度活跃的乳房容纳了比你能承受的更多的奶油。你让奶油从嘴角流下，吸干每一滴，鼓励凯丝的乳房继续保持良好的工作状态。");
               }
            }
            else
            {
               outputText("你托起她的乳房，挤压了一下，让里面的东西流动起来。几滴小猫奶油出现在她的乳头尖端，你用舌头舔掉了。凯瑟琳满足地叹了口气，所以你用力捏了捏她的乳头，提醒她正在和谁打交道。她发出一声可爱的小呜咽，你含住她的" + (Utils.rand(2) == 0 ? "左" : "右") + "乳头，准备认真开始你的盛宴。[pg]");
               outputText("你揉捏着她" + get_breasts().adj() + "的乳房，迫使那香甜的乳汁流入你的口中，凯丝那多汁的乳头也没有让你失望。");
            }
            if(get_breasts().get_lactationLevel() >= 2)
            {
               get_player().refillHunger(get_breasts().get_lactationLevel() * 15);
            }
            outputText("[pg]凯丝扭动着身体，发出哀怨的喵喵声，但你并没有放慢速度。她需要认清自己的位置，而且你知道，痛苦与快乐的感觉是交织在一起的。过了一会儿，凯丝放松下来，她喵喵叫的音调也降了八度。你这只顺从的小猫终于开始享受了，于是你轻咬她的乳头以示赞许。[pg]");
         }
         var _loc1_:Boolean = get_breasts().get_lactationLevel() == 1;
         if(get_breasts().milked() && _loc1_)
         {
            outputText("就在你准备停下的时候，你尝到了一丝乳汁的味道。又吸吮了一会儿后，你确信了；凯瑟琳又开始产奶了。[pg]");
            outputText("凯丝用一种昏昏欲睡、充满幸福感的语调说道，[say: 嗯……你想要我的奶水吗？我很乐意效劳。][pg]");
            outputText("为了确保她不会干涸，你又吸吮了几分钟，在两个乳头之间来回切换，同时你的手指挑逗着她" + get_breasts().adj() + "的乳房敏感的下侧。");
         }
         outputText("当你终于松开时，凯丝满足地叹了口气。[saystart]谢谢" + (playerMaster() ? "你，[master]" : "，[name]"));
         if(get_breasts().get_lactationLevel() == 1)
         {
            outputText("，我希望我能再次开始产奶，真遗憾你付出了这么多努力却没有得到回报，[sayend]她一边揉着酸痛的乳头一边说道" + (isAt(1) ? "" : "，然后把衣服穿好") + "。");
            if(isAt(1))
            {
               outputText("没过多久，她的头就开始耷拉下来，整个身体也跟着倒向了床垫。[pg]");
            }
         }
         else if(get_breasts().milkIsOverflowing())
         {
            outputText("，这正是我需要的，[sayend]她嘟囔着，然后睡着了。");
            if(isAt(4) || isAt(5) || isAt(6))
            {
               if(get_player().cor < 75)
               {
                  outputText("你把凯丝紧紧抱在怀里，这样她就不会在湿漉母狗酒吧里向所有人走光了。");
               }
               else
               {
                  outputText("你让她的乳房暴露在外，并调整了她的肩膀，让她的胸部展现在所有人面前。你得到了一些赞赏的微笑和举杯致意，因为酒客们把凯丝" + get_breasts().adj() + "的乳房深深印在了脑海里。");
               }
               outputText("小睡了一会儿后，她醒了过来，打量着酒吧。她穿上" + clothesChoice("她的胸罩和衬衫","她的胸罩并扭动着穿回紧身衣","她的胸罩并系好裙子的紧身胸衣","她的胸罩并合上长袍","她的胸罩和抹胸","她的胸罩和护士服") + (get_player().cor < 75 ? "" : "，看起来有点不好意思") + "。[pg]");
            }
            else if(isAt(1))
            {
               outputText("[pg]");
            }
            else
            {
               outputText("因为她还在执勤，你不得不把她推醒。她看起来有些困惑和迷茫，直到你把她的胸甲塞进她手里。凯瑟琳这才恍然大悟，迅速穿好了制服。[pg]");
            }
         }
         else if(get_breasts().milkIsFull())
         {
            outputText("，这正是我需要的，[sayend]她说道，听起来很累，但依然很开心。");
            if(!isAt(1))
            {
               outputText("大约一分钟后，她想起了自己的羞耻心，把衣服穿好了。[pg]");
            }
         }
         else
         {
            outputText("，这正是我想要的，[sayend]她说道，同时" + (isAt(1) ? "" : "穿好衣服并") + "依偎在你怀里。[pg]");
            if(isAt(1))
            {
               outputText("没过多久，她的头就开始耷拉下来，整个身体也跟着倒向了床垫。[pg]");
            }
         }
         if(isAt(4) || isAt(5) || isAt(6))
         {
            if(get_game().time.hours >= 8 && get_game().time.hours <= 16 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 0)
            {
               outputText("你注意到" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,446) == 0 ? "那个巨乳猫娘" : "妮芙") + "正羡慕地揉着自己的乳房。");
            }
            outputText("不幸的是你还有地方要去，还有传送门要检查。你给了凯瑟琳一个吻，轻轻抚摸了一下她的尾巴，然后回到了营地。");
         }
         else if(isAt(1))
         {
            outputText("你微笑着看着你的爱人，她仍然半裸着，慢慢地在床上舒展开来。她看起来如此平静和天真。[pg]");
         }
         else
         {
            outputText("当她看到小巷尽头巡逻队的其他成员时，她跳了起来，抓起她的东西，在你脸颊上快速啄了一下。她离开时说道，[say:我得走了——但再次感谢。去酒吧、我家，或者随便哪里找我，只要请你尽快再来看我。][pg]");
         }
         dynStats(DynStat.Lust(15));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckedNFuckedByKat() : void
      {
         clearOutput();
         var _loc1_:Boolean = hasAlready(64);
         var _loc2_:int = get_player().biggestCockIndex();
         get_images().showImage("katherine-suck-and-fucks-you");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            letKatKnotYouCommonDialogue(true);
         }
         outputText("当你蹲下身，正想着要怎么让你的双性人爱人上你时，你突然感觉到凯瑟琳的手指在抚摸你的" + get_player().cockDescript(_loc2_) + "，这让你吓了一跳。[pg]");
         outputText("[say: 嗯……我觉得你值得一些特别的奖励，亲爱的。" + (isAt(1) ? "躺在床上" : "翻个身躺平") + "……] 凯瑟琳发出呼噜声，抚摸着你，让你尽可能地硬起来，然后才放开你。[pg]");
         var _loc3_:String = isAt(1) ? "躺在床上，头枕着枕头，阴茎指着天花板" : "翻过身躺平，阴茎指着天空";
         var _loc4_:String = get_player().hasTailInsteadOfLegs() ? "尾巴平放" : "双腿张开";
         outputText((_loc1_ ? "知道" : "好奇") + "她想干什么，你乖乖照做，" + _loc3_ + "，" + _loc4_ + "。凯瑟琳向你走来，跪下身，越过你的肚子，微笑着抚摸你的[chest]。[say: 你对我来说很特别，你知道吗？为了证明这一点，我要让你好好爽一爽……] 她咧嘴一笑，舌头舔过嘴唇，带着夸张的期待。[pg]");
         outputText("你看着她从坐着的地方弯下腰，直到能舔到你的" + get_player().cockDescript(_loc2_) + "，她那长长的猫科动物舌头在上面上下舔舐，逗弄着龟头。这种感觉很奇妙；毛茸茸的，但不尖锐，就像同时被许多小舌头抚摸一样。前列腺液像地下泉水一样从你的阴茎尖端流出，你的猫科动物爱人明显在品尝这味道，然后直起身子，咂了咂嘴，对你的抗议报以微笑。[pg]");
         outputText("[say: 调皮，调皮；你忘了这次是谁在操谁了吗？] 她对你发出呼噜声，一只手向前滑去，抚摸着");
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]");
         }
         else
         {
            outputText("你的屁股沟");
         }
         outputText("。她抓住你的[hips]，将她的阴茎" + cockMultiple("","s") + "向前滑动，直到停在你的");
         if(get_cockNumber() > 1 && get_player().hasVagina())
         {
            outputText("[vagina]和[asshole]");
         }
         else
         {
            outputText(get_player().assholeOrPussy());
         }
         outputText("的入口处。她沾了一点你阴茎上流出的前列腺液，涂在她的阴茎" + cockMultiple("","s") + "上。然后，她毫不迟疑地滑进了你的体内。");
         if(get_player().hasVagina())
         {
            if(get_cockNumber() > 1)
            {
               get_player().buttChange(cockArea(),true,true,false);
            }
            get_player().cuntChange(cockArea(),true,true,false);
         }
         else
         {
            get_player().buttChange(cockArea(),true,true,false);
         }
         outputText("[pg]");
         outputText("[say: 那么，让我们来试试这个……] 她喃喃自语，开始在你体内缓慢地前后摇摆，将她的阴茎" + cockMultiple("","s") + "抽出，然后用力插到底，她的龟头结" + cockMultiple("","s") + "开始肿胀，以恰到好处的方式撑开你……如果她不是动得这么慢，那就太棒了。但当你对速度的抱怨还没说出口，她又弯下腰，开始舔你的" + get_player().cockDescript(_loc2_) + "，舌头在上面绕了几圈，然后把它含进嘴里，吞下你一寸又一寸的肉棒，直到她的鼻子紧紧贴在你的小腹上。她发出一声闷哼，可能是[say: 好了，] 然后试图在加快抽插速度的同时，吸吮和舔弄你的" + get_player().cockDescript(_loc2_) + "。[pg]");
         outputText("你现在可没资格抱怨。这感觉……太不可思议了！她含着你阴茎的嘴又热又湿，舌头在你的肉棒下方滑动，带来人类无法比拟的快感，贪婪地吸吮着你，渴望得到你的一切。同时，她把你的小穴撑得");
         if(get_player().hasVagina() && get_cockNumber() > 1)
         {
            outputText("");
         }
         outputText("满满的，龟头结");
         if(get_player().hasVagina() && get_cockNumber() > 1)
         {
            outputText("");
         }
         outputText("在你体内膨胀，将你们紧紧连在一起。你前后摇摆，笨拙地挺动臀部，试图尽可能用力地操和被操，并感觉到那无比甜美的释放感在");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]里");
         }
         else
         {
            outputText("你的脊椎底部");
         }
         outputText("沸腾……[pg]");
         outputText("但凯瑟琳先高潮了。伴随着一声压抑的欢呼，她用她的精液淹没了你的小穴");
         if(get_player().hasVagina() && get_cockNumber() > 1)
         {
            outputText("");
         }
         outputText("，将滚烫的猫精喷射进你的深处。你的肚子开始因为精液而膨胀，鼓起了一个明显的肚子");
         if(cumQ() > 500)
         {
            outputText("而且它并没有停止，越来越大，直到你看起来像怀孕了并且准备分娩");
         }
         if(cumQ() > 1500)
         {
            outputText("而她的" + (hasBalls() ? "肿胀的睾丸继续喷射；当它们终于干涸时" : "巨大的前列腺继续喷射；当它终于干涸时") + "，你的肚子因为沉积的精液而变得如此沉重，以至于你看起来像怀了三胞胎");
         }
         outputText("。她发出一声幸福的呻吟，向前瘫倒，在她的高潮中耗尽了体力。[pg]");
         outputText("然后轮到你高潮了，用你的精液淹没了那只受惊、毫无防备的猫的嘴，让她迅速吞咽以咽下它。");
         if(get_player().cumQ() <= 250)
         {
            outputText("她津津有味地喝下每一滴，湿漉漉地从你的阴茎上弹开，舔着嘴唇，发出清晰的满足的呼噜声。");
         }
         else if(get_player().cumQ() <= 600)
         {
            outputText("她拼命地吞咽着，肚子因为精液的涌入而膨胀，但还是设法避免洒出任何东西，一旦她认为你结束了，她就挣脱出头来，大口喘气。");
         }
         else
         {
            outputText("你可以看到她对从你的" + get_player().cockDescript(_loc2_) + "中喷涌而出的巨大液体瀑布感到一丝恐慌，但这种恐慌被突然的坚定决心所淹没，她决心喝下每一滴。她的肚子像瀑布中的水袋一样膨胀起来，精液从她不堪重负的嘴里流出，但她还是设法避免拔出你的阴茎，直到你结束。然后她虚弱地设法将自己分离，给了你一个胜利的表情，并打了一个微弱的嗝。[pg]");
         }
         outputText("伴随着一声呻吟，她任由自己倒在你身上，");
         if(cumQ() <= 500)
         {
            if(get_player().cumQ() <= 250)
            {
               outputText("让你们肚子贴着肚子躺着");
            }
            else
            {
               outputText("她那充满精液的肚子在你的平坦的躯干上发出清晰的挤压声");
            }
         }
         else if(get_player().cumQ() <= 250)
         {
            outputText("让你那充满精液的肚子在压力下发出湿漉漉的挤压声");
         }
         else
         {
            outputText("你们互相肿胀的肚子在缓冲冲击时翻滚和起伏");
         }
         outputText("。[say: 真是一次奇妙的经历，不是吗？] 她咧嘴一笑，手试探性地向你的手挪去。[pg]");
         outputText("你将她的手指与你的手指交织在一起，并同意这是一次奇妙的经历。[pg]");
         outputText("一旦她的结");
         if(get_cockNumber() > 1 && get_player().hasVagina())
         {
            outputText("");
         }
         outputText("瘪了，你们分开，你清理干净自己，穿好衣服，然后走出去" + (isAt(1) ? "，留下凯丝在她的床上昏睡。" : "到街上。"));
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,403,FlagDict_Impl_.arrayReadInt(_loc5_,403) + 1);
         experience(64);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckNFuck() : void
      {
         var _loc1_:int = get_player().cockThatFits(70);
         clearOutput();
         get_images().showImage("katherine-fuck-and-suck");
         outputText("你仔细考虑了一下，然后发现你的目光飘向了凯瑟琳的包皮和里面的" + cockType() + "肉棒。");
         if(hasAlready(2))
         {
            outputText("当她蜷缩起来吞下自己的肉棒时，那景象真是太壮观了，所以你问她是否想再来一次边吸边操。[pg]她的眼睛亮了起来，她的肉棒" + cockMultiple("","们") + "也因为这个建议而跳动起来。她心不在焉地用手指绕着她的肉结" + cockMultiple("","们") + "画圈，说道，[say: 当然，我愿意。]");
         }
         else
         {
            outputText("回想起你是如何帮助这个可怜的双性人缩小她那怪物般的肉结" + cockMultiple("","们") + "的，并记起你见过的猫的柔韧性，你脑海中浮现出一个非常变态的想法。你问凯瑟琳是否愿意尝试一下边吸边操。[pg][say: 你说什么？]她挑起一根眉毛问道。你迅速解释了这个想法：在你插入她阴道的同时，她对自己的肉棒进行口交。听到这，她的眼睛亮了起来。[say: 听起来很变态——但也很有创意！当然，我愿意。]");
         }
         outputText("她笑了笑，然后");
         if(isAt(0))
         {
            outputText("转过身来，这样她就坐在了板条箱上，而不是靠在上面");
         }
         else
         {
            outputText("坐在她的床上，张开双腿");
         }
         outputText("。");
         outputText("[pg]她依然微笑着，开始轻轻抚摸她的包皮" + (hasBalls() ? "、蛋蛋" : "") + "和小穴，哄诱出她的" + cockType("狗","猫") + "肉棒" + cockMultiple("","们") + "。在确保自己的姿势不会在做到一半时摔下来后，她抓住自己的大腿，弯下腰……再弯……直到她的鼻子几乎贴到了自己的胯部。");
         if(!get_player().hasPerk(PerkLib.Flexibility))
         {
            outputText("这景象足以让你的脊椎因为同情而退缩。");
         }
         else
         {
            outputText("你看着她是如何做到的，决定测试一下自己的身体，看看你是否也能弯成那样。");
         }
         outputText("放松下来后，她挺直了背，直到她的嘴悬停在她的" + cockMultiple("","最上面的") + cockType("狗","猫") + "肉棒尖端前。她那像猫一样的舌头，又长又平，看起来毛茸茸的，伸出来舔舐那" + cockType("橡胶般的锥形","狭窄的带刺") + "尖端，在周围吸吮着，把它弄得又滑又亮。然后，她张开嘴，再次开始向前弯腰，吞下所有" + get_cockLength() + "英寸的" + cockType("狗","猫") + "肉棒，直到她到达肉结。犹豫了片刻，为了鼓起勇气，然后她把它也吞没了，把鼻子平压在自己的" + (hasBalls() ? "阴囊" : "会阴") + "上。[pg]");
         outputText("这是你的时刻，你走上前，温柔但坚定地抓住她的大腿，将你的" + get_player().cockDescript(_loc1_) + "抵在她流着口水的小穴上。确定位置后，你把它滑了进去。当你将自己插入她那光滑、天鹅绒般、滚烫的下体嘴唇时，她浑身发抖，并大声地吸吮着她的肉棒。你拔出来，再次用力插入，同时她也开始上下摆动头部。[pg]");
         outputText("一开始有些尴尬，你们俩试图建立相互补充的节奏。她在喉咙里发出嗡嗡声和隆隆声，努力从她的男性生殖器中获得最大的快感，即使你的抽插和挺动让她的阴道发出吸吮和吧唧声，她丰富的润滑液溅在你的肉棒上");
         if(get_player().balls > 0)
         {
            outputText("、你的蛋蛋，");
         }
         outputText("以及你的大腿内侧。但是，随着你继续动作，你找到了节奏，这变得更加令人愉悦。[pg]");
         outputText("这淫靡的场景简直无法用言语来形容；她那火热湿润的肉壁像丝绸做成的台钳一样紧紧包裹着你的肉棒，她的头就在你面前上下起伏，嘴里含着自己的肉棒发出咕噜咕噜的声音" + cockMultiple("","，她下方的肉棒在你们之间挥舞，仿佛在指挥这场表演") + "。你越来越用力地挺进；你能感觉到高潮即将来临……但她却先一步到了。伴随着一声闷哼，她的淫水从小穴中喷涌而出，溅了你一肚子。她的叫声戛然而止，嘴唇和脸颊明显鼓了起来，因为她的龟头结突然膨胀，将她的肉棒卡在自己的嘴里，迫使她喝下每一滴精液，因为她的蛋蛋正将存货全部释放进她的嘴里。");
         var _loc2_:Number = cumQ();
         var _loc3_:Number = get_player().cumQ();
         if(_loc2_ <= 500)
         {
            outputText("她大口吞咽了几次，大声地喝着，直到蛋蛋被榨干，但即便如此，她仍然被锁在原地，膨胀的龟头结将她卡住，直到她完全高潮结束。");
         }
         else if(_loc2_ <= 1500)
         {
            outputText("她不得不快速吞咽，以免被自己大量的精液呛到，但最终，随着肚子开始鼓起，她把它们全喝光了。");
         }
         else
         {
            outputText("她神情慌乱地不断吞咽，你甚至忍不住产生了一个可怕的想法：她会不会被自己的精液淹死。但是，随着她的肚子隆起，看起来就像真的怀孕了一样，她的蛋蛋停止了颤抖，她终于结束了，喘着粗气，用鼻子深深地、感激地呼吸着。");
         }
         outputText("[pg]");
         outputText("现在，终于轮到你高潮了，伴随着一声响亮的呻吟，你释放在了她的体内。");
         if(_loc3_ <= 250)
         {
            outputText("你将你所有的精华都喷射进她那泥泞湿透的小穴里，让它与已经从她裂口中滴落的其他体液混合在一起。");
         }
         else if(_loc3_ <= 750)
         {
            if(_loc2_ <= 500)
            {
               outputText("当你的精液淹没她的子宫时，她的肚子鼓了起来，因为你的努力而明显膨胀。");
            }
            else
            {
               outputText("当你结束时，她看起来就像快要临盆一样，她的肚脐甚至开始擦到她的下巴。");
            }
         }
         else if(_loc2_ <= 500)
         {
            outputText("你不寻常的高潮让她明显变得臃肿膨胀，肚子肿胀圆润，贴合着她身体的曲线。");
         }
         else
         {
            outputText("这只双性猫娘看起来很惊慌，因为你不断地将一股又一股的精液注入她的体内，她的子宫在膨胀，而她的皮肤已经因为她自己排入胃里的大量精液而撑开。她的肚子越来越大，直到明显地挤压着她的脖子和上半身，她自己的身体形成了一道坚不可摧的屏障，让它无处扩张，压力让你的精液喷射而出，溅得到处都是，洒满了");
            if(isAt(0))
            {
               outputText("小巷。");
            }
            else
            {
               outputText("她公寓的地板。");
            }
         }
         outputText("[pg]");
         outputText("高潮结束后，你拔了出来");
         if(_loc3_ > 250)
         {
            outputText("，任由精液像微型变态瀑布一样从她的小穴中倾泻而下，");
         }
         outputText("然后退后一步喘口气。你对她的微笑，最初是满意的释然，但当你意识到她仍然被龟头结卡住，堵在自己的嘴里时，变成了苦笑。她尽力看着你，眨了眨眼。你带着温柔的表情走近，伸出手抚摸她的耳朵；没有任何性意味，只是温柔和放松。她闭上眼睛，明显地迎合着你的抚摸。[pg]");
         outputText("你就这样待着，直到她的龟头结缩小，伴随着一声湿润的“啵”声，她松开了自己。[say: " + (hasAlready(2) ? "我的玛莱啊，这感觉太棒了" : "天哪，这可真了不得") + "，]她用惊叹的语气说道");
         if(_loc2_ > 500 || _loc3_ > 250)
         {
            outputText("，拍了拍她");
            if(_loc2_ > 1500 || _loc3_ > 750)
            {
               outputText("高高");
            }
            outputText("肿起、充满精液的肚子以示强调");
         }
         outputText("。[say: 只要你准备好了，我随时愿意再来一次。][pg]");
         outputText("你向她保证你会记住的。穿好衣服后，你向她道别，回到了特尔阿德雷的街道上。[pg]");
         get_player().orgasm("Dick");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,403,FlagDict_Impl_.arrayReadInt(_loc4_,403) + 1);
         experience(2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function submissiveness() : int
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1227);
         var _loc2_:int = 0;
         if((_loc1_ & 1) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 2) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 4) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x10) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x20) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x40) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x80) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x0200) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x0400) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x0800) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x1000) > 0)
         {
            _loc2_ += 2;
         }
         if((_loc1_ & 0x2000) > 0)
         {
            _loc2_++;
         }
         if((_loc1_ & 0x0100) > 0 || get_noFur() && _loc2_ > 2)
         {
            _loc2_++;
         }
         if(_loc2_ < 4 && (_loc1_ & 0x4000) > 0)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function skirtDescription() : String
      {
         if(canWearMiniSkirt())
         {
            return " 它的长度足以成功掩盖她男性的特征。";
         }
         if(get_cockLength() < 18)
         {
            return " 它并不能完全转移你对她胯部那不太淑女的凸起的注意力。";
         }
         return " 它几乎掩盖不住前面撑起的巨大凸起。";
      }
      
      public function set_knotSize(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,401,param1);
         return param1;
      }
      
      public function set_hairColor(param1:String) : String
      {
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1223,param1);
         return param1;
      }
      
      public function set_furry(param1:Boolean) : Boolean
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1224,param1 ? 0 : 1);
         return param1;
      }
      
      public function set_fertile(param1:Boolean) : Boolean
      {
         return param1;
      }
      
      public function set_cockNumber(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,399,param1);
         return param1;
      }
      
      public function set_cockLength(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,400,param1);
         return param1;
      }
      
      public function set_ballSize(param1:int) : int
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,402,param1);
         return param1;
      }
      
      public function secondTalkWithKatherine() : void
      {
         clearOutput();
         katherineSprite();
         outputText("走了一小段路，你们就到了那家餐厅。你找了个位子坐下，问凯瑟琳想吃点什么。她毫不犹豫地说：[say: 奶昔！哦，我已经好久好久没喝过了。]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         outputText("你本希望能在吃饭时和她聊聊天，但奶昔一端上来，凯丝就津津有味地喝了起来。不到一分钟，整杯奶昔就被喝光了，凯丝有些不好意思地看着你，一边擦去嘴边那圈小小的奶泡胡子。[say: 抱歉，我真的很需要这个。] 她环顾四周，补充道：[say: 而且，也许我们可以换个地方聊。]");
         outputText("[pg]环顾餐厅，你明白了她的意思。她那身破旧的衣服就像守卫徽章一样显眼。凯瑟琳和其他流浪者在这里并不受欢迎，餐厅之所以容忍她，只是因为你看起来很体面。");
         outputText("[pg]你迅速结完账，凯瑟琳带着你回到了街上。不知为何，她看起来既兴奋又紧张，尽管你不太清楚原因。她很快在两栋建筑之间一条被砖墙封死的小巷里找到了一个安静的角落。她坐在一个破旧桌子的边缘，显得有些局促不安。");
         doNext(firstTimeWithKatherineUTerribleScrub);
      }
      
      public function repeatAmbushKatherineRecruitMent() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_vagrant_cats());
         outputText("当你走在特尔阿德雷的街道上时，一个熟悉的景象吸引了你的目光。在附近的一条小巷里，一个看起来很年轻的猫人女孩正被三个高大的猫人男子逼到角落里。虽然你仍然不知道这个女孩的名字，但你记得这个套路。");
         outputText("[pg]是的，那里有足够多的破旧板条箱，可以隐藏三四个埋伏的猫人。你没看到凯丝，但你");
         if(get_player().cor < 75)
         {
            outputText("希望她在这里，这样你就能更好地了解她了。");
         }
         else
         {
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("的肉棒胀大，小穴变得湿润");
            }
            else if(get_player().hasCock())
            {
               outputText("的肉棒胀大");
            }
            else if(get_player().hasVagina())
            {
               outputText("的小穴变得湿润");
            }
            else
            {
               outputText("的括约肌抽搐");
            }
            outputText("，一想到她柔软的身体和挺拔的乳房。");
         }
         outputText("你可不太想再被敲闷棍了。");
         outputText("[pg]考虑到这一点，你跑进小巷，但在离板条箱不远的地方急刹车停了下来。陷阱从废墟中弹起，啪的一声甩到一边。躲在一个木桶里的人骂道：[say:操！]你大声说道，声音足以让小巷里的每个人都听到，告诉他们最好出来。你以前见过这个把戏。");
         outputText("[pg]既然你没有拔出武器，听起来也不太生气，一些猫人开始从不同的板条箱和木桶里出来。有些人看起来很警惕，有些人则有些局促不安。凯丝站了起来，认出了你，并试图掩饰。她扔掉手里拿着的绳子，盯着自己的脚。");
         outputText("[pg]你问谁是管事的。一个中年妇女走上前来。她有着姜黄色的" + (get_noFur() ? "头发" : "皮毛") + "，对于一个猫人来说，肌肉相当发达。她一定就是凯丝上次提到的伊芙琳。她蓝色的眼睛仔细地打量着你。");
         outputText("[pg]你可以试着用宝石换取和凯丝相处的时间，也可以捐献一些宝石给他们买吃的，或者试着威胁她。");
         menu();
         addButton(0,"讨价还价",bargainForKittahKatPussah);
         addButton(1,"捐赠",donateToCatSlutsYouCatSlut);
         addButton(2,"威胁",threatenCatSluts);
      }
      
      public function reductoBallSize() : void
      {
         clearOutput();
         if(isAt(0))
         {
            outputText("在你的帮助下，她" + clothesLowerChoice("扭动着脱下短裤","脱下内裤并撩起裙子","脱下紧身衣","脱下内裤并撩起裙子","解开长袍") + "，露出了肿胀的睾丸。");
         }
         outputText("你有一瞬间在想，她那" + (get_ballSize() > 3 ? "膨胀的" : "") + "阴囊上的" + catGirl("毛发","皮毛") + "是否会影响这个过程，然后决定试一试也无妨。你有些不确定地打开罐子，开始用手指涂抹药膏，然后开始在凯瑟琳的蛋蛋上涂抹。这个" + (hasCock() ? "双性" : "") + "" + catGirl("猫娘","猫科动物") + "在你的触摸下颤抖着，但咬着嘴唇什么也没说，任由你将缩胸霜按摩进她的精液工厂，在你的手掌中滚动着球状的睾丸，以确保涂抹得彻底、均匀。[pg]");
         outputText("你涂完药膏，看着它们明显地缩小，向内收缩，直到直径减少了两英寸。就在那时，你意识到它们上方的肉棒正从她的包皮中直挺挺地竖起，前端开始冒出前列腺液" + cockMultiple("","s") + "。[say:呃……我觉得缩小我的蛋蛋让里面的东西承受了压力。你想帮我发泄一下吗？]她怯生生地建议道，脸红着咬着嘴唇，不知是因为尴尬还是期待。[pg]");
         set_ballSize(get_ballSize() - 2);
         if(get_ballSize() < 1)
         {
            set_ballSize(1);
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().REDUCTO);
         katSexMenu();
      }
      
      public function pregSize() : int
      {
         return 0;
      }
      
      public function playerText() : String
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1227) & 8) > 0)
         {
            return "[master]";
         }
         return get_player().get_short();
      }
      
      public function playerMaster() : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1227) & 8) > 0;
      }
      
      public function playerLovers() : int
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            _loc1_ |= 1;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,177) >= 2)
         {
            _loc1_ |= 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,70) == 0 && get_player().statusEffectv1(StatusEffects.Edryn) > 3)
         {
            _loc1_ |= 4;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,696) != 1 && get_game().helScene.followerHel())
         {
            _loc1_ |= 8;
         }
         if(get_game().urta.urtaFuckbuddy())
         {
            _loc1_ |= 16;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1215) > 0)
         {
            _loc1_ |= 32;
         }
         return _loc1_;
      }
      
      public function penetrateKatsVag() : void
      {
         var _loc1_:int = get_player().cockThatFits(70);
         clearOutput();
         get_images().showImage("katherine-fuck-her-vagoo");
         outputText("你甚至不需要考虑。你的眼睛死死盯着这个猫" + (hasCock() ? "扶她" : "娘") + "丝滑、湿透的猫咪小穴，里面已经有淫液顺着她的");
         outputText((hasBalls() ? ballAdj() + "阴囊" : catGirl("乳白色的","黑色的毛茸茸的") + "大腿") + "滴落，在地上积成一滩，满怀期待。你脱下衣服，漫步向前，轻轻抚摸她湿润的阴唇，用舞台上的耳语对她说，你应该选哪个洞似乎是个显而易见的选择。凯瑟琳发出一阵俏皮的咯咯笑声，一声发情的喵喵叫，然后");
         if(isAt(0))
         {
            outputText("在一个附近的木桶上摆好姿势");
         }
         else if(isAt(1))
         {
            outputText("跪在床沿上");
         }
         else
         {
            outputText("四肢着地");
         }
         outputText("这样她就更容易支撑你们俩了。[pg]");
         outputText("她一准备好，你就毫不犹豫地将你的" + get_player().cockDescript(_loc1_) + "滑入，让她因为被填满而发出愉悦的嚎叫。她湿滑的肉壁，像涂了油的天鹅绒一样柔软光滑，似乎在起伏，仿佛在故意吞咽你的阴茎，渴望你将自己埋入根部。因为湿透了，它们没有造成任何阻力，让你像黄油一样顺滑地滑入，但它们紧紧抓住你，徒劳地试图把你留在里面。你的抽插和冲刺引发了最淫荡的吧唧声和吸溜声，她流口水的小穴在你的肉棒上流口水，并且");
         if(get_player().balls > 0)
         {
            outputText((hasBalls() ? "两对" : "") + "蛋蛋");
         }
         else
         {
            outputText(hasBalls() ? "她的蛋蛋" : "她的大腿");
         }
         outputText("。[pg]");
         outputText("[say: 哦，对！是的——啊！感觉太好了！]凯瑟琳毫无理智地嚎叫着，在你的抽插中语无伦次地表达着她的愉悦。而你，只是抓住她" + catGirl("柔软的皮肤","丝滑的皮毛") + "，抱住她狭窄的臀部，继续抽插。虽然你一开始可能牢牢掌握着主动权，但随着节奏的加快，这个猫" + (hasCock() ? "扶她" : "娘") + "成了主导者；她向后推你，疯狂地扭动和挣扎，你发现自己不得不拼命抓住她，因为她把你操得神志不清。如果不是因为她太湿了，她会因为摩擦和紧紧抓住你肉棒的握力而把你的阴茎磨破。" + (hasCock() ? "你刚好能看出她的阴茎" + cockMultiple("挥舞","挥舞") + "的方式，像铁一样坚硬，结" + cockMultiple("","") + "肿胀到最大尺寸——她" : "她") + "离高潮不远了……[pg]");
         outputText("确实，她不远了。她以一种会折断人类脊椎的方式弓起背，发出一声震耳欲聋的狂喜尖叫，让你下意识地回想起在英格纳姆被求偶的猫吵醒的夜晚。" + (hasCock() ? "精液像河水一样从她的阴茎" + cockMultiple("","") + "中涌出，她的" : "她的") + "小穴被淫液淹没，溅了你一身，浸湿了" + (hasCock() ? "地面和" : "") + "你腰部以下的一切。仿佛是她高潮的信号，你自己的高潮也出乎意料地抓住了你。");
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]也随之喷出了淫液，与此同时，你");
         }
         else
         {
            outputText("Y");
         }
         outputText("的肉棒在她的深处爆发，将你的精液灌满她诱人的下体，她的阴唇贪婪地吞咽着你给出的每一滴精华。");
         if(get_player().cumQ() >= 1500)
         {
            outputText("她的肚子高高隆起，像怀孕晚期一样肿胀，直到你终于射完，给她留下了一个木桶般大小的肚子，随着她的动作，甚至能听到精液在里面晃荡的声音。");
         }
         outputText("你气喘吁吁地抽了出来，任由她的下体将淫液滴落在地上。");
         outputText("[pg]凯瑟琳");
         if(isAt(0))
         {
            outputText("瘫靠在木桶上");
         }
         else if(isAt(1))
         {
            outputText("瘫软在床上");
         }
         else
         {
            outputText("瘫倒在柔软的草地上");
         }
         outputText("，慵懒地甩着尾巴，大声地打着呼噜。[say: 嗯……你都不知道你有多棒，亲爱的，]她对你说，然后拍了拍自己的肚子，轻声咯咯笑着。[saystart]我不是说我现在就想当妈妈");
         if(get_player().cumQ() >= 1500)
         {
            outputText("——虽然说实话，你可能没给我多少选择的余地——");
         }
         outputText("但我觉得你的小男孩、小女孩和小扶她长大后，一定会让大家非常、非常开心的。[sayend][pg]");
         outputText("你微笑着，用村里猫咪最喜欢的方式挠了挠她的耳后，享受着她满足的呼噜声，然后清理干净自己");
         if(isAt(0))
         {
            outputText("，用这只猫娘放在一旁的旧破布擦了擦，然后礼貌地道别，穿好衣服，动身返回特尔阿德雷。");
         }
         else if(isAt(1))
         {
            outputText("，在凯丝的脸盆里洗了洗，然后礼貌地道别，穿好衣服，动身返回特尔阿德雷。");
         }
         else
         {
            outputText("和凯丝，用湖水和凯丝带来的毛巾擦拭。你很想多待一会儿欣赏风景，但在有什么东西来调查你们刚才弄出的动静之前，还是赶紧回特尔阿德雷比较安全。");
            if(get_player().cumQ() >= 1500)
            {
               outputText("[pg]在返回城市的路上，你和凯丝都揉着她那被精液胀大的肚子，从湖岸到沙漠边缘，留下了一路的淫液痕迹。");
            }
         }
         get_player().orgasm("Dick");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcPenetratesKatDoublyNormalEnd() : void
      {
         clearOutput();
         outputText("你还没和凯丝完事。你费了些力气把她拉起来，让她坐在你的腿上" + (get_player().cumQ() >= 1500 ? "，她的肚子在你们俩面前淫秽地晃动着" : "") + "。当你" + (hasCock() ? "抓住" + cockMultiple("她疲软的肉棒","她两根疲软的肉棒") : "紧紧握住她的阴蒂") + "时，她从恍惚中惊醒过来。[pg]");
         outputText("[say:哦，那太棒了，]她梦幻般地说。[say:我们有时间一定要再来一次。][pg]");
         outputText("你开始套弄她" + (hasCock() ? "变软的肉棒" + cockMultiple("","") : "的阴蒂") + "，凯丝扭动着身体。[say:不，我不是说现在。" + (hasCock() ? "我被榨干了！" : "我刚高潮过！") + "][pg]");
         outputText("你继续" + (hasCock() ? "抚摸她的肉棒" + cockMultiple("，","，") : "玩弄她的阴蒂，揉捏它，") + "越来越快。凯丝喘息着呻吟着，但她太累了，无法逃脱。" + (hasCock() ? "她的肉棒" + cockMultiple("在你的手中变得坚硬火热","在你的手中变得坚硬火热") : "你感觉到她的阴道和屁股里产生了热量") + "。[pg]");
         outputText("你花了很长时间疯狂地套弄，才让凯丝重新达到可以高潮的程度。在此期间，她在你的怀里扭动着，迷失在痛苦与快乐的混合中。当她终于高潮时，她的臀部向前挺进，" + (hasCock() ? "试图将她的肉棒埋入" + cockMultiple("一个想象中的阴道","一对想象中的阴道") + "，但结果只是" : "") + "将她从你的肉棒上拔了出来。[pg]");
         outputText("凯丝落在了" + (hasCock() ? "精液" : "体液") + "的水坑里，并开始" + (hasCock() ? "以几乎所有可能的方式向其中添加液体。她的肉棒" + cockMultiple("向空中喷射出一股水流","向空中喷射出两股水流") + "，同时" : "，") + "她的阴道和屁股排出" + (hasCock() ? "了" : "了") + "你之前提供的精液。[pg]");
         if(isAt(0))
         {
            outputText("凯丝彻底精疲力竭，扑通一声倒在泥泞的地上。你轻轻拍了拍她的头，答应她很快就会再来看她。你得到的回答只是一声满足的呢喃。");
         }
         else if(isAt(1))
         {
            outputText("精疲力尽的凯丝伴随着一声巨大的湿软声响，瘫倒在床上。你轻轻拍了拍她的头，承诺很快会再来看她。作为回应，你只听到了一声满足的呢喃，紧接着是轻微的呼噜声。");
         }
         else
         {
            outputText("等凯丝恢复过来后，她在附近的小溪里清洗了身子，然后你们俩开始了返回特尔阿德雷的漫长跋涉。当你们到达城门时，你搂住凯丝，给了她一个长长的吻，并承诺很快会再来看她。");
         }
         get_player().orgasm("Dick");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcPenetratesKatDoublyHighCumCorrupt() : void
      {
         clearOutput();
         var _loc1_:Boolean = !doneSubmissive(1);
         if(_loc1_)
         {
            outputText("你抓住她的肚子用力挤压，不断增加压力，即使凯丝不协调的四肢在四处扑腾，试图寻找逃脱的方法。当你把空气从她的肺里挤出来时，凯丝痛苦地喘息着。[pg]");
            outputText("你非常享受她的不适，以至于你的肉棒一直保持着坚挺，堵住了她拼命想要张开的洞口。当你把手更深地按进她的肉里，揉捏着她那被填满的肚子时，你终于感觉到有什么东西松动了。[pg]");
            outputText("她肠道里的压力减轻了，你听到凯丝发出了湿润的咳嗽声。你大笑着，在她的屁股上狠狠拍了一巴掌，看着她又咳出了好几口你的精液。[pg]");
            outputText("凯丝浅浅地呼吸了几下，然后生气地说：[say:真不敢相信你刚才居然那样做。][pg]");
            outputText("你揉着她的腰侧，告诉她你知道她有多喜欢你精液的味道。这样她就不用等了。[pg]");
            outputText("[say:我……我没那么喜欢那个味道。我喜欢吸你的肉棒是因为那能让你开心。][pg]");
            outputText("你告诉她这确实让你很开心，你希望她能再次像这样取悦你。当你继续揉着她的腰侧时，你告诉她这对你来说是最好的感觉。你把她从头到尾都填满了的想法。那种在她体内的感觉——那种火热、黏糊糊的充实感，真是太棒了，你几乎想再射一次。[pg]");
            outputText("[say:哦，求你别！我受不了了。][pg]");
            outputText("听起来她没有刚才那么生气了。你暗自微笑，开始用手指诱惑地" + catGirl("划过她丝滑的肌肤","穿过她柔软的皮毛") + "。是时候多夸夸她了。你告诉她，你从未像现在这样感到满足。看到她被精液填满的模样，让你更加渴望她。你再次按压她的肚子；凯丝低下头，浅浅地呼吸着，等待你完事。");
            addSubmissive(1);
         }
         else
         {
            outputText("你抓住她的肚子用力挤压，不断增加压力，你知道这能克服她内脏的无意识抵抗。凯丝在痛苦与快感的交织中发出呜咽，扭动着臀部，无意中让你的肉棒保持着坚挺。当你把手更深地按进她的肉里，揉捏着她那被填满的肚子时，你感觉到了她内部括约肌松动的熟悉感觉。[pg]");
            outputText("她肠道里的压力减轻了。越过凯丝的肩膀，你可以看到她把浓稠的精液滴落到" + (isAt(1) ? "床上" : "地上") + "。她用拳头砸了几下地面，你放松了力道，给她一个恢复的机会。[pg]");
            outputText("凯丝深吸了一口气，你再次挤压她。她已经很虚弱了，内脏更容易松动，你的精液再次从她的喉咙里冒出泡来。你重复了几次，让她呼吸，然后强迫更多的精液沿着相反的方向穿过她的消化道。[pg]");
            outputText("直到你的肉棒软到足以让她子宫里的精液开始漏出，减轻了压力，你才停下来。凯丝咳嗽着清理喉咙，你告诉她做得很好，像个好女孩一样让你用精液填满了她的全身。喘过气来后，凯丝回答道：[say:我很高兴你喜欢，" + playerText() + "。这对我来说真是一次奇妙的体验。][pg]");
            outputText("当你继续揉着她的腰侧时，你再次告诉她这是你经历过的最好的感觉。那种在她体内的感觉——知道你把她填得有多满，真是太棒了，你几乎想再射一次。[pg]");
            outputText("[say:我不知道——我已经这么饱了。我今晚可能连晚饭都吃不下了。][pg]");
            outputText("你暗自微笑，开始用手指诱惑地" + catGirl("划过她丝滑的肌肤","穿过她柔软的皮毛") + "，告诉凯丝如果她继续这样说话，肯定会再来一次的。她发出呼噜声作为回应——你分不清她是在要求再来一次，还是只是在享受你手指的动作。");
         }
         outputText("[pg]当你的肉棒终于完全软下来时，你拔了出来并穿好衣服，等待你那肚子胀鼓鼓的");
         if(get_player().cor < 25)
         {
            outputText("伴侣");
         }
         else if(get_player().cor < 75)
         {
            outputText("伴侣");
         }
         else
         {
            outputText("精液垃圾桶");
         }
         outputText("恢复");
         if(isAt(7))
         {
            outputText("，这花了比你预期长得多的时间。[pg]");
            outputText("凯丝在附近的小溪里洗了洗身子，然后你们俩开始了返回特尔阿德雷的漫长跋涉。当你们到达城门时");
         }
         else
         {
            outputText("。最后，凯丝双腿发软地站了起来，");
         }
         outputText("你用双臂抱住了她。凯瑟琳给了你一个愉快的微笑，你告诉她" + (_loc1_ ? "下次对她来说会更容易，也更性感" : "你已经开始期待") + "下次了。[pg]");
         outputText("她红着脸给了你一个吻。在回营地的路上，你想知道还能教你顺从的" + catGirl("猫娘","小猫") + "什么其他的把戏。");
         get_player().orgasm("Dick");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcPenetratesKatDoubly() : void
      {
         var _loc3_:int = 0;
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(70);
         outputText("你解开你的[armor]，露出" + (int(get_player().cocks.length) == 2 ? "你那两根正在变硬的肉棒" : "你那一堆正在变硬的肉棒"));
         if(isAt(1))
         {
            outputText("。你把衣服扔在地板上，把渴望的凯瑟琳抱到她的床上");
         }
         else
         {
            if(get_game().time.hours < 12)
            {
               outputText("在晨风中");
            }
            else if(get_game().time.hours < 18)
            {
               outputText("在温暖的午后空气中");
            }
            else
            {
               outputText("在凉爽的傍晚空气中");
            }
            if(isAt(7))
            {
               outputText("在湖岸边");
            }
         }
         outputText("。在抚摸凯丝的" + catGirl("柔软肌肤","皮毛") + "时，你告诉她，她有两个美味的洞，而你想要把它们都填满。[pg]");
         outputText("她睁大了眼睛，双腿也随之张开。" + (hasCock() ? "她的肉棒" + cockMultiple("紧绷着","紧绷着") + "抵在她的" + clothesLowerChoice("裤子","裙子","紧身衣","连衣裙","长袍") + "上。你" : "你轻轻揉捏着它们来挑逗她，然后你") + "脱下这只发情小猫的衣服，告诉她你想要她四肢着地。凯丝急切地顺从了，跪在");
         if(isAt(0))
         {
            outputText("小巷松软的泥土里");
         }
         else if(isAt(1))
         {
            outputText("她的床上");
         }
         else
         {
            outputText("水边的沙滩上");
         }
         outputText("并展示出她的小穴和屁股。[pg]");
         outputText("你开始抚摸凯瑟琳的尾巴。它来回摆动，似乎比她身体的其他部分还要兴奋。当你探索她火热的小穴时，你发现它已经湿透了。你将最上面的肉棒滑入凯丝的双腿之间，让它沾满丰富的润滑液。[pg]");
         outputText("凯丝的双手");
         if(isAt(0))
         {
            outputText("深深地抓进泥土里，");
         }
         else if(isAt(1))
         {
            outputText("紧紧抓着床单。她");
         }
         else
         {
            outputText("深深地抓进沙子里，");
         }
         outputText("发出一声低沉、野性的喵叫。你以此为信号，微微抬起臀部，将光滑的龟头抵在她的后庭上。" + (int(get_player().cocks.length) == 2 ? "你下面的肉棒" : "你的另一根肉棒") + "则依偎在她小穴粉嫩的褶皱之间。[pg]");
         outputText("凯丝一感觉到两根肉棒都抵住了目标，就试图向后推。但你根本不吃这一套。你紧紧抓住她" + catGirl("光滑的","毛茸茸的") + "臀部，阻止了她，并明确表示这场性爱将按照你的节奏进行。凯丝的头低了下去，直到额头靠在紧握的双手上，她哀怨地喵喵叫着，就像一只乞求奶油的小猫。[pg]");
         outputText("你的" + (get_player().balls > 0 ? "蛋蛋抽动着" : "前列腺抽动着") + "，让你知道你有很多奶油可以喂给这只性感小猫。[pg]");
         outputText("你");
         if(get_player().cor < 25)
         {
            outputText("努力克制着自己的原始冲动，确保凯瑟琳能完全享受这一切。你极其缓慢地将两根肉棒滑入她等待着的洞穴中。你调整臀部，让插在她小穴里的肉棒紧紧贴着她的阴蒂。[pg]");
            outputText("然后，你用微小的抽插——每一次都只比上一次深一点点，轻轻地撬开凯丝最敏感的部位。随着你的动作，她继续喵喵叫着，你能感觉到她的整个身体变得越来越热。你开始加快节奏，虽然永远达不到凯瑟琳想要的那么快，但你知道，正是因为这种缓慢的速度，她才享受到了极大的乐趣。");
         }
         else if(get_player().cor < 75)
         {
            outputText("紧贴着凯丝，直到两个龟头都进入了她的体内。你停了下来，享受着两次进入爱人体内的感觉。然后，你用一次缓慢而连续的抽插，将两根肉棒一直插到根部。[pg]");
            outputText("凯丝试图让你快点，她一边试图把臀部向后推，一边低语着[say:对，对。再快点！]在第一次抽插之后，你愿意满足她。你开始加快节奏，直到你在凯瑟琳湿润的洞穴里像活塞一样抽插。她大声的喵喵叫和[say:对！]的尖叫声证明了她有多享受这一切。");
         }
         else
         {
            outputText("确保你抓得牢牢的，并且你坚硬如石的肉棒完美地对准了。然后你猛地把凯丝往后拉，同时向前挺进。一声刺耳的尖叫划破空气，让你嘴角泛起一丝微笑。你想让凯丝永远记住这场性爱。[pg]");
            outputText("你没有给你的猫娘性玩具恢复或适应的机会。如果她想把两个洞都献给你，那你就加倍用力地操她！起初她试图拉开距离，然后她试图让你慢下来。你无视了这一切，以你想要的节奏像打桩机一样猛烈地撞击她最敏感的部位。在无数次的抽插之后，你听到了一声长长的呻吟，你知道凯丝终于进入状态了。");
         }
         outputText("[pg]你正准备" + (hasCock() ? "伸手去关照一下凯丝的肉棒" : "关照一下凯丝的乳头") + "，这时你感觉到她身体紧绷，并听到了一阵喷水的声音。看来她比你先高潮了。");
         if(hasCock())
         {
            outputText("在最上面的那根肉棒上，你能感觉到凯丝前列腺的跳动，因为" + (hasBalls() ? "她排空了她的蛋蛋" : "它挤出了她的精液"));
         }
         else
         {
            outputText("凯丝的两个洞都试图夹紧你的肉棒，她内部的褶皱以一种非常令人愉悦的方式跳动和挤压着");
         }
         outputText("。凯瑟琳的身体变得瘫软，只有你放在她臀部的手和你插在里面的肉棒支撑着她的屁股悬在空中。[pg]");
         if(hasCock())
         {
            if(isAt(0))
            {
               outputText("她身下的泥土已经变成了一个黏糊糊的泥坑");
            }
            else if(isAt(1))
            {
               outputText("床单湿透了" + (cumQ() > 1500 ? "。事实上，凯丝的精液也在地板上积成了水洼，" : ""));
            }
            else
            {
               outputText("大量的精液顺着沙滩滑入湖中");
            }
            outputText("所以现在停下来毫无意义。事实上，你希望你能" + (get_player().cor < 50 ? "鼓励" : "强迫") + "你的" + catGirl("宠物猫娘","猫科朋友") + "在这片狼藉中再添上一笔。[pg]");
         }
         outputText("你继续将肉棒猛烈地撞入凯瑟琳瘫软的身体。你知道她还清醒的唯一原因是她全身都在发出轻柔的呼噜声。你的手能感觉到，而你的肉棒感觉更敏锐，这给了你一个主意。[pg]");
         outputText("你不断地抽插，直到你濒临高潮的边缘。然后你将两根肉棒深深地插入凯丝体内。她呼噜声的共振让你感觉你的肉棒在她的体内相互摩擦。[pg]");
         var _loc2_:Boolean = get_player().cocks[_loc1_].cockLength > 14 && pregSize() == 0;
         if(_loc2_)
         {
            _loc3_ = int(Math.round(get_player().cocks[_loc1_].cockLength));
            outputText("你感觉到了一些奇妙的东西。在凯丝的阴道深处，你的龟头处有一种紧致感。就像一个小甜甜圈滑过你的龟头。然后它松开了。当你的肉棒向前弹起时，你听到她猛吸了一口气。你意识到" + (_loc3_ <= 16 ? "你的龟头" : "你肉棒的前" + (_loc3_ - 14) + "英寸") + "现在已经进入了凯瑟琳的子宫。[pg]");
         }
         outputText("这种感觉淹没了你，你的" + (get_player().balls > 0 ? "蛋蛋紧紧贴着你的腹股沟" : "肿胀的前列腺收缩") + "，向凯瑟琳瘫软的身体发射了第一发炮弹。[pg]");
         outputText("你把精液射进了凯丝的两个洞里");
         if(int(get_player().cocks.length) > 2)
         {
            outputText("与此同时，你的其他肉棒" + (int(get_player().cocks.length) > 3 ? "" : "") + (hasCock() ? (int(get_player().cocks.length) > 3 ? "增加了" : "增加了") + "她身下的" : "制造了") + "一团糟");
         }
         if(get_player().cumQ() < 500)
         {
            outputText("。喷发很快就结束了，没有外在的迹象。只有你深深插在凯丝" + (_loc2_ ? "子宫" : "阴道") + "和肠道里的肉棒能感觉到你黏稠的精液池。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("。喷发很快就结束了，凯丝的肚子因为你的双重注入而鼓了起来。你深深插在凯丝" + (_loc2_ ? "子宫" : "阴道") + "和肠道里的肉棒能感觉到滚烫、黏稠的液体池。它们处于压力之下，但仍然被你的勃起封锁着。");
         }
         else
         {
            outputText("。一次又一次，你的" + (get_player().balls > 0 ? "蛋蛋收缩" : "前列腺收缩") + "，对抗着越来越大的阻力，因为凯丝体内的每一个空隙都被你的体液填满了。你不再需要支撑凯瑟琳的臀部——她装满精液的肚子贴着");
            if(isAt(0))
            {
               outputText((hasCock() ? "充满精液的" : "被淫水浸透的") + "泥土");
            }
            else if(isAt(1))
            {
               outputText((hasCock() ? "" : "淫") + "水浸透的床单");
            }
            else
            {
               outputText((hasCock() ? "沾满精液的" : "被淫水浸透的") + "沙滩");
            }
            outputText("。任何人都会以为她怀孕了，而且过几天就要生双胞胎或三胞胎了。[pg]");
            if(get_player().cumQ() >= 3000)
            {
               outputText("即使是你那坚如钢铁的勃起，也无法阻挡你那异常丰满的" + (get_player().balls > 0 ? "蛋蛋" : "前列腺") + "中喷涌而出的洪流。凯丝的皮肤绷得紧紧的，" + catGirl("你可以看到妊娠纹正在形成","她肚子上的毛发开始变浅。仔细一看，你可以看到每一根毛发都被迫竖了起来") + "。[pg]");
               outputText("然后你感觉到第一股细流顺着你的肉棒流了回来。你的" + (get_player().balls > 0 ? "蛋蛋再次泵动" : "前列腺再次泵动") + "，细流变成了洪流。你现在必须紧紧抓住凯丝的臀部，以免她从你身上弹开。[pg]");
            }
            outputText("终于，洪流停止了，");
            if(_loc2_)
            {
               if(doneSubmissive(1))
               {
                  outputText("你想起了一个“帮助”她的有趣方法。");
                  menu();
                  addButton(0,"挤压",pcPenetratesKatDoublyHighCumCorrupt);
                  addButton(1,"拥抱",pcPenetratesKatDoublyNormalEnd);
                  return;
               }
               if(get_player().isCorruptEnough(75) || get_player().hasPerk(PerkLib.Pervert) && get_player().cor >= 33 || get_player().hasPerk(PerkLib.Sadist))
               {
                  outputText("你那变态的脑子想出了一个“帮助”她的方法。");
                  menu();
                  addButton(0,"帮助",pcPenetratesKatDoublyHighCumCorrupt);
                  addButton(1,"拥抱",pcPenetratesKatDoublyNormalEnd);
                  return;
               }
            }
            if(get_player().cor >= 25)
            {
               outputText("你揉着凯丝的背，直到她打了一个不太淑女的饱嗝。");
            }
            else
            {
               outputText("你轻轻按摩凯丝的腰侧，直到她的肚子咕噜作响，打了个小嗝。");
            }
         }
         doNext(pcPenetratesKatDoublyNormalEnd);
      }
      
      public function pcPenetratesKatAnally() : void
      {
         var _loc1_:int = get_player().cockThatFits(70);
         clearOutput();
         get_images().showImage("katherine-fuck-her-bungholio");
         outputText("仔细想了想，你的目光落在了这只猫娘" + catGirl("诱人的","乌黑的") + "后庭上，你暗自笑了笑，然后告诉凯瑟琳你想走后门。");
         if(hasAlready(1))
         {
            outputText("凯丝坏笑了一下，尾巴微微翘起。[say: 嗯……这挺好玩的。也很调皮。]");
         }
         else
         {
            outputText("她睁大眼睛，艰难地咽了口唾沫，然后点了点头。[say: 好、好吧……如果你喜欢那种的话……]");
         }
         outputText("[pg]她转过头，重新调整了姿势，以便");
         if(isAt(0))
         {
            outputText("她稳稳地撑在板条箱上，怯生生地等待着");
         }
         else if(isAt(1))
         {
            outputText("她的臀部紧紧贴在床架边缘，怯生生地等待着");
         }
         else
         {
            outputText("她的头贴在草地上，屁股和尾巴高高翘起。她回头看着你，怯生生地等待着");
         }
         outputText("你的靠近。你自信地走到她身后，趁机打量着你的伴侣。确实，她的屁股大小和翘度都没什么好吹嘘的，但她那瘦削的臀部肌肉结实，而且覆盖着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4)
         {
            outputText("令人惊讶的" + (get_noFur() ? "柔软肌肤" : "看起来很奢华的皮毛") + "，考虑到她可能不规律的饮食");
         }
         else
         {
            outputText(catGirl("诱人的苍白肌肤","看起来很奢华的皮毛"));
         }
         outputText("，你趁机欣赏地" + catGirl("抚摸着那光滑的臀部","抚摸着柔软的毛发") + "。她高兴地咕哝着扭动身体，把你的注意力拉回正事上。尽管凯瑟琳很紧张，但她的小穴已经因为期待而流出淫液，你只需简单地暴露自己，在手心收集一些她的汁液。你煞费苦心地将汁液涂抹在你的" + get_player().cockDescript(_loc1_) + "上，让它完全勃起，同时变得光滑。然后，你开始将手里剩下的女孩润滑液按摩进凯瑟琳紧致的屁眼，让她在你弄湿她时发出吱吱声和呻吟。最后，你问她是否准备好了。[pg]");
         outputText("[say: 我-我准备好了！]她坚持说，明显在努力放松。[say: 就……就-插进来吧！][pg]");
         outputText("不需要进一步的鼓励，你向前压去，开始将自己沉入她紧致的" + catGirl("","黑色") + "尾穴。她像个处女一样呻吟，当你滑入时，她的" + (hasCock() ? cockAdj() + cockType("狗鸡巴","猫鸡巴") + cockMultiple("","们") + "明显地跳动，她的" : "") + "空虚的猫穴也跟着收缩。她的肠壁像加热的丝绸老虎钳一样锁住你，紧紧抓住你并挤压，仿佛已经试图榨干你最后一滴精液。但你继续前进，一寸一寸地滑入她的肠道，直到无法再深入。然后，你慢慢地试图拔出自己——每一寸都在挣扎，因为她处女般紧致的屁股试图把你吸回去。最后拔出你插入的大部分，你再次滑入到底，更用力、更快地撞击她的臀部，然后拔出，一遍又一遍地重复。[pg]");
         outputText((hasCock() ? "你的猫咪" : "双性猫") + "喘息着呻吟，当你继续推进时，她把肉不多的屁股向后挺，试图迎合你的臀部，她的内壁挤奶般地收缩。[say: 啊！你——哦！——知道——对，对，就这样操我，操我那里！——有一个" + (hasCock() ? "双性——对对对！——女朋友" : "——对对对！——曾经是双性的女朋友") + "的好处是什么吗，" + playerText() + "？]她勉强喘息着说。[pg]");
         outputText("当你蹂躏她的内脏时，你咕哝着发出嘶嘶声，但还是勉强腾出呼吸承认你不知道。[pg]");
         outputText("[say: 好处是——哦！啊！——" + (hasCock() ? "我有两套器官，所以——啊！啊！啊！——这对我很好，就像对男人一样好" : "我有一样的器官，所以——啊！啊！啊！——我完全知道你喜欢什么") + "！]当你特别用力地抽插时，她发出一声兴奋的极乐嚎叫。[saystart]哦……");
         if(hasCock())
         {
            outputText("你正在挤压我的前列腺，摩擦我屁股里所有让我的鸡巴" + cockMultiple("","们") + "跳动的地方，后面太舒服了……太硬了，太热了！操我，像野兽一样操我！[sayend]她尖叫着，开始抽动自己的臀部，肿胀的鸡巴" + cockMultiple("","们") + "喷出前列腺液，假装交配");
         }
         else
         {
            outputText("后面太舒服了……太硬了，太热了！操我，像野兽一样操我！[sayend]她尖叫着，开始抽动臀部，假装交配");
         }
         outputText("着空气。她随时都会高潮……[pg]");
         outputText("但你抢先一步，伴随着你自己的嚎叫，你射在她体内，用你的精液淹没她的肠道");
         if(get_player().cumQ() >= 500)
         {
            outputText("直到她的肚子因为你射入的所有东西开始鼓起");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("，不断膨胀，直到她看起来像是快要生了，你的一部分甚至怀疑她会不会开始从嘴里喷出你的精液");
         }
         outputText("。在你的高潮中，她自己的嚎叫声没有被注意到，因为她的小穴痉挛着，");
         if(isAt(0))
         {
            outputText("淫液如雨般落在下面的地上" + (hasCock() ? "，她的" + cockMultiple("鸡巴喷出","鸡巴们喷出") + "精液，洒满了板条箱和地面" : ""));
         }
         else if(isAt(1))
         {
            outputText("淫液如雨点般落下" + (hasCock() ? "，与她肉棒喷出的精液混合，浸湿了她的肚子，" : "浸湿了她的") + "床单和床铺");
         }
         else
         {
            outputText("淫液如雨点般落到下方的地面上" + (hasCock() ? "，她的" + cockMultiple("肉棒喷出","肉棒喷出") + "精液，洒满了草地" : "") + "。它们汇聚成一条缓慢流动的溪流，流向岸边，与湖中早已被污染的湖水混合在一起");
         }
         outputText("。终于，你筋疲力尽，湿漉漉地从你那喘息着的爱人的屁股里拔了出来。[pg]");
         outputText("她软绵绵地瘫倒在地上，仍因高潮的余韵而颤抖着，然后如梦似幻地微笑着抬头看着你");
         if(get_player().cumQ() >= 1500)
         {
            outputText("，心不在焉地抚摸着她那鼓胀的肚子");
         }
         outputText("。 [say:操得真爽……虽然我不能说我不更喜欢插在小穴里，但如果你想的话，我随时准备好" + (hasAlready(1) ? "再来一次" : "再来一发") + "。]");
         if(get_player().cumQ() >= 1500)
         {
            outputText("她看着自己的肚子，难以置信地摇了摇头。 [say:天哪……如果他们哪天想出办法让人被走后门也能怀孕，你肯定会让你遇到的每个人都大肚子吧，种马？]");
         }
         outputText("[pg]你对她的奉承报以得意的微笑，");
         if(isAt(0))
         {
            outputText("你伸手帮她穿好衣服，然后自己也穿戴整齐，回到了街上。");
         }
         else if(isAt(1))
         {
            if(get_player().cor < 25)
            {
               outputText("你把凯丝从她那浸满精液的床上滚下来，趁她清理自己的时候帮她换了床单。完事后，你给了凯丝一个长长的吻，告诉她希望能很快再见到她。你离开时，她脸上洋溢着幸福的笑容。");
            }
            else if(get_player().cor < 75)
            {
               outputText("你给了凯丝一个吻，告诉她希望能很快再见到她。她伸了个懒腰，呻吟着站了起来。她还有一大堆清理工作要做呢。");
            }
            else
            {
               outputText("你告诉凯丝，你想让她把她刚才喷出来的" + (hasCock() ? "" : "淫") + "液全舔干净。你听说这有助于保持她的" + catGirl("皮肤柔软光滑","皮毛漂亮有光泽") + "。她看起来有些不确定，但还是开始舔舐床单。你揉了揉她的后颈以示鼓励，很快凯瑟琳就开始津津有味地舔食自己的体液了。留下凯丝享用她的美餐，你走回了特尔阿德雷的街道。");
            }
         }
         else
         {
            outputText("你扶凯瑟琳站起来，收拾好你所有的东西。你还有很长一段路要走才能回到特尔阿德雷");
            if(get_player().cumQ() >= 1500)
            {
               outputText("而对凯瑟琳来说，由于她那塞满精液的肠道，这段路会显得更长。不过，从凯丝在回特尔阿德雷的路上紧紧抱着你的样子来看，你觉得她并不介意");
            }
            outputText("。");
         }
         get_player().orgasm("Dick");
         orgasm();
         dynStats(DynStat.Sens(-1));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function orgasm() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1218,0);
      }
      
      public function oralKatherineChoices() : void
      {
         clearOutput();
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("凯丝的尾巴兴奋地抽动着，她喝光了饮料，渴望看看你有什么打算。[pg]");
            outputText("你牵着她的手，带她走到外面，来到湿身婊酒馆后面" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0 ? "那条熟悉的" : "那条") + "小巷。[pg]");
            outputText("她看起来有点担心被抓到，但她太兴奋了，无法拒绝你。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
         }
         outputText("你带着坏笑，提议进行一次味觉测试。凯瑟琳眨了眨眼，然后笑了。[say:我没意见……但谁来当品尝者呢？][pg]");
         menu();
         if(hasCock())
         {
            addButton(0,"主角口交",giveKatOralPenisWingWang);
         }
         else
         {
            addButton(0,"主角舔阴",giveKatOralPussyLicking);
         }
         if(!get_player().isGenderless())
         {
            addButton(1,"凯丝舔舐",katherineGivesPCOralAllDayLongDotJPG);
         }
         else
         {
            addButtonDisabled(1,"凯丝舔舐","此场景需要你有生殖器。");
         }
         addButton(14,"返回",katSexMenu);
      }
      
      public function needIntroductionFromScylla() : Boolean
      {
         if(get_game().time.hours > 8 && get_game().time.hours < 18)
         {
            return get_player().hasKeyItem("Silver Kitty-Bell");
         }
         return false;
      }
      
      public function milkOptionSet(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1258,FlagDict_Impl_.arrayReadInt(_loc2_,1258) | param1);
      }
      
      public function milkOptionClear(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1258,FlagDict_Impl_.arrayReadInt(_loc2_,1258) & ~param1);
      }
      
      public function milkOption(param1:int) : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1258) & param1) > 0;
      }
      
      public function letKatKnotYourCuntPussyFuck() : void
      {
         clearOutput();
         get_images().showImage("katherine-fucks-you-knottily-in-the-vagoo");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            letKatKnotYouCommonDialogue(true);
         }
         outputText("你向凯瑟琳示意你想让她插进你的[vagina]里。[pg]");
         outputText("她" + (get_noFur() ? "" : "毛茸茸的") + "双手立刻开始充满占有欲地揉捏你的" + get_player().assDescript() + "，慢慢向上移动，抓住你的[hips]。[say: 好吧，好吧……既然你想要这样……]你感觉到她用" + cockMultiple("她的","最上面那根") + get_cockLength() + "英寸长的肉棒摩擦你敏感的阴唇，让你感受它" + cockType("橡胶般光滑的","布满倒刺的") + "长度，然后，她向后拉开臀部，毫不犹豫地猛然插到底。");
         if(get_cockNumber() > 1)
         {
            outputText("她的第二根肉棒淫靡地拍打着你的");
            if(get_player().hasCock())
            {
               outputText(get_player().multiCockDescriptLight());
            }
            else if(get_player().balls > 0)
            {
               outputText(get_player().sackDescript());
            }
            else
            {
               outputText("肚子");
            }
            outputText("。");
         }
         var _loc1_:int = get_player().vaginas[0].vaginalLooseness;
         get_player().cuntChange(cockArea(),true,true,false);
         outputText("[pg]");
         if(_loc1_ < get_player().vaginas[0].vaginalLooseness)
         {
            outputText("你忍不住惊呼出声，回头看向凯瑟琳，她倒是显得有些歉意。[say: 抱歉！但我必须快点插进去——还是说你想等到我的结完全肿起来？]你承认她说得有道理，但还是要求她下次记得温柔一点。[pg]");
         }
         outputText("她的手指掐进你的臀部，开始在你体内前后抽插");
         if(get_cockNumber() > 1)
         {
            outputText("，她的第二根肉棒仍然湿漉漉地拍打着你，随着它的弹动，抹上了一缕缕拉丝的淫液");
         }
         outputText("。她发出粗重的喘息和呻吟。[saystart]哦——哦，对，你真是不可思议！!");
         if(get_player().harpyScore() >= 4 || get_player().sharkScore() >= 4 || get_player().catScore() >= 4 || get_player().dogScore() >= 4 || get_player().bunnyScore() >= 4)
         {
            outputText("嗯……对，就是这样，为我呻吟吧，你这个小荡妇；谁是阿尔法，嗯？凯瑟琳是你的阿尔法——快，说出来！[sayend]她大喊着，更加用力地撞击着你，她的爪子伸出，刚好刺入你的血肉，带来阵阵刺痛，与快感相互交织。");
         }
         else
         {
            outputText("[sayend]");
         }
         outputText("[pg]");
         outputText("你呻吟着喘息，将屁股向后顶向你猫科情人的小腹，以迎合她的操弄");
         if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 9 || get_player().tail.type == 3)
         {
            outputText("，你的尾巴蜿蜒而上，穿过她的双乳，调皮地抚摸着她的脸颊，");
         }
         outputText("大声呼喊着她的名字。你能感觉到她的结在你体内开始膨胀，同时她也加快了抽插的速度。[pg]");
         outputText("[say:哦哦哦！我要把你塞满；用猫咪的精液把你填满！]凯瑟琳呻吟着，她的结在你体内膨胀到最大尺寸，将你们锚定在一起，使她无法再拔出。");
         _loc1_ = get_player().vaginas[0].vaginalLooseness;
         get_player().cuntChange(cockArea(),true,true,false);
         outputText("她向前猛扑，抓住你的肩膀，试图插得更深。");
         if(_loc1_ < get_player().vaginas[0].vaginalLooseness)
         {
            outputText("她塞进你体内的肿胀肉棒数量已经到了疼痛的边缘，但更多的是充斥着你的快感。");
         }
         else
         {
            outputText("多亏了你的小穴像手套一样紧紧贴合着她的结，被这样塞满感觉只有舒服。");
         }
         outputText("[pg]");
         outputText("当你的高潮突然席卷全身时，你颤抖着喘息，淫液从你的[vagina]中飞溅而出");
         if(get_player().hasCock())
         {
            outputText("你的肉棒喷射出");
            if(get_player().cumQ() < 25)
            {
               outputText("几滴");
            }
            else if(get_player().cumQ() < 100)
            {
               outputText("飞溅的");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("一滩");
            }
            else
            {
               outputText("名副其实的精液湖泊" + (isAt(1) ? "在床上" : "在小巷里"));
            }
         }
         outputText("。[pg]");
         outputText("她突然弓起背，发出一声愉悦的嚎叫，她的高潮随之而来，在她体内荡漾；她呻吟着，射在你体内");
         if(get_cockNumber() > 1)
         {
            outputText("，更多的精液从她的第二根肉棒喷射而出，涂满了你的肚子和下面的" + (isAt(1) ? "床单" : "地面"));
         }
         outputText("。");
         if(cumQ() <= 500)
         {
            outputText("对于" + (hasBalls() ? "这么小的蛋蛋" : "一个没有蛋蛋的双性人") + "来说，她制造了惊人数量的精液，你能感觉到它在你体内晃动和发出吧唧声，让你美味地充满了猫咪的精华。");
         }
         else if(cumQ() <= 1500)
         {
            outputText("一股又一股的精液喷射进你的体内，" + (pregSize() > 0 ? "" : "一直淹没到你的子宫；") + "当" + cockType("长着狗鸡巴的猫","带刺的龟头") + "停止时，你的肚子已经开始因为她给你的一切而鼓起来了。");
         }
         else
         {
            outputText("她射了又射，射了又射；她怎么能在她的" + (hasBalls() ? "蛋蛋" : "前列腺") + "里装下这么多精液？你的" + (pregSize() > 0 ? "小穴" : "子宫") + "被淹没了，直到她结束时，你看起来确实怀孕了，而且");
            if(get_knotSize() >= 6)
            {
               outputText("只有她巨大的结把一切都塞在你的体内。");
            }
            else
            {
               outputText("甚至有些精液开始从她的结周围漏出来。");
            }
         }
         outputText("射完精后，她软绵绵地瘫倒在背上——不过多亏了她的结，她仍然插在你体内，当她的重量把你向后拉时，你惊叫出声。[pg]");
         outputText("[say: 哎呀。抱歉，]凯瑟琳道歉道。");
         if(get_knotSize() >= 6)
         {
            outputText("[say: 恐怕我们得一直保持这个姿势，直到我消肿——我不敢想象如果硬拔出来会把你弄得多疼。]");
         }
         else if(get_knotSize() >= 4)
         {
            outputText("[say: 给我一点时间，我应该能消肿到足以从你体内拔出来的程度。]");
         }
         else
         {
            outputText("[say: 如果你用力拉，我应该能直接从你体内拔出来。]");
         }
         outputText("[pg]");
         if(get_player().vaginalCapacity() >= 100 && isAt(0))
         {
            outputText("对于光着身子被插在小巷里等待的想法感到不知所措，而且渴望看到凯瑟琳脸上的表情，你还是用力拔开了；你被彻底撑开的小穴只发出了一声长长的吸吮声，就松开了那个结。摆脱了她之后，你回头看去。正如你所料，凯瑟琳一言不发地坐在那里，张着嘴，交替盯着你那被蹂躏得流着精液的小穴，以及你刚刚设法让它通过的巨大肉块。");
         }
         else
         {
            outputText("你告诉她没关系；你会留在这里陪她，顺其自然。尽管由于你们各自的位置，你无法真正看到她，但你知道她在微笑。");
         }
         outputText("[pg]");
         if(get_player().vaginalCapacity() < 100)
         {
            outputText("大约一个小时后，她消肿了，你");
         }
         else
         {
            outputText("Y");
         }
         outputText("穿好衣服，向她道谢，然后回到了你的营地。");
         get_player().orgasm("Vaginal");
         orgasm();
         dynStats(DynStat.Sens(-1));
         get_player().slimeFeed();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(8);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function letKatKnotYouCommonDialogue(param1:Boolean) : void
      {
         if(param1)
         {
            outputText("凯丝一口气喝完最后一点饮料，抓住你的手，把你拉向小巷。[pg]");
            outputText("一到外面，她就给了你一个大大的拥抱，全身因兴奋而泛红。[say: 你刚才在酒吧里说什么来着？我有点走神了。][pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
         }
         var _loc2_:Boolean = hasAlready(120);
         var _loc3_:String = isAt(1) ? "床上" : "地上";
         outputText("你问凯瑟琳是否想进入你。她" + (_loc2_ ? "" : "看起来有些惊讶，然后") + "笑得像只偷腥的猫。[say: 那么，好吧……]她宣布道，迅速脱下衣服。[say: 脱掉衣服，转过身去，跪在" + _loc3_ + "。]她的" + cockType() + "肉棒" + cockMultiple("已经","已经") + "开始从包皮里探出头来，仿佛在呼应她的指示。[pg]");
         outputText("你乖乖照做，但还是忍不住打趣她想要“后入式”做爱。[pg]");
         outputText("这个" + cockType("长着不对称肉棒的","") + "扶她走到你身后，调皮地拍了一下你的[ass]。[saystart]好吧，我");
         if(hasDogCock())
         {
            outputText("长着" + cockMultiple("一根狗肉棒","狗肉棒"));
         }
         else
         {
            outputText("长着" + cockMultiple("一根狗肉棒","狗肉棒") + "已经很长时间了");
         }
         outputText("，所以我只是顺应自然，[sayend]她打趣道。");
         if(get_player().hasVagina())
         {
            outputText("[say: 那么，你想让我用哪个洞？]");
         }
      }
      
      public function letKatKnotYou() : void
      {
         clearOutput();
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("在你等待凯瑟琳喝完饮料时，你开始用" + (get_player().hasTailInsteadOfLegs() ? "尾巴尖" : "脚趾") + "在她的腿上蹭来蹭去。[pg]");
            outputText("当你细数你想和她做的所有事情时，凯丝颤抖了一下，但你注意到当你谈到让她把她的" + cockType() + "肉棒" + cockMultiple("","s") + "插进你的身体时，她最兴奋。[pg]");
         }
         else
         {
            letKatKnotYouCommonDialogue(false);
         }
         menu();
         if(get_player().hasVagina())
         {
            addButton(0,"小穴",letKatKnotYourCuntPussyFuck);
            if(get_cockNumber() > 1)
            {
               addButton(2,"双插",getDoublePennedByKat);
            }
            else
            {
               addButtonDisabled(2,"双插","这个场景需要凯丝有两根肉棒。");
            }
         }
         else
         {
            addButtonDisabled(0,"小穴","这个场景需要你有一个小穴。");
            addButtonDisabled(2,"双插","这个场景需要你有一个小穴。凯丝需要有两根肉棒。");
         }
         addButton(1,"肛门",getPenetrated);
         if(get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,403) > 0)
         {
            addButton(3,"边吸边操",suckedNFuckedByKat);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,403) <= 0)
         {
            addButtonDisabled(3,"边吸边操","这个场景需要你和凯丝有过一些性经验。");
         }
         else
         {
            addButtonDisabled(3,"边吸边操","这个场景需要你有一根肉棒。");
         }
         if(isAt(5) || isAt(6))
         {
            addButton(4,"后室",drunkFuck);
         }
         else if(isAt(4))
         {
            addButtonDisabled(4,"后室","也许如果她再多喝点……...");
         }
         addButton(14,"返回",katSexMenu);
      }
      
      public function leaveKittyKatsLikeANeeeeeerrrrd() : void
      {
         clearOutput();
         outputText("你决定还是不要卷入其中为好。毕竟，谁知道她做了什么？她显然是个流浪汉，可能偷了其他人的东西。见鬼，在这个地方你见过了那么多变态，她没准有强奸癖呢。如果她真的遇到麻烦，肯定会尖叫着引来守卫的。");
         outputText("[pg]你把这件事抛在脑后，向城市深处走去。你还有事情要处理。");
         get_telAdre().telAdreMenuShow();
      }
      
      public function leaveKathYouDontWantThatNastyHermCock() : void
      {
         clearOutput();
         outputText("你决定最好不要和这种奇怪的雌雄同体嵌合体扯上关系。她显然是个麻烦精，最好避开。");
         outputText("[pg]你把这件事抛在脑后，向城市深处走去。你还有事情要处理。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1184,1);
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function knownLovers() : int
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1228) > 0 ? 1 : 0) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1229) > 0 ? 1 : 0) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1230) > 0 ? 1 : 0) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1231) > 0 ? 1 : 0) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 0 ? 1 : 0) + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 0 ? 1 : 0);
      }
      
      public function knotAdj() : String
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,401))
         {
            case 0:
            case 1:
            case 2:
            case 3:
               return "小";
            case 4:
            case 5:
               return "相当大的";
            default:
               return "巨大";
         }
      }
      
      public function katherinesHistory() : void
      {
         clearOutput();
         outputText("你告诉凯丝你对她很好奇。她是怎么流落街头的？她是在那里出生的，还是仅仅失去了家人？[pg]");
         outputText("[say: 不，不，没那么戏剧化。]猫女笑道。[say: 我的族人基本上在我出生前就都搬到了特尔阿德雷——母亲过去常抱怨我一路上都在她肚子里踢腾——当时我们自己的城市被恶魔洗劫一空。我们不得不在城市的贫民区安顿下来——我们很幸运，特尔阿德雷已经失去了很多人，否则他们可能会把我们拒之门外。我出生在街头，也在这里长大，]她解释道。[pg]");
         outputText("你问这是否意味着凯丝的全家都像她一样是街头流浪者？[pg]");
         outputText("[say: 不，不，完全不是这样。]她有些不好意思地看了看自己的手。[say: 我……呃……这其实有点尴尬。好吧，嗯……我父母总是很有和人打交道的天赋，能以便宜的价格给他们想要和需要的东西。所以，没过多久，他们就在主街旁一起开了一家小店。我从小就住在那里；有点拥挤，但很舒适——那是一种安静、安全的生活。不幸的是，我就是你们所说的那种叛逆少年；我过去整天在街上闲逛，拒绝去上学或学习一门手艺。然后，有一天晚上，我决定离家出走，全职在街头生活，因为我听到他们谈论要把我送到守卫队当新兵。][pg]");
         outputText("她咧嘴一笑。[say: 不幸的是，这意味着从那以后我不得不成为一个流浪者；我不敢回家，因为我根本不打算加入守卫队，但是，嗯，我也没有任何赚取干净钱的门路。][pg]");
         outputText("她看到了你的眼神，急忙预判了你的反应。[say: 但别担心，我其实挺喜欢我的生活的！没人对我发号施令，我可以自己安排时间……真的，没那么糟。][pg]");
         outputText("你对此表示怀疑，但觉得现在你也无能为力。");
         talkToKatherine(katherinesHistory);
      }
      
      public function katherinesAppearance(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         get_images().showImage("katherine-examine-her-appearance");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4)
         {
            outputText("凯瑟琳站在你面前，紧张地看着你打量她的身体。[say: 嗯……你喜欢你看到的吗？]她紧张地试图打破僵局，笨拙地想要炫耀自己的身体，摆出了一个……在她心里可能觉得很性感的姿势。[pg]");
         }
         else if(get_game().time.hours >= 10)
         {
            outputText("凯瑟琳站在你面前，满脸自豪。她的手指在自己身上游走，希望能给你点暗示。[say: 你有什么想做的吗？]她发出满足的呼噜声。[pg]");
         }
         outputText("凯瑟琳是一个身材苗条的" + (hasCock() ? "扶她" : "") + "猫");
         if(get_furry() && !get_noFur())
         {
            outputText("娘，身高大约5英尺2英寸。");
            if(get_hairColor() == "jet black")
            {
               outputText("她的毛发和");
            }
            else
            {
               outputText("她的毛发是黑色的，但");
            }
         }
         else
         {
            outputText("女孩，身高大概5英尺2英寸。她有一对猫耳和一条尾巴，上面都覆盖着黑色的毛发。她的皮肤是乳白色的，并且");
         }
         outputText("她齐肩的头发经常向前梳，遮住她一只叶绿色的眼睛，" + (get_furry() && !get_noFur() && get_hairColor() == "jet black" ? "是" : "是"));
         if((!get_furry() || get_noFur()) && get_hairColor() == "jet black")
         {
            outputText("和她耳朵和尾巴上的毛发一样黑。[pg]");
         }
         else
         {
            outputText(get_hairColor() + "。[pg]");
         }
         clothes();
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222))
         {
            case 1:
               outputText("[pg]你提到你想仔细看看她。她急切地把你带进附近的一条小巷，脱下衣服，让你如愿以偿");
               break;
            case 2:
               outputText("你还没来得及开口，她就开始脱衣服，让你看个清楚");
               break;
            case 4:
               outputText("在你注视下，她开始以最性感的方式扭动着脱下紧身衣");
               break;
            case 8:
               outputText("她慢慢地解开每一个扣子，然后才从裙子里走出来，以此来挑逗你");
               break;
            case 16:
               outputText("凯丝微笑着脱下长袍，任由它们皱巴巴地掉在地板上，同时她脱下内衣，为你摆出裸体的姿势");
               break;
            case 32:
               outputText("你还没来得及开口，她就开始剥去衣服，让你看个清楚");
               break;
            case 64:
               outputText("你还没来得及开口，凯丝就解开了紧身上衣的扣子，滑下裙子，让你看个清楚");
               break;
            default:
               outputText("在你的示意下，她温顺地脱下衣服，以便你能更好地看清她");
         }
         outputText("。[pg]");
         outputText("两只" + get_breasts().adj() + "的" + get_breasts().cup() + "乳房" + (get_breasts().milkIsFull() ? "，饱含着乳汁，" : "") + "挺立在她的胸前" + (get_breasts().milkIsOverflowing() ? "。她的乳头直立着，准备好被挤奶了" : ""));
         if(hasCock())
         {
            outputText("，而在她的肚脐正下方，坐落着一个明显的兽性阴茎鞘。害羞地，她的" + cockMultiple("阴茎开始","阴茎开始") + "从里面滑出；一" + cockMultiple("根","对") + cockType() + "阴茎" + cockMultiple("","") + cockWidth() + "英寸粗，" + get_cockLength() + "英寸长，露出" + cockMultiple("了它自己，在它的底部有一个","了它们自己，在它们的底部有") + get_knotSize() + "英寸粗的结" + cockMultiple("。","。"));
            if(!hasBalls())
            {
               outputText("就在凯丝的" + cockMultiple("阴茎","双茎") + "正下方是");
            }
            else
            {
               outputText("一对" + get_ballSize() + "英寸宽的睾丸在她的阴茎" + cockMultiple("","") + "下方摇晃，悬挂在正上方");
            }
         }
         else
         {
            outputText("在她的双腿之间休息着");
         }
         outputText("她湿润、渴望的小穴。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4)
         {
            outputText("当你欣赏完之后，她迅速穿好衣服，仿佛不经意般向你炫耀着她的臀部，等待着看你还有什么吩咐。你没有发表什么评论，这让她感到安心。");
            katherineMenu();
         }
         else if(get_game().time.hours >= 10)
         {
            outputText("凯瑟琳一丝不挂，尾巴愉悦地摇摆着，伸了个懒腰，向你尽情展示着她最私密的部位。[say:喜欢你看到的吗，亲爱的？]她发出满足的呼噜声。[pg]");
            outputText("哦，是的，你告诉她。衣服穿在她身上很好看，而衣服下面隐藏的风景则更加迷人。[say:我确实喜欢听你这么说，]她回答道，[say:但这里有点冷。]她的尾巴因为压抑的精力而抽动着，双手顺着身体两侧滑下，" + catGirl("抚摸着她乳白色的肌肤","抚平她闪亮的皮毛") + "，然后问道：[say:你能想个办法让我暖和起来吗？][pg]");
            outputText("她开始收拾衣服，穿衣服的动作几乎和脱衣服时一样诱人。[pg]");
            katherineMenu();
         }
      }
      
      public function katherineVisitNormal(param1:Boolean = true) : void
      {
         outputText("猫人凯丝目前正");
         switch(Utils.rand(5))
         {
            case 0:
               outputText("坐在角落里");
               break;
            case 1:
               outputText("来回踱步");
               break;
            case 2:
               outputText("偷偷地喝着一瓶牛奶");
               break;
            case 3:
               outputText("打着哈欠伸懒腰");
               break;
            default:
               outputText("从猫觉中醒来");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 1)
         {
            outputText("，当她看到你时，她笑了。[say: [name]！你是来看我的吗？]");
            if(param1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) > 2)
            {
               get_telAdre().katherineEmployment.talkToKath();
               return;
            }
            katherineMenu();
         }
         else
         {
            outputText("。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) >= 100)
            {
               if(get_urtaDisabled())
               {
                  get_telAdre().katherineEmployment.katherineTrainingCompleteThereIsNoUrta();
               }
               else
               {
                  get_telAdre().katherineEmployment.katherineTrainingComplete();
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) >= 66)
            {
               get_telAdre().katherineEmployment.katherineTrainingStage3();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) >= 33)
            {
               get_telAdre().katherineEmployment.katherineTrainingStage2();
            }
            else
            {
               get_telAdre().katherineEmployment.katherineTrainingStage1(false);
            }
         }
      }
      
      public function katherineSprite(param1:Boolean = false) : void
      {
         if(param1)
         {
            spriteSelect(SpriteDb.get_s_katherine_vagrant());
            return;
         }
         spriteSelect(SpriteDb.get_s_katherine_vagrant());
      }
      
      public function katherineSex() : void
      {
         clearOutput();
         if(get_game().urta.drainedByKath)
         {
            outputText("你当然能想到一些可以和这只发情小猫做的事情，尤其是在她那番展示之后，于是你引导她走向后门。凯瑟琳用爪子抓着你的腰带，但你控制住了她，直到你们俩都离开了其他顾客的视线。你给了凯丝一个快速的吻，并意识到在她自己动手之前，你只有片刻的时间来决定你想对她做什么。");
         }
         else if(isAt(4))
         {
            outputText("你问凯丝有没有心情找点乐子。[pg]");
            outputText("[say: 你这话是什么意思，" + playerText() + "？]她调皮地问道。[pg]");
            outputText("你指出酒吧后面有一条小巷。如果她需要复习一下如何抓捕歹徒，你可以帮她一把。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 10 ? " 你瞥了一眼乌尔塔的桌子，补充说也许你可以去和乌尔塔队长谈谈程序不当的问题。" : "") + "[pg]");
         }
         else
         {
            outputText("你问凯瑟琳有没有心情做爱。[pg]");
            outputText("这个猫" + (hasCock() ? "扶她" : "娘") + "显然被你的直接吓了一跳，然后回过神来，给了你一个咧到耳根的笑容。[say: 嗯……我当然想……有什么特别的偏好吗？]她问道，慵懒地左右摇摆着尾巴。");
         }
         katSexMenu();
      }
      
      public function katherineSeeVala() : void
      {
         clearOutput();
         outputText("凯丝看起来已经准备好找点乐子了，但在你开始之前，另一件事吸引了你的注意。你注意到瓦拉正坐在吧台的一端，她的托盘靠在旁边。今晚似乎没什么客人，瓦拉看起来很无聊。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) < 5 ? "你决定是时候开阔一下她们的眼界了，于是" : "你知道她们喜欢彼此的陪伴，所以你") + "示意她过来。[pg]");
         outputText("瓦拉迅速飞了过来。当她到达时，你拍了拍你旁边的座位。你坐在你顺从的猫" + catGirl("女孩","形态") + "和你的超大号仙女之间。你确实走了一条奇怪的路才来到这里。");
         menu();
         addButtonDisabled(1,"舔阴","这个场景需要凯丝有阴茎。");
         addButtonDisabled(2,"双管齐下","这个场景需要凯丝和你都有阴茎。它不适用于半人马。");
         addButton(0,"拳交她们",get_telAdre().katherineThreesome.fistKathAndVala);
         if(hasCock())
         {
            addButton(1,"舔阴",get_telAdre().katherineThreesome.eatOutVala);
            if(!get_player().isTaur() && get_player().hasCock())
            {
               addButton(2,"双管齐下",get_telAdre().katherineThreesome.doubleStuffVala);
            }
         }
      }
      
      public function katherineSeeUrta() : void
      {
         var urtaIsDrunk1:Boolean;
         var _g1:KatherineThreesome;
         var urtaIsDrunk:Boolean;
         var _g:KatherineThreesome;
         clearOutput();
         if(get_game().urta.urtaDrunk())
         {
            outputText("凯瑟琳看向乌尔塔的桌子，看到队长显然已经喝醉了。她喝完酒，低声说：[say: 现在，" + playerText() + "，我想我们都知道，如果我过去，乌尔塔会把我按在地板上操。][pg]");
            outputText("你微笑着说：[say: 只有你好好求她才行。][pg]");
            outputText("凯丝站起来，向你伸出手。[say: 我想我最好带你一起去。我可能需要帮忙，而且，你总是有一些有趣的点子。][pg]");
            outputText("当你们俩穿过空地时，乌尔塔抬起头，她的马鸡巴迅速勃起。");
            menu();
            _g = get_telAdre().katherineThreesome;
            urtaIsDrunk = true;
            addButton(0,"观看",function():void
            {
               _g.watch(urtaIsDrunk);
            });
            if(hasCock())
            {
               addButton(1,"按住并操",get_telAdre().katherineThreesome.pinAndFuck);
            }
            else
            {
               addButtonDisabled(1,"按住并操","此场景需要凯丝拥有阴茎。");
            }
         }
         else
         {
            outputText("凯瑟琳看向乌尔塔的桌子。乌尔塔发现她在看，便示意你们俩过去。[pg]");
            outputText("凯丝向你伸出手，说道：[say:我想我们最好还是过去吧。乌尔塔看起来真的很饥渴，我可不想让她失望。][pg]");
            outputText("感受到凯瑟琳身上传来的温度，你觉得她把自己的部分情绪投射到了乌尔塔身上。这对你来说并不重要。不管你怎么玩，你最后都很可能左拥右抱两个火辣赤裸的" + (hasCock() ? "扶她" : "女孩") + "。作为勇者的生活有时就是这么艰难。[pg]");
            menu();
            addButtonDisabled(0,"烤你","这个场景需要凯丝有阴茎。");
            addButtonDisabled(1,"烤凯丝","这个场景需要你有生殖器。");
            addButtonDisabled(2,"互撸","这个场景需要你有生殖器。");
            addButtonDisabled(3,"369","这个场景需要你有阴茎。");
            if(hasCock())
            {
               addButton(0,"烤你",get_telAdre().katherineThreesome.roastYou);
            }
            if(!get_player().isGenderless())
            {
               addButton(1,"烤凯丝",get_telAdre().katherineThreesome.spitroastKath);
               addButton(2,"互撸",get_telAdre().katherineThreesome.circlejerk);
               if(get_player().hasCock())
               {
                  addButton(3,"369",get_telAdre().katherineThreesome.threeSixtyNine);
               }
            }
            else if(!hasCock())
            {
               _g1 = get_telAdre().katherineThreesome;
               urtaIsDrunk1 = false;
               addButton(4,"观看",function():void
               {
                  _g1.watch(urtaIsDrunk1);
               });
            }
         }
      }
      
      public function katherineRacialTension() : void
      {
         clearOutput();
         outputText("你向凯丝提到，你忍不住注意到她和她所有的……呃，“朋友”都是猫，而这座城市似乎主要由狗组成。这和她基本上是个流浪者有什么关系吗？[pg]");
         outputText("[say: 啊……好吧，我不会说这完全是我们流落街头的原因，但我承认这绝对起了一定作用。守卫队的大多数成员都是某种犬类，而且，嗯，他们确实倾向于把任何他们怀疑惹麻烦的猫往最坏的方面想。]凯丝耸了耸肩。[pg]");
         outputText("你评论说，你本以为恶魔的威胁会让人们忘记这样的偏见。[pg]");
         outputText("[say: 我们现在比以前团结多了，但是，说实话，旧观念很难改变，你知道吗？马是愚蠢的、性欲旺盛的畜生，半人马是自负且态度恶劣的马，狗是迟钝的，狼是野蛮的，猫是懒惰的，老鼠是懦弱的，狐狸是游手好闲的……嗯，你可以看出情况如何。]这个" + (hasCock() ? "扶她" : "") + "猫人一边发表这番声明，一边在空中挥舞着一只" + (get_noFur() ? "" : "毛茸茸的") + "手。[say: 此外，又不是每天都有恶魔在城墙上敲打，每天早上提醒我们所有人还有更大的威胁，你知道的？][pg]");
         outputText("你条件反射地咂了咂舌。");
         talkToKatherine(katherineRacialTension);
      }
      
      public function katherineOnDutyLeave() : void
      {
         outputText("最好不要给凯丝惹麻烦。你向她告别，承诺等她下班后会去看她。[pg]");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function katherineOnDuty() : void
      {
         clearOutput();
         katherineSprite();
         outputText("当你走在特尔阿德雷的街道上时，你注意到一小队守卫正在巡逻。其中一个看向你这边，你看到了一张熟悉的面孔。凯丝对其中一名守卫说了些什么。很快，凯丝就朝你走来，而其他人则走向附近的一家咖啡馆。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 4)
         {
            outputText("[say: [name]！]她大声喊道，径直跑进你的怀里。[say: 我一直希望能碰到你——给，]她说着，把一把钥匙塞进你手里。[say: 在城门看到你的时候我太激动了；完全忘了把这个给你。这是我新家的钥匙。]她说话时骄傲地笑着。[pg][say: 请随时过来，那样我们想干什么都行，]她补充道，然后吻了你，用尾巴缠住你的腰。她在你耳边轻声说了去她新家的路线，然后松开你，退后了一步。[pg][saystart]现在，至于眼下，你");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,398,5);
         }
         else
         {
            outputText("当她跑到你面前时，凯丝猛地停下脚步。[say: " + (playerMaster() ? "[master]" : "嗨，[name]") + "！]她咧嘴笑着说。[saystart]你");
         }
         outputText("你来的正是时候。我们本来就该休息了。[sayend]在她说更多之前，凯丝直起身子，随意地把手背在身后，移动身体以突出她的乳房和" + (hasCock() ? "胯部的凸起" : "臀部的曲线") + "。[say: 那么……我看起来怎么样？]她发出呼噜声问道。[pg]");
         katherinesAppearance(false);
         outputText("全裸着，尾巴愉悦地摇摆着，凯丝伸了个懒腰，向你很好地展示了她最私密的部位。[say: 喜欢你看到的吗，我的爱人？]她发出呼噜声。[pg]是的，你喜欢，你告诉她。她的制服很适合她，你当然也很欣赏她那轻浮的新态度。你示意她转个圈。这只猫" + catGirl("娘","人") + "按照你的指示，以令人惊讶的优雅缓慢地转了一圈，当她重新面对你时，对你咧嘴一笑。[say: 你下班后真应该来看看我，]她眨了眨眼，甚至弯下腰，扭动着屁股，开始重新穿上衣服。当她开始重新穿衣时，你忍不住感到有些失望。[pg][say: 但是……我还有一点时间，如果你想做点别的事情……？]她带着性感的眨眼发出呼噜声。[pg]");
         menu();
         addButton(0,"口交",hasCock() ? giveKatOralPenisWingWang : giveKatOralPussyLicking);
         if(!get_player().isGenderless())
         {
            addButton(1,"凯丝舔舐",katherineGivesPCOralAllDayLongDotJPG);
         }
         else
         {
            addButtonDisabled(1,"凯丝舔舐","此场景需要你有生殖器。");
         }
         if(get_player().hasCockThatFits(70))
         {
            addButton(2,"操她",penetrateKatsVag);
            addButton(3,"肛交",pcPenetratesKatAnally);
         }
         else
         {
            addButtonDisabled(2,"操她","此场景需要你有阴茎。");
            addButtonDisabled(3,"肛交","此场景需要你有阴茎。");
         }
         addButton(14,"离开",katherineOnDutyLeave);
      }
      
      public function katherineMenu() : void
      {
         var _g6:Katherine;
         var _g5:Katherine;
         var _g4:Katherine;
         var _g3:Katherine;
         var _g2:Katherine;
         var _g1:Katherine;
         var _g:Katherine;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4)
         {
            menu();
            addButton(0,"做爱",katherineSex);
            _g = this;
            addButton(1,"交谈",function():void
            {
               _g.talkToKatherine();
            });
            _g1 = this;
            addButton(2,"外貌",function():void
            {
               _g1.katherinesAppearance();
            });
            _g2 = this;
            addButton(3,"赠送物品",function():void
            {
               _g2.giveKatherineAnItem();
            });
            addButton(14,"返回",get_telAdre().telAdreMenu);
         }
         else if(isAt(1))
         {
            menu();
            _g3 = this;
            addButton(0,"外貌",function():void
            {
               _g3.katherinesAppearance();
            });
            addButton(1,"做爱",katherineSex);
            _g4 = this;
            addButton(2,"赠送物品",function():void
            {
               _g4.giveKatherineAnItem();
            });
            addButton(5,"约会",katherineDate);
            _g5 = this;
            addButton(6,"交谈",function():void
            {
               _g5.talkToKatherine();
            });
            addButton(14,"离开",katherineApartmentLeave);
         }
         else
         {
            menu();
            if(pregSize() == 0)
            {
               addButton(0,"喝酒",katherineDrinkUp);
            }
            else
            {
               addButtonDisabled(0,"喝酒");
            }
            addButton(1,"做爱",katherineSex);
            addButton(5,"约会",katherineDate);
            _g6 = this;
            addButton(6,"交谈",function():void
            {
               _g6.talkToKatherine();
            });
            addButton(14,"离开",get_telAdre().telAdreMenu);
         }
      }
      
      public function katherineLicksAllTheBoyPenises() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         get_images().showImage("katherine-gives-you-blowjobs/");
         outputText("她急切地握住你的肉棒，用手指轻轻抚摸它以哄它勃起，然后倾身用她柔软的带刺舌头舔舐龟头，抚摸并吸吮着" + get_player().cockHead(_loc1_) + "。");
         if(get_player().hasVagina())
         {
            outputText("她的一只手顺着你的肉棒滑下");
            if(get_player().balls > 0)
            {
               outputText("，滑过你的[balls]，");
            }
            outputText("并开始温柔地抚摸你的小穴，她灵巧地转动手指，同时刺激你的两套器官，让你的快感倍增。");
         }
         outputText("[pg]");
         outputText("当你的先头液开始流出时，她完全靠了过来，尽可能多地吞下你的肉棒，她那非人的舌头以你无法想象的方式抚摸和爱抚着。");
         if(get_player().hasVagina())
         {
            outputText("同时，她将手指插入你的小穴，以提升你的体验。");
         }
         outputText("她嘴里含着惊人数量的皮肤，开始上下套弄和吸吮，将你的阴茎限制在那火热、紧致、湿润的空间里，她的舌头继续着它的服侍。她开始发出愉悦的呼噜声，将最美妙的震动传递到你的阴茎上。");
         if(get_player().hasVagina())
         {
            outputText("她的手指在你体内抽插抚摸，这种同步性只有另一个双性人才能完美掌握，她揉捏着你的[clit]，让更多的快感火花在你的大脑中流窜。");
         }
         outputText("[pg]");
         outputText("面对如此强烈的快感，你的抵抗微乎其微；很快，你就感觉到你的");
         if(get_player().balls == 0)
         {
            outputText("肉棒一阵酥麻");
         }
         else
         {
            outputText("蛋蛋紧缩");
         }
         outputText("，因为你即将释放。没有更多的犹豫，你在那只急切的猫" + (hasCock() ? "双性人" : "娘") + "的嘴里爆发了，让她饥渴地吞下尽可能多的精液。");
         if(get_player().cumQ() <= 250)
         {
            outputText("她如释重负地喝下每一滴，湿漉漉地从你的肉棒上拔出，舔了舔嘴唇，发出清晰可闻的愉悦呼噜声。");
         }
         else if(get_player().cumQ() <= 600)
         {
            outputText("她拼命地吞咽着，肚子因为精液的涌入而膨胀，但她设法避免了任何溢出，一觉得你完事了，她就拔出头来大口喘气。");
         }
         else
         {
            outputText("你可以从她的眼神中看到一丝恐慌，因为从你的" + get_player().cockDescript(_loc1_) + "中涌出的液体如同瀑布一般，但这被她喝光每一滴的决心所淹没。她的肚子像在瀑布下接水的水袋一样膨胀起来，精液从她不堪重负的嘴里溢出，但她设法坚持住，直到你完事才把肉棒从嘴里拿出来。之后，她气喘吁吁地从你的肉棒上离开，给了你一个胜利的表情，并打了个轻微的嗝。");
         }
         outputText("[pg]");
         outputText("她虚弱地瘫坐在地上，用她那" + catGirl("光滑的","毛茸茸的") + "屁股着地，抬头对你微笑。[say: 我猜你很享受吧？]她调侃道。你承认她做得非常好，" + (isAt(1) ? "温柔地抚摸她的头发以示感谢" : "扶她起来，送她到她自己的“床”上") + "，然后穿好衣服，回到特尔阿德雷的街道上。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function katherineGreeting() : void
      {
         clearOutput();
         outputText("斯库拉看到你走近，微笑着礼貌地向你打招呼。[say: 哎呀，你好，[name]；很高兴见到你。你需要什么吗？][pg]");
         outputText("你告诉她你需要，并向她展示了你拥有的铃铛，问她是否还记得你们俩一起去执行的那个小任务，最后她去服侍了那些渴望乳汁的猫。[pg]");
         outputText("斯库拉点点头，脸上绽放出愉悦的表情和淡淡的红晕。[say: 是的。可怜的小家伙们……饿到要做那种事。] 然后她停了下来，目光集中在铃铛上，闪烁着欢乐的光芒。[say: 我猜你是想再次见到那个给你铃铛的友善小可爱？] 她问道。当你承认这正是你希望她帮忙的事情时，她立刻果断地站了起来。[say: 那好，我们走吧，让你们俩重新认识一下。] 她温柔地微笑着，转身快步走开，迫使你赶紧跟上。[pg]");
         outputText("斯库拉带你走了一条与上次“遇到”那些猫人时截然不同的路线，把你带到了城市中一个出奇破败的区域。奇怪的是，尽管你知道所有的房子都因为人们被恶魔抓走而空无一人，但周围却有无数明显是流浪汉的人。半人马、狗人、猫人、鼠人、狐狸人、狼人，还有更奇怪的东西——你觉得你一度看到了一个看起来有点像半人马/狼人混血的生物。出于好奇，你忍不住问斯库拉你们在这里做什么。[pg]");
         outputText("这位高大的修女突然大声喊道。[say: 第一次事件发生后，我稍微打听了一下。他们告诉我，那些猫特别喜欢在镇上的这个地方闲逛。事实上……那里！你好！猫先生？我想和你以及你的朋友们谈谈……也许，如果你渴了，我可以请你喝一杯？][pg]");
         outputText("你被斯库拉的举动弄得措手不及，但随后发现一张有些熟悉的" + (get_noFur() ? "" : "猫科动物") + "脸警惕地从角落后面探出来。你特意走开斯库拉，其中一只基本上是为了她的乳汁而抢劫斯库拉的公猫立刻从藏身处溜了出来，其他大约十一只公猫和母猫也迅速加入了他的行列。变异的修女用三片嘴唇微笑着，已经天真地脱下她的修女服，露出她那装满乳汁的巨大乳房。猫们几乎没有犹豫就蜂拥向她，推推搡搡地争着第一个开始亲吻她的乳头，喝饱修女的乳汁。你冷漠地看着这一切——毕竟，这比第一次更像是斯库拉自愿的——然后拿出银铃铛，开始漫不经心地摇晃起来。[pg]");
         outputText("[say: ……真的是你吗？你真的来了？] 旁边传来一个声音；安静、犹豫，充满了同等的希望、怀疑和恐惧。[pg]");
         outputText("环顾四周，你很快就发现了那只孤独的双性猫人，也就是你来这里的原因。她仍然穿着破旧的衣服，过大的衬衫遮住了她B罩杯的乳房，而过紧的裤子则让她的犬科包皮和小巧的睾丸在旁人看来格外显眼。在这样平静的环境下，你能看清她的眼睛，那是相当漂亮的绿色，而她齐肩的头发则是霓虹粉色，与她黑色的" + (get_noFur() ? "耳朵" : "皮毛") + "形成了鲜明的对比。有趣的是，你不记得以前是这个颜色的……终于想起她是在和你说话，你微笑着表示同意。[pg]");
         outputText("她看了看你，又看了看那场小型的喝奶狂欢，然后害羞地指了指附近的一条小巷。[say: 你想去个更私密的地方谈谈吗？]她问道。当你表示同意时，她如释重负地笑了，并把你带走了。一旦你们离开了其他猫的视线，她突然紧紧地抱住了你。[say: 我真不敢相信你真的来了！哦，我梦到过这一幕！]她开心地用脸颊蹭着你，发出咕噜咕噜的声音，然后又胆怯地退开，脸涨得通红。[say: 对不起……只是，以前从来没有人对我表现出兴趣。尤其是带着这个……]她意味深长地抚摸着她那小狗鸡巴的凸起。然后，她似乎想到了什么，用恐惧的眼神看着你。[say: 你——对我有兴趣，对吧？你来这里不是为了骂我喜欢你吧？]从她的语气来看，最后一个问题与其说是打破僵局，不如说是一种恳求。[pg]");
         outputText("你微笑着向她保证你很感兴趣……不过你不得不承认，更亲密的谈话可能要等到下次了。仿佛是配合你的话，其他猫人开心的咕噜声传到了小巷里，他们开始结束与斯库拉的互动。[pg]");
         outputText("长着狗鸡巴的猫点了点头。[say: 对……嘿，主街上有一家当铺——是一个叫奥斯瓦尔德的金毛猎犬开的？你知道吗？]当你点头时，她继续说道，[say: 嗯，奥斯瓦尔德是个很好的人，他有时会买我找到的东西，而且总是给我一个公平的价格，尽管很明显我有多绝望；这些家伙并不在乎我是否在这里，所以我开始在他店后面的小巷里闲逛。我们可以在那里见面——你觉得可以吗？][pg]");
         outputText("你告诉她，这听起来比每次都需要让斯库拉来这里分散注意力要好得多。你把银铃还给了她，并打趣说反正戴在她身上更好看。她给了你一个发自内心的微笑，轻轻地接过它，然后重新把它挂在她的皮项圈上。[pg]");
         outputText("当你走开时，她意识到了什么。[say: 哦！我叫凯丝！你叫什么名字？]她问道。你又笑了笑，告诉了她。她默默地念着这个名字，眼睛里闪烁着幸福的光芒。[pg]");
         outputText("其他的猫四仰八叉地躺在街上，因为喝了斯库拉的奶而肚子鼓鼓的，斯库拉正高兴地把她的修女服穿回去。她给了你一个心照不宣的眼神，但没有说话，带领你走回主街。");
         outputText("[pg]<b>(凯丝的小巷已在奥斯瓦尔德的当铺菜单中解锁！)</b>");
         initFlags();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,398,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function katherineGoesDownOnTheGirlsOhYahBabyLesbo() : void
      {
         clearOutput();
         get_images().showImage("katherine-eats-out-your-vagoo");
         outputText("她轻轻地抚摸你[vagina]的嘴唇，然后倾身给了它一个深沉、湿润的舔舐。你无法抑制这种感觉带来的颤抖；凯瑟琳的舌头与你在这个世界上迄今为止见过的任何东西都不一样，宽阔而长满倒刺，但又不会硬到让你受伤。这就像许多小舌头同时在舔你。[pg]");
         outputText("她毫不犹豫地舔了你一次又一次，深深的舔舐从你小穴的最底部一直滑到顶端，在你的[clit]上流连，挑逗着你的爱豆。你忍不住用[legs]夹住她的头，把她拉向你的胯部，把她的脸直接推到你的阴户上。[pg]");
         outputText("不过，如果这打扰了凯瑟琳，她也没有表现出来；她只是继续舔舐，急切地吸吮着进入你的深处。你在她的服侍下扭动挣扎；那粗糙的舌头在你体内各处的感觉是无法形容的；就像粗糙的指尖，但探索性强了数百倍！最后，你再也忍不住了，随着高潮的洗礼，你大叫出声，将淫水倾注进凯瑟琳饥渴的嘴里，而她则像一只喝着一碗奶油的猫一样努力地舔舐着。[pg]");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("与此同时，你的阴茎" + (int(get_player().cocks.length) > 1 ? "释放了它们的" : "释放了它的") + "精液到空气中，导致精液像雨点一样落在你们俩身上。[pg]");
         }
         outputText("你的快感结束后，你放开了她，大口喘着气，而她则优雅地用手指把脸擦干净。[say:你感觉好吗？]她问道，眼中闪烁着恶作剧的光芒。当你回答时，她得意地笑了。[say:你是不是以为小猫咪很擅长吃小穴？][pg]");
         outputText("你只是对这个绝对糟糕的双关语发出一声呻吟，然后站起来，重新穿好衣服，在快速地啄了她一下以感谢她的时间后，回到了街上。");
         doNext(get_camp().returnToCampUseOneHour);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         get_player().orgasm("Vaginal");
      }
      
      public function katherineGivesPCOralAllDayLongDotJPG() : void
      {
         clearOutput();
         outputText("你告诉凯瑟琳你想看看她的舌头能做什么。黑猫惊讶地眨了眨眼，然后咧嘴笑了。[say:嗯，那可以安排……]她发出呼噜声，拉着你的手臂，" + (isAt(1) ? "引导你到她的床上" : "带你绕到一个特定的板条箱旁") + "。一旦你坐下，你们俩都赤身裸体，她就跪在你面前。[say:现在，让我们看看你有什么，亲爱的……]她说，尾巴像只有快乐的猫才会那样摇摆着。[pg]");
         if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
         {
            doNext(katherineLicksAllTheBoyPenises);
         }
         else
         {
            doNext(katherineGoesDownOnTheGirlsOhYahBabyLesbo);
         }
      }
      
      public function katherineDrunkSeeUrta() : void
      {
         var urtaIsDrunk:Boolean;
         var _g:KatherineThreesome;
         clearOutput();
         outputText("既然你已经让凯丝放下了防备，你建议你们俩去和乌尔塔谈谈。[pg]");
         outputText("[say: 是啊，队长看起来需要人陪陪。][pg]");
         outputText("你不得不扶着凯瑟琳走到乌尔塔的桌前，但一到那儿，凯丝就一屁股坐在乌尔塔旁边的座位上，给了她一个大大的拥抱。[pg]");
         if(get_game().urta.urtaDrunk())
         {
            outputText("乌尔塔回抱了凯丝，说道：[say: 嗨，小可爱，]然后顺手摸了一把凯丝的屁股。[pg]");
            outputText("凯丝发出满足的呼噜声，把头埋进了乌尔塔的胸口。[pg]");
            outputText("你感觉如果你不想让她们现在就地做爱的话，你得赶紧介入了。");
            menu();
            if(submissiveness() >= 3)
            {
               addButton(0,"群交",get_telAdre().katherineThreesome.orgy);
               outputText("另一方面，大家都喜欢群交。");
               outputText("[pg]你");
               outputText("");
            }
            else
            {
               addButtonDisabled(0,"群交","这个场景需要凯丝更加顺从。");
               outputText("[pg]否则你");
            }
            if(get_player().isGenderless())
            {
               outputText("可以让她们俩做爱。不幸的是，你的身体条件实在做不了更多的事了。");
               _g = get_telAdre().katherineThreesome;
               urtaIsDrunk = true;
               addButton(1,"观看",function():void
               {
                  _g.watchNoIntro(urtaIsDrunk);
               });
            }
            else
            {
               outputText("可以让她们俩做爱，然后自己解决，或者你和乌尔塔可以一起填满凯丝饥渴的小穴。");
               addButton(1,"让她们做",get_telAdre().katherineThreesome.doubleStuffKath);
               if(get_player().hasCock())
               {
                  addButton(2,"双插凯丝",get_telAdre().katherineThreesome.doublePenetrateKath);
               }
               else
               {
                  addButtonDisabled(2,"双插凯丝","此场景需要你拥有阴茎。");
               }
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 10)
         {
            outputText("乌尔塔回抱了她，问道：[say: [name]，凯丝——想找点乐子吗？]然后挠了挠凯丝的耳后。[pg]");
            outputText("凯丝向你眨了眨眼，给了乌尔塔一个吻，用略微含糊的声音说：[say: 只有最棒的乐子。].");
            menu();
            addButton(0,"舔阴",get_telAdre().katherineThreesome.kathLicksOutUrta);
            if(hasCock())
            {
               addButton(1,"三明治",get_telAdre().katherineThreesome.sandwich);
            }
            else
            {
               addButtonDisabled(1,"三明治","此场景需要凯丝拥有阴茎。");
            }
            if(!get_player().isGenderless() && hasCock())
            {
               addButton(2,"树洞",get_telAdre().katherineThreesome.knothole);
            }
            else
            {
               addButtonDisabled(2,"树洞","此场景需要凯丝拥有阴茎。你需要拥有生殖器。");
            }
         }
         else
         {
            outputText("乌尔塔轻轻推开凯丝。[say: 哇哦——[name]，我觉得有人喝多了。][pg]");
            outputText("凯丝微笑着，目光向下游移，显然在打量乌尔塔的胸部，然后是她的阴茎。凯丝的声音有些含糊不清，她说：[say: 我喜欢你，队长，]还没等乌尔塔把她抱起来，拖回她的卡座，把凯瑟琳扔回她平时的座位上。[pg]");
            outputText("乌尔塔转向你，低声说：[say: 你最好管管她。如果你不让她发泄一下，她就要开始操桌子腿了。真遗憾，因为我也想从你这里得到点发泄。]" + (get_game().urta.pregnancy.get_isPregnant() ? " 她心不在焉地抚摸着自己怀孕的肚子，盯着你和凯丝。" : "") + "[pg]");
            outputText("当她走开时，凯丝用手托着头，梦幻般地看着你。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,6);
            katSexMenu();
         }
      }
      
      public function katherineDrinkUp() : void
      {
         clearOutput();
         outputText("你坐在凯丝对面，问她在喝什么。[pg]");
         outputText("她向你展示了一个平底玻璃杯，里面装着一些不透明的浅棕色液体。[say: 他们有一种叫维努西亚的奶油利口酒。喝起来就像同时在喝牛奶和烈酒。它度数挺高，但又很有女人味——有点像我。我想这就是我这么喜欢它的原因吧。][pg]");
         outputText("你问这酒的度数是不是高到能让人喝醉。[pg]");
         outputText("[say: 我之前就不小心被这玩意儿灌醉过。就像我说的，它度数挺高的。我在守卫队的第一天，很多人请我喝酒。我吃了不少苦头才发现，我喝醉了就会有点发情。" + (get_urtaDisabled() ? "拉尼斯" : "乌尔塔") + "发现了这一点，赶在我做傻事之前把我送回了家，但现在我每次都只喝一两杯。][pg]");
         outputText("你咧嘴一笑，告诉凯丝既然你在这里，她可以尽情放纵。[pg]");
         outputText("她对你笑了笑，向女服务员招手。当下一杯酒端上来时，她抿了一口说：[say: 我打赌你就是想把我灌醉，因为你觉得我会发情。]你用" + (get_player().hasTailInsteadOfLegs() ? "尾巴尖" : "脚趾") + "摩擦着凯瑟琳的大腿内侧。她仰起杯子，咽下酒液，微笑着又点了一杯。[pg]");
         outputText("没过多久，你就看到了明显的迹象，你的女朋友现在已经喝得烂醉了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,5);
         katSexMenu();
      }
      
      public function katherineDate() : void
      {
         clearOutput();
         outputText("你决定把凯瑟琳带到某个地方可能是个好主意。谁知道你们能找到什么乐子呢？");
         menu();
         if(isAt(1))
         {
            addButton(0,"酒吧",dateGotoBar);
         }
         else
         {
            addButton(0,"凯丝的家",dateGotoKaths);
         }
         addButton(1,"洗澡",dateKathBath);
         addButton(14,"返回",katherineMenu);
      }
      
      public function katherineAtUrtas() : void
      {
         var _loc1_:int = 0;
         outputText("你锁好门，走向乌尔塔的");
         if(isAt(2))
         {
            outputText("公寓。敲了几下门后，" + (hasCock() ? "一对神情局促的扶她" : "你那神情局促的恋人们") + "开了门。[pg]");
            outputText("[say: [name]，说曹操曹操到，]乌尔塔说道，听起来松了一口气。[say: 有那么一瞬间，我还以为我们声音太大，邻居过来投诉了呢。][pg]");
            outputText("凯丝说，[say: 我们刚清理完，所以我正准备回家休息。你想去哪儿？]");
            menu();
            addButton(0,"去凯丝家",dateGotoKaths);
            addButton(1,"去湖边",dateKathBath);
            addButton(2,"去酒馆",dateGotoBar);
            addButton(14,"离开",get_telAdre().telAdreMenu);
         }
         else
         {
            switch(Utils.rand(4))
            {
               case 0:
                  outputText("的房子。你用备用钥匙开门进去，偷偷溜上楼，往主卧室里偷看。[pg]");
                  outputText("在门口你就能闻到做爱的味道。在床上，你可以看到你的两个女孩，" + (hasCock() ? "每个人都因为对方的精液而肚子鼓鼓的" : "乌尔塔的马鸡巴仍然埋在凯丝体内；凯丝的肚子仍然因为乌尔塔的精液而鼓鼓的") + "。她们紧紧地抱在一起，尾巴慵懒地来回摆动着。[pg]");
                  outputText("你可以打个招呼，或者悄悄地离开。");
                  menu();
                  addButton(0,"打招呼",urtaPlusKathCuddle);
                  addButton(14,"离开",get_telAdre().telAdreMenu);
                  break;
               case 1:
                  outputText("的房子。你用备用钥匙开门进去，偷偷溜上楼，往主卧室里偷看。[pg]");
                  outputText("你看到乌尔塔和凯丝坐在大镜子前。看起来她正在用毛巾帮凯丝擦干头发，而凯瑟琳" + clothesChoice("整理好她的衬衫","拉直她的透明紧身衣","扣上她长裙的最后几个扣子","摆弄着她的蜘蛛丝长袍，似乎想找个办法展示更多的皮肤","调整她的抹胸，确保胸罩的轮廓能透过紧身的布料显现出来","整理你给她的性感护士服，并摆弄着放在她腿上的小白帽") + "。[pg]");
                  outputText("凯丝在镜子里发现了你，高兴地向你招手，试图跳起来拥抱你。[pg]");
                  outputText("乌尔塔把凯丝按在座位上，拿起梳子继续打理凯丝" + get_hairColor() + "的头发。[say: 别动，你这个发情的骚货，我马上就弄好了。你想在[name]面前展现最好的一面，不是吗？][pg]");
                  outputText("乌尔塔给了你们每人一个吻，当凯丝缠着你时，她摇了摇头。[say: 凯丝，你哪来这么大精力？]她问。[say: 你比我更想做爱。]听到乌尔塔的话，你感觉凯丝有点脸红，但你轻轻挠了挠她的耳朵，她又依偎在你的怀里。[pg]");
                  outputText("乌尔塔走过来从另一边抱住她，亲吻了你们俩。[say: 虽然我很想加入你们，但我需要为明天好好休息。玩得开心，但别做我不会做的事。][pg]");
                  outputText("凯丝对这句老掉牙的话嗤之以鼻，乌尔塔拍了拍她的屁股，然后把你们俩推出了门。[say: 记得有空常来。我现在可能没心情，但我保证到了明天早上情况就不一样了。]");
                  menu();
                  addButton(0,"去凯丝家",takeKathHome);
                  addButton(1,"去湖边",dateKathBath);
                  addButton(2,"去酒馆",takeKathToTheBar);
                  break;
               default:
                  outputText("的房子。你走进去，发现凯丝坐在地板上，和");
                  _loc1_ = get_game().urtaPregs.urtaKids();
                  if(_loc1_ == 1)
                  {
                     outputText("你的孩子。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "他" : "她") + "正坐在凯瑟琳的腿上，头埋在她的胸前，好像" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "他" : "她") + "在这个世界上无忧无虑一样。[pg]");
                  }
                  else
                  {
                     outputText((_loc1_ > 5 ? "你的几个孩子" : "你的一群孩子") + "。他们趴在凯丝身上，玩弄着她的耳朵和尾巴，而她则挠着他们的头，给他们轻轻的吻。");
                  }
                  outputText("当凯丝看到你时，她给了你一个大大的微笑，你听到你的后代喊着[say: " + (get_player().hasVagina() ? "妈妈" : "爸爸") + "！]，" + (_loc1_ > 1 ? "跑过来抱住" : "跑过来抱住") + "你的腿。[pg]");
                  outputText("凯丝也走过来抱住你，在你耳边低语道，[saystart]");
                  if(_loc1_ == 1)
                  {
                     outputText(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "他" : "她");
                  }
                  else
                  {
                     outputText("他们");
                  }
                  outputText("真可爱，[sayend][pg]");
                  outputText("乌尔塔从楼上走下来，告诉");
                  if(_loc1_ == 1)
                  {
                     outputText(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "他" : "她");
                  }
                  else
                  {
                     outputText("他们");
                  }
                  outputText("他们，[say: 好了，你们" + (_loc1_ == 1 ? "" : "都") + "和凯瑟琳阿姨玩得很开心了，现在动起来。家务活可不会自己完成，我可不想养" + (_loc1_ == 1 ? "一只懒狐狸" : "一群懒狐狸") + "。] 几乎没有抱怨，");
                  if(_loc1_ == 1)
                  {
                     outputText(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,795) == 1 ? "他跑回了自己的房间" : "她跑回了自己的房间");
                  }
                  else
                  {
                     outputText("他们朝不同的方向跑去");
                  }
                  outputText("充满着青春的活力。[pg]");
                  outputText("乌尔塔给了你们俩一个快速的拥抱，说道[say: 听着，我得去检查一些东西——职责所在。多亏了凯丝，莉安娜刚刚休息了一下，所以她能跟上。] 她给了你们俩一个快速的吻，然后迈着轻快的步伐朝守卫队总部走去。");
                  menu();
                  addButton(0,"去凯丝家",takeKathHome);
                  addButton(1,"去湖边",dateKathBath);
                  addButton(2,"去酒馆",takeKathToTheBar);
            }
         }
      }
      
      public function katherineApartmentLeave() : void
      {
         clearOutput();
         outputText("你叹了口气，告诉凯丝你只是顺道来看看她。不幸的是你得走了。她悲伤地看了你一眼，但还是点点头说");
         if(playerMaster())
         {
            outputText("[say: 好的，[master]。请早点回来。][pg]");
         }
         else
         {
            outputText("[say: 好吧，[name]，但下次我想找点乐子。][pg]");
         }
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function katherineApartmentEmptyLeave() : void
      {
         outputText("你锁好门，走回市场，想找点别的事做，顺便等凯丝下班。");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function katherineAndValaHadSex() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1237,FlagDict_Impl_.arrayReadInt(_loc1_,1237) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 11)
         {
            return;
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1235,FlagDict_Impl_.arrayReadInt(_loc1_,1235) + 1);
      }
      
      public function katherineAndUrtaHadSex(param1:Boolean) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1234,FlagDict_Impl_.arrayReadInt(_loc2_,1234) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) >= 31)
         {
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) == 30 && (param1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 4 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 0))
         {
            return;
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1232,FlagDict_Impl_.arrayReadInt(_loc2_,1232) + 1);
      }
      
      public function katSexMenu() : void
      {
         katherineSprite(true);
         menu();
         addButtonDisabled(0,"插入","这个场景需要你有一根合适的阴茎和足够的性奋度。");
         addButtonDisabled(5,"被插入","这个场景需要凯丝有阴茎，并且你有足够的性奋度。");
         addButtonDisabled(6,"双螺旋","这个场景需要你有一根合适的阴茎、阴道和足够的性奋度。");
         addButtonDisabled(7,"吸吮","这个场景需要你们中至少有一人能分泌乳汁。");
         addButton(1,"口交",oralKatherineChoices);
         addButton(2,"手交",handjobbiesFurrDemCatFurries);
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               if(get_player().hasCockThatFits(70))
               {
                  addButton(0,"插入",katPenetrate);
               }
            }
            if(hasCock())
            {
               addButton(5,"被插入",letKatKnotYou);
               if(get_player().hasVagina() && get_player().hasCockThatFits(70))
               {
                  addButton(6,"双螺旋",katDoubleHelixCraziness);
               }
            }
         }
         if(get_player().lactationQ() > 0 && get_player().biggestLactation() >= 1 && get_player().biggestTitSize() >= 1)
         {
            if(doneSubmissive(16384))
            {
               addButton(7,"吸吮",suckleMenu).hint("你们俩都在泌乳！!");
            }
            else
            {
               addButton(7,"吸吮",suckleTacularKats).hint("你有一些奶水可以喂给你饥饿的小猫！!");
            }
         }
         else if(doneSubmissive(16384))
         {
            addButton(7,"吸吮",suckleFromKath).hint("挤你猫咪的奶！!");
         }
         if(isAt(1))
         {
            if(hasAlready(512) || get_player().get_gems() >= 40)
            {
               addButton(2,"床上捆绑",bedroomBondage);
            }
            else
            {
               addButtonDisabled(2,"床上捆绑","这个场景需要你有40颗宝石来买些玩具。");
            }
            addButton(14,"返回",katherineMenu);
         }
         else
         {
            addButton(14,"返回",katherineMenu);
            if(isAt(4))
            {
               if(!get_urtaDisabled())
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 10 && get_game().urta.urtaAtBar() && get_game().urta.urtaAvailableForSex())
                  {
                     addButton(3,"见乌尔塔",katherineSeeUrta);
                  }
                  else
                  {
                     addButtonDisabled(3,"见乌尔塔","这个场景需要你们三人之间有足够高的好感度。乌尔塔应该在酒吧里。");
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1235) > 10 && isValaAtBar())
               {
                  addButton(4,"见瓦拉",katherineSeeVala);
               }
               else
               {
                  addButtonDisabled(4,"见瓦拉","这个场景需要你们三人之间有足够高的好感度。瓦拉应该在酒吧里。");
               }
            }
            else if(isAt(5))
            {
               addButtonDisabled(7,"吸吮","这个场景需要你们中至少有一人泌乳。如果她喝醉了，她会想要做爱，而不是吸奶。");
               if(!get_urtaDisabled())
               {
                  if(get_game().urta.urtaAtBar() && get_game().urta.urtaAvailableForSex() && !get_game().urta.drainedByKath)
                  {
                     addButton(3,"见乌尔塔",katherineDrunkSeeUrta);
                  }
                  else
                  {
                     addButtonDisabled(3,"见乌尔塔","乌尔塔应该在酒吧里。");
                  }
               }
               if(isValaAtBar() && !get_game().urta.drainedByKath)
               {
                  addButton(4,"见瓦拉",katherineSeeVala);
               }
               else
               {
                  addButtonDisabled(4,"见瓦拉","瓦拉应该在酒吧里。");
               }
               addButtonDisabled(14,"返回","如果凯丝喝醉了，她可不会接受拒绝！!");
            }
            else if(isAt(6))
            {
               addButtonDisabled(3,"找乌尔塔");
               if(isValaAtBar())
               {
                  addButton(4,"见瓦拉",katherineSeeVala);
               }
               else
               {
                  addButtonDisabled(4,"见瓦拉","瓦拉应该在酒吧里。");
               }
               addButtonDisabled(14,"返回","如果凯丝喝醉了，她可不会接受拒绝！!");
            }
         }
      }
      
      public function katPenetrate() : void
      {
         clearOutput();
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("凯丝的尾巴兴奋地抽动着，她喝光了饮料，渴望看看你有什么打算。[pg]");
            outputText("你牵着她的手，带她走到外面，来到湿身婊酒馆后面" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0 ? "那条熟悉的" : "那条") + "小巷。[pg]");
            outputText("她看起来有点担心被抓到，但她太兴奋了，无法拒绝你。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
         }
         outputText("你建议也许你可以试着插进凯瑟琳的一个洞里。她二话不说，脱得只剩下一个淫荡的笑容。然后她转过身，" + (isAt(1) ? "坐在床沿上" : "靠在一个板条箱上") + "，摇晃着尾巴，大方地炫耀着她的尾巴洞和已经湿透的小穴" + (hasBalls() ? "，就在她晃荡的蛋蛋上方" : "") + "。[say: 那么，进来吧，]她发出呼噜声。[pg]");
         menu();
         addButton(0,"阴道",penetrateKatsVag);
         addButton(1,"肛门",pcPenetratesKatAnally);
         if(get_player().cockThatFits2(70) >= 0)
         {
            addButton(2,"双管齐下",pcPenetratesKatDoubly);
         }
         else
         {
            addButtonDisabled(2,"双管齐下","这个场景需要你有第二根合适的阴茎。");
         }
         if(!hasCock() || get_knotSize() > 4)
         {
            addButtonDisabled(3,"边吸边操","这个场景需要凯丝的阴茎结不能太大。");
         }
         else
         {
            addButton(3,"边吸边操",suckNFuck);
         }
         addButton(14,"返回",katSexMenu);
      }
      
      public function katDoubleHelixCraziness() : void
      {
         var _loc1_:int = get_player().cockThatFits(70);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         get_images().showImage("katherine-double-helix-fuck");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("凯丝的尾巴兴奋地抽动着，她喝光了饮料，渴望看看你有什么打算。[pg]");
            outputText("你牵着她的手，带她走到外面，来到湿身婊酒馆后面" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0 ? "那条熟悉的" : "那条") + "小巷。[pg]");
            outputText("她看起来有点担心被抓住，但她太兴奋了，无法拒绝你。");
            outputText("[pg]当你站在小巷里时，你");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,0);
         }
         else
         {
            outputText("你");
         }
         outputText("稍微思考了一下……你的伴侣同时拥有男性和女性的性器官；该选哪个呢……？");
         if(hasAlready(128))
         {
            outputText("那个双螺旋动作非常有趣，所以你开玩笑地问凯丝，她是否还足够灵活，能再试一次。");
         }
         else
         {
            outputText("然后，回想起你有同样的性器官配置，你脑海中浮现出一个变态的想法。你温柔地问凯瑟琳，她是否觉得自己足够灵活，可以同时使用她的两个部位。");
         }
         outputText("[pg]凯瑟琳咧嘴一笑，" + (isAt(1) ? "在床上伸展开来" : "坐在地上") + "；然后弯下腰，看起来就像她能舔到自己的屁股一样。[say: 对你来说够灵活了吗？][pg]");
         outputText("你忍不住笑了；看起来她确实够灵活。小心翼翼地脱下你的[armor]并放在一边，");
         if(hasAlready(128))
         {
            outputText("你摆出和上次一样的姿势；凯丝的双腿缠绕在你的下半身，她的蜜壶与你的对齐。她小心翼翼地将" + cockMultiple("她的一根","她的") + cockType() + "肉棒" + cockMultiple("","") + "滑向你的[vagina]。你也做同样的事，将你的" + get_player().cockDescript(_loc1_) + "的顶端对准她流着淫液的小穴。你能听到她轻柔的呼吸声，努力保持冷静，你也试着这样做。[pg]");
            outputText("当你们两人的肉棒顶端滑入到位时，凯丝呻吟了一声。她用担忧的语气说，[say: 嗯……经过上次之后，我觉得我可能无法忍住。我们可能会像这样结在一起。] 你没有回答，只是把你的肉棒插得更深了一点。");
            outputText("[pg]凯瑟琳给了你一个快速的拥抱，然后她");
         }
         else
         {
            outputText("你随后意识到了问题，并大声说了出来：你们怎么可能同时插入对方的小穴呢？[pg]");
            outputText("凯瑟琳明白了你的意思，开始脱衣服。[say: 只要侧躺下，为我张开双腿就好。][pg]");
            outputText("你按照她说的做，");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("将你的尾巴卷到后面");
            }
            else if(get_player().isGoo())
            {
               outputText("移动你黏糊糊的身体");
            }
            else
            {
               outputText("抬起你的[leg]");
            }
            outputText("这样她就能接触到你的" + get_player().vaginaDescript(0) + "和你的" + get_player().cockDescript(_loc1_) + "。[pg]");
            outputText("凯瑟琳躺在你对面，双腿缠绕在你的下半身，她的蜜壶与你的对齐。[say: 好了……现在像这样把你的肉棒往下压……] 她说着，将" + cockMultiple("她自己的一根","她自己的") + cockType() + "肉棒" + cockMultiple("","") + "推向你的[vagina]，用顶端慢慢地挑逗你。[pg]");
            outputText("你重复这个动作，将你的" + get_player().cockDescript(_loc1_) + "的顶端对准她流着淫液的小穴。你能听到她轻柔的呼吸声，努力保持冷静，你也试着这样做……就在这时，你突然想到了一件事，你问她你们俩该怎么处理她的结。毕竟，你不确定你们俩以这种姿势结在一起是不是个好主意。[pg]");
            outputText("[say: 哦，嗯……我想那会很尴尬，是的……好吧，我保证我不会把我的结插进去，] 她回答道。");
            outputText("[pg]凯瑟琳");
         }
         outputText("弯曲双腿，将你拉向她，同时也插入了你。在感受到同时插入和被插入的快感时，她发出了愉悦的嚎叫。[say: 啊……只要跟着我——嗯——扭动你的臀部就好。][pg]");
         outputText("当她滚烫湿润的肉壁包裹住你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "，而她" + cockType("橡胶般尖锐的狗","狭窄带刺的猫") + "肉棒滑入你的[vagina]时，你高兴地颤抖着。你不需要进一步的鼓励，急切地迎合着她的动作，试图深入她体内，同时也让她深入你，不让任何一根肉棒从指定的洞口滑出。凯瑟琳扭动着臀部，试图刺激你们两人的敏感部位，在快感中喘息着。[pg]");
         outputText("你在刺激下发出呜咽和呻吟，同样扭动着自己的臀部，试图在不意外将她的结纳入小穴的情况下增强快感。作为回应，凯瑟琳发出愉悦的喵喵声和嚎叫，表达着她的赞同，并将你拉得离她的结危险地近，试图感受到更多你的存在。你几乎无法理解正在发生的事情，你的世界缩小到只剩下肉棒在小穴里的感觉……然后伴随着一声湿润的“噗嗤”声，凯瑟琳半肿胀的结滑入了你的小穴，你们的臀部撞在了一起。");
         get_player().cuntChange(cockArea(),true,true,false);
         outputText("[pg]");
         outputText("当你发现自己被填得如此之满，你的肉棒也深深埋入她滚烫湿润的深处时，你喘息着。这种感觉几乎让人难以承受……但你设法忍住了，喘息着告诉她，她已经和你结扎在一起了。[pg]");
         outputText("[say: " + (hasAlready(128) ? "嗯……" : "抱、抱歉") + "……] 凯瑟琳回答道，强忍着呻吟和抽插的冲动。她把自己推开了一点，刚好让她的结滑出，然后继续扭动着臀部。你接着也开始扭动，配合着她的节奏，让她的肉棒完全滑入你体内，你也能将肉棒完全滑入她体内——至少，在不再次接纳她的结的情况下，尽可能地深入……或者不。凯瑟琳喘息着，再次将你完全拉入她体内，再次将她的结滑入你体内。你在快感中叫喊出声；你无法让自己去在意你再次被结扎的事实，你只是太高兴终于被真正填满，终于被完全包裹——这种感觉难以言喻！[pg]");
         outputText("[say: 抱、抱歉，" + get_player().get_short() + (hasAlready(128) ? "，但我不会拔出来的" : "，我只是不能……啊……我保证在结扎前我会拔出来的") + "，] 凯瑟琳说着，尽她所能用尽全力撞击你。你只是下意识地告诉她没关系，太沉迷于用尽全力回击她，带着野兽般的欲望将骨盆撞击在一起，被比人类更古老的本能所驱使。伴随着最后一声愉悦的嚎叫，你感觉到凯瑟琳的结在你体内肿胀，她的小穴紧紧夹住你的" + get_player().cockDescript(_loc1_) + "。然后，一股猫科动物的精液和汁液喷洒在你体内和身上，引得你也叫喊出声；你屈服于自己的高潮，精液");
         if(get_player().cumQ() <= 50)
         {
            outputText("汹涌地");
         }
         else if(get_player().cumQ() <= 250)
         {
            outputText("喷涌地");
         }
         else
         {
            outputText("如雷鸣般");
         }
         outputText("从你的肉棒中喷出，而爱液");
         if(get_player().wetness() <= 3)
         {
            outputText("滴落");
         }
         else if(get_player().wetness() <= 4)
         {
            outputText("喷射");
         }
         else
         {
            outputText("喷涌地");
         }
         outputText("从你的小穴中流出，努力榨取你的" + catGirl("猫娘","兽人") + "恋人，同时也反过来被她榨取。[pg]");
         if(cumQ() <= 500)
         {
            outputText("当凯瑟琳将她的精液倾注在你体内时，你感觉到你的肚子开始微微胀大。");
         }
         else if(cumQ() <= 1500)
         {
            outputText("当凯瑟琳用她的精液填满你时，你感觉到你的肚子开始胀大。她的结努力将她所有的精液留在你体内，结果，当她停下来时，你看起来至少有几个月的身孕了。");
         }
         else
         {
            outputText("当凯瑟琳用她的精液填满你时，你感觉到你的肚子开始迅速胀大。甚至连她的结也无法将她所有的精液留在你体内，因为回流的精液将你的阴唇撑得更开，大股的精液溅在凯瑟琳的胯部。当她停止射精时，你看起来就像怀了好几窝小猫一样。");
         }
         outputText("");
         if(get_player().cumQ() <= 500)
         {
            outputText("不过你也以同样的方式回报了凯瑟琳，将你大量的精液倾注在这只急切的猫咪体内，当你将浓稠的精液喷射进她体内时，也让她拥有了一个圆滚滚的肚子。");
         }
         else if(get_player().cumQ() <= 1500)
         {
            outputText("不过你也以牙还牙，将你那可观的精液倾泻在这只饥渴的猫咪体内，把她的肚子撑得像怀孕几个月一样，再也装不下更多的精液。有些精液甚至倒流出来溅到你身上，在你们两人身下汇聚成一滩凌乱滚烫的白色精液。");
         }
         else
         {
            outputText("不过你也以牙还牙，将你那可观的精液倾泻在这只饥渴的猫咪体内，把她的肚子撑得像怀孕好几个月一样，再也装不下更多的精液。有些精液甚至倒流出来溅到你身上，在你们两人身下汇聚成一滩凌乱滚烫的白色精液。然而这似乎并没有停止的迹象；要不是凯瑟琳的肉结，你很确信你早就把这只猫从你的肉棒上射飞出去了。凯瑟琳颤抖着，她的小穴内壁紧缩，似乎想把更多的精液留在体内，事实上，她确实超负荷膨胀了一会儿，直到她放松下来，你的精液才从她体内涌出。");
         }
         outputText("[pg]");
         outputText("你大口喘着粗气，脑海中仍然回荡着刚才那惊天动地的快感。你的第一反应是想动一下，但你发现自己根本起不来");
         if(cumQ() > 1500)
         {
            outputText("，而且这也不是因为你肿胀的肚子压得你起不来");
         }
         outputText("。凯瑟琳那带结的肉棒把她锁在了你的[vagina]里，让你们像发情的公狗和母狗一样连在了一起。");
         if(hasAlready(128))
         {
            outputText("你轻轻揉捏着凯丝的一个乳头，问她打算怎么补偿这样把你锁住的事。[pg]");
            outputText("凯丝拍了拍你的肚子说，[say: 我可没听到你说“停”，而且别装作你没享受。不管怎样，你只要等我的肉结缩小，我就会加倍补偿你的。][pg]");
         }
         else
         {
            outputText("你带着几分恼怒和几分好笑，评论说你以为她答应过在她的肉结把你们俩绑在一起之前就会拔出来的。[pg]");
            outputText("凯瑟琳咽了口唾沫。[say: 抱、抱歉[name]。只是……感觉太好了……我一时忘情了……对不起……]你告诉她这有点让人失望，但你们俩都死不了。再说，这也不是不舒服。[pg]");
            outputText("凯瑟琳微笑着说，[say: 对不起……我保证我会想办法补偿你的。]你用手肘撑起身体，带着真诚的好奇心问她有什么打算。[say: 只要等一会儿，让我的肉结缩小，]她说着，狡黠地瞥了你一眼。看到她不打算说，你又躺了回去，等着肉结缩小。[pg]");
         }
         outputText("凭着你那被填满的小穴的感觉，你很容易就能知道什么时候她终于可以拔出来而不弄伤你；凯瑟琳抽出身子，摇摇晃晃地站了起来。你体内的精液如瀑布般倾泻而出，就在这时，你感觉到一双嘴唇贴上了你敏感的私处。片刻之后，一条猫舌舔舐着你的阴唇并吸附在上面，直接将精液从你体内吸了出来。你高兴地喘息着，但保持不动，想知道你的爱人有什么打算。[pg]");
         outputText("等她清理完你的小穴，她转移到了你的" + get_player().cockDescript(_loc1_) + "上，将顶端含入口中吸吮，吸干你肉棒上最后一点精液，然后她松开你的" + get_player().cockHead(_loc1_) + "，开始舔舐肉棒，从根部一路向上清理");
         if(get_player().balls > 0)
         {
            outputText("，甚至把你的[balls]也舔得干干净净");
         }
         outputText("。在她的服侍下，你呻吟着，颤抖着，挺动着臀部；你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋仍然空空如也");
         }
         else
         {
            outputText("肉棒仍然几乎完全空了");
         }
         outputText("，但你确信如果她继续这样下去，她能让你再次高潮。[pg]");
         outputText("意识到你的肉棒再次硬了起来，凯瑟琳对你露出一个调皮的笑容，张开嘴将你深深吞入喉咙，对着你的" + get_player().cockDescript(_loc1_) + "发出一声响亮、湿润的吸吮声，然后用力吸吮着你。[pg]");
         outputText("你发出一声空洞的呻吟；你不知道她还有这本事！你伸出双手，抓住她耳朵下方的头部；你太虚弱了，推不开她（反正也没必要），你只好把她固定在原位。[pg]");
         outputText("当然，以你现在的状态，没过几分钟你就再次爆发了，精液从你过度敏感的肉棒中喷涌而出，射进她吮吸的嘴里。凯瑟琳将你榨干，吸走你所有的精液，然后“啵”的一声松开你的肉棒；留下你那根沾满唾液、还在跳动的阴茎。[say: 看来你很喜欢我这小小的舌头浴？]她舔了舔嘴唇，打趣道。[pg]");
         outputText("你只能虚弱地对她点点头。[pg]");
         outputText("[say: 要我给你来个更彻底的吗？][pg]");
         outputText("你又下意识地点了点头。[pg]");
         outputText("凯瑟琳把你翻转平躺，开始舔你的肚子，清理你之前激烈交媾产生的汗水。她舔过你的[chest]，停下来在你的每个[nipples]上轻轻啄了一下。然后她继续舔向你的脖子和脸。[pg]");
         outputText("你只是躺在那里享受她的服侍；虽然很舒服，但并不像她之前的举动那样充满性暗示，你觉得这种体验更多的是舒缓而不是唤起情欲。过了一会儿，她终于在");
         if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 3)
         {
            outputText("你的尾巴尖上");
         }
         else
         {
            outputText("你的[ass]上");
         }
         outputText("舔了最后一下，结束了清理。凯瑟琳咧嘴一笑，高兴地宣布：[say: 好了，你现在干净了！" + (hasAlready(128) ? "" : " 抱歉打破了我的承诺，让你结了结。") + "][pg]");
         outputText("你坐起身来，忍不住伸手揉了揉她的耳朵，用你见过的猫总是喜欢的方式，告诉她如果这就是她为" + (hasAlready(128) ? "让你结结道歉的方式，你不介意她一次又一次地这样做" : "此道歉的方式，你不介意她再做一次") + "。[pg]");
         outputText("她靠在你的手上，发出呼噜声。[say: 嗯……我会记住的。][pg]");
         outputText("你站起身穿好衣服，向这只迷人的小猫道别，然后回到营地，仍然感觉相当疲惫。[pg]");
         get_player().slimeFeed();
         get_player().orgasm("Generic");
         orgasm();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(128);
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isValaAtBar() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) != 0 && get_game().time.hours >= 12)
         {
            return get_game().time.hours <= 21;
         }
         return false;
      }
      
      public function isMilky() : Boolean
      {
         if(!(get_breasts().milkIsOverflowing() && get_breasts().get_lactationLevel() >= 3))
         {
            if(get_breasts().milkIsFull())
            {
               return get_breasts().get_lactationLevel() >= 5;
            }
            return false;
         }
         return true;
      }
      
      public function isAt(param1:int) : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1225) == param1;
      }
      
      public function interveneWithKittyKats5() : void
      {
         clearOutput();
         outputText("[say: 凯丝——凯瑟琳，]她脱口而出。就在这时，你感觉到你们之间有什么东西在变大。似乎鼓起了一个发热的硬块。你恍然大悟，这只非常女性化的猫咪实际上是个扶她，从那个硬块的大小和压力来看，你猜她下面藏着一个真正的怪物。");
         outputText("[pg][say: 求——求求你——不要！]她哭喊着，但已经太迟了。她的腰带系得不够紧，她的肉棒从破烂的裤子和肚子之间的缝隙里钻了出来。" + (get_noFur() ? "她尴尬得满脸通红" : "你怀疑要不是因为有毛，她肯定已经满脸通红了") + "。说到红，那根肉棒是鲜红色的，根本不属于任何种类的猫。根部持续的肿胀证实了这一点。凯瑟琳长着一根犬科动物的肉棒，而且那根肉棒上有一个巨大的结。");
         outputText("[pg]她呜咽着，[say: 我只是想要食物，]并试图在你身下蜷缩成一团来隐藏她的肉棒。");
         outputText("[pg]如果你帮助凯丝，得到的回报可能不仅仅是善报……如果你喜欢那种事的话。你也可以对她置之不理，这可能意味着永远不见。");
         menu();
         addButton(0,"帮助",helpKathAfterInterruptu);
         addButton(1,"离开",leaveKathYouDontWantThatNastyHermCock);
      }
      
      public function interveneWithKittyKats4() : void
      {
         clearOutput();
         outputText("有一段时间你静静地躺着，她则凝视着远方。她显然被饥饿分心了，但你该如何利用这一点呢？一个计划形成了，你问她，如果猫喜欢牛奶，他们为什么把你留在这里？");
         outputText("[pg]她困惑地看着你，问道：[say: 你什么意思？]");
         outputText("[pg]你在地上挪了挪身子，回答说你正在泌乳。她站起身，跪在你身边，肚子再次咕咕叫了起来。");
         if(get_player().biggestTitSize() < 3)
         {
            outputText("[pg][say: 可是你几乎连胸都没有，]她说着，把手轻轻放在你的胸前。你问她这在玛瑞斯意味着什么。");
         }
         else
         {
            outputText("[pg]她把手轻轻按在你的胸前，瞳孔放大。[say: 不。他们……他们一定检查过，一定闻到了。]");
         }
         outputText("[pg]她开始摸索你的[armor]，饥饿显然战胜了她的理智。这就是你的机会。你用被绑住的双手向上猛击，打中她的肚子，让她喘不过气来。");
         outputText("[pg]她不太会打架，只用了一招，局势就逆转了。她仰面躺在地上，大口喘着气，而你坐在她身上，");
         if(get_player().isBiped())
         {
            outputText("用双膝紧紧夹住她");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你[if (isNaga) {蛇一般 |[if (isMer) {鱼一般 }]}]的身体紧紧缠绕着她");
         }
         else
         {
            outputText("紧紧抓住她");
         }
         outputText("。如果她回过神来，可能还能逃脱，所以你捂住她的嘴，用最威严的语气命令她给你松绑。");
         outputText("[pg]她僵在原地，盯着你的眼睛。然后她的手指伸上来，摸索了一阵后，解开了你的双手。你提醒她，考虑到她刚刚抢劫了你，大声呼救可不是个好主意。然后你拿开手，问她叫什么名字。");
         doNext(interveneWithKittyKats5);
      }
      
      public function interveneWithKittyKats3() : void
      {
         clearOutput();
         katherineSprite();
         outputText("你问她为什么担心牛奶。她低头看着你，似乎认为你现在没什么威胁，便坐在了一个板条箱的边缘。");
         outputText("[pg][say: 我大概不该和你说话，但这有什么坏处呢？]她说道，几乎是在自言自语。她的肚子也加入了对话，发出了一些长长、听起来很痛苦的咕噜声。她揉了揉肚子，叹了口气，然后继续说道。");
         outputText("[pg][say: 我们需要吃东西，就像其他人一样，而牛奶是最好的食物。我们所有人都喜欢牛奶。]她再次停下来，平息肚子的咕噜声。[say: 但是牛奶坏得很快。上次他们给我留了点牛奶，但等我拿到的时候，它几乎变成奶酪了。]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 25);
         outputText("[pg]你问她为什么是她来看着你。[say: 我是新来的，所以我只能干这些最底层的活。]她从她坐着的板条箱里拉出一个包裹。[say: 你的东西都在这里，除了一些宝石。刚好够我们所有人吃一顿。]她把包裹放回板条箱里。");
         outputText("[pg]你问她为什么猫人不把所有东西都拿走。她的反应几乎是恐慌。[say: 那样我们会惹上大麻烦的！不，不，不。]她让自己平静下来，继续说道。[say: 大多数人不会为了几颗丢失的宝石大老远跑到守卫队去报案。为了几千颗甚至几百颗宝石？当然会。但对于我们，他们仍然保留着所有贵重物品——盔甲、武器、任何私人物品。他们知道守卫队不可能找到几颗宝石，那又何必费心呢？]");
         outputText("[pg][say: 很多帮派把人扒得精光。他们总是被抓。其他帮派杀了他们的目标，这样他们就不能告诉守卫队是谁抢了他们。守卫队<b>狠狠地</b>打击了他们。这就是为什么伊芙琳的计划如此有效。我们惹的麻烦不足以让任何人来追捕我们，而且我们从来都不是街上最坏的人。]");
         doNext(interveneWithKittyKats4);
      }
      
      public function interveneWithKittyKats2() : void
      {
         clearOutput();
         outputText("你眨了眨眼睛。呃——连眨眼都疼！你看不见面前有任何人，但随后你听到有人向你走来。一个男性猫人，也许就是刚才威胁那个年轻女人的其中一个，手里拿着一块木板站在你上方。");
         outputText("[pg]一个柔和的声音喊道：[say: 别！你上次打得太重了。如果你杀了[him]，伊芙琳会把你踢出去的。]");
         outputText("[pg]他翻了个白眼，把木板扔到一边，说道：[say: 好吧——但如果[he]醒着，[he]可能会跑掉。你留在这里看着[him]。]");
         outputText("[pg][say: 你会给我留点牛奶的，对吧？]那个声音问道，既担忧又充满希望。");
         outputText("[pg][say: 别担心，我们会给你留点的，]他边走边说。");
         outputText("[pg][say: 是啊，就像上次一样，]她低声嘟囔着。");
         outputText("[pg]你发现除了脚，你的手也被绑在身前。他们没有堵住你的嘴，大概是以为你会昏迷更长时间。");
         outputText("[pg]翻到另一侧，你以为会看到之前那个年轻的猫人，但这个女孩不同。她身高略高于5英尺，有着乌黑的毛发" + (get_noFur() ? "覆盖着她的耳朵和尾巴" : "覆盖着她的身体") + "，以及一头染成霓虹粉色的齐肩长发。她B罩杯的乳房在她轻盈的身躯上显得格外突出。她脖子上的项圈上挂着一个小银铃。很难判断她的年龄，但你觉得她应该在18到20岁左右。或者说，如果她是人类的话，应该是这个年纪。");
         outputText("[pg]你可以从她细长尾巴的抽动看出她有点紧张。它像野猫焦躁时一样来回摆动。既然你能说话，你试图和这个女孩搭话。");
         doNext(interveneWithKittyKats3);
      }
      
      public function interveneWithKittyKats() : void
      {
         clearOutput();
         outputText("同时对付三个人比对付一个对手要难得多。不过，看他们的样子，你大概能把这三个人按在地上摩擦。你挺起胸膛，大步走进小巷。如果你看起来足够吓人，也许他们就会散开。");
         outputText("[pg]当你经过几个破损的包装箱和木桶时，你看到有什么东西从覆盖着小巷地面的碎片中跳了出来。当你认出那是一圈粗绳时，已经太晚了。你试图跳开，但绳子紧紧地缠住了你的脚踝。");
         outputText("[pg]你摔倒在地，半打身体压在你身上，让你喘不过气来。有什么东西猛击了你的后脑勺，你眼冒金星。半块砖头落在你面前，当迷雾笼罩时，你的大脑拼凑出一个念头：[say: 好吧，这太尴尬了。]");
         doNext(interveneWithKittyKats2);
      }
      
      public function initFlags() : void
      {
         get_breasts().set_cupSize(2);
         get_breasts().set_lactationLevel(0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,399,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,400,8);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,401,6);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,402,1);
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,1223,"neon pink");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1218,200);
         get_player().removeKeyItem("Silver Kitty-Bell");
      }
      
      public function helpKathAfterInterruptu() : void
      {
         clearOutput();
         if(get_player().cor < 25)
         {
            outputText("你觉得你必须为她做点什么。她需要食物，而且她对自己的身体感到羞耻。这在这片土地上很少见，但这可不是什么好的生活方式。");
         }
         else if(get_player().cor < 75)
         {
            outputText("毫无疑问，她现在需要食物。如果你帮助她，也许她将来会更愿意和你说话。也许你能成为她的朋友，甚至更多。");
         }
         else
         {
            outputText("你大可以现在就在这里上了她，但她的“朋友们”可能会回来帮她。或者守卫队的人可能会发现你。对付这只非常欠操的小猫咪，还是放长线钓大鱼比较好。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,398,-1);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         outputText("[pg]你抽出双腿，走到板条箱旁，收拾好你的装备。凯瑟琳仍然躺在地上，紧闭着双眼。她把勃起的肉棒塞进衬衫里，紧紧地捂在胸前，似乎想强迫它软下去。你数出 10 枚宝石，塞进她的手里。");
         outputText("[pg]她猛地睁开眼睛，盯着那些宝石。[say:可是……可是我……我们……抢劫了你。]你拍了拍她的肩膀，告诉她去买点吃的。她从地上弹起来，抱住你的[legs]，低声说道：[say:谢谢你，谢谢你，谢谢你。我不会告诉任何人的，太感谢你了。]");
         outputText("[pg]你大步走出小巷，希望能再次遇到凯瑟琳。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hasDogCock() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1216) == 0;
      }
      
      public function hasCock() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,399) > 0;
      }
      
      public function hasClothing(param1:int) : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1220) & param1) > 0;
      }
      
      public function hasBalls() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,402) > 0;
      }
      
      public function hasAlready(param1:int) : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1219) & param1) > 0;
      }
      
      public function handjobbiesFurrDemCatFurries() : void
      {
         clearOutput();
         if(isAt(4) || isAt(5) || isAt(6))
         {
            outputText("凯丝的尾巴兴奋地抽动着，她喝光了饮料，渴望看看你有什么打算。[pg]");
            outputText("你牵着她的手，带她走到外面，来到湿身婊酒馆后面" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0 ? "那条熟悉的" : "那条") + "小巷。[pg]");
            outputText("她看起来有点担心被抓到，但她太兴奋了，无法拒绝你。[pg]");
         }
         outputText("你把凯丝拉到你的腿上，她发出满足的呼噜声。你的双手滑入她的衬衫下，开始");
         if(get_player().cor < 25)
         {
            outputText("慢慢抚摸她柔软的乳房");
         }
         else if(get_player().cor < 75)
         {
            outputText("挑逗她可爱的乳房");
         }
         else
         {
            outputText("粗暴地揉捏她的双峰");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) > 0 && get_breasts().milkIsFull())
         {
            outputText("。你的手指很快就沾满了她的淫水，你把手指伸向凯丝，她急切地把它们舔得干干净净");
         }
         outputText("。她的尾巴被夹在你们俩的身体之间，来回甩动着");
         if(get_player().hasCock())
         {
            outputText("，让你的[cocks]也随之勃起。");
         }
         else if(get_player().hasVagina())
         {
            outputText("，挑逗着你火热的小穴。");
         }
         else
         {
            outputText("以一种诱人的方式。");
         }
         outputText("[pg]一旦凯丝的乳头变得坚挺，你的手指就顺着她肚子上柔软的" + catGirl("皮肤","皮毛") + "向下滑动，直到它们找到");
         if(!hasCock())
         {
            outputText("她火热湿润的阴户。抚弄几下后，你拨开了她柔软湿润的阴唇。一只手滑入其中探索她的深处，另一只手则抓住她的阴蒂，开始按摩那个小肉核。");
            outputText("[pg]热度惊人，凯丝的小穴在你的服侍下滴落着淫液。凯丝的臀部向前挺动，她的身体乞求着一根肉棒来填满她。");
         }
         else if(get_cockNumber() > 1)
         {
            outputText("她火热肉棒的顶端。抚弄几下后，你把她大量的先头汁涂满了她的两根肉棒。一只手继续取悦她的肉棒，另一只手则继续向下，滑入" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 1 ? "她的腰带下，探进她的裤子里。" : "她湿润的阴户里。"));
            outputText("[pg]热度惊人，凯丝" + knotAdj() + "的肉结在你的服侍下肿胀起来。凯丝的臀部向前挺动，寻找着一两个小穴好把它们塞进去。");
         }
         else
         {
            outputText("她火热肉棒的顶端。抚弄几下后，你把她大量的先头汁涂满了她的大部分肉棒。一只手取悦她的肉棒，另一只手则继续向下，滑入" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 1 ? "她的腰带下，探进她的裤子里。" : "她湿润的阴户里。"));
            outputText("[pg]热度惊人，凯丝" + knotAdj() + "的肉结在你的服侍下肿胀起来。凯丝的臀部向前挺动，寻找着一个小穴好把它塞进去。");
         }
         if(hasCock())
         {
            outputText("[pg]凯丝接下来的呻吟声是从肺底发出的。多亏了你，她已经欲火焚身，现在你决定让她的感官超载。你的手指" + (hasBalls() ? "托住她的睾丸" : "挑逗她的阴蒂") + "片刻，然后" + (get_cockNumber() < 2 ? "再次" : "") + "滑入她滴水的阴户。");
            outputText("[pg]她的头向后仰，试图用自己的嘴寻找你的嘴。当你们的舌头交缠在一起时，你开始在她的缝隙中进出滑动手指，确保用力摩擦她的小肉核。你的另一只手");
            if(get_cockNumber() > 1)
            {
               outputText("在她的" + cockAdj() + "肉棒上上下套弄，交替着抚摸。很快你就能感觉到它们都在抽动，准备将精液射入一对肥沃的小穴中。");
               outputText("[pg]你瞄准凯瑟琳的肉棒");
            }
            else
            {
               outputText("在她的" + cockAdj() + "肉棒上上下套弄。很快你就能感觉到它在抽动，准备将精液射入一个肥沃的小穴中。");
               outputText("[pg]你瞄准凯瑟琳的肉棒");
            }
            outputText("对着" + (isAt(8) ? "地面" : "墙壁") + "。你把手指从她的小穴里抽出来，把她的淫水抹在" + (hasBalls() ? "她的" + (get_noFur() ? "" : "毛茸茸的") + "蛋蛋上" : "她不断胀大的结上") + "。你把头往后仰，告诉凯丝为你高潮。她喘着粗气，你感觉到" + (hasBalls() ? "那个" + ballAdj() + "阴囊收缩" : "她的肉棒" + cockMultiple("","s") + "抽动并变硬") + "，凯丝释放出不知积攒了多少的精液。");
            outputText("[pg]你还没完呢。当第一股精液飞溅在");
            if(isAt(8))
            {
               outputText((get_game().time.hours <= 18 ? "滚烫的" : "冰凉的") + "沙子上");
            }
            else
            {
               outputText(isAt(1) ? "石膏墙上" : "砖墙上");
            }
            outputText("时，你把手指滑回她的小穴，攻击她的阴蒂。尽管已经处于一次高潮之中，凯丝的身体却绷得更紧了。感觉就像一杯水从她的小穴里涌出，她肉棒" + cockMultiple("","s") + "的下一次喷射更加猛烈，" + (isAt(8) ? "比第一次射得远了足足六英寸" : "比第一次射得高了足足六英寸") + "。");
         }
         else
         {
            outputText("[pg]她的头向后仰，试图用自己的嘴寻找你的嘴。当你们的舌头交缠在一起时，你推得比以往任何时候都深，按摩着她的内壁，用力摩擦她的小肉核。你把头往后仰，告诉凯丝为你高潮。她喘着粗气，你感觉到她的小穴里涌出一股洪流。她的肌肉紧紧夹住你的手指，仿佛想把它们永远留在里面。");
         }
         outputText("[pg]凯丝在你怀里化作一滩春水，几次高潮像地震的余震一样席卷了她。她只能抬头看着你的眼睛微笑。");
         if(get_player().cor < 25)
         {
            outputText("在她恢复的时候，你把她抱在怀里。你真的很喜欢看到她脸上幸福和满足的表情。");
         }
         else if(get_player().cor < 75)
         {
            outputText("在你等她恢复的时候，你把她的衬衫拉起来，又玩弄了一会儿她的乳房。等她能再次动弹的时候，她的乳头已经像小浆果一样凸出来了。她脸红了，但显然很享受你的关注。");
         }
         else
         {
            outputText("你可不是那种会放过一个无助的年轻" + (hasCock() ? "扶她" : "女孩") + "的人，你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) < 1 ? "脱光了凯瑟琳所有的衣服。你" : "") + "玩弄着她的尾巴，最后觉得无聊了，就把尾巴尖深深地推进了她的小穴里。[pg]");
            if(hasCock())
            {
               outputText("接下来你的手" + (isAt(8) ? cockMultiple("顺着她的肉棒","顺着她的肉棒") : "在墙上") + "滑过，收集了一些她还温热的精液");
            }
            else
            {
               outputText("接下来你用手指收集了一些她的淫水");
            }
            outputText("并递给她。凯丝粗糙的舌头舔干了你手上的每一滴液体，而你则在想着你想对她的身体做的所有事情。");
         }
         if(isAt(8))
         {
            outputText("[pg]现在的训练结束了，你让凯瑟琳收拾好她的装备，带她回特尔阿德雷。当你们到达她的小巷时，凯丝扑倒在她收集的一堆柔软的废料上，说道：[say:请快点回来，[name]，下次我会做得更好的。]");
         }
         orgasm();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         dynStats(DynStat.Lust(33));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == -1)
         {
            doNext(firstTimeWithKatherinePartTwoUltraChampionshipEditionHyperTurbo);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function giveKatherineAnItem(param1:int = 0) : void
      {
         var page4:int;
         var _g5:Katherine;
         var page:int;
         var _g4:Katherine;
         var page3:int;
         var _g3:Katherine;
         var page2:int;
         var _g2:Katherine;
         var page1:int;
         var _g1:Katherine;
         var _g:Katherine;
         var _gthis:Katherine;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as Function;
         _gthis = this;
         clearOutput();
         outputText("你告诉凯瑟琳你有一份礼物要送给她。[pg]");
         outputText("猫人的脸亮了起来，但随后又内疚地垂下眼帘。[say:我不能要——你对我已经太好了……]你打断了她，坚持要送给她。[say:好吧，如果你确定的话……是什么礼物？][pg]");
         var _loc2_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4;
         menu();
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.giveKatherineAnItem();
         });
         if(param1 == 0)
         {
            _g1 = this;
            page1 = 1;
            addNextButton("变形道具",function():void
            {
               _g1.giveKatherineAnItem(page1);
            });
            if(_loc2_)
            {
               _g2 = this;
               page2 = 2;
               addNextButton("衣服",function():void
               {
                  _g2.giveKatherineAnItem(page2);
               });
            }
            else
            {
               addNextButtonDisabled("衣服","她没有地方存放衣服。");
            }
            if(_loc2_)
            {
               _g3 = this;
               page3 = 3;
               addNextButton("染料",function():void
               {
                  _g3.giveKatherineAnItem(page3);
               });
            }
            else
            {
               addNextButtonDisabled("染料","她喜欢现在的发色。");
            }
            addButton(14,"返回",katherineMenu);
         }
         if(param1 == 1)
         {
            _loc3_ = get_player().hasItem(get_consumables().BLACKEG) || get_player().hasItem(get_consumables().L_BLKEG);
            _loc4_ = get_player().hasItem(get_consumables().BEEHONY) || get_player().hasItem(get_consumables().PURHONY);
            _loc5_ = get_player().hasItem(get_consumables().PINKEGG) || get_player().hasItem(get_consumables().L_PNKEG);
            if(get_player().hasItem(get_consumables().CANINEP))
            {
               addNextButton(Utils.cnName(get_consumables().CANINEP.get_shortName()),giveKatACaninePepper).hint("向她提供" + get_consumables().CANINEP.get_longName() + "。",get_consumables().CANINEP.get_tooltipHeader());
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().CANINEP.get_shortName()),"向她提供" + Utils.cnName(get_consumables().CANINEP.get_longName()) + "。",Utils.cnName(get_consumables().CANINEP.get_tooltipHeader()));
            }
            if(get_player().hasItem(get_consumables().LARGEPP))
            {
               addNextButton(Utils.cnName(get_consumables().LARGEPP.get_shortName()),giveKatAOverlyLargePepper).hint("向她提供" + Utils.cnName(get_consumables().LARGEPP.get_longName()) + "。",Utils.cnName(get_consumables().LARGEPP.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().LARGEPP.get_shortName()),"向她提供" + Utils.cnName(get_consumables().LARGEPP.get_longName()) + "。",Utils.cnName(get_consumables().LARGEPP.get_tooltipHeader()));
            }
            if(get_player().hasItem(get_consumables().DBLPEPP))
            {
               addNextButton(Utils.cnName(get_consumables().DBLPEPP.get_shortName()),giveKatADoublePepper).hint("向她提供" + Utils.cnName(get_consumables().DBLPEPP.get_longName()) + "。",Utils.cnName(get_consumables().DBLPEPP.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().DBLPEPP.get_shortName()),"向她提供" + Utils.cnName(get_consumables().DBLPEPP.get_longName()) + "。",Utils.cnName(get_consumables().DBLPEPP.get_tooltipHeader()));
            }
            if(get_player().hasItem(get_consumables().BULBYPP))
            {
               addNextButton(Utils.cnName(get_consumables().BULBYPP.get_shortName()),giveKatABulbousPepper).hint("向她提供" + Utils.cnName(get_consumables().BULBYPP.get_longName()) + "。",Utils.cnName(get_consumables().BULBYPP.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(get_consumables().BULBYPP.get_shortName(),"给她" + get_consumables().BULBYPP.get_longName() + "。",get_consumables().BULBYPP.get_tooltipHeader());
            }
            if(_loc2_ && get_player().hasItem(get_consumables().KNOTTYP))
            {
               addNextButton(Utils.cnName(get_consumables().KNOTTYP.get_shortName()),giveKatAKnottyPepper).hint("给她" + Utils.cnName(get_consumables().KNOTTYP.get_longName()) + "。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().KNOTTYP.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().KNOTTYP.get_shortName()),"给她" + Utils.cnName(get_consumables().KNOTTYP.get_longName()) + "。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().KNOTTYP.get_tooltipHeader()));
            }
            if(_loc2_ && get_player().hasItem(get_consumables().W_FRUIT))
            {
               addNextButton(Utils.cnName(get_consumables().W_FRUIT.get_shortName()),giveKatWhiskerFruit).hint("给她" + Utils.cnName(get_consumables().W_FRUIT.get_longName()) + (hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1216) == 0 ? "，让她的肉棒变回猫科动物的形态。" : "。"),Utils.cnName(get_consumables().W_FRUIT.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().W_FRUIT.get_shortName()),"给她" + Utils.cnName(get_consumables().W_FRUIT.get_longName()) + "。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().W_FRUIT.get_tooltipHeader()));
            }
            if(get_player().hasItem(get_consumables().REDUCTO))
            {
               addNextButton(Utils.cnName(get_consumables().REDUCTO.get_shortName()),useReductoOnKat).hint("给她" + Utils.cnName(get_consumables().REDUCTO.get_longName()) + "，让她的本钱变小。",Utils.cnName(get_consumables().REDUCTO.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().REDUCTO.get_shortName()),"给她" + Utils.cnName(get_consumables().REDUCTO.get_longName()) + "。",Utils.cnName(get_consumables().REDUCTO.get_tooltipHeader()));
            }
            if(_loc2_ && get_player().hasItem(get_consumables().LACTAID))
            {
               addNextButton(Utils.cnName(get_consumables().LACTAID.get_shortName()),giveKatTheGiftOFMilk).hint("给她" + Utils.cnName(get_consumables().LACTAID.get_longName()) + "。",Utils.cnName(get_consumables().LACTAID.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().LACTAID.get_shortName()),"给她" + Utils.cnName(get_consumables().LACTAID.get_longName()) + "。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().LACTAID.get_tooltipHeader()));
            }
            if(_loc2_ && hasCock() && _loc5_)
            {
               addNextButton("粉色蛋",usePinkEggOnKath).hint("给她一颗粉色蛋，去掉她的肉棒。","粉色蛋");
            }
            else
            {
               addNextButtonDisabled("Pink Egg","给她一颗粉色的蛋，消除她的肉棒。如果她对自己的未来不确定，她是不会接受这种东西的。","Pink Egg");
            }
            if(_loc2_ && get_player().hasItem(get_consumables().P_DRAFT))
            {
               addNextButton(Utils.cnName(get_consumables().P_DRAFT.get_shortName()),useIncubiDraftOnKath).hint("给她" + Utils.cnName(get_consumables().P_DRAFT.get_longName()) + (hasCock() ? "，让她的肉棒变大。" : "，让她重新长出肉棒。"),Utils.cnName(get_consumables().P_DRAFT.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().P_DRAFT.get_shortName()),"给她" + Utils.cnName(get_consumables().P_DRAFT.get_longName()) + (hasCock() ? "，让她的肉棒变大" : "，让她重新长出肉棒") + "。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().P_DRAFT.get_tooltipHeader()));
            }
            if(_loc2_ && get_player().hasItem(get_consumables().P_S_MLK))
            {
               addNextButton(Utils.cnName(get_consumables().P_S_MLK.get_shortName()),giveKatPureSuccubusMilk).hint("给她" + Utils.cnName(get_consumables().P_S_MLK.get_longName()) + "，让她的乳房变大。",Utils.cnName(get_consumables().P_S_MLK.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().P_S_MLK.get_shortName()),"给她" + Utils.cnName(get_consumables().P_S_MLK.get_longName()) + "，让她的乳房变大。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().P_S_MLK.get_tooltipHeader()));
            }
            if(_loc2_ && hasCock() && get_player().hasItem(get_consumables().PSDELIT))
            {
               addNextButton(Utils.cnName(get_consumables().PSDELIT.get_shortName()),giveKatPureSuccubusDelight).hint("给她" + Utils.cnName(get_consumables().PSDELIT.get_longName()) + "，让她的蛋蛋变大。",Utils.cnName(get_consumables().PSDELIT.get_tooltipHeader()));
            }
            else
            {
               addNextButtonDisabled(Utils.cnName(get_consumables().PSDELIT.get_shortName()),"给她" + Utils.cnName(get_consumables().PSDELIT.get_longName()) + "，让她的蛋蛋变大。如果她对自己的未来不确定，她是不会接受这种东西的。",Utils.cnName(get_consumables().PSDELIT.get_tooltipHeader()));
            }
            if(_loc2_ && hasCock() && get_ballSize() == 1 && _loc5_ && get_player().hasItem(get_consumables().REDUCTO))
            {
               addNextButton("去除蛋蛋",useReductoAndPinkEgg).hint("你见过没有蛋蛋的扶她。你很确定粉色蛋加上缩小药膏能把她变成那样。","去除蛋蛋");
            }
            else
            {
               addNextButtonDisabled("Rem Balls","你见过没有蛋蛋的扶她。你很确定粉色的蛋和缩胸膏一起使用能让她变成那样。如果她对自己的未来不确定，她是不会接受这种东西的。","Remove Balls");
            }
            if(get_furry())
            {
               if(!get_noFur() && _loc2_ && _loc3_ && get_player().hasItem(get_consumables().P_S_MLK) && get_player().hasItem(get_consumables().GLDSEED))
               {
                  addNextButton("褪毛",giveKatDefurFormula).hint("让她变成猫娘。需要一颗黑蛋、一瓶未污染的魅魔乳汁和一颗金色种子。");
               }
               else
               {
                  addNextButtonDisabled("去毛","你可以提议让她变成猫娘。这需要一个黑蛋、一瓶纯净的魅魔乳液和一颗金色种子。如果她对自己的未来不确定，她是不会接受这种事情的。" + (get_noFur() ? " 在无毛模式下不适用。" : ""));
               }
            }
            else if(!get_noFur() && _loc2_ && _loc4_ && get_player().hasItem(get_consumables().W_FRUIT) && get_player().hasItem(get_consumables().EXTSERM))
            {
               addNextButton("长毛",giveKatRefuzzFormula).hint("提议让她再次变成猫人。这需要一瓶特制蜂蜜、一块须果和一瓶生发精华。");
            }
            else
            {
               addNextButtonDisabled("长毛","你可以提议让她再次变成猫人。这需要一瓶特制蜂蜜、一块须果和一瓶生发精华。" + (get_noFur() ? " 在无毛模式下不适用。" : ""));
            }
         }
         if(param1 == 2)
         {
            if(!hasClothing(4) && get_player().hasItem(get_armors().T_BSUIT))
            {
               addNextButton("紧身衣",giveKatClothesBodysuit);
            }
            else if(hasClothing(4))
            {
               addNextButtonDisabled("紧身衣","她已经有一件紧身衣了。");
            }
            else
            {
               addNextButtonDisabled("紧身衣","你觉得她可以穿紧身衣。");
            }
            if(!hasClothing(8) && get_player().hasItem(get_armors().B_DRESS))
            {
               addNextButton("长裙",giveKatClothesLongDress);
            }
            else if(hasClothing(8))
            {
               addNextButtonDisabled("长裙","她已经有一件长裙了。");
            }
            else
            {
               addNextButtonDisabled("长裙","你觉得她可以穿长裙。");
            }
            if(!hasClothing(64) && get_player().hasItem(get_armors().NURSECL))
            {
               addNextButton("护士服",giveKatClothesNurseOutfit);
            }
            else if(hasClothing(64))
            {
               addNextButtonDisabled("护士服","她已经有一套护士服了。");
            }
            else
            {
               addNextButtonDisabled("护士服","你觉得她可以穿护士服。");
            }
            if(!hasClothing(16) && get_player().hasItem(get_armors().SS_ROBE))
            {
               addNextButton("丝绸长袍",giveKatClothesSilkRobe);
            }
            else if(hasClothing(16))
            {
               addNextButtonDisabled("丝绸长袍","她已经有一件丝绸长袍了。");
            }
            else
            {
               addNextButtonDisabled("丝绸长袍","你觉得她可以穿丝绸长袍。");
            }
            if(!hasClothing(32) && get_player().hasItem(get_armors().TUBETOP))
            {
               addNextButton("抹胸",giveKatClothesTubeTop);
            }
            else if(hasClothing(32))
            {
               addNextButtonDisabled("抹胸","她已经有一件抹胸了。");
            }
            else
            {
               addNextButtonDisabled("抹胸","你觉得她可以穿抹胸。");
            }
         }
         if(param1 == 3 || param1 == 4)
         {
            _loc6_ = function(param1:String, param2:ItemType, param3:Function):void
            {
               if(_gthis.get_hairColor() == param1)
               {
                  _gthis.addNextButtonDisabled(param2.get_shortName(),"她的头发已经是" + Utils.cnName(param1) + "的了" + "。");
               }
               else if(!_gthis.get_player().hasItem(param2))
               {
                  _gthis.addNextButtonDisabled(param2.get_shortName(),"你觉得如果你能找到染发剂，她染成" + Utils.cnName(param1) + "的头发会很好看。");
               }
               else
               {
                  _gthis.addNextButton(param2.get_shortName(),param3).hint("向她提供" + Utils.cnName(param2.get_longName()) + "。");
               }
            };
            if(param1 == 3)
            {
               _loc6_("浓郁的红褐色",get_consumables().AUBURND,giveKatDyeAuburn);
               _loc6_("乌黑色",get_consumables().BLACK_D,giveKatDyeBlack);
               _loc6_("浅金色",get_consumables().BLOND_D,giveKatDyeBlonde);
               _loc6_("亮蓝色",get_consumables().BLUEDYE,giveKatDyeBlue);
               _loc6_("栗棕色",get_consumables().BROWN_D,giveKatDyeBrown);
               _loc6_("云灰色",get_consumables().GRAYDYE,giveKatDyeGray);
               _loc6_("青柠绿",get_consumables().GREEN_D,giveKatDyeGreen);
               _loc6_("亮橙色",get_consumables().ORANGDY,giveKatDyeOrange);
               _loc6_("霓虹粉",get_consumables().PINKDYE,giveKatDyePink);
               _loc6_("深紫色",get_consumables().PURPDYE,giveKatDyePurple);
               _g4 = this;
               page = 4;
               addButton(13,"下一页",function():void
               {
                  _g4.giveKatherineAnItem(page);
               });
            }
            else
            {
               _loc6_("彩虹色",get_consumables().RAINDYE,giveKatDyeRainbow);
               _loc6_("火红色",get_consumables().RED_DYE,giveKatDyeRed);
               _loc6_("赤褐色",get_consumables().RUSSDYE,giveKatDyeRusset);
               _loc6_("向日葵黄",get_consumables().YELLODY,giveKatDyeYellow);
               _loc6_("雪白色",get_consumables().WHITEDY,giveKatDyeWhite);
               _g5 = this;
               page4 = 3;
               addButton(13,"上一页",function():void
               {
                  _g5.giveKatherineAnItem(page4);
               });
            }
         }
      }
      
      public function giveKatWhiskerFruit() : void
      {
         clearOutput();
         outputText("你微笑着向凯瑟琳递上那个毛茸茸的小果子。凯丝的瞳孔开始放大，你注意到");
         if(hasCock())
         {
            outputText("明显的隆起" + clothesLowerChoice("在她的裤子里","在她的裙子下面","在她的紧身衣胯部","在她的裙子下面","在她的长袍下面") + "。[pg]");
         }
         else
         {
            outputText("她的乳头变得像钻石一样硬。[pg]");
         }
         if(!hasCock() || !hasDogCock())
         {
            outputText("她接过果子，咬下去时给了你一个大大的笑容，吸吮着所有的汁液。凯丝向后靠在床上，把胸部挺向你。[say: 哦，玛莱啊，这些东西真让我兴奋。] 她诱惑地舔了舔嘴唇，闭上眼睛，因积蓄的能量而颤抖。她用几乎无法控制的耳语问道，[say: 你想让我怎么做？]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().W_FRUIT);
            katSexMenu();
            return;
         }
         var _loc1_:Boolean = doneSubmissive(32);
         outputText("凯丝退后一步，挥手拒绝了果子。[saystart]光是闻到味道就让我发情了，但如果我吃了那些胡须果，我可能会失去我的狗肉棒");
         if(_loc1_)
         {
            outputText(cockMultiple("","") + "。这就是你想要的吗，" + playerText() + "？[sayend]");
         }
         else
         {
            outputText(cockMultiple("。它跟了我这么久，我已经习惯了拥有这个光滑的大龟头和配套的结","。它们……好吧，它们跟了我这么久，我已经习惯了拥有这些光滑的大龟头和配套的结") + "。[sayend][pg]");
            outputText("她继续说着，心不在焉地揉着胯部。[say: 我第一次吃那些辣椒的时候，我觉得我的肉棒，或者至少是那个结，是一个诅咒。你是第一个看到它没有尖叫着跑开的人。] 她给了你一个大大的微笑，说道，[say: " + cockMultiple("它现在是","它们现在是") + "我的一部分了。虽然是奇怪的魔法农产品加上去的，但仍然是我的一部分。][pg]");
            outputText("她的肉棒" + cockMultiple("肯定已经","肯定已经") + "肿胀到了最大尺寸，凯丝发出一声低沉的、滚动的呼噜声。[say: 现在，你把那个果子收起来，让我再给你展示一次你对我有多重要，怎么样？]");
         }
         if(submissiveness() >= 1)
         {
            outputText("[pg]你走向凯丝，把果子举到她鼻子底下。她闻了闻，开始脱衣服。一旦她赤身裸体，她就坐在床沿上，双腿张开，她的肉棒" + cockMultiple("","") + "随着她的心跳跳动着。[pg]");
            if(!_loc1_)
            {
               outputText("你提醒她，吃任何种类的辣椒都可能让她再次长出犬类肉棒。");
            }
            outputText("当你在她鼻子底下挥动果子时，她的头开始摇晃，几乎像钟摆一样，她放大的眼睛跟随着它的每一个动作。");
            if(!_loc1_)
            {
               outputText("难道她不想试试猫咪肉棒吗？看看大自然赋予她的肉棒做爱是什么感觉？");
            }
            outputText("[pg]凯丝的呼噜声越来越低沉。最后她咬下果子，轻轻地从你手指间拽过来，吸吮着多汁的果肉。当只剩下坚硬的果核时，凯丝把它扔进了垃圾桶。果核准确地飞了进去，凯丝挥舞着拳头。她说道，[say: 搞定，] 然后弯下腰，紧紧抓住她的" + cockMultiple("肉棒","双根肉棒") + "。[pg]");
            outputText("你惊讶地看着凯丝的肉棒" + cockMultiple("整根变窄。顶端变得","整根变窄。顶端变得") + "越来越尖，并形成小突起，发育成能给她的伴侣带来狂喜的倒刺。她的肉棒" + cockMultiple("现在","现在") + "只有大约一英寸粗" + (get_cockLength() > 12 ? "，相对于" + cockMultiple("它的","它们的") + "长度来说相当窄" : "") + "。[pg]");
            outputText("然后变化蔓延到了她的肉结");
            if(get_cockNumber() > 1)
            {
               outputText("上。它们缩小到无，然后再次膨胀。它们重复了几次，每次都让凯瑟琳发出深深的愉悦呻吟。最后它们稳定下来，" + (get_knotSize() == 2 ? "拒绝收缩得比以前更小" : "失去了以前的一些粗壮"));
            }
            else
            {
               outputText("。它缩小到无，然后再次膨胀。它重复了几次，每次都让凯瑟琳发出深深的愉悦呻吟。最后它稳定下来，" + (get_knotSize() == 2 ? "拒绝收缩得比以前更小" : "失去了以前的一些粗壮"));
            }
            outputText("。[pg]");
            outputText("结束后，凯丝上下抚摸着她的肉棒" + cockMultiple("","") + "。");
            if(!_loc1_)
            {
               outputText("[say: 真奇怪。我怎么还有" + cockMultiple("肉结","肉结") + "？] 她的" + catGirl("指甲","爪子") + "沿着她肉结" + cockMultiple("","") + "柔软的凸起划过，然后对你微笑。[say: 猜我吃了那么多辣椒，所以我能保留" + cockMultiple("它","它们") + "。][pg]");
            }
            outputText("她搂住你，用力吻你。[say: 现在" + playerText() + "，你想试试你的新小猫咪吗？" + (_loc1_ ? "倒刺和肉结" + cockMultiple("","") + "，全都有" : "她有一种全新的肉棒给你测试") + "。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,1);
            addSubmissive(32);
            set_knotSize(get_knotSize() - 2);
            if(get_knotSize() < 2)
            {
               set_knotSize(2);
            }
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().W_FRUIT);
         }
         katSexMenu();
      }
      
      public function giveKatTheGiftOFMilk() : void
      {
         var _loc1_:* = null as BreastStore;
         var _loc2_:* = null as BreastStore;
         clearOutput();
         outputText("你拿出一小瓶粉红色的催乳剂，展示给凯丝看。");
         if(!doneSubmissive(16384))
         {
            outputText("她小心翼翼地接过瓶子，仔细端详着。[say: 我不知道我该不该……我知道有些猫为了尝一口真正的猫奶会有多疯狂。我一直试图和帮派里的一些人保持联系，如果我漏出猫奶，那会变得更困难。][pg]");
            outputText("你伸出手，拔掉催乳剂瓶子的软木塞，轻轻地把它推向她，告诉凯丝你真的很想知道她的乳房能产出什么样的甘露。");
            outputText("[pg]凯瑟琳叹了口气，说道，[say: 如果你那么想尝尝我的奶，我想我可以满足你。]");
         }
         outputText("她" + clothesChoice("解开她的衬衫","打开她紧身衣的上半部分","解开她连衣裙的上半部分","敞开她的长袍","掀起她的抹胸","解开她护士服上的扣子") + "并脱下胸罩，露出她的乳房。[pg]");
         if(get_breasts().get_lactationLevel() < 3)
         {
            if(doneSubmissive(16384))
            {
               outputText("[say: 你想要更多的猫咪奶水吗？]她调皮地问道。她接过瓶子，用力拔出软木塞，说道，[say: 我想我可以满足你，只要你能在这里照顾我的需求。]说完，她仰起瓶子，一口吞下了粉红色的液体。[pg]");
            }
            else
            {
               outputText("她把瓶子扔到一边，补充道，[say: " + (submissiveness() >= 3 ? "面对现实吧，我不太擅长拒绝你任何事" : "这次会有所不同") + "，]然后低头看着自己的胸部。[pg]");
               get_breasts().set_lactationLevel(1);
            }
            outputText("你们俩注视着她的乳房，没过多久，催乳剂的效果就开始显现了。凯丝的乳头充血，乳房微微隆起。你用手托住它们，感觉到了一点额外的重量。");
            if(get_breasts().get_cupSize() < 4)
            {
               _loc1_ = get_breasts();
               _loc1_.set_cupSize(_loc1_.get_cupSize() + 1);
               outputText("你觉得她现在是" + get_breasts().cup() + "罩杯了。");
            }
            outputText("几滴浓稠的白色乳汁从凯丝的乳头滴落，她不由自主地颤抖了一下。[pg]");
            if(!doneSubmissive(16384))
            {
               outputText("你用手指收集了一点尝了尝；它浓郁而丝滑，就像上等的奶油在挑逗你的舌头。[pg]");
               outputText("[say: 希望你喜欢，]凯丝说。[say: 我本来以为要等我有了小猫才会产奶，但这可能很有趣。我的乳头更敏感了，这是肯定的——你想测试一下吗？][pg]");
            }
            addSubmissive(16384);
            milkOptionClear(1);
            if(get_breasts().get_lactationLevel() == 2 && get_breasts().preventLactationIncrease == 2)
            {
               get_breasts().preventLactationIncrease = 0;
            }
            if(!doneSubmissive(512))
            {
               get_breasts();
            }
            _loc1_ = get_breasts();
            _loc1_.set_lactationLevel(_loc1_.get_lactationLevel() + 1);
            get_player().consumeItem(get_consumables().LACTAID);
         }
         else if(submissiveness() < 3)
         {
            outputText("凯丝托住她的乳房，轻轻挤压了一下。几滴乳白色的液体从她的乳头滴落。凯丝叹了口气，用手指擦去湿润，说道，[say: 我觉得我不该喝，" + playerText() + "。我已经总是涨得满满的了——甚至撞到别人都足以让我开始漏奶。如果我再喝那东西，我身上就会一直有奶味，我的胸罩会被浸透。每次我走在街上，都会成为偷奶贼的目标。][pg]");
            outputText("没等你回答，她就把你的手和瓶子推到你的胸前，用一种性感的语气说道，[say: 我敢打赌我的奶水多得你喝不完。][pg]");
         }
         else if(get_breasts().get_lactationLevel() == 6)
         {
            outputText("凯丝托住她的乳房，轻轻挤压了一下。一股乳汁从她的乳头滴落，浸透了她的手指，" + catGirl("流过","浸入毛发") + "她的肚子，然后渗入" + clothesLowerChoice("她的裤子","她的裙子","她紧身衣的下半部分","她连衣裙的下半部分","她长袍的下半部分") + "和床单里。[pg]");
            outputText("[say: 我觉得现在喝那瓶药水纯属浪费，]她说。[say: 我不可能挤出比现在更多的奶水了。说到这个，我有两个乳房正渴望被清空；你能帮帮" + (hasCock() ? "扶她" : "女孩") + "吗？][pg]");
         }
         else
         {
            switch(get_breasts().get_lactationLevel())
            {
               case 3:
                  if(get_breasts().preventLactationIncrease == 3)
                  {
                     get_breasts().preventLactationIncrease = 0;
                  }
                  break;
               case 4:
                  if(get_breasts().preventLactationIncrease == 4)
                  {
                     get_breasts().preventLactationIncrease = 0;
                  }
                  break;
               case 5:
                  if(get_breasts().preventLactationIncrease == 5)
                  {
                     get_breasts().preventLactationIncrease = 0;
                  }
            }
            _loc1_ = get_breasts();
            _loc1_.set_lactationLevel(_loc1_.get_lactationLevel() + 1);
            get_player().consumeItem(get_consumables().LACTAID);
            if(!doneSubmissive(512))
            {
               outputText("凯丝托住她的乳房，轻轻挤压了一下。几滴乳白色的液体从她的乳头滴落。凯丝叹了口气，用手指擦去湿润，说道，[say: 我觉得我不该喝，" + playerText() + "。我已经总是涨得满满的了——甚至撞到别人都足以让我开始漏奶。如果我再喝那东西，我身上就会一直有奶味，我的胸罩会被浸透。每次我走在街上，都会成为偷奶贼的目标。][pg]");
               outputText("她试图把瓶子还给你，但你没有理会她，而是" + clothesLowerChoice("把手滑进她的腰带和裤子里","把手滑进她的裙底","把手指伸进她紧身衣的胯部","把手滑进她的连衣裙里","把手滑进她的长袍里") + "。你开始玩弄她的阴蒂，发现凯丝的小穴已经湿了。她在你的抚摸下扭动着身体，咬着下唇。你问她，到处洒满奶水的想法是不是让她兴奋了。[pg]");
               outputText("[say: 不，]她轻声发出咕噜声。[pg]");
               outputText("当然会，你回答道。当你继续把玩着她敏感的肉核时，你告诉凯瑟琳，你真的很想看到她的乳房充满更多的乳汁。你问她能不能为你这么做。[pg]");
               outputText("凯丝半睁开眼睛，看了看瓶子，又看了看你，然后拔掉软木塞，把里面的东西一饮而尽。刚咽下最后一口，她就说，[say: 噢，玛莱——为什么？我刚才为什么要这么做？这会惹来很多麻烦的。][pg]");
               outputText("你用空出的手托起她的一侧乳房，刚好感觉到里面产生了一股巨大的热量。她的乳头喷出大量的乳汁，凯丝弓起背，头几乎要碰到床了。[pg]");
               outputText("当药效减退时，凯瑟琳瘫倒成一团，你听到了深沉、满足的鼾声。你挠了几下她的耳朵，但即使这样也没能叫醒她，你决定让你最喜欢的小猫咪好好休息恢复。[pg]");
               doNext(get_camp().returnToCampUseOneHour);
               addSubmissive(512);
               return;
            }
            outputText("凯瑟琳把瓶子放在一边，然后拉起你的手，把它们放在她的胸前。[say: 喝不够我的奶吗？]她带着苦笑问道。[say: 好吧，只要你一直都在，把每一滴都舔干净就行。][pg]");
            outputText("你笑着揉捏她的乳头。凯丝笑了，她的尾巴因为你的关注而扭动着。她拔掉软木塞，吞下粉红色的液体，然后把瓶子扔到一边。[pg]");
            outputText("你再次感觉到从她乳房深处传来的热量。");
            if(get_breasts().get_cupSize() < 6)
            {
               _loc2_ = get_breasts();
               _loc2_.set_cupSize(_loc2_.get_cupSize() + 1);
               outputText("它们在你的指间膨胀，变得非常丰满。它们和以前一样坚挺，但你觉得凯瑟琳现在是 " + get_breasts().cup() + " 罩杯了。");
            }
            outputText("凯丝的乳汁不受控制地从乳头滴落，她发出一声低吟。突然，她的双手抓住你的头，把你拉近，把你的脸按在她漏奶的乳房上。[pg]");
            outputText("[say: 拜托，求求你了，把它全喝光——或者做点什么，让我别再去想我体内积聚的这些奶水！][pg]");
         }
         katSexMenu();
      }
      
      public function giveKatRefuzzFormulaDontChange() : void
      {
         clearOutput();
         outputText("你问她是否确定。[pg]");
         outputText("[say: 是的。我现在更喜欢柔软布料的感觉了。我能更好地应对沙漠的酷热，我甚至想过告诉其他猫咪这种感觉有多棒。][pg]");
         outputText("她凑近你，亲吻你的嘴唇、脸颊、脖子，最后是你的耳朵，还轻轻咬了一下。她低语道：[say: 但最好的理由是，这能给你一点家的味道，让你来镇上时能有所期待。所以拜托了，" + playerText() + "，好好照顾你最爱的猫娘吧。和我做爱，直到我受不了为止。]");
         katSexMenu();
      }
      
      public function giveKatRefuzzFormulaChange() : void
      {
         clearOutput();
         outputText("你把蜂蜜和生发精华倒进杯子里，开始挤出胡须果的汁液。当汁液滴入杯中时，凯丝继续说道。[say: 如果你什么时候想让我再次成为猫娘——<b>你的猫娘</b>——尽管开口。我喜欢那种所有人的目光都集中在我身上的感觉，想知道我是什么，在床上是什么样子。][pg]");
         outputText("杯子里的混合物开始起泡，有那么一瞬间，你担心它会溢出来。反应平息下来，剩下的是一种浓稠、透明的糊状物。凯丝用手指蘸了一下，说，[say: 摸起来凉凉的。]几根细小的毛发从她的指尖长了出来。[say: 我猜这更像是一种药膏，]她说着，接过了杯子。[pg]");
         outputText("凯丝开始把透明的凝胶涂抹在皮肤上。多亏了猫科动物的柔韧性，她能够够到身体的每一个部位，而且她很小心，没有漏掉任何地方。当她涂完时，杯子几乎空了，黑色的小毛发开始覆盖她的身体。你看到药膏被吸收了，直接渗入她的皮肤。[pg]");
         outputText("凯丝摸了摸自己的脸，她的鼻子改变了形状，变回了她刚出生时那种扁平的小口鼻。她的手也变了，指甲缩回皮肤里，形成了可伸缩的爪子，手掌重新变成了小肉垫。[pg]");
         outputText("皮毛长回来的时间最长，但当它最终长好时，凯丝站在你面前，跳了一段性感的小舞。[say: 好了，我恢复了自然本来的样子。" + (get_hairColor() == "jet black" ? "" : "她用手梳理了一下她" + get_hairColor() + "的头发。嗯，大部分是。") + "不管怎样，希望你喜欢你看到的。][pg]");
         outputText("你在她的床上坐下，挠了挠凯丝新长出的皮毛。她咯咯地笑，发出呼噜声，坐在你的腿上，她紧致的屁股在你的");
         if(get_player().hasCock())
         {
            outputText("肉棒" + (int(get_player().cocks.length) > 1 ? "" : ""));
         }
         else
         {
            outputText("胯部");
         }
         outputText((get_player().hasVagina() ? "并润湿了你的小穴" : "") + "。[pg]");
         outputText("[say: 让我尖叫吧，" + playerText() + "，]她乞求道，[saystart]向我展示你有多爱我。操我毛茸茸紧致的小屁股，直到我的");
         if(hasCock())
         {
            outputText((hasBalls() ? "蛋蛋" : "前列腺") + "被榨干，我的");
         }
         outputText("小穴被淫水浸透。[sayend][pg]");
         set_furry(true);
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().W_FRUIT);
         get_player().consumeItem(get_consumables().EXTSERM);
         if(get_player().hasItem(get_consumables().BEEHONY))
         {
            get_player().consumeItem(get_consumables().BEEHONY);
         }
         else
         {
            get_player().consumeItem(get_consumables().PURHONY);
         }
         katSexMenu();
      }
      
      public function giveKatRefuzzFormula() : void
      {
         clearOutput();
         outputText("是时候把你的猫娘变回猫人了。你拿出材料，把它们一一放在凯瑟琳的床上。胡须果、生发精华和森林蜜蜂的蜂蜜。凯丝饶有兴趣地看着，直到你最后告诉她，这应该能让她的皮毛重新长出来，把她变回猫人。[pg]");
         outputText("凯丝拿来一个杯子让你混合材料。[say: 顺便说一句，" + playerText() + "，我真的很享受没有皮毛的感觉。我没想到，但过了一会儿就不觉得奇怪了。]她故意脱下衣服，双手抚摸着自己柔软的肌肤。[say: 你确定要把我变回去吗？][pg]");
         menu();
         addButton(0,"把她变回去",giveKatRefuzzFormulaChange);
         addButton(1,"不改变",giveKatRefuzzFormulaDontChange);
      }
      
      public function giveKatPureSuccubusMilk() : void
      {
         var _loc2_:* = null as BreastStore;
         clearOutput();
         var _loc1_:Boolean = submissiveness() >= 2;
         if(get_breasts().get_cupSize() < 6)
         {
            outputText("你向凯丝展示了那瓶魅魔之乳，并告诉她它已经被净化过了。凯丝接过瓶子，左右倾斜，仔细观察里面浑浊的液体。[pg]");
            outputText("[say: 所以这东西应该能让我的胸部变大。]她托起她那 " + get_breasts().adj() + " 的 " + get_breasts().cup() + " 罩杯，问道");
            if(get_breasts().get_cupSize() == 1)
            {
               outputText("[say: 所以你想让我恢复到我原来的尺寸，是吧？好东西，我还是不习惯这些蚊子包有多小。]");
            }
            else if(get_breasts().get_cupSize() == 4)
            {
               outputText("[say: 什么？我对你来说<b>还是</b>不够大吗？]");
            }
            else
            {
               outputText("[say: 我想我可以试试。既然它已经被净化过了，那就没有坏处，对吧？]");
            }
            outputText("[pg]凯丝迅速脱掉衣服，站在镜子前。她对你咧嘴一笑，拔掉软木塞，一口气喝下了药水。她只来得及说了一句，[say: 哦，味道真怪，]然后牛奶的魔力就到达了她的胸部。[pg]");
            outputText("仿佛在风箱的作用下，她的乳房像气球一样膨胀起来，将她的皮肤拉得紧绷。过了一会儿，你看到它们变软了，皮肤神奇地扩张到足以容纳新的内容物。凯丝呻吟着，感受着她那更饱满、更沉重的双峰。");
            _loc2_ = get_breasts();
            _loc2_.set_cupSize(_loc2_.get_cupSize() + 1);
            if(get_breasts().get_cupSize() == 2)
            {
               outputText("[say: 是的，是的，是的！哦，感觉真好。][pg]");
               outputText("她转过身，走进你的怀抱，用她那新的资本紧紧拥抱着你。你感觉到她的乳头开始变硬，当你抚摸她的背时，她的尾巴开始左右摆动。[pg]");
            }
            else if(get_breasts().get_cupSize() < 6)
            {
               outputText("[say: 嗯，是的，我一直觉得我的沙漏上半部分可以再多点沙子。][pg]");
               outputText("凯丝上下跳动了几次，看着她那新的双峰随着她的动作而晃动。她注意到你在看，转过身走进你的怀抱，用她那新的资本紧紧拥抱着你。你感觉到她的乳头开始变硬，当你抚摸她的背时，她的尾巴开始左右摆动。[pg]");
            }
            else
            {
               outputText("[say: 哎哟。这些小家伙重多了" + (get_breasts().lactating() ? "，尤其是里面还有奶水" : "") + "。现在我明白为什么有些女孩会抱怨下背部疼痛了。][pg]");
               outputText("她上下跳动了几次，看着她那新的双峰随着她的动作而晃动。[say: 是的，我能应付。但我肯定需要一些更结实的胸罩。][pg]");
               outputText("她转过身，投入你的怀抱，将她新长出的资本紧紧贴着你。[say: 现在真正的问题是我该怎么改衣服。如果不稍微改一下，我肯定会把衣服撑破的。][pg]");
               outputText("你能感觉到凯丝的乳头开始变硬。你指出，胸部丰满的女孩确实喜欢炫耀，所以也许只要改到在公共场合不会走光就足够了。[pg]");
               outputText("[say: 好吧，" + playerText() + "，如果你喜欢你的" + catGirl("女孩","猫娘情人") + "在镇上招摇过市，吸引所有人的目光，那我当然可以这么做。][pg]");
               outputText("她开始用乳房摩擦你，然后将臀部向前倾，也开始用她的" + (hasCock() ? "肉棒" : "小穴") + "摩擦你。她发出呼噜声，说道：[say: 我以前从来不需要把臀部往前挺这么多才能碰到你。我想我需要稍微练习一下才能掌握诀窍。][pg]");
            }
            outputText("凯丝似乎正处于充满爱意的状态，为什么要让她失望呢？[pg]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         else if(get_breasts().get_cupSize() < 9 && _loc1_)
         {
            outputText("你让凯瑟琳脱掉衣服。你有一份礼物要送给她。她跳上床，慢慢地脱下衣服，为你表演了一段迷人的脱衣舞。当她脱完后，你把那瓶魅魔之乳放在她手里。[pg]");
            outputText("[say: 可是，" + playerText() + "，我已经很大了……][pg]");
            outputText("你用双手托住她的乳房打断了她。当你的拇指开始揉捏她的乳头时，她吸了一口气" + (get_breasts().lactating() ? "，挤出了几滴乳汁" : "") + "。你告诉她，她的罩杯每增大一号，对你来说就越有吸引力。凯丝扭动着身体，发出呻吟，但你继续揉捏她肿胀的乳头，直到你闻到淫液开始从她的阴户滴落的气味。[pg]");
            outputText("你告诉她，在内心深处，她渴望喝下它，她想看看再喝一剂后她的乳房会发生什么变化。凯丝睁开眼睛，充满欲望地盯着你。她的手迅速动作，拔掉软木塞，将乳汁倒进嘴里。[pg]");
            outputText("她咽了下去，问道：[say: 我做了什么？] 随后她的" + (get_breasts().get_cupSize() == 6 ? "奶子" : "乳房") + "开始在你的手指下膨胀。仅仅几秒钟，它们" + (get_breasts().get_cupSize() == 5 ? "就变成了名副其实的巨乳" : "就膨胀到了惊人的尺寸") + "。[say: 哦，玛莱啊！我上面太重了。] 凯丝向后靠，调整姿势以支撑她膨胀的双峰。[pg]");
            outputText("你吻了她，手指在她的乳房上揉捏。凯丝发出像猫一样的叫声，问道：[say: 我猜你想让我炫耀这些，对吧？] 你稍微用力捏了一下" + (get_breasts().lactating() ? "，挤出了更多她的乳汁" : "") + "。[say: 好吧，" + playerText() + "。等我下班后，镇上的每个人都会认为我是个大胸荡妇。男人们会在街上试着雇佣我。但你最好一直操我，因为我会变得<b>很饥渴</b>。][pg]");
            _loc2_ = get_breasts();
            _loc2_.set_cupSize(_loc2_.get_cupSize() + 1);
            addSubmissive(64);
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         else if(_loc1_)
         {
            outputText("你让凯瑟琳脱掉衣服。你有一份礼物要送给她。她跳上床，慢慢地脱下衣服，用脱衣舞挑逗你。当她脱完后，你把那瓶魅魔之乳放在她手里。[pg]");
            outputText("[say: 可是，" + playerText() + "，我已经很大了……][pg]");
            outputText("你试图托住她的乳房，但乳肉太多了，你甚至无法用双手握住它们。凯丝把魅魔之乳放在一边，说道：[say: 看到了吗？我太大了，你甚至不能一次揉遍我的整个胸部。请不要让我变得更大了，" + playerText() + "；你会把我的脊椎压断的。] 她开始剥掉你的衣服，补充道：[say: 我们就当你的" + (get_player().hasCock() ? "肉棒" : "爱") + "是你想要给我的礼物吧。][pg]");
         }
         else
         {
            outputText("你向凯丝展示了那瓶魅魔之乳，并告诉她它已经被净化过了。凯丝接过瓶子，左右倾斜，仔细观察里面浑浊的液体。[pg]");
            outputText("她托起自己巨大的乳房，说道：[say: 我觉得DD罩杯可能已经够大了。再大一点，我看起来就像是靠张开双腿谋生的人了。而且，即使是现在，每当我不得不追捕罪犯时，这两团肉也会疯狂地弹跳。" + (get_breasts().lactating() ? " 通常等我抓住他们时，我的胸甲已经被浸透了。" : "") + "][pg]");
            outputText("凯丝用双臂环抱住你，用她的胡须摩擦你的脸。");
            if(hasCock())
            {
               outputText("你能感觉到她的肉棒" + clothesLowerChoice("在裤子里","在裙子下","在紧身衣里","在连衣裙下","在长袍下") + "勃起；它");
            }
            else
            {
               outputText("它");
            }
            outputText("看来凯丝很欣赏这个礼物的想法，并想用她一贯的方式感谢你。[pg]");
            outputText("她确实犹豫了一下……如果你能说服凯丝去做一些她不太确定的事情，她也许会愿意再喝下一些魅魔的乳汁。");
         }
         katSexMenu();
      }
      
      public function giveKatPureSuccubusDelight() : void
      {
         clearOutput();
         outputText("你向凯丝展示了这瓶魅魔之悦，并告诉她这已经被净化过了。凯丝接过瓶子，左右倾斜，仔细观察里面浑浊的液体。");
         if(!hasBalls())
         {
            outputText("你告诉她，既然她现在没有蛋蛋了，也许她可以喝下这个来提高精子产量。[pg]");
            outputText("她笑了。[say: 好像我需要似的。不管有没有蛋蛋，我都能射出成桶的精液。]她又看了一眼瓶子，拔出软木塞，小心翼翼地闻了闻。[say: 好吧……我想试试这东西也没什么坏处。][pg]");
            outputText("凯丝仰头喝下瓶子里的液体。当没有立即产生效果时，她看着你耸了耸肩。然后她的尾巴开始疯狂地摆动，凯丝扔掉瓶子，抓住了自己的屁股。[say: 呀！哦，天哪——好痒。感觉就像有人用桃子摩擦我的前列腺。][pg]");
            outputText("她左右扭动着屁股，全神贯注。[say: 感觉确实变大了一点。不是肿胀，只是自然地变大了。][pg]");
            outputText("你在她屁股上轻轻拍了一下，她就跳进了你的怀里，依偎在你的脖子上。[say: 谢谢你，" + playerText() + "，我等不及想试试了。我是说，我真的等不及了，]她说着，用她正在变硬的肉棒" + cockMultiple("","们") + "蹭着你。");
            set_ballSize(get_ballSize() - 1);
         }
         else if(get_ballSize() < 5)
         {
            outputText("你问她是否曾经想过射出更长、更粗的精液。这东西会给她巨大的性腺和足以装满一个洗衣盆的精液。[pg]");
            outputText("她对你的推销笑着回答道，[say: 哦，当然，为什么不呢？更大的蛋蛋肯定更好，对吧？]她友好地向你眨了眨眼，然后接过瓶子，打开盖子，一饮而尽。伴随着一声呻吟" + clothesLowerChoice("和弓起的背部，当你在旁观看时，她紧身的短裤里鼓起了一个新的包","她撩起裙子，让你看着她紧身的内裤里鼓起了一个新的包","和弓起的背部，她半透明的紧身衣裆部鼓起了一个新的包","她撩起裙子，让你看着她紧身的内裤里鼓起了一个新的包","她解开长袍，让你看着她紧身的内裤里鼓起了一个新的包") + "，她的蛋蛋肉眼可见地变大。它们的大小大约翻了一倍，然后停止了生长，留下这只猫" + (hasCock() ? "扶她" : "娘") + "喘着粗气。");
            outputText("她向你抛了个媚眼。[say: 那么……你想给它们做个测试吗？]她发出满足的呼噜声。");
            set_ballSize(get_ballSize() + 2);
            if(get_ballSize() > 5)
            {
               set_ballSize(5);
            }
         }
         else
         {
            if(!(submissiveness() >= 4 && get_ballSize() < 9))
            {
               if(submissiveness() >= 4)
               {
                  outputText("她跪在地上恳求你。[say:拜托了，" + playerText() + "——我现在追捕罪犯时就已经很困难了。如果它们再变大，我可能会丢掉工作。谢谢你的好意，但这些怪物产出的精液难道还不够我们俩用吗？求你了，我们能不能做点别的？]她带着担忧的微笑补充道，试图委婉地拒绝。");
                  if(get_player().cor >= 75)
                  {
                     outputText("[pg]给你那" + catGirl("猫娘","猫科") + "性玩具弄出大到让她无法移动的巨型睾丸肯定会很有趣。但另一方面，如果她丢了工作，你就得照顾她。去他的——你现在想怎么操她就怎么操，而且还不用花钱。[pg]");
                     outputText("你挠了挠她的耳朵，向她保证没关系。凯丝发出呼噜声，紧紧贴着你，她的肉棒" + cockMultiple("开始从包皮中滑出。","开始从包皮中滑出。"));
                  }
               }
               else
               {
                  outputText("她看着球茎辣椒，然后摇了摇头。[say:不用了，谢谢。再大一点我走路都会有困难，而且我觉得我现在弄出的动静已经够大了。不过还是谢谢你的好意。还有别的事吗？]她补充道，试图委婉地拒绝。[pg]");
                  outputText("她确实犹豫了一秒钟……如果你能说服凯丝做一些她不确定的其他事情，她可能会愿意喝下去。");
               }
               katherineMenu();
               return;
            }
            addSubmissive(2048);
            set_ballSize(get_ballSize() + 2);
            if(get_ballSize() > 9)
            {
               set_ballSize(9);
            }
            outputText("她看着瓶子，然后摇了摇头。[say: 不，谢谢。再大一点我走路都会有困难的，而且我觉得我现在弄出的动静已经够大了。不过还是谢谢你的提议。还有别的事吗？]她补充道，试图表现得委婉一些。[pg]");
            outputText("你对凯丝咧嘴一笑，告诉她你想看她变得更大。玛瑞斯有很多人蛋蛋比她大，但他们依然能四处走动。你凑近她，隔着她的" + clothesLowerChoice("短裤","裙子","半透明紧身衣","连衣裙","长袍") + "开始抚摸她那" + ballAdj() + "悬垂的球体。[pg]");
            outputText("凯丝喘着粗气，她的" + cockMultiple("肉棒开始","肉棒们开始") + "变硬。[say: 我……我想我可以试试。只要你还觉得我漂亮。][pg]");
            outputText("你继续按摩她的蛋蛋，并告诉她这还不够。她答应得这么快，心里肯定很想要。[pg]");
            outputText("凯丝在原地扭来扭去，似乎她的一部分想要逃跑。最后，在深吸了一口气后，你听话的小" + catGirl("猫娘","猫咪") + "说道，[say:是的。是的，" + playerText() + "，我想要。如果你想让我有更大的蛋蛋，那我也想要。][pg]");
            outputText("你只是笑了笑，把瓶子递给凯丝。她接过瓶子，拔掉软木塞，像快渴死了一样大口喝了起来。[pg]");
            outputText("没过多久，你就感觉到她的阴囊在膨胀。它跳动着，将你的手指撑开，她的每个睾丸都长大了大约两英寸。它们最终停在直径 " + get_ballSize() + " 英寸——每个都是。甚至比你村里的种马和公牛还要大。");
            outputText("凯瑟琳用双臂环抱住你以寻求支撑。当变化似乎已经结束时，她张开双腿以适应她那 " + ballAdj() + " 的阴囊，并在你耳边低语，[say: 那么……你想试用一下它们吗？]");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1218,FlagDict_Impl_.arrayReadInt(_loc1_,1218) + 24);
         get_player().consumeItem(get_consumables().PSDELIT);
         katSexMenu();
      }
      
      public function giveKatOralPussyLicking() : void
      {
         clearOutput();
         outputText("你微微一笑，告诉凯瑟琳你不介意用嘴满足她。[pg]");
         outputText("[say: 好吧，我的意思是，我又不会拒绝。][pg]");
         if(isAt(1))
         {
            outputText("你示意她坐在");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("她的床沿上");
            }
            else
            {
               outputText("她的梳妆台顶上");
            }
         }
         else if(isAt(8))
         {
            outputText("你示意她坐在");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("一个大沙丘顶上");
            }
            else
            {
               outputText("一个小沙丘靠近顶部的地方");
            }
         }
         else
         {
            outputText("你示意她半坐在附近的一个");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("空板条箱上");
            }
            else
            {
               outputText("宽阔的石墙");
            }
         }
         outputText("。她看起来相当急不可耐，没过一会儿，你就能清楚地看到并接触到她已经湿润的小穴了。[pg]");
         outputText("你向这只猫咪的小穴发起攻势，舌头慢慢舔舐着她的外阴唇，让她越来越湿润的小穴放松下来。你调笑她这么容易就兴奋起来，但还是努力地取悦她");
         if(get_player().cor >= 70)
         {
            outputText("——哪怕只是为了证明你的技巧，让这只小猫在发泄时越来越依赖你");
         }
         outputText("。[pg]");
         outputText("你挑逗地舔舐着，绕着她的阴蒂打圈，然后慢慢移开，接着又凑回去。上方传来一声响亮而欲求不满的喵呜声，催促着你开始温柔地吸吮她的阴蒂，这换来了一声压抑的呻吟和这只小猫人双腿的抽搐。你毫不间断地继续侍弄着，将舌尖滑入她的小穴，品尝那大量涌出的淫液。[pg]");
         outputText("你的手指掰开她的双腿，接着拨开她粉嫩柔软的通道，让你的舌头能探得更深。当她的头来回摇晃时，你的双手顺着她的小腹向上滑去，温柔地揉捏着她的乳房。[pg]");
         outputText("她再次发出一声喵呜，显然在尽力忍耐以延长这份快感。你决定是时候稍微动点真格的了。[pg]");
         if(get_player().tongue.type == 1 || get_player().hasLongTongue())
         {
            outputText("你终于充分利用了你那长而灵活的舌头。你收紧了变身赋予你的异常肌肉，将舌头完全滑入，分叉的舌尖顶着她阴道的深处，同时舌根在她的阴蒂下方起伏。[pg]");
         }
         else
         {
            outputText("你将舌头压在她的阴蒂下方，左右摇摆，你的味蕾在最敏感的肉体上摩擦。[pg]");
         }
         outputText("在用舌头挑逗了她的阴蒂之后，你抽离了一会儿，并宣布非常欢迎猫娘快点高潮，因为你很乐意一次又一次地对她这样做。[pg]");
         outputText("[say:谢谢你，]她喘息着，然后发出一声猫叫，一小股口水顺着她的下巴流了下来。不知怎么的，她看起来太可爱了，你都不忍心指出这一点。[pg]");
         outputText("决定是时候让她高潮了，你俯身凑近女孩湿透的阴道。你开始舔舐她的内部，挑逗她的阴蒂，同时你的手又回到了揉捏她的乳头上。[pg]");
         outputText("伴随着大量的喘息、一声猫叫，然后是一声狂喜的低吼，猫娘的淫水浸湿了你的脸，她的阴部紧紧地包裹着你的舌头。她的大腿颤抖着，将你的头夹在中间，无法让你离开。");
         outputText("[pg]完事后，你直起腰，向猫娘眨了眨眼。凯瑟琳发出呼噜声，跳到你身边，拉着你接吻。[pg]");
         outputText("[say: 你太棒了！] 她惊呼道，仍然气喘吁吁。");
         if(get_player().hasLongTongue())
         {
            outputText("她的手指滑过你的嘴唇。[say: 我想我可能爱上了那个美丽洞穴里的怪物。][pg]");
         }
         else
         {
            outputText("[say: 我希望如果我有机会报答你的话，我也能做得像你一样好。][pg]");
         }
         outputText("她再次吻你，双手顺着你的背部抚摸。你担心如果这样继续下去，你可能会立刻再来一回合；你用一个吻将自己与猫" + (hasCock() ? "扶她" : "娘") + "分开，" + (isAt(8) ? "你收拾好补给，准备返回特尔阿德雷。" : "你们分道扬镳了。"));
         orgasm();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         get_player().slimeFeed();
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveKatOralPenisWingWang() : void
      {
         clearOutput();
         var _loc1_:Boolean = hasAlready(4);
         get_images().showImage("katherine-give-her-blowjobs");
         outputText("你微微一笑，告诉凯瑟琳你不介意用嘴满足她。[pg]");
         if(_loc1_)
         {
            outputText("[say:好吧，我是说，如果你不介意肉结" + cockMultiple("","，还有这两根肉棒，") + "我就不介意你给我口交……我只是觉得什么都不给你留有点过意不去。][pg]");
         }
         else
         {
            outputText("[say:但是……[name]，你确定吗？我是说，有肉结" + cockMultiple("","……我是说，既然我现在有两根肉棒") + "，那可有很多活要干……而且我也不想让你什么都得不到……][pg]");
         }
         outputText("你向她保证你一点也不介意——事实上，你想这么做，而且可能会喜欢这么做。[pg]");
         outputText("凯瑟琳避开你的视线，" + catGirl("脸羞得通红","显然在皮毛下脸红了") + "，回答道：[say:好吧。" + (_loc1_ ? "如果你想再来一次，我有什么好争的？只是要小心，" : "如果这真的是你想要的。只是请小心，特别是") + "为了你自己好，好吗？][pg]");
         if(isAt(1))
         {
            outputText("你示意她坐在");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("她的床沿上");
            }
            else
            {
               outputText("她的梳妆台顶上");
            }
         }
         else if(isAt(8))
         {
            outputText("你示意她坐在");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("一个大沙丘顶上");
            }
            else
            {
               outputText("一个小沙丘靠近顶部的地方");
            }
         }
         else
         {
            outputText("你示意她半坐在附近的一个");
            if(!get_player().isTaur() && get_player().get_tallness() < 102)
            {
               outputText("空板条箱上");
            }
            else
            {
               outputText("宽阔的石墙");
            }
         }
         outputText("。与她所说的相反，她似乎非常渴望，仅仅过了一会儿，你就能清楚地看到并接触到" + cockMultiple("她的肉棒和","她的两根肉棒以及") + "她已经湿润的小穴" + (get_ballSize() >= 5 ? "，尽管她下垂的睾丸在一定程度上遮挡了你的视线" : "") + "。[pg]");
         if(get_cockNumber() == 1)
         {
            outputText("当你靠近她坐着的位置时，这只猫咪的小穴是你的首要目标；当你的舌头慢慢舔舐" + (hasBalls() ? "她的蛋蛋时，你轻轻地将它们向上拉向一侧" : "她的肉棒底部时，它翘得越来越高") + "，完全露出了她越来越湿润的小穴。你戏弄她竟然变得如此兴奋，但还是努力取悦她");
            if(get_player().cor >= 70)
            {
               outputText("——哪怕只是为了证明你的技巧，让这只小猫在发泄时越来越依赖你");
            }
            outputText("。[pg]");
            outputText("你挑逗地舔舐着，绕着她的阴蒂打转，慢慢移开，然后又回到原处。她的肉棒似乎变得更硬了，开始滴下前列腺液，眼看就要弄脏" + (get_cockLength() < 10 ? "你的脸" : "你的头发") + "。上方传来一声响亮而沮丧的猫叫，促使你开始温柔地吸吮她的阴蒂，作为回报，你听到了一声被压抑的呻吟，并且感觉到这个小猫人的大腿在抽搐。你毫不犹豫地继续你的动作，将舌尖滑入她的小穴，品尝着那源源不断流出的汁液。[pg]");
            outputText("觉得这个部位暂时已经得到了足够的关注，你" + (hasBalls() ? "慢慢向上移动到她的蛋蛋，温柔地将它们一个个吸进嘴里。你" : "") + "让你的舌头滑出，缠绕在她阴茎的下半部分，就在她阴茎那几乎难以察觉的增厚部分下方，那里标志着她的肉结很快就会" + (get_knotSize() >= 6 ? "巨大地" : "") + "鼓起的地方。");
            outputText("当你慢慢地沿着她阴茎的底部向上，朝着那" + cockType("圆锥形、尖尖的","狭窄、凹凸不平的") + "龟头移动时，凯瑟琳再次呻吟起来。你温柔地吸吮着顶端，然后将一根手指滑入猫人的小穴。她情不自禁地扭动起来，大腿反射性地夹住你的手，然后她又强行将它们分开。你慢慢地在她的肉棒上上下套弄" + (get_cockLength() >= 14 ? "，在真正深喉这个东西时遇到了一些小麻烦" : "") + "。与此同时，你用手指抠弄着她的小穴——你的手已经完全被她的分泌物浸透了。你用那只沾满她自己汁液的手抓住她的肉棒，开始为她手淫，同时你又回到下面去舔她的阴蒂；你的另一只手则滑入猫人的体内。[pg]");
            outputText("她又叫了一声，显然在尽力抵抗以延长快感。在同时挑逗她的阴蒂和肉棒一段时间后，你决定是时候来点更认真的了。[pg]");
            outputText("觉得这女孩的阴道暂时已经被挑逗得差不多了，你回到她勃起的肉棒上，张开嘴将她含了进去。[pg]");
            if(get_player().tongue.type == 1)
            {
               outputText((hasBalls() ? "刚才还在指奸她的手将她的蛋蛋推到一边，你慢慢地顺着她的勃起向下移动。你" : "你慢慢地顺着她的勃起向下移动你的舌头，") + "轻轻地对着它哼唱，然后几乎一直向下移动到根部，凯瑟琳的眼睛睁得大大的。你那长而灵活的分叉舌头伸出来并向下" + (hasBalls() ? "，沿着她左侧睾丸的边缘滑动" : "") + "，然后找到了你的目标：猫娘的阴蒂。你的另一只手开始轻轻地挑逗她的下唇，你慢慢地移动它，主要用你的喉部肌肉和长而灵活的舌头来取悦她。[pg]");
            }
            else if(get_player().hasLongTongue())
            {
               outputText((hasBalls() ? "刚才还在指奸她的手将她的蛋蛋推到一边，你慢慢地顺着她的勃起向下移动。停在" : "你慢慢地顺着她的勃起向下移动你的舌头。当它到达") + "她的肉结通常弹出的地方之前，你决定给这个女孩一点甜头。慢慢地，你那长得令人难以置信的灵活舌头向你那如小猫般的伴侣的小穴移动，给了它一个长长而湿润的舔舐。凯瑟琳的臀部颤抖着，她勉强忍住没有向前挺动。为了奖励她这种自我控制的表现，你把舌头向上移动，包裹住她阴茎的根部，就在你那非人肌肉的整个长度从你嘴里滑出的时候；你设法把它的尖端向下，然后刷过猫娘的阴道。凯瑟琳只是睁大眼睛盯着你，看着你把你那恶魔般的附属物滑进她的小穴，有效地同时取悦了她下半身几乎所有的性感带。[pg]");
            }
            else
            {
               outputText("然而，你的手仍然留在她的小穴里，增加了你取悦爱人的多种方式。[pg]");
            }
            outputText("在吸吮了她的肉棒一会儿，并且");
            if(get_player().tongue.type == 1)
            {
               outputText("用你的舌头猥亵她的阴蒂");
            }
            else if(get_player().hasLongTongue())
            {
               outputText("在你给她口交时，用舌头插入她");
            }
            else
            {
               outputText("用手指抠弄她");
            }
            if(!hasBalls())
            {
               outputText("，你暂时退开，并且");
            }
            else
            {
               outputText("，你决定稍微改变一下策略，以免让这女孩太快射精而感到难堪。到目前为止，这双性猫人的蛋蛋基本上被忽略了，你决定弥补这一点，慢慢从口交中退出来，将嘴唇移向她的睾丸。你轻柔地舔舐它们，然后将其中一个含入口中吸吮。[pg]");
               if(get_player().tongue.type == 1)
               {
                  outputText("不管有没有蛋蛋碍事，你发现用你长长的舌头无情地玩弄女孩的小穴相当容易。你可以轻松地挑逗她的阴蒂，甚至将舌尖滑入其中，轻弹她内壁的两侧，她对这温柔的举动发出愉悦的呼噜声，偶尔还会发出一声无声的呻吟。你抚摸着她肉棒的根部——这东西得等会儿再好好关照了。[pg]");
                  outputText("你一边用非人的长舌挑逗着猫娘小穴的内部，一边吸吮着她的睾丸，同时还照顾着她的肉棒。凯瑟琳脸上露出了极乐的神情——你觉得如果不让她比计划中更快高潮的话，可能有点太残忍了。[pg]");
               }
               else if(get_player().hasLongTongue())
               {
                  outputText("当凯瑟琳感觉到你那过长的舌头滑过她的睾丸时，你能感觉到她因无法自拔的欲望而颤抖。你将舌头向上滑动，挑逗她肉棒的肉结区域，然后再向下滑动，在可怜小猫的阴蒂上游走，用舌头将其完全覆盖。最后，你将舌头滑入其中，凯瑟琳发出一声响亮的欢愉尖叫，然后咬住自己的手让自己安静下来。[pg]");
                  outputText("你一边用非人的长舌挑逗着猫娘小穴的内部，一边吸吮着她的睾丸，同时还照顾着她的肉棒。凯瑟琳脸上露出了极乐的神情——你觉得如果不让她比计划中更快高潮的话，可能有点太残忍了。[pg]");
               }
               else
               {
                  if(!hasBalls())
                  {
                     outputText("你发现很容易就能把舌头伸得更长，在做的时候几乎一直温柔地舔舐她的阴蒂。");
                  }
                  else if(get_ballSize() <= 2)
                  {
                     outputText("在把玩她的睾丸时，你有时能触碰到她的小穴，用舌头挑逗它。");
                  }
                  else
                  {
                     outputText("你也希望能玩弄她的小穴，但这猫娘的蛋蛋实在太大了，你的舌头根本够不到。你几乎能感觉到，甚至能听到那两个大肉球里精液晃动的声音，仿佛随时都会喷射出来。");
                  }
                  outputText("[pg]你在用她的蛋蛋摩擦自己的脸时，手指轻轻滑过她肉棒的顶端，但你还不想让她一下子承受太多的快感。[pg]");
               }
            }
            outputText("在用舌头对她进行了一番挑逗后，你暂时退开，告诉猫娘她随时可以高潮，" + (_loc1_ ? "因为你很乐意一次又一次地为她服务" : "因为这可能不会是一次性的服务，她没必要这么拼命地忍耐") + "。[pg]");
            outputText("[say:谢谢你，]她喘息着，发出一声猫叫，一小股口水顺着下巴流了下来。不知怎么的，她看起来太可爱了，让你不忍心指出这一点。[say:嗯……我不知道你想怎么结束，但是……注意肉结，好吗？这感觉真的太棒了，如果你伤到自己就太可惜了……我感觉它很快就要胀起来了。][pg]");
            outputText("你点点头，开始思考到底要怎么完成最后一步，让这猫娘高潮。[pg]");
            if(get_player().tongue.type == 1)
            {
               outputText("你带着坏笑，抓住她阴茎的根部，舔了舔嘴唇，而凯瑟琳则在期待中颤抖着。你没有太在意安全，直接深喉了这只小猫，直到你的嘴唇碰到你的手指。这并不是你做过最容易的事，但在把她深喉的同时，你可以伸出舌头再次舔舐她的阴蒂。你的双重关照让这只猫娘欣喜若狂。[pg]");
               outputText("很快，你感觉到了她高潮即将来临的迹象。凯瑟琳大声喘息着，无法控制自己；她的肉结鼓了起来，小穴也变得越来越湿润。");
               if(get_knotSize() >= 6)
               {
                  outputText("遗憾的是，猫娘鼓起的肉结让你在这个姿势下很难像你希望的那样用长舌头取悦她的小穴，一旦她完全肿胀起来，你就不得不放弃了。");
               }
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("你决定把蛇的角色扮演到底，不满足于冷落她的小穴，你[if (isMer) {将鱼鳍平贴在鳞片上，并}]将长尾巴的尖端滑入她的体内。她狂喜地呻吟着，终于达到了高潮。");
               }
               else
               {
                  outputText("不满足于冷落她的小穴，你将两根手指滑入她的体内，同时用指关节挑逗她的阴蒂。她似乎对你的关照感到非常高兴，片刻之后便在高潮中颤抖起来。");
               }
               outputText("[pg]你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "手指") + "被紧紧挤压并浸湿，同时你感觉到她的勃起在你的嘴里抽动和跳动。你完成了你的动作，深入到她肉结的边缘，用力地吮吸着她，而她则将她的精液射入你的嘴里，顺着你的喉咙流下。[pg]");
               outputText("你贪婪地吞咽着你双性人恋人的精液；");
               if(cumQ() <= 500)
               {
                  outputText("考虑到" + (hasBalls() ? "她蛋蛋的大小" : "她没有睾丸") + "，这量相当大，至少能代替一杯不错的热饮。");
               }
               else if(cumQ() <= 1500)
               {
                  outputText("你能感觉到她浓稠、大量的精液在较小的细流之间流入你的嘴里，顺着你的喉咙流下。她的高潮相当强烈，让你感觉相当饱满。");
               }
               else
               {
                  outputText((hasBalls() ? "正如她睾丸的大小所暗示的那样，" : "她的前列腺一定是在加班加点地工作，因为") + "凯瑟琳射了——很多。一波又一波的精液涌入你的喉咙，把你的肚子填得都快撑破了。");
               }
               outputText("慢慢地，你把她的肉棒从嘴里拔出来，凯瑟琳对你微笑，感激地发出呼噜声。");
            }
            else if(get_player().hasLongTongue())
            {
               outputText("你用手指分开结应该出现的地方，然后顺着她的肉棒滑下去。反正你要让她大部分地方都爽到，于是你故技重施，用另一只手将你" + (get_player().tongue.type == 2 ? "恶魔般的" : "长得不像人类的") + "舌头缠绕在她的肉棒根部，同时你长长的舌头滑出来舔弄和把玩她的" + (hasBalls() ? "蛋蛋。顺着她的睾丸滑动" : "阴蒂。这") + "似乎开始点燃她的高潮——她结的凸起变得更大了，尽管看起来你还有一点时间。你继续向下滑动，" + (hasBalls() ? "滚动她的蛋蛋，然后把它们抬起来，将" : "将") + "你的舌尖推入她的小穴。当她的阴道开始收缩，内壁抽搐，结膨胀到最大尺寸时，你能尝到她流出的女性汁液");
               if(get_knotSize() >= 6)
               {
                  outputText("，甚至让你很难把舌头一直埋在里面");
               }
               outputText("。[pg]");
               outputText("伴随着一声大叫，她高潮了，她的小穴紧紧夹住你恶魔般的舌头，她的阴茎在你的嘴里抽搐着。[pg]");
               if(cumQ() <= 500)
               {
                  outputText("当你的舌头挑逗她的" + (hasBalls() ? "蛋蛋" : "阴蒂") + "时，她几乎在高潮中挣扎，你的嘴巴挤奶般地吞噬着她轻易释放出的精液。");
               }
               else if(cumQ() <= 1500)
               {
                  outputText("当你的嘴巴喝着她的肉棒牛奶时，你的舌头毫无阻碍地滑过并挑逗她的" + (hasBalls() ? "蛋蛋" : "阴蒂") + "。量很大，但你没有抱怨。");
               }
               else
               {
                  outputText("凯瑟琳的" + (hasBalls() ? "大睾丸在你的舌头上颤抖，因为它们排出了" : "前列腺一定是在加班加点地工作，才产生了如此巨大的") + "精液。你能感觉到它渗入你的体内，当你努力吞下这一切时，你的肚子被稍微撑大了。");
               }
               outputText("与此同时，她的小穴有节奏地挤压你的舌头，并用女孩的精液覆盖它。[pg]");
               outputText("一旦她高潮结束，你让她的阴茎从你嘴里滑出，然后用舌头在她的阴道上滚动，喝着她的女性汁液。当你小心翼翼地帮她清理干净时，她最初的叫声变成了轻柔的呼噜声。");
            }
            else
            {
               outputText("决定听从她的建议，你潜入女孩湿透的阴道" + (hasBalls() ? "，轻轻地抚摸她的睾丸，在手中轻柔地滚动它们" : "") + "。你开始吃她，舔她的内部，挑逗她的阴蒂，同时你的另一只手给你的双性人猫咪情人打飞机。[pg]");
               outputText("你能感觉到你的手开始遇到一些阻力，你意识到她的结开始充血。趁着现在还有机会，你喝着她丰富的女性汁液，同时你的舌头探索着猫咪小穴的内壁，然后稍微加快了上面的速度。伴随着大量的喘息、一声喵叫，然后是一声狂喜的咆哮，猫娘把你的脸弄湿了，她的小穴更紧地包裹着你的舌头，她的精液从她的肉棒里飞出来，落在你的头发和背上。她的大腿颤抖着，把它们合拢在你的头上，无法让你离开。");
               if(cumQ() > 1500)
               {
                  outputText("当你感觉到她用她的种子浸湿你，把你涂成白色时，你忍不住在猫娘的小穴里咯咯地笑。");
               }
            }
         }
         else
         {
            outputText("看到她的一根肉棒在你的脸靠近时上下摆动和抽搐，你决定奖励这种渴望，并从它开始。你张开嘴唇，舔了舔龟头，然后慢慢地滑下她的冠状沟，然后更低，到阴茎干，再到根部。然后，你拉起你的嘴唇，一路上用你的舌头攻击她。她的" + cockType() + "肉棒伴随着一声响亮的吸溜声离开你的嘴，你迅速走向另一根。凯瑟琳抚摸着你的[hair]，非常温柔地帮助你顺着她的阴茎干向下滑动。[pg]");
            outputText("她的手实际上妨碍了你的计划；你瞪了她一眼，迅速告诉她让你用自己的方式来做。凯瑟琳歉意地喵了一声，你用双手抓住她勃起的肉棒，上下摩擦，然后把它们合在一起，用舌头舔着接触的龟头。");
            if(get_player().tongue.type == 1 || get_player().hasLongTongue())
            {
               outputText("你的舌头缠绕着一根勃起的肉棒，然后是另一根，用它长而灵活的长度轻轻地抚摸着。");
            }
            outputText("[pg]");
            outputText("接下来你从她勃起的肉棒向下移动，");
            if(hasBalls())
            {
               outputText("给她的蛋蛋一个挑逗的舔舐，然后把其中一个吸进嘴里。");
               if(get_player().tongue.type == 1 || get_player().hasLongTongue())
               {
                  outputText("你长而灵活的舌头再次滑出，当你轻轻地抬起她的睾丸时，轻松地浸入她湿润的小穴，并在你吸吮时抚摸她的内壁。");
               }
               outputText("你继续服侍她的蛋蛋，手指环绕着她紧绷的肉棒，缓慢地套弄着，然后将蛋蛋向上推，潜入她湿润的小穴中。");
               outputText("[pg]你的");
            }
            else
            {
               outputText("你的");
            }
            outputText("工作从轻柔地亲吻她的下唇开始，然后慢慢向上移动到她的阴蒂。凯瑟琳的大腿微微弯曲，双脚搁在你的肩膀上，怂恿你多关注她湿透的小穴。你顺从了她，舌头滑入她的体内，吸吮着她的阴蒂，同时缓慢地套弄着她的两根勃起。她的女性体液开始更加自由地流淌——你发现自己不仅听到了她轻柔的喘息和呻吟，还几乎被她的味道所淹没。[pg]");
            if(get_player().hasLongTongue())
            {
               outputText("你没有放过提供额外服务的机会；你用嘴唇吸吮她的阴蒂，同时你嘴里那根长长的、灵活的器官滑向" + (hasBalls() ? "她的蛋蛋，滚动着它们并袭击" : "") + "她其中一根勃起的根部，慢慢地缠绕着它。在用舌头紧紧抓住它之后，你滑向更远的地方，越过它，对她的另一根肉棒做同样的事情。然后，你慢慢地开始用湿润的肌肉抚摸这对犬科阴茎，让凯瑟琳在无法抗拒的快感中颤抖。与此同时，你继续吸吮她的阴蒂，你那巨大灵活的舌头也给了她的双茎一个梦幻般的套弄。[pg]");
            }
            outputText("慢慢地，你从她身边退开，欣赏着你的杰作。凯瑟琳的勃起正在大量渗出预先液，而她的小穴则浸湿了她的座位，大量的液体滴落在" + (hasBalls() ? "她的蛋蛋下方。她的大腿" : "她的大腿上。那些") + "正在微微颤抖，她的目光失去了焦点。[pg]");
            outputText("[say: 嗯……求你，继续。我快到了……][pg]");
            outputText("你将手指压在她的阴部，开始用手指抽插她，起初很轻柔，然后逐渐加快速度。接着，你弯下腰，再次吸吮着一根跳动的勃起，同时轻柔地抚摸她的肉棒，在两根之间交替。你将嘴唇从一根阴茎上移开，然后潜入另一根，不断深入，用喉咙肌肉按摩她的肉棒，同时舌头滑过她阴茎的背面。在深喉时，你突然感觉到有什么东西压在你的下巴上。你迅速退缩，以免结膨胀得失去控制。当你拔出时，它膨胀了，但速度变慢了，因为缺乏达到射精和最大尺寸的刺激。[pg]");
            outputText("她因为失去刺激而喘息和呜咽，双手几乎无法克制自己去抓住缰绳并限制你的努力。[say: 求……求你！我快到了！] 不忍心让她受苦，你决定完成工作，让你的小猫高潮。[pg]");
            if(!get_player().hasLongTongue())
            {
               outputText("你用双手握住她结上方的肉棒，开始套弄她，将它们都对准你的嘴，同时舔舐着顶端。当她开始喘息时，她的结膨胀到了最大尺寸。");
               if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 3)
               {
                  outputText("为了给她最大的刺激和完全的释放，你将尾巴尖滑入猫娘体内，感觉到她的小穴感激地挤压着它。");
               }
               outputText("[pg]");
               outputText("片刻之后，凯瑟琳终于射精了，射在你的脸上和嘴里。");
               if(cumQ() > 1500)
               {
                  outputText("量相当大，所以你不仅洗了个变态的澡，还喝了一杯不错的温饮。");
               }
            }
            else
            {
               outputText("你的舌头迅速滑出嘴外，蜿蜒地抽动着，凯瑟琳睁大了眼睛，看着它轻松地缠绕住她的两根勃起。你" + (hasBalls() ? "的手开始玩弄她的蛋蛋，而其他手指" : "开始用手指") + "抽插她滴水的小穴，当你感觉到她的结在你的舌头下膨胀得更大时，你进进出出地抽插着。[pg]");
               outputText("她的勃起齐声释放，浓稠的精液流覆盖了你的脸、舌头，甚至嘴巴内部。她的" + (hasBalls() ? "睾丸在你的手中抽动和跳动，而她的" : "") + "小穴紧紧抓住你的手指，用她的女性精液覆盖它们。");
               if(cumQ() > 1500)
               {
                  outputText("你们俩都被她的精液慷慨地覆盖着，当她射精时，你抚摸的舌头无法接住所有的精液。");
               }
            }
         }
         outputText("[pg]完事后，你直起腰，向猫娘眨了眨眼。凯瑟琳发出呼噜声，跳到你身边，拉着你接吻。[pg]");
         outputText("[say: 你太棒了！] 她惊呼道，仍然气喘吁吁。");
         if(get_player().hasLongTongue())
         {
            outputText("她的手指滑过你的嘴唇。[say: 我想我可能爱上了那个美丽洞穴里的怪物。][pg]");
         }
         else
         {
            outputText("[say: 我希望如果我有机会报答你的话，我也能做得像你一样好。][pg]");
         }
         outputText("她再次吻了你，双手在你的背上游走。你担心如果继续这样下去，你们可能马上又要来一发了；你用一个吻与这个双性猫人分开，" + (isAt(8) ? "你收拾好补给，准备返回特尔阿德雷。" : "你们分道扬镳。"));
         orgasm();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(4);
         get_player().slimeFeed();
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveKatDyeYellow() : void
      {
         giveKatDyeBegin("向日葵黄的");
         get_player().consumeItem(get_consumables().YELLODY);
         outputText("[pg]凯丝照了照镜子，用手指梳理着头发。[say: 说到信号色。有了这样的头发，我想再也不会有人忽视我了。]她咯咯地笑了一下，说道：[say: 真的很适合城市卫队的军官！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeWhite() : void
      {
         giveKatDyeBegin("雪白的");
         get_player().consumeItem(get_consumables().WHITEDY);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 当我还是只小猫的时候，我总是嫉妒那些毛色较浅的猫科动物。" + catGirl("现在我有了雪白的头发[if (nofur) {--t|，耳朵和尾巴上只有一点点黑色的毛发。他}]们才应该嫉妒我。在这沙漠的酷热中，我赢了！","我觉得这颜色很适合我，但这对比度也太强烈了。看着我的肩膀都快刺痛我的眼睛了，在阳光下肯定会更糟。现在没人会撞到我了。") + "][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeRusset() : void
      {
         giveKatDyeBegin("赤褐色的");
         get_player().consumeItem(get_consumables().RUSSDYE);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 随你怎么说，但我总觉得这种颜色带点犯罪的气息。]她咯咯地笑了一下，说道：[say: 我一直想自己试试，我觉得看起来棒极了！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeRed() : void
      {
         giveKatDyeBegin("火红色的");
         get_player().consumeItem(get_consumables().RED_DYE);
         outputText("[pg]凯丝看着镜子，开始摆姿势。[say: 我不知道你怎么想，但我现在可是兴致勃勃。大家都说红发女郎更有趣。也许是因为态度，也许是这染发剂里有什么东西。但谁在乎原因呢？我只打算证明他们是对的。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeRainbow() : void
      {
         giveKatDyeBegin("彩虹色的");
         get_player().consumeItem(get_consumables().RAINDYE);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 让我想起了一个关于控制天气的飞马的古老童话。需要花点时间适应这些颜色，但这绝对是一种独特的风格，让我脱颖而出。我喜欢它！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyePurple() : void
      {
         giveKatDyeBegin("深紫色的");
         get_player().consumeItem(get_consumables().PURPDYE);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 它没有我本来会选的颜色那么亮，但看起来确实不错。" + catGirl("我想这和我以前的[if (!nofur) {黑毛和}]亮粉色头发正好相反。[if (!nofur) {现在我有了深紫色的头发和浅色的皮肤}]","我的毛色太深了，紫色依然很显眼。没几个女孩能这么说") + "。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyePink() : void
      {
         giveKatDyeBegin("霓虹粉色的");
         get_player().consumeItem(get_consumables().PINKDYE);
         outputText("[pg]凯丝照了照镜子，用手指梳理着头发。[say: 回到经典老款。亮粉色没什么不好的。我以前总是穿它，这样人们就会以为我是个女孩，或者至少是个非常有女人味的扶她。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeOrange() : void
      {
         giveKatDyeBegin("亮橙色的");
         get_player().consumeItem(get_consumables().ORANGDY);
         outputText("[pg]凯丝照了照镜子，用手指梳理着头发。[say: 哇。又亮又好看。现在没人会认不出我了。这几乎和守卫队在门上标记危险不稳定房屋的颜色一样。]她咯咯地笑了笑，说：[say: 我一直想尝试橙色，我觉得它在我身上看起来棒极了！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeGreen() : void
      {
         giveKatDyeBegin("青柠绿色的");
         get_player().consumeItem(get_consumables().GREEN_D);
         outputText("[pg]凯丝照了照镜子，用手指梳理着头发。[say: 这真是独一无二！在整个特尔阿德雷，没有其他绿头发的猫" + catGirl("娘","") + "了，而且它和我的绿眼睛很配！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeGray() : void
      {
         giveKatDyeBegin("云灰色的");
         get_player().consumeItem(get_consumables().GRAYDYE);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 我本来怕它会有点太暗淡，让我看起来像个壁花……但我开始喜欢它了。和我的" + catGirl("皮肤","毛发") + "形成了很好的对比。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeEnd() : void
      {
         outputText("她转过身来抱住你。[say: 谢谢你，" + playerText() + "。它看起来有你期望的那么好吗？][pg]");
         outputText("你向她保证确实很好看，但你感觉凯丝更希望你能用更实际的身体行动来表达你的赞赏。");
         katSexMenu();
      }
      
      public function giveKatDyeBrown() : void
      {
         giveKatDyeBegin("栗棕色的");
         get_player().consumeItem(get_consumables().BROWN_D);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 嗯，虽然不那么显眼，但我觉得挺适合我的。和我的" + catGirl("皮肤","毛发") + "形成了很好的对比。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeBlue() : void
      {
         giveKatDyeBegin("亮蓝色的");
         get_player().consumeItem(get_consumables().BLUEDYE);
         outputText("[pg]凯丝照了照镜子，用手指梳理着头发。[say: 哇。又亮又好看。对于一个属于细蓝线一部分的警官来说，这真的很合适。]她咯咯地笑了笑，说：[say: 这是一个我一直想尝试的颜色，我觉得它看起来棒极了！][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeBlonde() : void
      {
         giveKatDyeBegin("浅金色的");
         get_player().consumeItem(get_consumables().BLOND_D);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 当我还是只小猫咪的时候，我总是嫉妒那些毛色较浅的猫科动物。" + catGirl("现在我有了[if (!nofur) {金色的头发，除了耳朵和尾巴上没有毛|那个，还有更多}]。现在该轮到她们嫉妒我了","我觉得这颜色很适合我，特别是和我的毛色形成了鲜明的对比") + "。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDyeBlack() : void
      {
         giveKatDyeBegin("乌黑色");
         get_player().consumeItem(get_consumables().BLACK_D);
         outputText("，与覆盖她身体其他部位的");
         if(get_furry() && !get_noFur())
         {
            outputText("皮毛相匹配。[pg]");
            outputText("凯丝照了照镜子，双手叉腰。反复梳理头发后，她说道：[say: 这就是我染发的原因。要让自己看起来和其他猫不一样太难了。][pg]");
            outputText("你走到她身后，双臂环抱住她的腰。");
            if(hasCock())
            {
               outputText("你抚摸她的大腿内侧，很快她的肉棒" + cockMultiple("就挺立","就都挺立") + "了起来。你在凯瑟琳耳边低语，说她身上还是有一些与众不同的地方的。[pg]");
               outputText("她把屁股贴着你磨蹭，发出呼噜声。[say: 在遇到你之前，我很难相信我巨大的肉棒和肉结是一种恩赐——而现在，我想再次感谢你改变了我的想法。]");
            }
            else
            {
               outputText("凯瑟琳向后倒进你的怀里，发出低沉而幸福的呼噜声说道：[say: 我太爱你了，" + playerText() + "。].");
            }
            katSexMenu();
         }
         else
         {
            outputText("在她的耳朵和尾巴上。[pg]");
            outputText("凯丝照了照镜子，用手指梳理着头发。[say: [if (!nofur) {如果我还是完全的猫形态，这会让我和城里其他的黑猫混在一起。现在|这对我来说绝对是个新造型，但}]它挺引人注目的。肌肤如雪，发如鸦羽……我能习惯这个。][pg]");
            giveKatDyeEnd();
         }
      }
      
      public function giveKatDyeBegin(param1:String) : void
      {
         clearOutput();
         outputText("你拿出那瓶染发剂递给凯瑟琳。[pg]");
         outputText("[say: 给我的？]她惊讶地问。凯丝从你手中接过小瓶子，仔细端详着。[say: 好吧——想知道效果如何，只有一个办法。][pg]");
         outputText("她冲到洗脸盆前，把头发冲洗了一遍，然后小心翼翼地涂上染发剂。在接下来的几分钟里，她" + get_hairColor() + "的头发逐渐变色，直到满头都变成了" + param1 + "的发丝。");
         set_hairColor(param1);
      }
      
      public function giveKatDyeAuburn() : void
      {
         giveKatDyeBegin("浓郁的红褐色");
         get_player().consumeItem(get_consumables().AUBURND);
         outputText("[pg]凯丝照了照镜子，试着用几种不同的方式梳理头发。[say: 虽然不是很显眼，但挺适合我的。和我的" + catGirl("皮肤","皮毛") + "形成了很好的对比。][pg]");
         giveKatDyeEnd();
      }
      
      public function giveKatDefurFormula() : void
      {
         clearOutput();
         outputText("你拿出材料，一件一件地放在凯瑟琳的床上。魅魔的乳汁、金色种子和黑蛋。凯丝饶有兴趣地看着，最后问道，[say: 这些都是干什么用的？][pg]");
         outputText("你解释说，把这些物质混合在一起，应该能改变她的体质，让她看起来更像人类。[pg]");
         if(submissiveness() < 3)
         {
            outputText("凯丝惊讶地张大了嘴，把手放在胸前。[say: 你想让我改变我的样子？" + playerText() + "，我知道你喜欢我现在的样子，不然你为什么总是回来找我？我爱你，我也从没要求你变成猫，虽然我听说人类能做到那种事。][pg]");
            outputText("她拿起那些东西，递还给你。[say: 不，我非常爱你，" + playerText() + "，但我觉得我还没准备好。如果我连他们的女儿都不是了，我永远也鼓不起勇气去见我的父母。][pg]");
            outputText("她拉起你的手，在她的脸和胡须上摩擦，把它们按在她的乳房上，然后放在她的臀部。[say: 你确定你不喜欢我这个样子吗？]");
            outputText("她确实犹豫了一秒……如果你能说服凯丝去做一些她不太确定的事情，她也许会愿意为你褪去皮毛。");
            katSexMenu();
            return;
         }
         if(doneSubmissive(256))
         {
            outputText("她抱住你，说道，[say: 嗯，我也是这么想的。猜你需要再尝尝家乡的味道，对吧？好吧，我上次确实很享受，所以为什么不呢？]");
         }
         else
         {
            outputText("凯丝惊讶地张大了嘴，把手放在胸前。[say: 你想让我改变我的样子？]你点了点头。[pg]");
            outputText("她问道，[say: 可是" + playerText() + "，我知道你喜欢我现在的样子，不然你为什么总是回来找我？]你告诉她，你确实很享受和她在一起的每一分钟，但这能让事情变得更好。[pg]");
            outputText("泪水在凯丝的眼角打转。[say: 我爱你，我也从没要求你变成猫，虽然我听说人类能做到那种事。]你问她，在特尔阿德雷她见过多少人类？每天你都能看到地精、小恶魔、蜜蜂、犬类、猫、半人马、马……名单还在继续。但你多久才能看到一次让你想起你的村庄和你来自的世界的东西？[pg]");
            outputText("凯丝擦去眼泪。[say: 我从没想过这些。好吧……我想我可以为你这么做。如果我开始让你想起家，那会让我觉得自己很特别。]");
            if(get_player().cor < 25)
            {
               outputText("现在轮到你擦眼泪了。你很高兴凯瑟琳愿意为你这么做。你知道你必须想办法补偿她。");
            }
            else if(get_player().cor < 75)
            {
               outputText("一方面，你有点担心这会对凯丝造成什么影响，无论是精神上还是身体上。另一方面，一想到你的小猫咪变成人类，你就兴奋不已。");
            }
            else
            {
               outputText("你努力掩饰自己有多兴奋。你要让这只可爱的小猫咪改变她的<b>本质</b>。她自己的家人都不会认出她，而这个愚蠢的婊子居然是为了“爱”才这么做的。\'.");
            }
         }
         outputText("[pg]你要了一个锉刀和某种容器。凯丝从厨房拿来一个锉刀和一个小水杯。你把蛋打进杯子里，然后倒入一些魅魔的乳汁。你拿起金色种子，刮下一些碎屑放进杯子里。最后，你摇晃杯子，直到碎屑溶解，混合物停止冒泡。[pg]");
         if(doneSubmissive(256))
         {
            outputText("凯丝脱下衣服，走到房间的角落，极其诱人地扭动着臀部。她坐在角落里，等你坐在她旁边。她从你手里接过杯子，像喝完一杯伏特加一样一饮而尽。[pg]");
         }
         else
         {
            outputText("与此同时，凯丝已经脱下了衣服。凯丝拿着杯子坐在床上。就在她准备喝一口之前，她停了下来。[say: 这东西会弄掉我的毛，对吧？]她站起来，走到房间一个空荡荡的角落。[say: 如果毛全掉下来，我永远也别想把它们从床单上弄干净。]她坐在地板上，像喝完一杯伏特加一样把水杯一饮而尽。[pg]");
            outputText("你在她身边坐下，等待着变化的发生。[pg]");
         }
         outputText("没过多久，凯丝就开始互相摩擦手掌。她浑身一颤，爪子重新变形，指头变长，很快她就拥有了几乎完全像人类的手。[pg]");
         outputText("凯丝还在盯着她新长出的人类指甲看，这时她手上的毛发开始脱落，接着是手臂、躯干和腿。她拍了拍身上的毛，你可以看到除了耳朵、尾巴和腹股沟外，她身上的毛发都消失了。她头上的" + get_hairColor() + "头发也没有受到药剂的影响。[pg]");
         outputText("[say: 感觉好奇怪，]她小声说道。她的身体现在不再覆盖着毛发，而是覆盖着乳白色的肌肤。当她盯着自己的手臂时，另一个变化开始了。[say: 啊，]凯瑟琳说着，她的鼻子像兔子一样抽动着。它扭曲着，仿佛被某个看不见的雕塑家操纵着。当它终于停止抽动时，凯丝有了一个人类的鼻子，下面是一张人类的嘴——只有那小小的尖牙暗示着它曾经的不同。[pg]");
         outputText("一旦确信变化已经结束，凯丝小心翼翼地站起来，拍掉身上最后几团散落的毛发。她像失了魂一样走到镜子前，开始端详自己。");
         if(doneSubmissive(256))
         {
            outputText("[say: 尽管我以前也经历过这种事，但我还是很难理解每一个小细节的感觉有多么不同，]她说着，手指滑过她赤裸的乳房，顺着肚子滑下。[pg]");
            outputText("她跳过地板，扑进你的怀里。[say: 好吧，" + playerText() + "，我希望你喜欢另一种家乡的味道。我希望你想和我一次又一次地做爱，因为我的身体可能看起来像人类，但我的性欲完全是猫科动物的。][pg]");
         }
         else
         {
            outputText("[say: 变化真大，]她说着，在原地扭动着身体，摸了摸她仍然毛茸茸的耳朵，[say: 但大部分还是和以前一样。][pg]");
            outputText("当然，凯瑟琳毕竟是凯瑟琳，她很快就把手滑过她新裸露的乳房。[say: 哦，我们要进行很多实验了，" + playerText() + "。一切感觉都那么不同！甚至……]她在空中挥舞着手，[say: 甚至现在的空气感觉都不一样了。][pg]");
            outputText("她给了你一个大大的拥抱，说道：[say: 明天上班我得好好解释一下了。我还得习惯现在穿衣服的感觉。]她的手顺着你的背滑下，直到能捏住你的屁股，然后说道：[say: 但现在我<b>真的</b>想知道另一种感觉。][pg]");
         }
         set_furry(false);
         addSubmissive(256);
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().P_S_MLK);
         get_player().consumeItem(get_consumables().GLDSEED);
         if(get_player().hasItem(get_consumables().BLACKEG))
         {
            get_player().consumeItem(get_consumables().BLACKEG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_BLKEG);
         }
         katSexMenu();
      }
      
      public function giveKatClothesTubeTop() : void
      {
         clearOutput();
         outputText("你让凯丝站在镜子前，告诉她闭上眼睛。当她闭上眼睛时，你拿出抹胸和配套的紧身短裤，把它们按在她身上。[pg]");
         outputText("凯丝接过紧身的抹胸，把它拉伸开，包住她" + get_breasts().adj() + "的乳房。[say: 我在附近的一些商店里见过这样的衣服。谢谢你，" + playerText() + "，我相信我穿上会很好看的。][pg]");
         outputText("然后她拿起紧身有弹性的短裤，把它们举在臀部前面。");
         if(!hasCock())
         {
            outputText("[say: 这些太紧了！它们让我想起了女孩们去健身房穿的紧身裤。][pg]");
         }
         else if(canWearMiniSkirt())
         {
            outputText("[say: 这些太紧了！我想我能把我的肉棒" + cockMultiple("","") + (hasBalls() ? "和蛋蛋" : "") + "塞进去，但这会很勉强。如果我再长大一点，为了舒服，我就不得不开始穿裙子了。][pg]");
         }
         else
         {
            outputText("[say: 这也太紧了！我根本没法把我的肉棒" + cockMultiple("","s") + (hasBalls() ? "和蛋蛋" : "") + "塞进去。只要闻到一点胡须果的味道，我的肉棒" + cockMultiple("","s") + "就会直接弹出来。]她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 2 ? "指了指她现在穿着的及膝裙和衬衫。" : "走到衣柜前，拿出了她平时搭配衬衫穿的及膝裙。") + "[say: 我想我会搭配这个穿。它们看起来甚至很搭。][pg]");
         }
         outputText("她脱下她的");
         if(canWearMiniSkirt())
         {
            outputText("衣服，然后依次费力地穿上抹胸和紧身短裤。她甚至得在地上打滚，才能把短裤硬拉过大腿最后那几英寸。接着她跳起来，开始在镜子前摆姿势，她" + get_breasts().adj() + "的乳房在弹性紧身的布料下展露无遗，而她" + (hasCock() ? "男性化的特征" : "的小穴") + "也被贴身的短裤勾勒出轮廓。");
         }
         else
         {
            outputText((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 2 ? "衬衫" : "衣服，迅速套上及膝裙") + "，然后费力地穿上抹胸。当终于穿好后，她开始在镜子前摆姿势，她" + get_breasts().adj() + "的乳房在弹性紧身的布料下展露无遗。");
         }
         outputText("[pg]你走到她身后，抚摸她裸露" + (pregSize() > 4 ? "且隆起" : "") + "的腰腹。凯丝的尾巴开始舞动，她向后靠在你身上，发出呼噜声。[say: 噢，" + playerText() + "，我才刚穿上你给我的这套可爱衣服。你这么快就想让我脱下来吗？][pg]");
         giveClothing(32);
         get_player().consumeItem(get_armors().TUBETOP);
         katSexMenu();
      }
      
      public function giveKatClothesSilkRobe() : void
      {
         clearOutput();
         outputText("你让凯丝站在镜子前，让她闭上眼睛。当她闭上眼时，你拿出蜘蛛丝长袍，在她的身上比划。它太柔软轻盈了，以至于你最后不得不叫她睁开眼睛。[pg]");
         outputText("她呆呆地看着长袍，轻轻地接过它，手指滑过精美的丝绸和绣着的符文。她低语道：[say: 你从哪弄来的？我从来没见过这样的东西。][pg]");
         outputText("你解释说沼泽里的蜘蛛能产出一种极其坚韧的丝，这批丝经过处理后织成了这些长袍。她试了试布料，发现了它惊人的强度。[say: 它太薄了，看起来好像一扯就会碎。]她稍微用力扯了扯。[say: 如果这全是蜘蛛丝，我猜连牛头怪都撕不破它。][pg]");
         outputText("她问起符文的事，你告诉她这件长袍是为了某种程度上提升施法能力，虽然你不确定它是怎么做到的。[say: 我不是巫师，]她说，[say: 如果我有任何天赋，他们早就试着招募我去塔里了。让我穿这个简直是暴殄天物。][pg]");
         outputText("你还是说服她穿上了。她脱下衣服，套上长袍。[say: 太光滑了！感觉就像风拂过我的" + catGirl("皮肤","皮毛") + "。这让我觉得我好像完全赤裸着。][pg]");
         outputText("凯瑟琳摆出一个威严的姿势，看着镜子里的自己，然后她似乎有些泄气。她非常害羞地说：[say: 我不知道我应不应该穿着这个在镇上走。它看起来太特别了。]");
         giveClothing(16);
         get_player().consumeItem(get_armors().SS_ROBE);
         menu();
         addButton(0,"穿上它",giveKatClothesRobeWear);
         addButton(1,"不穿",giveKatClothesRobeDontWear);
         if(submissiveness() >= 2)
         {
            addButton(2,"总是穿",giveKatClothesRobeAlways);
         }
         else
         {
            addButtonDisabled(2,"一直穿");
         }
      }
      
      public function giveKatClothesRobeWear() : void
      {
         clearOutput();
         outputText("你告诉凯瑟琳她也很特别。这些长袍让她看起来有点异国情调，但如果没有她那曼妙的身躯在里面，它们也不过是地上的一团软布。知道她能隔着长袍感觉到你做的一切，你紧紧抱住她，双手开始顺着她的脊椎向下滑动。[pg]");
         outputText("当你摸到凯丝的屁股时，她发出了非常愉悦的呼噜声。你双手揉搓着她尾巴的根部，");
         if(hasCock())
         {
            outputText("她的肉棒" + cockMultiple("开始","开始") + "抵住" + (get_player().hasTailInsteadOfLegs() ? "你尾巴的前面" : "你的大腿内侧"));
         }
         else
         {
            outputText("她开始将胯部贴在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴前面" : "你的腿上"));
         }
         outputText("。等她充分发情后，你告诉她应该穿着这身衣服在镇上转转，习惯它们，并让特尔阿德雷的居民欣赏她提供的美景。[pg]");
         outputText("凯丝给了你一个快速的吻，说道：[say: 你赢了，" + playerText() + "，一如既往。但我知道这些长袍确实非常特别。我无法报答你为我做的一切，只能每天越来越爱你。] 她突然跳起来，双腿盘在你的腰间。她把你的头按在她的乳房上，补充道：[say: 既然如此……][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,16);
         katSexMenu();
      }
      
      public function giveKatClothesRobeDontWear() : void
      {
         clearOutput();
         outputText("既然这件长袍有点异国情调，也许她应该少穿。凯丝似乎很高兴事情就这么定了，在你提出任何附加条件之前，她就凑近了你。[pg]");
         outputText("毫无预兆地，她跳了起来，双腿盘在你的腰间。她的双手将你的头按在她的乳房上。知道她能隔着长袍感觉到你做的一切，你开始将手顺着她的脊椎向下滑动。当你摸到她的屁股时，凯丝发出了一声非常满足的呼噜声。你用双手揉捏着她尾巴的根部，并且");
         if(hasCock())
         {
            outputText("她的肉棒" + cockMultiple("开始","开始") + "抵住" + (get_player().hasTailInsteadOfLegs() ? "你尾巴的前面" : "你的大腿内侧"));
         }
         else
         {
            outputText("她开始将胯部贴在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴前面" : "你的腿上"));
         }
         outputText("。");
         outputText("[pg]凯丝给了你一个快速的吻，说道：[say: 我无法报答你为我做的一切，只能每天越来越爱你。既然如此……][pg]");
         katSexMenu();
      }
      
      public function giveKatClothesRobeAlways() : void
      {
         clearOutput();
         outputText("你告诉凯瑟琳她也很特别。这些长袍让她看起来有点异国情调，但如果没有她那曼妙的身躯在里面，它们也不过是地上的一团软布。知道她能隔着长袍感觉到你做的一切，你紧紧抱住她，双手开始顺着她的脊椎向下滑动。[pg]");
         outputText("当你摸到凯丝的屁股时，她发出了非常愉悦的呼噜声。你双手揉搓着她尾巴的根部，");
         if(hasCock())
         {
            outputText("她的肉棒" + cockMultiple("开始","开始") + "抵住" + (get_player().hasTailInsteadOfLegs() ? "你尾巴的前面" : "你的大腿内侧"));
         }
         else
         {
            outputText("她开始将胯部贴在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴前面" : "你的腿上"));
         }
         outputText("。等她充分发情后，你告诉她应该穿着这身衣服在镇上转转，习惯它们，并让特尔阿德雷的居民欣赏她提供的美景。[pg]");
         outputText("凯丝继续像电锯一样打着呼噜，你决定得寸进尺。你告诉她，既然丝绸是在炎热沙漠中最好的穿着之一，她就没有理由<b>不</b>穿这件长袍。事实上，你希望她一直穿着它。她试图争辩，但你把手指按在她的嘴唇上，让她答应。[pg]");
         outputText("凯丝给了你一个快速的吻，说道：[say: 你赢了，" + playerText() + "，一如既往。但我知道这些长袍确实非常特别。我无法报答你为我做的一切，只能每天越来越爱你。] 她突然跳起来，双腿盘在你的腰间。她把你的头按在她的乳房上，补充道：[say: 既然如此……][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-16);
         katSexMenu();
      }
      
      public function giveKatClothesNurseOutfit() : void
      {
         clearOutput();
         outputText("你让凯丝站在镜子前，让她闭上眼睛。当她闭上眼睛时，你拿出那三件暴露的护士装，把它们贴在她身上。[pg]");
         outputText("凯瑟琳依次拿起这三件衣服，仔细端详着。[say: 这真是，太火辣了。哦，当然，它遮住了所有该遮的地方；我不会惹上什么麻烦的……但是，哇哦。]她把那件白色的小上衣贴在她的" + get_breasts().cup() + "上，对你露出了灿烂的笑容。");
         if(get_breasts().get_cupSize() < 3)
         {
            outputText("[say: 这件上衣会让我的小胸部看起来更大，就因为它的布料太少了。]");
         }
         else if(get_breasts().get_cupSize() < 6)
         {
            outputText("[say: 这件上衣真的能展示我的双峰。每个人都会盯着看的。]");
         }
         else
         {
            outputText("[say: 我不知道这些扣子能不能撑得住。我这巨大的乳肉可不是这件小小的上衣能支撑得住的。]");
         }
         outputText("[pg]接着，她把那顶白色的小帽子戴在头上，帽子依偎在她黑色的毛茸茸的耳朵之间。[say: 我不知道为什么，]她一边在镜子前打量自己一边说，[say: 但这顶小帽子让我产生各种下流的想法。][pg]");
         outputText("最后，她拿起了那条短得离谱的白色迷你裙。");
         if(canWearMiniSkirt())
         {
            outputText("[say: 这可有点棘手。看起来它<b>勉强</b>能穿上。我坐下的时候可得非常小心才行。][pg]");
         }
         else
         {
            outputText("[say: 抱歉，" + playerText() + "，但这实在没办法。我软着的时候它都遮不住我。我想我还是穿我原来的裙子配这个吧。不然我每走一步都会走光。][pg]");
         }
         outputText("凯瑟琳脱下她的");
         if(canWearMiniSkirt())
         {
            outputText("衣服，然后一件件穿上这套暴露的护士服");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222) == 2)
         {
            outputText("衬衫，穿上暴露的上衣和迷你帽");
         }
         else
         {
            outputText("衣服，从衣柜里拿出她的裙子，然后穿上新衣服的所有部件");
         }
         outputText("。当她穿好后，一个充满诱惑的尤物站在了你面前。[pg]");
         outputText("她向你走来，臀部左右摇摆。[say: 我知道这很暴露，很轻浮，甚至可能完全像个荡妇，但我喜欢它看起来的样子。" + catGirl("露出这么多皮肤走来走去感觉很好","我真的很喜欢这套衣服的白色和我黑色皮毛的对比") + "。]她双臂环住你的腰，你感觉到裙下散发出巨大的热量。[say: 嗯，你对我太好了，" + playerText() + "。让我向你展示我有多感激你……][pg]");
         giveClothing(64);
         get_player().consumeItem(get_armors().NURSECL);
         katSexMenu();
      }
      
      public function giveKatClothesLongDress() : void
      {
         clearOutput();
         outputText("你让凯丝站在镜子前，告诉她闭上眼睛。当她闭上眼时，你拿出那件优雅的舞会礼服，将它贴在她身上。[pg]");
         outputText("凯丝过了好一会儿才找回自己的声音。当她开口时，她紧紧地抱住你，说道：[say: 太美了！]她的眼里闪烁着泪光，开始抽泣起来。[say: 我穿上这件衣服看起来会像个公主，]她说着，慢慢抚摸着及地的裙摆。[say: 哦，你不能在我身上花这么多钱，" + playerText() + "——你已经给了我全新的生活！我才是那个应该送你礼物的人。][pg]");
         outputText("你笑着告诉她，她一直都在送你礼物，你只是提供了一种新的包装。她咧嘴一笑，说道：[say: 噢，" + playerText() + "，你对我太好了。]考虑到裙子上那么多扣子要扣好需要多长时间，她脱下衣服又重新穿上的速度相当快。[pg]");
         outputText("[say: 我从来没去过什么大型派对，但现在我有了完美的礼服。我想我之前说错了，公主们都会嫉妒我的，]她一边说着，一边在镜子前左右旋转，看着长长的裙摆飘动。[say: 它太完美了——真的。" + (hasCock() ? " 我敢打赌，就算我在这件礼服下硬得像石头，也没人能看出我是个扶她。" : "") + "][pg]");
         outputText("她又转了几圈，然后抓住你的手臂，带着你跳起了一支无声的舞。[say: " + (hasCock() ? "我完全是个女人，但穿上这件衣服，我才真正感觉到了" : "穿上这件衣服，我觉得自己完全是个女人，就像我小时候被孩子们欺负时一直渴望的那样") + "。]你不知道她带着你跳的是什么慢舞，但这似乎并不重要。凯丝终于从幻想中回过神来，说道：[say: 这件衣服太特别了；我不想它有任何闪失。也许我应该只在特殊场合才穿它。]");
         giveClothing(8);
         get_player().consumeItem(get_armors().B_DRESS);
         menu();
         addButton(0,"穿上它",giveKatClothesDressWearIt);
         addButton(1,"同意",giveKatClothesDressAgree);
         if(submissiveness() >= 2)
         {
            addButton(2,"一直穿",giveKatClothesDressAlways);
         }
         else
         {
            addButtonDisabled(2,"一直穿");
         }
      }
      
      public function giveKatClothesDressWearIt() : void
      {
         clearOutput();
         outputText("你把手放在凯丝的肩膀上，告诉她你买这件衣服是为了让她享受，而不是让它整天挂在衣柜里。她觉得这件衣服让她看起来很棒，你再同意不过了。她应该想穿就穿，向特尔阿德雷的人们展示一下什么叫有品位的猫。[pg]");
         outputText("凯丝听到你的赞美，喜笑颜开地说：[say: 既然你都这么说了，那我就不争了。现在该我开始感谢你了。要花上几个月的时间，我才能让你感受到这对我有多重要，但现在就让我们开始吧。我要坐在床上，你可以选择任何你喜欢的方式来拆开你的礼物。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,8);
         katSexMenu();
      }
      
      public function giveKatClothesDressAlways() : void
      {
         clearOutput();
         outputText("你把手放在凯丝的肩膀上，告诉她你买这件衣服是为了让你们俩都能享受，而不是让它整天挂在衣柜里。她觉得这件衣服让她看起来很棒，你再同意不过了。事实上，她应该一直穿着它，向特尔阿德雷的人们展示一下什么叫有品位的猫。[pg]");
         outputText("凯丝微笑着问：[say: 你坚持吗？]你把手伸得更高一点，把玩着她的耳朵。" + (hasCock() ? "你看不见，但你知道在礼服下她的肉棒正在变硬。" : "") + "[say: 哦，是的，]她说着，倒在你的怀里，[say: 既然你都这么说了，那我就不争了。我保证我每天都会穿它。现在该我开始感谢你了。要花上几个月的时间，我才能让你感受到这对我有多重要，但现在就让我们开始吧。我要坐在床上，你可以选择任何你喜欢的方式来拆开你的礼物。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-8);
         katSexMenu();
      }
      
      public function giveKatClothesDressAgree() : void
      {
         clearOutput();
         outputText("凯丝说的可能没错。这太可惜了，因为她穿上它看起来棒极了。你告诉她，如果她现在太担心把它弄坏，那也没关系，但你希望她偶尔能决定穿上它，向邻居们炫耀一下。[pg]");
         outputText("凯丝依偎在你的胸前说：[say: 听起来不错。现在该我开始感谢你了。要花上几个月的时间，我才能让你感受到这对我有多重要，但现在就让我们开始吧。我要坐在床上，你可以选择任何你喜欢的方式来拆开你的礼物。][pg]");
         katSexMenu();
      }
      
      public function giveKatClothesBodysuitYes() : void
      {
         clearOutput();
         outputText("你告诉她这正是你想要的。她拥有不可思议的身材，应该学会稍微炫耀一下。她在市场上弯腰检查农产品的景象会让人们开心一整天。对于像她这样可爱的女孩来说，穿透明紧身衣简直就是造福大众。[pg]");
         outputText("凯丝满足地叹了口气，说道：[say: " + (playerMaster() ? "好的，[master]" : "好吧，" + get_player().get_short()) + "，如果你喜欢这样，那就准备好经常看我穿这身吧。现在，如果你不介意的话，我想我应该再把衣服脱掉，因为我觉得接下来会弄得一团糟。毕竟我还需要好好感谢你送的这份绝妙礼物呢。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,4);
         katSexMenu();
      }
      
      public function giveKatClothesBodysuitNo() : void
      {
         clearOutput();
         outputText("你考虑了一下，但告诉凯丝，至少现在你希望这件紧身衣能作为她在特殊场合穿的衣服，只有当她想感受不同时才偶尔穿上。凯丝点点头，你感觉她对私下穿紧身衣的想法更自在一些。[pg]");
         outputText("[say: 现在，]她说道，仿佛到了该办正事的时候，[say: 我还没好好感谢你送的这份绝妙礼物呢。]");
         katSexMenu();
      }
      
      public function giveKatClothesBodysuitAlways() : void
      {
         clearOutput();
         outputText("你轻咬凯丝的耳朵，让她在你怀里扭动起来。你告诉她，她穿这件紧身衣看起来棒极了。事实上，你会说这件衣服很“贴身”。她呻吟了一声，但你不确定这是因为你的双关语，还是因为你已经开始隔着布料揉搓她的乳头。[pg]");
         outputText("你告诉她，她拥有不可思议的身材，应该学会稍微炫耀一下。她在市场上弯腰检查农产品的景象会让人们开心一整天。对于像她这样可爱的女孩来说，穿透明紧身衣简直就是造福大众。[pg]");
         outputText("当你抚摸她的乳房时，你补充说，当你在外面与怪物战斗时，你想<b>知道</b>她挺拔的乳房、紧致的臀部和她那令人愉悦的");
         if(hasCock())
         {
            outputText("肉棒" + cockMultiple("","s"));
         }
         else
         {
            outputText("小穴");
         }
         outputText("都在展示着。无论何时她不在执勤，你都希望她无论走到哪里都能骄傲地展现自己的魅力。[pg]");
         outputText("凯丝在你怀里变得瘫软，说道：[say: 是的！我愿意为你做这一切，" + playerText() + "。但现在我还是得感谢你。这件紧身衣紧贴着" + catGirl("我的皮肤","我") + "的感觉太棒了，但当你紧贴着我时，感觉还要更好。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1221,-4);
         katSexMenu();
      }
      
      public function giveKatClothesBodysuit() : void
      {
         clearOutput();
         outputText("你让凯丝站在镜子前，让她闭上眼睛。当她照做时，你拿出紧身衣，把它压在她身上。[pg]");
         outputText("凯丝猛地睁开眼睛，用手指感受着轻薄透明的布料。[say: 哦" + playerText() + "，这太好了。] 她咬着嘴唇，在镜子里打量着自己。她仍然完全不知所措，再次开口。[say: 我已经知道你有多爱我了" + playerText() + "，你不需要用这么可爱的礼物来留住我——我已经是你的了。这一定很贵吧！][pg]");
         outputText("你走到她身边，搂住她的腰。当你抚摸她的侧腰时，你告诉她这件紧身衣既是给她的礼物，也是给你的礼物。你很期待看到它被她健美的身体填满。" + catGirl("凯丝羞得满脸通红，然后","你感觉到她皮毛下泛起红晕，然后凯丝") + "继续打量自己。[pg]");
         outputText("为了让她开始，你" + clothesLowerChoice("把手指伸进她裤子的腰带里","把手指伸进她裙子的腰带里","","轻轻拉扯她裙子的肩带","用手指沿着她长袍的低领口划过") + "。凯丝心领神会，开始急切地脱衣服。她滑进紧身衣，紧身衣上有一个方便她尾巴穿过的小洞。当她回头看镜子时，她倒吸了一口气。[say: 哦……哇，我知道这会有点透明，但你几乎能看到一切！][pg]");
         outputText("你当然知道这件紧身衣有多薄。你的手滑过透明的布料，隔着衣服描摹着她的曲线。");
         if(hasCock())
         {
            outputText("她的双腿之间开始形成一个凸起。");
         }
         outputText("布料阻止了你真正看到凯瑟琳的");
         if(hasCock())
         {
            outputText("肉棒" + cockMultiple("","") + (get_ballSize() > 3 ? "或" + ballAdj() + "蛋蛋" : ""));
         }
         else
         {
            outputText("阴唇");
         }
         outputText("但它绷得太紧了，勾勒出了每一个细节" + (hasCock() ? "" : "，让她有了一个非常明显的骆驼趾") + "。[pg]");
         if(hasCock())
         {
            outputText("被困在她的身体上，凸起越来越高，" + (pregSize() > 5 ? "顶端爬上了她怀孕肚子的曲线" : "上升的顶端" + cockMultiple("","") + "越来越靠近她的乳房") + "。");
         }
         outputText("你告诉凯丝这套衣服看起来真的很棒，你很期待看到她穿着它在镇上游行。[pg]");
         outputText("她的尾巴来回摆动，凯丝沉浸在你双手按摩她身体的感觉中。她的乳头顶起了轻薄的布料，你意识到你甚至可能让她穿着这身衣服高潮。[pg]");
         outputText("[say: 你真的想让我穿成这样在镇上走来走去吗？]她喘息着说。[say: 所有人都会" + (hasCock() ? "知道我是个扶她" : "把一切都看光") + "的。]");
         giveClothing(4);
         get_player().consumeItem(get_armors().T_BSUIT);
         menu();
         addButton(0,"是",giveKatClothesBodysuitYes);
         addButton(1,"否",giveKatClothesBodysuitNo);
         if(submissiveness() >= 2)
         {
            addButton(2,"总是",giveKatClothesBodysuitAlways);
         }
         else
         {
            addButtonDisabled(2,"总是");
         }
      }
      
      public function giveKatAOverlyLargePepper() : void
      {
         clearOutput();
         var _loc1_:Boolean = submissiveness() >= 4 || submissiveness() >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0;
         if(!hasCock())
         {
            outputText("你在凯瑟琳的鼻子前晃了晃一根硕大犬椒，她贪婪地吸入那辛辣的气味。[pg]");
            outputText("[say: 我很确定那对我不会有任何效果，]她说道。[say: 但它们味道确实不错，只要你不介意……]她微笑着接过辣椒，大口吃了起来。伴随着一声呻吟，她" + clothesLowerChoice("把手伸进短裤","撩起裙子","拉开紧身衣","撩起裙子","拉开长袍") + "，开始揉搓自己的阴蒂。[pg]");
            outputText("[say: 哦，求你了，" + playerText() + "，别让我一个人独自承受这种感觉。]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().LARGEPP);
            katSexMenu();
         }
         else if(get_cockLength() < 16)
         {
            outputText("你举起物品栏里的硕大犬椒，问凯瑟琳是不是真的想让她的鸡巴变大。[pg]");
            outputText("[say: 是的！拜托了！]她说道，显然很兴奋。她从你手中一把抢过辣椒，吧唧吧唧地狼吞虎咽起来，舔了舔手指，然后兴奋地拉下裤子。她的鸡巴立刻从包皮里挺了出来，长到了原来的最大尺寸，然后又长了整整两英寸才停下来。");
            if(!hasDogCock())
            {
               if(get_cockNumber() > 1)
               {
                  outputText("与此同时，它们向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一对" + cockAdj() + "狗鸡巴。");
               }
               else
               {
                  outputText("与此同时，它向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一根" + cockAdj() + "狗鸡巴。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("她轻声呻吟，舔了舔嘴唇，对你微笑着。[say: 想不想试运行一下？让这个机会白白浪费掉就太可惜了……]她像猫一样发出呼噜声。[pg]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            set_cockLength(get_cockLength() + 2);
            if(get_cockLength() > 16)
            {
               set_cockLength(16);
            }
            get_player().consumeItem(get_consumables().LARGEPP);
            katSexMenu();
         }
         else if(get_cockLength() < 20 && _loc1_)
         {
            outputText("她渴望地看着辣椒，然后明显地克制住了自己。[say: 对不起……我真的很想吃，但我必须现实一点，]她说。[pg]");
            outputText("你走上前，将一根手指放在她的嘴唇上让她安静下来。你的手指顺着她的身体滑下，慢慢地在她的双乳之间和肚脐上划过，直到到达" + cockMultiple("她肉棒的根部。稍微轻柔地摩擦，她的肉棒就开始","她两根肉棒根部之间的小凹陷处。稍微轻柔地摩擦，她的肉棒就开始") + "勃起，引得你的爱人发出愉悦的呻吟。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0)
            {
               outputText("你问凯瑟琳，她觉得你爱乌尔塔吗。[pg]");
               outputText("她在你的手指下扭动着，回答说：[say: 是的，当然。但我不需要变得像乌尔塔那么大。][pg]");
               outputText("你继续摩擦，慢慢地把凯丝往后推，直到她靠在墙上。你告诉她，乌尔塔在守卫队里需要一个朋友，一个真正理解带着这么巨大的……负担是什么感觉的人。[pg]");
               outputText("凯丝的尾巴在墙上甩动着。她张开嘴想说些什么，你空着的手将辣椒塞进了她的嘴唇之间。她僵住了，你提醒她这会有多好吃，当她的" + cockMultiple("肉棒变得","肉棒变得") + "更大时，感觉会有多棒。[pg]");
            }
            else
            {
               outputText("你告诉凯瑟琳，到目前为止你都是对的。肉棒每增加一英寸，她就变得更性感。你喜欢她试图把巨大的肉棒" + cockMultiple("","") + "藏起来时，脸上那种可爱又尴尬的表情。[pg]");
               outputText("她在你的手指下扭动着，终于说道：[say: 我想我可以做到……我会为你做的。][pg]");
               outputText("你继续摩擦，慢慢地把凯丝往后推，直到她靠在墙上。你告诉她，你希望她为<b>她自己</b>做这件事。你希望她看看" + cockMultiple("一根巨大的肉棒","一对巨大的肉棒") + "能带来多少乐趣。然后你把辣椒按在她的嘴唇上，直到她张开嘴，让你把它在她的舌头上摩擦。[pg]");
            }
            outputText("她凝视着你的眼睛，你说：[say: 我爱你。][pg]");
            outputText("凯丝咬碎了辣椒，从你手指间抽出来狼吞虎咽地吃了下去。在她的衣服下面，你看到" + cockMultiple("隆起","两个隆起") + "正在膨胀。当她的生殖器在内裤里像气球一样胀大时，凯丝给了你一个痛苦的微笑。[pg]");
            outputText("变形完成后，凯丝迅速脱下衣服，以便更好地看看她的新肉棒" + cockMultiple("。它","。它们") + "确实变大了，长度足足增加了两英寸。");
            if(!hasDogCock())
            {
               outputText("辣椒的效果也让" + cockMultiple("它","它们") + "变回了犬科动物的肉棒。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("凯丝微笑着，用一只手抚摸着" + cockMultiple("她的","每一根") + cockAdj() + "肉棒" + cockMultiple("，同时用另一只手捋直她的尾巴","") + "。[pg]");
            outputText("[say: 我本来不确定我是否想要这个，但感觉很好。你喜欢吗？]她问道，" + cockMultiple("把她的肉棒","把她的两根肉棒都") + "指向你。[say: 也许你可以向我展示一下你有多喜欢，嗯？让这个机会白白浪费掉就太可惜了……]她像猫一样发出呼噜声。[pg]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            addSubmissive(128);
            set_cockLength(get_cockLength() + 2);
            if(get_cockLength() > 20)
            {
               set_cockLength(20);
            }
            get_player().consumeItem(get_consumables().LARGEPP);
            katSexMenu();
         }
         else if(_loc1_)
         {
            outputText("她看了看辣椒，然后低头看了看自己已经巨大的胯下。[say: 求你了，" + playerText() + "，]她哭喊着跪了下来。[say: 我不能再变大了。我知道你希望我拥有" + cockMultiple("一根巨大的肉棒","一对巨大的肉棒") + "，但我已经这么大了。我伸展身体的时候必须小心——否则我会向前摔倒在地上。如果我闻到胡须果或发情期女人的味道，我就会感到头晕！我已经为了你长得和" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1234) > 0 ? "乌尔塔" : "大多数半人马") + "一样大了，" + playerText() + "，求你别让我再长了。][pg]");
            outputText("她用双臂抱住你的腿，补充道：[say: 我知道我能满足你。让我展示给你看。]");
            katSexMenu();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4)
         {
            outputText("她渴望地看着辣椒，然后明显地克制住了自己。[say: 对不起……我真的很想吃，但我必须现实一点。我已经快一英尺半长了！妈妈可没把我养成一个尺寸控，而且我已经快和" + (get_urtaDisabled() ? "半人马" : "乌尔塔") + "一样长了。我的意思是，我喜欢" + (get_urtaDisabled() ? "半人马" : "乌尔塔") + "，我只是觉得我不需要那么大的肉棒，]她说。[pg]");
            outputText("[say: 很高兴知道你在为我着想，]她补充道，迅速试图讨好你。");
            if(get_game().urta.urtaFuckbuddy())
            {
               outputText("她确实犹豫了一秒钟……如果你能说服凯丝去做一些她不太确定的事情，她也许会愿意再吃一个犬椒。");
            }
            katherineMenu();
         }
         else
         {
            outputText("她渴望地看着辣椒，然后明显地克制住了自己。[say: 抱歉……我真的很想吃，但我必须现实一点。我已经快一英尺半长了！我妈妈可没把我养成一个尺寸控，如果我再长长一点，我就会像那个可怜的卫兵队长一样——因为找不到能容纳我肉棒的人而找不到约会对象，]她双手交叉在胸前，坚定地说道。[pg]");
            outputText("[say: 不过，如果你还有什么想给我的东西，我相信我们还能挽回局面。否则，谢谢你想到我，]她补充道，试图迅速与你和好。");
            katherineMenu();
         }
      }
      
      public function giveKatAKnottyPepper() : void
      {
         clearOutput();
         outputText("你向凯丝展示了打结的犬椒，问她是否能勾起什么回忆。[pg]");
         if(!hasCock())
         {
            outputText("[say: 我很确定那对我不会有任何效果，]她说道。[say: 但它们味道确实不错，只要你不介意……]她微笑着接过辣椒，大口吃了起来。伴随着一声呻吟，她" + clothesLowerChoice("把手伸进短裤","撩起裙子","拉开紧身衣","撩起裙子","拉开长袍") + "，开始揉搓自己的阴蒂。[pg]");
            outputText("[say: 哦，求你了，" + playerText() + "，别让我一个人独自承受这种感觉。]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().KNOTTYP);
         }
         else if(get_knotSize() >= 6)
         {
            outputText("凯丝指着她的阴茎" + cockMultiple("","s") + "说道：[say: 我觉得它不能再变大了。我一次吃了一大堆这种辣椒，它们从来没有让我超过这个程度。][pg]");
            outputText("她接过辣椒，仔细端详了一下，然后塞进嘴里。嚼完后，她补充道：[say: 它们确实很好吃。]她又看着你说道：[say: 谢谢你，" + playerText() + "；虽然我不再在小巷里挨饿了，但这确实很合我的胃口。][pg]");
            if(hasDogCock())
            {
               outputText("凯丝坐在那里，你观察了一小会儿，但唯一能表明她刚刚吃了一个充满魔力的辣椒的迹象" + cockMultiple("是她坚如磐石的勃起。","是她坚如磐石的双重勃起。"));
            }
            else
            {
               outputText("就在她刚说完话时，凯丝的眼睛睁得大大的，她交叉着双腿。");
               if(get_cockNumber() > 1)
               {
                  outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一对" + cockAdj() + "的犬科阴茎。");
               }
               else
               {
                  outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一根" + cockAdj() + "的犬科阴茎。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().KNOTTYP);
         }
         else if(get_knotSize() >= 4)
         {
            outputText("凯丝有些不确定地接过辣椒。[say: 它勾起了一些美好的回忆，从我遇见你之后；它也勾起了我在同类中被当成弃儿的回忆。][pg]");
            outputText("她试图把辣椒还给你，但你握住她的手，告诉她要集中精力回想那些美好的回忆。她知道你不会觉得她丑。当她有一个巨大的结时，你们俩相处得很好。在某种程度上，正是这个让你们走到了一起。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1232) > 10 ? " 再说了，和乌尔塔分享这个难道不好玩吗？" : "") + "[pg]");
            if(submissiveness() < 1)
            {
               outputText("凯丝摇了摇头，说道：[say: 我不知道我是否准备好了。我花了那么长时间去讨厌我那巨大的结。][pg]");
               outputText("你用手指挑逗着她那4英寸的结" + cockMultiple("","s") + "。凯丝的身体扭动着，她对你笑了笑，但她把辣椒推回了你空闲的手中。[pg]");
               outputText("[say: 也许下次吧，亲爱的，] 她说，[say: 现在我脑子里有别的事情。][pg]");
               outputText("她确实犹豫了一秒钟……如果你能说服凯丝去做一些她不太确定的事情，她也许会愿意再吃一个犬椒。");
            }
            else
            {
               outputText("凯丝接过辣椒，然后紧紧地抱住你。[say: 好吧，" + playerText() + "，我是为了你才这么做的。如果你觉得我有一个巨大的结会更有趣……] 她慢慢地咬了一口辣椒，咽了下去，[say: ……那就这样吧。]");
               if(!hasDogCock())
               {
                  outputText("[pg]就在她刚说完的时候，凯丝睁大了眼睛，双腿交叉。");
                  if(get_cockNumber() > 1)
                  {
                     outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一对" + cockAdj() + "的犬科阴茎。");
                  }
                  else
                  {
                     outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一根" + cockAdj() + "的犬科阴茎。");
                  }
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
               }
               outputText("[pg]过了将近一分钟，凯丝的结" + cockMultiple("才对辣椒产生反应","才对辣椒产生反应") + "。当变化发生时，它来得很快——她的结" + cockMultiple("只是膨胀起来","只是膨胀起来") + "，没有任何预兆，变大了几英寸。[pg]");
               outputText("凯丝看着这一切发生，几乎没有任何反应。你猜她吃得太多了，身体已经对这种效果产生了抗性。除了结" + cockMultiple("在缓慢地跳动外，唯一能表明她刚刚吃了一个充满魔力的辣椒的迹象就是她那坚如磐石的勃起。","在缓慢地跳动外，唯一能表明她刚刚吃了一个充满魔力的辣椒的迹象就是她那坚如磐石的双重勃起。"));
               set_knotSize(get_knotSize() + 2);
               if(get_knotSize() > 6)
               {
                  set_knotSize(6);
               }
               addSubmissive(16);
               dynStats(DynStat.Lust(10 + get_player().lib / 20));
               get_player().consumeItem(get_consumables().KNOTTYP);
            }
         }
         else
         {
            outputText("凯丝接过辣椒，笑了起来。[say: 我怎么会忘记呢？我甚至都不记得我吃了多少个这种东西，只是为了让我的肉棒变大一点。] 她揉了揉" + cockMultiple("她的肉棒","一根肉棒，然后是另一根") + "的根部，说道：[say: 你想让我变得更丰满一点吗？当我用结锁住你的时候，感觉好吗？][pg]");
            outputText("你只是笑了笑，凯丝试探性地舔了舔辣椒。[say: 我从没想过我还会再吃一个这种东西，] 她说。她摇了摇头，然后把辣椒塞进嘴里。除了她的肉棒" + cockMultiple("","s") + "立正站好之外，似乎什么也没发生，但凯丝笑着说：[say: 是的，我能感觉到。当" + cockMultiple("这个坏家伙开始发作时，我的结","这些坏家伙开始发作时，我的结每个都") + "会膨胀到苹果那么大。][pg]");
            if(!hasDogCock())
            {
               outputText("就在她刚说完话时，凯丝的眼睛睁得大大的，她交叉着双腿。");
               if(get_cockNumber() > 1)
               {
                  outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一对" + cockAdj() + "的犬科阴茎。");
               }
               else
               {
                  outputText("她的阴茎向外伸展，吸收了倒刺，整个长度都变粗了。几分钟后，凯丝再次炫耀着一根" + cockAdj() + "的犬科阴茎。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("过了将近一分钟，凯丝的结" + cockMultiple("才对辣椒产生反应","才对辣椒产生反应") + "。当变化发生时，它来得很快——她的结" + cockMultiple("只是膨胀起来","只是膨胀起来") + "，没有任何预兆，变大了几英寸。[pg]");
            outputText("凯丝看着这一切发生，几乎没有任何反应。你猜她吃得太多了，身体已经对这种效果产生了抗性。除了结" + cockMultiple("在缓慢地缩小外，唯一能表明她刚刚吃了一个充满魔力的辣椒的迹象就是她那坚如磐石的勃起。","在缓慢地缩小外，唯一能表明她刚刚吃了一个充满魔力的辣椒的迹象就是她那坚如磐石的双重勃起。"));
            set_knotSize(get_knotSize() + 2);
            if(get_knotSize() > 4)
            {
               set_knotSize(4);
            }
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().KNOTTYP);
         }
         if(hasCock())
         {
            outputText("[pg]她的尾巴在你的腿上扫过。她低头看了看自己的勃起" + cockMultiple("","s") + "，看了看你，然后又看了看自己的勃起" + cockMultiple("","s") + "。");
         }
         katSexMenu();
      }
      
      public function giveKatADoublePepper() : void
      {
         clearOutput();
         if(!hasCock())
         {
            outputText("你拿出你的双子犬椒，问她想不想吃。[pg]");
            outputText("[say: 我很确定这对我不会有什么效果，]她回答道。[say: 但它们味道确实不错，只要你不介意的话……]她微笑着接过犬椒，大口吃了起来。伴随着一声呻吟，她" + clothesLowerChoice("把手伸进短裤里","撩起裙子","拉开紧身衣的褶皱","撩起连衣裙","拨开长袍") + "，开始揉搓自己的阴蒂。[pg]");
            outputText("[say: 哦，求你了，" + playerText() + "，别让我一个人独自承受这种感觉。]");
         }
         else if(get_cockNumber() == 1)
         {
            outputText("你拿出你的双子犬椒，问她想不想吃。[pg]");
            outputText("[say: 快乐加倍，是吧？好吧……这真的很奇怪，但如果这能让你开心的话，]她说道。她接过辣椒，只停顿了一下，" + clothesLowerChoice("褪下裤子","撩起裙子脱下内裤","拉开紧身衣","撩起裙子脱下内裤","解开长袍脱下内裤") + "露出她的包皮，然后吧唧着嘴把辣椒吃得一干二净。[say: 嗯……味道不错。哦！]她喘着粗气，突然弓起了背。[pg]");
            outputText("你的目光移向她的胯部，她那根" + cockType("狗","猫") + "鸡巴以一种看似缓慢的速度滑出，在弹出时达到了" + get_cockLength() + "英寸长，龟头完全显露，肉结也胀大到了" + get_knotSize() + "英寸粗。");
            if(!hasDogCock())
            {
               outputText("与此同时，她的肉棒向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一根" + cockAdj() + "的犬科肉棒。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("接着，包皮的开口被撑得更大了，第二个特征明显的龟头冒了出来，向上滑出，直到她长出了两根鼓胀的狗鸡巴，大小完全一样。她伸出手，两只手各轻轻抚摸着一根，向你投来一个勾引的眼神。[pg]");
            set_cockNumber(2);
         }
         else
         {
            outputText("凯瑟琳一脸疑惑地看着那对双生辣椒。");
            if(!hasDogCock())
            {
               outputText("[say: 你想让我变回原来的样子？][pg]");
               outputText("你告诉她，你觉得她长猫鸡巴或狗鸡巴都很好看，而且你现在想玩点“狗”花样——可以这么说。此外，你知道她喜欢吃辣椒。凯丝接过辣椒，给了你一个灿烂的微笑。");
            }
            else
            {
               outputText("[say: 呃……你知道这不会让我长出更多鸡巴的，对吧？据我所知，这东西的极限就是两根。][pg]");
               outputText("你告诉她，你觉得她可以好好吃一顿，而且你知道她有多喜欢辣椒。这只猫娘给了你一个紧张的微笑，接过了双生辣椒。");
            }
            outputText("她优雅地吃下它，咽了下去，然后露出了一种奇怪的表情。随着她大声喘息，你可以看到她的鸡巴开始" + clothesLowerChoice("从裤子里顶出来","顶起裙边","撑开紧身衣薄薄的布料","顶起裙边","撑开长袍的下摆"));
            if(!hasDogCock())
            {
               outputText("。龟头开始发生变化，膨胀并褪去了猫科动物的倒刺。没过多久，凯丝又长出了一对" + cockAdj() + "狗鸡巴");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("。");
            outputText("[pg][say: 哎呀……我觉得这可能有点太辣了。你想帮帮我吗？]她发出呼噜声，已经开始抚摸她的那对肉棒了。[pg]");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         get_player().consumeItem(get_consumables().DBLPEPP);
         katSexMenu();
      }
      
      public function giveKatACaninePepper() : void
      {
         clearOutput();
         outputText("你递给凯瑟琳一个犬椒，问她是否愿意为了过去的时光吃一个。[pg]");
         if(hasDogCock())
         {
            outputText("[say: 我不知道。我不想在这些东西上碰运气。我的身体里已经有很多了，也许再多吃几个我就会对着月亮狂吠了。][pg]");
            outputText("她拉着你的手说，[say: 你的想法很好，我也确实喜欢它的味道和气味。] 说着，她开始沿着犬椒的长度嗅起来。[say: 它们让我发情……它们让你发情吗？] 她依偎着你，问道，[say: 你能猜到我在想什么吗，亲爱的？][pg]");
         }
         else
         {
            outputText("[say: 它肯定会让我再次长出" + cockMultiple("狗鸡巴","一对狗鸡巴") + "。这并不意味着我拒绝，我有点习惯有一个" + cockMultiple("","然后是两个") + "了。] 说着，她开始沿着犬椒的长度嗅起来。[say: 我想我的意思是我喜欢有" + cockMultiple("一根硬挺的鸡巴","一对硬挺的鸡巴") + "，并且有地方可以把" + cockMultiple("它","它们") + "塞进去。也许这让我变成了一个荡妇扶她，但我一点也不在乎。][pg]");
            outputText("你把犬椒喂进她嘴里，凯丝在嘴里滚了滚，然后闭上嘴，在你的脸颊上留下一个辛辣的吻。她迅速地" + clothesLowerChoice("脱下裤子","撩起裙子脱下内裤","解开紧身衣的褶皱","撩起裙子脱下内裤","解开长袍脱下内裤") + "，露出她带倒刺的肉棒" + cockMultiple("","") + "。[pg]");
            outputText("这辣椒果然没让人失望，你看着神奇的力量将她的肉棒" + cockMultiple("","") + "向外拉伸，吸收了" + cockMultiple("它的","它们的") + "倒刺。凯丝再次拥有了" + cockMultiple("一根","一对") + cockAdj() + "犬类肉棒" + cockMultiple("","") + "，并伴随着一个开心、饥渴的笑容" + "。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            get_player().consumeItem(get_consumables().CANINEP);
         }
         katSexMenu();
      }
      
      public function giveKatABulbousPepper() : void
      {
         clearOutput();
         outputText("你拿出球状的犬椒，问她想不想吃。[pg]");
         if(!hasCock())
         {
            outputText("[say: 我很确定这对我不会有什么效果，]她回答道。[say: 但它们味道确实不错，只要你不介意的话……]她微笑着接过犬椒，大口吃了起来。伴随着一声呻吟，她" + clothesLowerChoice("把手伸进短裤里","撩起裙子","拉开紧身衣的褶皱","撩起连衣裙","拨开长袍") + "，开始揉搓自己的阴蒂。[pg]");
            outputText("[say: 哦，求你了，" + playerText() + "，别让我一个人独自承受这种感觉。]");
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().BULBYPP);
            katSexMenu();
         }
         else if(!hasBalls())
         {
            outputText("[say: 真有趣，我刚习惯没有它们的日子，]她回答道。她友好地向你眨了眨眼，然后接过犬椒，大口吃了起来。她呻吟着，隔着" + clothesLowerChoice("短裤","裙子","紧身衣","连衣裙","长袍") + "捂住自己的腹股沟；在你的注视下，她的手被从身体上推开，因为她的睾丸重新生长并垂了下来。");
            if(!hasDogCock())
            {
               if(get_cockNumber() > 1)
               {
                  outputText("与此同时，她的肉棒向外伸展，吸收了上面的倒刺。没过一会儿，凯丝又长出了一对" + cockAdj() + "犬类肉棒。");
               }
               else
               {
                  outputText("与此同时，她的阴茎向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一根" + cockAdj() + "犬类阴茎。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("[pg]凯丝揉了揉她新长出的睾丸，你看到随着她的" + cockMultiple("阴茎勃起","双茎勃起") + "，一个" + cockAdj() + "凸起正在形成。她对你露齿一笑，问道：[say: 那么……你想试用一下吗？][pg]");
            set_ballSize(1);
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().BULBYPP);
            katSexMenu();
         }
         else if(get_ballSize() < 5)
         {
            outputText("[say: 哦，当然，为什么不呢？更大的蛋蛋肯定更好，对吧？]她回答道。她的语气带着讽刺，但她对你友好地眨了眨眼，然后拿起辣椒，大口吃了起来。伴随着一声呻吟" + clothesLowerChoice("和弓起的背部，当你在旁观看时，她紧身的短裤里出现了一个新的隆起","她撩起裙子，让你看着她紧身的内裤里出现了一个新的隆起","和弓起的背部，她半透明的紧身衣裆部出现了一个新的隆起","她撩起裙子，让你看着她紧身的内裤里出现了一个新的隆起","她解开长袍，让你看着她紧身的内裤里出现了一个新的隆起") + "，她的睾丸肉眼可见地变大。它们的大小大约翻了一倍，然后停止生长，让这个猫" + (hasCock() ? "扶她" : "娘") + "喘着粗气。");
            if(!hasDogCock())
            {
               if(get_cockNumber() > 1)
               {
                  outputText("与此同时，她的阴茎向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一对" + cockAdj() + "犬类阴茎。");
               }
               else
               {
                  outputText("与此同时，她的阴茎向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一根" + cockAdj() + "犬类阴茎。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("她向你抛了个媚眼。[say: 那么……你想试用一下它们吗？]她娇嗔道。[pg]");
            set_ballSize(get_ballSize() + 2);
            if(get_ballSize() > 5)
            {
               set_ballSize(5);
            }
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().BULBYPP);
            katSexMenu();
         }
         else if(submissiveness() >= 4 && get_ballSize() < 9)
         {
            outputText("她看了看球茎辣椒，然后摇了摇头。[say: 不，谢谢。再大一点我走路都会有困难，而且我觉得我现在已经够麻烦的了。不过还是谢谢你的好意。还有别的事吗？]她补充道，试图表现得委婉些。[pg]");
            outputText("你对凯丝咧嘴一笑，告诉她你想看她变得更大。玛瑞斯有很多人蛋蛋比她大，但他们依然能四处走动。你凑近她，隔着她的" + clothesLowerChoice("短裤","裙子","半透明紧身衣","连衣裙","长袍") + "开始抚摸她那" + ballAdj() + "悬垂的球体。[pg]");
            outputText("凯丝喘着粗气，她的" + cockMultiple("肉棒开始","肉棒们开始") + "肿胀起来。[say: 我……我想我可以试试。只要你还觉得我漂亮就行。][pg]");
            outputText("你继续按摩她的蛋蛋，并告诉她这还不够。她答应得这么快，心里肯定很想要。[pg]");
            outputText("凯丝在原地扭来扭去，似乎她的一部分想要逃跑。最后，在深吸了一口气后，你听话的小" + catGirl("猫娘","猫咪") + "说道，[say:是的。是的，" + playerText() + "，我想要。如果你想让我有更大的蛋蛋，那我也想要。][pg]");
            outputText("你只是笑了笑，用空出的手将那颗胖乎乎的小辣椒塞进凯丝的唇间。她试图把它吃下去，但你却像抽插小鸡巴一样把它在她嘴里进进出出。你让她吸吮它，她乖乖照做了。当你终于松开手时，凯丝把辣椒吸进嘴里，饥渴地咀嚼起来。[pg]");
            outputText("没过多久，你就感觉到她的阴囊膨胀起来。它跳动着，撑开了你的手指，她的每个睾丸都长大了大约两英寸。");
            if(!hasDogCock())
            {
               if(get_cockNumber() > 1)
               {
                  outputText("与此同时，她的肉棒向外伸展，倒刺也随之吸收。没过多久，凯丝又长出了一对" + cockAdj() + "犬科肉棒。");
               }
               else
               {
                  outputText("与此同时，她的肉棒向外伸展，吸收了上面的倒刺。没过多久，凯丝又长出了一根" + cockAdj() + "的犬科肉棒。");
               }
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1216,0);
            }
            outputText("凯瑟琳用双臂环抱住你以支撑身体。当变化似乎已经结束时，她张开双腿以适应她那" + ballAdj() + "的阴囊，并在你耳边低语，[say:那么……你想不想试用一下它们？][pg]");
            addSubmissive(2048);
            set_ballSize(get_ballSize() + 2);
            if(get_ballSize() > 9)
            {
               set_ballSize(9);
            }
            dynStats(DynStat.Lust(10 + get_player().lib / 20));
            get_player().consumeItem(get_consumables().BULBYPP);
            katSexMenu();
         }
         else
         {
            if(submissiveness() >= 4)
            {
               outputText("她跪在地上恳求你。[say:拜托了，" + playerText() + "——我现在追捕罪犯时就已经很困难了。如果它们再变大，我可能会丢掉工作。谢谢你的好意，但这些怪物产出的精液难道还不够我们俩用吗？求你了，我们能不能做点别的？]她带着担忧的微笑补充道，试图委婉地拒绝。");
               if(get_player().cor >= 75)
               {
                  outputText("[pg]给你那" + catGirl("猫娘","猫科") + "性玩具弄出大到让她无法移动的巨型睾丸肯定会很有趣。但另一方面，如果她丢了工作，你就得照顾她。去他的——你现在想怎么操她就怎么操，而且还不用花钱。[pg]");
                  outputText("你挠了挠她的耳朵，向她保证没关系。凯丝发出呼噜声，紧紧贴着你，她的肉棒" + cockMultiple("开始从包皮中滑出。","开始从包皮中滑出。"));
               }
            }
            else
            {
               outputText("她看着球茎辣椒，然后摇了摇头。[say:不用了，谢谢。再大一点我走路都会有困难，而且我觉得我现在弄出的动静已经够大了。不过还是谢谢你的好意。还有别的事吗？]她补充道，试图委婉地拒绝。[pg]");
               outputText("她确实犹豫了一秒钟……如果你能说服凯丝去做一些她不太确定的事情，她也许会愿意再吃一个犬椒。");
            }
            katherineMenu();
         }
      }
      
      public function giveClothing(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1220,FlagDict_Impl_.arrayReadInt(_loc2_,1220) | param1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1222,param1);
      }
      
      public function get_knotSize() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,401);
      }
      
      public function get_hairColor() : String
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,1223);
      }
      
      public function get_furry() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1224) == 0;
      }
      
      public function get_fertile() : Boolean
      {
         return false;
      }
      
      public function get_cockNumber() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,399);
      }
      
      public function get_cockLength() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,400);
      }
      
      public function get_breasts() : BreastStore
      {
         return _breasts;
      }
      
      public function get_ballSize() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,402);
      }
      
      public function getPenetrated() : void
      {
         clearOutput();
         get_images().showImage("katherine-fucks-you-knottily-in-the-bungholio");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            letKatKnotYouCommonDialogue(true);
         }
         outputText("你向凯瑟琳示意你想要她插进你的[asshole]。[pg]");
         outputText("[say: 好吧，我不能说我很喜欢这个主意，但是好吧……]她" + catGirl("","毛茸茸的") + "双手立刻开始占有欲极强地抚摸你的[ass]，慢慢向上移动，抓住你的[hips]。[say: ……如果这就是你想要的。]你感觉到她用她" + cockMultiple("","最下面的") + "阴茎摩擦你的肛门，让你的臀瓣感受它" + cockType("橡胶般光滑的","长满倒刺的") + "长度，然后，她收回臀部，毫不犹豫地突然把它插进它们之间" + cockMultiple("","，她上面的阴茎在你的背上弹跳") + "。[pg]");
         outputText("[say: 准备——嗯——这里需要一点润滑……]她咕哝着，把她的阴茎" + cockMultiple("","们") + "拖过你的臀瓣。当她这么说的时候，她的身体与她的话语相匹配，那根" + cockType("小狗鸡巴","小猫鸡巴") + "开始流出一种光滑、温暖的液体，流进你的股沟" + cockMultiple("","，也流到你的臀瓣上，另一根在它们上方弹跳") + "。她用柔软的双手将粘液揉进你的菊花和她尖锐的肉棒上，然后当她把它从你的臀瓣中拔出时，有一种空虚的感觉。在你还没来得及反应之前，她再次推开它们，把她的阴茎猛地插进你的肛门！!");
         var _loc1_:int = get_player().ass.analLooseness;
         get_player().buttChange(cockArea(),true,true,false);
         outputText("[pg]");
         if(_loc1_ > get_player().ass.analLooseness)
         {
            outputText("你忍不住惊叫出声，回头看着凯瑟琳，她看起来真的很抱歉。[say: 抱歉！但我需要尽早插入——或者你宁愿等到我的结完全肿胀？]你承认她有道理，但求她如果还有下次的话，温柔一点。[pg]");
         }
         outputText("手指掐进你的臀部，她开始在你体内前后抽插" + cockMultiple("","，她的第二根阴茎湿漉漉地拍打着你的背") + "。她咕哝着，呻吟着，[saystart]哦——哦，是的，你太不可思议了！!");
         if(get_player().harpyScore() >= 4 || get_player().sharkScore() >= 4 || get_player().catScore() >= 4 || get_player().dogScore() >= 4 || get_player().bunnyScore() >= 4)
         {
            outputText("嗯……对，就是这样，为我呻吟吧，你这个小荡妇；谁是阿尔法母狗，嗯？凯瑟琳是你的阿尔法——继续，说出来！[sayend]她大喊着，用更大的力量将自己捣进你体内，她的" + catGirl("锋利的指甲掐进去","爪子伸出") + "刚好足以开始咬进你的肉里，针扎般的疼痛抵消了快感。[pg]");
         }
         else
         {
            outputText("[sayend][pg]");
         }
         outputText("你呻吟着喘息，将屁股向后顶向你猫科情人的小腹，以迎合她的操弄");
         if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 9 || get_player().tail.type == 3)
         {
            outputText("，你的尾巴蜿蜒而上，穿过她的双乳，调皮地抚摸着她的脸颊，");
         }
         outputText("大声呼喊着她的名字。你能感觉到她的结在你体内开始膨胀，同时她也加快了抽插的速度。[pg]");
         outputText("[say:哦哦哦！我要把你塞满；用小猫咪的精液把你填满！]凯瑟琳呻吟着，她的结在你体内膨胀到最大尺寸，将你们锚定在一起，让她再也拔不出来。她向前猛扑，抓住你的肩膀，试图插得更深。");
         if(get_knotSize() >= 6)
         {
            outputText("感觉就像她试图把一个西瓜塞进你体内；被塞得这么满，你痛并快乐着，大声叫了出来。");
         }
         else if(get_knotSize() >= 4)
         {
            outputText("她塞进你体内的肿胀肉棒数量已经到了痛苦的边缘，但更多的是纯粹的快感充斥着你。");
         }
         else
         {
            outputText("多亏了她相对正常大小的结，被这样塞满感觉只有舒服。");
         }
         outputText("[pg]");
         outputText("当你的高潮突然席卷全身时，你颤抖着喘息");
         if(get_player().hasVagina())
         {
            outputText("，爱液从你的[vagina]中飞溅而出");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText((get_player().hasVagina() ? " 并且 " : "， ") + get_player().sMultiCockDesc() + " 喷射出");
            if(get_player().cumQ() < 25)
            {
               outputText("几滴");
            }
            else if(get_player().cumQ() < 100)
            {
               outputText("飞溅的");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("一滩");
            }
            else
            {
               outputText("名副其实的精液湖" + (isAt(1) ? "在床上" : "在小巷里"));
            }
         }
         outputText("当你的屁眼绞紧入侵者时。[pg]");
         outputText("她突然弓起背，发出一声愉悦的嚎叫，她的高潮随之而来，在她体内荡漾；她呻吟着，射在你体内");
         if(get_cockNumber() > 1)
         {
            outputText("，更多的精液从她的第二根肉棒中喷出，涂满你的背部，滴落到你下方的" + (isAt(1) ? "床单" : "地面") + "上");
         }
         outputText("。");
         if(cumQ() <= 500)
         {
            outputText("对于" + (hasBalls() ? "这么小的蛋蛋" : "一个没有蛋蛋的双性人") + "来说，她制造了惊人数量的精液，你能感觉到它在你体内晃动和发出吧唧声，让你美味地充满了猫咪的精华。");
         }
         else if(cumQ() <= 1500)
         {
            outputText("一股又一股的精液喷射进你体内，一直淹没到你的肠道；当" + cockType("狗屌猫","倒刺尖端") + "停下来时，你的肚子已经开始因为她给你的所有精液而鼓起来了。");
         }
         else
         {
            outputText("她射了又射，射了又射；她的" + (hasBalls() ? "蛋蛋" : "前列腺") + "里怎么能装下这么多精液？你的胃里灌满了精液，直到她结束时，你看起来绝对像是怀孕了，而且");
            if(get_knotSize() >= 6)
            {
               outputText("只有她巨大的结把你体内的东西都堵住了");
            }
            else
            {
               outputText("有些精液甚至开始从她的结周围漏出来");
            }
            outputText("；你在舌根尝到了她咸咸的精液");
         }
         outputText("。射完后，她软绵绵地瘫倒在背上——不过多亏了她的结，她仍然插在你体内，当她的重量把你向后拉时，你惊叫了一声。[pg]");
         outputText("[say: 哎呀。抱歉，]凯瑟琳道歉道。");
         if(get_knotSize() >= 6)
         {
            outputText("[say: 恐怕我们得一直保持这个姿势，直到我消肿——我不敢想象如果硬拔出来会把你弄得多疼。]");
         }
         else if(get_knotSize() >= 4)
         {
            outputText("[say: 给我一点时间，我应该能消肿到足以从你体内拔出来的程度。]");
         }
         else
         {
            outputText("[say: 如果你用力拉，我应该能直接从你体内拔出来。]");
         }
         outputText("[pg]你告诉她没关系；你会和她待在一起，顺其自然。尽管由于你们各自的位置，你无法真正看到她，但你知道她在微笑。[pg]");
         outputText("大约一个小时后，她消肿了，你穿好衣服，向她道谢，然后回到了你的营地。");
         get_player().orgasm("Anal");
         orgasm();
         dynStats(DynStat.Sens(-1));
         get_player().slimeFeed();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(16);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getHelpVsKittyKats() : void
      {
         clearOutput();
         outputText("同时对付三个人比对付一个对手要困难得多。不过，看他们的样子，你大概能把这三个人按在地上摩擦。如果在废土上，直接动手才是正确的做法，但特尔阿德雷有自己的法律和守卫队。既然你是个外来者，你决定最好还是去找巡逻队。");
         outputText("[pg]你跑到最近的十字路口大声呼救。一个穿着守卫队制服的高大蜥蜴人挤过人群，问你：[say: 发生什么事了？]");
         outputText("[pg]你解释了你看到的情况，并带他回到小巷口。那里空无一人。蜥蜴人记下了你对情况的描述，并感谢你做出了正确的举动。他说：[say: 我们过去也接到过几起类似的报告，不过奇怪的是，受害者总是同一个女人。我会把描述带回守卫队，让所有警官都保持警惕。]");
         outputText("[pg]感觉自己今天做了一件好事，你继续前进。");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function getDoublePennedByKat() : void
      {
         clearOutput();
         var _loc1_:Boolean = hasAlready(32);
         get_images().showImage("katherine-fucks-you-knottily-in-all-the-holes");
         if(isAt(4) || isAt(5) || isAt(6))
         {
            letKatKnotYouCommonDialogue(true);
         }
         outputText("你向凯瑟琳示意你想两个洞都要。[pg]");
         outputText((_loc1_ ? "她咧嘴一笑，说道：" : "她对这个提议感到震惊，然后慢慢地点了点头。") + "[say: 好吧……如果你想这样的话。] " + (_loc1_ ? "她的" : "尽管她的语气如此，她的") + catGirl("柔软的","毛茸茸的") + "手立刻开始占有欲极强地抚摸你的" + get_player().assDescript() + "，慢慢向上抓住你的[hips]。[say: 嗯……这太变态了" + (_loc1_ ? "" : "，但我觉得这可能行得通") + "……]她喃喃自语，主要是对自己说，你感觉到她把她" + cockAdj() + "的肉棒蹭着你敏感的阴唇和你发麻的肛门，让你感受到它们" + cockType("橡胶般光滑的","长满倒刺的") + "长度，然后，她收回臀部，突然毫不犹豫地将下面那根插了进去。另一根则无害地顺着你的股沟滑过。");
         get_player().cuntChange(cockArea(),true,true,false);
         outputText("[pg]");
         outputText("你忍不住回头看了一眼凯瑟琳，她看起来全神贯注。[say: 抱歉！但这会很棘手……我需要快速插入，但我也需要一些润滑——除非你想尝试完全干插我的另一个结！] 她低下头，将上面那根肉棒推入你的臀瓣之间。[pg]");
         outputText("她的手指掐进你的臀部，开始在你体内来回抽插，一根肉棒穿过你的小穴，另一根穿过你的臀瓣。[say: 嗯，你太棒了……光是这样我就能高潮，] 她呻吟着。仿佛在回应这种情绪，一股缓慢的先兆精液渗入你的股沟。[say: 啊，来了……] 就在你感觉到肉棒根部的结微微变硬时，她把肉棒拔了出来，你可以听到她把她的先兆精液和你丰富的爱液涂抹在肉棒上。你的[asshole]也没有被忽视；在她把自己揉得滑溜溜之后，一把温暖粘稠的液体被推了进去。如果她能捐献这么多，她一定已经流了很多口水了！几乎在同时，她用一声呻吟证实了你的预感。[say: 啊，现在必须插进去了！我忍不住了，对不起！] 两个洞同时感受到一股灼热的压力，这是她那对天赋异禀的肉棒强行插入你体内前唯一的警告，它们凭借锥形的形状和润滑，轻松滑入你已经湿润的阴道，并挤过你的括约肌。");
         get_player().buttChange(cockArea(),true,true,false);
         outputText("[pg]");
         outputText("她立刻开始抽插，咕哝和呻吟着，仿佛她已经接近了顶点。[say: 哦——哦，是的，你太不可思议了！" + (_loc1_ ? "" : "这太奇怪了，") + "我同时在操两个洞" + (_loc1_ ? "；就像我天生就是做这个的" : "，但这太棒了") + "！] 她大叫道。她平时稳固的抓握变得颤抖和不可靠，进一步证明了她在控制高潮方面遇到了麻烦。[pg]");
         outputText("你带着看不见的、恶作剧般的微笑，将屁股向后顶向你猫科情人的腹部，意图迫使她羞耻地快速结束，并用你最性感的卧室嗓音呼唤她的名字。你可以感觉到她的结在你体内开始肿胀，即使她加快了速度，猛烈地撞击着你。[pg]");
         outputText("[say: 哦！要-要把你堵住了；把你填-填满……！] 凯瑟琳心烦意乱地呻吟着，她的结在你体内膨胀到最大尺寸，将你们锚定在一起，这样她就再也拔不出来了。她向前猛扑，抓住你的肩膀，想插得更深，但随着高潮的到来，她无力地滑落了。[pg]");
         outputText("她突然弓起背，发出一声欢愉的嚎叫，快感传遍全身，射在了你的体内。");
         if(cumQ() <= 500)
         {
            outputText("对于" + (hasBalls() ? "这么小的蛋蛋" : "一个没有蛋蛋的双性人") + "来说，她制造了惊人数量的精液，你能感觉到它在你体内晃动和发出吧唧声，让你美味地充满了猫咪的精华。");
         }
         else if(cumQ() <= 1500)
         {
            outputText("一股又一股的精液喷射进你的体内，一路淹没" + (pregSize() > 0 ? "进去，溅在你的子宫颈上，填满你的" : "到你的子宫和") + "肠道；当那" + cockType("dog-dicked cat","barbed tip") + "停下来时，你的肚子已经因为她给你的精液而开始鼓起来了。");
         }
         else
         {
            outputText("她射了又射，射了又射；她的" + (hasBalls() ? "蛋蛋" : "前列腺") + "里怎么能装下这么多精液？你的" + (pregSize() > 0 ? "小穴" : "子宫") + "和胃都被精液淹没了，直到她结束时，你看起来就像是真的怀孕了一样，而且");
            if(get_knotSize() >= 6)
            {
               outputText("只有她巨大的肉结把一切都堵在你的体内。");
            }
            else
            {
               outputText("实际上有一些精液开始从她的肉结周围漏出来。");
            }
         }
         outputText("射完精后，她浑身无力地瘫倒在背上——不过多亏了她的肉结，她仍然插在你的体内，当她的重量把你向后拉，直到你坐在她身上时，你震惊地叫了一声。[pg]");
         outputText("[say: 哎呀。抱歉，]凯瑟琳道歉道。");
         if(get_knotSize() >= 6)
         {
            outputText("[say: 恐怕我们得一直保持这个姿势，直到我消肿——我不敢想象如果硬拔出来会把你弄得多疼。]");
         }
         else if(get_knotSize() >= 4)
         {
            outputText("[say: 给我一点时间，我应该能消肿到足以从你体内拔出来的程度。]");
         }
         else
         {
            outputText("[say: 如果你用力拉，我应该能直接从你体内拔出来。]");
         }
         outputText("[pg]你告诉她，如果她拔不出来也没关系；你自己还没高潮呢。当你越过肩膀看着她的脸时，她那双猫眼睁得大大的。[say: 哦！真的很抱歉……天哪，我都没想过。你……你要怎么做？][pg]");
         outputText("你转过身，掩饰住你邪恶的笑容，开始在她那结着肉结、依然坚挺的肉棒上上下起伏。");
         if(cumQ() > 500)
         {
            outputText("她的精液在你体内流动，增加了对你子宫颈和肠道的刺激。");
         }
         outputText("[pg]");
         outputText("[say: 哦——哦，玛莱啊！受不了了！求你停下，它们现在太敏感了！]当你继续以反向骑乘的姿势骑在她那结着肉结的肉棒上时，猫女哭喊道。她抓着你的臀部，似乎想喘口气，但她松弛、疲惫的肌肉无法阻止你完成高潮。在她那像呜咽一样的呻吟和你体内的感觉的刺激下，高潮很快就来了；当你的肛门和阴道在高潮的阵痛中挤压她的肉棒时，她紧接着又喷发了第二次，撑大了你的肚子");
         if(cumQ() > 1500)
         {
            outputText("到了极限");
         }
         outputText("她又射了一股较小的精液填满了你。");
         if(get_player().hasCock())
         {
            outputText("" + get_player().SMultiCockDesc() + (int(get_player().cocks.length) > 1 ? " 也喷射出一道道" : " 也喷射出一道") + "精液来庆祝，洒在她的腿上和你面前的地上。");
         }
         outputText("猫女喘息着，抽搐着，新的射精感传遍她的全身，但她没有说出任何话，只是呆滞地看着" + (isAt(0) ? "头顶的墙壁。" : "天花板。"));
         outputText("[pg]");
         outputText("大约一个小时后，她终于软了下来，你终于可以从她身上起来，穿好衣服，然后回营地去了。[pg]");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         orgasm();
         dynStats(DynStat.Sens(-2));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         experience(32);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstTimeWithKatherineUTerribleScrub() : void
      {
         clearOutput();
         outputText("你问凯瑟琳怎么了。她看着自己的脚，问道：[say: 你为什么对我这么好？我喜欢你，但我不知道你为什么喜欢我，而且——而且我不想把事情搞砸。]");
         outputText("[pg]你坐在她旁边，告诉她你喜欢她是因为她看起来人很好；她真的很漂亮，而且你想帮她一把。");
         outputText("[pg][say: 我很漂亮？]她说道。[say: 你总是说这种话，但是——]她朝着自己胯部的方向挥了挥手，[say: ——你知道我是什么。你知道我下面有什么。我有一个比我见过的任何男孩都要大的结，而且我甚至没有那种正常<b>类型</b>的……阴茎。]");
         if(get_player().cor < 25)
         {
            outputText("[pg]你告诉她这根本不是问题。所以她有一根狗鸡巴。如果这让你介意的话，你就不会在这里了，不是吗？你想了解她是因为你喜欢她，喜欢她的全部。");
            outputText("[pg]凯丝只是靠在你身上，对你说的任何话都没有反应。她一定认为每个人都在暗地里讨厌她的鸡巴，而且她永远无法独自克服被拒绝的风险。你有一种感觉，如果你不主动出击，她将永远无法相信自己是有价值的。");
            outputText("[pg]你问她是否信任你。她微微点了点头，然后你吻了她。她的嘴唇在颤抖，眼睛紧紧闭着。你缓慢而温柔地亲吻她的嘴唇，直到你感觉到她开始回应。");
            outputText("[pg]她的手移向裤子，试图压制住她不断增长的勃起。你再次让她相信你，并把她的手拉开，让她鸡巴的顶端像蛇一样探出来。");
            outputText("[pg]你告诉她，现在她需要静静地躺着，让你向她展示你对她的感觉。你握住她的双手，将它们按在她头部两侧的墙上。她任由你这么做，然后你的手开始在她的身体两侧上下游走，抚过她的乳房，滑过她的腹部。");
            outputText("[pg]随着你的每一次抚摸，你看到她的鸡巴从包皮里滑出得更多了。");
         }
         else if(get_player().cor < 75)
         {
            outputText("[pg]你告诉她，你去过特尔阿德雷之外的地方旅行。你见过许多奇妙而不可思议的事物。她真的有那么糟糕吗？她显然不是恶魔，你能认出来，守卫队也能。");
            outputText("[pg]凯丝只是靠在你身上，对你说的任何话都没有反应。");
            outputText("[pg]你告诉她你可以向她证明。你的手臂环过她的背，开始轻轻揉捏她的后颈。她试图反驳，但你把一根手指按在她的嘴唇上，并眨了眨眼。");
            outputText("[pg]之前的兴奋和紧张情绪沸腾了起来。就好像她的大脑无法决定该怎么做。另一方面，她的身体却很清楚该做什么。你看到那根蟒蛇般粗大的鸡巴开始把她的裤子顶起一个小帐篷。");
            outputText("[pg]她伸手下去，试图压制住它，但你挡住了她，抓住了她的手腕。她那犬型鸡巴的其余部分挣脱了出来，你轻轻地对着龟头吹气，鼓励它从包皮里探出得更远。");
         }
         else
         {
            outputText("[pg]你告诉凯丝，你准备证明你需要她，而且不仅仅是作为朋友。你用一只手臂将她按在墙上，趁机抚摸那对挺拔的乳房。在她反应过来之前，你用另一只手伸进她的裤子里，揉弄她那根粗大但疲软的鸡巴。");
            outputText("[pg]凯丝呻吟了一声，几秒钟内，她的鸡巴就开始从包皮里滑出来。你腾出空间，让它能从她的裤子里挣脱出来，骄傲地挺立在空气中。她看起来很震惊，嘴巴微张，于是你把嘴唇贴在她的嘴唇上。她闭上眼睛，你将舌头滑入她的口中，与凯瑟琳那粗糙的舌头纠缠在一起。");
            outputText("[pg]与此同时，你的双手也完成了它们的工作。她的乳头已经开始顶起衬衫薄薄的布料。她的鸡巴摸起来又热又硬；透过你的手指，你能感觉到她迅速加快的心跳。");
            outputText("[pg]你结束了这个吻，告诉她：[say: 凯丝——<b>你</b>想要这个。]");
         }
         outputText("[pg]凯瑟琳轻轻地吐出一个字，[say: 是的，]这就足够了。");
         initFlags();
         doNext(handjobbiesFurrDemCatFurries);
      }
      
      public function firstTimeWithKatherinePartTwoUltraChampionshipEditionHyperTurbo() : void
      {
         clearOutput();
         outputText("你扶凯丝站起来，她给了你一个大大的拥抱。她抽泣了几声，然后才勉强控制住自己，说道：[say:我以前不相信有人会关心我。]");
         if(get_player().cor < 25)
         {
            outputText("[pg]你向她保证你确实关心她，并且希望能再次见到她。事实上，你希望能经常见到她，也很乐意更深入地了解她。");
         }
         else if(get_player().cor < 75)
         {
            outputText("[pg]你向她保证你确实关心她，并且希望能再次见到她。事实上，你希望能经常见到她，也很乐意更深入地了解她。你没有补充的是，你所说的“了解她”不仅指友谊，还包括肉体上的了解。");
         }
         else
         {
            outputText("[pg]你犹豫着要不要现在就彻底粉碎她的希望，但她顺从的样子实在太迷人了。在玛瑞斯的任何地方，你都能找到（或制造）一个受虐的性玩具，但要找到一个天生顺从、渴望关爱、没有朋友或家人的年轻双性人，几率有多大呢？[pg]你再次挑逗她的阴蒂，向她保证你想更多地见到她，并且很乐意带她体验一些新事物。");
         }
         outputText("[pg]凯丝笑容满面地说：[say: 我不想让你每次来看我都有被伏击的风险。我知道另一个帮派被守卫队抓了。他们以前经常在一个当铺后面闲逛。那家当铺是一个叫奥斯瓦尔德的寻回犬开的。我不知道他们被抓了多久，但现在那里没人住，所以如果你想找我，我会在那里的。而且，奥斯瓦尔德是个好人，他不会因为我们很难卖东西就试图欺骗像我这样的人。]");
         outputText("[pg]你问起她的帮派。[say: 那些流浪猫？]她摇了摇头。[say: 他们一直把我当成一窝里最弱小的，因为我不喜欢伤害别人，也不喜欢出卖自己。他们对待另一个人的态度几乎和我一样差，那就是海伦娜。你见过她，就是那个看起来很年轻，穿着裙子的女孩。]");
         outputText("[pg]她踢开一块石头，说道：[say: 在加入帮派之前，我自己一个人生活了一段时间。不是因为我找不到足够的食物，我只是太孤独了。]");
         outputText("[pg]你同意以后和她见面，不过你告诉她，由于你在传送门有职责在身，你不知道能多久见她一次，也不知道什么时候能见她。");
         outputText("[pg][say: 没关系，更重要的是我知道你会回来的……为了我。]然后她突然一惊，说道：[say: 哎呀！我还不知道你的名字呢。]");
         outputText("[pg]你微笑着告诉了她。");
         outputText("[pg][say: [name]] 她说道");
         if(get_player().get_short() == "Kath" || get_player().get_short() == "Katherine" || get_player().get_short() == "Helena" || get_player().get_short() == "Evelyn" || get_player().get_short() == "Oswald")
         {
            outputText("。 [saystart]这可真是太巧了！好吧，");
         }
         else
         {
            outputText("，嘴里念叨着这个陌生的词。[saystart]好吧，");
         }
         outputText("[name]，这是一次很棒的初次约会。我希望我们能再做些类似的事情——相信我，我有一些好主意！[sayend]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,398,1);
         outputText("[pg](<b>现在可以在奥斯瓦尔德当铺后面遇到凯瑟琳了！</b>)");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fertileText(param1:String, param2:String) : String
      {
         if(get_fertile())
         {
            return param1;
         }
         return param2;
      }
      
      public function experience(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1219,FlagDict_Impl_.arrayReadInt(_loc2_,1219) | param1);
      }
      
      public function drunkFuck() : void
      {
         outputText("女服务员端来最后一杯酒，凯丝一口气干了。她的" + clothesLowerChoice("裤子里明显搭起了帐篷","裙子下有明显的凸起","紧身衣的裆部有明显的凸起","裙子下有明显的凸起","长袍里有明显的凸起") + "，她站起来时对你露出了一个歪歪扭扭的笑容。[pg]");
         outputText("你牵起她的手，但出乎你意料的是，凯丝并没有走向小巷，而是拉着你走向其中一间空荡荡的后屋。她兴奋得简直要跳起来了。你们进去后锁上门，凯丝立刻扑向你。她用你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1226) == 1 ? "和乌尔塔" : "") + "教她的技巧把你的手臂反剪在背后，同时一边咯咯笑着一边脱掉你的衣服。[pg]");
         outputText("一旦你脱光了，她" + (get_player().hasVagina() ? "就开始粗暴地玩弄你的阴蒂" : "就把一根手指，然后是两根手指插进你的屁股里") + "。她一点也不温柔，只想着让你越来越饥渴。凯丝凑近你耳边低语：[say:现在轮到我了。你想要我——所以现在由我来发号施令。]她");
         if(get_player().hasVagina())
         {
            outputText("不断攻击你的阴蒂，直到你感觉到淫液顺着腿流下来");
         }
         else if(get_player().hasCock())
         {
            outputText("不断榨取你的前列腺，直到你感觉自己快要高潮了");
         }
         else
         {
            outputText("把整只手插进你的屁股里转动，她深知要让一个无性别的爱人意乱情迷需要多大的刺激");
         }
         outputText("。");
         outputText("[pg]直到你连站都站不稳时，凯丝才松开你的手臂");
         if(!get_player().hasVagina())
         {
            outputText("并把她的" + (get_player().hasCock() ? "手指" : "拳头") + "从你的屁股里抽出来");
         }
         outputText("，而这只是为了让她能" + clothesLowerChoice("解开裤子","撩起裙子","拉开紧身衣上隐藏的裂口","撩起裙子","敞开长袍") + "，拉开内裤，然后用双手抓住你的臀部。就在下一刻，你的");
         var _loc1_:Boolean = get_cockNumber() > 1 && get_player().hasVagina();
         if(_loc1_)
         {
            outputText("小穴和屁股被");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴被");
         }
         else
         {
            outputText("屁股被");
         }
         outputText("猛地撑开，凯丝将你拉向她的肉棒" + (_loc1_ ? "，深深地埋入你的两个洞里" : "，直没至柄") + "。[pg]");
         outputText("你从未见过凯丝如此具有攻击性！她一言不发；全神贯注地支配着你的");
         if(_loc1_)
         {
            outputText("小穴和屁股，让它们");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴，让它");
         }
         else
         {
            outputText("屁股，让它");
         }
         outputText("属于她。她用力地把你撞在门上，酒吧里的每个人肯定都知道这里面在发生什么。");
         if(get_player().hasCock())
         {
            outputText("持续不断的撞击让你无法招架，" + (int(get_player().cocks.length) > 1 ? "你的几根肉棒开始" : "你的肉棒开始") + "喷射，将门" + (get_player().cumQ() > 1000 ? "甚至是地板" : "") + "涂满你黏糊糊的精液");
         }
         else if(get_player().hasVagina())
         {
            outputText("所有这些抽插" + (get_player().isPregnant() && get_player().get_pregnancyIncubation() < 100 ? "伴随着你巨大孕肚的晃动" : "") + "让你难以招架，你小穴" + (_loc1_ ? "和屁股" : "") + "的内壁紧紧夹住凯丝的长枪");
         }
         else
         {
            outputText("你直肠里的所有神经开始兴奋，括约肌疯狂痉挛，试图排出入侵者");
         }
         outputText("。");
         outputText("[pg]凯丝像个疯女人一样大笑，开始更用力地操你。你感觉到她肿胀的龟结" + (_loc1_ ? "" : "") + "在对抗你痉挛的通道" + (_loc1_ ? "，试图强行挤进去" : "，试图强行挤进去") + "。凯瑟琳发出一声嚎叫，用尽全力向后拉。她的龟结" + (_loc1_ ? "，已经接近最终大小，冲破了你的防线，你的肌肉无法阻挡它们" : "，已经接近最终大小，冲破了你的防线，你的肌肉无法阻挡它") + "。最后凯丝停止了动作。她一定很享受你的");
         if(_loc1_)
         {
            outputText("小穴和直肠沿着");
         }
         else if(get_player().hasVagina())
         {
            outputText("小穴沿着");
         }
         else
         {
            outputText("屁股沿着");
         }
         outputText("她的肉棒" + (_loc1_ ? "" : "") + "起伏的感觉。[pg]");
         outputText("凯丝用你几乎听不见的耳语说道，[say: 轮到我了！] 你的膝盖一软，你的小猫的肉棒" + (_loc1_ ? "喷射出" : "喷射出") + "一股精液的狂潮，涌入你的");
         if(get_player().hasVagina())
         {
            outputText((get_player().isPregnant() ? "小穴" : "空虚的子宫") + (_loc1_ ? "和肠道" : ""));
         }
         else
         {
            outputText("肠道");
         }
         outputText(!_loc1_ && get_cockNumber() > 1 ? "。她另一根夹在你大腿间的肉棒，将一股精液喷洒在地板上" : "");
         outputText("。经过几次漫长而猛烈的喷射，你的肚子肿胀起来，凯丝那涡轮增压般的" + (hasBalls() ? "睾丸尽其所能地" : "前列腺尽其所能地") + "试图把你变成一个气球。当她精疲力竭时，凯丝向后倒去，把你也拖了下去。你最终" + (get_player().isTaur() ? "肚子贴在地上，四肢摊开，" : "坐在凯丝的腿上") + "依然能感觉到她的心跳通过她结的静脉跳动" + (_loc1_ ? "" : "") + "。[pg]");
         outputText("从你身后传来一个担忧的声音。[say: 对不起，" + playerText() + "，我刚才真的失控了。我不该那样的，但你让我又醉又饥渴……总之，对不起。][pg]");
         if(get_player().cor < 25)
         {
            outputText("你知道这是你的错。你回头看着她，微笑着告诉凯丝没关系，你想享受一下，而且你确实享受到了。她听到赞美后笑容满面。");
         }
         else if(get_player().cor < 75)
         {
            outputText("如果刚才不是那么享受的话，你本来可以更容易地对你的猫" + catGirl("娘","形态") + "生气或惩罚她。");
         }
         else
         {
            outputText("这感觉真他妈爽。你已经很久没有被这样支配过了，而且这太不像凯丝了。你暗自琢磨是否能让她再来一次，但你嘴上却告诉她，你会想出一些合适的惩罚来对付她。凯丝只是点了点头。显然，酒精的消退和高潮让她又变回了平时那个顺从的自己。");
         }
         outputText("[pg]当结" + (_loc1_ ? "终于拔出来" : "终于拔出来") + "时，你站起身，穿好衣服，走出房间来到酒吧。几个顾客，许多还勃起着，为你鼓掌。凯丝仍然躺在地板上的一滩精液中，试图把自己缩成一团。尽管她几乎穿戴整齐，但她还是把一把破椅子拉到自己面前，试图躲避酒吧里的人的视线。[pg]");
         if(get_player().cor < 25)
         {
            outputText("你向凯丝飞吻，引来几声口哨。然后你关上门，用口型对她说“待会儿见”。她点点头，开始整理自己，很高兴现在能离开公众的视线。");
         }
         else if(get_player().cor < 75)
         {
            outputText("你鞠了一躬，向凯丝飞吻。其他顾客很喜欢这样，你把门敞开，这样在你离开后很久，凯丝都会感到尴尬。");
         }
         else
         {
            outputText("你对凯瑟琳露出邪恶的笑容，大步走回房间。其他顾客看着，有的抚摸着勃起的肉棒，有的把手指伸进小穴里。[say: " + playerText() + " - 你在干什么？] 她问道，非常担心。你把她拉到你面前，站在她身后，就像几分钟前她站在你身后一样。" + (get_player().hasCock() ? " 你部分疲软的肉棒摩擦着她的臀部，但这并不是她应该担心的。" : ""));
            outputText("你把手臂伸到她的手臂下，" + clothesChoice("开始解开她衬衫的纽扣，露出她的胸罩","开始隔着她透明的紧身衣玩弄她的乳房。她的乳头变硬，从有弹性的布料中凸显出来","拉下她舞会礼服的前襟，露出她的胸罩","拉开她长袍的顶部，露出她的胸罩","掀起她的抹胸，露出她的胸罩","解开性感护士服上的几颗纽扣，露出她的胸罩") + (get_breasts().milkIsFull() ? "。你感觉到她奶油般的乳汁漏了出来，看到人群中出现了一些笑容和惊讶的表情" : "") + "。[pg]");
            outputText("凯丝在你的怀里僵住了，被酒吧顾客的目光惊呆了。与此同时，你开始在手中揉捏她的乳房，享受着你爱人的乳肉和尴尬。你说，[say: 抱歉，凯丝，我早该这么做的——我完全忽略了你可爱的乳房。][pg]");
            outputText("[say: 不，不，不，] 她尖叫道。");
            if(submissiveness() < 6)
            {
               outputText("玩弄了她几分钟后，你终于放开了凯丝。酒吧里明显有一种失望的情绪，但你认为你无法让凯丝在别人面前做些什么。也许有一天你会让她如此着迷，以至于她会这么做。[pg]");
               outputText("你给了她一个快速的吻，吹着口哨离开了酒吧。");
            }
            else
            {
               outputText("你当然不理她。" + (doneSubmissive(4096) ? "你知道你的宠物喜欢你强迫她做事。" : "是时候让凯丝学点新花样了。你一直认为她的身体可以取悦人群，但在今天的行为之后，你决定证明这一点！!"));
               outputText("[pg]你退后一步，告诉凯丝这样根本不行。她喘着气，伸手去整理衣服。然后你告诉她，[say: 这些人刚刚为你的表演鼓掌，凯丝。他们期待安可。] 她僵在原地，然后你告诉她，[say: 穿这么多衣服他们看不清楚……你得脱掉。][pg]");
               outputText("这引起了人群的一阵欢呼和叫喊，你看到几个顾客踢掉裤子或裙子，准备看好戏。凯瑟琳浑身一颤，但她很清楚，当你用这种语气说话时，最好不要争辩。她开始迅速脱衣服，直到你叫她停下。[pg]");
               outputText("她回过头，也许在想你是不是要告诉她你只是在开玩笑。相反，你解释道，[say: 给他们表演一下，脱衣服，就像你是为了钱才这么做的一样。][pg]");
               outputText("凯丝咽了口唾沫，但还是转过身面对人群，" + clothesChoice("开始慢慢解开衬衫的扣子","开始解开紧身衣的系带","开始解开长裙的系带","开始解开长袍的结","开始把手指伸进抹胸的下边缘","再次拉开护士服的前襟") + "。人群很喜欢，凯丝也许是借着体内残留的酒精壮了胆，开始投入其中，身体前后摇摆，她猫一般的柔韧性让她的臀部以一种催眠般的节奏扭动，让人群安静了下来。" + (isValaAtBar() ? " 你甚至看到某个端着饮料托盘的仙灵女服务员在半空中停了下来。你看到她的眼睛紧紧跟随着凯丝臀部的每一个动作。" : ""));
               outputText("[pg]看着凯瑟琳在这么多人面前跳舞，你忍不住笑了。这是她在遇到你之前绝对不会做的事情。随着臀部的旋转，凯丝" + clothesChoice("脱下衬衫，开始玩弄自己的乳房。在几声欢呼和[say: 还要！]的叫喊声后，她也脱下了胸罩","把肩膀从解开系带的紧身衣里抽出来。她毫不迟疑地抽出双臂，把丝滑的布料往下推，直到紧身衣只遮住她的腿、屁股和肚子","解开裙子的系带，抽出双臂，让裙子的上半部分掉落。她开始玩弄自己的乳房，在几声欢呼和[say: 还要！]的叫喊声后，她也脱下了胸罩","解开结，敞开长袍的前襟，让观众可以清楚地看到她的胸罩和内裤","把抹胸从头上拉下来，开始玩弄自己的乳房。在几声欢呼和[say: 还要！]的叫喊声后，她也脱下了胸罩","脱下护士服，开始玩弄自己的乳房。在几声欢呼和[say: 还要！]的叫喊声后，她也脱下了胸罩") + "。[pg]");
               outputText("在全场所有人的目光都锁定在她的身体上时，凯丝发出一声性感的呼噜声" + clothesChoice("，松开裙子，慢慢地把它滑过臀部。她摆了个姿势，然后踢掉内裤，在人群面前赤身裸体","，把紧身衣从臀部褪下，在人群面前赤身裸体","，扭动着身体，挣脱裙子，在人群面前赤身裸体","，让蜘蛛丝长袍从肩膀滑落，掉在地上。她转了个圈，脱下胸罩，滑下内裤，在人群面前赤身裸体",clothesLowerChoice("并把紧身短裤从腿上滑下来。她的内裤紧随其后，","，松开裙子，慢慢地把它滑过臀部。她摆了个姿势，然后踢掉内裤，","","","") + " 在人群面前赤身裸体","，解开性感的护士裙，让它掉在地上。她为人群摆姿势，除了头上戴着的一顶白色小护士帽外，一丝不挂") + "。[pg]");
               outputText("趁着凯瑟琳赤身裸体且分心的时候，你偷偷溜到她身后，抓住" + cockMultiple("她的肉棒，用双手握住","她的两根肉棒") + "。当你抚摸她的阴茎" + (hasBalls() ? "、她的睾丸" : "") + "和她滴着淫液的小穴时，她发出一声惊讶的喵喵声。[pg]");
               outputText("当你用凯丝自己的淫液涂抹她的肉棒" + cockMultiple("","s") + "时，人群开始欢呼。");
               if(isValaAtBar())
               {
                  outputText("你注意到瓦拉已经放下了托盘。她的一只手伸进了裙底，脸上带着一种恍惚而幸福的表情，看着你猥亵你的" + catGirl("猫娘。","猫科情人。"));
               }
               outputText("凯瑟琳开始玩弄自己的乳房，并对观众咧嘴笑" + (get_breasts().lactating() ? "。每次她轻轻挤压，就会有一些乳汁漏出来，顺着她的胸前滴落。她" : "。然后她") + "闭上眼睛，向后靠在你身上，沉浸在她的手指和你的手指抚慰她身体最敏感部位的感觉中。[pg]");
               outputText("由于最近刚高潮过，凯丝能够上演一场相当精彩的表演。即使你的手在她的肉棒" + cockMultiple("","s") + "上动作，偶尔还探入她的小穴，也过了几分钟你才感觉到她的" + cockMultiple("那个结","那些结") + "变硬。凯丝的臀部向前猛挺，你将" + cockMultiple("她的肉棒对准天花板。当凯丝高潮时，一股浓稠的精液在高压下从她的肉棒顶端喷射而出，击中门上方的墙壁，像浓重的大雨滴一样落下","她上面的肉棒对准左边，下面的肉棒对准右边。当凯丝高潮时，两股精液在高压下从她的肉棒顶端喷射而出——一股击中门左边的墙壁，一股击中门右边的墙壁") + "。当凯瑟琳释放时，整个酒吧都在鼓掌。随着最后的几股精液从她的阴茎" + cockMultiple("","s") + "中冒出，凯丝跪倒在地，舌头从嘴边耷拉下来。[pg]");
               outputText("你确信酒吧里的每个人都很欣赏这场表演，但你不打算把赤身裸体、近乎昏迷的凯瑟琳留在他们手里。你走出房间，告诉凯丝你晚点再来看她。她发出了一声快乐的咕噜声，你猜那是一声[say: 好！]，然后你关上门，确保用力关上，这样里面的锁杆就会落下。[pg]");
               outputText("你大步走出酒吧" + (isValaAtBar() ? "，只停顿了一下，把瓦拉拉进怀里，快速吻了她并摸了摸她的屁股。她叹了口气，眨了眨眼，让你晚点再来。你" : " 然后") + "回家，你知道你" + (doneSubmissive(4096) ? "再次帮助凯丝体会到了炫耀的乐趣。" : "为凯丝打开了一些新的可能性。"));
               addSubmissive(4096);
            }
         }
         get_player().slimeFeed();
         get_player().orgasm("Generic");
         orgasm();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,403,FlagDict_Impl_.arrayReadInt(_loc2_,403) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doneSubmissive(param1:int) : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1227) & param1) > 0;
      }
      
      public function donateToCatSlutsYouCatSlutPt2() : void
      {
         clearOutput();
         katherineSprite();
         outputText("凯丝靠在墙上，试图弹掉衬衫上的一些污垢。一旦其他猫人走出了小巷，她便悄悄地问你要去哪里。你说在来这里的路上，你看到街边有一家餐厅。她愿意陪你一起去吗？");
         outputText("[pg]她微微低下头，说道：[say: 我没有钱。]");
         outputText("[pg]你走到她身边，牵起她的手，告诉她你请客。");
         outputText("[pg][say: 等等——那这不就差不多算是一次约会了吗？] 她问道。");
         outputText("[pg]你反问带一个漂亮女孩出去约会难道犯法吗。你虽然看不见她脸红，但你能感觉到那份温暖" + (get_noFur() ? "，那是她害羞的温度。" : "，直接透过她的皮毛传了过来。"));
         outputText("[pg]她扑向你，双臂紧紧抱住你。[say: 你真的想带<b>我</b>去约会吗？] 她问道，声音里充满了希望。");
         if(get_player().cor < 25)
         {
            outputText("你告诉她，你当然想。她看起来是个很好的人，你想更好地了解她。");
         }
         else if(get_player().cor < 75)
         {
            outputText("你说，是的，你很乐意带她出去约会。你没有说出口的是，你更想把她脆弱的身体按在墙上，对她为所欲为。");
         }
         else
         {
            outputText("你曾对自己发誓，要对这只小猫咪放长线钓大鱼。她这么快就对你言听计从了——只要前期稍微下点功夫，你就能得到一个非常顺从的小性玩具。");
         }
         doNext(secondTalkWithKatherine);
      }
      
      public function donateToCatSlutsYouCatSlut() : void
      {
         clearOutput();
         outputText("你告诉这些猫人，你知道她们这么做只是因为饿了。你说上次她们需要25颗宝石，然后你把手伸进钱袋，抓出了一把宝石。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 25);
         outputText("[pg]伊芙琳走上前，接过了你递出的宝石。她盯着你和宝石看了很久，大概是在判断这会不会是某种奇怪的陷阱或把戏。");
         outputText("[pg][say: 谢谢你，陌生人，] 她说道，你能看出来她并不习惯说这些话。[say: 现在为了确保你不会再遇到什么麻烦，我会让我的一位朋友护送你去你要去的地方。] 当然，这也意味着如果你去找守卫队，有人就能警告其他人躲起来。");
         outputText("[pg]你看到凯瑟琳正要开口，其中一个人却说道：[say: 轮到凯丝了。] 既然有牛奶喝，监视别人是她们大多数人最不想做的事。她转过身，看起来像是要争辩。但她马上闭上了嘴，因为她想起即使这不公平，但这恰好也是她想要的。");
         outputText("[pg]伊芙琳点点头说：[say: 我想也是。记住，下次就轮到雷斯了。] 然后她和其他人就离开了，大概是直奔最近的牛奶摊去了。");
         doNext(donateToCatSlutsYouCatSlutPt2);
      }
      
      public function dateKathBath() : void
      {
         var _loc1_:Boolean = false;
         outputText("[pg]你问凯丝想不想去湖边玩一趟。[pg]");
         outputText("[say: 哎呀，可是我没衣服穿呢，]她用一种俏皮又诱惑的语气说道。");
         if(isAt(0))
         {
            outputText("她从板条箱上跳了下来，胸部也随之一阵波涛汹涌。她");
         }
         else if(isAt(2) || isAt(3))
         {
            outputText("她和你一起走到外面，并且");
         }
         else
         {
            _loc1_ = isAt(1);
         }
         outputText("凑到你跟前，补充道：[say: 但我打赌你早就知道了。我很乐意去裸泳，特别是和你一起。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1225,7);
         doNext(bathTime);
      }
      
      public function dateGotoKaths() : void
      {
         if(isAt(2))
         {
            outputText("[pg]你提出送她回家。凯丝对你笑了笑，但在她踏出门之前，乌尔塔从后面抓住了她，给了这个猫" + catGirl("girl","morph") + "一个大大的拥抱。然后乌尔塔走出来，也给了你一个拥抱。[pg]");
            outputText("当她走回屋里时，乌尔塔说道，[say: 你们要互相照顾——而且别做我不会做的事。]");
         }
         else if(isAt(3))
         {
            outputText("[pg]你必须等凯丝清理干净，但她尽量加快速度。你坐在床沿，揉着乌尔塔的后颈。乌尔塔呻吟了一声，平躺在精液坑里，说道，[say: 谢谢你[name]，我会没事的。我现在真的很舒服。][pg]");
            outputText("当凯丝找到最后一件衣服时，你听到了乌尔塔轻柔的鼾声。你和凯丝蹑手蹑脚地走出去，让乌尔塔好好休息。");
         }
         else
         {
            outputText("[pg]你问凯丝想不想回她家。[pg]");
            outputText("她喝下最后一口饮料，回答道，[say: 嗯……我希望你已经有了什么计划。最好是些下流的计划。]");
         }
         doNext(takeKathHome);
      }
      
      public function dateGotoBar() : void
      {
         if(isAt(2))
         {
            outputText("[pg]你提出带凯丝回湿身婊酒馆。凯丝对你笑了笑，但在她踏出门之前，乌尔塔从后面抓住了她，给了这个猫" + catGirl("girl","morph") + "一个大大的拥抱。然后乌尔塔走出来，也给了你一个拥抱。[pg]");
            outputText("当她走回屋里时，乌尔塔说道，[say: 你们要互相照顾——而且别做我不会做的事。]");
         }
         else if(isAt(3))
         {
            outputText("[pg]你必须等凯丝清理干净，但她尽量加快速度。你坐在床沿，揉着乌尔塔的后颈。乌尔塔呻吟了一声，平躺在精液坑里，说道，[say: 谢谢你[name]，我会没事的。我现在真的很舒服。][pg]");
            outputText("当凯丝找到最后一件衣服时，你听到了乌尔塔轻柔的鼾声。你和凯丝蹑手蹑脚地走出去，让乌尔塔好好休息。");
         }
         else
         {
            outputText("[pg]你问凯丝想不想溜达回酒馆。[pg]");
            outputText("她说道，[say: 我们在这里也能做些有趣的事。]还没等你回答，她就跳进了你的怀里，说道，[say: 当然，我敢肯定你提议去那里时，心里一定盘算着什么有趣的事。" + (pregSize() == 0 ? " 还是说你只是打算把我灌醉，好对我为所欲为？" : "") + "]");
         }
         doNext(takeKathToTheBar);
      }
      
      public function cumQ() : Number
      {
         var _loc1_:Number = 40 * Math.min(168,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1218) + 10) / 24;
         if(get_ballSize() <= 0)
         {
            _loc1_ *= 0.75 + 0.25 * -get_ballSize();
         }
         else
         {
            _loc1_ *= get_ballSize();
         }
         return _loc1_ + 300;
      }
      
      public function cockWidth() : Number
      {
         if(hasDogCock())
         {
            return 1.5;
         }
         return 1;
      }
      
      public function cockType(param1:String = undefined, param2:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "犬科";
         }
         if(param2 == null)
         {
            param2 = "猫科";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1216) == 0)
         {
            return param1;
         }
         return param2;
      }
      
      public function cockMultiple(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,399) <= 1)
         {
            return param1;
         }
         return param2;
      }
      
      public function cockArea() : Number
      {
         return cockWidth() * get_cockLength();
      }
      
      public function cockAdj() : String
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,400))
         {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               return "小小的";
            case 6:
            case 7:
               return " ";
            case 8:
            case 9:
            case 10:
               return "可观的";
            case 11:
            case 12:
            case 13:
            case 14:
               return "大的";
            case 15:
            case 16:
            case 17:
            case 18:
               return "巨大的";
            default:
               return "庞大的";
         }
      }
      
      public function clothesLowerChoice(param1:String, param2:String, param3:String, param4:String, param5:String) : String
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222))
         {
            case 2:
               return param2;
            case 4:
               return param3;
            case 8:
               return param4;
            case 16:
               return param5;
            case 32:
               if(canWearMiniSkirt())
               {
                  return param2;
               }
               break;
            case 64:
               return param2;
         }
         return param1;
      }
      
      public function clothesChoice(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : String
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222))
         {
            case 4:
               return param2;
            case 8:
               return param3;
            case 16:
               return param4;
            case 32:
               return param5;
            case 64:
               return param6;
            default:
               return param1;
         }
      }
      
      public function clothes() : void
      {
         var _loc1_:Boolean = isMilky();
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1222))
         {
            case 1:
               outputText("她穿着一套带有一些锁子甲补丁的皮甲，里面是一条合身的紧身裤和一件束腰外衣" + (hasCock() ? "，紧身程度刚好能让人看出她是个双性人" : "") + "。她的一侧臀部挂着一把带鞘的阔剑——没什么花哨的，但显然做工精良，随时可以使用。另一侧臀部挂着她的“说服者”，一根用皮革包裹的木棍。" + (_loc1_ ? " 当她靠近时，你能闻到空气中淡淡的奶香味。" : ""));
               break;
            case 2:
               outputText("她穿着一件干净、颜色迷人的衬衫，");
               if(get_breasts().get_cupSize() < 5)
               {
                  outputText("胸部紧得恰到好处，既能凸显她的乳房，又不会显得太刻意。");
               }
               else
               {
                  outputText("紧绷着，勉强包裹住她丰满的乳房。");
               }
               if(_loc1_)
               {
                  outputText("由于她丰满的乳房漏奶，衬衫有点湿润。");
               }
               outputText("腰部以下，她穿着一条配套的及膝裙。" + (hasCock() ? skirtDescription() : ""));
               break;
            case 4:
               outputText("她自豪地穿着你给她的半透明紧身衣。它贴合曲线的面料将她柔软身体的每一寸都展现出来，同时在技术上保持了体面。");
               if(_loc1_)
               {
                  outputText("由于她丰满的乳房漏奶，胸部的面料有点湿润，甚至比其他部分更透明。");
               }
               break;
            case 8:
               outputText("她自豪地穿着你给她的舞会礼服。亮片紧身胸衣吸引了人们对她胸部的注意力，而及地的裙摆" + (hasCock() ? "完全掩盖了她男性的特征，并" : "") + "将视线吸引到她的臀部。");
               if(_loc1_)
               {
                  outputText("尽管加了一些额外的吸水垫，但由于她丰满的乳房漏奶，胸部的面料还是有点湿润。");
               }
               break;
            case 16:
               outputText("她自豪地穿着你给她的蜘蛛丝长袍。柔软的面料以一种令人愉悦的方式垂在她的身上。面料边缘的符文将你的视线吸引到凯丝的身体上。");
               if(_loc1_)
               {
                  outputText("胸部的面料吸走了凯丝大量的乳汁，湿润的丝绸以一种极其迷人的方式紧贴着她的乳房。");
               }
               break;
            case 32:
               outputText("她穿着你给她的紧身抹胸，这件衣服");
               tightTopDescption();
               outputText((_loc1_ ? "，薄薄的布料因为胸部漏出的乳汁而有些湿润" : "") + "。");
               if(canWearMiniSkirt())
               {
                  outputText("腰部以下，她穿着一条紧身短裤，" + (hasCock() ? "几乎无法掩盖她那不淑女的凸起。" : "紧到足以向任何路人证明她确实是个淑女。"));
               }
               else
               {
                  outputText("腰部以下，她穿着一条配套的及膝裙。" + (hasCock() ? skirtDescription() : ""));
               }
               break;
            case 64:
               outputText("她穿着你给她的那套暴露的白色护士服。衣服露出了她的腹部，展示着她紧致的腹肌。上衣");
               tightTopDescption();
               outputText((_loc1_ ? "，白色的布料因为胸部漏出的乳汁而有些湿润" : "") + "。");
               if(canWearMiniSkirt())
               {
                  outputText("腰部以下，她穿着一条紧身的白色迷你裙，" + (hasCock() ? "几乎无法掩盖她那不淑女的凸起。" : "如果她迈大步，就会向路人露出内裤。"));
               }
               else
               {
                  outputText("腰部以下，她穿着一条配套的白色及膝裙。" + (hasCock() ? skirtDescription() : ""));
               }
               outputText("这套衣服，以及凯丝本人，都配上了一顶可爱的小白帽，戴在她毛茸茸的黑色耳朵之间。");
               break;
            default:
               outputText("她穿着饱经风霜、有些破旧、明显是二手货的衣服，包括一件太大的衬衫和一条非常紧的短裤。");
         }
      }
      
      public function catMorphIntr() : void
      {
         outputText("[pg]喝精修女斯库拉在这里，显然是在任务间隙休息。回想起你上次参与的“任务”，你的手不自觉地摸到了从那个奇怪的双性猫人那里得到的银铃铛。斯库拉也许能帮你再次找到她。");
      }
      
      public function catGirl(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1224) == 0 && !get_noFur())
         {
            return param2;
         }
         return param1;
      }
      
      public function canWearMiniSkirt() : Boolean
      {
         if(get_cockLength() <= 8)
         {
            return get_ballSize() < 3;
         }
         return false;
      }
      
      public function bedroomBondage() : void
      {
         var _loc1_:* = null as Player;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as String;
         clearOutput();
         if(doneSubmissive(2))
         {
            outputText("你走到凯瑟琳的衣柜前，很快就找到了你要找的东西。你手里拿着丝巾，走回凯丝身边。她脸上挂着灿烂的笑容，当你靠近时，她转过身背对着你，走得很慢，你肯定能追上她。[pg]");
            outputText("当你抓住她，把她的手臂反锁在背后时，她假装挣扎，即兴表演了一段小角色扮演，说道：[say:" + clothesChoice("嘿！我知道我在酒吧里对你抛媚眼了，但你觉得我是什么样的女孩？","求求你——我只是个舞女，我在街那头的俱乐部工作！","哦不，是个流氓！求求你别伤害我，我只是刚从舞会回家。","我警告你——我是学院的魔法师，如果你不放手，我就要对你用魔法了。","嘿！我知道我在酒吧里对你抛媚眼了，但你觉得我是什么样的女孩？","不，求求你！我在医院工作，我照顾病人！") + "]你笑着绑住你顺从的小猫——看来她很喜欢这个小游戏。[pg]");
         }
         else
         {
            outputText("你给了凯瑟琳一个快速的吻，告诉她在这里等着，你有个主意。你穿梭在特尔阿德雷的街道上，寻找众多出售性玩具和其他卧室用品的商人之一。[pg]");
            outputText("在离凯丝家不远的地方，你找到了一家卖你需要的东西的商店。你挑了几条丝巾，迅速付钱给商人，然后回到凯丝家。她正坐在床沿上，但你一回来她就跳了起来。[pg]");
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 40);
            outputText("[say:怎么了，" + playerText() + "？]她问道，耳朵转向你。[pg]");
            outputText("你没有回答，而是走到她面前，把她转过身，将她的手臂反锁在背后。[pg]");
            outputText("[say:哦！" + playerText() + "——你在干什么？][pg]");
            outputText("你开始用一条丝巾把她的手腕绑在一起。凯丝扭动着身体，但她并没有真的想逃跑。她的尾巴来回甩动，拍打着你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "腿") + "，所以她绝对很兴奋。[pg]");
         }
         outputText("你把她推倒在床上，让她仰面躺下" + clothesLowerChoice("。没费多大劲就把她的裤子和内裤脱了下来","，掀起她的裙子，脱下她的内裤","，你的手指很快就在她紧身衣的胯部找到了那个隐藏的裂口","，掀起她的裙子，脱下她的内裤","，解开她长袍的下摆，帮凯丝脱下内裤") + "。她还在调皮地挣扎，但你很快就把她的双腿绑在了床架的两侧。如果她不是一个像这样劈叉的猫" + catGirl("娘","形态") + "，这姿势可能会有些不舒服。凯瑟琳显然并不介意，随着她因兴奋而涨红，你能感觉到热量" + catGirl("从她的皮肤","透过她的皮毛") + "散发出来。最后，你解开了她的手腕，但只是为了把它们重新绑在床头上。[pg]");
         outputText("你花了一点时间欣赏眼前的景象。凯瑟琳呈大字型躺在床上，她的双腿和臀部赤裸着" + (hasCock() ? "，她坚挺的肉棒" + cockMultiple("","s") + "直指天花板" : "") + "，她的小穴湿润而闪闪发光。" + clothesChoice("在她的衬衫里","透过她薄薄的紧身衣","在她优雅连衣裙的刺绣下","在她丝绸长袍的褶皱里","只被她紧身的抹胸遮掩着","只被那件暴露的白色护士服遮掩着") + "，你可以看到她的胸部起伏，她的乳头顶着布料。");
         if(doneSubmissive(2))
         {
            outputText("你看着凯丝假装挣扎的样子，咧嘴笑了。你知道这是她最喜欢的卧室游戏之一。[pg]");
            outputText("凯丝保持着她的角色设定，喘着气说，[say: " + clothesChoice("我带你回家并不意味着我第一次约会就会上床。你看起来是个不错的" + get_player().mf("小伙子","姑娘") + "，我们谈谈这个，好吗？","我只是为了钱才扭屁股的，[mister]。我真的不是那种荡妇。请放我走，我……我会给你我下一场演出的免费门票！","不，不，不。我想遇到一位" + get_player().mf("绅士","淑女") + "。像你这样的流氓，你绝对不能成为我的第一个！","别这样——我可以教你一个法术来发泄，我可以出钱让别人陪你睡，只要别——呃——操我。","我带你回家并不意味着我第一次约会就会上床。你看起来是个不错的[guy]，我们谈谈这个，好吗？","我知道人们说如果你找不到约会对象就去找个护士，但他们还是希望你约我出去。我是一个非常调皮的护士，但我确实期待一点浪漫。") + "][pg]");
         }
         else
         {
            outputText("如果凯丝还没有被这样绑起来的癖好，你打算给她培养一个。[pg]");
         }
         outputText("你笑着朝她的" + (hasCock() ? "肉棒" + cockMultiple("","s") : "阴蒂") + "吹气，这让凯丝在束缚中绷紧了身体。你告诉她，她应该考虑一下自己的处境。她的手脚都被绑在自己的床上，只有你能帮她达到高潮。你抓住她的尾巴，开始轻轻抚摸它的底部。凯丝扭动着臀部，发出咕噜声。然后你停下来，转而抚摸她仍然被遮盖的乳房，并给了她一个吻。你问她，完全任你摆布的感觉如何。[pg]");
         if(doneSubmissive(2))
         {
            outputText("[say: " + clothesChoice("哦，" + get_player().mf("先生","小姐") + "——感觉真好。我从不在第一次约会时和别人上床，但我想我会为你破例。","好吧，好吧！" + (get_player().hasCock() && pregSize() == 0 ? "只要别让我怀孕就行。我还得能绕着那根钢管转，不然我会丢了工作的。" : "我绕着那根钢管转的时候总是很饥渴——也许你能帮我发泄一下。" + (pregSize() == 0 ? " 只要别让任何男人操我，好吗？" : "")),"放开我！我生来就是为了和" + get_player().mf("老爷和绅士","男爵夫人和淑女") + "上床的。像你这样肮脏的流氓——哈！——绝对不可能让我感觉这么好。","这不公平，当我这么饥渴的时候，我的魔法就不起作用了。我想我别无选择，我任你摆布。所以请帮我发泄出来。如果你让我感觉舒服，我就不会报复你。","哦，[mister]——感觉真好。我从不在第一次约会时和别人上床，但我想我会为你破例。","嗯，你抓到我了。好吧，性感尤物，让我们看看你是不是和我一样擅长“指检”。") + "]");
         }
         else
         {
            outputText("凯丝只是叹了口气。她的瞳孔完全放大了，你怀疑在这一切结束之前，你是否还能从她嘴里听到任何连贯的话。");
         }
         outputText("[pg]起初你几乎没有碰到她的" + (hasCock() ? "肉棒" + cockMultiple("","s") + "或" : "") + "小穴。相反，你通过抚摸她的乳房，用手滑过她的肚子和大腿来挑逗她。凯丝在原地扭动，床架发出嘎吱声，但丝绸围巾足够结实，能把她绑住。[pg]");
         outputText("当你终于又回到朝她的" + (hasCock() ? "肉棒" + cockMultiple("","s") : "阴蒂") + "吹气时，凯丝开始乞求更多。你停下一切动作，坐在她旁边的床上。你抚摸着她的耳朵，告诉她她打断了你的注意力——你甚至不记得你刚才在做什么了。凯丝呜咽着咬住了自己的舌头。在给了她另一个快速的吻之后，你重新开始。[pg]");
         outputText("这一次对凯丝来说更难熬了。当你开始朝她的" + (hasCock() ? "肉棒" + cockMultiple("","s") + "吹气时，你看到前列腺液从龟头" + cockMultiple("","s") : "阴蒂吹气时，你看到淫液从她的小穴") + "像喷泉一样渗出。" + (hasCock() ? "你可以通过观察她的肉结" + cockMultiple("","s") + "的膨胀和收缩来测量她的脉搏。" : "") + "凯瑟琳一定很喜欢被绑起来——她已经如此接近高潮，以至于当你开始按摩" + (hasCock() ? "她肉结的底部" + cockMultiple("时，它膨胀变硬","s时，它们膨胀变硬") : "她的内阴唇时，她的双腿开始颤抖") + "，几乎是立刻就有了反应。[pg]");
         outputText("你再次放慢节奏，在凯瑟琳耳边低语，说你不会玩弄她的" + (hasCock() ? "肉棒" + cockMultiple("","s") + (hasBalls() ? "，她的蛋蛋" : "") + "或她的" : "") + "小穴。你要通过让她用其他方式高潮来证明她有多喜欢这样。她呜咽着，你看到她的眼角泛起了泪花。[pg]");
         outputText("你回到她的耳朵，开始用手指挑逗它们。" + (hasCock() ? "随着每一次心跳，她的肉棒" + cockMultiple("","s") + "都会跳动，但她并没有高潮" : "她每一次呼吸，你都能听到她的小穴滴下淫液落在床单上") + "。你转而揉捏她的乳头，凯丝发出了一声低沉的呻吟。");
         if(get_breasts().lactating())
         {
            outputText("没过多久，" + clothesChoice("她的衬衫","她紧身衣的上半部分","她连衣裙的紧身胸衣","她长袍的上半部分","她的抹胸","她的护士服") + "就被浓郁香甜的乳汁浸透了，并且");
         }
         else
         {
            outputText("到现在为止");
         }
         outputText("她的" + (hasCock() ? "肉棒" + cockMultiple("被","s被") : "小穴被") + "从上到下涂满了一层厚厚的" + (hasCock() ? "前列腺" : "淫") + "液。" + (hasCock() ? "" + cockMultiple("它继续像一座慵懒的火山一样渗漏","它们继续像慵懒的火山一样渗漏") : "") + "。[pg]");
         outputText("如果她的耳朵不行，她的乳房也不起作用，你知道凯丝身体上有一个部位绝对能让她爆发。你抓住她的尾巴开始抚摸它。当你揉捏根部附近的肌肉时，凯丝的臀部猛地向上挺起，你听到" + (hasCock() ? "一声像是一桶水倒在木地板上的声音。她射出的精液" + cockMultiple("如此有力，以至于它击中了天花板并像精液喷洒系统一样四处飞溅","s如此有力，以至于它们击中了天花板并像精液喷洒系统一样四处飞溅") : "一声尖叫，开始时很尖锐，然后超出了人类听觉的范围") + "。[pg]");
         outputText((hasCock() ? "又射了几次才排空凯瑟琳的" + (hasBalls() ? ballAdj() + "蛋蛋" : "不自然的前列腺") + "。结束时，整个公寓都浸泡在精液中" : "凯丝又经历了数次高潮，直到精疲力竭。结束时，床单都被浸透了") + "，凯丝像个疯子一样喘着气，笑着。" + (hasCock() ? "她的身体正处于从天花板滴落的精液雨下，从头到脚都被涂满了。" : "") + "当她恢复到足以保持清醒时，她看着你说");
         if(doneSubmissive(2))
         {
            outputText("[say: " + clothesChoice("哦，宝贝！从来没有人让我这样高潮过。给我几分钟恢复一下。我想报答你，你真是个宝贝。","太棒了。你想要一份工作吗？因为如果我把这个加入我的表演，我每场演出能得到更多的宝石。","你赢了，你这个流氓。你证明了你的观点，你强迫我高潮了。如果你现在给我松绑，一切都会被原谅。我必须承认你在做爱艺术上有些技巧。","我确实答应过如果你让我感觉舒服就不报复，不是吗？我想你得到了你想要的。现在放我走，我得为了明天清理一下。","哦，宝贝！从来没有人让我这样高潮过。给我几分钟恢复一下。我想报答你，你真是个宝贝。","可惜结束了。有没有想过成为专业人士？你来医院，我们给你一件这样可爱的小衣服。有很多病人、医生和护士都需要一些缓解。") + "]");
         }
         else
         {
            outputText("[say: 哦，" + playerText() + "，那太不可思议了。我太……精疲力竭了。让我起来，我会努力找点力气为你做点什么。]");
         }
         var _loc2_:int = get_player().cockThatFits(70);
         if(get_player().hasCock() && _loc2_ > -1)
         {
            _loc3_ = int(get_player().cocks[_loc2_].cockLength);
            outputText("你跨坐在凯丝身上，问她为什么觉得你会停下来？你才刚刚帮她热身完呢。现在她已经准备好享用主菜了。她瞪大了眼睛，拉扯着围巾，但根本无处可逃。[pg]");
            outputText("你在床上调整好姿势，将" + (int(get_player().cocks.length) > 1 ? "你的一根肉棒" : "你的肉棒") + "对准了凯丝的阴缝。" + (hasCock() ? "当你插进她体内时，她的精液还在滴到你的背上。" : "") + "她湿得一塌糊涂，小穴在你面前自动敞开，" + (hasCock() ? "简直就像是在嫉妒她男性那一面所受到的待遇一样" : "尽管她摇着头，却还在乞求更多") + "。[pg]");
            outputText("和凯瑟琳不同，你还没高潮过，你的" + (int(get_player().cocks.length) > 1 ? "肉棒们" : "肉棒") + "正渴望着释放。你抚摸着她");
            if(pregSize() == 0)
            {
               outputText("平坦的小腹，问她想把你的种子播在哪里。[pg]");
               if(doneSubmissive(2))
               {
                  outputText("[say: " + clothesChoice("这不就是你一直想要的吗？你想搞大一个在酒吧里找到的蠢荡妇的肚子。好吧，反正我也阻止不了你，那就尽情干吧，种马！","操！你会毁了一切的。俱乐部里的所有人都会看到我那又大又圆的肚子，我只能一直端饮料直到生下来为止。但既然我阻止不了你，那我就好好享受吧。","哦，不！你要把一个私生子射进我肚子里了。哦，我的人生要完蛋了，为什么这感觉这么爽？","嗯，我想我的学生们要亲身体验一下关于怀孕和婴儿的知识了。来吧，在我肚子里放个小徒弟！","这不就是你一直想要的吗？你想搞大一个在酒吧里找到的蠢荡妇的肚子。好吧，反正我也阻止不了你，那就尽情干吧，种马！","哦，是的！医院里所有的女孩都会嫉妒死我的。我都等不及看所有的医生为了我怀孕的骚穴争风吃醋了。除非你想占有我？每天，每夜——我不在乎，只要给我更多这个就行！") + "]");
               }
               else
               {
                  outputText("[say: 哦，是的！操我！请射在里面！我太需要了，]她哀求道。");
               }
            }
            else
            {
               outputText("怀孕的肚子，问她是不是经常这样。[pg]");
               outputText("她的臀部猛烈地挺动，口水从嘴角流下。");
               if(doneSubmissive(2))
               {
                  outputText("[say: " + clothesChoice("你知道我经常这样，猛男。我喜欢被搞大肚子，然后挺着大肚子在镇上游行。我现在去酒吧肯定不是为了喝酒。妈妈","不，不。这是个意外。为了在俱乐部的工作，我必须保持身材。但既然我已经这么大了，请再往我里面射点精液吧。也许这有助于消除妊娠纹。妈妈","呃！我子宫里孕育的是一个高贵的婴儿，但为什么我希望它是你的？哦，我希望我的孩子能学会像你一样做爱，而不是像他父亲那样。请不要停，妈妈","是的，我经常这样。为塔楼培养更多的学徒是我的职责。等我子宫空了你一定要来找我，我想怀上你的孩子。现在填满我，妈妈","你知道我经常这样，猛男。我喜欢被搞大肚子，然后挺着大肚子在镇上游行。我现在去酒吧肯定不是为了喝酒。妈妈","嗯，医生和男护士们可不会让我们空着肚子太久。像我这样火辣的小妖精会打促排卵针，生出一窝窝的新护士！在填满我之前，你敢停下来试试，妈妈") + " 需要很多精液！]");
               }
               else
               {
                  outputText("[say: 哦，" + playerText() + "，现在别停。我需要那精液。我需要你滚烫的爱液射进我体内。]");
               }
            }
            outputText("你的猫科爱人已经湿透了，准备就绪，你毫不犹豫地开始猛烈抽插她火热的小穴。凯丝变得疯狂起来，即使被绑着，她也尽一切努力试图让你的肉棒插得更深一点。[pg]");
            outputText("你尽可能深地插进去，" + (_loc3_ < 15 ? "试图让她和你一样舒服" : "用龟头摩擦着凯丝的子宫颈，让她爽得翻白眼") + "。当你射精时，");
            if(get_player().cumQ() <= 500)
            {
               outputText("你感觉到一小滩精液在你的龟头周围形成。" + (pregSize() == 0 ? " 你确信你能感觉到凯丝的子宫颈吸入了一些精液。" : ""));
            }
            else if(get_player().cumQ() <= 1500)
            {
               outputText("你的精液从肉棒中喷涌而出，开始在凯瑟琳体内汇聚。" + (pregSize() == 0 ? "她的肚子开始隆起，你轻轻揉了揉她原本平坦的肚子，凯丝发出咕噜咕噜的满足声。" : "由于她的子宫颈挡住了去路，你大部分的精液都从凯丝的小穴里冒了出来。"));
            }
            else if(get_player().cumQ() <= 3000)
            {
               outputText("你的精液像河流一样流入凯丝体内。");
               if(pregSize() == 0)
               {
                  outputText("她的子宫颈被强行撑开");
                  if(_loc3_ < 15)
                  {
                     outputText("随着你的精液毫无阻碍地流入她的子宫，你阴茎周围的压力减轻了");
                  }
                  else
                  {
                     outputText("随着你阴茎的" + (_loc3_ == 15 ? "顶端" : "前" + (_loc3_ - 15) + "英寸") + "滑入她的子宫，你又往她体内深入了一些");
                  }
                  outputText("。凯丝的肚子变得越来越大，承受着你所能给予的所有精液，直到她看起来像怀孕五个月一样，肚脐也凸了出来，这表明她再也装不下了");
               }
               else
               {
                  outputText("由于她的子宫里已经孕育着一个孩子，所以首当其冲的是她的阴道。在你的注视下，随着她产道上端被你" + (get_player().balls > 0 ? "睾丸" : "前列腺") + "喷涌而出的精液强行撑开，在她的阴茎" + cockMultiple("","s") + "上方形成了一个坚硬的小凸起");
               }
               outputText("。剩下的精液顺着你的肉棒流回，倾泻在床上。");
            }
            else
            {
               outputText("你那" + (get_player().balls > 0 ? "过度活跃的睾丸" : "不自然的摄护腺") + "，在这个世界奇异魔法的驱动下，将不可思议的巨量精液注入了你的猫" + catGirl("娘","人") + "情人体内。凯丝肺里的空气被挤了出去，");
               if(pregSize() == 0)
               {
                  outputText("一瞬间，她的子宫颈被强行撑开。");
                  if(_loc3_ < 15)
                  {
                     outputText("随着你的种子毫无阻碍地流入她的子宫，你肉棒周围的压力减轻了");
                  }
                  else
                  {
                     outputText("你又往里挺进了一点，你肉棒的" + (_loc3_ == 15 ? "前端" : "前" + (_loc3_ - 15) + "英寸") + "滑入了她的子宫");
                  }
                  outputText("。凯丝的肚子越来越大，承受着你给她的所有精液，飞速地膨胀着。她很快看起来就像怀孕五六个月了，肚脐也凸了出来。但你的精液" + (get_player().balls > 0 ? "工厂们还没" : "工厂还没") + "完工。[pg]");
                  outputText("你的" + (get_player().balls > 0 ? "睾丸射出" : "摄护腺射出") + "压力更大的精液，克服了凯丝饱受折磨的肚子带来的所有阻力，将她紧绷的肚子撑得像怀孕九个月一样。");
                  if(get_player().cor < 25)
                  {
                     outputText("你希望这么大的量不会对凯瑟琳造成任何永久性的伤害。");
                  }
                  else if(get_player().cor < 75)
                  {
                     outputText("你希望凯丝和你一样享受这一切。");
                  }
                  else
                  {
                     outputText("在内心深处，你想看看你能把你的小猫咪的肚子撑到什么程度。更重要的是，你想看看你能不能让她对这种被填满的感觉上瘾。");
                  }
                  outputText("[pg]凯丝呜咽着，但她的尾巴却在摇晃。你很确定她很享受——退一步说，就算她不享受，她也无能为力。");
               }
               else
               {
                  outputText("她产道顶端在重压下膨胀起来。不知为何，她的子宫颈依然紧闭，保护着她的后代。感觉就像你把肉棒插进了一个瀑布里。一股强大的精液流向后喷射，重重地打在你的腹股沟上，几乎逼得你拔出来。");
               }
            }
            outputText("[pg]结束后，你瘫倒在你的猫" + catGirl("娘","人") + "情人身上。你感到彻底精疲力尽，你享受着你的精液从她体内慢慢漏出的感觉。[pg]");
            outputText("当你躺在那里时，你" + (hasCock() ? "意识到你们俩之间有" + cockMultiple("一个滚烫坚硬的凸起","一对滚烫坚硬的凸起") + "。" : "注意到凯丝的乳头再次变得坚挺。") + "看来凯丝非常享受，以至于她" + (hasCock() ? "想要再来一回合" : "需要再高潮一次") + "。你不想让她失望，于是你从她身上滚下来，开始" + (hasCock() ? "抚摸她的肉棒" + cockMultiple("和她的结","和结") : "按摩她跳动的阴蒂") + "。[pg]");
            outputText("凯丝意识到你要做什么，开始虚弱地乞求——[say: 我不知道我还能不能行。让我休息一分钟，求你了。][pg]");
            if(get_player().cor < 25)
            {
               outputText("你考虑了一下，但你知道凯丝最终会爱上它的。" + (doneSubmissive(2) ? "" : " 显然，被绑起来、让你掌控一切让她很兴奋。") + "你对她笑了笑，继续温柔地抚摸她");
            }
            else if(get_player().cor < 75)
            {
               outputText("她当然能行。而且她会喜欢的。你正要向她证明这一点");
            }
            else
            {
               outputText("她以为这是怎么回事？她被绑在床上，你" + (hasCock() ? "手里握着她的肉棒" + cockMultiple("","s") : "手指夹着她的阴蒂") + "。如果你想让她高潮，她就得高潮！你停顿了一下，给了凯丝一个邪恶的微笑，然后你开始认真地" + (hasCock() ? "套弄她的肉棒" + cockMultiple("","s") : "揉弄她的阴蒂") + "");
            }
            outputText("。凯丝呻吟着试图逃跑，但她的尾巴左右扫动，向你表明她再高兴不过了。当她的臀部离开床面时，你" + (hasCock() ? "把她的肉棒" + cockMultiple("","") + "对准天花板，她再次被自己的精液淋了一身" : "凑过去给了她一个长长的深吻") + "。[pg]");
            outputText("在那场马拉松之后，凯瑟琳太累了，一两分钟内她就开始打呼噜了。你轻轻地解开她绑在床上的手臂，没有吵醒她。毕竟猫咪需要午睡。她看起来很满足，于是你让她泡在自己的精液里，自己离开了。");
         }
         else if(!hasCock())
         {
            outputText("你抚摸着她的头发，告诉她不用担心。你把她绑起来玩得很开心。凯丝笑着说她迫不及待想再试一次，只要你想，随时都可以。不过，在那场马拉松之后，凯瑟琳太累了，一两分钟内就开始打呼噜了。你轻轻地解开她绑在床上的手臂，没有吵醒她。毕竟猫咪需要午睡。她看起来如此满足，你决定不去打扰她，自己离开了。");
         }
         else
         {
            _loc4_ = get_player().hasVagina() && get_cockNumber() > 1;
            outputText("你跨坐在凯丝身上，问她为什么觉得你会停下来？你才刚刚帮她热身完呢。现在她已经准备好享用主菜了。她瞪大了眼睛，拉扯着围巾，但根本无处可逃。[pg]");
            outputText("你将自己置于凯瑟琳上方，慢慢地将你的" + (get_player().hasVagina() ? "小穴" : "屁股") + "降到她的" + (_loc4_ ? "上半根肉棒上。片刻之后，你感觉到她的下半根肉棒开始强行挤进你的屁股" : "肉棒上") + "。凯丝发出一声猫叫，因为她过度敏感的肉棒" + (_loc4_ ? "消失在你的洞里" : "消失在你的小穴里") + "。[pg]");
            if(doneSubmissive(2))
            {
               outputText("[say: " + clothesChoice("哦，" + get_player().mf("先生","女士") + "，我再也不用去那家酒吧搭讪了。这是一见钟情的性爱，但求你了，别再来了。","不！我不能再来一次了！我会一直为你跳舞，但别这样，否则我一个星期都走不直路了。","呃，放开我，你这个流氓！我已经承认我很享受这个了——我还要受多少苦？我的肉棒" + cockMultiple("","们") + "不会为你硬太久的。","两次？不，" + get_player().mf("先生","女士") + "，求你了——我们可以再见面，我很乐意，但我明天早上还有课要教。","哦，[mister]，我再也不用去那家酒吧搭讪了。这是一见钟情的性爱，但求你了，别再来了。","我真的很累了，我们明天再来第二回合好吗？求你了，求求你了？我是医疗专业人士，我可以告诉你，肉棒不应该这么快再次射精。") + "]");
            }
            else
            {
               outputText("[say: " + playerText() + "，求你别这样。别这么快。我射不出来了。让我恢复一下，不然我的" + (hasBalls() ? "蛋蛋" : "前列腺") + "都要翻过来了。]");
            }
            outputText("[pg]你吻住她，让她停止了喋喋不休，同时让你的" + (_loc4_ ? "小穴吞下她的肉棒" : (get_player().hasVagina() ? "小穴" : "直肠") + "吞下她的肉棒") + "。凯丝的臀部无力地试图往里顶得更深，但她那滚烫坚硬的肉结" + (_loc4_ ? "阻止了" : "阻止了") + "她。[pg]");
            outputText("你前后摇晃着，享受着凯瑟琳的" + (_loc4_ ? "肉棒在你体内互相摩擦" : "肉棒探索你深处") + "的感觉。你的双手在凯丝的乳房上游走，那件被精液浸透的" + clothesChoice("衬衫","紧身衣","连衣裙","长袍","抹胸","护士服") + "几乎掩盖不住她" + get_breasts().adj() + "的双峰。[pg]");
            outputText("凯丝很快就忘记了她的抱怨，开始试图在你身下扭动。虽然有些困难，但你还是把自己从她的肉棒" + (_loc4_ ? "上" : "上") + "拔了出来，并提醒她，只有你才能决定她什么时候可以高潮。凯丝发出了你听过的最饥渴的呻吟，但当你再次俯下身时，你发现她的臀部已经僵住了。[pg]");
            _loc5_ = hasBalls() ? "把手向上滑，抓住她" + ballAdj() + "的蛋蛋。它们" : "把手指探进她的括约肌，开始按摩她的前列腺。它";
            outputText("当你在凯瑟琳的肉结" + (_loc4_ ? "上" : "上") + "摇晃时，你开始感觉到那种熟悉的悸动，你决定是时候让这只小猫射精了。你把手伸到她的肉棒下面，首先用手掌轻轻摩擦她的小穴。然后你" + _loc5_ + "滚烫——可能正在加班加点地重建凯丝的精液储备。[pg]");
            outputText("当你的手指熟练地按摩她的精液" + (hasBalls() ? "工厂" : "工厂") + "时，你天真地问：[say: 你说你不能再高潮了。现在还是这种感觉吗，还是说我终究是对的？] 凯丝似乎迷失在了梦境中，所以你尝试了另一种方法，大喊一声命令：[say: 凯丝——射出来！][pg]");
            outputText("听到这话，她的身体僵硬了，她的" + (hasBalls() ? "蛋蛋试图缩回体内" : "前列腺收缩起来") + "。你决定让事情变得更激烈一点，你" + (hasBalls() ? "把她的蛋蛋固定在原位" : "捏住她前列腺的一端") + "，让她更难把最新的一发精液泵出来。凯丝的头开始左右摇晃，你感觉到她的" + (hasBalls() ? "蛋蛋" : "前列腺") + "收缩得更厉害了，因为她正在努力争取填满你的机会。[pg]");
            orgasm();
            outputText("你的肚子开始因为凯丝滚烫的精液而膨胀，但因为她今晚已经清空过一次她的" + (hasBalls() ? "蛋蛋" : "前列腺") + "了，所以你并没有像往常一样被完全填满。凯丝像离开水的鱼一样喘息着，你用尽最后的力气解开她，把她的手按在你的" + (cumQ() > 500 ? "肿胀的" : "") + "肚子上。[pg]");
            outputText("[say: 好烫，]她说道。凯丝一边揉着你的肚子一边喃喃自语，[say: 这肯定都是我刚弄出来的。你肚子里装满了我的新鲜滚烫的精液。]你吻了她，告诉她你真的很享受这种感觉。如果以后有寒冷的夜晚，你一定要记住这个保暖的妙招。[pg]");
            outputText("凯瑟琳咯咯笑着，把你拉进怀里。她太累了，不到一两分钟就开始打呼噜了。她看起来很满足，所以你让她泡在自己精液的池子里，自己离开了。");
            get_player().slimeFeed();
         }
         get_player().orgasm("Generic");
         orgasm();
         var _loc6_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,403,FlagDict_Impl_.arrayReadInt(_loc6_,403) + 1);
         addSubmissive(2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimePenetratedNormalEnd() : void
      {
         clearOutput();
         outputText("你把凯丝逼到了高潮的边缘。她动弹不得，双腿僵硬，需要你帮她完成。你陪她多玩了一会儿，渴望给她更多来自埋在你小穴里的肉棒的美妙感觉。[pg]");
         outputText("你看着她扩张且充满情欲的瞳孔，决定是时候了。你保持你的小穴和凯瑟琳的龟头结完全静止，用你的手让她高潮。你" + (hasBalls() ? "比以前更用力地抚摸她的蛋蛋，同时你的" : "将另一根手指滑入她的屁股，开始比以前更有力地挤奶她的前列腺。你的") + "另一只手将她膨胀的龟头结" + cockMultiple("","") + "从一边滚到另一边。[pg]");
         outputText("凯丝翻了翻白眼，你感觉到她的" + (hasBalls() ? "蛋蛋向上猛拉" : "前列腺在你的手指下跳动") + "。你将你的下体压在凯丝龟头结的前面，知道第一波精液马上就要来了。[pg]");
         outputText("你的性感小猫没有让你失望。你的" + (get_player().isPregnant() ? "小穴" : "子宫颈") + "被强行撑开，汹涌的精液流入你的体内，" + (get_player().isPregnant() ? "从你封闭的子宫颈反弹，从你的下体喷涌而出" : "填满你的子宫" + fertileText("并寻找你的卵子","")) + cockMultiple("。","。她的另一根阴茎将精液喷射到溪流中，使你的大腿沾满精液。") + "[pg]");
         if(cumQ() <= 500)
         {
            outputText("喷射了几次后，凯丝瘫软在你的怀里。你");
         }
         else if(cumQ() > 500)
         {
            outputText("凯丝在你的怀里瘫软下来，在给你注入了大量精液后" + (get_player().isPregnant() ? "" : "，这让你看起来像怀孕四个月了") + "。你");
         }
         else if(cumQ() > 1500)
         {
            outputText("凯丝的" + (hasBalls() ? "蛋蛋一直" : "前列腺一直") + "在收缩，将一桶桶的精液强行注入你的小穴。回流的精液" + cockMultiple("","与她自由的肉棒喷出的溪流混合，并") + "温暖了你周围的水" + (get_player().isPregnant() ? "" : "，你的肚子被撑大，直到你看起来像怀孕七个月了。当她最后一波精液被强行注入时，你的肚脐凸了出来") + "。喷发结束后，你");
         }
         else if(cumQ() > 3000)
         {
            outputText("你必须紧紧抱住凯丝，以免被她高压的精液冲走。" + (get_player().isPregnant() ? "" : "凯丝巨大的精液量似乎在瞬间填满了你的子宫。然后它进一步撑大了你的肚子，将你肺部的空气挤出。片刻之间，你看起来像怀孕九个月了，你的肚脐变成了一个坚硬的凸起，摩擦着凯瑟琳肚皮上的" + catGirl("皮肤","皮毛") + "。") + "惊人数量的凯丝的精液从你的小穴溢出" + cockMultiple("","，与她自由的肉棒喷出的溪流混合") + "。它不仅温暖了你周围的溪流，还让它感觉有点粘稠，并染红了下游的水。喷发结束后，你");
         }
         outputText("带着你精疲力尽的" + (get_player().cor < 75 ? "女朋友" : "性玩具") + "走到岸边，等她恢复过来。[pg]");
         if(get_player().hasCock())
         {
            outputText("直到你瘫倒在沙地上，你才意识到你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "一枪未发。冰冷的水和缺乏刺激导致只有你的女性部分高潮了。你" + (get_player().balls > 0 ? "摸了摸你的蛋蛋。虽然它们" : "插入一根手指并按摩你的前列腺。虽然它") + "仍然充满精液，但你没有特别想要发泄的欲望。真奇怪。也许将来你会找到某种方法来利用这种奇怪的情况。");
         }
         outputText("凯瑟琳发出呼噜声，紧紧抱住你，问道，[say: 你喜欢吗？你觉得也很棒吗？][pg]");
         outputText("你向她保证这对你来说也很好" + (get_player().hasCock() ? "，尽管你没有高潮" : "") + "，然后你们都穿好衣服，回到特尔阿德雷。");
         if(!hasAlready(256))
         {
            outputText("看起来凯丝很享受她的沐浴，所以你怀疑如果你再邀请她来湖边，她一定会欣然接受。");
         }
         get_player().slimeFeed();
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         orgasm();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         experience(256);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimePenetratedDenial() : void
      {
         clearOutput();
         outputText("你用手指缓慢而小心地挤压你体内刚过龟头结的肉棒。你能感觉到她的" + (hasBalls() ? "蛋蛋在抽搐，但它们没有发射" : "前列腺在抽搐，但它没有发射") + "。[pg]");
         outputText("你开始从凯丝身边抽离，让她的肉棒从你的小穴里滑出，泡进冰冷的河水中。她呜咽着哀求道：[say:我快到了。求你了" + (playerMaster() ? "[master]" : "") + "！][pg]");
         outputText("你忍不住笑了。这画面太美了。你的爱人绝望地渴求着，而你掌握着她高潮的钥匙，她马上就会意识到你并不打算使用它。[pg]");
         outputText("[say:求求你，求求你，求求你，]她只能说出这句话。透过" + (hasBalls() ? "你的手，你能感觉到她的蛋蛋又降下去了" : "你的手指，你能感觉到她前列腺周围的肌肉变软了") + "。冰冷的溪水很快就起了作用。她的结" + cockMultiple("消退了","消退了") + "，她的肉棒" + cockMultiple("开始","开始") + "萎缩。凯丝交叉着双腿，紧紧抓住她的" + (hasBalls() ? "蛋蛋" : "胯部") + "，拼命地揉搓着，试图消除高潮被打断的痛苦。[pg]");
         outputText("你抓住她的肩膀，告诉她你决定让她再等等。不过别担心，很快你就会告诉她可以射了。你想让她为你积攒一大股精液。[pg]");
         outputText("你把凯丝从溪水里拖出来，然后“帮助”她，" + (hasBalls() ? "用手揉搓她" + ballAdj() + "的蛋蛋。你觉得它们比以前重了一点。你继续揉搓" : "把手指滑回她的屁股里。你觉得她的前列腺比以前稍微重了一点。你继续按摩") + "，直到她再次" + cockMultiple("勃起","勃起") + "，然后你停了下来。凯丝沮丧地用拳头砸向地面，发出呜咽声。[pg]");
         outputText("你按住她，直到她控制住自己的欲望，然后你们穿好衣服，回到特尔阿德雷。直到能看见城门时，你才" + clothesLowerChoice("拉下她的裤子","把手伸进她的裙底","把手滑进她的紧身衣里，释放出她的肉棒","把手伸进她的裙底","把手伸进她的长袍里，释放出她的肉棒") + "。你用另一只手抓住凯瑟琳的腰，开始疯狂地" + cockMultiple("套弄她的肉棒","交替套弄她的肉棒") + "。[pg]");
         outputText("她对这突如其来的刺激发出呜咽和喘息。几秒钟内，她的肉棒" + cockMultiple("就","就") + "硬得像石头一样。你在她耳边低语，现在她可以为你射精了。凯丝的膝盖再次锁紧，你把她的肉棒对准了沙漠的沙地。");
         if(cumQ() <= 500)
         {
            outputText("射了几股之后，凯丝瘫软在你的怀里。当她结束时，在她面前几英尺的地方有一小滩混着沙子的精液。");
         }
         else if(cumQ() <= 1500)
         {
            outputText("凯丝瘫软在你的怀里，但她的肉棒继续排放着积攒已久的精液。无数股精液溅在前面的地上，形成了一大滩精液。");
         }
         else if(cumQ() <= 3000)
         {
            outputText("凯丝的" + (hasBalls() ? "蛋蛋不断收缩" : "前列腺似乎能产生源源不断的精液") + "，将一桶桶精液喷射到干燥的沙漠沙地上。当她结束时，精液在沙地上形成了一个水池，水池正慢慢地向低处流去。");
         }
         else
         {
            outputText("凯瑟琳的精液不断地从她的龟头" + cockMultiple("流出，形成一道连续的水流","流出，形成两道连续的水流") + "。你大概可以让她去特尔阿德雷的消防队工作，不需要任何培训。当她终于结束时，干燥的沙地上流淌着一条精液河。");
         }
         outputText("[pg]剩下的路你只好抱着她走，但当你们到达城门时，凯瑟琳给了你一个吻，并告诉你她希望你很快再来看她。你咧嘴一笑，摇了摇头——这个女孩真是欲求不满。[pg]");
         dynStats(DynStat.Lust(10 + get_player().lib / 20));
         orgasm();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         experience(256);
         addSubmissive(4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimePenetrated() : void
      {
         var _loc1_:* = null as IMap;
         if(!get_player().hasVagina())
         {
            if(get_player().hasCock())
            {
               outputText("[pg]凯丝的" + cockMultiple("肉棒滑过","肉棒滑过") + (get_player().hasTailInsteadOfLegs() ? "你长满鳞片的臀部" : "你的双腿之间") + "，留下了一道道前列腺液的痕迹" + (get_player().hasTailInsteadOfLegs() ? "。" : "在你的大腿内侧。"));
               if(get_player().balls > 0)
               {
                  outputText("" + (get_player().hasTailInsteadOfLegs() ? "她的手顺着你的身体滑下，手指缠绕着" : "她来回滑动着她的肉棒" + cockMultiple("","") + "，摩擦着" + cockMultiple("它","它们") + "贴着") + "你的阴囊，用她锋利的" + catGirl("指甲","爪子") + "挑逗你，直到你的肉棒" + (int(get_player().cocks.length) > 1 ? "完全" : "完全") + "勃起。");
               }
            }
            else
            {
               outputText("[pg]被" + (get_player().hasTailInsteadOfLegs() ? "你[if (isNaga) {蛇|下半}]身没有生殖器的事实逼疯了，你用尾巴的上半部分摩擦着" : "你平坦、几乎没有特征的胯部传来的感觉逼疯了，你合拢双腿夹住") + "凯丝的" + cockMultiple("肉棒","肉棒") + "。");
            }
            outputText("她发出低沉的呼噜声并亲吻你，然后" + (get_player().hasTailInsteadOfLegs() ? "她的手在你的臀部上下滑动，挠着你的鳞片" : "她扭动臀部，将她的肉棒" + cockMultiple("","") + "挤进你的双腿之间") + "，同时她的尾巴在你的臀部周围甩动，几乎就像在寻找你的屁眼一样。[pg]");
            outputText("凯丝紧紧贴着你，她那");
            if(get_furry() && !get_noFur())
            {
               outputText("光滑的皮毛摩擦着你的" + (get_player().hasFur() ? "皮毛" : "皮肤"));
            }
            else
            {
               outputText("湿润的皮肤" + (get_player().hasFur() ? "摩擦着你的皮毛" : "滑过你的身体"));
            }
            outputText("的感觉让你的感官超载。" + (get_player().cor < 75 ? "你闭上眼睛，沉浸在感官的愉悦中，忘记了冰冷的湖水。" : "你反抗的能力消失了，你诅咒自己缺乏计划——你太兴奋了，以至于无法利用凯丝。事实上，她才是占据主动的那个人！") + "[pg]");
            outputText("有一段时间，你和凯丝只是享受着水流缓慢漂过的感觉和缓慢而稳定的摩擦。当你身体的每一部分似乎都充满了欲望时，你感觉到你的屁眼开始放松，你的身体乞求着有什么东西来填满你饥渴的洞穴。");
            outputText("[pg]然后" + cockMultiple("她那根可爱滚烫的肉棒消失了","她那些可爱滚烫的肉棒消失了") + (get_player().hasTailInsteadOfLegs() ? "，不再摩擦你的尾巴" : "从你的双腿之间") + "。你睁开眼睛，正好看到凯丝紧紧地抱住你。她从背后抱住你，她" + cockMultiple("","上面的") + "肉棒的顶端抵住了你的肛门。[pg]");
            if(hasDogCock())
            {
               outputText("凯瑟琳开始以小圆圈的动作扭动她的臀部和肉棒" + cockMultiple("","") + "。渐渐地，你的后庭被强行撑开，最后凯丝把龟头塞了进去。她毫不浪费时间，收紧了对你的抓握，把你的身体往后拉，强行将" + cockMultiple("她的肉棒","她的一根肉棒") + "深深地插入你的结肠");
               if(get_cockNumber() > 1)
               {
                  outputText("同时另一根继续摩擦" + (get_player().hasTailInsteadOfLegs() ? "你的鳞片" : "你的双腿之间"));
               }
            }
            else
            {
               outputText("凯瑟琳一定感觉到了你的放松。她把她猫咪肉棒狭窄的顶端抵在你的括约肌上。在一次缓慢的抽插中，她把它插进了你的体内。你能感觉到每一个小倒刺在挠你屁眼内部的感觉");
            }
            outputText("。");
            outputText("[pg]你太放松、太饥渴了，直到你感觉到她部分膨胀的结抵住你的臀瓣，你才意识到她的整根肉棒都插进去了。");
            get_player().buttChange(cockArea(),true,true,false);
            outputText("[pg]你意识到有真正的危险。你乞求凯丝不要在野外让你成结——谁知道会有什么东西发现你们。你感觉到她发出低沉的呼噜声，她抽插了几下。她低语道[say:我会尽力的]，然后再次将她的肉棒插进你体内。[pg]");
            outputText("她的手交替着挑逗你坚挺的乳头和抚摸" + (get_player().hasTailInsteadOfLegs() ? "你小腹的下半部分" : "你的腹股沟") + "。有时她用指尖挑逗你的尿道口。没过多久，你就完全忘记了住在湖里的怪物。[pg]");
            outputText("她把肉棒抽出来，直到只有龟头留在你体内，然后她再次强行将它滚烫的长度插入你的结肠" + cockType("","它微小的倒刺挑逗着你的直肠") + "。当她抓住你的臀部并用力往后拉时，你意识到她没有更用力操你的唯一原因是，每次抽插她都需要推开水流。[pg]");
            outputText("当凯丝插到底时，她的结抵住了你的括约肌，你开始对在这里被绑在你最喜欢的猫" + catGirl("女孩","兽人") + "身上的风险感到兴奋。你能通过她的肉棒" + cockMultiple("","") + "感觉到她砰砰的心跳，知道她快要高潮了。[pg]");
            outputText("当凯瑟琳的肉棒抽出时，你稍微挤压了一下它，试图让她在你体内多留一会儿。她喘着粗气，你感觉到她的双腿僵硬了。滚烫的精液流满了你的直肠，这要归功于凯丝的");
            if(hasBalls())
            {
               outputText(ballAdj() + (get_ballSize() <= 3 && cumQ() > 500 ? "但多产的" : "") + "蛋蛋");
            }
            else
            {
               outputText("过度活跃的前列腺");
            }
            outputText("。凯丝试图将她的结强行塞进去，但你的屁股已经被她的精液塞满了。[pg]");
            outputText("当凯丝的精液一次次强行穿过你的括约肌时，那种悸动的感觉让你达到了高潮。");
            if(cumQ() > 500)
            {
               outputText("你感觉到你的肚子在膨胀，肠道被撑开，以容纳凯丝射入你体内的精液。");
               if(cumQ() > 1500)
               {
                  outputText("这很痛苦，而且似乎过了很久，你才感觉到凯丝的精液开始从她肉棒的两侧漏出来。");
               }
            }
            if(get_player().hasCock())
            {
               outputText("[pg]");
               if(get_player().cumQ() <= 500)
               {
                  outputText("你自己的肉棒" + cockMultiple("射出","射出") + "几股精液到河里。" + (get_player().cumQ() + 500 < cumQ() ? " 与凯丝过量的精液相比，你的表现似乎有些相形见绌。" : ""));
               }
               else if(get_player().cumQ() <= 1500)
               {
                  outputText("一股又一股的精液从你自己的肉棒" + cockMultiple("","") + "喷射到河里。这让你感到有些虚弱。");
               }
               else if(get_player().cumQ() <= 3000)
               {
                  outputText("你的精液从你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "中喷射而出，力度之大以至于" + (int(get_player().cocks.length) > 1 ? "你的肉棒像失控的消防水带一样来回弹跳。" : "你的阴茎像失控的消防水带一样来回弹跳。"));
               }
               else
               {
                  outputText("你那过度生产的" + (get_player().balls > 0 ? "睾丸超常发挥了" : "前列腺超常发挥了") + "。没有屁股、嘴巴或阴道来容纳" + (get_player().balls > 0 ? "它们的洪流，它们只是不断地" : "它的洪流，它只是不断地") + "射精和收缩。你的肉棒" + (int(get_player().cocks.length) > 1 ? "猛烈地抽动和弹跳" : "猛烈地抽动和弹跳") + "，以至于你的肚子之后可能会留下一些瘀伤。你周围的水变暖了，下游的颜色也明显改变了。你不得不怀疑每次射精会消耗多少魔力。");
               }
            }
            outputText("[pg]她的结压在你的屁股上，但无论她怎么努力，凯丝就是无法把它塞进去。她沮丧地哭泣，无法与她的伴侣结合。精疲力竭的她，让手臂从你的臀部滑落，把头靠在你的肩膀上。[pg]");
            outputText("没有结来固定，凯丝的肉棒滑了出来，让她大量的精液从你大张的屁眼里流出。当精液云慢慢被冲到下游时，你感觉到温暖消散了。很快它就会与污染湖泊的所有其他液体汇合。[pg]");
            outputText("[say: " + (playerMaster() ? "谢谢你[master]，如果我有点得意忘形，我很抱歉" : "谢谢[name]，你是最棒的") + "，]她发出呼噜声。你把你的性感小猫拖回河岸，并收拾好你的衣服，以防你需要逃跑。" + (get_player().hasCock() ? "" : " 尽管你没有天赋，但你感到很满足。") + " 凯丝非常放松，她甚至可以被称为液体");
            if(hasAlready(256))
            {
               outputText("而且你知道她总是愿意再去湖边一趟。");
            }
            else
            {
               outputText("，所以你怀疑这些“洗澡”总是会很受欢迎。");
            }
            get_player().slimeFeed();
            get_player().orgasm("Dick");
            orgasm();
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
            experience(256);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]作为回应，你转动臀部，让凯丝的" + cockMultiple("","最上面的") + "肉棒沉入你的肉褶中。她发出呼噜声，试图把她的肉棒插得更深，但你按住她，对她微笑。你完全打算在这次小小的郊游中掌握主动权，而凯丝必须乖乖听话。[pg]");
            outputText("她用充满欲望的大眼睛看着你，试图再次推进。你的手指在凯瑟琳滚烫的小穴上抚摸了几下，让她变得更加配合。她向后仰起头，喘着粗气。你等到她的膝盖锁死，然后你抓住她的臀部，慢慢地将你的小穴套在她跳动的肉棒上。");
            get_player().cuntChange(cockArea(),true,true,false);
            outputText("[pg]既然她配合了，你决定是时候奖励凯瑟琳了。你把注意力转向她的胸部。在这冰冷的水中，她" + get_breasts().adj() + "的乳房湿滑、坚挺，顶端有着变硬的乳头。你捏了捏她的乳头，凯丝的尾巴缠绕在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴" : "你的一条腿") + "上，乞求更多。[pg]");
            if(get_player().hasCock())
            {
               outputText("冰冷的溪流甚至开始影响你充满欲望的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "。就好像你的身体明白，现在你的小穴将承担所有的工作。你的男性器官" + (int(get_player().cocks.length) > 1 ? "疲软了" : "疲软了") + "，因为越来越多的血液被转移到你爱之隧道的肌肉" + (get_player().isPregnant() ? "" : "，你充满雌激素的卵巢和你肥沃子宫的内壁") + "。[pg]");
            }
            outputText("凯丝紧绷起臀部的肌肉，她的肉棒在你体内以一种令人愉悦的方式" + cockMultiple("摇晃和移动","摇晃和移动") + "。作为回应，你的手指在" + cockMultiple("她的肉棒","她的每根肉棒") + "根部游走，然后" + (hasBalls() ? "托起她" + ballAdj() + "的蛋蛋。当你用手指揉搓它们并轻轻将它们从她身体上拉开时，凯瑟琳叹了口气。" : "将你的食指和中指滑入她的屁股。你找到了她塞满精液的前列腺，开始按摩那个火热的凸起。你发誓你几乎能感觉到它在回应中积聚了更多的精液。"));
            outputText("你的另一只手紧紧握住" + cockMultiple("凯丝沉重的龟头结","凯丝对准你小穴的沉重龟头结") + "。在这荒郊野外，你可不能让她把你锁住，尽管那可能很有趣。你深深地吻了凯丝，开始用你的阴蒂摩擦她的龟头结顶部。她的舌头潜入你的嘴里，似乎也迫不及待地想把你拉得更近。[pg]");
            outputText("有你的手挡着，她的肉棒无法再深入。你试图通过收缩肌肉来补偿她，轻轻地挤奶她" + cockAdj() + "的勃起。凯瑟琳仰起头，开始乞求。[say: 哦，求你了，" + playerText() + "！求你放开我，让我操你。我需要插得更深。] 她的肉棒" + cockMultiple("在","在") + "跳动，并向你的小穴" + cockMultiple("里","和溪流中") + "漏出大团温暖的预精液。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) >= 4 && (get_player().isCorruptEnough(75) || get_player().hasPerk(PerkLib.Pervert) && get_player().isCorruptEnough(33) || get_player().hasPerk(PerkLib.Sadist) || doneSubmissive(4)))
            {
               outputText("[pg]你舔了舔嘴唇。你可怜的小荡妇发情得连动都动不了了。她离高潮只有一步之遥，但她自己却无法达到。你可以像这样抱她几个小时，可能会把她逼疯。或者你可以抽身离开，让她体验一下欲求不满的痛苦。");
               menu();
               addButton(0,"让她高潮",bathTimePenetratedNormalEnd);
               addButton(1,"拒绝",bathTimePenetratedDenial);
            }
            else
            {
               doNext(bathTimePenetratedNormalEnd);
            }
         }
      }
      
      public function bathTimeFuckKath() : void
      {
         var _loc1_:String = hasCock() ? "自己的" : "";
         var _loc2_:String = int(get_player().cocks.length) > 1 ? "" : "";
         var _loc3_:Boolean = hasCock() && get_player().hasVagina();
         var _loc4_:String = hasCock() ? "她发出呼噜声，试图把她的肉棒插得更深，但你有其他计划。[pg]" : "";
         outputText("[pg]这种感觉导致你的" + _loc1_ + "肉棒" + _loc2_ + "戳到了凯丝的肚子" + (_loc3_ ? "，你转动臀部，让凯丝的肉棒沉入你的褶皱中" : "") + "。" + _loc4_);
         outputText("你把凯丝转过来，把你的肉棒滑入她的双腿之间，依偎在她热气腾腾的大腿内侧。她试图转过身来，但你抓住了她的臀部，并且");
         if(get_player().cor < 75)
         {
            outputText("让她知道现在你要主导");
         }
         else
         {
            outputText("明确表示你是这里的负责人");
         }
         outputText("。一旦凯丝停止反抗，你便将注意力转移到她的胸部。在这冰冷的水中，她那" + get_breasts().adj() + "的乳房滑腻、紧实，顶端还点缀着硬挺的乳头。你捏了捏她的乳头，凯丝的尾巴缠绕在" + (get_player().hasTailInsteadOfLegs() ? "你的尾巴" : "你的一条腿") + "上，乞求着更多。[pg]");
         outputText("冰冷的水流甚至开始影响你那充满欲望的肉棒。在你软下去之前，你将肉棒滑入凯丝火热的小穴。你的阴茎立刻恢复了生机，你的身体为它源源不断地提供着滚烫的血液和滑腻的先流液。[pg]");
         outputText("凯丝收缩着她那翘臀和美妙小穴的肌肉，你享受着每一种感觉，因为你的" + catGirl("","猫科 "));
         if(get_player().cor < 25)
         {
            outputText("伴侣和爱人");
         }
         else if(get_player().cor < 75)
         {
            outputText("伴侣");
         }
         else
         {
            outputText("性玩具");
         }
         outputText("正尽她最大的努力，只用她的爱液通道让你高潮。[pg]");
         outputText((get_player().balls > 0 ? "你的睾丸已经缩到了极限，你决定是时候了。" : "") + "你拉起凯丝的手，将它们放在她的头上，让她十指交叉。你向她耳语，告诉她必须保持完全静止。然后你的手顺着她的身体滑下，抚过她柔软的" + catGirl("肌肤","黑毛") + "。接着你按摩她的后颈，爱抚她的乳房，抚摸她的肚子，然后再次牢牢抓住她匀称的臀部。[pg]");
         outputText("凯丝发出喵喵的叫声和呼噜声，渴望你开始操她。你轻咬她的耳朵，开始在她的阴道里缓慢地抽插。这个节奏不足以满足你们任何一个人，但你保持着缓慢的节奏，看着凯丝的指关节因为努力不让自己移动而收紧。[pg]");
         outputText("她阴道里的肌肉尽其所能地诱惑你，但你一直等到凯丝开始乞求你的肉棒。[say: 求求你" + (playerMaster() ? " [master]" : "") + "——占有我，使用我，操我！]她呻吟着。然后她一遍又一遍地重复着，仿佛这是某种咒语。[pg]");
         if(get_player().cor < 25)
         {
            outputText("你暗自微笑。你已经把你的爱人逼到了边缘，而她还没有高潮。运气好的话，你会在把精液射进她体内之前，让她体验几次高潮。");
         }
         else if(get_player().cor < 75)
         {
            outputText("这声音真好听。你快要释放自己了，你希望凯丝能和你一样享受这一切。你开始配合她的呼唤来调整你抽插的节奏。");
         }
         else
         {
            outputText("你把你的荡妇完全掌控在手中。现在她愿意为了再深入一英寸的肉棒做任何事。当你梦想着所有可以利用这个顺从的婊子的方法时，你感觉到你的肉棒又喷出了一团先流液。");
         }
         outputText("[pg]当你再也无法忍受时，你开始像野兽一样发情。突然改变的节奏让凯丝措手不及，当她的第一次高潮袭来时，你感觉到她的身体紧绷。一旦她的腿软了，只有你的手能固定住她的臀部。你利用了这一点，以更快的速度将她拉向你。水提供了一些缓冲，但这仍然是一次猛烈、粗暴的性爱。[pg]");
         outputText("然后你感觉到了，");
         if(get_player().balls == 0)
         {
            outputText("在你的身体深处，你那扭曲的前列腺开始收缩");
         }
         else
         {
            outputText("你的");
            if(get_player().ballSize >= 18)
            {
               outputText("超大的");
            }
            else if(get_player().ballSize >= 12)
            {
               outputText("西瓜大小的");
            }
            else if(get_player().ballSize >= 5)
            {
               outputText("哈密瓜大小的");
            }
            outputText("蛋蛋开始收缩");
         }
         outputText("第一股滚烫的精液强行射入了凯瑟琳的小穴。当她感觉到你的种子填满她时，她的性爱咒语戛然而止。[pg]");
         if(get_player().cumQ() <= 500)
         {
            outputText("你站在那里，你的肉棒又向她的小穴射了几股精液。凯丝的阴道彻底地榨干了你，你感觉到她因为第二次高潮而颤抖。当一切结束后，你感觉到滚烫的液体渗出，温暖了溪流。");
         }
         else if(get_player().cumQ() <= 1500)
         {
            outputText("一股又一股的精液射入凯丝等待着的小穴。这让你感到有些虚弱，但凯丝似乎很高兴。她的身体抽搐着，迎来了第二次高潮。相当一部分精子一定强行进入了更深处，因为你能感觉到她的肚子微微隆起。");
         }
         else
         {
            if(get_player().cumQ() > 3000)
            {
               outputText("你那过度活跃的" + (get_player().balls > 0 ? "睾丸超常发挥" : "前列腺超常发挥") + "。");
            }
            outputText("你的精液从肉棒中猛烈地喷射而出，你不得不紧紧抓住凯丝的臀部，以免你们俩被冲开。你的精液猛烈地冲击着凯丝的子宫颈");
            if(pregSize() > 0)
            {
               outputText("，但由于无处可去，它撑开了她的阴道，然后用温暖粘稠的精液涂满了" + (get_player().hasTailInsteadOfLegs() ? "她的双腿和你的尾巴" : "你和她的双腿") + "");
            }
            else
            {
               outputText("并强行将其撑开。你的手能感觉到凯丝臀部上的肉在拉伸和拉扯，试图为她迅速膨胀的肚子提供更多的皮肤");
            }
            outputText("。凯丝因为被这么多精液填满的感觉而发出喵喵的叫声。" + (get_player().cumQ() > 3000 ? "你周围的水变暖了，下游的颜色也明显改变了。你不得不怀疑每次射精到底消耗了多少魔力。" : ""));
         }
         outputText("[pg]直到你冷得无法在水里待下去，你才站在那里，双手抚摸着凯瑟琳");
         if(pregSize() > 0)
         {
            outputText("怀孕的");
         }
         else if(get_player().cumQ() >= 1500)
         {
            outputText("塞满精液的");
         }
         else
         {
            outputText("紧绷的");
         }
         outputText("肚子，享受着她的小穴包裹着你慢慢变软的肉棒的感觉。结束后，你把凯瑟琳拉到岸边，她满足地对你微笑。[pg]");
         outputText("在走回特尔阿德雷的漫长路途中，她调皮地问你什么时候再带她去游泳。[pg]");
         get_player().orgasm("Dick");
         orgasm();
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,403,FlagDict_Impl_.arrayReadInt(_loc5_,403) + 1);
         experience(256);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimeFrustrated() : void
      {
         clearOutput();
         outputText("凯丝紧紧地抱住你，你感觉到她的手指滑过你的" + (get_player().hasVagina() ? "阴蒂" : "乳头") + "。你也投桃报李，渴望取悦你那淫荡的猫" + catGirl("娘","兽人") + "。[pg]");
         outputText("你们俩互相摩擦着乳房，手指飞快地动作，看谁能先让对方高潮。[pg]");
         outputText("几秒钟变成了几分钟，似乎没有尽头。你意识到冰冷的溪流阻碍了你们的努力。你太冷了，几乎感觉不到凯丝的身体紧贴着你。她的手指还在揉搓你" + (get_player().hasVagina() ? "的阴蒂，但即使是那团神经" : "，但你每一寸皮肤") + "都变得麻木了。你自己的手也开始抽筋，你确信它还在摩擦她小穴的唯一原因是她的大腿把它固定在原位。[pg]");
         outputText("你看着凯丝的脸，看到她眼中的欲望——破天荒地——消退了，她的嘴唇开始发紫。从她的表情来看，你猜你的情况也好不到哪里去。[pg]");
         outputText("当你把自己和凯丝从冰冷的水中拖出来并用毛巾擦干时，任何做爱的想法都被抛到了一边，取而代之的是对温暖的渴望。你用双臂环抱住凯丝，你们俩瑟瑟发抖，直到你们再次感觉到自己的手指和脚趾。[pg]");
         outputText("太阳已经在天空中移动了一段不小的距离，你决定尽管这次探险不尽如人意，但也只能先带凯丝回特尔阿德雷，然后再返回营地。[pg]");
         dynStats(DynStat.Lust(20 + get_player().lib / 20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimeCentaurRide() : void
      {
         outputText("[pg]凯丝抱了你一会儿，只是慢慢地在你身上摩擦，在你的嘴唇和脖子上留下一个又一个吻。最后她松开手，沿着你的侧腹走去。她停在你身边，抚摸着你的侧面，然后跳上了你的背。她环抱住你的躯干，" + (get_player().hasBreasts() ? "开始玩弄你的乳房" : "双手抚摸着你充满男子气概的胸膛") + "。凯丝并不满足于此，她开始在你身上摩擦，" + (hasCock() ? "她肉棒的" + cockMultiple("龟头","龟头") : "她的阴部") + "摩擦着如果你是人类的话应该是屁股的地方。作为半人马，那是你脊柱弯曲的敏感部位。她的" + (hasCock() ? "龟头" + cockMultiple("不断","不断") : "腹股沟不断") + "摩擦着那里的小凹陷，产生美妙的感觉，向两个方向传递。在你身体的一端，你的肉棒" + (int(get_player().cocks.length) > 1 ? "变得" : "变得") + "更硬了，在另一端，你仰起头开始呻吟。[pg]");
         outputText("凯瑟琳把一只手放在你的脸颊上，把你的头拉回来深吻。这个角度对你们俩来说都有点困难，所以她松开了你，双手又回去捏你的乳头。凯丝身子前倾，粗糙的舌头开始舔舐你的后颈，让你发狂。[pg]");
         outputText("你能感觉到凯丝的");
         if(hasCock())
         {
            outputText(cockAdj() + "肉棒" + cockMultiple("","") + (hasBalls() ? "和她" + ballAdj() + "的蛋蛋" : "") + "压在你的背上，,");
         }
         else
         {
            outputText("小穴变得越来越湿");
         }
         outputText("随着她越来越接近高潮。与此同时，你自己的肉棒" + (int(get_player().cocks.length) > 1 ? "正" : "正") + "被冷落在冰冷的河水中。你听到一声呼噜声，然后两只温暖的脚合拢在你的" + (int(get_player().cocks.length) > 1 ? "上半部" : "") + "肉棒上。凯丝利用她猫科动物的柔韧性给你做足交，同时她将她的" + (hasCock() ? "肉棒" + cockMultiple("","") : "外阴") + "摩擦着你的脊柱，抚摸着你的胸膛，舔舐着你的脖子。[pg]");
         outputText("凯瑟琳的脚开始快速地摩擦你的" + (int(get_player().cocks.length) > 1 ? "肉棒" : "男子气概") + "；如果不是因为河水，她可能会把你磨破皮。然后你感觉到她的");
         if(hasCock())
         {
            outputText((hasBalls() ? "蛋蛋收缩" : "大腿夹紧") + "，她的肉棒" + cockMultiple("喷射出大量的","喷射出大量的") + "滚烫精液");
         }
         else
         {
            outputText("大腿肌肉紧绷，她的小穴喷出一股滚烫的淫液");
         }
         outputText("喷在你的背上。凯丝的双腿疯狂地抽动着，试图在她耗尽体力之前让你达到高潮。[pg]");
         outputText("她勉强成功了。当她向前瘫倒在你的背上时" + (hasCock() ? "，湿漉漉地拍打在她自己的精液上，" : "") + "她的脚最后一次无力地滑向你" + (int(get_player().cocks.length) > 1 ? "最大的" : "") + "肉棒根部。你离高潮已经很近了，这正是你所需要的。[pg]");
         if(get_player().cumQ() <= 500)
         {
            outputText("你站在那里，你的肉棒" + cockMultiple("射出","射出") + "几股精液落入河中" + (hasCock() && get_player().cumQ() + 500 < cumQ() ? "。与凯丝那夸张的射精量相比，你的表现似乎有些相形见绌" : "") + "。[pg]");
         }
         else if(get_player().cumQ() <= 1500)
         {
            outputText("一股又一股的精液喷射到河里。这让你感到有些虚弱。你向后伸出手，轻轻挠了挠凯丝的耳朵。[pg]");
         }
         else if(get_player().cumQ() <= 3000)
         {
            outputText("你的精液从你的肉棒" + (int(get_player().cocks.length) > 1 ? "中" : "") + "猛烈地喷射而出，以至于你能感觉到它的温度舔舐着你前膝的后部。由于没有任何东西可以容纳" + (int(get_player().cocks.length) > 1 ? "它们，你的肉棒像失控的消防水龙带一样来回弹跳" : "它，你的阴茎像失控的消防水龙带一样来回弹跳") + "。[pg]");
         }
         else
         {
            outputText("你那过度活跃的" + (get_player().balls > 0 ? "睾丸超越了它们自己" : "前列腺超越了它自己") + "。由于没有屁股、嘴巴或阴道来容纳" + (get_player().balls > 0 ? "它们的洪流，它们只是不断地" : "它的洪流，它只是不断地") + "射精和收缩。你的肉棒" + (int(get_player().cocks.length) > 1 ? "猛烈地抽动和弹跳" : "猛烈地抽动和弹跳") + "，以至于你的肚子之后可能会出现一些瘀伤。你周围的水变暖了，下游的颜色也明显改变了。你不得不怀疑每次射精会消耗多少魔力。[pg]");
         }
         outputText("当你从“沐浴”中恢复过来时，你叫醒了凯瑟琳。继续待在这里可能不安全，所以你们俩收拾好东西，开始了返回特尔阿德雷的漫长步行。凯瑟琳在回去的大部分时间里都在微笑和咯咯地笑。");
         if(!hasAlready(256))
         {
            outputText("事实上，她非常享受这次旅行，你有一种感觉，这些“沐浴”将会变得非常受欢迎。");
         }
         get_player().orgasm("Generic");
         orgasm();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         experience(256);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTimeCentaurPenetrated() : void
      {
         outputText("[pg]凯丝抱了你一会儿，只是缓慢地摩擦着，在你的嘴唇和脖子上留下一个又一个吻。最后她松开手，沿着你的侧腹走着，用手指抚摸着你的肌肤。水流阻碍了你的动作，让凯瑟琳占据了优势。现在她是控制节奏的人。她走到你的身后，抚摸着你的尾巴。它自己翘到了半空中，让凯丝知道你的身体有多么渴望这个。[pg]");
         if(hasCock())
         {
            outputText("你能感觉到她的肉棒" + cockMultiple("","") + "在你的大腿内侧滑动，而凯丝的手指则在挑逗你的[vagOrAss]。她一直等到你的双腿开始颤抖，才将" + cockMultiple("","其中一根") + "她那" + cockAdj() + "肉棒" + cockMultiple("","") + "沉入你的[vagOrAss]。");
         }
         else
         {
            outputText("她一直等到你的双腿开始颤抖，才温柔地将手指深深插入你的[vagOrAss]。");
         }
         if(get_player().hasVagina())
         {
            get_player().cuntChange(hasCock() ? cockArea() : 32,true,true,false);
         }
         else
         {
            get_player().buttChange(hasCock() ? cockArea() : 32,true,true,false);
         }
         outputText("[pg]一旦凯瑟琳的" + (hasCock() ? "肉棒" : "拳头") + "进入你的体内，她就停不下来了。她开始猛烈地撞击你，只有她必须推开你们身体之间的水流这一事实，才让她没有弄伤你。你的膝盖开始颤抖，因为凯丝带来了一场野蛮的" + (hasCock() ? "操弄，你以为只有牛头人才能做到" : "拳交，几乎就像她在试图证明她仍然可以操你") + "。也许这条小溪比你最初想象的还要被欲望污染得多。[pg]");
         outputText("她如此沉迷于欲望之中，以至于她不说话也不呻吟，尽管你的呻吟声已经足够你们两个人用了。最后你向前瘫倒，无力阻止她，因为她用最后一次冲刺直捣黄龙，她的" + (hasCock() ? "龟头结" : "手臂") + "沉入你的[vagOrAss]" + (hasCock() ? "" : "一直到手肘") + "。[pg]");
         if(hasCock())
         {
            outputText("随着她的" + (hasBalls() ? ballAdj() + "睾丸排空" : "丰满的前列腺排空") + "到你的体内，你的肚子随着每一次喷射而膨胀");
            if(get_player().hasVagina() && get_player().isPregnant())
            {
               outputText("阴道里，她的精液喷涌在紧闭的子宫颈上。压力如此之大，你能感觉到精液从她的龟头结周围渗出，喷射到你周围的水中。" + (cumQ() > 500 ? " 她的精液压力如此之大，以至于你能感觉到你的肚子上方形成了一个小小的第二个凸起，因为你阴道的最上部被凯丝的精液撑胀了。" : ""));
            }
            else
            {
               if(get_player().hasVagina())
               {
                  outputText("阴道里，她的精液强行进入你的子宫。");
               }
               else
               {
                  outputText("直肠里，她的精液一寸一寸地撑胀你的肠道。");
               }
               if(cumQ() > 500)
               {
                  outputText("你的肚子很快就压在了凉爽的溪床上，被你女朋友的精液撑胀了。" + (cumQ() > 1500 ? " 当凯丝那巨大的睾丸尽力填满她的伴侣时，开始变得有些痛苦。再多一点，你确信你腹部的肌肉就会撑不住了。" : ""));
               }
            }
            if(get_cockNumber() > 1)
            {
               outputText("凯瑟琳的另一根肉棒，仍然在你的双腿之间摩擦，释放了它那部分的精液，在你的肚子上涂上了一层她滚烫的精子。");
            }
         }
         outputText("[pg]你女朋友的");
         if(hasCock())
         {
            outputText("火热肉棒在你体内跳动");
         }
         else
         {
            outputText(get_player().hasVagina() ? "指关节摩擦着你子宫口" : "手指在你肠道深处弯曲");
         }
         outputText("的感觉太强烈了。你喘息着，高潮席卷了你，你的[vagOrAss]紧紧夹住凯丝的" + (hasCock() ? "肉棒，榨出最后几滴精液。" : "前臂。"));
         if(get_player().hasCock())
         {
            if(get_player().cumQ() <= 500)
            {
               outputText("你自己的肉棒" + cockMultiple("射出","射出") + "几股精液到河里。" + (get_player().cumQ() + 500 < cumQ() ? " 与凯丝过量的精液相比，你的表现似乎有些逊色。" : ""));
            }
            else if(get_player().cumQ() <= 1500)
            {
               outputText("一股接一股的精液从你自己的肉棒" + cockMultiple("","") + "喷射到河里。这让你感到有些虚弱。");
            }
            else if(get_player().cumQ() <= 3000)
            {
               outputText("你的精液从你的肉棒" + (int(get_player().cocks.length) > 1 ? "" : "") + "中猛烈射出，你甚至能感觉到它的温度舔舐着你前膝的后部。由于没有任何东西可以容纳" + (int(get_player().cocks.length) > 1 ? "它们，你的肉棒像失控的消防水管一样来回弹跳。" : "它，你的阴茎像失控的消防水管一样来回弹跳。"));
            }
            else
            {
               outputText("你那过度活跃的" + (get_player().balls > 0 ? "睾丸超常发挥" : "前列腺超常发挥") + "。没有屁股、嘴巴或阴道来容纳" + (get_player().balls > 0 ? "它们的洪流，它们只是不断地" : "它的洪流，它只是不断地") + "射精和收缩。你的肉棒" + (int(get_player().cocks.length) > 1 ? "猛烈地抽动和弹跳" : "猛烈地抽动和弹跳") + "，以至于你的肚子之后可能会留下一些瘀伤。你周围的水变暖了，下游的颜色也明显改变了。你不得不怀疑每次射精会消耗多少魔力。");
            }
         }
         if(hasCock())
         {
            outputText("[pg]在射出精液后，凯丝几乎失去了所有的力气，只能用手抓住你的背，让她的头露出水面。[pg]");
            outputText("你知道在制造了那样的喧闹之后留在这里是不明智的。利用你半人马身体固有的力量，你强迫自己重新站起来。挺着装满精液的肚子很难走路；当你不得不爬出河流，水不再支撑你的" + (cumQ() > 500 ? "鼓胀的肚子" : "重量") + "时，就更难了。[pg]");
            outputText("凯瑟琳一点忙也帮不上。她仍然锁在你的[vagOrAss]里，仍然处于高潮后的昏迷状态。你不得不小心翼翼地弯下腰，收集你所有的衣服和装备，以及她的。" + (cumQ() > 500 ? " 每次弯腰，你那塞满的肚子都会发出咕噜声并抱怨。" : "") + "[pg]");
            outputText("直到你们开始走回特尔阿德雷，凯丝的结才终于缩小到足以让你松一口气。你把她拉上前，给她穿上衣服，然后在剩下的回程中，你们互相依偎着。");
         }
         else
         {
            outputText("[pg]在让你高潮后，凯丝把她的手臂从你抽搐的[vagOrAss]中抽出来，在溪流中洗干净后，绕着你的身体走了一圈，给了你一个拥抱。她轻轻地咬了咬你的一个乳头，问道，[say: 我做得好吗？][pg]");
            outputText("你忍不住笑了。你在这里，你的[vagOrAss]仍然因为她刚才热情的拳交而感到刺痛，她还需要问吗？[pg]");
            outputText("你弯下腰，收集你所有的衣服和装备，注意到凯丝穿上衣服时轻快的步伐。有趣的是，即使凯丝没有高潮，她也因为做得好而感到非常高兴，这似乎并不重要——或者也许只是冷水麻木了她饥渴的小穴。[pg]");
         }
         if(!hasAlready(256))
         {
            outputText("事实上，她非常享受这次旅行，你有一种感觉，这些“沐浴”将会变得非常受欢迎。");
         }
         get_player().slimeFeed();
         get_player().orgasm("Generic");
         orgasm();
         get_player().changeFatigue(15);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,403,FlagDict_Impl_.arrayReadInt(_loc1_,403) + 1);
         experience(256);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bathTime() : void
      {
         clearOutput();
         outputText("你不想跳进那被欲望污染的湖水里，但你觉得凯丝需要游个泳。你只是对凯瑟琳笑了笑，然后" + (get_player().hasTailInsteadOfLegs() ? "滑行" : get_player().mf("走","大步走")) + "向最近的一条清澈的山泉。一路上，你依次脱下每件装备和衣服。你能感觉到凯丝的眼睛一路上都在盯着你。[pg]");
         outputText("现在你脱光了衣服，走进冰冷清澈的水中，转过身看到凯瑟琳正疯狂地挣扎着脱掉衣服。她踢掉最后一件衣服，然后眼中带着欲望向你冲来。[pg]");
         outputText("在英格纳姆的猫对水不太感兴趣，但凯丝似乎并不在意。她以优美的弧线从岸边跃起，撞向你，这既是一个飞扑，也是一个拥抱。[pg]");
         outputText("这一下直接把你撞进了水里。水很冷，当你浮出水面呼吸时，旁边是一个咧嘴笑的凯丝。她再次拥抱你，这次很温柔，提供了这冰冷水域中唯一的热源。[pg]");
         get_player().hasGottenWashed();
         outputText("[pg]" + (get_player().balls > 0 ? "你的蛋蛋试图缩回去，你" : "你") + "的乳头变硬了，你能看出来凯丝的也一样。");
         if(hasCock())
         {
            outputText("她的肉棒" + cockMultiple("拒绝软化——它摩擦着","拒绝软化——它们摩擦着"));
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你长满鳞片的下腹部");
            }
            else
            {
               outputText("在你的" + (get_player().isTaur() ? "前" : "") + "腿之间");
            }
            outputText("就像一根烧红的拨火棍。");
         }
         if(get_player().isTaur())
         {
            menu();
            if(get_pc().hasCock())
            {
               addButton(0,"骑乘",bathTimeCentaurRide);
            }
            else
            {
               addButtonDisabled(0,"骑乘","此场景需要你拥有肉棒。");
            }
            addButton(1,"被插入",bathTimeCentaurPenetrated);
         }
         else
         {
            menu();
            if(get_pc().hasCock())
            {
               addButton(0,"插入",bathTimeFuckKath);
            }
            else
            {
               addButtonDisabled(0,"插入","此场景需要你拥有肉棒。");
            }
            if(hasCock())
            {
               addButton(1,"被插入",bathTimePenetrated);
            }
            else
            {
               addButtonDisabled(1,"被插入","此场景需要凯丝拥有肉棒。");
            }
            if(!hasCock() && !get_pc().hasCock())
            {
               menu();
               addButton(0,"继续",bathTimeFrustrated);
            }
         }
      }
      
      public function bargainForKittahKataPussah2() : void
      {
         clearOutput();
         katherineSprite();
         outputText("凯丝的肩膀耷拉下来，重重地坐在一个板条箱上。她抬头看着你，说道：[say: 我加入流浪猫就是为了不用出卖自己。虽然也没多少人想要我。而现在我的“朋友们”为了口牛奶就把我给卖了。] 她吸了吸鼻子，补充道：[say: 我不会反抗的，没意义。你想做什么就做吧。]");
         if(get_player().cor < 25)
         {
            outputText("[pg]这真让你心碎。她现在如此崩溃，你必须想办法帮帮她，想办法让她振作起来。");
         }
         else if(get_player().cor < 75)
         {
            outputText("[pg]你确信现在的凯丝需要一个可以依靠哭泣的肩膀。而你内心更龌龊的那部分，那部分与你下半身紧密相连的欲望，却在低语着脆弱的女孩最爱英雄。");
         }
         else
         {
            outputText("[pg]你曾向自己保证过要对这只小猫咪放长线钓大鱼。你用尽了全身的力气才克制住自己没有撕碎她的衣服，用各种方式强暴她。你的脑海中浮现出她被侵犯的身体蜷缩成一团、沾满你精液的画面。最终你清醒了过来。");
         }
         outputText("当你把手臂搂住她的肩膀时，她紧张了起来。");
         outputText("[pg]你指出你要求的只是和她待一会儿。接着，你问她是否愿意和你一起散散步。你确信你看到街边有一家餐厅，那会是个带她约会的好地方。她的嘴巴张了又合，却说不出话来。她的肚子咕咕叫了起来，试图替她回答。");
         outputText("[pg]她猛地站起身，擦去眼角的泪花。[say: 你真的想带<b>我</b>去约会？]");
         outputText("[pg]你问带一个漂亮女孩出去约会难道犯法吗。你看不见她脸红，但你能感觉到那份温暖" + (get_noFur() ? "在她的脸颊上" : "透过她的毛发传过来") + "。");
         doNext(secondTalkWithKatherine);
      }
      
      public function bargainForKittahKatPussah() : void
      {
         clearOutput();
         outputText("既然性在这片土地上如此普遍，你决定尝试一些在英格纳姆会给你惹上大麻烦的事情。你告诉伊芙琳，你愿意给她们剩下的人一些宝石，以换取和她的一位朋友独处的一点时间。");
         outputText("[pg]伊芙琳的表情没有变化。她身后的猫人们传来一些窃窃私语，于是你继续施压。你扫视着这一小群人，让你的目光在各处停留。那个穿着破烂裙子的年轻女孩在你的注视下退缩了。");
         outputText("[pg]你指着凯瑟琳，拿出25颗宝石。你指出这反正也是她们本来要抢走的数目。这样她们就不必匆忙逃跑了，因为没人会去叫守卫队，也没人会去报案说有盗窃。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 25);
         outputText("[pg]伊芙琳似乎考虑了片刻，然后接过了宝石。她低吼着说利用别人的饥饿来趁火打劫太残忍了，接着她指着凯丝，警告你最好别让她受伤。然后她和其他人就离开了，大概是直奔最近的牛奶摊去了。");
         doNext(bargainForKittahKataPussah2);
      }
      
      public function barKathUrtaLoveAnnounce() : void
      {
         var urtaIsDrunk:Boolean;
         var _g:KatherineThreesome;
         clearOutput();
         outputText("当你走进湿身婊酒馆时，你看到凯丝和乌尔塔一起坐在乌尔塔的桌子旁。凯丝一看到你，就热情地向你招手。[pg]");
         outputText("乌尔塔让你坐在她旁边，凯丝挪了挪位置，这样她就在你的另一边了。[say: 看来你的大计划奏效了，]乌尔塔咧嘴笑着说。[say: 你让我们做爱了，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1233) == 2 ? "见鬼，你还鼓励我们一有机会就做爱！所以" : "所以") + "我们变得亲密也就不足为奇了。][pg]");
         outputText("[say: 非常亲密，]凯丝说着，把她的臀部贴在你的臀部上摩擦。[pg]");
         outputText("[say: 总之，]乌尔塔继续说道，[say: 我们俩依然爱你，毕竟我们是因为你才相遇的。但现在我们也爱上了彼此。我想你肯定早就料到了，所以别装出一副惊讶的样子。][pg]");
         outputText("[say: 你想怎么庆祝？]凯丝问道。你可以看到她们两边都有着相配的" + (hasCock() ? "隆起" : "笑容") + "。她们都用手臂搂住你，故意把乳房贴在你身上。不过嘿，你有什么好抱怨的呢？三人行听起来是个非常不错的主意。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1232,32);
         menu();
         if(get_player().hasCock())
         {
            addNextButton("369",get_telAdre().katherineThreesome.threeSixtyNine);
         }
         if(hasCock())
         {
            addNextButton("被前后夹击",get_telAdre().katherineThreesome.roastYou);
         }
         else
         {
            _g = get_telAdre().katherineThreesome;
            urtaIsDrunk = false;
            addNextButton("观看",function():void
            {
               _g.watch(urtaIsDrunk);
            });
         }
         if(get_player().hasCock() || get_player().hasVagina())
         {
            addNextButton("前后夹击凯丝",get_telAdre().katherineThreesome.spitroastKath);
         }
      }
      
      public function barFirstEncounter() : void
      {
         katherineSprite();
         outputText("[pg]你看到一只熟悉的猫科动物慵懒地坐在其中一张桌子旁。当她看到你时，凯丝跳了起来，差点把饮料洒了，然后扑向你，给了你一个拥抱和一阵亲吻。[pg]");
         outputText("她终于恢复了一些镇定，说道，[say: 我一直在等你出现！感觉这几天发生了很多事情。哦，我真是个笨蛋——我告诉过你我有一套公寓，但我没说在哪里。][pg]");
         outputText("她拿出一把钥匙和一张纸条递给你。[say: 给你。我家的钥匙和路线。请过来看看我，" + playerText() + "，如果你不来，我会很孤独的。][pg]");
         outputText("你笑了，在她的耳后挠了挠，让她带你回到她的桌子旁。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,398,5);
         katherineMenu();
      }
      
      public function barDescription() : void
      {
         outputText("[pg]你看到凯丝独自坐在她常坐的卡座里，喝着" + (pregSize() == 0 ? "看起来像奶油利口酒" : "可能是奶昔") + "的东西。她穿着" + clothesChoice("相配的衬衫和裙子","她那件透明紧身衣","优雅的长裙","她的蜘蛛丝长袍","那件暴露的抹胸","性感的护士服") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1221) < 0 ? "，就像你告诉她的那样。" : "。"));
      }
      
      public function barApproach() : void
      {
         clearOutput();
         katherineSprite();
         outputText("当你靠近时，凯丝坐直了身子，打扮着自己，并且" + clothesChoice("整理她的衬衫","伸展身体以展示紧身衣","整理她的裙子","整理蜘蛛丝长袍","抚平抹胸","整理她可爱的护士帽") + "，当你走到她的桌子旁时。" + (isMilky() ? " 她的手下意识地移到她的乳房上，你注意到她乳头上的湿斑。" : "") + "[pg]");
         outputText("当你坐下时，凯丝问你想做什么，并喝了一口她的饮料。");
         katherineMenu();
      }
      
      public function ballAdj() : String
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,402))
         {
            case 0:
            case 1:
               return "小";
            case 2:
            case 3:
               return "大";
            case 4:
            case 5:
               return "巨大";
            case 6:
            case 7:
               return "粗大";
            default:
               return "庞大";
         }
      }
      
      public function askKatherineAboutVagrancy() : void
      {
         clearOutput();
         outputText("你让凯瑟琳向你解释一下，她和她的朋友们怎么会成为流浪汉；城里有那么多空房子，你觉得他们应该很容易就能找到住处。[pg]");
         outputText("凯瑟琳皱起眉头。[say:这是政府的主意。基本上，他们收回了所有空置的房屋，除非你能证明自己赚的钱足够交税并买下租约，否则你进不去。没钱，就没房子——这就是为什么我们，以及许多像我们一样的人，流落街头。守卫队花在敲打流浪汉脑袋、把我们从完好无损的空房子里赶出来的时间，比做任何有用的事情都要多。][pg]");
         outputText("你忍不住想，这其中有多少是事实，又有多少是偏见。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1226,1);
         talkToKatherine(askKatherineAboutVagrancy);
      }
      
      public function askKatherineAboutLoveAndLust() : void
      {
         clearOutput();
         outputText("你尽量委婉地措辞，询问凯瑟琳为什么想再次见你，特别是考虑到你们相遇时的情况。[pg]");
         outputText("这只" + (hasCock() ? "长着狗鸡巴的双性猫" : "猫娘") + "脸红了，尴尬地用一只脚在地上紧张地蹭着。[say: 嗯，我……呃……说实话？你基本上是我唯一做过爱的人。][pg]");
         outputText("你的目光不自觉地被她的胯部吸引，忍不住问她的犬科性器官是不是真的那么让别人反感。[pg]");
         outputText("[say: 是的，确实如此。大多数猫都接受不了，大多数狗也接受不了我身体其他部分还是猫的事实，甚至连半人马娘都不敢让我把基本上像个瓜一样的东西塞进她们的小穴里。]凯瑟琳悲伤地点了点头。[say: 但是后来，你出现了……我不知道你为什么会那么做，但我高兴得根本不在乎了。]她脸上浮现出幸福的表情。");
         talkToKatherine(askKatherineAboutLoveAndLust);
      }
      
      public function askKatherineAboutGang() : void
      {
         clearOutput();
         outputText("你问凯丝，她能不能告诉你一些关于她之前混在一起的那群猫的事情。[pg]");
         outputText("她环顾四周，仿佛觉得他们会突然出现。[say: 好吧……只是，你得答应我，我告诉你的事你绝对不能告诉他们？] 当你给出承诺后，她轻轻叹了口气。[say: 嗯，我们基本上就是你看到的那样；一群无家可归的猫，发现人多力量大。我们其实算不上朋友，只是知道彼此可以信任，所以聚在一起做我们需要做的事。][pg]");
         outputText("你问她他们到底做些什么");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,398) == 1)
         {
            outputText("毕竟，你第一次遇到他们时，他们就伏击了你");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1069) != 0)
            {
               outputText("和斯库拉");
            }
            outputText("为了弄点奶喝。[pg]");
            outputText("凯丝尴尬地红了脸。[saystart]是的，嗯……老实说，那不是他们第一次这么做了。");
         }
         else
         {
            outputText("。");
            outputText("[pg]凯丝尴尬地红了脸。[saystart]嗯……");
         }
         outputText("我们都喜欢奶，有时又很难弄到食物，所以我们会去找哺乳期的女人和扶她吸奶——我们通常不抢劫，[sayend] 她急忙补充道，[say: 所以守卫队不会一直追捕我们。尽管他们可能会抱怨，但没有实际金钱损失的偷奶事件通常不足以让他们费心。][pg]");
         outputText("你指出，不管怎样，为了别人的体液而袭击别人，在这个城市里绝对是个危险的举动。周围的很多人看起来都不好惹。[pg]");
         outputText("[say: 你说得没错，] 凯丝同意道。[say: 我们帮派里以前其实还有一个叫乔伊的男猫，直到他惹上了一个我们的“受害者”。] 你很好奇，尤其是看到她回忆时嘴角的笑意，于是你让她讲讲这个故事。[pg]");
         outputText("[say: 嗯，有一天他看到一个老鼠女人，穿着长裙打扮得花枝招展，乳头渗出奶水，乳房有她的头那么大，于是决定撇下我们单独去找她。那天晚些时候，他跌跌撞撞地回到帮派，肚子胀得鼓鼓的，脸上抹着白色的东西，看起来非常震惊。] 她邪恶地咧嘴一笑。[say: 原来她是个扶她；有一根这么大的马鸡巴，] 说着她先摸了摸手肘，然后摸了摸中指尖。[say: 而且有两英寸粗。她显然把他带到了一个安静的地方，装作要给他想要的奶，然后她掏出鸡巴，把他打倒并绑了起来，然后让他给她口交——因为她在裙子下面有和她奶子一样大一样饱满的蛋蛋，所以……][pg]");
         outputText("你忍不住在脑海中想象那个画面，轻声笑了笑，然后问他后来怎么样了。[pg]");
         outputText("[say: 其他人把他骂得狗血淋头：嘲笑他输给了一只老鼠，取笑他喜欢扶她，还嘲讽他至少吃了一顿饱饭，他发誓要报仇；他又回去找她了。一次又一次。而且一直输。他并不总是带着一肚子精液回家，但只要她赢了，她就会在性方面玩弄他，而他挑战她的次数也一样多。有趣的是，她从来没有真正强奸过他，本身——从来没有试过把那根马鸡巴插进他的屁股里……至少，如果他不愿意的话。她似乎认为这都是一场游戏，老实说，我认为他也开始这么想了。有一天，他再也没有回来；我想，他只是和她永远同居了。][pg]");
         outputText("<b>这</b>绝对不是你所期望的结局。你催促她解释；他们真的就这么同居了吗？[pg]");
         outputText("[say: 我其实见过他们几次；他们看起来都很开心，他脖子上甚至还戴着一个写着她名字的小心形牌子。] 这只猫" + (hasCock() ? "扶她" : "娘") + "摇了摇头，叹了口气。[say: 其他猫除了叫他懦夫和叛徒之外，从来不谈论他。就我个人而言，我忍不住认为他才是聪明的那个。][pg]");
         outputText("仔细琢磨着这些，你记起了你们最初谈论的话题，问她除了抢奶之外，帮派还做些什么。[pg]");
         outputText("她耸了耸肩。[say: 乞讨，偶尔扒窃，抢劫摊位……我们主要是城市拾荒者——你知道的，潜入废弃的房屋之类的地方，捡些可以典当换钱的东西。这并不像听起来那么容易，而且法律对此打击得很严，所以如果他们抓住我们……下场会很惨。我们只有在确定能逃脱的情况下才会这么做。]");
         talkToKatherine(askKatherineAboutGang);
      }
      
      public function askKatherineAboutDogCock() : void
      {
         clearOutput();
         outputText("你向凯瑟琳坦白，你对她的狗鸡巴很好奇。一只猫怎么会长出犬类的阴茎呢？[pg]");
         outputText("凯瑟琳轻声叹了口气。[say: 我就知道你迟早会问这个。好吧，为了直接回答这个显而易见的问题，我生来就是个双性人——而且不，我从未因此受过什么委屈。另一部分发生在我离家出走成为流浪猫后不久；我当时饿得要命，在市场上闲逛——其中一个商人设法运进了一批农产品，所以我溜了进去，抓起我能独自搬动的第一箱食物就跑了。] 她耸了耸肩。[say: 里面装满了犬椒，但我的肚子咕咕直叫，所以我开始大快朵颐……不幸的是，我太天真了，不知道生犬椒有变形的效果，而这些正是生辣椒。玛瑞斯的原住民对跨物种变形有抵抗力，但这并没有阻止我最关键的部位发生改变。][pg]");
         outputText("你的目光下意识地移向她的腰部，她点了点头。[say: 起初我很害怕……但感觉太爽了。而且，嗯……] 她脸红了。[say: 它让我变大了一点。] 看着你疑惑的眼神，她不好意思地解释道，[say: 你得明白，我们猫族并不以大鸡巴出名，而在这个城市里，一英尺长似乎成了新的平均水平，所以……] 她尴尬地扭动了一下。[say: 于是，我想到一个当时看来很棒的主意；吃犬椒直到我长到想要的大小，然后再偷吃一颗胡须果，把我的猫鸡巴变回来。] 她叹了口气。[say: 不幸的是，我没意识到它们不是普通的辣椒——它们是结节犬椒。它们不会让你的犬类阴茎变大，只会让你的肉结变大。我吃了一整箱，结果只得到了一根八英寸长的鸡巴——比我原来的大了一倍，但这完全是因为最初的变形——还有肚子痛，而且，我很快就发现，我的肉结大得连妓女都不愿意和我操，因为那会把她们撕裂的。] 她无力地叹了口气。[pg]");
         outputText("你问她为什么不按计划行事，用胡须果把它变回来。[pg]");
         outputText("[say: 因为不久之后，我发现最后一个定期把胡须果带进城的商人失踪了。我们仍然能弄到一些，但都被大面包店和餐馆抢购一空了——你再也看不到它们在市场上出售了。] 她把目光移向一旁。[say: 说实话，我已经有点喜欢这根鸡巴本身了……我只是希望能把肉结缩小。但这需要缩形膏，而那东西极其稀有且昂贵。] 说完最后一句话，她无力地耸了耸肩。[pg]");
         outputText("出于好奇，你又问了她一个问题：如果有机会，她会把自己的狗鸡巴换成别的吗？[pg]");
         outputText("她摇了摇头。[say:不……就像我说的，我已经习惯了这根狗鸡巴，甚至还挺喜欢的。我只是想改变一下肉结。我并不是说我想弄到球茎辣椒或者双生辣椒之类的东西。其实，我觉得球茎辣椒也不错，双生辣椒可能也会很有趣。我绝对想弄到一两个超大辣椒……] 她喃喃自语着，声音越来越小，一半是对你说的，一半是对自己说的。[pg]");
         talkToKatherine(askKatherineAboutDogCock);
      }
      
      public function ambushByVagrantKittyKats() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_vagrant_cats());
         outputText("当你漫步在特尔阿德雷，欣赏着沿途的风景时，你瞥见小巷深处有几个猫人。看起来像是三个男性猫人把一个年轻的猫女逼到了角落里。这几个男人似乎都没有带武器。女孩穿着一件破烂的连衣裙，曾经可能是白色的，她看起来很害怕。");
         menu();
         addButton(0,"寻求帮助",getHelpVsKittyKats);
         addButton(1,"介入",interveneWithKittyKats);
         addButton(14,"离开",leaveKittyKatsLikeANeeeeeerrrrd);
      }
      
      public function addSubmissive(param1:int) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1227,FlagDict_Impl_.arrayReadInt(_loc2_,1227) | param1);
      }
   }
}

