package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.ItemType;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.Inventory;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   
   public class WeaponShop extends Shop
   {
      
      public function WeaponShop()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         sprite = SpriteDb.get_s_weaponsmith();
      }
      
      override public function inside() : void
      {
         clearOutput();
         outputText("当你走到摊位前时，钢锤猛击热金属的高亢刺耳声冲击着你的耳朵。摊主每次敲击他当前的作品时，火花四溅。金属发出红热的光芒，锤子以经验丰富的铁匠指导之手无情、熟练的精确度落下。" + (get_noFur() ? "一条灰白相间的短尾巴" : "厚厚的灰白相间的皮毛") + " 随着铁匠站起来而竖起，向你展示了他身形的细节。他是居住在这个城市的狗人之一，尽管他的 " + (get_noFur() ? "尾巴" : "皮毛") + " 和耳朵让你想起你一个朋友从小养的一只叫哈士奇的狗。这个铁匠一点也不像哈士奇。他相当矮，但精瘦且像鞭绳一样坚韧。由于他的职业，他的右臂比左臂肌肉发达得多，他走路时带着一种只有随着年龄和经验才能带来的自信步伐。[pg]");
         outputText("当他注意到你时，他那双锐利的蓝眼睛与你的目光相遇，他吠叫道，[say: 买点东西，或者滚开。]");
         outputText("[pg]你买什么？");
         menu();
         addItemBuyButton(get_consumables().W_STICK);
         addItemBuyButton(get_weapons().CLAYMOR);
         addItemBuyButton(get_weapons().WARHAMR);
         addItemBuyButton(get_weapons().KATANA);
         addItemBuyButton(get_weapons().SPEAR);
         addItemBuyButton(get_weapons().WHIP);
         addItemBuyButton(get_weapons().W_STAFF);
         addItemBuyButton(get_weapons().S_GAUNT);
         addItemBuyButton(get_weapons().DAGGER);
         addItemBuyButton(get_weapons().SCIMITR);
         addItemBuyButton(get_weapons().MACE);
         addItemBuyButton(get_weapons().FLAIL);
         if(get_player().hasKeyItem("Sheila\'s Lethicite") || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2063) > 0)
         {
            addButton(13,"伤痕之刃",forgeScarredBlade);
         }
         addButton(14,"离开",get_telAdre().armorShops);
      }
      
      public function forgeScarredBladeStart() : void
      {
         clearOutput();
         outputText("当你走近铁匠，却没有看任何展示的武器时，他用审视的目光看着你。[pg]");
         outputText("[say: 你想要什么？] 他用特有的粗犷声音说道。[pg]");
         outputText("你拿出从希拉那里得到的深紫色水晶，问他是否可以用它来锻造一把刀刃。他还没有动身从你伸出的手中接过它，但你可以从他柔和下来的面部表情中看到一丝兴趣。[say: 那是一块莱希石。你从哪里弄来的？] 铁匠问道。[pg]");
         outputText("[say: 从一个恶魔那里偷来的，] 你撒谎道。[pg]");
         outputText("他在回答之前又考虑了一会儿。[say: 那干得好。] 说完，他小心翼翼地从你手中接过水晶。[say: 以前从来没有用过这个。我不保证什么，但两周后再来。我应该会有消息告诉你。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2063,get_game().time.days);
         get_player().removeKeyItem("Sheila\'s Lethicite");
         doNext(inside);
      }
      
      public function forgeScarredBladeMiddle() : void
      {
         clearOutput();
         outputText("你刚走进去，武器匠就从锻炉前抬起头来。[say: 哦，是你啊。我还没弄完呢。] 他打了个手势，把你打发走了。你只能看看那些成品，聊以自慰。[pg]");
         doNext(inside);
      }
      
      public function forgeScarredBladeEnd() : void
      {
         clearOutput();
         outputText("你刚走进去，铁匠就抬起头来，你敢发誓，他那原本就紧绷、不苟言笑的嘴唇抿得更紧了。[say: 是你啊。过来。][pg]");
         outputText("你顺从地走近他，尽管锻炉的热气令人窒息。[say: 我做完了。水晶很容易就融入了金属，但这刀刃本身……你自己看吧。] 他从一堆半成品武器中拿起一把破旧的刀鞘递给你——就在这时，你第一次注意到他手上缠着许多绷带。你有些警惕地将刀刃拔出一半；拔出时，刀刃与上油的皮革摩擦，发出嘶嘶声。这把武器的形状细长，弧度优美，在锻炉火光的映衬下，闪烁着幽暗的光芒，但其宽阔的侧面却布满了深深的纹路。[pg]");
         outputText("[say: 真是活见鬼了。我怎么也弄不直这刀刃——每一锤下去，它都会震动着从铁砧上弹开，然后扭曲到别的地方，每次我敲平一处，它就会多出一个新的扭曲。失败了几次后，我决定把它做成单刃剑的样式，把弯曲的部分引向平坦的边缘。但这还不是最诡异的。你可以看到它有多锋利；只要在砂轮上轻轻一碰，刀刃就自己成型了。我根本没磨过它——不需要。但当我试图在刀柄上方刻个图案时，它却滑到了模板下面，在刀刃上留下了一道凿痕。][pg]");
         outputText("仔细观察后，你发现他的话所言非虚：刀刃上所有那些无数的划痕和瑕疵，都源于刀茎正上方，也就是铁匠试图装饰却失败的地方。然而，尽管有几道难看的深痕在离刀刃很近的地方停了下来，但没有一道真正破坏了那完美的弧线，仿佛这把刀唯一在乎的只有切割。[pg]");
         outputText("[say: 真是活见鬼了，] 他重复道，打断了你的思绪。[say: 每次刀刃滑落，它都会向我的手扭过来。就好像它是活的，渴望尝到血肉的滋味。说实话……我本来还在犹豫要不要把它交给契约组织，然后告诉你水晶不能用。但既然你来了，就拿着它走吧。] 他几乎没给你时间把刀插回鞘里，就用一只强有力的大手按住你的背，半推半就地把你赶到了街上。[pg]");
         get_inventory().takeItem(get_weapons().SCARBLD,finishTakingScarredBlade,inside);
      }
      
      public function forgeScarredBlade() : void
      {
         if(get_player().hasKeyItem("Sheila\'s Lethicite"))
         {
            forgeScarredBladeStart();
         }
         if(get_game().time.days - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2063) < 14)
         {
            forgeScarredBladeMiddle();
         }
         if(get_game().time.days - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2063) >= 14)
         {
            forgeScarredBladeEnd();
         }
      }
      
      public function finishTakingScarredBlade() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2063,-1);
         inside();
      }
      
      override public function confirmBuy(param1:ItemType = undefined, param2:int = -1, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         clearOutput();
         outputText("粗犷的金属加工哈士奇对你微微点了点头，把武器猛地砸在他的摊位边缘。他咕哝着，[say: 一共是 " + param1.get_value() + " 颗宝石。]");
         super.confirmBuy(param1);
      }
   }
}

