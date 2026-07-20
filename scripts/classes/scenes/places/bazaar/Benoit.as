package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.KeyItem;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.ImageDb;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.places.Bazaar;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class Benoit extends BazaarAbstractContent
   {
      
      public function Benoit()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function updateBenoitInventory() : void
      {
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         _loc1_ = [get_consumables().INCUBID.get_id(),get_consumables().MINOBLO.get_id(),get_consumables().MINOCUM.get_id(),get_consumables().EQUINUM.get_id(),get_consumables().BLACKPP.get_id(),get_consumables().SMART_T.get_id(),get_consumables().VITAL_T.get_id(),get_consumables().DBLPEPP.get_id(),get_consumables().REPTLUM.get_id()];
         _loc1_.push(Utils.rand(3) == 0 ? get_consumables().PURHONY.get_id() : get_consumables().BEEHONY.get_id());
         var _loc4_:Array = _loc1_;
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,567,_loc4_[Utils.rand(int(_loc4_.length))]);
         if(Utils.rand(10) == 0)
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,567,get_consumables().GODMEAD.get_id());
         }
         if(Utils.rand(100) >= 4)
         {
            _loc2_ = [get_consumables().SUCMILK.get_id(),get_consumables().W_FRUIT.get_id(),get_consumables().SLIMYCL.get_id(),get_consumables().GLDSEED.get_id(),get_consumables().LABOVA_.get_id(),get_consumables().SNAKOIL.get_id(),get_consumables().S_GOSSR.get_id(),get_consumables().HUMMUS_.get_id(),get_consumables().PIGTRUF.get_id(),get_consumables().B_GOSSR.get_id()];
         }
         else
         {
            _loc2_ = [get_consumables().BIMBOLQ.get_id(),get_consumables().L_PNKEG.get_id(),get_consumables().L_BLUEG.get_id(),get_consumables().BROBREW.get_id(),get_consumables().TSTOOTH.get_id(),get_consumables().P_SEED.get_id()];
         }
         var _loc5_:Array = _loc2_;
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,568,_loc5_[Utils.rand(int(_loc5_.length))]);
         if(Utils.rand(100) >= 10)
         {
            _loc3_ = [get_armors().W_ROBES.get_id(),get_armors().S_SWMWR.get_id(),get_useables().GREENGL.get_id(),get_useables().B_CHITN.get_id(),get_useables().T_SSILK.get_id()];
         }
         else
         {
            _loc3_ = [get_useables().D_SCALE.get_id(),get_armors().BONSTRP.get_id(),get_armors().NURSECL.get_id(),get_consumables().W_PDDNG.get_id()];
         }
         var _loc6_:Array = _loc3_;
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,569,_loc6_[Utils.rand(int(_loc6_.length))]);
      }
      
      public function tryToConvertToBassyWomb() : void
      {
         var later:Boolean;
         var _g:Benoit;
         clearOutput();
         benoitSprite();
         if(!(get_player().hasItem(get_consumables().OVIELIX,2) && get_player().hasItem(get_consumables().REPTLUM) && get_player().hasItem(get_consumables().GOB_ALE)))
         {
            outputText("你还没有尝试这个所需的材料。你回想起" + benoitMF("本诺瓦","本诺瓦特") + "提到过你需要鳞族药水、两瓶产卵灵药和地精麦酒。");
            doNext(benoitIntro);
         }
         else
         {
            get_player().consumeItem(get_consumables().OVIELIX,2);
            get_player().consumeItem(get_consumables().REPTLUM);
            get_player().consumeItem(get_consumables().GOB_ALE);
            outputText("你翻出你收集的成分，开始把它们砰砰地放在" + benoitMF("本诺瓦","本诺瓦特") + "面前的柜台上，告诉" + benoitMF("他","她") + "你已经得到了" + benoitMF("他","她") + "需要的东西。皮埃尔听到声音兴奋地叫了起来。");
            outputText("[pg][say: 那是什么？] 蛇怪困惑地说。你解释说你可以调制出一种能给你蛇怪子宫的东西——从而生出雌性蛇怪孩子。" + benoitMF("本诺瓦","本诺瓦特") + "张开" + benoitMF("他","她") + "的嘴，然后又闭上；" + benoitMF("他","她") + "花了一段时间才正确理解这些话。[say: 但……但这完全是不可能的，[name]！] " + benoitMF("他","她") + "最终说道，绞着" + benoitMF("他","她") + "的双手。[say: 你怎么知道你不会只是毒死自己？或者，或者把自己变成蝾螈什么的？求你了……别受伤……我真不该说……] 当你从附近的架子上拿出一个白镴碗，从装满旧餐具的容器里拿出一把木勺，开始把各种材料混合在一起时，" + benoitMF("他","她") + "陷入了沉默。你把产卵灵药倒进地精麦酒里，把它们搅拌在一起，直到一股相当难闻的硫磺味充满了狭窄的市场摊位。你小心翼翼地滴入鳞族药水，同时继续搅拌，直到气味变成烹饪雪利酒的味道。你对着混合物皱起眉头。感觉好像少了点什么……你漫不经心地让" + benoitMF("本诺瓦","本诺瓦特") + "向你张开" + benoitMF("他","她") + "的手，同时从餐具容器里拔出一把菜刀。当你用刀片划过" + benoitMF("他","她") + "的手掌，然后将" + benoitMF("他","她") + "的手紧紧地握在碗上方时，" + benoitMF("他","她") + "痛得叫了起来。深红色的水滴在混合物中绽放，当你小心翼翼地搅拌时，药水变成了灰绿色：" + benoitMF("本诺瓦","本诺瓦特") + "鳞片的颜色。");
            outputText("[pg][say: 你在太阳下待得太久了，[name]，] 蛇怪严厉地说，紧紧抓住" + benoitMF("他","她") + "的手。[say: 去躺一会儿，然后重新考虑喝下你刚刚调制的任何东西。我从未要求你尝试这个。] 你感到片刻的怀疑……但是不，你已经把好材料倒进去了，你绝对不会现在退缩。你给" + benoitMF("本诺瓦","本诺瓦特") + "未受伤的手一个令人安心的挤压，并尽可能自信地说你知道自己在做什么。说完，你端起碗，只犹豫了片刻，便大口喝了下去。");
            outputText("[pg]这种混合物有一种挥之不去的薄荷刺痛感，覆盖了酒精吞噬一切的灼烧感；你隐约想起了家里橱柜深处那些黏糊糊的利口酒。你咂咂嘴，喝完后故意大声地把碗砰地放下；当你等待时，" + benoitMF("本诺瓦","本诺瓦特") + "紧张地抓住柜台。你没有立刻死掉，所以这是个好现象……你的肚子里传来一阵巨大的咕噜声，你弯下腰，因为你的内脏在移动，肠胃里的东西在翻腾。这种感觉并不完全是痛苦，但你觉得你已经失去了对内脏的所有控制；你抓住自己的两侧，试图平稳地呼吸，因为你的胃翻江倒海，发出像气体被困住的声音。最终你感觉好像有一个气泡在你的肠道下方形成；慢慢地，随着气泡越来越大，你的内脏安定下来，直到这种感觉慢慢消退。你小心翼翼地来回走了几次，然后戳了戳你的肚子。");
            if(!get_player().hasPerk(PerkLib.Oviposition))
            {
               outputText("你感觉有点胀，但其他方面都很好；你感觉到你现在可以凭自己的意愿产卵了。");
            }
            else
            {
               outputText("你感觉有点胀，但其他方面都很好；你感觉到如果你被蛇怪的精液受孕，你产下的卵将是纯种的蛇怪。");
            }
            outputText("[pg][say: [name]？] " + benoitMF("本诺瓦","本诺瓦特") + "紧张地说。[say: 你没事吧？我要叫医生吗？我要叫医生。他最擅长把人拆开再拼回去，但我相信如果我们赶快的话，他能给你一剂好泻药……] 你考虑过假装发生戏剧性的过敏反应，但决定不再刺激" + benoitMF("他","她") + "的神经，你告诉" + benoitMF("他","她") + "你感觉非常好。事实上，抚摸着你的肚子，你几乎可以肯定它起作用了。");
            outputText("[pg][say: 真的吗？] 蛇怪跳了起来，绕过柜台的速度比你想象的还要快。[say: 你不是喝地精麦酒喝嗨了吧？] " + benoitMF("他","她") + "搂住你的腰，慢慢地吸入你的气息。[say: 你……你不是在开玩笑。] " + benoitMF("他","她") + "听起来惊呆了。[say: 你真的做到了。你……真的是想这么做。]");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,577,0.5);
            if(get_player().get_lust() >= 33)
            {
               outputText("你咧嘴一笑，说你不确定它是否起作用了，但你想只有一种真正的方法可以找出答案……");
               if(get_player().get_tallness() <= 78 && !get_player().isTaur())
               {
                  outputText("蛇怪静止了片刻，然后突然猛地一动，抓住你的腰，把你扛在" + benoitMF("他","她") + "的肩膀上。你假装惊恐地尖叫，因为" + benoitMF("他","她") + "尽可能快地把你拖进后面的房间，在这个过程中撞倒了" + benoitMF("他","她") + "一半的存货。");
               }
               else
               {
                  outputText("蛇怪静止了片刻，然后突然猛地一动，抓住你的腰，疯狂地试图把你扛在" + benoitMF("他","她") + "的肩膀上。但你对" + benoitMF("他","她") + "来说太大了；经过几次勇敢的尝试后，" + benoitMF("他","她") + "瘫倒在架子上。你笑着抱起这只受惊、喘着粗气的爬行动物，把" + benoitMF("他","她") + "扛在自己的肩膀上，摸索着走进后面的房间。");
               }
               _g = this;
               later = false;
               doNext(function():void
               {
                  _g.suggestSexAfterBasiWombed(later);
               });
            }
            else
            {
               outputText("你咧嘴一笑，说你甚至不确定这是否有效……但你会在某个时候回来试试看，而" + benoitMF("他","她") + "最好在你回来时做好准备。你轻轻地从" + benoitMF("他","她") + "的怀抱中挣脱出来，并尽可能从容地离开，你知道自己留下了一股迷人、无形的气味，让那个惊呆了的、沉默的蛇怪在其中慢慢回味。");
               doNext(get_camp().returnToCampUseOneHour);
            }
            get_player().createPerk(PerkLib.BasiliskWomb,0,0,0,0);
            outputText("[pg](<b>特质解锁：蛇怪子宫 - 你现在可以生下雌性蛇怪了。</b>)");
            if(!get_player().hasPerk(PerkLib.Oviposition))
            {
               get_player().createPerk(PerkLib.Oviposition,0,0,0,0);
               outputText("[pg](<b>特质解锁：产卵 - 你现在会定期产下未受精的卵。</b>)");
            }
            get_output().flush();
         }
      }
      
      public function talkToBenoit() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null as IMap;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         clearOutput();
         benoitSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,570) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,570,1);
            benoitAffection(5);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1301) > 0 && !get_player().hasKeyItem("Feathery hair-pin"))
         {
            _loc1_ = get_player().hair.type != 3 && get_player().hair.length > 0;
            outputText("[say: 啊，[name]！我一直希望能和你谈谈。]你的蛇怪恋人咧嘴笑着说道。[say: 我有一份礼物要送给你……为了你所做的一切。]你注意到" + benoitMF("本诺瓦","本诺瓦特") + "脸上" + (get_noFur() ? "" : "的鳞片") + "变成了更深的绿色，显然是脸红了，" + benoitMF("他","她") + "伸出一只紧握的手，目光像情人节的孩子一样躲闪着。你伸出手，感觉到一个小东西落入你的掌心。它有些痒，摸起来凉凉的。你低头看着收到的这个小饰品，顿时吃了一惊。");
            outputText("[pg]你手里拿着一根银色发簪，闪亮的外表在光线下熠熠生辉。细小的鳞片被铸入发簪的金属中，仿佛是爬行动物的尾巴，这一定需要大师级的工艺才能制作得如此精美。发簪的末端是一颗卵形的宝石，深处有着漩涡状的灰色图案。这让你想起了山里蛇怪的眼睛，不过这一次，你看着它是因为它很美，而不是出于强迫。宝石下方是一簇三根精致的深红色羽毛，柔软的纤维在你的掌心挠痒痒。" + benoitMF("本诺瓦","本诺瓦特") + "肯定不是故意要给你这么昂贵的东西吧？！");
            outputText("[pg][say: [name]，没有什么能报答你为我、为我的同族所做的一切。与此相比，这样一件传家宝根本微不足道。] " + benoitMF("本诺瓦","本诺瓦特") + "闭着眼睛轻声说道。[say: 它感觉没有被恶魔扭曲，我希望它能在你的旅途中让你想起我。]");
            outputText("[pg]当你感谢这位失明的蛇怪时，你感觉到一阵红晕爬上了你的[face]，在离开前紧紧地拥抱了" + benoitMF("他","她") + "。");
            if(_loc1_ && get_player().cor < 55)
            {
               outputText("，在走出商店时将发簪插进了你的[hair]里。");
               get_player().createKeyItem("Feathery hair-pin",1,1,0,0);
            }
            else
            {
               outputText("。");
               get_player().createKeyItem("Feathery hair-pin",0,0,0,0);
            }
            outputText("[pg](<b>获得关键物品：羽毛发簪</b>)");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(benoitBigFamily() && get_player().get_inte() >= 60 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1300) == 0)
         {
            outputText("你问" + benoitMF("Benoit","Benoite") + "，" + benoitMF("他","她") + "同族的石化凝视是如何起效的，是眼睛天生如此，还是某种特殊的视觉？" + benoitMF("他","她") + "僵硬了片刻，然后发出一声沮丧的叹息。");
            outputText("[pg][say: [name]，你知道我是个瞎子，对吧？这可不是什么好笑的玩笑。]");
            outputText("[pg]你急忙告诉你有鳞片的爱人，你并没有恶意，只是单纯的好奇。毕竟，你为了" + benoitMF("他","她") + "已经把自己变得更像蛇怪了，所以你很好奇自己是否能更接近真正的蛇怪。");
            outputText("[pg]过了一会儿，" + benoitMF("Benoit","Benoite") + "微微点了点头。");
            outputText("[pg][say: 我明白了……你确定要这么做吗，[name]？这样在自己身体上做实验太鲁莽了……不过，我想你为我的族人做了这么多，如果你想成为我们的一员，我可以去研究一下。但要小心，这很危险，所以虽然我这样做是为了感谢你，但我不想让你冒着变成其他蛇怪那样的风险……毫无疑问，那些恶魔也影响了我们的凝视，那些变态……]");
            outputText("[pg]你对这只蜥蜴的关心报以微笑，然后离开，让" + benoitMF("本诺瓦","本诺瓦特") + "安静地寻找配方。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1300,1);
            outputText("[pg](<b>在" + benoitMF("本诺瓦","本诺瓦特") + "的菜单中启用了蛇怪之眼选项！</b>)");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,573) > 2 && get_player().get_inte() >= 60 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,575) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,573) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,575) == 0) && get_player().hasVagina())
         {
            outputText("你问" + benoitMF("本诺瓦","本诺瓦特") + "，" + benoitMF("他","她") + "是否想过做些什么来帮助族人摆脱困境。");
            outputText("[pg]蛇怪沉默了一会儿，爪子在柜台上沉思地划过。[say: 是的，]" + benoitMF("他","她") + "最终轻声说道。[say: 我想过。远离群山后，我有时间去思考。我不再是恶魔的奴隶了，反正我也是个滑稽的蛇怪笑话，所以我经常想……做出某些牺牲。如果我们哪怕只有一个雌性，远离他们的腐化，那么……]" + benoitMF("他","她") + "的声音渐渐弱了下去，重重地叹了口气，然后对你苦笑了一下。[say: 这些是我遇到你之前的想法。很疯狂，对吧？更疯狂的是，当一个好女人仅仅出于她内心的善良而无私地给予我她的爱时，我居然还在想这些。不过……能够清楚地思考这些事情，却又无能为力，这太令人沮丧了。]");
            if(get_player().get_inte() >= 60)
            {
               outputText("[pg]你的思绪渐渐飘远。你怀疑即使自己想，也不可能变成一个真正的蛇怪，但你想知道是否有什么转变能让人类的子宫模仿其他种族的子宫。");
               outputText("[pg]本诺瓦警惕地回答。[say: 双倍剂量的产卵灵药、一瓶爬虫药剂、地精麦酒和一些蛇怪血液大概就行了……如果你真想这么做的话。但是，[name]，告诉我你不会鲁莽到拿自己的身体做实验吧？]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,575,1);
               outputText("[pg](<b>本诺瓦的菜单中已解锁蛇怪子宫选项！</b>)");
            }
            else
            {
               outputText("[pg]你绞尽脑汁也想不出有什么能帮到本诺瓦的，所以最后只能对" + benoitMF("他","她") + "表示同情。[say: 别为此自责，]蛇怪说着，指尖触碰着你的手指，温暖地微笑着。[say: 这只是愚蠢的想法罢了。而且不管怎样，我告诉过你：我们是一个混蛋种族。我们是最不配让人为我们操心的人。]");
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,571) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,571,FlagDict_Impl_.arrayReadInt(_loc2_,571) + 1);
            outputText("你花了一点时间打量这个奇怪的商人。虽然瞎了，但" + benoitMF("他","她") + "看起来并不老——" + benoitMF("他","她") + "保留着你见过的其他蛇怪那种紧实、瘦削的肌肉骨架，但看起来要稍微矮一些，而且尽管有着骄傲、冷酷的侧脸，但整体看起来却有些落魄。也许是出于对文明礼仪的尊重，" + benoitMF("他","她") + "穿着一条牛仔长衬裤，头上还戴着一顶土耳其毡帽，端端正正地戴在他头上的一根骨刺上。你做了自我介绍，然后决定向" + benoitMF("他","她") + "询问关于蛇怪的事情。");
            outputText("[pg][say: 我们曾经是一个骄傲的种族，]本诺瓦叹了口气。[say: 一个高贵的种族，我们高昂着头颅，而且……]这只失明的蛇怪突然爆发出沙哑的笑声，最后变成了一阵咳嗽。你困惑地看着。[say: 哈哈哈！啊哈。抱歉。不，我们一直都是一群偷蛋的混蛋。蜥蜴人，]" + benoitMF("他","她") + "轻蔑地朝着篝火的大致方向扬了扬" + benoitMF("他的","她的") + (get_noFur() ? "下巴" : "口鼻") + "，[say: 绝对恨透了我们。他们把我们赶到山里去住，远离他们宝贵的蛋，让我们像野蛮人一样生活。“被邪眼笼罩的家族”，他们就是这么叫我们的。呃……用蛇怪语说起来更顺口些。]本诺瓦停顿了一下，手指在柜台上若有所思地划过。[say: 但在上面也没那么糟。我们控制着鹰身女妖，收集废料，卖给那些敢于蒙着眼睛交易的人。我们一直很擅长这个。直到恶魔来到了山里。]");
            outputText("[pg]他耸了耸肩。[say: 我们能怎么办？下山去向那些鄙视我们的种族摇尾乞怜吗？恶魔们提出让我们在他们手下身居高位，如果我们同意帮助他们，他们就会增强我们天生的能力。我想他们确实做到了。]本诺瓦在柜台上划出了一道长长的凹槽，气得浑身发抖。[say: 通过把我们都变成雄性，他们确保我们总是执着于寻找能产卵的母体，压制鹰身女妖，并给他们带去废料和雕像，这样他们就不会对我们做更糟糕的事。我们现在对他们来说只是一个没有大脑的天然防御，在他们山里的藏身处。别上山，否则邪恶的蛇怪会抓住你！混蛋。混蛋。]本诺瓦停止了对面前木头的摧残，叹了口气。[say: 但那都是过去的事了。你到底买不买东西？]");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1183) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) != 0)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,1183,FlagDict_Impl_.arrayReadInt(_loc2_,1183) + 1);
               outputText("你问本诺瓦特她现在是否打算回山里去。听到这话，她大笑不止。这次转变肯定赋予了她一件事，那就是极其下流的笑声。");
               outputText("[pg][say: 哦，[name]，你真傻，]她深情地说。[say: 你觉得一个失明的雌性蛇怪在上面能活多久，嗯？如果我运气好的话，牛头人会在恶魔之前抓住我。不，我会留在这里。其他的蛇怪，我不能信任他们——他们总是暴露在腐化中，有些人甚至喜欢这样。我会在远离那里的地方产卵，我会把我的孩子抚养成不同的人；远离腐化，男女数量相等，情况会有所不同。现在这个世界上有很多空旷的地方，他们可以去那里，不被打扰。]她停顿了一下。[say: 或者至少，一旦我鼓起勇气找到一个，呃，捐精者，这些事情就会发生。]");
               if(!get_player().hasCock())
               {
                  outputText("你问她在这方面有没有什么想法。[say: 没怎么想过，]本诺瓦特叹了口气。[say: 我有很多男性顾客，但他们都——怎么说呢？粗枝大叶的。你知道的，[name]，男人都是猪。]你们俩都笑了。[say: 不过我会找到人的，别担心。就像我之前说的……]她用两根手指指了指自己失明的眼睛，然后又指了指摊位入口。在她那浑浊的灰色眼眸深处，闪烁着一种独特的光芒，你觉得这光芒能把大多数长着阴茎的生物吓得魂飞魄散。[say: 我现在有目标了。]");
                  doNext(benoitIntro);
               }
               else
               {
                  outputText("[pg]你问她在这方面有没有什么想法。[say: 嗯，我确实有一个看起来很善良的顾客。而且他比这里任何人都更了解我，]本诺瓦特摆弄着手指，喃喃自语道。[say: 但是这个人已经为我做了很多，所以我不知道是否……也许这要求太多了。不过我会找到人的，别害怕。就像我之前说的……]本诺瓦特用两根手指指了指自己失明的眼睛，然后又指了指摊位入口。在她那浑浊的灰色眼眸深处，闪烁着一种独特的光芒，你觉得这光芒能把大多数长着阴茎的生物吓得魂飞魄散。[say: 我现在有目标了。]");
                  menu();
                  doYesNo(femoitFirstTimeYes,femoitFirstTimeNo);
               }
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,571) != 0 && benoitAffection() >= 40 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1179) == 0)
            {
               femoitInitialTalk();
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            _loc3_ = [0,1,2,3,4,5,6,7];
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2042) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1305) > 0)
            {
               _loc3_[int(_loc3_.length)] = 8;
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1310) <= 0)
               {
                  _loc3_[int(_loc3_.length)] = 8;
               }
            }
            if(!benoitLover() && benoitMF("he","she") == "he")
            {
               _loc3_[int(_loc3_.length)] = 9;
            }
            if(benoitLover() && benoitMF("he","she") == "he" && get_player().hasVagina())
            {
               _loc3_[int(_loc3_.length)] = 10;
               _loc3_[int(_loc3_.length)] = 11;
               _loc3_[int(_loc3_.length)] = 12;
               _loc3_[int(_loc3_.length)] = 13;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) != 0)
            {
               _loc3_.push(14);
               _loc3_.push(15);
               if(benoitLover())
               {
                  _loc3_.push(16);
               }
            }
            _loc4_ = int(_loc3_[Utils.rand(int(_loc3_.length))]);
            if(_loc4_ == 0)
            {
               outputText("你问是不是所有的蛇怪说话都像" + benoitMF("他","她") + "一样。");
               outputText("[pg][say: 只有山这边的才是，]" + benoitMF("他","她") + "回答道。[say: 山那边的都是些自命不凡的势利眼，说话难听死了。他们还都又白又胖，做饭也难吃。呸！]" + benoitMF("他","她") + "用爪子做了一个恼怒的手势。");
            }
            else if(_loc4_ == 1)
            {
               outputText("你向" + benoitMF("本诺瓦","本诺瓦特") + "询问关于那只狗的事。");
               outputText("[pg][say: 皮埃尔没给你惹麻烦吧？这只大笨狗连自己的嘴和屁股都分不清。这就是为什么他经常要检查，]蛇怪亲昵地说着，揉了揉那只阿尔萨斯犬的耳后。[say: 我刚到这里的时候，发现他在到处游荡，吃卖食物的人剩下的残羹冷炙；我想他肯定是属于另一个把他丢下的商人的。我觉得如果没有他，我根本开不了这家店——每天傍晚我都会带他去野外寻找更多的废品。他很擅长找到别人丢弃的完好无损的东西。特别是衣服。他喜欢长袍，皮埃尔。对吧，[boy]？]皮埃尔呜咽了一声。");
            }
            else if(_loc4_ == 2)
            {
               outputText("你向" + benoitMF("他","她") + "询问店面上方招牌的事。");
               outputText("[pg][say: 很好看，不是吗？]商人自豪地说。[say: 我刚到这里的时候，语言还不太通，就找了个猫人来做。他建议……]" + benoitMF("他","她") + "表情丰富地张开" + benoitMF("他","她") + "的爪子。[say: “火蜥蜴的健康废品”。因为，每个人都喜欢火蜥蜴，一旦他们进来，发现我不是火蜥蜴，那只是个文字游戏，他们就会被我卖的东西迷住，根本不在乎。]" + benoitMF("本诺瓦","本诺瓦特") + "高兴地敲了敲柜台。[say: 还是金字印的呢！没能招来更多顾客真是让人意外。]");
               outputText("[pg]你决定不让这只失明的蛇怪幻想破灭。");
            }
            else if(_loc4_ == 3)
            {
               outputText("你问" + benoitMF("他","她") + "是不是一直都看不见。");
               outputText("[pg][say: 我不知道，]" + benoitMF("他","她") + "说。[say: 你问我红色是什么。]");
               outputText("[pg]你问红色是什么。");
               outputText("[pg][say: 我他妈怎么会知道？]蛇怪面无表情地回答。[say: 别问这种蠢问题。]");
               outputText("[pg]你决定不再继续这个话题。");
            }
            else if(_loc4_ == 4)
            {
               outputText("你问" + benoitMF("本诺瓦","本诺瓦特") + "，" + benoitMF("他","她") + "是怎么干上这一行的。");
               outputText("[pg][say: 我一直都在和废品打交道，]" + benoitMF("他","她") + "耸了耸肩。[say: 以前在山里的时候，我在喜鹊房工作——很明显，因为我在外面什么都干不好。你可以从东西的重量和气味来判断它是什么，值多少钱。不仅如此，你还能知道……它对上一任主人意味着什么。那才是一件物品真正的价值。]" + benoitMF("他","她") + "用爪子敲击着柜台，陷入了沉思。[say: 喜鹊房太神奇了，[name]，真希望我能带你去看看。那里的音响效果太棒了，充满了成千上万件废品的声音和气味——每天都是一首新的交响乐。而且谁会去偷恶魔的宝藏呢？你得疯了才会去一个满是蛇怪的大厅里偷东西。或者瞎了。]");
               outputText("[pg]" + benoitMF("他","她") + "喉咙里发出一阵笑声，然后叹了口气。[say: 唉，但那真的很糟糕，真的——一切事物的背后总是隐藏着一种酸楚的基调。成千上万的蛇怪，被贪婪和欲望驱使着。我受够了，被困在那个充满那种想法、那种绝望循环的地方，有一天我逃跑了。我带走了我能带走的东西，用它在这里重新开始。远离了群山，我才能清晰地思考。我能说出其他蛇怪只在脑海深处知道的事情。]" + benoitMF("本诺瓦","本诺瓦特") + "一拳砸在柜台上，吓了你一跳。[say: 永远不要和恶魔做交易，[name]，]" + benoitMF("他","她") + "说道，声音里充满了愤怒。[say: 即使你觉得这是双赢？他们还是会找到办法把你坑惨的。]");
               dynStats(DynStat.Cor(-1));
            }
            else if(_loc4_ == 5)
            {
               outputText("你问本诺瓦" + benoitMF("他","她") + "能不能告诉你一些关于集市的事。");
               outputText("[pg][say: 你真的在问一个瞎子这个问题？]" + benoitMF("他","她") + "回答道。[say: 好吧，我会把我所知道的告诉你，不管有没有用。在那边的火堆旁，我知道有蜥蜴人在寻欢作乐，因为他们喝醉了就会大声骂人。要不是因为皮埃尔，我想他们会对动粗的。从她身上的气味来看，他们的首领在雄性激素方面有很大的问题。]" + benoitMF("他","她") + "毫无同情心地窃笑着。[say: 在另一个方向，我能闻到很多雄性聚集在一个地方。闻起来他们好像在做一些非常有男子气概的事情——而且从他们事后走路的声音来看，还有点痛苦。]" + benoitMF("他","她") + "指着相反的方向。[say: 这附近有很多，怎么说呢，卖弄风骚的人。他们中的一些人可以为你做一些非常狂野的事情，只要你付钱。至少我是这么听说的。]" + benoitMF("他","她") + "咳嗽了一声。");
            }
            else if(_loc4_ == 6)
            {
               outputText("你向" + benoitMF("本诺瓦","本诺瓦特") + "打听有没有什么传闻。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) > 0)
               {
                  outputText("[pg][say: 既然你提到了，前几天确实发生了一件怪事，]" + benoitMF("他","她") + "敲着一颗弯曲的牙齿说道。[say: 我这里来了一大群小恶魔。我通常不接待他们，因为他们总是在一个人付钱的时候偷东西，但这些家伙似乎太紧张了，甚至都没想过要顺手牵羊——他们身上散发着恐惧的气味。他们买了很多食物和生存装备——其中一个不停地念叨他们把“那个妖精”留在了后面，直到另一个扇了他一巴掌，说如果他再不闭嘴，他就会变成那个妖精。]" + benoitMF("本诺瓦","本诺瓦特") + "耸了耸肩。[say: 讨厌的小东西。不过味道还不错。]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
               {
                  outputText("[pg][say: 没什么特别有趣的，]" + benoitMF("他","她") + "耸了耸肩。[say: 我有几个来自沙漠之城特尔阿德雷的顾客，他们秘密来到这里买一些在家里找不到的东西。所以他们还在。不过你得想知道他们还能藏多久。]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
               {
                  outputText("[pg][say: 我不知道到底发生了什么，]" + benoitMF("他","她") + "靠在柜台上说。[say: 但和我交易的恶魔们，他们似乎对某件事非常紧张。我想，他们的一个设施出了点问题。我也遇到一些鲨鱼女来这里，问我卖不卖淡水。她们看起来也很不高兴。]");
               }
               else
               {
                  outputText("[pg][say: 我不知道到底发生了什么，]" + benoitMF("他","她") + "靠在柜台上说。[say: 但和我交易的恶魔们，他们似乎对某件事非常紧张。我想，他们的一个设施出了点问题。我也听到一些路人谈论那个湖。显然它现在干净多了；许多人又回去取水了。要是有人能把那些疯狂的邪教徒赶走就好了，对吧？]");
               }
            }
            else if(_loc4_ == 7)
            {
               outputText("你问" + benoitMF("他","她") + "是否遇到过经常光顾集市的恶魔带来的麻烦。");
               outputText("[pg][say: 并没有，]" + benoitMF("他","她") + "回答道。[say: 我不喜欢他们，但他们是我主要的收入来源。他们总是来这里卖他们的体液。说实话，那根本一文不值——我把大部分恶心的东西都倒掉了。但为了他们的光顾付钱是值得的，因为他们总是买更多的药水。显然，除非你长出两根新鸡巴和四个新乳头，否则那就不算是一个好的恶魔派对。他们中总是有人问能不能“做恐龙”来作为付款方式。我太讨厌他们了。]");
               if(get_silly())
               {
                  outputText("[pg]蛇怪一边思考，一边揉着皮埃尔耳后的毛。[say: 我曾经遇到过一群恶魔来这里，问我“奶酪煎蛋卷”用蛇怪语怎么说。当我告诉他们时，他们大笑着跑开了，大喊着“你就只会说这个！你就只会说这个！”]" + benoitMF("他","她") + "烦躁地耸了耸肩。[say: 混蛋。]");
               }
            }
            else if(_loc4_ == 8)
            {
               outputText("你问[benoit name]，蛇怪和鹰身女妖交配会有什么结果。");
               outputText("[pg][say: 大多数时候？是蛇怪，][benoit ey]回答道，用[benoit eir]手指仔细地数着宝石。[say: 有时候？是鹰身女妖。但如果蛇怪孩子没能及时逃脱，鹰身女妖就会把他们喂给自己的雏鸟，所以这也算扯平了。说真的，我们偷她们的蛋是在帮她们和这个世界的忙——如果我们不在，整个世界早就被鸟粪淹没了。]对收入感到满意后，[benoit ey]把钱收到了柜台下面。[say: 极少数情况下，你会得到鸡蛇。那家伙长得可真奇怪。]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1310) <= 0)
               {
                  outputText("[pg]<b>也许你应该试着找找这些难以捉摸的混血儿。你怀疑高山会是寻找的最佳地点。</b>");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1310,1);
               }
            }
            else if(_loc4_ == 9)
            {
               outputText("你问" + benoitMF("本诺瓦","本诺瓦特") + "是否真的能仅凭气味就知道你是谁。");
               if(get_player().get_race() == "human")
               {
                  outputText("[pg][say: 当然！]" + benoitMF("他","她") + "微笑着。[say: 剃毛猴子的气味很独特。你知道，我很少有人类顾客。]蛇怪心不在焉地挠了挠" + benoitMF("他","她") + "的下巴。[say: 如果你不介意我这么说，[name]，你闻起来也……与众不同。就像你并不真正属于这里。当然，我是往最好的方面说的。]");
               }
               else
               {
                  outputText("[pg][say: 当然！]" + benoitMF("他","她") + "微笑着。[say: 剃毛猴子的气味很独特。你知道，我很少有人类顾客。]你低头看了看自己，然后怀疑地看着蛇怪，然后说你看起来或感觉起来都不太像人类。[say: 哦，我毫不怀疑这一点，]商人说。[say: 你们人类和你们灵活的基因——这让你们非常迷人，我相信你已经注意到了，对吧？我相信依赖视觉的人肯定看不出你是人类。但你在这层外表之下到底是谁，这永远不会改变，我能闻出来。你现在所做的只是打扮成别的东西。如果你愿意，只要有合适的成分，你明天就可以变回来。]");
               }
               if(benoitMF("he","she") == "he")
               {
                  outputText("蛇怪的声音中带着一丝渴望和嫉妒，当" + benoitMF("他","她") + "陷入沉默时，你决定不再追问这个话题。");
               }
            }
            else if(_loc4_ == 10)
            {
               outputText("你问本诺瓦，关于恶魔据点，" + benoitMF("他","她") + "有没有什么有用的信息可以告诉你。");
               outputText("[pg][say: 恐怕我在那方面帮不上什么忙，[name]，]" + benoitMF("他","她") + "叹了口气。[say: 除非你想让我告诉你他们闻起来是什么味道。我不认为你想知道这个。恶魔们，他们不太喜欢告诉我们他们的计划，他们也不太喜欢和我们待在一起，这是可以理解的。喜鹊房里有你能想象到的所有宝藏，但除非你能想出办法让几百只蛇怪同时闭上眼睛，否则你根本拿不到。]");
            }
            else if(_loc4_ == 11)
            {
               outputText("你问本诺瓦，" + benoitMF("他","她") + "能不能提供一些建议，帮你对抗高山上的那些同类。");
               outputText("[pg][say: 你可以随身带一面镜子，]" + benoitMF("他","她") + "指着说。[say: 那边不是有一面吗？]你报告说它裂得很厉害——无论如何，你也不想每天带着一面笨重的镜子上山两三次。[say: 我可以半价卖给你，]" + benoitMF("他","她") + "满怀希望地说。[say: 想想它用来检查变异有多有用！你可以找别人帮你拿……好吧，好吧，既然你不想要镜子。对于大多数猎物，我的兄弟们都指望他们在恐慌中盲目攻击。所以使用不需要靠近的东西。我们不喜欢魔法或远程攻击，它们太不可预测了——我建议你用那些。]");
            }
            else if(_loc4_ == 12)
            {
               outputText("[say: 豺狼人。]");
               outputText("[pg]你发出一阵轻柔的嗡嗡声。");
               outputText("[pg][say: 蜂女，] 本诺瓦特过了一会儿说道。");
               outputText("[pg]你跺着脚，发出呼哧呼哧的喘息声。");
               outputText("[pg][say: 牛头人，] 本诺瓦特立刻说道。你叹了口气——" + benoitMF("他","她") + "太擅长这个游戏了，而你已经想不出什么生物了。你稍微想了想，一边拍打着柜台发出得得的马蹄声，一边还特意加上了沉重的呼吸声。");
               outputText("[pg][say: 见鬼，那到底是什么东西？] 本诺瓦特看起来有些惊慌。你告诉他那是");
               outputText("独角半人马。");
               outputText("[pg][say: 什么？]");
               outputText("[pg]你解释说，独角半人马就像白色的半人马，只是长着一张马脸。不过它有着极其强壮的人类手臂，而且施放魔法比任何人都厉害，跑得比猎豹还快，而且……你忍不住笑了起来，因为本诺瓦特脸上露出了惊恐的表情。");
               outputText("[pg][say: 哦，我明白了。你在逗我玩。真有趣。] 看到惊恐被受伤的尊严所取代，你笑得更厉害了。");
            }
            else if(_loc4_ == 13)
            {
               outputText("你问本诺瓦特，" + benoitMF("他","她") + "是不是真的、<b>真的</b>光凭气味就能认出你。");
               outputText("[pg][say: 哎呀，我当然能，] " + benoitMF("他","她") + "打趣道。[say: 当你身上连续几个小时都沾着别人的气味时，这很难弄错。这是你的纪念品，它让我想起幸福；我希望我能一直保持这种气味。我性感的小无毛猴子。]");
            }
            else if(_loc4_ == 14)
            {
               outputText("你问本诺瓦特变成异性后感觉如何。本诺瓦特停下手中正在擦拭的失去光泽的银盘，陷入了沉思。");
               outputText("[pg][say: 感觉……很不一样，] 她过了一会儿说道，然后对这句老生常谈的话笑了起来。[say: 整个尿尿的情况，比如说，这太糟糕了。我不知道，[name]，我白天太忙了，而且这发生得太突然，很难好好反思。有时候我在想一些事情，比如什么东西闻起来怎么样，然后我发现自己又在想……本诺瓦特会这么想吗？我的感知不同是因为我脑子里有不同的荷尔蒙在作祟吗？] 她心不在焉地在手里转动着盘子。[say: 还有……其他事情。有时候我闻到顾客觉得我很奇怪，我才意识到我在做一些……男性的事情。比如，我以前从来没有想过的事情，走路时脚向外撇而不是走直线。有一百零一件事要记住，以免引人注目。这很让人疲惫。]");
               if(benoitLover() && get_player().hasCock() && get_player().hasVagina())
               {
                  outputText("[pg]她羞涩地对你笑了笑。[say: 不过在某一方面我很幸运，因为我不需要重新思考我觉得什么有吸引力才能和你躺在一起。不管你两腿之间有什么，你闻起来、感觉起来都像女性，这是一种安慰。]");
               }
               else if(benoitLover() && get_player().hasCock() && !get_player().hasVagina())
               {
                  outputText("她羞涩地对你笑了笑。[say: 有一件事我肯定需要重新思考，那就是我觉得什么有吸引力。我以前觉得男性的身体没有吸引力，所以当我的身体……在你靠近时……产生反应……那是我最能感觉到我的经历和我现在的样子之间脱节的时候。也许这也是我没有想太多的原因；最好还是依靠本能。]");
                  outputText("[pg]真迷人，你说。");
                  outputText("[pg]本诺瓦特对你装出来的受伤表情笑得更开心了。[say: 哦，别担心，[name]，你有一个美丽的灵魂。而且你觉得你的外表对我来说到底有多重要？]");
               }
               else
               {
                  outputText("[pg]她羞涩地对你笑了笑。[say: 听我说，怎么说来着，喋喋不休。我猜你不知道这有什么大不了的——你们人类只要愿意，随时都可以改变，可以这么说。一定很棒。]");
                  outputText("[pg]你指出，你的多变性并不总是一个优势——它可能会被用来对付你，而这片土地上到处都是非常乐意这么做的人。");
                  outputText("[pg]本诺瓦特若有所思地点点头。[say: 我以前从没这么想过。恶魔们就是喜欢那些只要几瓶药水就能随意改变的奴隶，不是吗？你说得对，[name]，以后我会知足的。]");
               }
            }
            else if(_loc4_ == 15)
            {
               outputText("[pg]你问本诺瓦特，她难道不担心恶魔顾客会发现她的真实身份吗。");
               outputText("[pg][say: 这就是为什么我要穿这身巧妙的伪装，]她说着，拍了拍她那顶大贝雷帽。她压低声音，发出一声低吼。[say: 而且我招待他们的时候都是这么说话的。Grr。老实说，我觉得我没必要太担心，]她恢复了正常的语调，紧了紧围裙。[say: 来这儿的大多数恶魔都不太聪明，除了下次什么时候能把他们的那玩意儿撞在一起，他们对什么都不感兴趣。而且我觉得大多数哺乳动物如果不仔细看，是很难分辨出爬行动物的雌雄的。我说的对吗？]她冲你露出一个长长而又蜿蜒的笑容，你明白了她的意思。");
            }
            else if(_loc4_ == 16)
            {
               outputText("你问本诺瓦特，她是否真的能仅凭气味就认出你。");
               outputText("[pg][say: 哎呀，我当然能啦，小傻瓜，]她打趣道。[say: 当你连续好几个小时都散发着别人的气味时，想认错都难。这是你的纪念品，它让我想起了快乐；我真希望我能一直保持这种气味。我性感的小无毛猴子。]");
            }
            if(get_player().hasKeyItem("Feathery hair-pin") && (get_debug() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1302) == 0))
            {
               doNext(benoitHairPinTalk);
               return;
            }
         }
         doNext(benoitIntro);
      }
      
      public function takeBenoitsContraceptives() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你高兴地接受了草药避孕药，把它塞进嘴里，享受着那令人愉悦的、强烈的柑橘味。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suggestSexAfterBasiWombed(param1:Boolean = true) : void
      {
         clearOutput();
         benoitSprite();
         if(param1)
         {
            outputText("你卖弄风情地微笑着，问" + benoitMF("他","她") + "是否有兴趣用你的新身体……试驾一下。");
            if(get_player().get_tallness() <= 78 && !get_player().isTaur())
            {
               outputText("蛇怪静止了片刻，然后突然猛地一动，抓住你的腰，把你扛在" + benoitMF("他","她") + "的肩膀上。你假装害怕地尖叫着，" + benoitMF("他","她") + "以最快的速度把你拖进后面的房间，一路上撞翻了" + benoitMF("他","她") + "一半的存货。");
            }
            else
            {
               outputText("蛇怪静止了片刻，然后突然猛地一动，抓住你的腰，疯狂地试图把你扛在" + benoitMF("他","她") + "的肩膀上。但对" + benoitMF("他","她") + "来说，你实在太大了；在几次英勇的尝试后，" + benoitMF("他","她") + "瘫倒在架子上。你笑着把这只受惊、喘着粗气的爬行动物抱起来，把" + benoitMF("他","她") + "扛在自己的肩膀上，然后摸索着走进后面的房间。");
            }
            outputText("[pg]");
         }
         if(!get_player().isTaur())
         {
            if(get_player().get_tallness() > 78)
            {
               outputText("你把你的蜥蜴男孩拖进狭窄的后屋，然后轻轻地把" + benoitMF("他","她") + "放下。现在你的肠胃已经平静下来，你感到一种奇怪的、成熟的感觉；你的肚子因为未受精的卵子而微微隆起，你感到红润、柔软，并且准备好了。你开始急切地脱衣服；稍微恢复了一点后，" + benoitMF("本诺瓦","本诺瓦特") + "脱下" + benoitMF("他","她") + "的裤子，向你伸出手，然后停了下来。你对这个被阉割的蛇怪友善地笑了笑，放低身子坐在地板上，随意地张开你的[hips]，然后问" + benoitMF("他","她") + "是否看到……闻到什么有趣的东西。");
            }
            else
            {
               outputText("" + benoitMF("Benoit","Benoite") + "踉踉跄跄地走进后面的房间，把你在地上放下时撞到了几样东西，谢天谢地，你被放在了一块空地上。" + benoitMF("他","她") + "靠向你，" + benoitMF("他","她") + "的重量把你压在地上，双手在你的[armor]上飞舞，摸索着解开扣子和皮带。现在你的肠胃已经平静下来，你感到一种奇怪的、成熟的感觉；你的肚子因为未受精的卵而微微隆起，你感到红润、柔软，并且准备好了。你配合着" + benoitMF("他","她") + "，扭动着脱下衣服，并扯下" + benoitMF("他","她") + "自己的裤子，急切地张开你的[hips]，因为" + benoitMF("他","她") + "又长又光滑的肉棒已经立正了。");
            }
            outputText("[pg]蛇怪不需要进一步的邀请。片刻之后，" + benoitMF("他","她") + "就压在了你身上，" + benoitMF("他","她") + "紧绷、肌肉发达的胸膛紧贴着你的[chest]，" + benoitMF("他","她") + "平坦的腹部在你自己肥沃的肚子上摩擦，" + benoitMF("他","她") + "的肉棒头部顶着你湿润的嘴唇。");
            if(get_player().hasCock())
            {
               outputText("" + benoitMF("他","她") + "故意在你的身体上上下摩擦，被夹在你们温暖身体之间的[cock]在温暖、光滑的摩擦下迅速变硬。");
            }
            outputText("尽管" + benoitMF("他","她") + "看不见，" + benoitMF("他","她") + "还是径直滑入你湿润的深处，当" + benoitMF("他","她") + "坚硬、光滑的肉刺滑过你敏感的内壁时，你发出咕咕的叫声，" + benoitMF("他","她") + "慢慢地把自己拔出来，然后再次刺入，把" + benoitMF("他","她") + "更多的长度塞进你体内。在你的身体周围，" + benoitMF("他","她") + "总是无法完全控制自己，从" + benoitMF("他","她") + "脸上紧绷的表情和" + benoitMF("他","她") + "在你皮肤上粗重的呼吸中可以明显看出，" + benoitMF("他","她") + "正在尽一切努力克制自己不把你操翻在地；" + benoitMF("他","她") + "在每次抽插时都把" + benoitMF("他","她") + "的肉棒向上推，故意撞击你的[clit]，让你产生无法抗拒的快感痉挛。被不可阻挡地向上推，你用一只手臂搂住" + benoitMF("他","她") + "的脖子，亲吻" + benoitMF("他","她") + "的鼻子，咬紧牙关，然后在" + benoitMF("他","她") + "耳边低语，让" + benoitMF("他","她") + "不要再克制了。" + benoitMF("Benoit","Benoite") + "停顿了片刻来喘口气，完全没入你湿润的小穴中，然后把" + benoitMF("他","她") + "的臀部勾在你的臀部上，把你困在" + benoitMF("他","她") + "的身体周围，然后开始像手提钻一样操你柔软、成熟的身体。" + benoitMF("他","她") + "用尽全力捣入你体内，紧紧抓住你，你喷涌的[vagina]狂乱地将体液溅在你们交缠的身体上。现在已经迷失在发情中，" + benoitMF("Benoit","Benoite") + "用" + benoitMF("他","她") + "长长的舌头舔着你的脸，柔软、粘稠的压力压在你发红的脸颊上，似乎只会让" + benoitMF("他","她") + "长长的肉棒深深插入你的那种对比感变得更加压倒性。");
            get_player().cuntChange(14,true,true,false);
            outputText("[pg]当高潮袭来时，你无法控制自己尖叫起来，你的小穴紧紧夹住并绞拧着" + benoitMF("Benoit","Benoite") + "光滑的肉棒，" + benoitMF("他","她") + "继续猛烈地撞击你，直到" + benoitMF("他","她") + "再也承受不住你的榨取，也跟着高潮了，" + benoitMF("他","她") + "紧紧抓住你，将浓稠、温暖的精液喷射到你肥沃的深处。下半身被这样固定住，让你的高潮更加势不可挡；你在蛇怪强壮的腿上徒劳地扭动着，无法摆脱那难以忍受的快感。");
            outputText("[pg]在似乎一起沉浸在高潮中几分钟后，你们终于度过了最后的余韵。你们暂时交缠在一起，双手在彼此身上游走，享受着高潮后的余韵。");
            outputText("[pg][say: 你觉得这真的有用吗？]" + benoitMF("Benoit","Benoite") + "最终说道，" + benoitMF("他","她") + "的声音很低，几乎只是在喃喃自语。[say: 如果我只能给你雄性怎么办？]你已经想过这个问题了，但现在你觉得很有趣。" + benoitMF("他","她") + "的肉棒仍然在你体内，尽管它向你注入了大量的精液，但几乎没有变软；你咧嘴一笑，推开" + benoitMF("他","她") + "的胸膛，把腿跨过" + benoitMF("他","她") + "，直到你骑在" + benoitMF("他","她") + "身上。你非常缓慢地以圆周运动转动你的臀部，来回移动，故意摩擦卡在你体内的肉棒，直到它开始不可阻挡地再次变硬；当你虐待" + benoitMF("他","她") + "疼痛的性器官时，" + benoitMF("Benoit","Benoite") + "闭上" + benoitMF("他","她") + "的眼睛，发出咕哝声。你不愿意让" + benoitMF("他","她") + "只是坐着享受，你滑动手抓住" + benoitMF("他","她") + "的手腕，默默地把它们放在你的[nipples]上。" + benoitMF("他","她") + "呆呆地开始工作，小心翼翼地移动" + benoitMF("他","她") + "的手，" + benoitMF("他","她") + "的手指深深地按进你的肉里。当" + benoitMF("他","她") + "轻轻地抚摸和挤压你时，你告诉" + benoitMF("他","她") + "，无论你是否能生下雌性蛇怪，" + benoitMF("他","她") + "现在都是你孩子的父亲了，而且妈妈需要——你尽可能地挺起臀部，把" + benoitMF("他","她") + "的肉棒向后弯曲来表明你的观点——服务。很多很多的服务。在你的话语和你无情的性爱的驱使下，" + benoitMF("Benoit","Benoite") + "闭上" + benoitMF("他","她") + "的眼睛，在" + benoitMF("他","她") + "的手指间挤压你的乳头，无助地迎来了第二次高潮，在你体内喷出了一两团精液，然后" + benoitMF("他"
            ,"她") + "的肉棒在你湿透的内壁上徒劳地抽动着。");
            outputText("[pg]把你的种马完全榨干后，你翻身下马，清理干净并穿好衣服。在你离开之前，" + benoitMF("Benoit","Benoite") + "摸索着把你拉进一个紧紧的拥抱。");
            outputText("[pg][say: 把蛋带到这里来，]" + benoitMF("他","她") + "沙哑地说。[say: 无论结果如何，我都很荣幸能抚养像你这样的女人的孩子。]你调皮地打了一拳，说当" + benoitMF("他","她") + "的店里有十几个微小、长满鳞片的你时，" + benoitMF("他","她") + "可能会后悔这些话。你们分开并告辞，" + benoitMF("他","她") + "沙哑、略带恐惧的笑声在你耳边回荡。");
         }
         else
         {
            outputText("你把你的蜥蜴[benoit boy]拖进后面狭窄的房间，然后轻轻地把" + benoitMF("他","她") + "放下。现在你的肠胃已经平静下来，你感到一种奇怪的、成熟的感觉；你的马肚子因为未受精的卵而微微隆起，你感到红润、柔软，并且准备好了。你开始急切地脱衣服；" + benoitMF("Benoit","Benoite") + "稍微恢复了一下，脱下" + benoitMF("他","她") + "的裤子，向你伸出手，然后停了下来，脸红得厉害。你对这只被阉割的蛇怪友善地咧嘴一笑，放低身子坐在地板上，随意地张开你的[hips]，然后问" + benoitMF("他","她") + "是否看到……闻到了什么有趣的东西。");
            outputText("[pg]蛇怪不需要进一步的邀请。片刻之后，" + benoitMF("他","她") + "就压在了你身上，" + benoitMF("他","她") + "紧绷、肌肉发达的胸膛紧贴着你的[ass]，" + benoitMF("他","她") + "的双手在你自己肥沃的肚子上游走，" + benoitMF("他","她") + "的肉棒头部顶着你湿润的[vagina]。");
            if(get_player().hasCock())
            {
               outputText("" + benoitMF("他","她") + "故意把" + benoitMF("他","她") + "的手移到[oneCock]上，然后把它困在" + benoitMF("他","她") + "温暖的抓握中。它在" + benoitMF("他","她") + "温暖、光滑的摩擦下迅速变硬。");
            }
            outputText("尽管" + benoitMF("他","她") + "看不见，但现在已经习惯了你的身体，" + benoitMF("他","她") + "径直滑入你湿润的深处，当" + benoitMF("他","她") + "坚硬、光滑的肉刺滑过你敏感的内壁时，你发出咕咕的叫声，" + benoitMF("他","她") + "慢慢地把自己拔出来，然后再次刺入，把" + benoitMF("他","她") + "更多的长度塞进你体内。在你的身体周围，" + benoitMF("他","她") + "总是无法完全控制自己，从紧贴着你的肌肉的紧绷感和" + benoitMF("他","她") + "在你皮肤上粗重的呼吸中可以明显看出，" + benoitMF("他","她") + "正在尽一切努力克制自己不把你操翻在地；" + benoitMF("他","她") + "在每次抽插时都把" + benoitMF("他","她") + "的肉棒向下推，故意撞击你的[clit]，让你产生无法抗拒的快感痉挛。你慢慢向前移动，直到你的手臂撑在墙上，然后咬紧牙关回头对" + benoitMF("他","她") + "说不要再克制了。" + benoitMF("Benoit","Benoite") + "停顿了片刻来喘口气，完全没入你湿润的小穴中，然后把" + benoitMF("他","她") + "强壮的手臂勾在你的后端，把你困在" + benoitMF("他","她") + "的身体周围，然后开始像手提钻一样操你柔软、成熟的身体。" + benoitMF("他","她") + "用尽全力捣入你体内，紧紧抓住你，你喷涌的[vagina]狂乱地将体液溅在你们交缠的身体上。");
            get_player().cuntChange(14,true,true,false);
            outputText("[pg]当高潮来袭时，你忍不住尖叫出声，你的小穴紧紧夹住并绞弄着" + benoitMF("本诺瓦","本诺瓦特") + "光滑的肉棒，而" + benoitMF("他","她") + "则继续猛烈地撞击着你，直到" + benoitMF("他","她") + "再也承受不住你的榨取，与你一同迎来了高潮。" + benoitMF("他","她") + "紧紧抱住你，将浓稠温热的精液如喷泉般射入你肥沃的深处。下半身被这样固定住，让你的高潮变得更加势不可挡；你在蛇怪强壮的双腿间徒劳地扭动着，无法摆脱那难以忍受的快感。");
            outputText("[pg]在经历了仿佛长达数小时的共同高潮后，你们终于度过了余韵。你们暂时交缠在一起，双手在彼此身上游走，享受着事后的温存。");
            outputText("[pg][say: 你觉得这真的有用吗？] " + benoitMF("本诺瓦","本诺瓦特") + "终于开口了，" + benoitMF("他","她") + "的声音低得几乎像是在喃喃自语。[say: 如果我只能给你雄性后代怎么办？] 这个念头你早就想过了，但你现在正处于一种调皮的心情中。" + benoitMF("他","她") + "的肉棒还在你体内，尽管已经向你注入了大量的精液，却几乎没有疲软；你咧嘴一笑，向后推去，坐了下来，让" + benoitMF("他","她") + "被你野兽般的重量压在身下。你越过肩膀，与" + benoitMF("他","她") + "四目相对，同时非常缓慢地以画圈的方式转动你强健的臀部，来回摩擦，故意挑逗着卡在你体内的肉棒，直到它开始不可阻挡地再次变硬；当你蹂躏" + benoitMF("他","她") + "酸痛的性器时，" + benoitMF("本诺瓦","本诺瓦特") + "闭上眼睛，发出一声闷哼。你一边绞弄着" + benoitMF("他","她") + "，一边轻声告诉" + benoitMF("他","她") + "，不管你能不能生出雌性蛇怪，" + benoitMF("他","她") + "现在都是你孩子的" + benoitMF("父亲","母亲") + "了，而且妈妈需要——你尽可能地将臀部向前挺，把" + benoitMF("他","她") + "的肉棒向后弯曲以强调你的观点——服务。很多很多的服务。在你的话语和你无情的性爱驱使下，" + benoitMF("本诺瓦","本诺瓦特") + "闭上眼睛，抓住你的侧腹，无可奈何地迎来了第二次高潮，在你湿透的肉壁上徒劳地抽动着，又向你体内喷射了一两团精液。");
            outputText("[pg]将你的种马彻底榨干后，你站起身，清理干净并穿好衣服。在你离开之前，" + benoitMF("本诺瓦","本诺瓦特") + "摸索着将你的上半身紧紧抱住。");
            outputText("[pg][say: 把蛋带到这里来，] " + benoitMF("他","她") + "沙哑地说。[say: 不管它们孵出来是什么样，我都会很荣幸能抚养像你这样女人的孩子。] 你调皮地捶了" + benoitMF("他","她") + "一下，说等" + benoitMF("他","她") + "有一打长着鳞片的小号你把" + benoitMF("他","她") + "的店拆了的时候，" + benoitMF("他","她") + "可能会后悔说出这些话。你们分开后，你便离开了，耳边还回荡着" + benoitMF("他","她") + "沙哑、略带恐惧的笑声。");
         }
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,577,1);
         benoitKnocksUpPCCheck();
         if(get_player().get_pregnancyType() == 14)
         {
            get_player().knockUpForce(18,get_player().get_pregnancyIncubation());
         }
         doNext(get_camp().returnToCampUseOneHour);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
      }
      
      public function setBenoitShop(param1:Boolean = false) : void
      {
         if(get_game().time.hours >= 9 && get_game().time.hours <= 17)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1193) == 1 && get_game().time.days >= FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1182) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1193) != 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,562) == 0)
               {
                  if(!param1)
                  {
                     outputText("[pg]你注意到一个大市场摊位夹在两辆马车之间，被地毯包裹着，里面堆满了各种各样的物品。在它高耸的织物天篷上，有一块木牌，上面粗糙地写着“<b>壁虎的垃圾</b>”。你想知道那是怎么回事。");
                  }
                  else
                  {
                     addButton(0,"市场摊位",benoitIntro);
                  }
               }
               else if(!param1)
               {
                  outputText("[pg]蛇怪" + benoitMF("本诺瓦","本诺瓦特") + "的摊位看起来正在营业。你可以去看看有什么好东西。");
               }
               else
               {
                  addButton(0,benoitMF("本诺瓦","本诺瓦特") + "的摊位",benoitIntro).hint("浏览蛇怪的商品。");
               }
            }
         }
         else
         {
            addButtonDisabled(0,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,562) == 0 ? "市场摊位" : benoitMF("本诺瓦","本诺瓦特") + "的摊位","商店目前已关闭。请稍后再来。\n(营业时间：[if (time12hour) {上午9点至下午5点|9:00至17:00}])");
         }
      }
      
      public function repeatSexWithBenoitLetHim() : void
      {
         clearOutput();
         benoitSprite();
         if(get_player().isTaur())
         {
            outputText("[pg]目前你什么也没做；你只是站在后面，让" + benoitMF("his","her") + "手慢慢地抚摸你的身体。" + benoitMF("his","her") + "一只手停在你的[nipples]上；当" + benoitMF("he","she") + "轻轻地挑逗和揉捏那柔软敏感的肉体时，" + benoitMF("his","her") + "另一只手向下游移，穿过你的腹部，绕过你的腰，顺着你天鹅绒般的背部滑下。虽然" + benoitMF("he","she") + "现在已经熟悉了你的身体，但" + benoitMF("Benoit","Benoite") + "似乎从未停止过对你身体的着迷；当" + benoitMF("his","her") + "光滑的手抚过你温暖的肌肤时，" + benoitMF("his","her") + "脸上带着一种下意识的专注皱眉，就好像" + benoitMF("he","she") + "正在" + benoitMF("his","her") + "脑海中描绘你的轮廓。");
            outputText("[pg]这种缓慢、轻柔的按压固然很好，但你忍不住想，你是否能在这个胆小的蛇怪身上唤醒一些更具兽性的东西。让" + benoitMF("him","her") + "对你失去自控力的想法让你咧嘴一笑，你温柔而坚定地把手放在" + benoitMF("his","her") + "爪子上，告诉" + benoitMF("him","her") + "停下来。" + benoitMF("He","She") + "困惑地看着你。你微笑着开始以其人之道还治其人之身；你的手轻轻地滑过" + benoitMF("his","her") + "紧致光滑的肉体，顺着" + benoitMF("his","her") + "平坦的腹部向下，直到触及" + benoitMF("his","her") + "长内裤。你慢慢地解开它们，让它们掉落，释放出" + benoitMF("his","her") + "又长又细的勃起。你用一只手轻轻地在根部画圈；即使是触摸" + benoitMF("his","her") + "阴茎这个最不敏感的部位，也让" + benoitMF("him","her") + "因渴望而发出咕哝声，" + benoitMF("his","her") + "心脏的跳动在" + benoitMF("his","her") + "鳞片间回荡，" + benoitMF("he","she") + "不由自主地向前挺动，试图让你的手更多地触碰" + benoitMF("him","her") + "。你再次告诉" + benoitMF("him","her") + "保持安静。你继续几乎是在为" + benoitMF("him","her") + "手淫，你的一只手摩擦着" + benoitMF("his","her") + "肉棒的根部和它挺出的阴唇，同时你非常轻柔地摇摆着你强壮的后臀，看到蛇怪强烈的兴奋，你的[vagina]开始湿润。空气中弥漫着你性爱的气味，而你无法向后伸手做任何事情的事实只会加剧你的兴奋。" + benoitMF("Benoit","Benoite") + "咬紧" + benoitMF("his","her") + "尖牙，微微颤抖着，就像一根即将爆裂的管子，" + benoitMF("his","her") + "尾巴断断续续地抽打着，当你笨重地转身，将你的臀部引向" + benoitMF("him"
            ,"her") + "，将你的精华涂抹在" + benoitMF("his","her") + "极其敏感的鼻孔上时。当开始沙哑地说话时，" + benoitMF("he","she") + "能闻到的只有你自己的情欲，你说你一直是个在山里玩耍的调皮女孩，你戏弄、逃跑并嘲笑你遇到的每一个生物，但现在一只大坏蛇怪把你逼到了角落，而这只大坏蛇怪现在独自拥有了这个调皮女孩，它打算做些什么呢……？");
            outputText("[pg][benoit Name]猛地向前冲去，抓住你的[butt]，转身将你按在墙上。你的笑声变成了喘息，伴随着一声几乎痛苦的低吼，" + benoitMF("Benoit","Benoite") + "将自己径直插入你湿润的小穴。当" + benoitMF("he","she") + "开始肆无忌惮地操你时，你只能紧紧抓住马车的墙壁，随着" + benoitMF("he","she") + "每一次挺进将你的[hips]向上抬起，将你人类的前半身向前推。" + benoitMF("He","She") + "因欲望而变得笨拙且盲目，除了紧紧抓住你的身体并将自己深深埋入你的深处之外，什么都不在乎，你的淫水涂满了" + benoitMF("his","her") + "鼻子，燃烧出一条无法阻挡的路径直达" + benoitMF("his","her") + "大脑，" + benoitMF("he","she") + "根本无法控制自己。" + benoitMF("His","Her") + "信息素驱使的冷酷以及木头摩擦你双手的不适感");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("和[fullChest]");
            }
            outputText("增加了这场性爱的粗暴程度，你发现自己被它带着走，将你强壮的臀部向后顶向蛇怪，将" + benoitMF("him","her") + "更深地夹入你的体内，享受着" + benoitMF("his","her") + "坚实、致密的质量猛烈撞击你的感觉。你的[vagina]在" + benoitMF("his","her") + "急躁、紧绷的阴茎周围滴下汁液，当" + benoitMF("his","her") + "光滑的长度沿着你敏感的通道用力摩擦时，几乎要起泡了。");
            get_player().cuntChange(14,true,true,false);
            outputText("[pg]粗暴的性爱让你喘不过气来，失去了理智，当你达到高潮时，你感到头晕目眩，喘息着发出喉音，因为" + benoitMF("Benoit","Benoite") + "的猛烈撞击让你的小穴在" + benoitMF("him","her") + "周围收缩痉挛。" + benoitMF("He","She") + "也加入进来，发出一声粗重、气喘吁吁的低吼，你感觉到一阵又一阵的精液带着温暖淹没了你的深处。在你们互相激烈碰撞完之后，你们停留在原地，在彼此身上平复呼吸。过了一会儿你才意识到" + benoitMF("he","she") + "并没有软下去，仍然牢牢地嵌在你的体内；你们混合的体液顺着你的大腿滴落，你的麝香依然弥漫在空气中。" + benoitMF("He","She") + "对你咧嘴一笑，给了你一个微小的挺进，让你咬住了嘴唇；射精似乎只是稍微削弱了你引发的" + benoitMF("him","her") + "的发情期。[say: 你不会以为你能这么容易就逃脱吧，对吗？] " + benoitMF("he","she") + "轻声低吼道。");
            outputText("[pg][benoit Ey]从你体内抽出，离开时拖着精液的丝线，然后慢慢地把你转过来，用" + benoitMF("his","her") + "脚费力地摸索着一块空地，然后把你放下，温柔但坚定地让你下半身着地。" + benoitMF("His","Her") + "手落在你的[butt]上；你咧嘴笑着，诱人地把它向外撅起，假装沮丧地叹了口气，因为盲眼的蛇怪正费力地将" + benoitMF("his","her") + "下一次射击对准你流着口水、黏糊糊的性器官。");
            outputText("[pg]当" + benoitMF("他","她") + "滑入你体内时，" + benoitMF("他","她") + "几乎没有遇到任何阻力；你们俩已经把你的小穴变成了一个诱人的、黏糊糊的肉套。");
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("你不介意；你紧致的阴部完美地贴合了" + benoitMF("他","她") + "光滑细长的阴茎，你配合着" + benoitMF("他","她") + "的抽插，随着" + benoitMF("他","她") + "的长度收缩和放松你的肉壁，你的润滑液让" + benoitMF("他","她") + "能够迅速加快节奏，直到你们俩再次欢快地互相撞击，你们的体液溅在彼此身上。");
            }
            else
            {
               outputText("虽然" + benoitMF("he","she") + "很长，但" + benoitMF("he","she") + "几乎没有碰到你包容的小穴的边缘。这种感觉对你来说并不好，直到" + benoitMF("he","she") + "真正开始大干一场，用尽" + benoitMF("he","she") + "所有的力气撞击你，在你的[butt]上打出湿润的断奏，当" + benoitMF("he","she") + "将自己插入你体内时，推挤着你的[clit]。随着你光滑的快乐按钮因日益增加的愉悦而膨胀，你的体液开始滴落在你的蹄子上。");
            }
            outputText("[pg]姿势的改变让" + benoitMF("他","她") + "的肉棒以不同的角度弯曲进入你的体内，摩擦着一个被忽视的敏感点，很快就让你饥渴地喘息起来。" + benoitMF("本诺瓦","本诺瓦特") + "不像第一次那样疯狂了，" + benoitMF("他","她") + "有足够的镇定将自己拔出；" + benoitMF("他","她") + "放慢速度，然后再次加速，威风凛凛地操着你，几乎完全退出你的身体，然后狠狠地插回去，停留在你的体内，直到你乞求并呻吟着让" + benoitMF("他","她") + "继续。你将自己交给了你在" + benoitMF("他","她") + "身上唤醒的支配欲，当你被操到第二次甚至第三次高潮时，你迎合着" + benoitMF("他","她") + "的抽插；一切都消失在永恒的红色迷雾中，你翘起[butt]，得到了母马所需要的一切。");
            outputText("[pg]当" + benoitMF("本诺瓦","本诺瓦特") + "终于射精时，" + benoitMF("他","她") + "的声音听起来几乎有些痛苦；" + benoitMF("他","她") + "酸痛的肉棒将另一股精液射入你已经塞满的子宫，精液滴落并喷溅在地板上。你尽可能久地套弄着" + benoitMF("他","她") + "的肉棒，直到它最终从你被蹂躏的小穴中滑落。最后你坐起来，转过身，依偎在蛇怪的怀里，蛇怪瘫软在地板上，试探性地回应着你。");
            outputText("[pg][say: 刚才真是……哇，]" + benoitMF("他","她") + "勉强说道。随着" + benoitMF("他","她") + "的肉棒榨干了最后一滴精液，你可以看到" + benoitMF("他","她") + "正在恢复理智，" + benoitMF("他","她") + "搂着你腰的手也很谨慎。[say: 刚才……你还满意吗？我不知道如果……我闻到这些气味，然后……]你亲吻了" + benoitMF("他","她") + "的脸颊作为回答，并用戏谑的沙哑嗓音说感觉很好，但也许下次" + benoitMF("他","她") + "不应该那么克制。" + benoitMF("他","她") + "听了咧嘴一笑。你们花了一点时间拥抱，从激烈的性爱中恢复过来，然后你终于站了起来。在你穿好衣服离开之前，你最后做的一件事是再次将你的气味轻轻拂过" + benoitMF("本诺瓦","本诺瓦特") + "的鼻子，告诉" + benoitMF("他","她") + "，你希望" + benoitMF("他","她") + "在下次这个坏女孩来拜访时做好准备。" + benoitMF("他","她") + "没有回应——也许" + benoitMF("他","她") + "还在为对你失去理智而暗自羞愧——但你可以从" + benoitMF("他","她") + "脸上的线条，以及" + benoitMF("他","她") + "的头不自觉地跟着你走出商店的动作看出，你永远不需要担心" + benoitMF("他","她") + "不会被你唤起性欲。");
         }
         else
         {
            outputText("目前你什么也没做；你只是站在后面，让" + benoitMF("他","她") + "的手慢慢地滑过你的身体。" + benoitMF("他","她") + "的一只手停留在你的[nipple]上；当" + benoitMF("他","她") + "温柔地挑逗和揉捏那柔软敏感的肌肤时，" + benoitMF("他","她") + "的另一只手向下游走，穿过你的腹部，绕过你的[butt]缝，然后向下托住你的臀部。虽然" + benoitMF("他","她") + "现在对你的身体很熟悉，但" + benoitMF("本诺瓦","本诺瓦特") + "似乎从未停止过对你身体的迷恋；当" + benoitMF("他","她") + "光滑的手滑过你温暖的皮肤时，" + benoitMF("他","她") + "的脸上不自觉地皱起了专注的眉头，仿佛" + benoitMF("他","她") + "正在脑海中描绘你的模样。");
            outputText("[pg]这种缓慢、温柔的施压固然很好，但你忍不住想，你是否能在这个胆小的蛇怪身上唤醒一些更具兽性的东西。一想到要让" + benoitMF("他","她") + "对你失去自控力，你就忍不住暗自窃笑，你温柔而坚定地把手放在" + benoitMF("他","她") + "的爪子上，告诉" + benoitMF("他","她") + "停下来。当你转动身体时，" + benoitMF("他","她") + "困惑地看着你，你的手滑过" + benoitMF("他","她") + "的肩膀和胸部，你改变了姿势，让你背靠着墙。" + benoitMF("他","她") + "又开始移动" + benoitMF("他","她") + "的手，你嘲弄地啧啧两声，告诉" + benoitMF("他","她") + "现在先别动。你微笑着，开始用" + benoitMF("他","她") + "自己的方式对待" + benoitMF("他","她") + "；你的手轻柔地滑过" + benoitMF("他","她") + "紧致光滑的肌肤，顺着" + benoitMF("他","她") + "搓衣板般的腹部向下，直到触及" + benoitMF("他","她") + "的长内裤。你慢慢解开带扣，让它们掉落，释放出" + benoitMF("他","她") + "细长的勃起。你用一只手轻轻地在根部画圈；即使是触摸" + benoitMF("他","她") + "肉棒上最不敏感的部位，也会让" + benoitMF("他","她") + "饥渴地咕哝，" + benoitMF("他","她") + "的心跳声透过" + benoitMF("他","她") + "的鳞片回荡，" + benoitMF("他","她") + "不由自主地向前挺动，试图让你的手更多地触碰" + benoitMF("他","她") + "。你再次告诉" + benoitMF("他","她") + "别动。你继续近乎手淫地抚摸" + benoitMF("他","她") + "，你的一只手摩擦着" + benoitMF("他","她") + "肉棒的根部和它挺出的缝隙，同时另一只手向下伸去，触摸你自己越来越湿润的[vagina]。当你把一根手指，然后是两根手指伸进你的蜜罐，轻轻地揉搓你的[clit]，直到你欲火焚身，淫液滴落在你身下压实的泥土上时，你夸张地呻吟着。" + benoitMF("本诺瓦"
            ,"本诺瓦特") + "咬紧" + benoitMF("他","她") + "尖锐的牙齿，像一根即将爆裂的管子一样微微颤抖，你抬起沾满淫液的手指，将你的精华涂抹在" + benoitMF("他","她") + "极其敏感的鼻孔上。当你继续折磨" + benoitMF("他","她") + "的肉棒，只是轻轻触碰" + benoitMF("他","她") + "紫色的龟头，然后又回到" + benoitMF("他","她") + "的根部时，" + benoitMF("他","她") + "的尾巴不安地抽打着。当开始用沙哑的声音说话时，" + benoitMF("他","她") + "能闻到的只有你自己的情欲，你说你一直是个在山里玩耍的坏女孩，你戏弄、嘲笑并逃离了你遇到的每一个生物，但现在一只大坏蛇怪把你逼到了角落，现在这只大坏蛇怪独自拥有了这个坏女孩，它打算怎么做呢……？");
            outputText("[pg][benoit Name]猛地向前扑来，抓住你的[butt]将你按在墙上。你的笑声变成了喘息，因为" + benoitMF("他","她") + "将你挑逗的双手举起，用" + benoitMF("他","她") + "庞大的身躯将它们压住，伴随着一声几乎痛苦的低吼，径直挺进你湿润的小穴。你只能紧紧抓住" + benoitMF("他","她") + "的背，因为" + benoitMF("他","她") + "开始肆无忌惮地操你，每一次抽插都让你的背撞在马车的墙上，并将你的[hips]向上抬起。" + benoitMF("他","她") + "既盲目又被欲望冲昏了头脑，显得笨拙无比，除了紧紧抱住你的身体并将自己深深埋入你的深处之外，什么都不在乎。你的淫液沾满了" + benoitMF("他","她") + "的鼻子，灼烧着一条无法阻挡的路径直达" + benoitMF("他","她") + "的大脑，让" + benoitMF("他","她") + "无法自控。" + benoitMF("他","她") + "在信息素驱使下的粗暴，以及木头摩擦你背部和臀部带来的不适，加剧了这场性爱的粗野，你发现自己也沉浸其中，用双腿缠住蛇怪纤细的腰肢，将" + benoitMF("他","她") + "夹得更深，享受着" + benoitMF("他","她") + "坚实致密的身躯撞击你的快感。你的[vagina]在" + benoitMF("他","她") + "急躁、紧绷的肉棒周围滴落着汁液，随着" + benoitMF("他","她") + "光滑的长度在你敏感的通道里用力摩擦，几乎要泛起白沫。");
            outputText("[pg]粗暴的性爱让你喘不过气来，也让你失去了理智，当你达到高潮时，你感到一阵眩晕，喘息着发出喉音，因为" + benoitMF("本诺瓦","本诺瓦特") + "的撞击让你的小穴紧紧收缩并痉挛着包裹住" + benoitMF("他","她") + "。" + benoitMF("他","她") + "也发出一声粗重、气喘吁吁的低吼，你感觉到一阵又一阵的精液涌入你的深处，带来阵阵温暖。在你们互相激烈碰撞之后，你们静止下来，在彼此身上平复着呼吸。过了一会儿你才意识到" + benoitMF("他","她") + "并没有软下来，" + benoitMF("他","她") + "的肉棒仍然牢牢地嵌在你的体内；你们混合的体液顺着你的大腿滴落，你的麝香味仍然弥漫在空气中。" + benoitMF("他","她") + "对你咧嘴一笑，轻轻地顶了你一下，让你咬紧了嘴唇；射精似乎只是稍微缓解了你诱发的" + benoitMF("他","她") + "的发情期。[say:你不会以为你能这么容易就逃脱吧？]" + benoitMF("他","她") + "轻声低吼道。");
            outputText("[pg][benoit Ey]从你体内抽出，带出丝丝缕缕的精液，然后慢慢将你转过身来，用" + benoitMF("他","她") + "的脚费力地摸索着一块空地，然后将你放下，温柔但坚定地让你双手和");
            if(get_player().isBiped())
            {
               outputText("膝盖着地");
            }
            else
            {
               outputText("下半身着地");
            }
            outputText("。" + benoitMF("他","她") + "的手落在了你的[butt]上；你咧嘴笑着，诱人地向外撅起屁股，装作沮丧地叹了口气，因为这个失明的蛇怪正煞费苦心地将" + benoitMF("他","她") + "的下一发瞄准你那流着口水、黏糊糊的阴部。");
            outputText("[pg]当" + benoitMF("他","她") + "滑入你体内时，" + benoitMF("他","她") + "几乎没有遇到任何阻力；你们俩已经把你的小穴变成了一个诱人的、黏糊糊的肉套。");
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("你不介意；你紧致的阴部完美地贴合了" + benoitMF("他","她") + "光滑细长的阴茎，你配合着" + benoitMF("他","她") + "的抽插，随着" + benoitMF("他","她") + "的长度收缩和放松你的肉壁，你的润滑液让" + benoitMF("他","她") + "能够迅速加快节奏，直到你们俩再次欢快地互相撞击，你们的体液溅在彼此身上。");
            }
            else
            {
               outputText("虽然" + benoitMF("他","她") + "很长，但" + benoitMF("他","她") + "几乎碰不到你宽阔小穴的边缘。直到" + benoitMF("他","她") + "真正开始发力，用尽全力撞击你，在你的[butt]上拍打出湿润的断奏，你才感觉到快感。当" + benoitMF("他","她") + "将自己埋入你体内时，你将一只手伸到后面，开始用手指抚摸你的[clit]，当你越来越高兴地揉弄你那光滑、肿胀的快乐按钮时，" + benoitMF("他","她") + "的体液顺着你的手指流下。");
            }
            get_player().cuntChange(10,true,true,false);
            outputText("姿势的改变让" + benoitMF("他","她") + "的阴茎以一个角度弯曲进入你体内，摩擦着一个被忽视的部位，很快就让你渴望地喘息起来。" + benoitMF("Benoit","Benoite") + "不像第一次那样疯狂，" + benoitMF("他","她") + "有足够的镇定将自己抽出来；" + benoitMF("他","她") + "放慢速度，然后再次加快，威严地操着你，几乎完全抽出，然后又重重地插回去，停留在你体内，直到你乞求并呻吟着让" + benoitMF("他","她") + "继续。你把自己交给了你在" + benoitMF("他","她") + "身上唤醒的支配欲，当你被操到第二个狂喜的高潮，然后是第三个时，你向后迎合着" + benoitMF("他","她") + "；一切都消失在永恒的红色雾霾之下，你四肢着地，撅起[butt]，得到了雌性动物所需要的东西。");
            outputText("[pg]当" + benoitMF("本诺瓦","本诺瓦特") + "终于高潮时，" + benoitMF("他","她") + "的声音听起来几乎有些痛苦；" + benoitMF("他","她") + "酸痛的肉棒将又一股精液射入你早已被填满的子宫，精液顺着大腿滴落，喷溅在地板上。你尽可能久地套弄着" + benoitMF("他","她") + "的阴茎，直到它终于从你被蹂躏的阴道中滑落。最后，你爬起来坐好，依偎在蛇怪怀里，蛇怪瘫软在地板上，试探性地回应着你。");
            outputText("[pg][say: 刚才那真是……哇哦，] " + benoitMF("他","她") + "勉强挤出一句话。随着" + benoitMF("他","她") + "的肉棒被榨干最后一滴精液，你可以看出" + benoitMF("他","她") + "正在恢复理智，" + benoitMF("他","她") + "放在你肩膀上的手也变得小心翼翼。[say: 刚才……你感觉还好吗？我不知道……我一闻到那些味道，脑子里就……] 你亲吻了" + benoitMF("他","她") + "的脸颊作为回答，并用戏谑沙哑的声音说感觉很好，不过也许下次" + benoitMF("他","她") + "不应该这么克制。" + benoitMF("他","她") + "听了咧嘴一笑。你们又依偎了一会儿，从刚才激烈的性爱中恢复过来，然后你才终于站起身。在穿好衣服离开之前，你做的最后一件事是用慵懒的手指探入自己的阴道，然后将你的气味轻轻抹在" + benoitMF("本诺瓦","本诺瓦特") + "的鼻子上，告诉" + benoitMF("他","她") + "，你希望下次这个坏女孩来拜访时，" + benoitMF("他","她") + "能做好准备。" + benoitMF("他","她") + "没有回答——也许" + benoitMF("他","她") + "还在为刚才对你失去理智而暗自羞愧——但你可以从" + benoitMF("他","她") + "脸上的线条，以及" + benoitMF("他","她") + "的头下意识地跟着你走出商店的动作看出，你永远不必担心" + benoitMF("他","她") + "对你提不起性趣。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,573,FlagDict_Impl_.arrayReadInt(_loc1_,573) + 1);
         benoitKnocksUpPCCheck();
         benoitAffection(2);
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatBenoitFuckTakeCharge() : void
      {
         clearOutput();
         benoitSprite();
         if(get_player().isTaur())
         {
            outputText("[pg]你暂时什么也没做；只是向后退了一步，任由" + benoitMF("他","她") + "的双手在你身上缓慢游走。" + benoitMF("他","她") + "的一只手停在你的[nipple]上；当" + benoitMF("他","她") + "温柔地挑逗和揉捏那柔软敏感的肌肤时，" + benoitMF("他","她") + "的另一只手向下游移，滑过你的腹部，然后慢慢顺着你庞大的马身向后抚摸。尽管" + benoitMF("他","她") + "现在对你的身体已经很熟悉了，但" + benoitMF("本诺瓦","本诺瓦特") + "似乎永远都对你的身体着迷；当" + benoitMF("他","她") + "光滑的双手抚过你温暖的肌肤时，" + benoitMF("他","她") + "的脸上下意识地皱起眉头，全神贯注，仿佛" + benoitMF("他","她") + "正在脑海中描绘你的模样。");
            if(get_player().isTaur())
            {
               outputText("[pg]" + benoitMF("他","她") + "的双手向下游移，直到" + benoitMF("他","她") + "带着一抹浅笑，找到了" + benoitMF("他","她") + "知道就在那里的东西。" + benoitMF("他","她") + "用干燥光滑的手掌握住你半勃起的肉棒，上下套弄，摩擦并揉搓着你，直到你完全勃起。你闭上眼睛，叹了口气，享受着这种你们俩都只能感觉到、却看不见的精湛手法。");
            }
            outputText("[pg]" + benoitMF("他","她") + "的双手向上游移，抚过你兽性的臀部，探索着你柔软的肌肤，直到" + benoitMF("他","她") + "触碰到你的阴唇。你闭上眼睛，叹了口气，" + benoitMF("他","她") + "用光滑的手指慢慢分开它们，滑入你的[vagina]。尽管" + benoitMF("他","她") + "的呼吸变得越来越沉重，但" + benoitMF("他","她") + "似乎也对你充满了真正的好奇；" + benoitMF("他","她") + "的手指以令人惊讶的温柔抚过你渐渐湿润的私处，探索着你的每一处褶皱，并且越探越深。当" + benoitMF("他","她") + "触碰到敏感点时，你用叹息声让" + benoitMF("他","她") + "知道什么能让你愉悦，并刻意配合着" + benoitMF("他","她") + "手指的动作，好让" + benoitMF("他","她") + "能更好地照顾到那些地方。" + benoitMF("他","她") + "很快就找到了你的[clit]，它正因渴望而开始肿胀；" + benoitMF("他","她") + "慢慢地在它周围打圈，然后轻弹它，温柔地为你手淫。");
            if(get_player().get_inHeat())
            {
               outputText("此时你的小穴几乎已经泛滥成灾，在蛇怪温柔而细致的探索下，你体内深藏的费洛蒙需求被彻底点燃。你无法停止向" + benoitMF("他","她") + "湿透的手上挺动，用沉重的呻吟宣告着你有多么渴望。");
            }
            outputText("[pg]空气中弥漫着你发情的味道，当" + benoitMF("Benoit","Benoite") + "吸入这股气味时，" + benoitMF("他","她") + "的呼吸变得更加沉重。" + benoitMF("他","她") + "的勃起在长内裤里鼓胀起来，你决定是时候掌握主动权了；你向后退去，用你强壮的身体不断地顶撞" + benoitMF("他","她") + "，直到把" + benoitMF("他","她") + "按在对面墙上的一个角落里。你越过肩膀看着" + benoitMF("他","她") + "解开皮带，让裤子掉下来。在你身体散发的费洛蒙的刺激下，" + benoitMF("他","她") + "那又长又细的紫色阴茎紧绷着，当你撅起你的[butt]并贴上去时，" + benoitMF("他","她") + "弓起背，张开了嘴。光看" + benoitMF("他","她") + "强烈的性奋，你就知道你必须慢慢来，以防" + benoitMF("他","她") + "直接射出来；你露出了一个伴侣看不到的邪恶微笑，你觉得你对" + benoitMF("他","她") + "的影响如此之大，就算" + benoitMF("他","她") + "射了可能也无所谓。尽管如此，当" + benoitMF("他","她") + "把手放在你的侧腹上时，你叹了口气，向后引导，尽可能温柔地将" + benoitMF("他","她") + "的长度慢慢滑入你湿润的[vagina]中。");
            outputText("[pg]本诺瓦的肉棒异常光滑，你以不可思议的顺滑感向下移动。你没有立刻将自己完全埋进去，而是只让三分之一进入你湿润的深处，然后慢慢地将它拔出，缓慢地起伏。你停下来，让" + benoitMF("他","她") + "敏感的龟头刚好在里面，刻意地转动你的[hips]，当它在你光滑的肉壁内缓慢旋转时，你发出了叹息。" + benoitMF("Benoit","Benoite") + "干涩地呻吟着，你感觉到" + benoitMF("他","她") + "的身体紧绷起来；你立刻停止动作并等待，只有当" + benoitMF("他","她") + "平静下来时，才逐渐开始再次旋转和挺动。当你再次向前弯腰时，你让" + benoitMF("他","她") + "滑入更多，这次只把" + benoitMF("他","她") + "的根部留在外面；当你感觉到" + benoitMF("他","她") + "更深地潜入你湿润的深处时，你叹了口气。" + benoitMF("他","她") + "发出一声野兽般的低吼，试图将自己挺进你体内并压在你身上；你嘲弄地啧啧两声，从" + benoitMF("他","她") + "身边抽离，停止动作，直到蛇怪显然用巨大的意志力让自己平静下来，背靠着墙，任由你摆弄" + benoitMF("他","她") + "。");
            outputText("[pg]");
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("你再次滑坐到" + benoitMF("他","她") + "身上，这次当你感觉到" + benoitMF("他","她") + "到底时，你发出了娇喘，" + benoitMF("他","她") + "还有几英寸留在你体外。" + benoitMF("他","她") + "那细长的尺寸对你紧致的小穴来说再完美不过了；当你如梦似幻地在" + benoitMF("他","她") + "体内进出时，" + benoitMF("他","她") + "摩擦着你的肉壁，让快感的浪潮传遍你的全身。");
            }
            else
            {
               outputText("你再次滑坐到" + benoitMF("他","她") + "身上，这次当你的腹股沟与" + benoitMF("他","她") + "肌肉发达的大腿湿润地贴合，你的小穴将" + benoitMF("他","她") + "的肉棒整个吞没时，你发出了娇喘。你开始用力而缓慢地骑乘" + benoitMF("他","她") + "，将" + benoitMF("他","她") + "的肉棒向上弯曲，挤压你敏感的肉壁，快感的浪潮开始流遍你的全身。");
            }
            outputText("[pg]你保持着这种缓慢的节奏，感觉像过了几个小时，走走停停，刻意地拉扯和推挤，以保持对这只被你逼到角落的蛇怪的控制。这种做爱的节奏对" + benoitMF("本诺瓦","本诺瓦特") + "来说显然是痛苦的；" + benoitMF("他","她") + "随着你[vagina]湿润的动作喘息、紧绷、倒吸凉气，" + benoitMF("他","她") + "的脸和胸膛因极度兴奋而涨红，但" + benoitMF("他","她") + "让你保持控制，最终除了躺下任你摆布之外什么也做不了。");
            get_player().cuntChange(14,true,true,false);
            if(get_player().lactationQ() >= 50)
            {
               outputText("缓慢而性感的做爱足以让你敏感的[nipples]开始渗出乳汁；随着水流的加剧，你呻吟起来，直到你本能地揉捏着你的[chest]，将你甜美温暖的体液喷洒在地板上。听到这个声音，" + benoitMF("本诺瓦","本诺瓦特") + "着实吃了一惊。[say: 哺乳动物真是太奇怪了，]" + benoitMF("他","她") + "嘟囔着，逗得你咯咯直笑。");
            }
            outputText("[pg]随着" + benoitMF("他","她") + "温暖的双手继续在你的臀部游走，你的欲望不断攀升，最终你失去了理智，开始不顾一切地在" + benoitMF("他","她") + "身上起伏，渴望达到顶峰。当你真正开始操" + benoitMF("他","她") + "时，" + benoitMF("本诺瓦","本诺瓦特") + "喘息着，配合着你的动作挺动；当你的身体拍打在蛇怪紧绷的肌肉上时，你动情的淫液溅到了" + benoitMF("他","她") + "的大腿上。当" + benoitMF("他","她") + "高潮时，" + benoitMF("他","她") + "发出了一声刺耳的野兽般的叫声；" + benoitMF("他","她") + "那双盲眼向上翻白，紧紧抓住你的后背，将一波又一波的精液射入你翻腾的深处。" + benoitMF("他","她") + "精液的温暖和" + benoitMF("他","她") + "无助的抽搐将你推向了自己的高潮；难以抑制的快感脉冲淹没了你的大脑，在漫长的几分钟里，你除了趴在蛇怪身上哭泣和尖叫，紧紧抱住" + benoitMF("他","她") + "的后背，榨干" + benoitMF("他","她") + "肉棒里的最后一滴精液之外，什么也做不了。");
            if(get_player().hasCock())
            {
               outputText("[EachCock]也响应着你女性的高潮而变粗并喷射，将地板溅满了白色的浊液。");
            }
            outputText("[pg]你们瘫倒在压实的泥土地面上，依偎了一会儿，互相拥抱着沐浴在余韵中，静静地听着远处嘉年华的喧闹声。");
            outputText("[pg][say: 我真不知道自己做了什么才配得上你，] " + benoitMF("Benoit","Benoite") + "终于开口了，" + benoitMF("他","她") + "的声音几乎只是喉咙里沙哑的低语。你调皮地戳了戳" + benoitMF("他","她") + "的肋骨，说你只是为了那个防腐剂才这么做的。" + benoitMF("他","她") + "咧嘴笑了，然后你们俩起身穿好衣服，各自离开。");
         }
         else
         {
            outputText("暂时你什么也没做；你只是退后一步，任由" + benoitMF("his","her") + "的双手在你的身体上缓慢游走。" + benoitMF("his","her") + "的一只手停在你的[nipple]上；当" + benoitMF("he","she") + "温柔地挑逗和揉捏那柔软敏感的肌肤时，" + benoitMF("his","her") + "的另一只手向下移动，滑过你的腹部，绕过你的[butt]沟，然后向下托住你的臀部。尽管" + benoitMF("he","she") + "现在对你的身体已经很熟悉了，但" + benoitMF("Benoit","Benoite") + "似乎永远不会停止为你着迷；当" + benoitMF("his","her") + "光滑的双手抚过你温暖的肌肤时，" + benoitMF("his","her") + "脸上无意识地皱起眉头，仿佛" + benoitMF("he","she") + "正在脑海中描绘你的模样。");
            if(get_player().hasCock())
            {
               outputText("[pg]" + benoitMF("他","她") + "的手向下游走，直到带着一抹坏笑，" + benoitMF("他","她") + "找到了" + benoitMF("他","她") + "知道在那里的东西。" + benoitMF("他","她") + "用干燥光滑的手掌握住你半勃起的阴茎，上下套弄，揉搓盘绕，直到你紧绷起来。你决定是时候自己动手感受一下了；你隔着裤子抓捏" + benoitMF("他","她") + "紧致柔软的臀部，当你挺进" + benoitMF("他","她") + "体内时，" + benoitMF("他","她") + "不禁喘息起来。");
            }
            outputText("" + benoitMF("His","Her") + "的双手继续向下游走，移到你的大腿内侧，探索着你柔软的肌肤，直到" + benoitMF("he","she") + "触碰到你的阴唇。你闭上眼睛，叹了口气，任由" + benoitMF("he","she") + "用" + benoitMF("his","her") + "光滑的手指慢慢分开它们，滑入你的[vagina]。虽然" + benoitMF("his","her") + "的呼吸变得越来越沉重，但" + benoitMF("he","she") + "似乎也对你充满了真正的好奇；带着令人惊讶的温柔，" + benoitMF("his","her") + "的手指在你湿润的私处周围游走，探索着你的每一处褶皱，随着动作越来越深入。当" + benoitMF("he","she") + "触碰到敏感点时，你用叹息告诉" + benoitMF("him","her") + "什么能让你愉悦，并刻意配合" + benoitMF("his","her") + "手指的动作，以便" + benoitMF("he","she") + "能更好地照顾到那些地方。" + benoitMF("He","She") + "很快就找到了你的[clit]，它正因渴望而微微肿胀；" + benoitMF("he","she") + "慢慢地在周围打圈，然后轻轻弹拨，温柔地抚慰着你。");
            if(get_player().get_inHeat())
            {
               outputText("此时你的阴道几乎要喷涌而出，你身体深处对信息素的渴望被蛇怪温柔细致的探索推向了顶峰。你无法控制自己迎合着" + benoitMF("his","her") + "湿透的手指挺动，用沉重的呻吟宣告你有多么渴望。");
            }
            outputText("[pg]空气中弥漫着你发情的味道，当" + benoitMF("本诺瓦","本诺瓦特") + "吸入这股气味时，" + benoitMF("他","她") + "的呼吸变得更加沉重。" + benoitMF("他","她") + "的勃起在" + benoitMF("他","她") + "的长内裤里鼓了起来，你决定是时候由你来主导了；你把" + benoitMF("他","她") + "推到墙上，解开" + benoitMF("他","她") + "的皮带，让" + benoitMF("他","她") + "的裤子掉下来。在你身体散发出的费洛蒙的刺激下，" + benoitMF("他","她") + "那根又长又细的紫色肉棒紧绷着，当你把手放上去时，" + benoitMF("他","她") + "弓起背，张开了嘴。光是看着" + benoitMF("他","她") + "紧绷的肉棒，你就知道你必须慢慢来，以免" + benoitMF("他","她") + "直接射出来；你带着一抹你伴侣看不见的邪恶微笑，心想你的身体对" + benoitMF("他","她") + "的影响如此之大，就算" + benoitMF("他","她") + "真的射了可能也无所谓。尽管如此，当你再次把" + benoitMF("他","她") + "的手放在你身上，把" + benoitMF("他","她") + "抵在墙上，伴随着一声叹息，慢慢地将" + benoitMF("他","她") + "的长度滑入你湿润的[vagina]时，你的动作还是尽可能地轻柔，尽管你已经迫不及待了。");
            get_player().cuntChange(10,true,true,false);
            outputText("[pg]本诺瓦的肉棒异常光滑，你顺滑地坐了下去。你没有立刻将自己完全埋入其中，而是只让它进入了你湿润深处的三分之一就停了下来，然后慢慢地将自己拔出。你停在" + benoitMF("他","她") + "敏感的龟头刚好在里面的位置，刻意地扭动你的[hips]，当它在你湿滑的肉壁周围旋转时，你发出了叹息。" + benoitMF("本诺瓦","本诺瓦特") + "呻吟着，你感觉到" + benoitMF("他","她") + "的身体紧绷起来；你立刻停止了动作并等待着，直到" + benoitMF("他","她") + "平静下来，才逐渐开始再次旋转和抽插。当你再次向前弯腰时，你滑入得更深了，这次只把" + benoitMF("他","她") + "的根部留在外面；当你感觉到" + benoitMF("他","她") + "进一步深入你湿润的深处时，你发出了一声叹息。" + benoitMF("他","她") + "发出野兽般的声音，试图将自己挺进你体内并压在你身上；你嘲弄地啧啧两声，将自己从" + benoitMF("他","她") + "身边拉开并停止移动，直到蛇怪显然用巨大的意志力让自己平静下来，背靠着墙，允许你继续摆弄" + benoitMF("他","她") + "。");
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你感觉到" + benoitMF("他","她") + "到底时，你发出了娇喘，尽管还有几英寸留在外面。" + benoitMF("他","她") + "细长的阴茎对你紧致的小穴来说再完美不过了；当你如梦似幻地在" + benoitMF("他","她") + "体内抽插时，" + benoitMF("他","她") + "上下摩擦着你的肉壁，让快感的浪潮席卷你的全身。");
            }
            else
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你的腹股沟伴随着湿润的亲吻贴上" + benoitMF("他","她") + "肌肉发达的大腿时，你发出了娇喘，你的小穴将" + benoitMF("他","她") + "的肉棒整个吞没。你开始用力而缓慢地骑乘" + benoitMF("他","她") + "，向上弯曲" + benoitMF("他","她") + "的肉棒以挤压你敏感的肉壁，快感的浪潮开始席卷你的全身。");
            }
            outputText("[pg]你保持这种状态感觉像过了几个小时，走走停停，刻意地推拉，以将你逼到角落的蛇怪控制在你的掌控之下。这种操弄的节奏对" + benoitMF("本诺瓦","本诺瓦特") + "来说显然是痛苦的；" + benoitMF("他","她") + "随着你[vagina]湿润的动作喘息、紧绷和倒吸凉气，" + benoitMF("他","她") + "的脸和胸膛因极度的性奋而起伏，但" + benoitMF("他","她") + "让你继续掌控局面，最终放弃了抵抗，只是躺在后面任由你摆布。为了给" + benoitMF("他","她") + "找点事做，你抓住" + benoitMF("他","她") + "的手，把它们放在你的[chest]上；在探索了你的肉体一段时间后，" + benoitMF("他","她") + "找到了你的[nipples]并开始揉捏它们，将每个乳头夹在两根手指之间，坚持不懈地摩擦着。");
            if(get_player().lactationQ() > 100)
            {
               outputText("当你的乳房喷出乳汁来回应" + benoitMF("他","她") + "的抚摸时，你呻吟出声；当乳汁");
               if(!get_player().isTaur())
               {
                  outputText("喷到" + benoitMF("他","她") + "脸上时");
               }
               else
               {
                  outputText("顺着" + benoitMF("他","她") + "的手指流下时");
               }
               outputText("，" + benoitMF("他","她") + "惊讶地跳了起来。[say: 哺乳动物真他妈奇怪，] " + benoitMF("他","她") + "嘟囔着，逗得你咯咯直笑。");
            }
            outputText("[pg]随着" + benoitMF("他","她") + "温暖的手继续游走，你的欲望不断攀升，终于失去了理智，不顾一切地向" + benoitMF("他","她") + "挺进，渴望达到顶峰。当你真正开始干" + benoitMF("他","她") + "时，" + benoitMF("Benoit","Benoite") + "喘着粗气，开始配合你的动作；你紧紧搂住" + benoitMF("他","她") + "的脖子，咬住" + benoitMF("他","她") + "的肩膀，你们互相撞击着，当你身体拍打在蛇怪紧绷的肌肉上时，你动情的淫液溅在" + benoitMF("他","她") + "的大腿上。当" + benoitMF("他","她") + "高潮时，" + benoitMF("他","她") + "发出粗糙的野兽般的叫声；" + benoitMF("他","她") + "瞎了的眼睛翻白，紧紧抓住你的背，将一波又一波的精液射入你翻腾的深处。" + benoitMF("他","她") + "精液的温暖和" + benoitMF("他","她") + "无助的抽搐将你推向了自己的高潮；难以抑制的快感脉冲淹没了你的大脑，在接下来的几分钟里，你除了在蛇怪身上哭泣和尖叫之外什么也做不了，你紧紧抱住" + benoitMF("他","她") + "，榨干" + benoitMF("他","她") + "肉棒里的最后一滴精液。");
            if(get_player().hasCock())
            {
               if(!get_player().isTaur())
               {
                  outputText("夹在你们两具滚烫的身体之间，你");
               }
               else
               {
                  outputText("你");
               }
               outputText("的[cock]也随着你的女性高潮喷射而出，将");
               if(!get_player().isTaur())
               {
                  outputText("你们俩");
               }
               else
               {
                  outputText("干燥的泥土");
               }
               outputText("染成了白色。");
            }
            outputText("[pg]你们瘫倒在压实的泥土地面上，依偎了一会儿，互相拥抱着沐浴在余韵中，静静地听着远处嘉年华的喧闹声。");
            outputText("[pg][say: 我真不知道自己做了什么才配得上你，] " + benoitMF("Benoit","Benoite") + "终于开口了，" + benoitMF("他","她") + "的声音几乎只是喉咙里沙哑的低语。你调皮地戳了戳" + benoitMF("他","她") + "的肋骨，说你只是为了那个防腐剂才这么做的。" + benoitMF("他","她") + "咧嘴笑了，然后你们俩起身穿好衣服，各自离开。");
         }
         benoitKnocksUpPCCheck();
         benoitAffection(2);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,573,FlagDict_Impl_.arrayReadInt(_loc1_,573) + 1);
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function popOutBenoitEggs() : void
      {
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("[pg]你感到腹股沟传来一阵可怕的压力……接着是伴随着血肉撕裂的难以置信的剧痛。<b>你低下头，看到自己长出了一个新的阴道</b>。[pg]");
            get_player().createVagina();
         }
         outputText("[pg]腹部突然传来的压力将你唤醒，子宫的蠕动和挤压让你痛苦地轻声呻吟，肉壁收缩着包裹住你体内成熟的卵。你把自己从床上拖起来，脱掉下半身的衣服，踉踉跄跄地走到营地中央。你直挺挺地蹲下，深吸一口气，开始集中注意力。");
         outputText("[pg]一种浓稠的绿色粘液开始从你被撑开的阴唇流出，湿漉漉地溅落在你下方的地面上，并迅速渗入干燥的泥土中。你很容易就适应了伴随宫缩用力的节奏，并在宫缩减退时深呼吸。你体内的卵移动得很快，被子宫里缓冲它们的奇怪粘液润滑着；它们的大小和形状恰到好处，通过时的压力以最令人愉悦的方式撑开了你，你的[clit]变得勃起");
         if(get_player().hasCock())
         {
            outputText("并且[eachCock]开始渗出先列腺液");
         }
         outputText("因为你发现自己被分娩推向了高潮。你觉得没有理由抵抗，于是伸手下去开始抚弄自己，在刺激淹没你时，你在夹杂着痛苦的快感中呻吟。伴随着一声高潮的尖叫，你在喷涌而出的淫液中将你的卵释放到了这个世界上");
         if(get_player().hasCock())
         {
            outputText("以及倾盆而下的精液");
         }
         outputText("。");
         outputText("[pg]当你发现自己能够站起来时，你检查了你生下的东西：" + Utils.num2Text(Math.floor(get_player().totalFertility() / 10)) + "颗巨大的、翡翠色的蛋，毫无疑问是爬行动物的。你拿起一颗，轻轻地贴在耳边；在里面，你能听到一颗小小的心脏，跳动得强劲而快速——这是" + benoitMF("本诺瓦","本诺瓦特") + "和你的孩子。你把蛋放回原处，把它们全部收集起来，移到离营火更近的地方保暖，同时从劳累中恢复过来。");
         outputText("[pg]当黎明的曙光破晓时，你收集起你刚产下的一窝蛋，出发前往" + benoitMF("本诺瓦","本诺瓦特") + "的商店。你到达时，这只失明的蛇怪还在睡觉，迫使你大声敲门把" + benoitMF("他","她") + "叫醒。");
         outputText("[pg][say: 怎么了？！] " + benoitMF("他","她") + "咆哮着，烦躁地把头探出门外时露出了" + benoitMF("他","她") + "的毒牙。" + benoitMF("他","她") + "停下来，用鼻子吸了口气，当" + benoitMF("他","她") + "认出你的气味时，微微吃了一惊。[say: 哎呀！[name]，真是太抱歉了，我没想到会是你。但你这么早来这里做什么？]");
         outputText("[pg]你对着你失明的爱人微笑，并告诉" + benoitMF("他","她") + "，" + benoitMF("他","她") + "是一个" + benoitMF("父亲","母亲"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) > 0)
         {
            outputText("再一次");
         }
         outputText("。好吧，等这");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) > 0)
         {
            outputText("最新的一");
         }
         outputText("窝蛋孵出来的时候，" + benoitMF("他","她") + "就是了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) == 0)
         {
            outputText("[pg]他高兴地笑了起来，然后又显得有些困惑。[say: 但是……你为什么要带它们来这里？]" + benoitMF("他","她") + "问道。");
            outputText("[pg]你解释说你觉得你的营地不够安全，不能把它们留在那里，" + benoitMF("本诺瓦","本诺瓦特") + "点了点头。[say: 是的，我明白你的意思……来，把它们给我，我会替我们俩照顾好它们的。]");
            outputText("[pg]他打开门，伸出" + benoitMF("他","她") + "的手，帮你领进门。" + benoitMF("他","她") + "在" + benoitMF("他","她") + "杂乱的储藏室里摸索着，直到" + benoitMF("他","她") + "找到了" + benoitMF("他","她") + "要找的东西：一个塞满柔软枕头的破旧篮子。你挑起一根眉毛，看着枕头上沾满的大量狗毛，" + benoitMF("本诺瓦","本诺瓦特") + "歉意地咳嗽了一声。");
            outputText("[pg][say: 他对我拿走他的床很不高兴，但去他的吧；反正他总是把毛弄得到处都是。]你花了一些时间把蛋安置在安全温暖的地方。虽然你知道它们看不见，但当你完成时，" + benoitMF("本诺瓦","本诺瓦特") + "那双失明的眼睛似乎一直盯着这窝蛋。");
            outputText("[pg][say: 这些蛋不一样吗？]" + benoitMF("他","她") + "犹豫地说。[say: 我——我们会有……女儿？]你耸耸肩说，即使它们不是雌性，至少" + benoitMF("他","她") + "也会有一些儿子，" + benoitMF("他","她") + "可以让他们远离那座山。" + benoitMF("他","她") + "咬紧牙关，点了点头。");
            outputText("[pg][say: 如果这能行，[name]，你为我的族人做了一件我无法报答的事。即使不行，你为我做这些也……]" + benoitMF("他","她") + "徒劳地比划着，因为" + benoitMF("他","她") + "已经找不到合适的词了。[say: 这么长时间以来，我一直在交易药水，我本可以自己做的，但我从来没有。也许我觉得自己太像个男人了，或者别的什么。呸！我是一个懦夫，一个畏缩的懦夫。你有想法，你有勇气，你有力量，正因为如此，我的族人才有机会。谢谢你。]" + benoitMF("他","她") + "的声音有些哽咽，停顿了一下。[say: 这微不足道，但对你，我会以它们的真实价值买卖东西。如果有什么我能为你做的，任何时候，请尽管说。]你对" + benoitMF("他","她") + "的热情感到有些尴尬，嘟囔了些什么。也许是意识到了这种尴尬，" + benoitMF("本诺瓦","本诺瓦特") + "指了指角落，那里有" + benoitMF("他","她") + "用废料拼凑成的一个实用的炉子。[pg][say: 饿了吗？]");
            outputText("[pg]你逗留了足够长的时间，和" + benoitMF("他","她") + "共进早餐，然后返回营地。[pg]");
         }
         else
         {
            outputText("[pg][benoit Name]自豪地笑了。[say: 我对你的感激之情无以言表。别担心，我会像保护其他蛋一样保护它们的。][pg]");
         }
         get_player().orgasm("Vaginal");
         get_player().knockUpForce();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,572,FlagDict_Impl_.arrayReadInt(_loc1_,572) + int(Math.floor(get_player().totalFertility() / 10)));
      }
      
      public function firstTimeAfterBoningEncounterBenoit() : void
      {
         clearOutput();
         benoitSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,576,1);
         outputText("一阵奇怪而微弱的噪音正从打捞店里传出来。直到你小心翼翼地躲进摊位里，你才意识到那是蛇怪哼唱的声音。当你进来时，" + benoitMF("Benoit","Benoite") + "停下来嗅了嗅空气，立刻放下了" + benoitMF("he","she") + "正在擦拭的杯子，并示意你进去。");
         outputText("[pg][say: 又见面了，[name]！] " + benoitMF("he","she") + "欢快地说。[say: 见到你真是太高兴了。今天过得怎么样？] 今天的" + benoitMF("Benoit","Benoite") + "有一种难以察觉的不同，你花了一会儿才弄明白是什么。" + benoitMF("He","She") + "看起来不像以前那么邋遢了；" + benoitMF("his","her") + "鳞片闪烁着暗淡的光芒，你想知道" + benoitMF("he","she") + "最近是不是洗过澡。而且，还有别的东西。");
         outputText("[pg][say: 这个？不。当然不是！] 当你问" + benoitMF("he","she") + "是不是专门为你戴了那条海军蓝领带时，" + benoitMF("he","she") + "说。[say: 一个蛇怪想要展现自己最好的一面有什么错吗？不管怎样，我现在就把它摘下来。这太傻了，我现在看出来了。那么……小姐想要点什么？] 你努力不嘲笑这种表现，并考虑你来这里的目的。");
      }
      
      public function femoitSexIntro() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         benoitSprite();
         outputText("你再次牵起本诺瓦特的手，把她领进里屋。你空闲的手在她的围裙下摸索着，小心翼翼地在杂物堆中穿行，本诺瓦特也很快进入了状态；她的手指滑下去，捏弄抚摸着你身上她最喜欢的部位。等你们走到储藏室时，你们几乎是互相绊倒在对方身上，笑着手忙脚乱地脱掉彼此的衣服。");
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1185,FlagDict_Impl_.arrayReadInt(_loc1_,1185) + 1);
         if(!benoitPreggers())
         {
            outputText("[pg]当你脱下本诺瓦特的围裙时，她的手指顺着你的身体两侧滑下，她温暖、光滑的触感最终落在了你的[cock]上；她对你身上的每一寸肌肤都了如指掌，熟练地揉捏、缠绕着你，轻柔地套弄着，直到你的肉棒在她的手中紧绷起来。她用一根手指极其轻柔地在你的[cockHead]周围画着圈，同时狡黠地笑着。你饥渴地低吼着，坚决地把她推倒在压实的泥土上，甩掉身上最后一件内衣；本诺瓦特为你张开双腿，她的阴唇已经张开，湿润地准备就绪。");
            if(benoitInClutch())
            {
               outputText("她的肚子因为怀着蛋而隆起，空气中弥漫着浓郁的雌性麝香；这熟透了的景象和气味完全绕过了你的高级认知，直接唤醒了你的身体本能，让你低吼着扑到她身上，几乎听不到她的娇笑声。");
            }
            outputText("[pg]你托起她丰满柔软的臀部，挺进她湿润的穴口，当你达到一个舒适的深度时，你叹了口气，然后开始缓慢地抽插。本诺瓦特的双手在你身上游走，用干燥、光滑的按压感感受着你，而你则找到了一个缓慢、丝滑的节奏。当你把肉棒越来越深地推入她的深处时，蛇怪弓起背，沙哑地呻吟着；她配合着你的动作，扭动着身体，轻轻地从各个角度摩擦你的[cock]，以增强你的快感。");
            outputText("[pg]");
            if(get_player().biggestCockLength() < 15)
            {
               outputText("很快你就深深地埋入她的深处，每次拍打在她身上都让她喘息不已。");
            }
            else
            {
               outputText("很快你就深深地埋入她的深处，你那粗壮的长度将她撑得大开，让她喘息不已。");
            }
            outputText("进入发情期后，你迅速加快了速度，带着狂热的放纵在你的蛇怪情人身上驰骋，她有力的双腿配合着你，让每一次深入她温暖深处的抽插都比上一次更加令人满足。");
            outputText("[pg]");
            if(!get_player().isTaur())
            {
               outputText("终于，你汗流浃背，抓住她的大腿将它们高高抬起，这样你就可以尽情地冲刺了。你几乎将自己完全抽出来，然后再狠狠地撞击进去，");
               if(!benoitInClutch())
               {
                  outputText("你的肚子拍打在她平坦的腹部上，发出啪啪的节奏声。");
               }
               else
               {
                  outputText("你的肚子拍打在她隆起、怀孕的腹部上，发出啪啪的节奏声。");
               }
            }
            outputText("本诺瓦特在你的努力下呻吟、尖叫，最终大声呼喊，她的体液喷涌而出，溅在你的腹股沟上");
            if(get_player().balls > 0)
            {
               outputText("和[balls]上。当她的阴道突然紧紧夹住你的肉棒时，你越过了高潮的顶峰，将一股又一股的精液射入她肥沃的深处，你的身体在快感中僵直。");
            }
            if(get_player().cumQ() >= 2500)
            {
               outputText("精液的量如此之大，以至于很快就顺着你的阴茎流了出来，在地板上汇成一滩。");
            }
            outputText("[pg]在你们俩都度过了共同高潮的余韵后，你们在地板上纠缠着躺了一会儿，享受着你光滑、长满鳞片的情人带来的触感。");
            outputText("[pg][say: 真是个大傻瓜，]她深情地说着，双手抚摸着你，在脑海中描绘着你此刻的模样，以便在未来的日子里回味。过了一会儿，你起身穿好衣服，悄悄地离开了。在迷迷糊糊中，你庆幸她这次没有在你背上留下那么多抓痕。");
            benoitKnockUp();
            get_player().orgasm("Dick");
         }
         else if(benoitRegularPreggers() && (!get_player().isTaur() || get_player().isTaur() && get_player().get_tallness() * 0.8333333333333334 < get_player().cocks[get_player().longestCock()].cockLength))
         {
            clearOutput();
            outputText("一旦你们俩到了老地方，谁也没有浪费时间脱衣服。怀孕的蛇怪站在那里，盲目地盯着你，等着你先采取行动，舌头偶尔掠过嘴唇，紧张地舔湿它们。");
            outputText("[pg]你趁机更仔细地打量着你的爬虫情人，走上前去，伸出双手。你轻轻地用手指划过她的下颌线，然后向上伸出手，轻柔地揉乱她头上的羽冠，让她发出感激的咕咕声。你的手指顺着她的身体线条滑下，捧起并抚摸她那小巧圆润的胸部，然后不可阻挡地继续向前，来到她那坚硬、圆润、肿胀的满是卵的腹部。你将手掌平放在那膨胀的球体上，感受着那巨大的卵群对她子宫内部施加的压力，按摩着她的两侧，让她发出轻柔的呻吟；你几乎敢发誓，当你移动它们时，你能听到她的卵在相互碰撞时发出的轻柔的咔哒声。");
            outputText("[pg][say: 前戏够了；我以为我们是要做爱？]她开玩笑地责备道，你得意地笑了笑，点了点头，内疚地知道她看不见。你敏捷地绕到她身后，抓住她的尾巴，深情地在你的脸颊上摩擦，然后告诉她找个结实的东西支撑一下；你想让她跪在上面。");
            outputText("[pg][say: 所以，这就是你的想法？变态的[boy]……]本诺瓦特回答道。她长长的舌头伸出来，在你的另一侧脸颊上掠过，然后她小心翼翼地降低身子，让自己舒服地趴在地上，如释重负地发出轻柔的呻吟。[say: 我得说，这对可怜的脚来说好多了……这些卵都很重，你知道吗？]");
            outputText("[pg]你捧起她的臀部，挤压着那令人愉悦的饱满、女性化的球体，并向她保证，她很快就会忘记她卵的重量。");
            outputText("[pg][say: 保证，保证，]这是你得到的厚颜无耻的反驳，这促使你用手开玩笑地拍了拍她的右臀。你的[cock]已经开始因兴奋而肿胀，你诱人地将它刷过本诺瓦特小穴的外唇，来回滑动，偶尔将它的尖端撞到她肿胀的腹部。很快，它就变得像石头一样硬，并且沾满了先列腺液和本诺瓦特的爱液。这位性转的爬行动物在喉咙深处呻吟和咆哮，将她那迷人的屁股拱向你，让你更容易挑逗她，你的手本能地移动去摸索和挤压她那甜美的脸颊。");
            outputText("[pg][say: 别再挑逗了，快把那该死的东西放进去！]她冲你吠叫。她将一只手从地上抬起，开始在沮丧的快感中摩擦和挤压她的胸部。");
            outputText("[pg]决定前戏已经足够了，你花点时间调整好自己的姿势，开始轻轻地滑入她那凉爽、丝滑的深处，即使你越来越深地进入她，也努力保持冷静。");
            if(get_player().biggestCockLength() < 15)
            {
               outputText("很快你就深深地埋入了她的深处，当你拍打进她体内时，她喘息起来。");
            }
            else
            {
               outputText("很快你就触到了她的底，当你庞大的长度将她撑开时，她喘息起来。");
            }
            outputText("[pg]你暂时停顿了一下，以正确地重新调整自己的姿势，将手放在本诺瓦特的屁股上以帮助保持平衡，并让她将空闲的手放回地上，然后你开始抽插。当你进出她的身体时，她呻吟和喘息着，尽最大努力用她自己的抽插来迎合你的抽插，满是卵的腹部在地板上前后滑动，对她那被拉伸的、敏感的" + (get_noFur() ? "皮肤" : "鳞片") + "的刺激增加了她的快感，她的尾巴在你的背上敲打着欲望的节奏。");
            outputText("[pg][say: 是的！是的，哦，是的！这太棒了，[name]！哦，操……我想我……]你感觉到她那起伏的、挤压的小穴越来越紧地夹住你，努力把你榨干。[say: ……我要高潮了！]当高潮在她体内荡漾时，她大喊大叫，腹部在你身上摇晃，因为快感让她的整个身体颤抖和摇晃。她喉咙里发出呻吟和咆哮，然后如释重负地喘了口气，听得出来已经精疲力竭了……");
            outputText("[pg]但你还没有结束，尽管那景象很诱人，所以你继续抽插，本诺瓦特高潮时的汁液让你的肉棒变得异常光滑，很容易滑入她体内。由于最近的高潮，这位蛇怪双腿发软，过度刺激，只能发出快感和绝望参半的喵喵声和呻吟声。她努力用她湿润的小穴按摩和挤压你的肉棒，渴望你用更多强效的种子填满她。看到她这个样子，她的腹部因你受精的卵而肿胀，趴在地上，仍然渴望被播种，这最终让人无法抗拒，你发现自己爆发在这位爬行类女人的小穴里，当你的精液喷射在她体内时，引发了第二次高潮。");
            if(get_player().cumQ() >= 2500)
            {
               outputText("因为她的子宫里已经塞满了卵，你大部分的精液只是乱七八糟地从她体内渗出来，让她被彻底内射了。");
            }
            outputText("[pg]现在轮到你精疲力竭地瘫倒在地了，尽管你保留了足够的控制力，避免给你已经很重的情人增加任何重量。你们俩留在后面的房间里，积蓄力量，让肉体欢愉的麝香气息在你们静止的身体上翻滚。");
            outputText("[pg]本诺瓦特先动了。[say: 嗯……我想怀孕这么大也不是什么坏事，如果这意味着我们可以像这样做爱……]她喃喃自语，尽管很明显她打算让你听到。伴随着一声用力的呻吟，她把自己撑了起来。[say: 随时回来找我，情人[boy]，]她告诉你。[say: 但别以为你需要我怀孕才能让我开心，好吗？]本诺瓦特得意地笑了笑，大步穿过地板，拉了你一把，然后用她那爬行动物的舌头轻轻地在你的嘴唇上掠过，给了你一个吻。");
            outputText("[pg]你穿好衣服，帮这位商人回到店面，没有撞倒任何东西——她可能对她的店很熟悉，但她那膨胀的腹部仍然给她带来了麻烦——然后回到营地。");
            get_player().orgasm("Dick");
         }
         else if(benoitVeryHeavyPreggers() || benoitExtremePreggers())
         {
            clearOutput();
            benoitSprite();
            if(get_player().isTaur())
            {
               outputText("[say: 不。不！绝对不行！]本诺瓦特坚持说。[say: 你是我了不起的种马，[name]，但是……这实在太多了。我身上有这么多重量，我们根本不可能做。]");
               outputText("[pg]她把一只手放在你身上，小心翼翼地向上移动到你的脸上，直到她捧住你的脸颊。[say: 真的，我很抱歉。我渴望再次见到你，我英俊的马儿……等我们的孩子能自己走路的时候。]");
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1192) == 0)
               {
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,1192,FlagDict_Impl_.arrayReadInt(_loc1_,1192) + 1);
                  outputText("本诺瓦特似乎在盯着你，然后将她长着爪子的手轻轻放在肚子上。[say:我还以为是我的眼睛出了问题……你肯定能看出我现在有多大，对吧？你真的觉得你能抱着我做爱吗？因为我肚子里有这么多蛋，我根本不可能让你坐在我腿上。]");
                  outputText("[pg]你向她保证，你知道一个非常合适的姿势，只要她愿意尝试。");
                  outputText("[pg]这位怀着蛋的爬虫族女人明显考虑了一下，然后耸了耸肩。[say:好吧，如果你愿意，我想我也愿意尝试。]她轻轻地笑了笑。[say:该死的荷尔蒙；我太饥渴了，这对我没好处。]");
               }
               else
               {
                  outputText("本诺瓦特对你笑了笑。[say:好吧，我想上次还挺愉快的。那就来吧；我很饥渴，而你来得正是时候，可以帮我解解痒。]");
               }
               outputText("[pg]她慢慢转过身，摇摇晃晃地走进她店里的私人区域，尾巴在她那迷人的屁股上方摇摆着。");
               outputText("[pg]幸运的是，本诺瓦特这些天都睡在她的店里，所以你不需要扶她走多远，她就感激地倒在了床上。[say:哎呀，我简直像头猪……]她喃喃自语，双手拼命想测量她巨大的肚子。就在她这么做的时候，你脱下你的[armor]，然后悄悄地爬上床，躺在她身边。");
               outputText("[pg]当你的双臂环绕住她的腰时，她吓了一跳。[say:别那样偷偷摸摸地靠近我！]她抱怨道，她的尾巴用力拍打着你的[ass]以强调她的观点。你道了歉，但你们俩都不是真心的，你们都知道这一点。你依偎着你的爬虫族情人，紧紧贴着她的背，感受着她冰凉的鳞片贴着你的[skinFurScales]。你游移的双手抚摸着她的胸部，让她舒服得哼哼唧唧，然后被她那大得不可思议的孕肚像磁铁一样吸引过去。");
               outputText("[pg]它又大又重，像石头一样坚硬，" + (get_noFur() ? "光滑的" : "长满鳞片的") + "皮肤被里面的蛋撑得紧紧的，你确信你能隔着皮肤感觉到它们。不过，里面塞得太满了，根本无法移动，这表明本诺瓦特怀孕的程度有多么惊人。当本诺瓦特突然坚持用她的屁股摩擦你的胯部时，你的检查被打断了。[say:依偎在一起感觉很好，亲爱的，但我现在想做点更……活跃的事，]蛇怪说道，她的语气轻快而飘逸。");
               outputText("[pg]你假装生气，问你为拥有这样一个奇妙、极具生育能力的情人而感到自豪有什么错，你用温柔的抚摸爱抚着她隆起的肚子，手指滑过她敏感的皮肤。蛇怪轻声呻吟，因这种感觉而愉快地颤抖，她的尾巴滑上来抚摸你的[hips]。[say:你真会说话，]她对你说。[say:嗯……但我必须承认，这也挺舒服的……]她扭动着身体向后靠着你，尽力依偎着你的身体，以此来强调她的观点。");
               outputText("[pg]你的一只手继续在她装满蛋的子宫上画圈，同时你将另一只手向下移动，轻轻地托住并挤压她丰满的臀部，揉捏着她尾巴的根部，然后向下爬到她的双腿之间。湿润的感觉迎接了你试探的手指，让你知道你的努力得到了回报，你决定给本诺瓦特一些更强烈的东西。你的[cock]开始戳进这只母蜥蜴甜美的屁股，让她发出了那种极其下流的笑声。[say:我还以为你只是想依偎在一起呢？好吧，那就来吧，我的爱人；如果你觉得你知道怎么正确使用那个东西？]");
               outputText("[pg]你扶着她肿胀的肚子，将你的肉棒在她的屁股下移动，寻找她女性的孔口。过了一会儿，你发现自己对准了位置，开始轻轻地把自己推入，小心翼翼且耐心地确保你不会伤害到你处于最娇弱状态的情人。当你到达她滴水的阴户中一个舒适的深度时，她喘息着叹了口气；她太重了，无法真正移动自己，她必须顺从地承受你的每一次抽插和释放，因为你滑进滑出，让自己越来越深地进入她体内。");
               if(get_player().biggestCockLength() < 15)
               {
                  outputText("[pg]很快，你就深深地插入了她的深处，当你拍打她时，她喘息起来。");
               }
               else
               {
                  outputText("[pg]很快，你就插到了她的底部，当你庞大的长度将她撑开时，她喘息起来。");
               }
               outputText("[pg]带着令人惊讶的慵懒，你在她体内轻轻地前后摇晃，慢慢地把自己抽出来，然后再滑进去。蛇怪的肚子让她任你摆布，你充分利用了这一点，玩弄着她的小乳头（毕竟，除了用来取悦她，它们还有什么用呢？）并抚摸着她的肚子。她发出嘶嘶声和咕咕声，但一动不动；这是你男子气概、你纯粹男性力量的活生生的证明。你的双手无法伸得足够远来包住她整个肚子，她怀着你的后代是如此沉重，这只会激发你的骄傲和性欲。只有为了避免伤害她或她珍贵的货物，你才没有像野兽一样干她……尽管她绝望地哭喊着求你快点，用力点，这有助于平息你的冲动。她是你的，完完全全属于你，你会按照你的意愿占有她。");
               outputText("[pg]看到她的恳求没有起到任何作用，本诺瓦特努力克服了她的欲望，尝试了另一种策略。[say:来……来吧！这就是让我怀孕的肉棒吗？就是这根强壮的肉棒制造了所有这些蛋吗？]她尽可能地将胯部贴向你，她湿滑的阴户饥渴地挤压着你侵入的肉棒。[say:我已经不是那个紧张的小处女了，[name]；我是一个准妈妈。把你的精液给我；让我再次温暖并充满你的种子！也就是说，如果你有胆量这么做的话？]她娇嗔道");
               if(get_player().balls == 0)
               {
                  outputText("带着微笑，她非常清楚你没有，字面意思上的没有");
               }
               outputText("。");
               outputText("[pg]你再也无法抗拒了；你在最后一次有力的抽插中将自己送入并射精，当精液从你的肉棒如雷鸣般喷射到她的深处时，本诺瓦特发出了一声愉悦的尖叫，她自己的高潮迷失在翻滚沸腾进入她体内的液体瀑布中。由于她的子宫已经塞得满满的，无法容纳更多，压力只是让所有的东西从她的阴户中喷射出来，用你的种子浸透了你们俩。最后，你的高潮结束了，你和她一起叹了口气。");
               outputText("[pg][say:这才是我想要的，]本诺瓦特轻声叹息。[say:……我今天可能得早点关门了。]");
               outputText("[pg]最后，事情并没有发展到那一步，但你花了很长时间才帮本诺瓦特站起来，给她清理干净，收拾好你弄出来的烂摊子，并让她重新变得体面。她给了你一个爬虫族的吻以示感谢，然后又把你送回了家。");
               get_player().orgasm("Dick");
            }
         }
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function femoitNextDayEvent() : void
      {
         clearOutput();
         benoitSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1181,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1193,2);
         outputText("一阵奇怪而微弱的声音从废品店里传出。直到你小心翼翼地钻进摊位内部，才意识到那是蛇怪哼歌的声音。" + benoitMF("Benoit","Benoite") + "在你进来时停下来嗅了嗅空气，立刻放下正在擦拭的杯子，招呼你进去。");
         outputText("[pg][say: [name]！]她欢快地说。[say: 别站在那儿了！进来，我想和你说说话。]你走到柜台前，打量着她。她戴着一顶贝雷帽，而不是以前的土耳其毡帽，身前还系着一条围裙，这或多或少掩盖了她新长出的羽毛和胸前小巧的装饰性隆起。然而，很容易就能注意到（至少对你来说），从这只蛇怪的下颌线以及明显变宽的臀部来看，她的性别绝对已经改变了……你只能猜测，隐藏在围裙下的生理性别也同样发生了变化。她似乎并不介意你打量她，或者她只是没意识到。你问本——你停了下来。");
         outputText("[pg][say: 你可以叫我本诺瓦特。本——诺瓦特，]她微笑着说。[say: 这很容易适应，对吧？我很好。比好还要好；你的药水效果完美。我觉得我现在重获新生了——以前我只是个可悲的蛇怪，一事无成。现在我有了目标。有了生存的意义。而且，变成女性让我意识到这个地方有多需要打扫。我现在顾客都变多了！]");
         outputText("[pg]她探身越过柜台，笑容渐渐消失。[say: 说真的，[name]，你为我的族人帮了一个我无以为报的大忙。我可以下蛋了，会有更多的雌性蛇怪，远离莉希丝和她的暴徒。一直以来我都在交易药水，我本可以自己喝的，但我从来没有。也许我觉得自己太爷们了还是怎么的。呸！我就是个懦夫，一个畏首畏尾的懦夫。是你逼我做出了决定，正因为如此，我的族人才有了一线生机。谢谢你。 ]");
         outputText("[pg]她的声音听起来有些哽咽，停顿了片刻。[say: 这微不足道，但对你，我会以真实价值买卖物品。如果有什么我能为你做的，随时开口。 ]你对她的热情感到有些尴尬，嘟囔着说这都是她自己的功劳之类的话。也许是意识到了这一点，本诺瓦特坐回原位，双手交叉，端庄地对你微笑。[say: 那么……[madam]是想买点什么，还是卖点什么？ ]");
      }
      
      public function femoitInitialTalk() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你问" + benoitMF("本诺瓦","本诺瓦特") + "，" + benoitMF("他","她") + "是否想过尝试做点什么来帮助" + benoitMF("他","她") + "的族人摆脱困境。");
         outputText("[pg]蛇怪沉默了一会儿，若有所思地用" + benoitMF("他","她") + "的爪子划过柜台。[say: 是的，]" + benoitMF("他","她") + "最终用平静的语气说道。[say: 我想过。远离群山，我有时间思考。我不再是恶魔的奴隶了，而且我本来就是一个滑稽的蛇怪，所以我经常想做出某些……牺牲。如果我们哪怕只有一个雌性，远离他们的腐化，那么……]" + benoitMF("他","她") + "的声音渐渐变小，不高兴地耸了耸肩。[say: 但我只是在折磨自己去想这些，[name]。恶魔让我们对改变非常有抵抗力。我需要非常强大的东西才能让我变成……有用的东西。]");
         if(get_player().get_inte() >= 60)
         {
            outputText("[pg]你估计，即使是有抵抗力的生物，只要有足够强效的药水，也能被变成异性，于是你向" + benoitMF("本诺瓦","本诺瓦特") + "询问了这件事。");
            outputText("[pg][say: 嗯……如果你有双倍剂量的纯净魅魔乳液、一个大粉红蛋、一些产卵灵药和一些鳞族药水，你可能就能做到……]");
            outputText("[pg]（[say: 雌性化]选项已添加到" + benoitMF("本诺瓦","本诺瓦特") + "的菜单中。）");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1179,1);
         }
         else
         {
            outputText("[pg]你绞尽脑汁，但也想不出有什么能帮助" + benoitMF("本诺瓦","本诺瓦特") + "，所以最后只能同情" + benoitMF("他","她") + "。[say: 不要为此自责，]蛇怪微笑着说。[say: 这是一个愚蠢的梦想。而且无论如何，我告诉过你：我们是一个混蛋种族。我们是最不配得到别人关心的人。]");
         }
      }
      
      public function femoitFirstTimeYes() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1185,FlagDict_Impl_.arrayReadInt(_loc1_,1185) + 1);
         clearOutput();
         benoitSprite();
         outputText("你微笑着越过柜台，握住本诺瓦特的双手，直到她紧张的喋喋不休停止，并对你回以微笑。你依然握着她的手，走到板条箱后面，然后温柔地将她引到摊位顶篷的后方。");
         outputText("[pg]本诺瓦特所谓的后方办公室非常适合你的目的；夹着她摊位的两辆马车在这里靠得很近，这个三角形的空间里堆满了板条箱和未分类的打捞物。你小心翼翼地引导你失明的同伴来到一个干净的角落，把她推到木墙上，当你温柔地解开她的围裙时，你靠向了她。嘉年华上兴奋的喧闹声、砰砰声和叮当声听起来仿佛来自百万英里之外。");
         outputText("[pg][say: 这太奇怪了，]当你把衣服扔在压实的泥土上，双手顺着她光滑的身体慢慢向上，摘下她的贝雷帽时，她喃喃自语道；你无法想象她脑子里在想什么，但看着本诺瓦特那扁平的蜥蜴脸和浑浊的灰色眼睛，你只能同意她的感受。尽管如此……你的目光还是被她柔和的下颌线、丰满的胸部和鲜艳的羽毛所吸引。你对她做了这些，字面意义上阉割了她，而她现在却想让你占有她，这个事实触动了你内心深处的某种东西，你急切地开始脱下你的[armor]，血液涌向你的腹股沟。");
         outputText("[pg][say: 这听起来会很奇怪，]当你最终赤身裸体地站在她面前时，本诺瓦特用颤抖的声音说道，[say: 但是……你介意我先摸摸你吗？我对你的了解只有你的声音。]你默许了并靠近她，当她轻轻地把手放在你身上时，你叹了口气，她收起食指的爪子，开始在你身上慢慢地上下抚摸。");
         if(get_player().isTaur())
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸庞、你的肚子、你的[hips]；你感觉自己就像一本书一样被她阅读着。[say: 天哪，]当她的手摸到你的侧腹时，她喃喃自语道。[say: 天哪！]当她顺着你的身体一直摸到你那巨大有力的后半身时，她惊呼出声。[say: 听这哒哒的马蹄声，我就知道你是个半人马，]她惊奇地来回抚摸着你的侧身说道。[say: 但知道是一回事，真正摸到又是另一回事了。]她叹了口气。[say: 这可能会……有点尴尬，但我想你现在大概已经习惯了吧，对吗？]");
         }
         else if(get_player().isDrider())
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸庞、你的肚子、你的[hips]；你感觉自己就像一本书一样被她阅读着。[say: 天哪，]当她的手摸到你的腹部时，她喃喃自语道。[say: 天哪！]当她顺着你鼓胀的腹部一直摸到你的吐丝器时，她惊呼出声。[say: 听这咔哒咔哒的声音，我就知道你是一只蜘蛛，]她惊奇地摸索着你那复杂多节的腿说道。[say: 但知道是一回事，真正摸到又是另一回事了。]");
         }
         else if(get_player().demonScore() > 4)
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸庞、你的肚子、你的[hips]；你感觉自己就像一本书一样被她阅读着。她摸到你的角，停顿了一下；她伸手绕到后面，找到并抓住了你的尾巴，顺着尾巴一直摸到铲状的尖端。[say: 所以，]她轻声说道。[say: 你是他们中的一员。]她沉默了一会儿，然后露出一个温暖的微笑。[say: 但我太傻了。我知道你的内心是不同的。]");
         }
         else if(get_player().dogScore() >= 4 && get_player().ears.type == 2 && get_player().tail.type == 2)
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。当她摸到你那软趴趴的耳朵时，她咧嘴笑了，而当她伸手摸到你的尾巴时，她更是直接笑出了声。[say:我喜欢狗，但没那么喜欢，[name]，]她咯咯地笑着。[say:难怪皮埃尔最近一直表现得很嫉妒。]");
         }
         else if(get_player().bunnyScore() >= 4 && get_player().ears.type == 7 && get_player().tail.type == 10 || get_player().catScore() >= 4 && get_player().ears.type == 5 && get_player().tail.type == 8)
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。当她摸到你的耳朵时，她咧嘴笑了，而当她伸手摸到你柔软的尾巴时，她更是直接笑出了声。[say:我一直想知道为什么皮埃尔一看到你就那么兴奋，]她咯咯地笑着。");
         }
         else if(get_player().harpyScore() >= 4 && get_player().wings.type != 0 && get_player().arms.type == 1)
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。她摸到了你的翅膀，并顺着翅膀一直摸到她能够到的最高处；她小心翼翼地把脚往前挪，触碰着你长着爪子的脚趾。[say:原来这就是讽刺，]她喃喃地说，当她触摸你的肩膀时，嘴角挂着一丝微笑。[say:我的救命恩人是个哈比，来蹂躏我了。]");
         }
         else if(get_player().beeScore() >= 4 && get_player().wings.type != 0 && get_player().lowerBody.type == 7)
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。她摸到了你半透明的翅膀，并顺着翅膀一直摸到她能够到的最高处，她紧紧抓住你敏感的薄膜，让你微微抽搐了一下；然后她的手顺着你覆盖着甲壳的四肢滑下。[say:我一直以为你只是喜欢穿大靴子，]她喃喃地说。[say:但这居然是你身体的一部分？真……有趣。]");
         }
         else if(get_player().gooScore() >= 4 && get_player().hasGooSkin())
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。[say:从你发出的那种黏糊糊的声音，我就知道你与众不同，]她喃喃地说，双手陷入你柔软无定形的身体里。[say:但这……天哪，这太奇怪了。而且这完全不会弄疼你吗？]她难以置信地问，同时轻轻地用手指戳了戳你。你用笑声回答了她的问题。[say:那一定非常有用，]她说。你顺着她的手臂慢慢向上推，告诉她她根本想象不到。");
         }
         else if(get_player().hasScales())
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。当她摸到你的鳞片时，她微微吃了一惊，然后越来越感兴趣地抚摸着你身体上爬行动物的部分。[say:你这么做不只是为了我吧，[name]？]她喃喃地说。[say:我必须承认——感觉非常好。]");
         }
         else if((get_player().foxScore() >= 4 || get_player().kitsuneScore() >= 4) && get_player().ears.type == 9 && get_player().tail.type == 13)
         {
            if(get_player().tail.venom <= 1)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被" + benoitMF("他","她") + "阅读着。当" + benoitMF("他","她") + "摸到你竖起的耳朵时，" + benoitMF("他","她") + "咧嘴笑了，而当" + benoitMF("他","她") + "伸手摸到你毛茸茸的尾巴时，" + benoitMF("他","她") + "更是直接笑出了声。[say:我一直想知道为什么皮埃尔一看到你就那么兴奋，]" + benoitMF("他大笑着","她咯咯地笑着") + "。");
            }
            else
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被" + benoitMF("他","她") + "阅读着。当" + benoitMF("他","她") + "摸到你竖起的耳朵时，" + benoitMF("他","她") + "咧嘴笑了，而当" + benoitMF("他","她") + "伸手摸到你毛茸茸的尾巴时，" + benoitMF("他","她") + "更是直接笑出了声。[say:你这么做不只是为了捉弄我吧，[name]？]" + benoitMF("他大笑着","她咯咯地笑着") + "。");
            }
         }
         else
         {
            outputText("[pg]她温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被她阅读着。[say:你们人类真是又软又毛茸茸，还热乎乎的，]她声音沙哑地咯咯笑着。[say:你怎么受得了？]");
         }
         outputText("[pg]本诺瓦特的双手顺着你的躯干滑下，直到她倒吸一口凉气，摸到了你的[cock]。停顿了一下后，她用干燥光滑的手慢慢握住你半勃起的肉棒，上下套弄，摩擦并缠绕着你，直到你紧绷起来。");
         if(get_player().biggestCockLength() <= 10)
         {
            outputText("尽管这对她来说显然是一次不可思议的经历，但当她的手在你的性器周围游走时，她还是勉强挤出了一个傲慢的微笑。[say:我的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) < 3 ? "以前" : "现在") + "更大，]她调侃道。你决定也摸摸她作为对她厚脸皮的奖励，你抓住她丰满柔软的臀部，在你挺进她体内时让她发出一声惊呼。");
         }
         else
         {
            outputText("这对她来说显然是一次不可思议的经历，当她的手在你的性器周围游走时，这种异样感更加强烈了。[say:老天啊，[name]；你是个怪物，]她声音沙哑地说。你笑了笑，决定是时候也摸摸她了；你抓住她丰满柔软的臀部，在你挺进她体内时让她发出一声惊呼。");
         }
         outputText("[pg]空气中弥漫着你发情的味道，当本诺瓦特吸入这股气味时，她的呼吸变得更加沉重。你依然抓着她的屁股，分开她的臀部，露出她闪烁着水光的生殖裂。你把她抵在墙上，将你的[cock]压在她准备就绪的性器上。[say:请温柔点，]你身下传来一个沙哑、紧张的声音。你慢慢推开她的阴唇，将龟头滑入她的温暖中作为回应。");
         outputText("本诺瓦特的小穴像处女一样紧致，你尽可能缓慢地动作，轻轻摆动臀部，将更多的长度送入。尖锐的爪子抓住了你的背，当你把更多的自己推入时，你感觉到了阻力；鲜血顺着你的肉棒流下，滴落在地板上。你继续缓慢地动作，在完全沉入之前几乎完全抽出，在向外拉扯时用龟头挑逗隐藏在她褶皱中的阴蒂。本诺瓦特似乎被发生的一切惊呆了；她只是紧紧抓住你的背，大口喘气，任由你完成所有的工作。你并不介意；无论她脑子里在想什么，她的身体都在回应你这有条不紊的对待，她的阴唇张开，当你挤进那条紧致、紧紧包裹的通道时，滑腻的汁液润滑着你的肉棒。");
         if(get_player().biggestCockLength() < 15 && get_player().balls == 0)
         {
            outputText("最终你成功地将自己完全没入她的深处，你的肚子紧紧贴着她紧绷的腹部。");
         }
         else if(get_player().biggestCockLength() < 15 && get_player().balls > 0)
         {
            outputText("最终你成功地将自己没入她的深处，你的[balls]压在她的性器上，而你的肚子撞上了她紧绷的腹部。");
         }
         else if(get_player().biggestCockLength() >= 15 && get_player().balls == 0)
         {
            outputText("最终你成功地插到底，你的肉棒抵住了她的子宫颈。");
         }
         else if(get_player().biggestCockLength() >= 15 && get_player().balls > 0)
         {
            outputText("最终你成功地插到底，你的肉棒抵住了她的子宫颈，你的[balls]在你的肉棒下方沉甸甸地晃动着。");
         }
         outputText("保持这个姿势片刻，你慢慢地几乎完全抽出，然后再完全推入，继续这个过程，你的咕哝声与本诺瓦特在近乎折磨般缓慢的性爱中发出的轻柔呻吟声交织在一起，你用尽了所有的自制力才没有开始猛烈地操弄这个蛇怪美味紧致的小穴。偶尔你会在最深处停顿一下，等待你的血液冷却下来，让本诺瓦特习惯被你完全填满的感觉。");
         outputText("[pg]慢慢地，最终，本诺瓦特进入了状态，她僵硬的四肢在你充满爱意、小心翼翼的动作中融化了。她开始喘息，随着你扭动她有力的臀部，试图将你的肉棒更深地吸入体内。你感激地开始加快速度，越来越用力地挺进她体内。当她把自己推向你时，她的爪子痛苦地抓着你的背，她胸前柔软的皮革凸起挤压着你的[fullChest]。");
         if(get_player().isLactating())
         {
            outputText("压力和兴奋让你的[nipples]溢出乳汁，飞溅在你们俩的胸前。");
         }
         outputText("很快你们俩就激烈地纠缠在一起，当你把本诺瓦特按在车厢壁上撞击时，她发出沙哑的呻吟，你们都在共同追寻着高潮，互相推着对方攀向顶峰。你的世界里只剩下[cock]周围温暖紧致的包裹感，以及胸前传来的压力。");
         outputText("[pg]本诺瓦特在高潮时大声嚎叫，死死地抱住你，拼命地迎合着你的撞击。你阴茎周围的收缩感太强烈了，伴随着一声野兽般无法言喻的低吼，你射了。你的大脑被那股征服一切、渴望繁衍的野兽本能所取代，你尽可能深地插入本诺瓦特体内，将你的种子尽可能多地射进她的深处，一股接一股的精液喷涌而出，直到从她体内溢出，滴落在地板上，与她的血液混合在一起。");
         outputText("[pg]终于，你射出了最后一滴精液，恢复了理智；你慢慢地将本诺瓦特放下来，让她双脚着地。她微微踉跄了一下，抓住一堆板条箱支撑着身体，你的精液依然从她体内渗出。");
         outputText("[pg][say: 呼！]她好不容易喘过气来后说道。[say: 刚才那真是……太刺激了。]你有点担心自己是不是做得太过火了，但当她稍微恢复过来后，她带着灿烂、幸福的笑容向你走来。她摸索着，直到找到你的手。你觉得这个时候应该吻她，但你不太确定该怎么做。就在你犹豫的时候，她张开嘴，伸出长长的舌头舔了舔你的脸。那种感觉温暖而粘稠，你发现自己被这种奇怪的温柔举动逗笑了。");
         outputText("[pg][say: 谢谢你，[name]，]她沙哑地说道。[say: 当然，如果没怀上的话，我还需要你再来一次。等第一窝孵出来后，还要再来。基本上我们会经常做这种事。纯粹是为了繁衍后代，你懂的。]你咧嘴一笑，牵着她回到店里，捏了捏她的手后，便告辞了。");
         get_player().orgasm("Dick");
         benoitKnockUp();
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function femoitFirstTimeNo() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你尽可能委婉地拒绝了她。");
         outputText("[pg][say: 不，你是对的，]她用随意的语气说道，尽管她鳞片上的颜色依然很深。[say: 那样太奇怪了，不是吗？不过我会找到人的，别担心。就像我之前说的……]本诺瓦特用两根手指指了指她失明的眼睛，然后又指了指摊位的入口。你觉得她那浑浊的灰色眼眸中闪烁着一种独特的光芒，足以把大多数长着阴茎的生物吓得魂飞魄散。[say: 我现在有目标了。]");
         outputText("[pg]捕捉到本诺瓦特声音中微妙的失望，你匆匆向她告别，然后返回营地，决定给她一些时间来平复心情。");
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function femoitBirths() : void
      {
         clearOutput();
         benoitSprite();
         outputText("当你走进本诺瓦特的摊位时，你听到后屋传来痛苦的喘息声，夹杂着货物被撞倒的声音。你冲进去，发现本诺瓦特一丝不挂，靠在一张桌子上痛苦地呻吟，她的尾巴在身后疯狂地甩动。[say: [name]！你……你在这里真是太好了。蛋！蛋要出来了！]");
         outputText("[pg]她发出一声痛苦的嚎叫，爪子深深地陷入她靠着的那张结实的旧桌子伤痕累累的木头里，她巨大的肚子沉甸甸地垂向地板。本能驱使你去帮助你未来孩子们的母亲，你飞奔到她身后。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1191) == 0)
         {
            outputText("[pg]你问她有没有什么办法能让你帮帮她。");
            outputText("[pg][say: 只要接住蛋，然后想办法让这该死的疼痛减轻点！] 蛇怪哀嚎着，爪子在坚硬的老木头上划出刺耳的声音。她看起来快要歇斯底里了。[say: 我怎么会觉得这是个好主意？去他妈的种族繁衍，</i>没有什么<i>值得受这种罪！]");
         }
         else
         {
            outputText("[pg]回想起你以前做过的事，你毫不怀疑自己该怎么帮她。");
            outputText("[pg]环顾四周，你很容易就找到了一堆碎布和丢弃的衣服，你迅速把它们拼凑成一个简陋的窝，放在正在分娩的蛇怪身下。虽然简陋，但至少能让你有个放蛋的地方");
            if(benoitVeryHeavyPreggers() || benoitExtremePreggers())
            {
               outputText("……这很好，因为你能看出来有很多蛋要生出来");
            }
            outputText("。做完这些，你蹲在本诺瓦特身后，低下头以免被她甩动的尾巴打到，然后把手伸到她的双腿之间。她立刻发出一声尖叫。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1191) == 1)
            {
               outputText("[say: 怎么了？] 你脱口而出，有些惊慌。");
               outputText("[say: 你……你的手好凉！] 她尖叫着，不悦地发抖。");
            }
            else
            {
               outputText("[say: 我跟你说过多少次要先把手捂热？] 她生气地斥责道。");
            }
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1191,FlagDict_Impl_.arrayReadInt(_loc1_,1191) + 1);
         outputText("[pg]你道了歉，但并没有把手拿开；相反，你开始揉搓她的阴唇，感受它们扩张的程度，试图判断她还有多久才会产卵。你偶尔会揉揉她紧绷肿胀的肚子下方，试图给她一些安慰。她的分娩进展很快；你确信她很快就会开始生产。");
         outputText("[pg][say: 至少蛇怪——哦！——是下蛋的！] 她喘息着。[say: 这比试着生个婴儿出来要容易多了……] 她痛苦地皱起眉头，又一阵宫缩明显地在她的肚子上荡漾开来。[say: 不过，这还是疼得要命。]");
         outputText("[pg]你鼓励她深呼吸，试着集中注意力，配合宫缩的节奏用力。本诺瓦特呻吟着，但还是照你说的做了，没过一会儿，她就咬紧牙关，因为一个蛋的形状明显地从她的小穴里凸了出来");
         if(get_silly())
         {
            outputText("。它的形状像一个复杂的十五边形菱形多边形。");
         }
         else
         {
            outputText("，一颗翡翠蛋光滑弯曲的顶部开始露出。");
         }
         outputText("伴随着一声夹杂着痛苦与解脱的压抑高潮叫声，本诺瓦特将它从产道里推到了你的手中。蛋上沾满了汁液，让你很难拿稳，你发现自己正努力将它安全地抱在怀里。你迅速将它放进她脚边临时搭建的窝里。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) >= 2)
         {
            outputText("[pg]不过，从本诺瓦特腹部持续的隆起可以看出，这一窝显然有多个蛋。她对这个前景呻吟了一声，但还是继续呼吸和用力。");
            if(benoitRegularPreggers())
            {
               outputText("[pg]她的分娩很快就结束了；这一窝并不大，而且她的肌肉已经做好了充分的准备。很快，她就蹲在了一堆" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186)) + "个蛋上。");
            }
            else if(benoitHeavyPreggers())
            {
               outputText("[pg]多亏了她的蛋的形状，以及她已经充分扩张的事实，剩下的蛋出来得相对较快。你觉得这是一窝相当不错的孩子；总共" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186)) + "个蛋。");
            }
            else if(benoitVeryHeavyPreggers())
            {
               outputText("[pg]你很高兴本诺瓦特生孩子比哺乳动物要容易，因为她现在需要一切能得到的帮助。她那巨大的肚子证明了她不仅仅是发胖，随着一颗又一颗的蛋从她被撑开的阴道里挤出来，她的肚子也渐渐瘪了下去。当她再次变得像木板一样平坦时，你数了数她的后代；一共 " + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186)) + " 颗蛋，每颗蛋里都有一个小蛇怪在发育。");
            }
            else if(benoitExtremePreggers())
            {
               outputText("[pg]本诺瓦特痛苦地呻吟着，仿佛快要死了一样，但不知为何，她还是找到了继续坚持下去的力量，一颗接一颗的蛋从她那被塞得满满的子宫里滑落出来。有那么一瞬间，你怀疑她肚子里到底有多少颗蛋，但这场“瀑布”终于结束了；你们俩都松了一口气。当本诺瓦特因为分娩而大口喘气时，你忙着数你的孩子们……一共 " + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186)) + " 颗蛋！");
            }
         }
         outputText("[pg]产卵结束后，本诺瓦特质长地松了一口气。[say: 感谢老天，终于结束了，]她宣布道，同时跪倒在地，小心翼翼地避免压碎她刚刚产下的蛋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) > 1)
         {
            outputText("");
         }
         outputText("。你在她身后点点头，小心翼翼地绕过去给她一个拥抱。她是一个非常非常勇敢的女人，而当初做出这个决定的男人则更加勇敢。");
         outputText("[pg][say: 奉承，]本诺瓦特用她沙哑的声音说道，她的冠毛上闪过一丝爬行动物特有的红晕，突然紧贴在她的头上。[say: 现在，让我们看看这场疯狂结合的果实吧，好吗？]在你的帮助下，她调整了姿势，以便能摸到你“巢穴”里的东西，让她能触摸并数清她产下的蛋的数量。");
         if(benoitRegularPreggers())
         {
            outputText("她轻轻叹了口气。[say: 这么小的一窝……对我的族人来说很正常，是的，但对我的任务来说就不太好了，不是吗？不过，迈向自由的一小步也是一步。]她勉强笑了笑。[say: 我的孩子们将获得自由，这是值得庆祝的事情。]");
         }
         else if(benoitHeavyPreggers())
         {
            outputText("[say: 哎呀，我们一起生了一大窝，不是吗？]她自豪地笑了。[say: 是的，我想这些孩子会很强壮的。]");
         }
         else if(benoitVeryHeavyPreggers())
         {
            outputText("[say: ……哇，你可真是个种马，不是吗？]本诺瓦特发出一声沙哑的欲望低吼。[say: 我决定让你给我的卵受精，真是选对了……这么多蛋啊。]");
         }
         else if(benoitExtremePreggers())
         {
            outputText("蛇怪数完后停了下来，显然惊呆了。她又数了一遍她的蛋，然后再数了一遍，惊讶地摇了摇头。[say: 难以置信……简直，难以置信。我没想到一个女人能下这么多蛋！天哪！]一种突然意识到可怕事实的神情掠过她的脸庞。[say: 我会被这些小怪物累得脚不沾地的，不是吗？]她喃喃自语道。");
         }
         outputText("[pg]你问本诺瓦特现在是否还好。");
         outputText("[pg]蛇怪看着你，得意地笑了。[say: 我可没那么脆弱，[name]。我又可以像以前一样活动自如了，别担心，我已经挑好了一个温暖安全的好地方。]她捏了捏你的[ass]，吓了你一跳。");
         outputText("[pg]不过，你坚持要帮本诺瓦特把蛋");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) > 1)
         {
            outputText("");
         }
         outputText("安全地放好，而这只失明的爬行动物显然很感激你的帮助。留下她欣赏她的新蛋，你回到了营地。");
         clearBenoitPreggers();
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function equipUnequipHairPin() : void
      {
         var _g:Inventory;
         var _loc1_:int = int(get_player().findKeyItem("Feathery hair-pin"));
         if(_loc1_ < 0)
         {
            return;
         }
         clearOutput();
         if(get_player().keyItemv1("Feathery hair-pin") > 0)
         {
            if(get_player().hair.length > 0)
            {
               outputText("你把" + benoitMF("Benoit","Benoite") + "给你的羽毛发簪从你的" + get_player().hairDescript() + "上取下来，放回物品栏。");
            }
            else
            {
               outputText("你把" + benoitMF("Benoit","Benoite") + "给你的羽毛发簪从你光秃秃的头上取下来，放回物品栏。这出奇地容易。");
            }
            get_player().keyItems[_loc1_].value1 = 0;
            get_player().keyItems[_loc1_].value2 = 0;
         }
         else if(get_player().hair.type == 3)
         {
            outputText("你试图将发簪滑入你的[hair]中，但它们半液态的状态不足以将其固定住。你一松手，发簪就伴随着湿漉漉的吧嗒声掉在地上。你叹了口气，把它清理干净，然后放了回去。");
         }
         else if(get_player().cor >= 55)
         {
            outputText("你正要将发簪滑入你的[hair]中，但它一接触到你的头皮就发热了，吓得你把它掉在了地上。看来它不想让你弄脏它的纯洁……你把它捡起来，暂时放回物品栏。");
         }
         else
         {
            if(get_player().hair.length > 0)
            {
               outputText("你将" + benoitMF("Benoit","Benoite") + "给你的发簪滑入你的" + get_player().hairDescript() + "中，在附近的水坑里短暂地欣赏了一下自己，然后继续你的冒险。");
            }
            else
            {
               outputText("你从物品栏中拿出" + benoitMF("本诺瓦","本诺瓦特") + "给你的羽毛发簪，然后将它按在你光秃秃的头上。令你惊讶的是，它竟然粘在了你的头上，就好像你有头发能固定住它一样。");
            }
            get_player().keyItems[_loc1_].value1 = 1;
            get_player().keyItems[_loc1_].value2 = 1;
         }
         outputText("[pg]");
         _g = get_inventory();
         doNext(function():Boolean
         {
            return _g.checkKeyItems();
         });
      }
      
      public function eggySuggest() : void
      {
         clearOutput();
         benoitSprite();
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,577) == 0.5)
         {
            suggestSexAfterBasiWombed(true);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,573) > 0)
         {
            if(get_player().isTaur())
            {
               outputText("你默默地隔着柜台再次握住" + benoitMF("他","她") + "的手。" + benoitMF("本诺瓦","本诺瓦特") + "充满深情地对你咧嘴一笑，两人手牵手，悄悄地再次溜进了储藏室。");
               outputText("[pg]你再次小心翼翼地引导你那失明的同伴来到一个干净的角落，将" + benoitMF("他","她") + "推到木墙上，然后退后一步，慢慢脱下你的[armor]。你咧嘴一笑，故意将每一件装备重重地扔在压实的泥土上，让" + benoitMF("他","她") + "通过声音来猜测那是什么。当你的内衣落下，发出羽毛般轻柔的声音时，" + benoitMF("他","她") + "的呼吸变得更加沉重。当你拉起" + benoitMF("他","她") + "的手，将它们放在你赤裸的肌肤上时，你开始思考接下来该怎么做。");
            }
            else
            {
               outputText("你默默地隔着柜台再次握住" + benoitMF("他","她") + "的手。" + benoitMF("本诺瓦","本诺瓦特") + "对你灿烂一笑，两人手牵手，一言不发地再次前往储藏室。");
               outputText("[pg]你再次小心翼翼地引导你那失明的同伴来到一个干净的角落，将" + benoitMF("他","她") + "推到木墙上，然后退后一步，慢慢脱下你的[armor]。你咧嘴一笑，故意将每一件装备重重地扔在压实的泥土上，让" + benoitMF("他","她") + "通过声音来猜测那是什么。当你的内衣落下，发出羽毛般轻柔的声音时，" + benoitMF("他","她") + "的呼吸变得更加沉重。当你拉起" + benoitMF("他","她") + "的手，将它们放在你赤裸的肌肤上时，你开始思考接下来该怎么做。");
            }
            menu();
            addButton(0,"让" + benoitMF("他","她") + "来",repeatSexWithBenoitLetHim);
            addButton(1,"掌握主动",repeatBenoitFuckTakeCharge);
            return;
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,573,FlagDict_Impl_.arrayReadInt(_loc1_,573) + 1);
         if(get_player().isTaur())
         {
            outputText("你把手伸过柜台，轻轻触碰" + benoitMF("本诺瓦","本诺瓦特") + "的手，说如果" + benoitMF("他","她") + "有心情的话，你不介意发泄一些生理需求。");
            outputText("[pg][say: 你——我——什么？] " + benoitMF("他","她") + "回答道，看起来有些惊愕。[say: 你不介意？你是……我不知道是不是……] 你伸出手，紧紧握住" + benoitMF("Benoit","Benoite") + "的手，直到" + benoitMF("他","她") + "紧张的胡言乱语平息下来，然后，" + benoitMF("他","她") + "犹豫着回握了你。你依然握着" + benoitMF("他","她") + "的手，走到板条箱后面，然后温柔地将" + benoitMF("他","她") + "引到摊位的顶篷后面。");
            outputText("[pg]充当" + benoitMF("本诺瓦","本诺瓦特") + "后台办公室的地方非常适合你的目的；夹着" + benoitMF("他","她") + "摊位的两辆马车在这里靠得很近，三角形的空间里堆满了板条箱和未分类的废品。你小心翼翼地把你失明的同伴引到一个空隙处，将" + benoitMF("他","她") + "推到木墙上，退后一步，慢慢脱下你的[armor]。你咧嘴笑着，故意夸张地把每一件装备扔在压实的泥地上，让" + benoitMF("他","她") + "通过声音来猜测那是什么。当你的内衣落下发出轻柔的声音时，" + benoitMF("他","她") + "的呼吸变得更加沉重了。");
            outputText("[pg][say: 这听起来可能有点奇怪，] " + benoitMF("Benoit","Benoite") + "声音沙哑地说，[say: 但是——你介意我先摸摸你吗？我对你的了解只有你的声音。] 你默许了，靠近" + benoitMF("他","她") + "，再次牵起" + benoitMF("他","她") + "的手，温柔地将它们放在你身上。你叹了口气，握住" + benoitMF("他","她") + "的食指爪子，" + benoitMF("他","她") + "开始慢慢地上下滑动。");
            outputText("[pg]" + benoitMF("他","她") + "温暖的手指游走在你的身体上，拂过你的脸庞、你的腹部、你的[hips]；你感觉自己就像一本盲文书，正在被仔细阅读。[say: 老天，] 当" + benoitMF("他","她") + "的手回到你的腰窝时，" + benoitMF("他","她") + "喃喃自语。[say: 老天！] 当" + benoitMF("他","她") + "顺着你的身体一直摸到你那强壮有力的臀部时，" + benoitMF("他","她") + "惊呼出声。[say: 听你那沉重的脚步声，我就知道你是个半人马，] " + benoitMF("他","她") + "惊叹地来回抚摸着你的侧腹，说道。[say: 但知道是一回事，真正摸到又是另一回事了。] " + benoitMF("他","她") + "叹了口气。[say: 我希望你不要介意这有点……尴尬，但我猜你现在可能已经习惯了吧，对吗？]");
            if(get_player().get_gender() == 3)
            {
               outputText("[pg]" + benoitMF("他","她") + "的手顺着你的臀部滑下，直到" + benoitMF("他","她") + "倒吸一口凉气，触碰到了[oneCock]。[say: 你还真是充满了惊喜，] " + benoitMF("他","她") + "干巴巴地说。停顿了一下后，" + benoitMF("他","她") + "慢慢地用" + benoitMF("他","她") + "干燥、光滑的手掌握住你半勃起的肉棒，上下套弄，揉捏盘弄着你，直到你紧绷起来。");
               if(get_player().longestCockLength() <= 10)
               {
                  outputText("尽管这对" + benoitMF("他","她") + "来说显然是一次不可思议的经历，但当" + benoitMF("他","她") + "的手在你的男性器官周围游走时，" + benoitMF("他","她") + "还是勉强挤出了一个得意的微笑。[say: 我的比你大，] " + benoitMF("他","她") + "戏谑道。由于无法从" + benoitMF("他","她") + "所在的位置奖励" + benoitMF("他","她") + "的厚脸皮，你只是哼了一声，跺了跺蹄子，现在已经急不可耐了。");
               }
               else
               {
                  outputText("这对" + benoitMF("他","她") + "来说显然是一次不可思议的经历，当" + benoitMF("他","她") + "的手在你的男性器官周围游走时，这种异样感更加强烈了。[say: 老天啊，[name]，你真是个怪物，] " + benoitMF("他","她") + "声音沙哑地说。你笑了笑，跺了跺蹄子，现在已经急不可耐了。");
               }
            }
            outputText("[pg]" + benoitMF("他","她") + "的双手向上游移，抚过你兽性的臀部，探索着你柔软的肌肤，直到" + benoitMF("他","她") + "触碰到你的阴唇。你闭上眼睛，叹了口气，" + benoitMF("他","她") + "用光滑的手指慢慢分开它们，滑入你的[vagina]。尽管" + benoitMF("他","她") + "的呼吸变得越来越沉重，但" + benoitMF("他","她") + "似乎也对你充满了真正的好奇；" + benoitMF("他","她") + "的手指以令人惊讶的温柔抚过你渐渐湿润的私处，探索着你的每一处褶皱，并且越探越深。当" + benoitMF("他","她") + "触碰到敏感点时，你用叹息声让" + benoitMF("他","她") + "知道什么能让你愉悦，并刻意配合着" + benoitMF("他","她") + "手指的动作，好让" + benoitMF("他","她") + "能更好地照顾到那些地方。" + benoitMF("他","她") + "很快就找到了你的[clit]，它正因渴望而开始肿胀；" + benoitMF("他","她") + "慢慢地在它周围打圈，然后轻弹它，温柔地为你手淫。");
            if(get_player().get_inHeat())
            {
               outputText("此时你的小穴几乎已经泛滥成灾，在蛇怪温柔而细致的探索下，你体内深藏的费洛蒙需求被彻底点燃。你无法停止向" + benoitMF("他","她") + "湿透的手上挺动，用沉重的呻吟宣告着你有多么渴望。");
            }
            outputText("[pg]空气中弥漫着你情欲的气息，当" + benoitMF("Benoit","Benoite") + "吸入这股气息时，" + benoitMF("他","她") + "的呼吸也变得更加沉重。" + benoitMF("他","她") + "的勃起在" + benoitMF("他","她") + "的长衬裤里鼓胀起来，你决定是时候掌握主动了；你后退一步，用你强壮的身体坚持不懈地顶着" + benoitMF("他","她") + "，直到你将" + benoitMF("他","她") + "按在对面墙上的一个空隙里。你越过肩膀看着" + benoitMF("他","她") + "解开皮带，让裤子滑落。在你身体散发的费洛蒙的刺激下，" + benoitMF("他","她") + "那根又长又细的紫色肉棒紧绷着，当你撅起[butt]贴上去时，" + benoitMF("他","她") + "弓起背，张开了嘴。光是看着" + benoitMF("他","她") + "强烈的欲望，你就知道你必须慢慢来，以免" + benoitMF("他","她") + "直接射出来；你露出一个伴侣看不见的邪恶微笑，心想你对" + benoitMF("他","她") + "的影响如此之大，就算" + benoitMF("他","她") + "射了可能也无所谓。尽管如此，当" + benoitMF("他","她") + "把手放在你的侧腹上时，你还是叹息着向后靠去，尽可能温柔地将" + benoitMF("他","她") + "的长度慢慢滑入你湿润的[vagina]中。");
            get_player().cuntChange(12,true,true,false);
            outputText("[pg]本诺瓦的肉棒异常光滑，你以不可思议的顺滑感向下移动。你没有立刻将自己完全埋进去，而是只让三分之一进入你湿润的深处，然后慢慢地将它拔出，缓慢地起伏。你停下来，让" + benoitMF("他","她") + "敏感的龟头刚好在里面，刻意地转动你的[hips]，当它在你光滑的肉壁内缓慢旋转时，你发出了叹息。" + benoitMF("Benoit","Benoite") + "干涩地呻吟着，你感觉到" + benoitMF("他","她") + "的身体紧绷起来；你立刻停止动作并等待，只有当" + benoitMF("他","她") + "平静下来时，才逐渐开始再次旋转和挺动。当你再次向前弯腰时，你让" + benoitMF("他","她") + "滑入更多，这次只把" + benoitMF("他","她") + "的根部留在外面；当你感觉到" + benoitMF("他","她") + "更深地潜入你湿润的深处时，你叹了口气。" + benoitMF("他","她") + "发出一声野兽般的低吼，试图将自己挺进你体内并压在你身上；你嘲弄地啧啧两声，从" + benoitMF("他","她") + "身边抽离，停止动作，直到蛇怪显然用巨大的意志力让自己平静下来，背靠着墙，任由你摆弄" + benoitMF("他","她") + "。");
            if(get_player().vaginalCapacity() <= 30)
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你感觉到" + benoitMF("他","她") + "到底时，你发出了娇喘，尽管" + benoitMF("他","她") + "还有几英寸留在你体外。" + benoitMF("他","她") + "那细长的尺寸对你紧致的私处来说简直再完美不过了；当你如梦似幻地在" + benoitMF("他","她") + "体内进出时，" + benoitMF("他","她") + "摩擦着你的肉壁，让阵阵快感流遍你的全身。");
            }
            else
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你的腹股沟伴随着湿润的亲吻贴上" + benoitMF("他","她") + "肌肉发达的大腿，你的私处将" + benoitMF("他","她") + "的肉棒整个吞没时，你发出了娇喘。你开始缓慢而用力地骑乘" + benoitMF("他","她") + "，将" + benoitMF("他","她") + "的肉棒向上弯曲，挤压你敏感的肉壁，阵阵快感开始流遍你的全身。");
            }
            outputText("[pg]你保持着这种缓慢的节奏，感觉像过了几个小时，走走停停，刻意地拉扯和推挤，以保持对这只被你逼到角落的蛇怪的控制。这种做爱的节奏对" + benoitMF("本诺瓦","本诺瓦特") + "来说显然是痛苦的；" + benoitMF("他","她") + "随着你[vagina]湿润的动作喘息、紧绷、倒吸凉气，" + benoitMF("他","她") + "的脸和胸膛因极度兴奋而涨红，但" + benoitMF("他","她") + "让你保持控制，最终除了躺下任你摆布之外什么也做不了。");
            if(get_player().lactationQ() >= 50)
            {
               outputText("缓慢而性感的做爱足以让你敏感的[nipples]开始渗出乳汁；随着水流的加剧，你呻吟起来，直到你本能地揉捏着你的[chest]，将你甜美温暖的体液喷洒在地板上。听到这个声音，" + benoitMF("本诺瓦","本诺瓦特") + "着实吃了一惊。[say: 哺乳动物真是太奇怪了，]" + benoitMF("他","她") + "嘟囔着，逗得你咯咯直笑。");
            }
            outputText("[pg]随着" + benoitMF("他","她") + "温暖的双手继续在你的臀部游走，你的欲望不断攀升，最终你失去了理智，开始不顾一切地在" + benoitMF("他","她") + "身上起伏，渴望达到顶峰。当你真正开始操" + benoitMF("他","她") + "时，" + benoitMF("本诺瓦","本诺瓦特") + "喘息着，配合着你的动作挺动；当你的身体拍打在蛇怪紧绷的肌肉上时，你动情的淫液溅到了" + benoitMF("他","她") + "的大腿上。当" + benoitMF("他","她") + "高潮时，" + benoitMF("他","她") + "发出了一声刺耳的野兽般的叫声；" + benoitMF("他","她") + "那双盲眼向上翻白，紧紧抓住你的后背，将一波又一波的精液射入你翻腾的深处。" + benoitMF("他","她") + "精液的温暖和" + benoitMF("他","她") + "无助的抽搐将你推向了自己的高潮；难以抑制的快感脉冲淹没了你的大脑，在漫长的几分钟里，你除了趴在蛇怪身上哭泣和尖叫，紧紧抱住" + benoitMF("他","她") + "的后背，榨干" + benoitMF("他","她") + "肉棒里的最后一滴精液之外，什么也做不了。");
            if(get_player().get_gender() == 3)
            {
               outputText("[EachCock]也响应着你女性的高潮而变粗并喷射，将地板溅满了白色的浊液。");
            }
         }
         else
         {
            outputText("你把手伸过柜台，轻轻触碰" + benoitMF("本诺瓦","本诺瓦特") + "的手，说如果" + benoitMF("他","她") + "有心情的话，你不介意发泄一些生理需求。");
            outputText("[pg][say: 你——我——什么？]" + benoitMF("他","她") + "回答道，看起来有些发愣。[say: 你不介意？你是……我不知道是不是……]你伸出手握紧" + benoitMF("本诺瓦","本诺瓦特") + "的手，直到" + benoitMF("他","她") + "紧张的语无伦次停下来，犹豫地回握住你。你依然牵着" + benoitMF("他","她") + "的手，走到板条箱后面，然后温柔地将" + benoitMF("他","她") + "领到摊位的雨篷后。");
            outputText("[pg]充当" + benoitMF("本诺瓦","本诺瓦特") + "后台办公室的地方非常适合你的目的；夹着" + benoitMF("他","她") + "摊位的两辆马车在这里靠得很近，三角形的空间里堆满了板条箱和未分类的废品。你小心翼翼地把你失明的同伴引到一个空隙处，将" + benoitMF("他","她") + "推到木墙上，退后一步，慢慢脱下你的[armor]。你咧嘴笑着，故意夸张地把每一件装备扔在压实的泥地上，让" + benoitMF("他","她") + "通过声音来猜测那是什么。当你的内衣落下发出轻柔的声音时，" + benoitMF("他","她") + "的呼吸变得更加沉重了。");
            outputText("[pg][say: 这听起来可能有些奇怪，]" + benoitMF("本诺瓦","本诺瓦特") + "用低沉沙哑的声音说道，[say: 但是——你介意我先稍微摸摸你吗？我对你的了解只有你的气味和声音。]你默许并靠近过去，再次牵起" + benoitMF("他","她") + "的手，轻轻放在你的身体上。当" + benoitMF("他","她") + "收起食指的利爪，开始缓慢地上下抚摸时，你发出了一声叹息。");
            if(get_player().horns.value > 0 && get_player().horns.type == 1 && get_player().tail.type == 3 && get_player().demonScore() >= 3)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸庞、腹部和[hips]；你感觉自己就像一本书一样被阅读着。" + benoitMF("他","她") + "摸到了你的角，停顿了一下；" + benoitMF("他","她") + "绕到你身后，找到并抓住了你的尾巴，用指腹一直摸到那铲状的尾尖。[say:原来，]" + benoitMF("他","她") + "轻声说道。[say:你是他们中的一员。]" + benoitMF("他","她") + "沉默了一会儿，然后露出了温暖的微笑。[say:但我太傻了。我知道你的内心是不同的。]");
            }
            else if(get_player().ears.type == 2 && get_player().tail.type == 2 && get_player().dogScore() >= 3)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸庞、腹部和[hips]；你感觉自己就像一本书一样被阅读着。当" + benoitMF("他","她") + "摸到你那软塌塌的耳朵时，" + benoitMF("他","她") + "咧嘴笑了；当" + benoitMF("他","她") + "绕到你身后摸到你的尾巴时，更是直接笑出了声。[say:我喜欢狗，但没那么喜欢，[name]，]" + benoitMF("他","她") + "笑着说。");
            }
            else if(get_player().catScore() >= 3 && get_player().tail.type == 8 && get_player().ears.type == 5)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸庞、腹部和[hips]；你感觉自己就像一本书一样被阅读着。当" + benoitMF("他","她") + "摸到你的耳朵时，" + benoitMF("他","她") + "咧嘴笑了；当" + benoitMF("他","她") + "绕到你身后摸到你柔软的尾巴时，更是直接笑出了声。[say:我一直想知道为什么皮埃尔一看到你就那么兴奋，]" + benoitMF("他","她") + "声音沙哑地轻笑着。");
            }
            else if(get_player().lowerBody.type == 13 && get_player().wings.type == 9)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸庞、腹部和[hips]；你感觉自己就像一本书一样被阅读着。" + benoitMF("他","她") + "找到了你的翅膀，并顺着它们一直摸到" + benoitMF("他","她") + "能触及的最高处，当" + benoitMF("他","她") + "抚摸你娇嫩的飞羽时，你忍不住抽搐了一下；" + benoitMF("他","她") + "小心翼翼地把脚往前挪，触碰着你长着爪子的脚趾。[say:所以，]" + benoitMF("他","她") + "叹了口气，当" + benoitMF("他","她") + "触摸你的肩膀时，嘴角挂着一丝微笑。[say:站在我面前的是一只可怕的哈皮。从天而降来蹂躏我。]");
            }
            else if(get_player().hasReptileScales() && (get_player().lizardScore() >= 3 || get_player().nagaScore() >= 3) || get_player().dragonScore() >= 3 || get_player().mermaidScore() >= 3)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸庞、腹部和[hips]；你感觉自己就像一本书一样被阅读着。当" + benoitMF("他","她") + "摸到你的鳞片时，" + benoitMF("他","她") + "微微吃了一惊，然后带着越来越浓厚的兴趣抚摸着你身体的[if (isMer) {鱼身|爬虫部分}]。[say:我真不敢相信我竟然没意识到你是鳞片姐妹的一员，]" + benoitMF("他","她") + "声音沙哑地说。[say:这非常……有趣。]你现在能从" + benoitMF("他","她") + "紧绷的脸部线条中看到真正的兴奋。");
            }
            else if((get_player().wings.type == 1 || get_player().wings.type == 2) && get_player().lowerBody.type == 7)
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸颊、你的小腹、你的[hips]；你感觉自己就像一本书一样被" + benoitMF("他","她") + "阅读着。" + benoitMF("他","她") + "摸到了你半透明的翅膀，顺着它们一直摸到" + benoitMF("他","她") + "能触及的最高处，" + benoitMF("他","她") + "抓住你敏感的翼膜，让你不由得抽搐了一下；然后" + benoitMF("他","她") + "的手顺着你覆盖着甲壳的四肢滑下。[say: 我还以为你只是喜欢穿大靴子，]" + benoitMF("他","她") + "喃喃道。[say: 但这居然是你身体的一部分？哦……真有趣。]");
            }
            else if(get_player().isTaur())
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸颊、你的小腹、你的[hips]；你感觉自己就像一本书一样被" + benoitMF("他","她") + "阅读着。[say: 老天，]" + benoitMF("他","她") + "喃喃地说，" + benoitMF("他","她") + "的手摸到了你的侧腹。[say: 老天！]" + benoitMF("他","她") + "惊呼出声，顺着你的身体一直摸到了你那强壮有力的后半身。[say: 听那哒哒的马蹄声，我就知道你是个半人马，]" + benoitMF("他","她") + "惊奇地来回抚摸着你的侧腹说道。[say: 但知道是一回事，亲手摸到又是另一回事了。]" + benoitMF("他","她") + "叹了口气。[say: 这可能会有点……尴尬，但我猜你现在已经很习惯了吧，对吗？]");
            }
            else if(get_player().isDrider())
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸颊、你的小腹、你的[hips]；你感觉自己就像一本书一样被" + benoitMF("他","她") + "阅读着。[say: 老天，]" + benoitMF("他","她") + "喃喃地说，" + benoitMF("他","她") + "的手摸到了你坚硬的外骨骼上。[say: 老天！]" + benoitMF("他","她") + "惊呼出声，顺着你鼓胀的腹部一直摸到了你的吐丝器。[say: 听那咔哒咔哒的声音，我就知道你是个蜘蛛，]" + benoitMF("他","她") + "惊奇地用手指摸索着你那复杂多节的腿说道。[say: 但知道是一回事，亲手摸到又是另一回事了。]");
            }
            else if(get_player().isGoo())
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸颊、你的小腹、你的[hips]；你感觉自己就像一本书一样被" + benoitMF("他","她") + "阅读着。[say: 听你发出的那种吧唧吧唧的声音，我就知道你与众不同，]" + benoitMF("他","她") + "喃喃地说，" + benoitMF("他","她") + "的手陷入了你柔软无定形的身体里。[say: 但这……老天，这太奇怪了。而且这完全不会弄疼你吗？]" + benoitMF("他","她") + "轻轻地用手指戳了戳你，满脸难以置信地问道。你用咯咯的笑声回答了" + benoitMF("他","她") + "的问题。[say: 那一定非常实用，]" + benoitMF("他","她") + "惊奇地摇着头说道。你顺着" + benoitMF("他","她") + "的手臂慢慢向上攀附，告诉" + benoitMF("他","她") + "，" + benoitMF("他","她") + "根本想象不到有多实用。");
            }
            else if((get_player().foxScore() >= 4 || get_player().kitsuneScore() >= 4) && get_player().ears.type == 9 && get_player().tail.type == 13)
            {
               if(get_player().tail.venom <= 1)
               {
                  outputText("[pg]" + benoitMF("他","她") + "温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被" + benoitMF("他","她") + "阅读着。当" + benoitMF("他","她") + "摸到你竖起的耳朵时，" + benoitMF("他","她") + "咧嘴笑了，而当" + benoitMF("他","她") + "伸手摸到你毛茸茸的尾巴时，" + benoitMF("他","她") + "更是直接笑出了声。[say:我一直想知道为什么皮埃尔一看到你就那么兴奋，]" + benoitMF("他大笑着","她咯咯地笑着") + "。");
               }
               else
               {
                  outputText("[pg]" + benoitMF("他","她") + "温暖的手指游走在你的身体上，拂过你的脸颊、你的腹部、你的[hips]；你感觉自己仿佛像一本书一样被" + benoitMF("他","她") + "阅读着。当" + benoitMF("他","她") + "摸到你竖起的耳朵时，" + benoitMF("他","她") + "咧嘴笑了，而当" + benoitMF("他","她") + "伸手摸到你毛茸茸的尾巴时，" + benoitMF("他","她") + "更是直接笑出了声。[say:你这么做不只是为了捉弄我吧，[name]？]" + benoitMF("他大笑着","她咯咯地笑着") + "。");
               }
            }
            else
            {
               outputText("[pg]" + benoitMF("他","她") + "温暖的手指在你的身体上游走，拂过你的脸颊、腹部和[hips]；你感觉自己就像一本被翻阅的书。[say:你们人类真是又软又毛茸茸，还这么热，]" + benoitMF("他","她") + "声音沙哑地说。[say:你怎么受得了的？]");
            }
            if(get_player().hasCock())
            {
               outputText("[pg]" + benoitMF("他","她") + "的手继续向下游走，直到" + benoitMF("他","她") + "倒吸一口凉气，触碰到了[oneCock]。[say:你还真是充满了惊喜啊，]" + benoitMF("他","她") + "干巴巴地说。顿了顿，" + benoitMF("他","她") + "慢慢地用光滑的手包住你半勃起的肉棒，上下套弄，揉捏着、缠绕着，直到你紧绷起来。");
               if(get_player().cocks[get_player().biggestCockIndex()].cockLength < 10)
               {
                  outputText("尽管这对" + benoitMF("他","她") + "来说显然是一次不可思议的体验，但当" + benoitMF("他","她") + "的手抚摸你的男性器官时，" + benoitMF("他","她") + "还是勉强挤出了一个傲慢的微笑。[say: 我的更大，]" + benoitMF("他","她") + "调侃道。为了奖励" + benoitMF("他","她") + "的厚脸皮，你也开始自己动手感受，隔着裤子抓捏" + benoitMF("他","她") + "紧致柔软的臀部，当你挺进" + benoitMF("他","她") + "体内时，" + benoitMF("他","她") + "不禁喘息起来。");
               }
               else
               {
                  outputText("这对" + benoitMF("他","她") + "来说显然是一次不可思议的体验，当" + benoitMF("他","她") + "的手抚摸你的男性器官时，这种异样感更加强烈了。[say: 圣神啊，[name]；你真是个怪物，]" + benoitMF("他","她") + "声音沙哑地说。你笑了笑，决定是时候自己动手感受一下了；你隔着裤子抓捏" + benoitMF("他","她") + "紧致柔软的臀部，当你挺进" + benoitMF("他","她") + "体内时，" + benoitMF("他","她") + "不禁喘息起来。");
               }
            }
            outputText("[pg]" + benoitMF("他","她") + "的手继续向下游走，移到你的大腿内侧，探索着你柔软的肌肤，直到" + benoitMF("他","她") + "触碰到你的阴唇。你闭上眼睛，叹了口气，因为" + benoitMF("他","她") + "用光滑的手指慢慢拨开它们，滑入你的[vagina]中。虽然" + benoitMF("他","她") + "的呼吸变得越来越沉重，但" + benoitMF("他","她") + "似乎也对你产生了真正的好奇；" + benoitMF("他","她") + "的手指以令人惊讶的温柔在你湿润的私处周围游走，探索着你的每一处褶皱，并随着动作越来越深入。当" + benoitMF("他","她") + "触碰到敏感点时，你通过叹息让" + benoitMF("他","她") + "知道什么能取悦你，并刻意配合" + benoitMF("他","她") + "手指的动作，以便" + benoitMF("他","她") + "能更好地照顾到那些地方。" + benoitMF("他","她") + "很快就找到了你那因渴望而开始肿胀的[clit]；" + benoitMF("他","她") + "慢慢地在上面画圈，然后轻轻弹拨，温柔地挑逗着你。");
            if(get_player().get_inHeat())
            {
               outputText("此时你的阴道几乎要喷涌而出，你身体深处对信息素的渴望被蛇怪温柔细致的探索推向了顶峰。你无法控制自己迎合着" + benoitMF("his","her") + "湿透的手指挺动，用沉重的呻吟宣告你有多么渴望。");
            }
            outputText("[pg]空气中弥漫着你发情的味道，当" + benoitMF("Benoit","Benoite") + "吸入这股味道时，" + benoitMF("他","她") + "的呼吸也变得更加沉重。" + benoitMF("他","她") + "勃起的阴茎在长衬裤里鼓了起来，你决定是时候由你来主导了；你把" + benoitMF("他","她") + "推到墙上，解开" + benoitMF("他","她") + "的扣子，让" + benoitMF("他","她") + "的裤子掉下来。在你身体散发出的信息素的刺激下，" + benoitMF("他","她") + "又长又细的紫色阴茎紧绷着，当你把手放上去时，" + benoitMF("他","她") + "弓起背，张开了嘴。光是看着" + benoitMF("他","她") + "紧绷的肉棒，你就知道你必须慢慢来，以免" + benoitMF("他","她") + "直接射出来；你带着一抹伴侣看不见的邪恶微笑，心想你的身体对" + benoitMF("他","她") + "的影响如此之大，也许" + benoitMF("他","她") + "射了也无所谓。尽管这只发情的蜥蜴人已经迷失在快感的迷雾中，你还是用你所知道的最好方式提醒" + benoitMF("他","她") + "现实，引导" + benoitMF("他","她") + "的手放到你的[hips]上，伴随着一声叹息，尽可能优雅地将" + benoitMF("他","她") + "的长度慢慢滑入你湿润的[vagina]中，尽管你已经急不可耐。");
            get_player().cuntChange(14,true,true,false);
            outputText("[pg]本诺瓦的阴茎异常光滑，你轻松顺滑地坐了下去。你没有直接把自己完全埋进去，而是在只有三分之一进入你湿润深处时停了下来，然后把它拔出来，慢慢地让自己下沉。你在" + benoitMF("他","她") + "敏感的龟头刚进入时停下，刻意地扭动大腿，当它在你湿滑的肉壁里旋转时，你发出叹息。" + benoitMF("Benoit","Benoite") + "呻吟着，你感觉到" + benoitMF("他","她") + "的身体紧绷起来；你立刻停止动作并等待，直到" + benoitMF("他","她") + "平静下来，才开始慢慢地再次旋转和挺动。当你再次向前弯腰时，你滑入得更深了，这次只把" + benoitMF("他","她") + "的根部留在外面；当你感觉到" + benoitMF("他","她") + "进一步深入你湿润的深处时，你发出了一声叹息。" + benoitMF("他","她") + "发出一声野兽般的低吼，试图把自己挺进你体内并压在你身上；你嘲弄地啧啧两声，从" + benoitMF("他","她") + "身上拉开距离并停止动作，直到这只蛇怪显然用极大的意志力让自己平静下来，背靠着墙，任由你摆布" + benoitMF("他","她") + "。");
            if(get_player().vaginalCapacity() < 15)
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你感觉到" + benoitMF("他","她") + "到底时，你发出了娇喘，尽管还有几英寸留在外面。" + benoitMF("他","她") + "细长的阴茎对你紧致的小穴来说再完美不过了；当你如梦似幻地在" + benoitMF("他","她") + "体内抽插时，" + benoitMF("他","她") + "上下摩擦着你的肉壁，让快感的浪潮席卷你的全身。");
            }
            else
            {
               outputText("[pg]你再次滑坐到" + benoitMF("他","她") + "身上，这次当你的腹股沟与" + benoitMF("他","她") + "肌肉发达的大腿湿润地贴合，你的私处将" + benoitMF("他","她") + "的肉棒整个吞没时，你发出了娇喘。你开始用力而缓慢地骑乘" + benoitMF("他","她") + "，将" + benoitMF("他","她") + "的肉棒向上弯曲，挤压你敏感的肉壁，阵阵快感开始席卷你的全身。");
            }
            outputText("[pg]你保持这种状态感觉像过了几个小时，走走停停，刻意地推拉，以将你逼到角落的蛇怪控制在你的掌控之下。这种操弄的节奏对" + benoitMF("本诺瓦","本诺瓦特") + "来说显然是痛苦的；" + benoitMF("他","她") + "随着你[vagina]湿润的动作喘息、紧绷和倒吸凉气，" + benoitMF("他","她") + "的脸和胸膛因极度的性奋而起伏，但" + benoitMF("他","她") + "让你继续掌控局面，最终放弃了抵抗，只是躺在后面任由你摆布。为了给" + benoitMF("他","她") + "找点事做，你抓住" + benoitMF("他","她") + "的手，把它们放在你的[chest]上；在探索了你的肉体一段时间后，" + benoitMF("他","她") + "找到了你的[nipples]并开始揉捏它们，将每个乳头夹在两根手指之间，坚持不懈地摩擦着。");
            if(get_player().lactationQ() > 100)
            {
               outputText("当你的乳房喷出乳汁来回应" + benoitMF("他","她") + "的抚摸时，你呻吟出声；当乳汁");
               if(!get_player().isTaur())
               {
                  outputText("喷到" + benoitMF("他","她") + "脸上时");
               }
               else
               {
                  outputText("顺着" + benoitMF("他","她") + "的手指流下时");
               }
               outputText("，" + benoitMF("他","她") + "惊讶地跳了起来。[say: 哺乳动物真他妈奇怪，] " + benoitMF("他","她") + "嘟囔着，逗得你咯咯直笑。");
            }
            outputText("[pg]随着" + benoitMF("他","她") + "温暖的手继续游走，你的欲望不断攀升，终于失去了理智，不顾一切地向" + benoitMF("他","她") + "挺进，渴望达到顶峰。当你真正开始干" + benoitMF("他","她") + "时，" + benoitMF("Benoit","Benoite") + "喘着粗气，开始配合你的动作；你紧紧搂住" + benoitMF("他","她") + "的脖子，咬住" + benoitMF("他","她") + "的肩膀，你们互相撞击着，当你身体拍打在蛇怪紧绷的肌肉上时，你动情的淫液溅在" + benoitMF("他","她") + "的大腿上。当" + benoitMF("他","她") + "高潮时，" + benoitMF("他","她") + "发出粗糙的野兽般的叫声；" + benoitMF("他","她") + "瞎了的眼睛翻白，紧紧抓住你的背，将一波又一波的精液射入你翻腾的深处。" + benoitMF("他","她") + "精液的温暖和" + benoitMF("他","她") + "无助的抽搐将你推向了自己的高潮；难以抑制的快感脉冲淹没了你的大脑，在接下来的几分钟里，你除了在蛇怪身上哭泣和尖叫之外什么也做不了，你紧紧抱住" + benoitMF("他","她") + "，榨干" + benoitMF("他","她") + "肉棒里的最后一滴精液。");
            if(get_player().hasCock())
            {
               if(!get_player().isTaur())
               {
                  outputText("夹在你们两具滚烫的身体之间，你");
               }
               else
               {
                  outputText("你");
               }
               outputText("的[cock]也随着你的女性高潮喷射而出，将");
               if(!get_player().isTaur())
               {
                  outputText("你们俩");
               }
               else
               {
                  outputText("干燥的泥土");
               }
               outputText("染成了白色。");
            }
         }
         outputText("[pg]最终，你们俩分开了，后退时滴落着混合的体液。[say: 呼！] " + benoitMF("Benoit","Benoite") + "在喘过气来后说道。[say: 那真是……太不可思议了。小姐，你真是……太棒了。] 你发现自己被" + benoitMF("他","她") + "略显震惊的表情逗笑了，这轻快、快乐的声音似乎让" + benoitMF("他","她") + "恢复了一些神智。当" + benoitMF("他","她") + "从你身边走过时，" + benoitMF("他","她") + "擦过你的肩膀，在储藏室里摸索着，直到找到一个抽屉柜。" + benoitMF("他","她") + "打开一个隔间，拿出一个塞满刺鼻绿叶的羊毛小袋子。");
         outputText("[pg][say: 那些鲨鱼女总是从湖里上来把这个卖给我，]" + benoitMF("他","她") + "说。[saystart]这是一种非常有效的，怎么说来着，“抗败血剂”？");
         get_player().orgasm("Generic");
         if((get_player().get_pregnancyType() == 5 || get_player().hasPerk(PerkLib.HarpyWomb) || get_player().hasPerk(PerkLib.Oviposition)) && (get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyType() == 5))
         {
            outputText("我不会把我的孩子强加给你的。来，你想要多少就拿多少。[sayend]");
            menu();
            addButton(0,"收下",takeBenoitsContraceptives);
            addButton(14,"离开",dontTakeEggtraceptives);
         }
         else
         {
            outputText("除非你有卵子，否则我没法让你怀上宝宝。我想我在去翻找东西之前应该多考虑一下……[sayend]");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function dontTakeEggtraceptives() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你微笑着说你不介意怀上并生下几个蛇怪蛋。[say: 你……你不介意？] " + benoitMF("he","she") + "犹豫地说。" + benoitMF("He","She") + "面对着你，有一瞬间看起来好像" + benoitMF("he","she") + "还要说些什么；但随后" + benoitMF("he","she") + "摇了摇" + benoitMF("his","her") + "头，把袋子放回了抽屉里。");
         outputText("[pg]在温暖的余韵中，你从容地重新穿好衣服，然后带领" + benoitMF("him","her") + "回到店里，在捏了捏" + benoitMF("his","her") + "的手后，你离开了。");
         benoitKnocksUpPCCheck();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function convertToBassyEyesPageTwo() : void
      {
         clearOutput();
         benoitSprite();
         outputText("当你醒来时，你睁开眼睛，大叫了一声，然后迅速闭上。天哪，太亮了！[benoit name]冲到你身边，把手放在你的肩膀上。");
         outputText("[pg][say: 怎么了？发生什么事了吗？你没受伤吧？] [benoit ey]越来越担心地说道。你把手放在[benoit eirs]手上，说你没事，只是觉得有点刺眼。你再次睁开眼睛，这次很慢，让眼睛适应光线。你问蛇怪[benoit ey]能不能给你拿面镜子，好奇药水是否起效了。[benoit Ey]点点头，匆匆跑开，拿回来一面小手镜。");
         outputText("[pg][say: 怎么样？]");
         outputText("[pg]当你看着镜子时，你睁大了眼睛，镜子里那双灰色的爬行动物眼球盯着你，让你措手不及。它们绝对迷人，旋转的灰色和湿润的光泽被一条细细的黑色瞳孔裂缝分开。虽然你觉得你可以永远注视它们的深处，但你并没有感觉到像看着其他蛇怪眼睛时那样的强迫感。不知怎么的，你觉得从现在起你将免疫它们的凝视，尽管这确实说得通。毕竟，为什么蛇怪会试图对彼此使用它们的凝视呢？");
         outputText("[pg]你微笑着放下镜子，分享说它起作用了，并在[benoit eir]" + (get_noFur() ? "鼻尖" : "长满鳞片的鼻口") + "上亲吻了一下以感谢[benoit name]。[benoit Eir]" + (get_noFur() ? "脸颊" : "鳞片") + "变成了更深的灰绿色，漫不经心地挥了挥手。");
         outputText("[pg][say: 没什么，这是我给你的礼物，为了你所做的一切。] [benoit ey]害羞地说，然后恢复了更正常的公事公办的态度。随后你被赶出了商店，不过蛇怪还是在你脸颊上留下了一个黏糊糊但充满爱意的舔舐。");
         convertToBassyEyesFinal();
      }
      
      public function convertToBassyEyesFinal() : void
      {
         benoitSprite();
         get_player().eyes.type = 5;
         outputText("[pg](<b>你的眼睛现在是蛇怪的眼睛了！</b>)");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1301,FlagDict_Impl_.arrayReadInt(_loc1_,1301) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function convertToBassyEyes() : void
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1301) + 1;
         clearOutput();
         benoitSprite();
         if(_loc1_ <= 1)
         {
            outputText("你告诉[benoit name]，你已经权衡了利弊，并且你想变得更像蛇怪。[benoit ey]点了点头，摸索着穿过柜台，然后在下面翻找起来。");
            outputText("[pg][say: 我找到了一个可以改变你眼睛的方法，但我不知道它是否有效。告诉我这个方法的人坚持说，这个配方需要你本身已经足够像蛇怪才行。]");
            outputText("[pg]当这位失明的蛇怪开始从柜台下拿出一瓶又一瓶的东西时，你有些疑惑[benoit ey]的意思。");
            outputText("[pg][say: 希望你生了那么多孩子已经足够了。] [benoit ey]一边嘟囔着，一边拿出一个大碗。[benoit Ey]开始随意地将瓶子里的液体倒入碗中，不时用木勺搅拌。当[benoit ey]停下来时，混合物呈现出一种平淡的暗灰色。[benoit Ey]将手掌放在碗上方，用爪子划开一道口子，因为疼痛而发出嘶嘶声，血滴落入碗中，发出轻微的溅水声。[benoit Ey]将一根手指伸向[benoit eir]浑浊的眼睛，抹去一滴眼泪，然后让它也滑入混合物中。");
            outputText("[pg]当[benoit name]去拿布包扎伤口时，你敬畏地看着原本暗淡的混合物呈现出湿润的光泽，就像一个无尽的灰色水池。这让你想起了山里蛇怪的眼睛，你本能地退缩了一下，然后才意识到自己有多傻。");
            outputText("[pg][say: 那你到底喝不喝？还是说我要白白关店一天？] [benoit name]说道，吓了你一跳，你刚才太专注于混合物了，都没注意到这位失明的蛇怪已经回来了。");
            outputText("[pg]你迅速地点了点头，抓起碗一饮而尽，然后才意识到自己没有用语言回应。你呻吟了一声，混合物在你的舌头上感觉很粘稠，虽然味道并不算太难吃。你的眼皮感觉很重，就像石头做的一样。你告诉[benoit name]你觉得你需要休息一会儿，蛇怪现在催促你到储藏室的一个角落，那里有一堆布料。[benoit Ey]扶你躺在上面，你闭上了眼睛。");
            doNext(convertToBassyEyesPageTwo);
            return;
         }
         outputText("你告诉[benoit name]，你失去了蛇怪的眼睛，并问[benoit em]，[benoit ey]是否能再次赐予你。");
         if(_loc1_ == 2)
         {
            outputText("[pg][benoit name]说道：[say: 哦，你弄丢了？这可不是我今天想听到的，不过好吧，[name]。我去配制药水……]");
         }
         else if(_loc1_ >= 3 && _loc1_ < 6)
         {
            outputText("[pg][benoit name]说道：[say: 你又弄丢了？这可不是我今天想听到的，不过好吧，[name]。我去配制药水……]");
         }
         else
         {
            outputText("[pg][benoit name]说道：[say: 你又弄丢了？你应该更小心点，别总是弄丢，[name]！]");
         }
         outputText("[benoit name]走到柜台的那一边，再次拿出瓶子");
         if(_loc1_ >= 6)
         {
            outputText("，一边做一边抱怨");
         }
         outputText("。");
         outputText("[pg][say: 好了……这是第" + Utils.num2TextOrdinal(_loc1_) + "次了，] [benoit ey]嘟囔着，虽然你能看出来，[benoit ey]并没有生气");
         outputText(_loc1_ < 6 ? "。" : "，只是厌倦了这么频繁地配制药水。也许你以后应该更小心一点？");
         outputText("[pg]几分钟后，一个碗被推到你面前，里面晃动着熟悉的灰色混合物。你喝干了碗里的东西，然后躺下。");
         outputText("[pg]当你醒来时，你慢慢地睁开眼睛，等待适应。你在离开前，在[benoit name]的" + (get_noFur() ? "脸颊" : "鼻吻") + "上轻轻吻了一下，感谢[benoit eir]的帮助。当你在镜子里看到自己的倒影时，你再次感觉到那种想要深深凝视蛇怪灰色眼眸的冲动消退了。");
         convertToBassyEyesFinal();
      }
      
      public function clearBenoitPreggers() : void
      {
         var _loc1_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) != 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1190,FlagDict_Impl_.arrayReadInt(_loc1_,1190) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1186,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1187,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1182,get_game().time.days);
         }
      }
      
      public function buyOrSellExplanationFirstTime() : void
      {
         benoitSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,564,FlagDict_Impl_.arrayReadInt(_loc1_,564) + 1);
         outputText("[say: 只要你在本诺瓦的奇妙打捞店里看到你想要的东西，并且你能把它拿走，那它就是你的，] 本诺瓦回答道，他戏剧性地挥舞着爪子，把整个摊位都揽入怀中，但差点打翻了一个鸟笼。[say: 当然，前提是你付得起我定的价。如果你想把你的垃圾卸在“这里”？那也行。不过我付不起特尔阿德雷那些大老板能付的价。每天都来看看吧；奇妙打捞店总有新玩意儿卖。]");
      }
      
      public function buyMapConfirmation() : void
      {
         clearOutput();
         benoitSprite();
         if(get_player().get_gems() < 2500)
         {
            outputText("你数了数你的宝石，发现这超出了你的承受范围。");
            doNext(benoitsBuyMenu);
            return;
         }
         outputText("[say: 给你。我不需要这个。]" + benoitMF("本诺瓦","本诺瓦特") + "说道。");
         outputText("[pg]<b>你买了一张通往火山岩某个独特地点的地图！</b>");
         get_player().createKeyItem("Poorly done map to Volcanic Crag",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2500);
         statScreenRefresh();
         doNext(benoitsBuyMenu);
      }
      
      public function buyMap() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你向" + benoitMF("本诺瓦","本诺瓦特") + "询问关于地图的事。");
         outputText("[pg][say: 那个？几年前有个恶魔来到这里，试图把它卖给我。它可能会通向巨大的宝藏，所以把它当成一项投资吧。2500颗宝石，] " + benoitMF("他","她") + "说道。");
         outputText("[pg]该死，这可真不便宜。你要买这张地图吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2682) >= 1)
         {
            outputText("\n<b>既然你已经在火山岩找到了那座塔，这张地图现在对你来说可能没什么用了。</b>");
         }
         doYesNo(buyMapConfirmation,benoitsBuyMenu);
      }
      
      public function buyFlintlockConfirmation() : void
      {
         clearOutput();
         benoitSprite();
         if(get_player().get_gems() < 200)
         {
            outputText("你数了数你的宝石，发现这超出了你的承受范围。");
            doNext(benoitsBuyMenu);
            return;
         }
         outputText("[say: 给你。我不需要这个。]" + benoitMF("本诺瓦","本诺瓦特") + "说道。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2111,FlagDict_Impl_.arrayReadInt(_loc1_,2111) + 1);
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 200);
         statScreenRefresh();
         get_inventory().takeItem(get_weapons().FLINTLK,benoitsBuyMenu);
      }
      
      public function buyFlintlock() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你在" + benoitMF("本诺瓦","本诺瓦特") + "的店里转悠了好一会儿，寻找着有趣的东西，直到你发现了一件有趣的物品。");
         outputText("[pg]你走过去拿起引起你注意的东西，展示给" + benoitMF("本诺瓦","本诺瓦特") + "看。[say: 介个？我知道介是一把武器，它最初属于很久以前的一个地精，] " + benoitMF("他","她") + "说道。");
         outputText("[pg]是时候测试一下这把武器了。你把手枪瞄准一个空锡罐，扣动了扳机。一发子弹从手枪中射出，击中了锡罐，把它从架子上打了下来。" + benoitMF("本诺瓦","本诺瓦特") + "惊讶地看着，说道，[say: 它还能用？200颗宝石，它就是你的了。]");
         outputText("[pg]你要买这把枪吗？");
         doYesNo(buyFlintlockConfirmation,benoitsBuyMenu);
      }
      
      public function buyBackpackConfirmation(param1:int = 3, param2:String = undefined, param3:int = 200) : void
      {
         if(param2 == null)
         {
            param2 = "Small";
         }
         clearOutput();
         benoitSprite();
         if(get_player().get_gems() < param3)
         {
            outputText("你数了数你的宝石，发现这超出了你的承受范围。");
            doNext(benoitsBuyMenu);
            return;
         }
         outputText("[say: 给你。我不需要这个。]" + benoitMF("本诺瓦","本诺瓦特") + "说道。");
         if(get_player().hasKeyItem("Backpack"))
         {
            outputText("[pg]<b>(关键物品已升级：" + Utils.cnName(param2) + "背包！你现在拥有" + Utils.num2Text(param1 - get_player().keyItemv1("Backpack")) + "个额外的物品槽");
            get_player().addKeyValue("Backpack",1,param1 - get_player().keyItemv1("Backpack"));
            outputText("，总共有" + Utils.num2Text(get_inventory().getMaxSlots()) + "个物品槽。)</b>");
         }
         else
         {
            outputText("[pg]<b>(获得关键物品：" + Utils.cnName(param2) + "背包！你现在拥有" + Utils.num2Text(param1) + "个额外的物品槽");
            get_player().createKeyItem("Backpack",param1,0,0,0);
            outputText("，总共有" + Utils.num2Text(get_inventory().getMaxSlots()) + "个物品槽。)</b>");
         }
         get_inventory().unlockSlots();
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - param3);
         statScreenRefresh();
         doNext(benoitsBuyMenu);
      }
      
      public function buyBackpack() : void
      {
         var price2:int;
         var sizeDesc2:String;
         var size2:int;
         var _g2:Benoit;
         var price1:int;
         var sizeDesc1:String;
         var size1:int;
         var _g1:Benoit;
         var price:int;
         var sizeDesc:String;
         var size:int;
         var _g:Benoit;
         clearOutput();
         benoitSprite();
         outputText("你问" + benoitMF("本诺瓦","本诺瓦特") + "，" + benoitMF("他","她") + "有没有多余的背包。");
         outputText("[pg][say: 有的。这些有三种尺寸。你要选哪种？]" + benoitMF("他","她") + "问道。");
         outputText("[pg]<b><u>背包尺寸和价格</u></b>");
         outputText("\n小号背包：200宝石，+3物品栏槽位");
         outputText("\n中号背包：600宝石，+4物品栏槽位");
         outputText("\n大号背包：1200宝石，+5物品栏槽位");
         menu();
         if(get_player().keyItemv1("Backpack") < 3)
         {
            _g = this;
            size = 3;
            sizeDesc = "Small";
            price = 200;
            addButton(0,"小号背包",function():void
            {
               _g.buyBackpackConfirmation(size,sizeDesc,price);
            }).hint("提供额外的三个槽位。\n\n花费：200宝石");
         }
         if(get_player().keyItemv1("Backpack") < 4)
         {
            _g1 = this;
            size1 = 4;
            sizeDesc1 = "Medium";
            price1 = 600;
            addButton(1,"中号背包",function():void
            {
               _g1.buyBackpackConfirmation(size1,sizeDesc1,price1);
            }).hint("提供额外的四个槽位。\n\n花费：600宝石");
         }
         if(get_player().keyItemv1("Backpack") < 5)
         {
            _g2 = this;
            size2 = 5;
            sizeDesc2 = "Large";
            price2 = 1200;
            addButton(2,"大号背包",function():void
            {
               _g2.buyBackpackConfirmation(size2,sizeDesc2,price2);
            }).hint("提供额外的五个物品槽。\n\n花费：1200宝石");
         }
         addButton(4,"算了",benoitsBuyMenu);
      }
      
      public function buyAlarmClockConfirmation() : void
      {
         clearOutput();
         benoitSprite();
         if(get_player().get_gems() < 500)
         {
            outputText("你数了数你的宝石，发现这超出了你的承受范围。");
            doNext(benoitsBuyMenu);
            return;
         }
         outputText("[say: 给你。我不需要这个。]" + benoitMF("本诺瓦","本诺瓦特") + "说道。");
         outputText("[pg]<b>你现在可以设置闹钟了。去你的小屋设置闹钟。（并更改你醒来的时间。）</b>");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2113,FlagDict_Impl_.arrayReadInt(_loc2_,2113) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2114,6);
         doNext(benoitsBuyMenu);
      }
      
      public function buyAlarmClock() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你在" + benoitMF("本诺瓦","本诺瓦特") + "的店里转悠了好一会儿，寻找着有趣的东西，直到你发现了一件有趣的物品。");
         outputText("[pg]这是一个机械钟。它有一个翻页显示屏，钟的顶部有用于设置时间和闹钟的按钮。你给钟上发条，显示屏翻转了，表明这个钟还能用。制造这个钟的人一定是个天才，你甚至会猜想在腐化之前，这是一个地精制造的。你拿起钟，把它展示给" + benoitMF("本诺瓦","本诺瓦特") + "。");
         outputText("[pg][say: 还能用？我不需要这个。500宝石，]" + benoitMF("他","她") + "说道。");
         outputText("[pg]你要买这个钟吗？");
         doYesNo(buyAlarmClockConfirmation,benoitsBuyMenu);
      }
      
      public function benoitsBuyMenu() : void
      {
         var slot2:int;
         var _g2:Benoit;
         var slot1:int;
         var _g1:Benoit;
         var slot:int;
         var _g:Benoit;
         clearOutput();
         if(get_silly() && get_spritesEnabled() && !get_oldSprites())
         {
            imageSelect(ImageDb.get_i_benoitShekels(),12,get_survival() ? 570 : 541);
            spriteSelect(null);
         }
         else
         {
            benoitSprite();
         }
         var _loc1_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,567));
         var _loc2_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,568));
         var _loc3_:ItemType = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,569));
         if(!(567 in KFLAGS.flags.h))
         {
            updateBenoitInventory();
         }
         var _loc4_:Number = 2;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,564) == 0)
         {
            buyOrSellExplanationFirstTime();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) != 0)
         {
            _loc4_ = 1.66;
            outputText("[say: 有些人可能称这些为废品，] 本诺瓦特指着她最新的商品说道。[say: 我嘛……我称之为垃圾。]");
         }
         else
         {
            outputText("[say: 有些人可能称这些为废品，] 本诺瓦指着他最新的商品说道。[say: 我嘛……我称之为垃圾。]");
         }
         outputText("[pg]<b><u>" + benoitMF("本诺瓦","本诺瓦特") + "的价格</u></b>");
         outputText("\n" + Utils.cnName(_loc1_.get_longName()) + "：" + Math.round(_loc4_ * _loc1_.get_value()));
         outputText("\n" + Utils.cnName(_loc2_.get_longName()) + "：" + Math.round(_loc4_ * _loc2_.get_value()));
         outputText("\n" + Utils.cnName(_loc3_.get_longName()) + "：" + Math.round(_loc4_ * _loc3_.get_value()));
         menu();
         _g = this;
         slot = 1;
         var _loc5_:Function = function():void
         {
            _g.benoitTransactBuy(slot);
         };
         addButton(0,_loc1_.get_shortName(),_loc5_).hint(_loc1_.get_tooltipText(),_loc1_.get_tooltipHeader());
         _g1 = this;
         slot1 = 2;
         var _loc6_:Function = function():void
         {
            _g1.benoitTransactBuy(slot1);
         };
         addButton(1,_loc2_.get_shortName(),_loc6_).hint(_loc2_.get_tooltipText(),_loc2_.get_tooltipHeader());
         _g2 = this;
         slot2 = 3;
         var _loc7_:Function = function():void
         {
            _g2.benoitTransactBuy(slot2);
         };
         addButton(2,_loc3_.get_shortName(),_loc7_).hint(_loc3_.get_tooltipText(),_loc3_.get_tooltipHeader());
         if(get_player().keyItemv1("Backpack") < 5)
         {
            addRowButton(2,"背包",buyBackpack).hint("这个背包能让你携带更多物品。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2111) <= 0)
         {
            addRowButton(2,"燧发枪",buyFlintlock).hint("这把陌生的武器看起来异常危险。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2113) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2007) > 0)
         {
            addRowButton(2,"闹钟",buyAlarmClock).hint("这个机械钟看起来像是玛瑞斯被腐化之前由地精制造的。");
         }
         if(softLevelMin(20) && !get_player().hasKeyItem("Poorly done map to Volcanic Crag"))
         {
            addRowButton(2,"奇怪的地图",buyMap).hint("这张画得很差的地图潦草地画在古老的羊皮纸上，似乎描绘了一片荒芜的风景中有一座巨大的黑塔。底部有一张纸条写着[say: 20个。准备好。把宝石留在约定的地方。]");
         }
         addButton(14,"返回",benoitIntro);
      }
      
      public function benoitVeryHeavyPreggers() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) >= 9 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) <= 12)
         {
            return true;
         }
         return false;
      }
      
      public function benoitTransactBuy(param1:int = 1) : void
      {
         var _loc2_:* = null as ItemType;
         clearOutput();
         if(get_silly() && get_spritesEnabled() && !get_oldSprites())
         {
            imageSelect(ImageDb.get_i_benoitShekels(),12,get_survival() ? 570 : 541);
            spriteSelect(null);
         }
         else
         {
            benoitSprite();
         }
         var _loc3_:Number = 2;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) != 0)
         {
            _loc3_ = 1.66;
         }
         if(param1 == 1)
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,567));
         }
         else if(param1 == 2)
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,568));
         }
         else
         {
            _loc2_ = ItemType.lookupItem(FlagDict_Impl_.arrayReadString(KFLAGS.flags,569));
         }
         if(get_player().get_gems() < Math.round(_loc3_ * _loc2_.get_value()))
         {
            outputText("你考虑买下它，但你没有足够的宝石来完成交易。");
            doNext(benoitsBuyMenu);
            return;
         }
         if(benoitLover())
         {
            outputText("在用" + benoitMF("他","她") + "的手指检查了你挑选的东西后，" + benoitMF("本诺瓦","本诺瓦特") + "把它递给了你，并咧嘴笑着收下了你的宝石。");
         }
         else
         {
            outputText("在用" + benoitMF("他","她") + "的手指检查了你挑选的东西后，" + benoitMF("本诺瓦","本诺瓦特") + "把它递给了你，报出了价格，并简短地点了点头，收下了你的宝石。[pg]");
         }
         benoitAffection(3);
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() - int(Math.round(_loc3_ * _loc2_.get_value())));
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1 && _loc2_ is Consumable)
         {
            _loc2_.useItem();
            doNext(benoitsBuyMenu);
         }
         else
         {
            get_inventory().takeItem(_loc2_,benoitsBuyMenu);
         }
      }
      
      public function benoitSprite() : void
      {
         if(get_silly())
         {
            spriteSelect(SpriteDb.get_s_benoitSilly());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_benoit());
         }
         imageSelect(null);
      }
      
      public function benoitSellTransact(param1:int, param2:int) : void
      {
         var _loc3_:* = null as Player;
         clearOutput();
         benoitSprite();
         if(benoitLover())
         {
            outputText("本诺瓦" + benoitMF("","特") + "用" + benoitMF("他","她") + "的手指极其简短地检查了一下你的物品，然后把它收起来，带着信任的微笑把宝石报酬递给了你。");
         }
         else
         {
            outputText("在用手和鼻子仔细检查了你给" + benoitMF("他","她") + "的东西后，本诺瓦勉强收下了它，并仔细地数出了你的报酬。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            while(get_player().itemSlots[param1].quantity > 0)
            {
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + int(get_player().itemSlots[param1].itype.get_value() / param2));
               get_player().itemSlots[param1].removeOneItem();
               benoitAffection(1);
            }
         }
         else
         {
            _loc3_ = get_player();
            _loc3_.set_gems(_loc3_.get_gems() + int(get_player().itemSlots[param1].itype.get_value() / param2));
            get_player().itemSlots[param1].removeOneItem();
            benoitAffection(1);
         }
         statScreenRefresh();
         doNext(benoitSellMenu);
      }
      
      public function benoitSellMenu() : void
      {
         var sellMod1:int;
         var totalItems1:int;
         var _g:Benoit;
         var _loc4_:int = 0;
         clearOutput();
         benoitSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,564) == 0)
         {
            buyOrSellExplanationFirstTime();
         }
         else
         {
            outputText("[say: 让我看看你这次又想塞给我什么东西吧，] 本诺瓦" + benoitMF("","特") + "叹了口气，坐下来向你摊开" + benoitMF("他","她") + "的手。");
         }
         var _loc1_:int = 3;
         outputText("[pg]（你可以按住Shift键点击以出售堆叠中的所有物品。）");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) != 0)
         {
            _loc1_ = 2;
         }
         outputText("[pg]<b><u>本诺瓦" + benoitMF("","特") + "的估价</u></b>");
         menu();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = _loc3_++;
            if(get_player().itemSlots[_loc4_].quantity > 0 && int(get_player().itemSlots[_loc4_].itype.get_value() / _loc1_) >= 1)
            {
               outputText("\n" + int(get_player().itemSlots[_loc4_].itype.get_value() / _loc1_) + " 颗宝石，用于购买 " + get_player().itemSlots[_loc4_].itype.get_longName() + "。");
               addButton(_loc4_,get_player().itemSlots[_loc4_].get_invLabel(),(function(param1:Array, param2:Array, param3:Array):Function
               {
                  var _g:Array = param1;
                  var sellMod:Array = param2;
                  var slot:Array = param3;
                  return function():void
                  {
                     _g[0].benoitSellTransact(int(slot[0]),int(sellMod[0]));
                  };
               })([this],[_loc1_],[_loc4_])).hint(get_player().itemSlots[_loc4_].get_tooltipText(),get_player().itemSlots[_loc4_].get_tooltipHeader());
               _loc2_ += get_player().itemSlots[_loc4_].quantity;
            }
         }
         if(_loc2_ > 1)
         {
            _g = this;
            totalItems1 = _loc2_;
            sellMod1 = _loc1_;
            addButton(12,"全部出售",function():void
            {
               _g.benoitSellAllTransact(totalItems1,sellMod1);
            });
         }
         addButton(14,"返回",benoitIntro);
      }
      
      public function benoitSellAllTransact(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         clearOutput();
         benoitSprite();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc5_ = _loc4_++;
            if(get_player().itemSlots[_loc5_].quantity > 0 && int(get_player().itemSlots[_loc5_].itype.get_value() / param2) >= 1)
            {
               _loc3_ += get_player().itemSlots[_loc5_].quantity * (int(get_player().itemSlots[_loc5_].itype.get_value() / param2));
               get_player().itemSlots[_loc5_].set_quantity(0);
            }
         }
         if(benoitLover())
         {
            outputText("本诺瓦" + benoitMF("","特") + "用" + benoitMF("他","她") + "的手指极其简短地检查了一下你的物品，然后把它们收起来，带着信任的微笑把" + Utils.num2Text(_loc3_) + "颗宝石的报酬递给了你。");
         }
         else
         {
            outputText("在用手和鼻子仔细检查了你给他的物品后，本诺瓦勉强收下了它们，并仔细地数出了你" + Utils.num2Text(_loc3_) + "颗宝石的报酬。");
         }
         var _loc6_:Player = get_player();
         _loc6_.set_gems(_loc6_.get_gems() + _loc3_);
         statScreenRefresh();
         benoitAffection(param1);
         doNext(benoitIntro);
      }
      
      public function benoitRegularPreggers() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) <= 4)
         {
            return true;
         }
         return false;
      }
      
      public function benoitPreggers() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function benoitOffspring() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1190);
      }
      
      public function benoitMF(param1:String, param2:String) : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 3)
         {
            return param2;
         }
         return param1;
      }
      
      public function benoitLover() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,573) >= 2;
      }
      
      public function benoitKnocksUpPCCheck() : void
      {
         if(get_player().get_pregnancyType() == 14 && get_player().hasPerk(PerkLib.BasiliskWomb))
         {
            get_player().knockUpForce(18,get_player().get_pregnancyIncubation());
         }
         if((get_player().get_pregnancyType() == 5 || get_player().hasPerk(PerkLib.HarpyWomb) || get_player().hasPerk(PerkLib.Oviposition) || get_player().hasPerk(PerkLib.BasiliskWomb)) && (get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyType() == 5))
         {
            if(get_player().hasPerk(PerkLib.BasiliskWomb))
            {
               if(get_player().get_pregnancyType() != 5 || get_player().get_pregnancyIncubation() == 0)
               {
                  get_player().knockUp(18,250);
               }
               if(get_player().get_pregnancyIncubation() > 0)
               {
                  get_player().knockUpForce(18,get_player().get_pregnancyIncubation());
               }
            }
            else
            {
               get_player().knockUp(14,250);
            }
         }
      }
      
      public function benoitKnockUp() : Boolean
      {
         if(benoitPreggers())
         {
            return false;
         }
         if(!benoitInClutch())
         {
            return false;
         }
         var _loc1_:int = 0;
         if(get_player().hasPerk(PerkLib.ElvenBounty))
         {
            _loc1_++;
         }
         if(get_player().hasPerk(PerkLib.MaraesGiftStud))
         {
            _loc1_ += 2;
         }
         if(get_player().hasPerk(PerkLib.FerasBoonAlpha))
         {
            _loc1_++;
         }
         var _loc2_:int = int(get_player().cumQ() / 200);
         var _loc3_:int = 1 + _loc1_;
         if(_loc2_ > 12)
         {
            _loc2_ = 12;
         }
         if(_loc2_ < _loc3_)
         {
            _loc2_ = _loc3_;
         }
         _loc2_ += _loc1_;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1186,_loc2_);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1187,168);
         return true;
      }
      
      public function benoitIntro() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         benoitSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,562) == 0)
         {
            outputText("你小心翼翼地靠近摊位。巨大的悬垂顶篷投下的阴影让你很难看清里面的情况，而摊位周围堆积如山的物品和沿着木墙排列的架子上悬挂的东西更是让进去变得危险重重。玛瑞斯曾经创造或提炼过的所有东西似乎都在这里——或者至少，玛瑞斯曾经扔掉的所有东西都在这里。锅、碗、瓢、盆、丑陋的陶器、塞满衣服的架子、一个塞满各种可疑药水的香料架……你觉得只要你找得够仔细，你大概能在这里找到你想要的任何东西——或者非常相似的东西。");
            outputText("[pg][say: 喂？] 黑暗深处传来一个沙哑的声音。[say: 是谁在那儿？] 你能辨认出一个用板条箱搭成的柜台，后面有一个高高瘦瘦的身影——从他的体型和光滑的鳞片来看，是个蜥蜴人。不过，他的身形让你感到有些不安……你走近一些，想仔细看看摊主。他坐在店里唯一没有被垃圾占据的地方，紧挨着一堆地毯和长袍，钝钝的脑袋上戴着一顶毡帽。当他把灰色的竖瞳转向你时，你才意识到是什么让你感到不安——那是一只蛇怪！恐慌攫住了你，你试图把目光移开……你很容易就做到了。尽管如此，你还是忍不住好奇，试探性地回头看去。这只生物的眼睛似乎有一种奇怪的乳白色，而且似乎在盯着你身后的地方。当你看到小心翼翼地平衡在柜台边上的白手杖时，你恍然大悟。");
            outputText("[pg][say: 是的，看吧，盯着看吧，] 蛇怪用一种长期受苦的语气说道，吓了你一跳。[say: 这是一个很好笑的笑话，对吧？相信我，我每天早上醒来都会笑。至少在这里他们会盯着看。在山里，他们尴尬得甚至不敢看我。或者至少我假设他们不敢。] 他挺直了腰板，咬紧牙关。[say: 不过，我目瞪口呆的朋友，这里不是怪胎秀。这里是本诺瓦的奇妙打捞店！所以如果你不是来买卖打捞物品的……请滚开。]");
            outputText("[pg]你想知道一个瞎子怎么能在集市这种粗糙简陋的地方生存下来，但随后本诺瓦保护性地将" + benoitMF("他","她") + "的爪子蜷缩进" + benoitMF("他","她") + "旁边一堆看起来像长袍的东西里，那堆东西睁开了深褐色的眼睛，把口鼻放在柜台上，哀怨地看着你。埋在布料里的阿尔萨斯犬在你看来像个大软蛋，但你愿意承认这一点。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,565) == 0 && get_player().hasVagina() && (get_player().get_inHeat() || get_player().get_pregnancyType() == 5 || get_player().hasPerk(PerkLib.HarpyWomb) || get_player().hasPerk(PerkLib.Oviposition)) && (get_player().get_pregnancyType() == 5 || get_player().get_pregnancyIncubation() == 0) && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 3))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,565) == 0)
            {
               benoitAndFemPCTalkAboutEggings();
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1193) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1182) <= get_game().time.days && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            femoitNextDayEvent();
         }
         else if(benoitInClutch() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1188) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 2))
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1188,FlagDict_Impl_.arrayReadInt(_loc1_,1188) + 1);
            outputText("当你走进摊位时，本诺瓦特抬起头；虽然她那双失明、乳白色的眼睛让人很难读懂她的情绪，但她看起来很兴奋。[say: 啊！[name]；你来了真是太好了……我一直希望你今天能来拜访。]");
            outputText("[pg]她有些紧张地站了起来，你意识到她的肚子明显隆起，她平时的衣服被撑得紧紧的，勉强遮住她那庞大的腹部。她带着一种胆怯的自豪感拍了拍它。[say: 我怀孕了。我的子宫，它孕育了卵子，它们已经准备好受精了。我……我现在可以做母亲了。如、如果我能给自己找一个愿意的伴侣……] 尽管如此，她还是颤抖了一下；很明显，在几天内从一个单身男性变成一个准妈妈的想法对这只蛇怪来说有点难以接受。");
            outputText("[pg]你问她是否确定自己准备好了。本诺瓦特挺直了脊梁，骄傲地站直了身子。[say: 我准备好了。如果是你胆怯了，好吧……我还会怀着卵子几天。在那之后，我会有几个星期不再怀着它们。如果你需要，我可以等到你准备好。]");
         }
         else if(benoitPreggers() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1187) < 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1187) >= -168)
            {
               femoitBirths();
               return;
            }
            outputText("当你走进摊位时，你注意到本诺瓦特的肚子又变平了。当你走进她的摊位时，她对你露出了灿烂的笑容。[say: 我有好消息，[name]！你当爸爸了！事实上，是" + Std.string(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186)) + "次！哦，我真希望你能帮忙；但我很坚强，坚强到可以自己挺过去，] 她滔滔不绝地说着，语速极快。她显然对自己；以及你的男子气概感到满意。");
            outputText("[pg]她花了一点时间让自己平静下来，仍然对可能找到拯救她族人的答案的前景感到头晕目眩；虽然手段可能并不完全是她所想的那样，但她似乎对这种情况充满热情。");
            outputText("[pg]不过，世界还在继续，她毕竟还有一家店要经营；特别是如果她想养活那些很快就会需要她照顾的饥饿的嘴巴。");
            outputText("[pg][say: 那么，[name]，] 她开始说道，声音中仍然带着一丝兴奋的活力，[say: 本诺瓦特能帮你什么忙？]");
            clearBenoitPreggers();
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1182,FlagDict_Impl_.arrayReadInt(_loc1_,1182) - 7);
         }
         else if(!benoitInClutch() && !benoitPreggers() && get_game().time.days - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1182) >= 30 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1189) == 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,1189,FlagDict_Impl_.arrayReadInt(_loc1_,1189) + 1);
               outputText("当你走进摊位时，你闻到了一股烹饪的味道。进一步调查将你带到了这只失明蛇怪的小厨房，她正忙着煎什么东西。她的鼻子全神贯注于她的饭菜，直到你碰到她的肩膀，她才意识到你正在靠近，吓得尖叫起来。");
               outputText("[pg][say: 别那样做！] 当她认出是你时，她抱怨道。[say: 我差点用这个平底锅砸碎你的脑袋。]");
               outputText("[pg]你问她在做什么。");
               outputText("[pg][say: 我的午餐；一个煎蛋卷，] 她说。");
               outputText("[pg]你的目光几乎像被磁铁吸引一样，落在了她现在又变得平坦的肚子上，你这才恍然大悟她是从哪里弄来的这些蛋。你问她怎么能做出这种事。");
               if(Utils.rand(4) == 0)
               {
                  outputText("[pg][say: 怎么了？它们又没受精，所以，物尽其用嘛，]她耸了耸肩。当你抗议说它们本可以成为她的孩子时，她茫然地看着你——尽管你觉得失明在这方面帮了很大忙。[say: 哺乳动物女孩的，怎么说呢，下体出血本也可以成为她们的孩子；她们会为此感到难过吗？]她问道，嘴角勾起一丝狡黠的笑意。[say: 来点吗？]她天真地问，把平底锅递给你。");
                  outputText("[pg]你拒绝了她的提议，并解释说你来这里是为了别的事情。");
               }
               else
               {
                  outputText("[pg][say: 做什么，确切地——哦。哦。啊哈，我的天，[name]！]本诺瓦特在咯咯笑和狂笑之间呛了一下。[say: 不，[name]，我知道你在想什么。啊哈，]她一边半笑着一边继续说，但在短暂的停顿后设法让自己平静下来，试图恢复一定程度的严肃。[say: 我只是饿了。我，怎么说呢，最近很渴望我的一位供应商一直在卖的这些奇怪的东西。“鸡蛋”？我想我的身体知道它需要什么来补充失去的东西？]");
                  outputText("[pg]她拍了拍自己的腹部，你开始把事情拼凑起来。[say: 哦。哦，]你嘟哝着作为回应。");
               }
            }
            else
            {
               outputText("当你到达时，平坦肚子的蛇怪正大口吃着一盘厚厚的煎蛋卷。");
               outputText("[pg][say: 啊，[name]！我能帮你什么忙？]");
            }
         }
         else if(benoitAffection() <= 10)
         {
            outputText("你再次小心翼翼地走进本诺瓦废品店的阴暗处。店主在你进来时闻了闻空气，然后酸溜溜地看着你。[say: 怎么了？]" + benoitMF("他","她") + "粗声粗气地说。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,573) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,576) == 0)
         {
            firstTimeAfterBoningEncounterBenoit();
         }
         else if(benoitAffection() < 35)
         {
            outputText("你再次小心翼翼地走进本诺瓦废品店的阴暗处。店主在你进来时闻了闻空气，然后在" + benoitMF("他","她") + "的座位上放松下来。[say: 又见面了，[name]。什么风把你吹来了？]");
         }
         else
         {
            outputText("你再次小心翼翼地走进" + benoitMF("本诺瓦","本诺瓦特") + "废品店的阴暗处。店主在你进来时闻了闻空气，然后灿烂地笑了。[say: 这不是我最喜欢的顾客吗！别在外面闲逛了，[name]；请进，让我们，怎么说呢，闲聊一会儿。]");
            if(benoitInClutch() && !benoitPreggers())
            {
               outputText("[pg]雌性蛇怪穿着围裙的肚子明显隆起，这标志着新卵的存在。如果你在这种状态下和她做爱，她很有可能会怀上满肚子的受精卵。");
            }
            else if(benoitRegularPreggers())
            {
               outputText("[pg]蛇怪的肚子鼓了起来，就像家乡任何一个孕妇一样大。她的围裙只是突显了她怀着你孩子的卵这一事实。");
            }
            else if(benoitHeavyPreggers())
            {
               outputText("[pg]本诺瓦特怀孕的迹象显而易见，她怀的卵数量相当惊人。她的围裙被撑到了极限，以容纳她膨胀的肚子，你想知道她每天早上是怎么把它系上的。");
            }
            else if(benoitVeryHeavyPreggers())
            {
               outputText("[pg]蛇怪的肚子因为受精卵而肿胀得厉害，你注意到她尽量避免移动，除非必须。她太臃肿了，已经放弃了系围裙，而是让它在她肿胀的腹部上无力地拍打着。");
            }
            else if(benoitExtremePreggers())
            {
               outputText("[pg]你简直不敢相信本诺瓦特怀孕有多严重——你无法想象能怀上那么多受精卵。她几乎无法动弹，当她站起来拖着脚走时，她的肚子几乎拖在地上；它因为你的孩子而肿胀得那么厉害。不用说，出于实用性，她只能光着身子走来走去。");
            }
         }
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,562,FlagDict_Impl_.arrayReadInt(_loc1_,562) + 1);
         unlockCodexEntry(1305);
         menu();
         addButton(0,"购买",benoitsBuyMenu);
         addButton(1,"出售",benoitSellMenu);
         addButton(2,"交谈",talkToBenoit);
         if(get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) > 0 && get_player().get_lust() >= 33)
         {
            addButton(3,"性爱",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1185) == 0 ? femoitFirstTimeYes : femoitSexIntro);
         }
         addButton(14,"离开",get_bazaar().leaveShop);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1179) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            addRowButton(1,"女性化",benoitFeminise);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) < 3)
         {
            addRowButton(1,"扶她化",benoitHerminise);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,575) == 1 && !get_player().hasPerk(PerkLib.BasiliskWomb) && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,577) == 0 && [0,3].indexOf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181)) >= 0)
         {
            addRowButton(1,"蛇鸡兽子宫",tryToConvertToBassyWomb);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,565) > 0 && get_player().hasVagina() && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 3))
         {
            addRowButton(1,"建议",eggySuggest);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1300) == 1 && get_player().eyes.type != 5)
         {
            addRowButton(1,"蛇鸡兽眼",convertToBassyEyes);
         }
      }
      
      public function benoitInClutch() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1182);
         var _loc2_:int = int(get_game().time.days);
         var _loc3_:int = int((_loc2_ - _loc1_) % 28);
         if(_loc3_ >= 21)
         {
            return true;
         }
         return false;
      }
      
      public function benoitHerminise() : void
      {
         clearOutput();
         benoitSprite();
         if(!get_player().hasItem(get_consumables().P_DRAFT,2) || !get_player().hasItem(get_consumables().PSDELIT) || !get_player().hasItem(get_consumables().REPTLUM))
         {
            outputText("你还没有足够的材料来尝试这个。");
            outputText("[pg]<b>(需要 2x 纯净梦魇药剂，1x 纯净魅魔之悦，1x 鳞族药水。)</b>");
            get_output().flush();
         }
         else
         {
            get_player().destroyItems(get_consumables().P_DRAFT,2);
            get_player().destroyItems(get_consumables().PSDELIT,1);
            get_player().destroyItems(get_consumables().REPTLUM,1);
            outputText("你告诉她，她可以像以前一样，拥有一个新的阴茎。");
            outputText("[pg]你翻出收集到的材料，开始把它们砰砰地放在本诺瓦特面前的柜台上，告诉她你已经准备好了她需要的东西。皮埃尔听到声音兴奋地叫了起来。");
            outputText("[pg][say: 这是个好主意。]蛇怪说。[say: 这样，我仍然可以下蛋，你也可以下蛋。]当你从附近的架子上拿出一个玻璃瓶，从装满旧器具的容器里拿出一把木勺，开始将各种成分混合在一起时，她陷入了沉默。你把液体倒入玻璃瓶中。你小心翼翼地滴入鳞族药水，同时继续搅拌；最终，你面前的液体呈现出一种鲜艳的青柠色。你摇晃瓶子使其充分混合。当气味变成烹饪雪利酒的味道时，你停下来退后一步，欣赏你的杰作，然后轻轻地把碗推过柜台，直到它碰到蛇怪的爪子。她慢慢地用手指握住它，盲目地盯着这种混合物。");
            outputText("[pg]你指示她喝下这种混合物。她点点头，慢慢地喝下混合物，直到瓶子空了。[say: 我能感觉到……]她慢慢地咕哝着。她的长袍下开始隆起一个鼓包。[say: 哦……它来了！]她宣布道。她敞开长袍，露出她新的爬行动物阴茎和阴道上方的一对睾丸。[say: 谢谢你。有了这个，我就可以帮你下蛋了，]她说。");
            outputText("[pg]你向她保证，当你准备好的时候，她总有一天可以这么做的。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1181,3);
            menu();
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function benoitHeavyPreggers() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) <= 8)
         {
            return true;
         }
         return false;
      }
      
      public function benoitHairPinTalkFinal() : void
      {
         benoitSprite();
         dynStats(DynStat.Cor(-(get_player().featheryHairPinEquipped() ? 10 : 5)));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1302,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function benoitHairPinTalk() : void
      {
         clearOutput();
         benoitSprite();
         outputText("你向" + benoitMF("本诺瓦","本诺瓦特") + "询问他给你的那根羽毛发簪的事。");
         outputText("[pg][say: 啊，那根发簪？那是我母亲那边的传家宝。我猜它只是代代相传，没人想要比闪亮的东西更复杂的东西。我想它之所以能逃脱污染，就是因为这个。我本来留着它是想卖掉的，但现在它有了更好的用处。也许我只是多愁善感，但我希望它能让你想起你为蛇怪，以及为我所做的一切。]");
         benoitHairPinTFCheck();
      }
      
      public function benoitHairPinTFYes() : void
      {
         benoitSprite();
         outputText("[pg]你任由这种感觉蔓延，想知道它会带来什么。很快，你的头开始发痒，你伸手去抓，却被那种柔软的触感惊到了。它让你想起小鸡的绒毛，天鹅绒般柔软，略带蓬松。你在附近的水坑里照了照自己，倒吸了一口凉气，你原本长头发的地方，现在长出了红色的羽毛，有些长有些大。这顶松软但柔软的羽冠精致地戴在你的头上，让你想起女士的羽毛头饰。你很快意识到" + benoitMF("你的头发变成了一簇羽毛，就像传说中雌性蛇怪那样！","你长出了一簇羽毛，就像雌性蛇怪那样！"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,66) != 0)
         {
            outputText("[pg]<b>你的头发又开始生长了，现在变成了一顶由红色短羽毛组成的羽冠。</b>");
         }
         else
         {
            outputText("[pg]<b>你的头发现在是一顶由红色短羽毛组成的羽冠。</b>");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,66,0);
         get_player().hair.length = 2;
         get_player().hair.color = "red";
         get_player().hair.type = 7;
         benoitHairPinTalkFinal();
      }
      
      public function benoitHairPinTFNo() : void
      {
         benoitSprite();
         outputText("[pg]你把发簪拿出来放了一会儿，那种感觉一拿出来就消失了。");
         benoitHairPinTalkFinal();
      }
      
      public function benoitHairPinTFCheck() : void
      {
         benoitSprite();
         if(get_player().cor < 30 && get_player().isFemaleOrHerm() && get_player().featheryHairPinEquipped() && [7,3].indexOf(get_player().hair.type) == -1)
         {
            outputText("[pg]你感觉到" + benoitMF("本诺瓦","本诺瓦特") + "给你的发簪变热了，一股柔和的暖流传遍你的全身。直觉告诉你，如果你顺其自然，这件女性发饰会引发某种变化。");
            outputText("[pg]你要顺其自然吗？");
            doYesNo(benoitHairPinTFYes,benoitHairPinTFNo);
            return;
         }
         benoitHairPinTalkFinal();
      }
      
      public function benoitFeminise() : void
      {
         clearOutput();
         benoitSprite();
         if(!get_player().hasItem(get_consumables().P_S_MLK,2) || !get_player().hasItem(get_consumables().L_PNKEG) || !get_player().hasItem(get_consumables().OVIELIX) || !get_player().hasItem(get_consumables().REPTLUM))
         {
            outputText("你还没有足够的材料来尝试这个。");
            outputText("[pg]<b>（需要 2 份纯净魅魔乳液、1 个巨大粉蛋、1 份产卵灵药、1 份鳞族药水。）</b>");
            get_output().flush();
         }
         else
         {
            get_player().destroyItems(get_consumables().P_S_MLK,2);
            get_player().destroyItems(get_consumables().L_PNKEG,1);
            get_player().destroyItems(get_consumables().OVIELIX,1);
            get_player().destroyItems(get_consumables().REPTLUM,1);
            outputText("你翻出你收集的成分，开始把它们砰砰地放在" + benoitMF("本诺瓦","本诺瓦特") + "面前的柜台上，告诉" + benoitMF("他","她") + "你已经得到了" + benoitMF("他","她") + "需要的东西。皮埃尔听到声音兴奋地叫了起来。");
            outputText("[pg][say: 我——什么？]蛇怪困惑地说。[say: 但是……[name]，那只是幻想！我没想到你会……]当你从附近的架子上拿出一个白镴碗，从一个装满旧器具的容器里拿出一把木勺，开始把各种成分混合在一起时，" + benoitMF("他","她") + "陷入了沉默。你把蛋打在碗上，然后把它打进乳液里；这种粘稠物呈现出粉红色的蛋糕糊质地，直到你倒入产卵灵药，它使粘稠物变稀，同时也让这个狭窄的市场摊位充满了相当难闻的硫磺味。你小心翼翼地滴入鳞族药水，同时继续搅拌；最终你面前的液体呈现出一种青柠色。当气味变成烹饪雪利酒的气味时，你停下来，退后一步欣赏你的杰作，然后轻轻地把碗推过柜台，直到它碰到蛇怪的爪子。" + benoitMF("他","她") + "慢慢地用" + benoitMF("他","她") + "的手指握住它，盲目地盯着这种混合物。");
            outputText("[pg][say: 你觉得这真的有用吗？]" + benoitMF("他","她") + "终于开口了。[say: 这东西……能改变我？]说实话你也不知道——而且你很庆幸" + benoitMF("本诺瓦","本诺瓦特") + "看不见这东西的颜色——但你还是尽可能自信地告诉" + benoitMF("他","她") + "这绝对有用。" + benoitMF("他","她") + "粗重地叹了口气，爪子微微颤抖着。[say: 算了，最坏的结果还能怎样——让我变聋吗？]话音刚落，" + benoitMF("他","她") + "的脸上就浮现出惊恐的神色，但" + benoitMF("他","她") + "还是努力甩掉了这个念头，把碗举到唇边。[say: 祝你健康，]" + benoitMF("他","她") + "勉强挤出一丝微笑，然后一饮而尽。");
            outputText("[pg]你看着药水滑入" + benoitMF("他","她") + "的口中，顺着" + benoitMF("他","她") + "的食道流下。当药水全部喝完后，" + benoitMF("他","她") + "放下碗，若有所思地舔了舔嘴唇。");
            outputText("[pg][say: 嗯……还不算是我尝过最难吃的东西，]" + benoitMF("他","她") + "说道。[say: 不过要是能多加点酒精就好了。呃。呃啊啊啊啊……]" + benoitMF("他","她") + "紧紧抓住桌子，肚子里传来一阵巨大的咕噜声。皮埃尔呜咽了一声，你和狗都不自觉地往后退，因为蛇怪开始抽搐痉挛。伴随着一阵摩擦声，" + benoitMF("他","她") + "的骨头开始移位；尽管" + benoitMF("他","她") + "拼命抓着柜台，但随着血肉的蠕动，还是不可避免地把瓶瓶罐罐和小玩意儿扫到了地上。" + benoitMF("他","她") + "的躯干向内收缩，大量脂肪向下转移；长衬裤接缝裂开的声音与" + benoitMF("他","她") + "肩膀向内收缩时发出的令人不适的噼啪声交织在一起。伴随着一阵萌发的声音，" + benoitMF("他","她") + "的头顶长出了闪烁着虹彩的红色羽毛；在" + benoitMF("他","她") + "紧咬的牙关和紧闭的双眼下方，" + benoitMF("他","她") + "的下颌线变得柔和并向上移动。蛇怪现在变得更加纤细的胸前微微隆起，变形到此停止了，或者至少你能直接观察到的变形停止了。但从" + benoitMF("他","她") + "肚子继续发出的呻吟声，以及" + benoitMF("他","她") + "死死抓着木头表面甚至留下更多爪痕的样子来看，在" + benoitMF("本诺瓦","本诺瓦特") + "那破烂不堪的长衬裤里，肯定正在发生着相当惊人的变化。");
            outputText("[pg][say: Zut. Fucking. Alors,] 蛇怪终于挤出了一句话。这生物的声音提高了好几个八度；虽然依旧低沉，但现在听起来相当……沙哑。[say: 这简直和我那次尝试地精食物一样糟糕。这……这是我吗？] " + benoitMF("Benoit","Benoite") + " 惊慌失措地把爪子放在" + benoitMF("他的","她的") + "……不，她的喉咙上。然后她的手上下摸索，每发现一个新的突起和缝隙，她的不安就加剧一分。[say: 这……这不可能是真的，] 她喃喃自语。[say: 这不可能真的发生了……] 她转过身，似乎想把自己从梦中摇醒，结果用屁股撞倒了一堆书。当你看着这一切时，你脑海中唯一突出的想法是，不管你对这只瞎眼的蛇怪做了什么，她现在绝对是风韵犹存。她站在你们俩制造的相当壮观的烂摊子中，绞着双手，显然是不愿意移动她那崭新的体格，生怕撞倒更多的存货。");
            outputText("[pg][say: 你……你明天能再来吗？]" + benoitMF("Benoit","Benoite") + "语气不稳地说。[say: 这……我需要点时间来消化一下。]你把书放回柜台上，挠了挠看起来吓坏了的皮埃尔的耳后，然后离开了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1182,get_game().time.days + 1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1193,1);
            menu();
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function benoitExtremePreggers() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1181) == 0)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1186) >= 13)
         {
            return true;
         }
         return false;
      }
      
      public function benoitBigFamily() : Boolean
      {
         if(!get_player().hasPerk(PerkLib.BasiliskWomb))
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,572) < 8)
         {
            return false;
         }
         return benoitOffspring() >= 15;
      }
      
      public function benoitAndFemPCTalkAboutEggings() : void
      {
         clearOutput();
         benoitSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,565,1);
         outputText("" + benoitMF("本诺瓦","本诺瓦特") + "今天似乎非常紧张。" + benoitMF("他","她") + "来回踱步，用僵硬的点头回应你的问候，并在你寻找话题时，不停地摆弄" + benoitMF("他","她") + "柜台伸手可及的存货。你问是不是出了什么事。");
         outputText("[pg][say: 没事！]" + benoitMF("他","她") + "生气地吼道。" + benoitMF("他","她") + "咳嗽了一声。[say: 没事，]" + benoitMF("他","她") + "用更平静的语气说道。你等着。[say: 只是……你现在的身体状况，]" + benoitMF("他","她") + "最终说道。[say: 它……在呼唤我。但这是我的问题，]" + benoitMF("他","她") + "继续说道，伸直了" + benoitMF("他","她") + "的脖子，紧张地用" + benoitMF("他","她") + "的爪子敲击着柜台。[say: 如果我不能控制自己，我就不是我自己了。求你了，[name]，问你的问题吧。]你看着这只悲伤、骄傲的蛇怪，想知道" + benoitMF("他","她") + "上一次做爱到底是什么时候。");
         outputText("[pg]（[say: 建议]选项已添加到" + benoitMF("本诺瓦","本诺瓦特") + "的菜单中。）");
      }
      
      public function benoitAffection(param1:int = 0) : int
      {
         var _loc2_:* = null as IMap;
         if(param1 != 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,563,FlagDict_Impl_.arrayReadInt(_loc2_,563) + param1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,563) > 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,563,100);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,563) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,563,0);
            }
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,563);
      }
   }
}

