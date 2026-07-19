package classes.scenes.explore
{
   import classes.BaseContent;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Measurements;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Lumi extends BaseContent
   {
      
      public function Lumi()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function machineChange(param1:int, param2:int, param3:Number) : void
      {
         var knotRemoved1:Boolean;
         var _g:Lumi;
         clearOutput();
         outputText("在你做出选择后，机器发出嗡嗡声并震动起来。你感觉到你的阴茎被快速地刺了一下。那一定是麻醉剂，因为之后你除了麻木什么也感觉不到。");
         outputText("[pg]你看着机器顶部的罐子清空，将内容物以非常精确的剂量注射到你鸡巴的特定部位。这真是地精工程学的奇迹！");
         var _loc4_:Boolean = false;
         switch(param1)
         {
            case 0:
               get_player().increaseCock(param2,param3);
               break;
            case 1:
               get_player().cocks[param2].thickenCock(param3,true);
               break;
            case 2:
               var _temp_1:* = get_player().cocks[param2];
               _temp_1.knotMultiplier = _temp_1.knotMultiplier + param3;
               if(get_player().cocks[param2].knotMultiplier <= 1)
               {
                  get_player().cocks[param2].knotMultiplier = 1;
                  _loc4_ = true;
               }
         }
         menu();
         _g = this;
         knotRemoved1 = _loc4_;
         addNextButton("继续",function():void
         {
            _g.lumiMachineFinal(knotRemoved1);
         });
      }
      
      public function lumiShop() : void
      {
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         outputText("你问露米能不能看看她的药水。她对你笑了笑，从桌子上拿出几个瓶子展示给你看。");
         outputText("[pg][say: 品质保证，这可是露米亲手制作的哟，]她骄傲地说道。[pg]");
         outputText("催情剂 - 15 宝石\n地精麦酒 - 20 宝石\n产卵灵药 - 45 宝石\n");
         menu();
         if(get_player().get_gems() >= 15)
         {
            addButton(0,get_consumables().L_DRAFT.get_shortName(),lumiLustDraftPitch).hint(get_consumables().L_DRAFT.get_description());
         }
         else
         {
            addButtonDisabled(0,get_consumables().L_DRAFT.get_shortName());
         }
         if(get_player().get_gems() >= 20)
         {
            addButton(1,get_consumables().GOB_ALE.get_shortName(),lumiPitchGobboAle).hint(get_consumables().GOB_ALE.get_description());
         }
         else
         {
            addButtonDisabled(1,get_consumables().GOB_ALE.get_shortName());
         }
         if(get_player().get_gems() >= 45)
         {
            addButton(2,get_consumables().OVIELIX.get_shortName(),lumiPitchOviElixer).hint(get_consumables().OVIELIX.get_description());
         }
         else
         {
            addButtonDisabled(2,get_consumables().OVIELIX.get_shortName());
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2729) > 0 && get_player().get_gems() >= 500 && get_player().hasItem(get_consumables().LOLIPOP,5))
         {
            addButton(3,"利德尔药水",buyLiddellium).hint("支付500宝石将5根棒棒糖转化为利德尔药水");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2729) > 0)
         {
            addButtonDisabled(3,"利德尔药水","花费500宝石将5根棒棒糖转化为利德尔药水");
         }
         addButton(14,"返回",lumiLabChoices);
      }
      
      public function lumiPurchase(param1:ItemType, param2:int) : void
      {
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         outputText("你付给露米宝石，她把" + Utils.cnName(param1.get_longName()) + "递给你，说道：[say: 给你！][pg]");
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - param2);
         statScreenRefresh();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1 && param1 is Consumable)
         {
            param1.useItem();
            doNext(lumiLabChoices);
         }
         else
         {
            get_inventory().takeItem(param1,lumiShop);
         }
      }
      
      public function lumiPitchOviElixer() : void
      {
         var cost:int;
         var itype:ItemType;
         var _g:Lumi;
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         get_images().showImage("item-oElixir");
         outputText("你指着那个奇怪的六边形瓶子。[say: 催卵药剂？是根据巨蜂给它们蜂后的特殊物质做哒。它能让生蛋蛋变得更快，如果你在没怀宝宝的时候喝，它会让你以后生出一些蛋来。喝得越多，蛋蛋就越多越大。露米每剂收45颗宝石。][pg]");
         outputText("你要购买产卵灵药吗？");
         menu();
         _g = this;
         itype = get_consumables().OVIELIX;
         cost = 45;
         addButton(0,"是",function():void
         {
            _g.lumiPurchase(itype,cost);
         });
         addButton(1,"否",lumiShop);
      }
      
      public function lumiPitchGobboAle() : void
      {
         var cost:int;
         var itype:ItemType;
         var _g:Lumi;
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         get_images().showImage("item-gAle");
         outputText("你指着那个酒壶。[say: 哦？哦，那是露米的……其实不是，那是卖20颗宝石的微醺饮料。如果你想变得像露米一样，你会喜欢的。你喜欢吗？][pg]");
         outputText("你要买地精麦酒吗？");
         menu();
         _g = this;
         itype = get_consumables().GOB_ALE;
         cost = 20;
         addButton(0,"是",function():void
         {
            _g.lumiPurchase(itype,cost);
         });
         addButton(1,"否",lumiShop);
      }
      
      public function lumiMachineFinal(param1:Boolean = false) : void
      {
         var _loc2_:* = null as Player;
         clearOutput();
         outputText("机器关闭了，它已经对你的[cock]进行了变态的改造。你取下它，随着麻醉剂失效，你注意到" + (param1 ? "你的肉结消失了！而且，" : "") + "你变得敏感多了。看来里面的某些化学物质并非完全出于实用目的。");
         dynStats(DynStat.Lust(15),DynStat.Sens(2));
         if(!get_player().hasPerk(PerkLib.HistoryAlchemist))
         {
            outputText("[pg]在离开店铺后屋前，你把宝石交给了露米。");
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 15);
         }
         doNext(lumiLabChoices);
      }
      
      public function lumiMachine4(param1:Boolean, param2:int, param3:int) : void
      {
         var cockIndex27:int;
         var enlarge1:Boolean;
         var _g26:Lumi;
         var amount25:Number;
         var cockIndex26:int;
         var type26:int;
         var _g25:Lumi;
         var amount24:Number;
         var cockIndex25:int;
         var type25:int;
         var _g24:Lumi;
         var amount23:Number;
         var cockIndex24:int;
         var type24:int;
         var _g23:Lumi;
         var amount22:Number;
         var cockIndex23:int;
         var type23:int;
         var _g22:Lumi;
         var amount21:Number;
         var cockIndex22:int;
         var type22:int;
         var _g21:Lumi;
         var amount20:Number;
         var cockIndex21:int;
         var type21:int;
         var _g20:Lumi;
         var amount19:Number;
         var cockIndex20:int;
         var type20:int;
         var _g19:Lumi;
         var amount18:Number;
         var cockIndex19:int;
         var type19:int;
         var _g18:Lumi;
         var amount17:Number;
         var cockIndex18:int;
         var type18:int;
         var _g17:Lumi;
         var amount16:Number;
         var cockIndex17:int;
         var type17:int;
         var _g16:Lumi;
         var amount15:Number;
         var cockIndex16:int;
         var type16:int;
         var _g15:Lumi;
         var amount14:Number;
         var cockIndex15:int;
         var type15:int;
         var _g14:Lumi;
         var amount13:Number;
         var cockIndex14:int;
         var type14:int;
         var _g13:Lumi;
         var amount12:Number;
         var cockIndex13:int;
         var type13:int;
         var _g12:Lumi;
         var amount11:Number;
         var cockIndex12:int;
         var type12:int;
         var _g11:Lumi;
         var amount10:Number;
         var cockIndex11:int;
         var type11:int;
         var _g10:Lumi;
         var amount9:Number;
         var cockIndex10:int;
         var type10:int;
         var _g9:Lumi;
         var amount8:Number;
         var cockIndex9:int;
         var type9:int;
         var _g8:Lumi;
         var amount7:Number;
         var cockIndex8:int;
         var type8:int;
         var _g7:Lumi;
         var amount6:Number;
         var cockIndex7:int;
         var type7:int;
         var _g6:Lumi;
         var amount5:Number;
         var cockIndex6:int;
         var type6:int;
         var _g5:Lumi;
         var amount4:Number;
         var cockIndex5:int;
         var type5:int;
         var _g4:Lumi;
         var amount3:Number;
         var cockIndex4:int;
         var type4:int;
         var _g3:Lumi;
         var amount2:Number;
         var cockIndex3:int;
         var type3:int;
         var _g2:Lumi;
         var amount1:Number;
         var cockIndex2:int;
         var type2:int;
         var _g1:Lumi;
         var amount:Number;
         var cockIndex1:int;
         var type1:int;
         var _g:Lumi;
         clearOutput();
         menu();
         outputText("你按下了符合你选择的按钮。在它下面有一个旋钮，指示你想改变你阴茎的程度。");
         switch(param3)
         {
            case 0:
               if(param1)
               {
                  _g = this;
                  type1 = param3;
                  cockIndex1 = param2;
                  amount = 1;
                  addButton(0,"1英寸",function():void
                  {
                     _g.machineChange(type1,cockIndex1,amount);
                  }).hint("让你的阴茎增长一英寸。");
                  _g1 = this;
                  type2 = param3;
                  cockIndex2 = param2;
                  amount1 = 2;
                  addButton(1,"2英寸",function():void
                  {
                     _g1.machineChange(type2,cockIndex2,amount1);
                  }).hint("让你的阴茎增长两英寸。");
                  _g2 = this;
                  type3 = param3;
                  cockIndex3 = param2;
                  amount2 = 3;
                  addButton(2,"3英寸",function():void
                  {
                     _g2.machineChange(type3,cockIndex3,amount2);
                  }).hint("使你的肉棒变长三英寸。");
                  _g3 = this;
                  type4 = param3;
                  cockIndex4 = param2;
                  amount3 = 4;
                  addButton(3,"4英寸",function():void
                  {
                     _g3.machineChange(type4,cockIndex4,amount3);
                  }).hint("使你的肉棒变长四英寸。");
               }
               else
               {
                  if(get_player().cocks[param2].cockLength >= 2)
                  {
                     _g4 = this;
                     type5 = param3;
                     cockIndex5 = param2;
                     amount4 = -1;
                     addButton(0,"1英寸",function():void
                     {
                        _g4.machineChange(type5,cockIndex5,amount4);
                     }).hint("将你的阴茎长度缩短一英寸。");
                  }
                  else
                  {
                     addButtonDisabled(0,"1\"","你无法再缩短你的阴茎长度。");
                  }
                  if(get_player().cocks[param2].cockLength >= 3)
                  {
                     _g5 = this;
                     type6 = param3;
                     cockIndex6 = param2;
                     amount5 = -2;
                     addButton(1,"2英寸",function():void
                     {
                        _g5.machineChange(type6,cockIndex6,amount5);
                     }).hint("使你的肉棒缩短两英寸。");
                  }
                  else
                  {
                     addButtonDisabled(1,"2\"","你的阴茎已经无法再缩短了。");
                  }
                  if(get_player().cocks[param2].cockLength >= 4)
                  {
                     _g6 = this;
                     type7 = param3;
                     cockIndex7 = param2;
                     amount6 = -3;
                     addButton(2,"3英寸",function():void
                     {
                        _g6.machineChange(type7,cockIndex7,amount6);
                     }).hint("使你的肉棒缩短三英寸。");
                  }
                  else
                  {
                     addButtonDisabled(2,"3\"","你不能再缩短你的肉棒了。");
                  }
                  if(get_player().cocks[param2].cockLength >= 5)
                  {
                     _g7 = this;
                     type8 = param3;
                     cockIndex8 = param2;
                     amount7 = -4;
                     addButton(3,"4英寸",function():void
                     {
                        _g7.machineChange(type8,cockIndex8,amount7);
                     }).hint("将你的鸡巴长度缩短4英寸。");
                  }
                  else
                  {
                     addButtonDisabled(3,"4\"","你无法再进一步缩短你的阴茎长度。");
                  }
               }
               break;
            case 1:
               if(param1)
               {
                  if(get_player().cocks[param2].cockLength >= 2 * (get_player().cocks[param2].cockThickness + 0.5))
                  {
                     _g8 = this;
                     type9 = param3;
                     cockIndex9 = param2;
                     amount8 = 0.5;
                     addButton(0,"0.5英寸",function():void
                     {
                        _g8.machineChange(type9,cockIndex9,amount8);
                     }).hint("将你的鸡巴宽度增加0.5英寸。");
                  }
                  else
                  {
                     addButtonDisabled(0,"0.5\"","你无法继续增加你阴茎的宽度了。");
                  }
                  if(get_player().cocks[param2].cockLength >= 2 * (get_player().cocks[param2].cockThickness + 1))
                  {
                     _g9 = this;
                     type10 = param3;
                     cockIndex10 = param2;
                     amount9 = 1;
                     addButton(1,"1英寸",function():void
                     {
                        _g9.machineChange(type10,cockIndex10,amount9);
                     }).hint("将你的鸡巴宽度增加1英寸。");
                  }
                  else
                  {
                     addButtonDisabled(1,"1\"","你无法再增加阴茎的宽度了。");
                  }
                  if(get_player().cocks[param2].cockLength >= 2 * (get_player().cocks[param2].cockThickness + 1.5))
                  {
                     _g10 = this;
                     type11 = param3;
                     cockIndex11 = param2;
                     amount10 = 1.5;
                     addButton(2,"1.5英寸",function():void
                     {
                        _g10.machineChange(type11,cockIndex11,amount10);
                     }).hint("将你的阴茎宽度增加1.5英寸。");
                  }
                  else
                  {
                     addButtonDisabled(2,"1.5\"","你不能再增加鸡巴的宽度了。");
                  }
                  if(get_player().cocks[param2].cockLength >= 2 * (get_player().cocks[param2].cockThickness + 1.5))
                  {
                     _g11 = this;
                     type12 = param3;
                     cockIndex12 = param2;
                     amount11 = 2;
                     addButton(3,"2英寸",function():void
                     {
                        _g11.machineChange(type12,cockIndex12,amount11);
                     }).hint("将你的鸡巴宽度增加2英寸。");
                  }
                  else
                  {
                     addButtonDisabled(3,"2\"","你无法再增加阴茎的宽度了。");
                  }
               }
               else
               {
                  if(get_player().cocks[param2].cockThickness >= 1.5)
                  {
                     _g12 = this;
                     type13 = param3;
                     cockIndex13 = param2;
                     amount12 = -0.5;
                     addButton(0,"0.5英寸",function():void
                     {
                        _g12.machineChange(type13,cockIndex13,amount12);
                     }).hint("将你的肉棒粗度减小半英寸。");
                  }
                  else
                  {
                     addButtonDisabled(0,"0.5\"","你不能再减小肉棒的粗度了。");
                  }
                  if(get_player().cocks[param2].cockThickness >= 2)
                  {
                     _g13 = this;
                     type14 = param3;
                     cockIndex14 = param2;
                     amount13 = -1;
                     addButton(1,"1英寸",function():void
                     {
                        _g13.machineChange(type14,cockIndex14,amount13);
                     }).hint("将你的肉棒粗度减小一英寸。");
                  }
                  else
                  {
                     addButtonDisabled(1,"1\"","你的鸡巴宽度无法再减小了。");
                  }
                  if(get_player().cocks[param2].cockThickness >= 2.5)
                  {
                     _g14 = this;
                     type15 = param3;
                     cockIndex15 = param2;
                     amount14 = -1.5;
                     addButton(2,"1.5英寸",function():void
                     {
                        _g14.machineChange(type15,cockIndex15,amount14);
                     }).hint("将你的肉棒粗度减小一英寸半。");
                  }
                  else
                  {
                     addButtonDisabled(2,"1.5\"","你无法再减少你鸡巴的宽度了。");
                  }
                  if(get_player().cocks[param2].cockThickness >= 3)
                  {
                     _g15 = this;
                     type16 = param3;
                     cockIndex16 = param2;
                     amount15 = -2;
                     addButton(3,"2英寸",function():void
                     {
                        _g15.machineChange(type16,cockIndex16,amount15);
                     }).hint("将你的肉棒粗度减小两英寸。");
                  }
                  else
                  {
                     addButtonDisabled(3,"2\"","你无法再减少你阴茎的宽度了。");
                  }
               }
               break;
            case 2:
               if(param1)
               {
                  if(get_player().cocks[param2].knotMultiplier <= 3.9)
                  {
                     _g16 = this;
                     type17 = param3;
                     cockIndex17 = param2;
                     amount16 = 0.1;
                     addButton(0,"0.1英寸",function():void
                     {
                        _g16.machineChange(type17,cockIndex17,amount16);
                     }).hint("将你的阴茎肉结增大十分之一英寸。");
                  }
                  else
                  {
                     addButtonDisabled(0,"0.1\"","你无法继续增大阴茎的肉结了。");
                  }
                  if(get_player().cocks[param2].knotMultiplier <= 3.8)
                  {
                     _g17 = this;
                     type18 = param3;
                     cockIndex18 = param2;
                     amount17 = 0.2;
                     addButton(1,"0.2英寸",function():void
                     {
                        _g17.machineChange(type18,cockIndex18,amount17);
                     }).hint("让你的肉结增大0.2英寸。");
                  }
                  else
                  {
                     addButtonDisabled(1,"0.2\"","你无法再增大你鸡巴上的肉结了。");
                  }
                  if(get_player().cocks[param2].knotMultiplier <= 3.7)
                  {
                     _g18 = this;
                     type19 = param3;
                     cockIndex19 = param2;
                     amount18 = 0.3;
                     addButton(2,"0.3英寸",function():void
                     {
                        _g18.machineChange(type19,cockIndex19,amount18);
                     }).hint("将你鸡巴的肉结增加十分之三英寸。");
                  }
                  else
                  {
                     addButtonDisabled(2,"0.3\"","你不能再增大你阴茎的肉结了。");
                  }
                  if(get_player().cocks[param2].knotMultiplier <= 3.6)
                  {
                     _g19 = this;
                     type20 = param3;
                     cockIndex20 = param2;
                     amount19 = 0.4;
                     addButton(3,"0.4英寸",function():void
                     {
                        _g19.machineChange(type20,cockIndex20,amount19);
                     }).hint("让你的肉结增大0.4英寸。");
                  }
                  else
                  {
                     addButtonDisabled(3,"0.4\"","你不能再增大你阴茎上的肉结了。");
                  }
                  if(get_player().cocks[param2].knotMultiplier <= 3.5)
                  {
                     _g20 = this;
                     type21 = param3;
                     cockIndex21 = param2;
                     amount20 = 0.5;
                     addButton(4,"0.5英寸",function():void
                     {
                        _g20.machineChange(type21,cockIndex21,amount20);
                     }).hint("让你的肉结增大0.5英寸。");
                  }
                  else
                  {
                     addButtonDisabled(0,"0.5\"","你无法再增大肉结了。");
                  }
                  break;
               }
               _g21 = this;
               type22 = param3;
               cockIndex22 = param2;
               amount21 = -0.1;
               addButton(0,"0.1英寸",function():void
               {
                  _g21.machineChange(type22,cockIndex22,amount21);
               }).hint(get_player().cocks[param2].knotMultiplier > 1.1 ? "将你的肉结减少十分之一英寸。" : "这会让你的肉结从肉棒上消失。");
               _g22 = this;
               type23 = param3;
               cockIndex23 = param2;
               amount22 = -0.2;
               addButton(1,"0.2英寸",function():void
               {
                  _g22.machineChange(type23,cockIndex23,amount22);
               }).hint(get_player().cocks[param2].knotMultiplier > 1.2 ? "将你的阴茎肉结缩小十分之二英寸。" : "这将会移除你阴茎上的肉结。");
               _g23 = this;
               type24 = param3;
               cockIndex24 = param2;
               amount23 = -0.3;
               addButton(2,"0.3英寸",function():void
               {
                  _g23.machineChange(type24,cockIndex24,amount23);
               }).hint(get_player().cocks[param2].knotMultiplier > 1.3 ? "将你鸡巴上的肉结缩短十分之三英寸。" : "这会将你鸡巴上的肉结消除。");
               _g24 = this;
               type25 = param3;
               cockIndex25 = param2;
               amount24 = -0.4;
               addButton(3,"0.4英寸",function():void
               {
                  _g24.machineChange(type25,cockIndex25,amount24);
               }).hint(get_player().cocks[param2].knotMultiplier > 1.4 ? "让你的肉结减小0.4英寸。" : "这会移除你阴茎上的肉结。");
               _g25 = this;
               type26 = param3;
               cockIndex26 = param2;
               amount25 = -0.5;
               addButton(4,"0.5英寸",function():void
               {
                  _g25.machineChange(type26,cockIndex26,amount25);
               }).hint(get_player().cocks[param2].knotMultiplier > 1.5 ? "将你阴茎上的肉结减小半英寸。" : "这将移除你阴茎上的肉结。");
         }
         _g26 = this;
         enlarge1 = param1;
         cockIndex27 = param2;
         addButton(10,"更改选择",function():void
         {
            _g26.lumiMachine3(enlarge1,cockIndex27);
         }).hint("选择其他改造。");
      }
      
      public function lumiMachine3(param1:Boolean, param2:int) : void
      {
         var returned:Boolean;
         var enlarge6:Boolean;
         var _g5:Lumi;
         var type4:int;
         var cockIndex5:int;
         var enlarge5:Boolean;
         var _g4:Lumi;
         var type3:int;
         var cockIndex4:int;
         var enlarge4:Boolean;
         var _g3:Lumi;
         var type2:int;
         var cockIndex3:int;
         var enlarge3:Boolean;
         var _g2:Lumi;
         var type1:int;
         var cockIndex2:int;
         var enlarge2:Boolean;
         var _g1:Lumi;
         var type:int;
         var cockIndex1:int;
         var enlarge1:Boolean;
         var _g:Lumi;
         clearOutput();
         menu();
         outputText("你将肉棒插入那个带衬垫的槽口，没一会儿就顶到了某个弹簧限位装置");
         if(get_player().cocks[param2].cockThickness >= 6)
         {
            outputText("由于它惊人的粗度，你费了点劲才塞进去");
         }
         outputText("。");
         outputText("[pg]尽管这台设备看起来很粗糙，但感觉还挺舒服的。当你推动弹簧时，设备上的几个仪表数值开始上升，测量着你阴茎的尺寸。");
         outputText("[pg]<b>长度：</b>" + Measurements.inchesOrCentimetres(get_player().cocks[param2].cockLength) + "\n<b>宽度：</b>" + Measurements.inchesOrCentimetres(get_player().cocks[param2].cockThickness) + "\n<b>肉结：</b>" + (get_player().cocks[param2].knotMultiplier > 1 ? "是，其宽度为" + Math.ceil(get_player().cocks[param2].knotMultiplier * get_player().cocks[param2].cockThickness) : "否"));
         outputText("[pg]你面前有几个按钮和刻度盘，用来选择你想要进行的改造。");
         if(!param1 && get_player().cocks[param2].cockLength <= 2)
         {
            addButtonDisabled(0,"长度","你不能再缩短你的阴茎了。");
         }
         else
         {
            _g = this;
            enlarge1 = param1;
            cockIndex1 = param2;
            type = 0;
            addButton(0,"长度",function():void
            {
               _g.lumiMachine4(enlarge1,cockIndex1,type);
            }).hint((param1 ? "增长" : "缩短") + "你阴茎的长度。");
         }
         if(param1)
         {
            if(get_player().cocks[param2].cockLength >= 2 * get_player().cocks[param2].cockThickness)
            {
               _g1 = this;
               enlarge2 = param1;
               cockIndex2 = param2;
               type1 = 1;
               addButton(1,"宽度",function():void
               {
                  _g1.lumiMachine4(enlarge2,cockIndex2,type1);
               }).hint("增加你鸡巴的宽度。");
            }
            else
            {
               addButtonDisabled(1,"宽度","如果不先增加长度，你的阴茎就无法变得更粗。");
            }
            if(get_player().cocks[param2].knotMultiplier > 1)
            {
               if(get_player().cocks[param2].knotMultiplier <= 3.9)
               {
                  _g2 = this;
                  enlarge3 = param1;
                  cockIndex3 = param2;
                  type2 = 2;
                  addButton(2,"肉结",function():void
                  {
                     _g2.lumiMachine4(enlarge3,cockIndex3,type2);
                  }).hint("增大你的肉结。");
               }
               else
               {
                  addButtonDisabled(2,"肉结","你无法再增大肉结了。");
               }
            }
         }
         else
         {
            if(get_player().cocks[param2].cockThickness <= 1.5)
            {
               addButtonDisabled(1,"粗细","你无法再减少你鸡巴的粗细了。");
            }
            else
            {
               _g3 = this;
               enlarge4 = param1;
               cockIndex4 = param2;
               type3 = 1;
               addButton(1,"宽度",function():void
               {
                  _g3.lumiMachine4(enlarge4,cockIndex4,type3);
               }).hint("减少你肉棒的宽度。");
            }
            if(get_player().cocks[param2].knotMultiplier > 1)
            {
               _g4 = this;
               enlarge5 = param1;
               cockIndex5 = param2;
               type4 = 2;
               addButton(2,"肉结",function():void
               {
                  _g4.lumiMachine4(enlarge5,cockIndex5,type4);
               }).hint("缩小你的肉结。");
            }
         }
         _g5 = this;
         enlarge6 = param1;
         returned = true;
         addButton(14,"返回",function():void
         {
            _g5.lumiMachine2(enlarge6,returned);
         }).hint("选择另一根肉棒进行替换。");
      }
      
      public function lumiMachine2(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         menu();
         if(!param2)
         {
            if(param1)
            {
               get_player().destroyItems(get_consumables().GROPLUS,1);
            }
            else
            {
               get_player().destroyItems(get_consumables().REDUCTO,1);
            }
         }
         outputText("你将注射器插入插槽并完全推到底。液体流经外部的一些管道，然后与其他一些化学物质混合，停留在机器顶部的一个小缸里。带软垫的插槽伴随着快速的气动嘶嘶声打开了，欢迎你插入任何你决定放入的器官。");
         var _loc3_:int = 0;
         while(_loc3_ < int(get_player().cocks.length))
         {
            addButton(_loc3_,"鸡巴编号" + (_loc3_ + 1),(function(param1:Array, param2:Array, param3:Array):Function
            {
               var _g:Array = param1;
               var cockIndex:Array = param2;
               var enlarge:Array = param3;
               return function():void
               {
                  _g[0].lumiMachine3(Boolean(enlarge[0]),int(cockIndex[0]));
               };
            })([this],[_loc3_],[param1])).hint("插入你的" + get_player().cockDescript(_loc3_) + "。");
            _loc3_++;
         }
         addButton(14,"离开",lumiLabChoices).hint("别碰这个机器。");
      }
      
      public function lumiMachine() : void
      {
         var enlarge1:Boolean;
         var _g1:Lumi;
         var enlarge:Boolean;
         var _g:Lumi;
         clearOutput();
         menu();
         outputText("你走近机器。带衬垫的插入槽是关闭的。在侧面，有一个圆形的插槽，上面有一块牌子，写着\"插入缩水药水或生长药水+\"。下面的一行小字向你保证<b>插入后无法取回物品。</b>");
         if(get_player().hasItem(get_consumables().GROPLUS))
         {
            _g = this;
            enlarge = true;
            addButton(0,"Gro+",function():void
            {
               _g.lumiMachine2(enlarge);
            }).hint("插入一个 Gro+。");
         }
         else
         {
            addButtonDisabled(0,"Gro+","你没有Gro+可插入。");
         }
         if(get_player().hasItem(get_consumables().REDUCTO))
         {
            _g1 = this;
            enlarge1 = false;
            addButton(1,"缩形膏",function():void
            {
               _g1.lumiMachine2(enlarge1);
            }).hint("插入一个缩形膏。");
         }
         else
         {
            addButtonDisabled(1,"缩形膏","你没有可以插入的缩形膏。");
         }
         addButton(14,"返回",lumiLabChoices).hint("别动那台机器。");
      }
      
      public function lumiLustDraftPitch() : void
      {
         var cost:int;
         var itype:ItemType;
         var _g:Lumi;
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         get_images().showImage("item-draft-lust");
         outputText("你指着那瓶装满泡泡糖粉色液体的瓶子。");
         outputText("[pg][say: 催情药水？一直都很受欢迎，有了它，你永远不用担心没准备好做爱；这是我最早的作品之一。每瓶15颗宝石。][pg]");
         outputText("你要买催情药水吗？");
         menu();
         _g = this;
         itype = get_consumables().L_DRAFT;
         cost = 15;
         addButton(0,"是",function():void
         {
            _g.lumiPurchase(itype,cost);
         });
         addButton(1,"否",lumiShop);
      }
      
      public function lumiLabChoices() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,53) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,53,FlagDict_Impl_.arrayReadInt(_loc1_,53) + 1);
            get_images().showImage("encounter-lumi");
            outputText("你推开门，小心翼翼地检查里面是否有试图伏击你的敌人。这个房间似乎是某种炼金实验室，墙边摆满了装有各种仪器的架子，房间一侧有一张书桌，对面则是一张长桌，上面摆满了正在进行中的炼金实验，许多实验散发着浓烟，还有些瓶子里装着冒泡的液体。一个穿着围裙、戴着某种头带的地精正坐在一张带轮子的高脚凳上；除了围裙她一丝不挂，似乎正在同时观察至少3个实验。她突然转过身，直直地看向你的方向。由于深色护目镜遮住了她的眼睛，很难判断，但你相当确定她正在看着你。几秒钟后，她用浓重的口齿不清的声音大喊：[say: 顾——客！]她看起来毫无威胁，于是你走了进去，而她则摆弄着她的实验，减少了冒泡的烟雾。她从凳子上跳下来，扯下围裙，蹦蹦跳跳地来到书桌前，爬了上去。[pg]");
            outputText("她大约3英尺高，有着黄绿色的皮肤，橙色的头发扎成一条长长的马尾辫，一直垂到膝盖。她的乳房大约是B罩杯，普通的乳头被染成了橙色。她所有的指甲也都涂成了橙色以相配。她似乎永远停不下来，虽然她的大部分脸看起来很可爱，但戴着那副厚厚的护目镜实在很难确定。她护目镜上纯黑色的镜片让她看起来相当令人不安，扼杀了她的身形可能激发你的任何吸引力。[pg]");
            outputText("[say: 嗦以，露米，地精验金术士，炒鸡腻害的，今颠能为你做点啥？] 这个古怪的地精问道。[pg]");
            outputText("你解释说有点难听懂她的话。她向你吐了吐舌头，展示了舌头中间一颗非常大的舌钉，立刻解释了她口齿不清的原因。你没有继续追问，而是问她能为你做些什么。她拉开书桌顶部的一个舱口，拿出一瓶不知什么东西摇了摇，[say: 露米可以以好价钱卖给你一些她精心制作的药水，或者，如果你已经有一些好药水或试剂，露米可以让它们变得更好。但这要花很多钱。如果你是追随者之一，也许露米可以和你做个特别交易；但老板不想让我和外人玩。你要什么？][pg]");
            outputText("你还注意到后面有一台看起来相当复杂的机器。它有一个带衬垫的孔，用于插入阴茎，几个不同形状的表盘，一个隐藏内部结构的钢盖，以及一排装满未知液体的玻璃管。露米注意到了你的好奇心。[say: 这是我们刚买的新机器！只要你有一些缩特沃或格罗普斯，你就可以用它定制你的鸡巴或鸡巴们！当然，前提是你得付钱。]");
            if(get_player().hasPerk(PerkLib.HistoryAlchemist))
            {
               outputText("[pg]你惊奇地走近那台机器。你向这位地精炼金术士抛出了一连串关于机器功能的问题，询问它如何正确平衡试剂和催化剂，从而对其对象进行精确的改变。地精显然对看到一个如此精通炼金术的人感到惊讶。[say: 你懂很多炼金术！你知道吗？你可以免费使用这台机器！只要经常回来，我们就可以聊聊这门手艺。我会很喜欢的！]");
            }
         }
         else
         {
            get_images().showImage("encounter-lumi-repeat");
            outputText("你再次踏入露米的实验室。她仍在进行她的实验。还没等你开口叫她，她就已经转过身来看着你了。眨眼间，她的围裙掉在地上，她站在桌子上，问道：[say: 那么，今天非凡的炼金术士露米能为你做些什么呢？]");
         }
         menu();
         addButton(0,"商店",lumiShop);
         addButton(1,"强化",lumiEnhance);
         setExitButton();
         if((get_player().get_gems() >= 15 || get_player().hasPerk(PerkLib.HistoryAlchemist)) && get_player().hasCock())
         {
            addButton(3,"机器",lumiMachine).hint("试试这台机器。");
         }
         else if(get_player().get_gems() < 15)
         {
            addButtonDisabled(3,"机器","你无法支付使用机器的费用。");
         }
         else if(!get_player().hasCock())
         {
            addButtonDisabled(3,"机器","你没有可以塑形的鸡巴。");
         }
         if(get_player().hasItem(get_consumables().LIDDELL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) >= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2729) == 0)
         {
            addButton(4,"奇怪的药水",idLiddellium);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2729) == 0)
         {
            addButton(4,"利德尔药水",askLiddellium).hint("露米能卖给你利德尔药水吗？");
         }
      }
      
      public function lumiEnhanceGo(param1:ItemType) : void
      {
         spriteSelect(SpriteDb.get_s_lumi());
         if(get_player().get_gems() < 100)
         {
            outputText("[say:你有100颗宝石用来强化吗？]露米问道。[pg]你摇了摇头，露米露出失望的表情，说道：[say:那露米就不能给你强化啦。还有其他啥事没？][pg]");
            doNext(lumiLabChoices);
            return;
         }
         var _loc2_:ItemType = ItemType.NOTHING;
         if(param1 == get_consumables().LABOVA_)
         {
            _loc2_ = get_consumables().PROBOVA;
         }
         else if(param1 == get_consumables().KANGAFT)
         {
            _loc2_ = get_consumables().MGHTYVG;
         }
         else if(param1 == get_consumables().SDELITE)
         {
            _loc2_ = get_consumables().S_DREAM;
         }
         else if(param1 == get_consumables().OVIELIX)
         {
            _loc2_ = get_consumables().OVI_MAX;
         }
         else if(param1 == get_consumables().L_DRAFT)
         {
            _loc2_ = get_consumables().F_DRAFT;
         }
         else if(param1 == get_consumables().GLDSEED)
         {
            _loc2_ = get_consumables().MAGSEED;
         }
         else if(param1 == get_consumables().FOXBERY)
         {
            _loc2_ = get_consumables().VIXVIGR;
         }
         else if(param1 == get_consumables().FOXJEWL)
         {
            _loc2_ = get_consumables().MYSTJWL;
         }
         else if(param1 == get_consumables().PIGTRUF)
         {
            _loc2_ = get_consumables().BOARTRU;
         }
         else if(param1 == get_consumables().PURHONY)
         {
            _loc2_ = get_consumables().SPHONEY;
         }
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - 100);
         statScreenRefresh();
         get_player().consumeItem(param1);
         clearOutput();
         outputText("露米一把从你手中抓过物品，冲到她的工作台前，只停了一秒匆匆系上围裙。");
         var _loc4_:int = Utils.rand(3);
         if(param1 == get_consumables().GLDSEED)
         {
            outputText("她摆弄着它，在上面涂满奇异的粉末，然后把这堆乱七八糟的东西全扔到加热板上。它爆炸了，把地精炸得一屁股摔在地上。她猛地坐直身子，戴着手套的手一把抓起那颗现在正发着光的种子。[pg]");
         }
         else if(param1 == get_consumables().FOXJEWL)
         {
            outputText("露米睁大眼睛，凝视着它深邃的内部。她保持着这个姿势好一会儿，直到你清了清嗓子，她才赶紧跑去干活。她在散落着各种烧杯和试管的工作室里飞快地来回穿梭，看似随意地混合着化学试剂，其中许多试剂剧烈地冒泡或爆炸。[pg]这样过了几分钟后，她把所有的试剂倒进一个放在明火上的大烧杯里。里面的东西沸腾着涌上烧瓶颈，然后顺着冷凝管慢慢滴下。一滴沉甸甸的黑色液体在冷凝管尖端聚集，摇摇欲坠地晃动了一会儿，最后“啪”地一声滴落在宝石上。[pg]宝石像海绵一样吸收了黑色的液体，令人作呕的紫色脉络像蜘蛛网一样在表面蔓延开来。片刻之后，宝石完全变成了紫色，里面神秘的火焰闪烁着明亮的紫光。[pg]你犹豫地伸出手，将这颗经过神秘强化的泪滴状宝石放进你的[inv]中。[pg]");
         }
         else if(param1 == get_consumables().KANGAFT)
         {
            outputText("她摆弄着它，在上面涂满奇异的粉末，然后把这堆乱七八糟的东西全扔到加热板上。它爆炸了，把地精炸得一屁股摔在地上。她猛地坐直身子，戴着手套的手一把抓起那个现在正发着光的水果。[pg]");
         }
         else if(_loc4_ == 0)
         {
            outputText("她随手从桌边抓起各种东西，似乎毫不在意地添加到" + Utils.cnName(param1.get_longName()) + "里。让你心惊的是，那玩意儿很快就冒出了大团浓烟！烟雾气味浓烈，呛得人喘不过气来。露米从抽屉里抓过一副面罩戴上，面不改色地继续忙活。她突然停了下来，你正想着她是不是搞定了，她却摘下面罩，对着烟雾深深一吸，接着一头栽倒！你赶紧过去想扶她，她却猛地站起身，挥手驱散了一些烟雾，说道，[say: 完活儿！][pg]");
         }
         else if(_loc4_ == 1)
         {
            outputText("她拿起一个放在托盘旁边的瓶子，似乎思考了片刻，然后把瓶子扔向房间的一个角落。瓶子在桌子后面碎裂，空气中升起一小股烟雾。你对那个瓶子感到有些紧张，但还没等你有机会开口，又有两个瓶子飞了过去；这次引发了一场小爆炸。你问她把这些东西扔到一边是在想什么，她只是回答，[say: 它们挡我的路了。][pg][say: 什么？！所以你就把会爆炸的东西随便扔到一边？][pg][say: 别担心，我今天结束的时候会在那里放中和剂的。而且我从来不扔会造成破坏的东西。搞定啦！][pg]");
         }
         else if(_loc4_ == 2)
         {
            outputText("她在托盘里加了几样东西，然后顺着桌子往下走。她往一个冒着泡的化学反应里加了一些试剂，接着又加了些别的原料。你很纳闷她为什么把" + Utils.cnName(param1.get_longName()) + "丢在那儿不管，跑去弄别的东西。然后露米又走回桌子另一边，路过" + Utils.cnName(param1.get_longName()) + "，开始往另一个东西里加料。还没等你抱怨，她又回到了" + Utils.cnName(param1.get_longName()) + "旁边继续操作。你决定最好还是别过问她的工作方式，随她去吧；毕竟她比你有经验。[pg]砰！你惊讶地看过去，她弄的第一个东西发生了小爆炸。啪！现在第二个实验也炸了！你惊慌地动了动，怀疑露米到底知不知道自己在干嘛；就在这时，" + Utils.cnName(param1.get_longName()) + "似乎发出一声震耳欲聋的轰鸣爆炸了。露米停下动作，直勾勾地看着前方，然后说道，[say: 介个炸得好，露米搞定啦！][pg]");
         }
         get_inventory().takeItem(_loc2_,lumiEnhance,lumiLabChoices);
      }
      
      public function lumiEnhance() : void
      {
         var itype9:ItemType;
         var _g9:Lumi;
         var itype8:ItemType;
         var _g8:Lumi;
         var itype7:ItemType;
         var _g7:Lumi;
         var itype6:ItemType;
         var _g6:Lumi;
         var itype5:ItemType;
         var _g5:Lumi;
         var itype4:ItemType;
         var _g4:Lumi;
         var itype3:ItemType;
         var _g3:Lumi;
         var itype2:ItemType;
         var _g2:Lumi;
         var itype1:ItemType;
         var _g1:Lumi;
         var itype:ItemType;
         var _g:Lumi;
         var _loc1_:* = null as String;
         spriteSelect(SpriteDb.get_s_lumi());
         clearOutput();
         outputText("[say: 好耶！露米最喜欢做强化啦，你想让哪里变得更棒棒呀？]");
         menu();
         if(get_player().hasItem(get_consumables().FOXBERY))
         {
            _loc1_ = Utils.cnName(get_consumables().FOXBERY.get_shortName());
            _g = this;
            itype = get_consumables().FOXBERY;
            addNextButton(_loc1_,function():void
            {
               _g.lumiEnhanceGo(itype);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().FOXBERY.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().FOXJEWL))
         {
            _loc1_ = Utils.cnName(get_consumables().FOXJEWL.get_shortName());
            _g1 = this;
            itype1 = get_consumables().FOXJEWL;
            addNextButton(_loc1_,function():void
            {
               _g1.lumiEnhanceGo(itype1);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().FOXJEWL.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().GLDSEED))
         {
            _loc1_ = Utils.cnName(get_consumables().GLDSEED.get_shortName());
            _g2 = this;
            itype2 = get_consumables().GLDSEED;
            addNextButton(_loc1_,function():void
            {
               _g2.lumiEnhanceGo(itype2);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().GLDSEED.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().KANGAFT))
         {
            _loc1_ = Utils.cnName(get_consumables().KANGAFT.get_shortName());
            _g3 = this;
            itype3 = get_consumables().KANGAFT;
            addNextButton(_loc1_,function():void
            {
               _g3.lumiEnhanceGo(itype3);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().KANGAFT.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().L_DRAFT))
         {
            _loc1_ = Utils.cnName(get_consumables().L_DRAFT.get_shortName());
            _g4 = this;
            itype4 = get_consumables().L_DRAFT;
            addNextButton(_loc1_,function():void
            {
               _g4.lumiEnhanceGo(itype4);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().L_DRAFT.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().LABOVA_))
         {
            _loc1_ = Utils.cnName(get_consumables().LABOVA_.get_shortName());
            _g5 = this;
            itype5 = get_consumables().LABOVA_;
            addNextButton(_loc1_,function():void
            {
               _g5.lumiEnhanceGo(itype5);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().LABOVA_.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().OVIELIX))
         {
            _loc1_ = Utils.cnName(get_consumables().OVIELIX.get_shortName());
            _g6 = this;
            itype6 = get_consumables().OVIELIX;
            addNextButton(_loc1_,function():void
            {
               _g6.lumiEnhanceGo(itype6);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().OVIELIX.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().SDELITE))
         {
            _loc1_ = Utils.cnName(get_consumables().SDELITE.get_shortName());
            _g7 = this;
            itype7 = get_consumables().SDELITE;
            addNextButton(_loc1_,function():void
            {
               _g7.lumiEnhanceGo(itype7);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().SDELITE.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().PIGTRUF))
         {
            _loc1_ = Utils.cnName(get_consumables().PIGTRUF.get_shortName());
            _g8 = this;
            itype8 = get_consumables().PIGTRUF;
            addNextButton(_loc1_,function():void
            {
               _g8.lumiEnhanceGo(itype8);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().PIGTRUF.get_shortName()));
         }
         if(get_player().hasItem(get_consumables().PURHONY))
         {
            _loc1_ = Utils.cnName(get_consumables().PURHONY.get_shortName());
            _g9 = this;
            itype9 = get_consumables().PURHONY;
            addNextButton(_loc1_,function():void
            {
               _g9.lumiEnhanceGo(itype9);
            });
         }
         else
         {
            addNextButtonDisabled(Utils.cnName(get_consumables().PURHONY.get_shortName()));
         }
         addButton(14,"返回",lumiLabChoices);
      }
      
      public function lumiEncounter() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,53) == 0)
         {
            get_images().showImage("event-lumi");
            outputText("你在荒芜的荒原中发现了一个异常；一扇似乎矗立在荒郊野外的门。不知怎么的，你觉得它一定通向世界的某个其他地方，而它在这里的唯一原因是你现在无法到达那扇门应该在的地方。[pg]");
            outputText("你要打开它吗？");
            doYesNo(lumiLabChoices,get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你再次看到那扇矗立在荒郊野外的门，你猜它会把你带回露米的实验室。门很容易就推开了……");
            doNext(lumiLabChoices);
         }
      }
      
      public function inchesOrCentimetres(param1:Number) : String
      {
         return Measurements.inchesOrCentimetres(param1);
      }
      
      public function idLiddellium() : void
      {
         clearOutput();
         outputText("你把那个古怪的小瓶放在桌上，说你在找一位炼金术士来鉴定一下。");
         outputText("[pg]露米拿起瓶子，读着标签。[say: 喝我，哈？不想自己弄清楚吗？][pg]不，那看起来有点太天真了。你完全不知道它有什么作用，只知道一个恶魔营地里有这东西。露米点点头，摆弄着药水，没有看你。[say: 好吧，让我们看看能做些什么。][pg]她回到她的炼金用品前，把一些药水倒进烧杯里，干劲十足地开始工作。从你站的地方几乎看不到什么，但她显然动作很快，完成了很多工作。尽管这显然是一种未知的液体，但她似乎对如何处理它有明确的计划。然而，当你看到火花四溅时，还是有点令人担忧。好吧，她才是炼金术士……[pg]在又一阵爆裂声和叮当声之后，地精把瓶子放回桌子上。[say: 毫无疑问，这就是我听过那么多次的、被神遗弃的利德尔药水！][pg]利德尔药水有什么用？[pg][say: 这可是些恶心的东西，小伙子。能让人失去她们的奶子！让臀部变窄！扼杀性感！这是老露米听说过的最糟糕的毒药！任何地精最糟糕的噩梦。][pg]看起来确实如此。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? " 毫无疑问，这就是制造爱丽丝的原因。" : "") + " 这可能会非常有用。你感谢了露米，把瓶子放回你的[inv]里。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2727,-1);
         doNext(lumiLabChoices);
      }
      
      public function buyLiddellium() : void
      {
         clearOutput();
         outputText("你把棒棒糖和宝石递给露米，要求一瓶利德尔药水。眨眼间，地精收下报酬开始工作。她把糖果从棍子上拔下来，把所有五个闪亮的红色圆球放进烧杯里。各种各样的成分紧随其后，整个混合物被放在燃烧器上，同时她转向其他任务。各种其他的混合物和它们严苛的炼金过程展开了，有些相当令人费解。");
         outputText("[pg]几分钟后，在燃烧器上晃荡的红宝石色液体被取下，与她准备好的其余材料混合在一起，然后将整个混合物装瓶。露米把利德尔药水放在了桌子上。");
         outputText("[pg][say: 现在别太早用，不然可能会爆炸。谢谢惠顾！]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         get_player().destroyItems(get_consumables().LOLIPOP,5);
         get_inventory().takeItem(get_consumables().LIDDELL,lumiShop);
      }
      
      public function askLiddellium() : void
      {
         clearOutput();
         outputText("[say: 绝对不行！这东西太危险了，不能再让它流落到世界上了。]露米严厉地说道。[pg]这很危险，你对此毫不怀疑，但想想看。你是个好顾客，而且你在对抗恶魔。这对她来说是一笔生意，而且这些药水可以用来挫挫那些讨厌的魅魔的锐气，让她们变得远不如像露米这样的地精丰满性感。这对地精来说将是极好的；你打击了她们的敌人，减少了她们的竞争。[pg]露米思考着你的论点。[say: 嗯……你这么说的话，我想你也有道理。不过这可不好做！配方是秘密，而且我的天赋也有限。我需要某种类似的试剂来提取效果。][pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2696) > 0 ? "也许是棒棒糖？虽然你并不完全确定它们从何而来，但它们似乎具有比利德尔药水轻得多的效果。[pg]露米点点头，[say: 好吧，给我带一把那种棒棒糖，还有一大堆宝石。]" : ""));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2729,1);
         doNext(lumiLabChoices);
      }
   }
}

