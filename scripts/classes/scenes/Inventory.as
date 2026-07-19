package classes.scenes
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.KeyItem;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.GameViewData;
   import classes.display.ScreenType;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Useable;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.Cabin;
   import coc.view.Block;
   import coc.view.ButtonData;
   import coc.view.CoCButton;
   import coc.view.CoCScrollPane;
   import coc.view.DragButton;
   import coc.view.FlowDirection;
   import coc.view.LayoutConfig;
   import coc.view.LayoutType;
   import coc.view.MainView;
   import coc.view.Theme;
   import flash.Boot;
   import flash.text.TextField;
   import haxe.IMap;
   import haxe.ds.ObjectMap;
   
   public class Inventory extends BaseContent
   {
      
      public static var STORAGE_JEWELRY_BOX:String = "Equipment Storage - Jewelry Box";
      
      public var weaponRack:StorageArea;
      
      public var usedItem:Boolean;
      
      public var stashTexts:Array;
      
      public var shieldRack:StorageArea;
      
      public var scrollPane:CoCScrollPane;
      
      public var jewelryBox:StorageArea;
      
      public var itemStorage:Array;
      
      public var inventorySlotName:Array;
      
      public var invenPane:Block;
      
      public var gearStorage:Array;
      
      public var dresserBox:StorageArea;
      
      public var debugDupe:Boolean;
      
      public var currentItemSlot:ItemSlot;
      
      public var callOnAbandon:Function;
      
      public var callNext:Function;
      
      public var armorRack:StorageArea;
      
      public function Inventory()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         stashTexts = [];
         debugDupe = false;
         shieldRack = new StorageArea(36,45,Inventory.shieldAcceptable);
         dresserBox = new StorageArea(27,36,Inventory.undergarmentAcceptable);
         jewelryBox = new StorageArea(18,27,Inventory.jewelryAcceptable);
         armorRack = new StorageArea(9,18,Inventory.armorAcceptable);
         weaponRack = new StorageArea(0,9,Inventory.weaponAcceptable);
         usedItem = false;
         inventorySlotName = ["第一","第二","第三","第四","第五","第六","第七","第八","第九","第十"];
         super();
         itemStorage = [];
         gearStorage = [];
      }
      
      public static function allAcceptable(param1:ItemType) : Boolean
      {
         return true;
      }
      
      public static function armorAcceptable(param1:ItemType) : Boolean
      {
         return param1 is Armor;
      }
      
      public static function weaponAcceptable(param1:ItemType) : Boolean
      {
         return param1 is Weapon;
      }
      
      public static function shieldAcceptable(param1:ItemType) : Boolean
      {
         return param1 is Shield;
      }
      
      public static function jewelryAcceptable(param1:ItemType) : Boolean
      {
         return param1 is Jewelry;
      }
      
      public static function undergarmentAcceptable(param1:ItemType) : Boolean
      {
         return param1 is Undergarment;
      }
      
      public function weaponRackDescription() : Boolean
      {
         return describeContents(gearStorage,weaponRack);
      }
      
      public function useItemNow(param1:Useable, param2:ItemSlot = undefined) : void
      {
         clearOutput();
         if(param1.canUse())
         {
            useItem(param1,param2);
         }
         else
         {
            takeItemFull(param1,false,param2);
         }
      }
      
      public function useItemInInventory(param1:int) : void
      {
         DragButton.cleanUp();
         clearOutput();
         var _loc2_:ItemType = get_player().itemSlots[param1].itype;
         if(!(_loc2_ is Useable))
         {
            outputText("你不能使用" + Utils.cnName(_loc2_.get_longName()) + "！[pg]");
            itemGoNext();
            return;
         }
         var _loc3_:Useable = _loc2_;
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977))
         {
            case 1:
               deleteItemPrompt(_loc3_,param1);
               break;
            case 2:
               deleteItemsPrompt(_loc3_,param1);
               break;
            default:
               if(_loc3_.canUse())
               {
                  get_player().itemSlots[param1].removeOneItem();
                  useItem(_loc3_,get_player().itemSlots[param1]);
               }
               else
               {
                  itemGoNext();
               }
         }
      }
      
      public function useItem(param1:Useable, param2:ItemSlot) : void
      {
         var _loc3_:* = null as Undergarment;
         param1.useText();
         param1.host = get_player();
         param1.onUse();
         if(param1 is Armor)
         {
            get_player().get_armor().removeText();
            param1 = get_player().setArmor(param1);
         }
         else if(param1 is Weapon)
         {
            get_player().get_weapon().removeText();
            param1 = get_player().setWeapon(param1);
         }
         else if(param1 is Jewelry)
         {
            get_player().get_jewelry().removeText();
            param1 = get_player().setJewelry(param1);
         }
         else if(param1 is Shield)
         {
            get_player().get_shield().removeText();
            param1 = get_player().setShield(param1);
         }
         else
         {
            if(!(param1 is Undergarment))
            {
               currentItemSlot = param2;
               if(!param1.useItem())
               {
                  itemGoNext();
               }
               return;
            }
            _loc3_ = param1;
            if(_loc3_.get_type() == 0)
            {
               get_player().get_upperGarment().removeText();
            }
            else
            {
               get_player().get_lowerGarment().removeText();
            }
            param1 = get_player().setUndergarment(_loc3_,int(_loc3_.get_type()));
         }
         if(param1 == null)
         {
            itemGoNext();
         }
         else
         {
            takeItem(param1,callNext);
         }
      }
      
      public function unlockSlots(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = getMaxSlots();
         }
         var _loc2_:int = Utils.boundInt(3,param1,10);
         var _loc3_:Array = get_player().itemSlots;
         _loc3_[0].set_unlocked(_loc2_ > 0);
         _loc3_[1].set_unlocked(_loc2_ > 1);
         _loc3_[2].set_unlocked(_loc2_ > 2);
         _loc3_[3].set_unlocked(_loc2_ > 3);
         _loc3_[4].set_unlocked(_loc2_ > 4);
         _loc3_[5].set_unlocked(_loc2_ > 5);
         _loc3_[6].set_unlocked(_loc2_ > 6);
         _loc3_[7].set_unlocked(_loc2_ > 7);
         _loc3_[8].set_unlocked(_loc2_ > 8);
         _loc3_[9].set_unlocked(_loc2_ > 9);
      }
      
      public function unequipWeapon() : void
      {
         var _loc1_:ItemSlot = new ItemSlot();
         _loc1_.set_quantity(-1);
         takeItem(get_player().setUnarmed(),inventoryMenu,null,_loc1_);
      }
      
      public function unequipUpperwear() : void
      {
         if(get_player().get_upperGarment() != get_undergarments().SEA_SHIRT)
         {
            takeItem(get_player().setUndergarment(UndergarmentLib.NOTHING,0),inventoryMenu);
         }
         else
         {
            get_player().get_upperGarment().removeText();
            if(get_undergarments().SEA_SHIRT.isNormalShirt())
            {
               takeItem(get_player().setUndergarment(UndergarmentLib.NOTHING,0),inventoryMenu);
            }
            doNext(manageEquipment);
         }
      }
      
      public function unequipShield() : void
      {
         takeItem(get_player().setShield(ShieldLib.NOTHING),inventoryMenu);
      }
      
      public function unequipLowerwear() : void
      {
         takeItem(get_player().setUndergarment(UndergarmentLib.NOTHING,1),inventoryMenu);
      }
      
      public function unequipJewel() : void
      {
         takeItem(get_player().setJewelry(JewelryLib.NOTHING),inventoryMenu);
      }
      
      public function unequipArmor() : void
      {
         if(get_player().get_armorName() != "goo armor" && get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
         {
            takeItem(get_player().setArmor(ArmorLib.NOTHING),inventoryMenu);
         }
         else
         {
            get_player().get_armor().removeText();
            if(get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
            {
               get_player().setArmor(ArmorLib.NOTHING);
            }
            doNext(manageEquipment);
         }
      }
      
      public function toggleMoveAll() : void
      {
         set_moveAll(!get_moveAll());
         stash();
      }
      
      public function takeItems(param1:Array, param2:Function, param3:Object = undefined, param4:Boolean = true) : void
      {
         var display1:Boolean;
         var overrideAbandon1:Object;
         var nextAction1:Function;
         var itemArray1:Array;
         var _g:Inventory;
         var _loc5_:ItemType = param1.shift();
         if(int(param1.length) == 0)
         {
            takeItem(_loc5_,param2,param3,null,param4);
         }
         else
         {
            _g = this;
            itemArray1 = param1;
            nextAction1 = param2;
            overrideAbandon1 = param3;
            display1 = param4;
            takeItemNoNext(_loc5_,function():void
            {
               _g.takeItems(itemArray1,nextAction1,overrideAbandon1,display1);
            },null,null,param4);
         }
      }
      
      public function takeItemNoNext(param1:ItemType, param2:Function, param3:Object = undefined, param4:ItemSlot = undefined, param5:Boolean = true) : void
      {
         if(param2 == null)
         {
            param2 = playerMenu;
         }
         innerTakeItem(param2,param1,param2,param3,param4,param5);
      }
      
      public function takeItemMenuless(param1:ItemType, param2:Function, param3:Object = undefined, param4:ItemSlot = undefined, param5:Boolean = true) : void
      {
         innerTakeItem(get_output().flush,param1,param2,param3,param4,param5);
      }
      
      public function takeItemFull(param1:ItemType, param2:Boolean, param3:ItemSlot) : void
      {
         var source1:ItemSlot;
         var item1:Useable;
         var _g1:Inventory;
         var showNext:Boolean;
         var item:Useable;
         var _g:Inventory;
         var _loc5_:int = 0;
         outputText("[pg]你的[inv]里没有空间放" + Utils.cnName(param1.get_longName()) + "了。你可以丢弃它，或者扔掉别的东西来腾出空间。");
         menu();
         var _loc4_:int = 0;
         while(_loc4_ < 10)
         {
            _loc5_ = _loc4_++;
            if(get_player().itemSlots[_loc5_].unlocked)
            {
               addButton(_loc5_,get_player().itemSlots[_loc5_].get_invLabel(),(function(param1:Array, param2:Array, param3:Array, param4:Array):Function
               {
                  var _g:Array = param1;
                  var source:Array = param2;
                  var slotNum:Array = param3;
                  var itype:Array = param4;
                  return function():void
                  {
                     _g[0].replaceItem(itype[0],int(slotNum[0]),source[0]);
                  };
               })([this],[param3],[_loc5_],[param1])).hint(get_player().itemSlots[_loc5_].get_tooltipText(),get_player().itemSlots[_loc5_].get_tooltipHeader());
            }
         }
         if(param3 != null && param3.quantity >= 0)
         {
            currentItemSlot = param3;
            _g = this;
            item = param1;
            showNext = false;
            addButton(12,"放回",function():void
            {
               _g.returnItemToInventory(item,showNext);
            });
         }
         var _loc6_:Useable = param1 as Useable;
         if(param2 && _loc6_ != null && !_loc6_.invUseOnly)
         {
            _g1 = this;
            item1 = _loc6_;
            source1 = param3;
            addButton(13,"立即使用",function():void
            {
               _g1.useItemNow(item1,source1);
            });
         }
         addButton(14,"丢弃",callOnAbandon);
      }
      
      public function takeItem(param1:ItemType, param2:Function, param3:Object = undefined, param4:ItemSlot = undefined, param5:Boolean = true) : void
      {
         innerTakeItem(itemGoNext,param1,param2,param3,param4,param5);
      }
      
      public function stashItem(param1:int, param2:Array) : void
      {
         var _gthis:Inventory;
         var _loc7_:* = null;
         _gthis = this;
         var _loc3_:ItemType = get_player().itemSlots[param1].itype;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = param2;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(Boolean(_loc7_.available) && Boolean(_loc7_.area.acceptable(_loc3_)))
            {
               _loc4_.push(_loc7_);
            }
         }
         _loc6_ = _loc4_;
         _loc5_ = 0;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(placeIn(gearStorage,_loc7_.area.start,_loc7_.area.end,param1,stash,true))
            {
               return;
            }
         }
         if(!placeIn(itemStorage,get_campStorage().start,get_campStorage().end,param1,stash,true))
         {
            close(function():void
            {
               _gthis.outputText("你没有空间存放那个物品了。");
               _gthis.doNext(_gthis.stash);
            });
         }
      }
      
      public function stash() : void
      {
         var next3:Function;
         var _g3:Inventory;
         var next2:Function;
         var _g2:Inventory;
         var next1:Function;
         var _g1:Inventory;
         var next:Function;
         var _g:Inventory;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null as ItemSlot;
         var _loc7_:* = null as Function;
         var _loc8_:* = null as CoCButton;
         stashTexts = [];
         callNext = stash;
         setup();
         var _loc1_:Array = [{
            "area":weaponRack,
            "available":get_player().hasKeyItem("Equipment Rack - Weapons")
         },{
            "area":armorRack,
            "available":get_player().hasKeyItem("Equipment Rack - Armor")
         },{
            "area":shieldRack,
            "available":get_player().hasKeyItem("Equipment Rack - Shields")
         },{
            "area":dresserBox,
            "available":get_cabin().get_hasDresser()
         },{
            "area":jewelryBox,
            "available":get_player().hasKeyItem("Equipment Storage - Jewelry Box")
         }];
         var _loc2_:Block = showStorage(stash,itemStorage,get_campStorage(),chestDescription());
         var _loc3_:int = 0;
         while(_loc3_ < int(_loc1_.length))
         {
            _loc4_ = _loc1_[_loc3_];
            _loc3_++;
            if(Boolean(_loc4_.available))
            {
               if(_loc2_ != null)
               {
                  _loc5_ = int(_loc2_.get_height() + 3);
                  _loc2_.graphics.lineStyle(2);
                  _loc2_.graphics.moveTo(0,_loc5_);
                  _loc2_.graphics.lineTo(_loc2_.get_width(),_loc5_);
               }
               _loc2_ = showStorage(stash,gearStorage,_loc4_.area,describe(_loc4_.area));
            }
         }
         invenPane.doLayout();
         _loc3_ = 0;
         while(_loc3_ < 10)
         {
            _loc5_ = _loc3_++;
            _loc6_ = get_player().itemSlots[_loc5_];
            if(_loc6_.unlocked)
            {
               _loc7_ = (function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var next:Array = param2;
                  return function():void
                  {
                     _g[0].close(next[0]);
                  };
               })([this],[(function(param1:Array, param2:Array, param3:Array):Function
               {
                  var _g:Array = param1;
                  var storage:Array = param2;
                  var position:Array = param3;
                  return function():void
                  {
                     _g[0].stashItem(int(position[0]),storage[0]);
                  };
               })([this],[_loc1_],[_loc5_])]);
               if(_loc6_.quantity > 0)
               {
                  _loc8_ = addButton(_loc5_,_loc6_.get_invLabel(),_loc7_).hint(_loc6_.get_tooltipText(),_loc6_.get_tooltipHeader());
               }
               else
               {
                  _loc8_ = addButtonDisabled(_loc5_,"无");
                  _loc8_.callback = _loc7_;
               }
               new DragButton(get_player().itemSlots,_loc5_,_loc8_,Inventory.allAcceptable,"无");
            }
         }
         _g = this;
         next = toggleMoveAll;
         addButton(10,"全部移动:" + (get_moveAll() ? "开" : "关"),function():void
         {
            _g.close(next);
         }).hint(get_moveAll() ? "你当前将尝试一次性移动整叠物品。点击切换为一次移动一个物品。" : "你当前将一次移动一个物品。点击切换为移动整叠物品。");
         if(get_debug())
         {
            _g1 = this;
            next1 = dupeToggle;
            addButton(11,"复制:" + (get_debugDupe() ? "开" : "关"),function():void
            {
               _g1.close(next1);
            }).hint("[b:调试模式][pg-]如果启用，你取出的物品将不会从储存中移除，而是会被复制到你的物品栏中。");
            _g2 = this;
            next2 = debugWand;
            addButton(12,"调试魔杖",function():void
            {
               _g2.close(next2);
            }).hint("拿起一根调试魔杖。");
         }
         _g3 = this;
         next3 = playerMenu;
         addButton(14,"返回",function():void
         {
            _g3.close(next3);
         });
         get_mainView().setMainFocus(scrollPane,false,true);
         scrollPane.draw();
         scrollPane.update();
         GameViewData.screenType = ScreenType.StashView;
         GameViewData.stashData = stashTexts;
         get_output().flush();
      }
      
      public function showStorage(param1:Function, param2:Array, param3:StorageArea, param4:String) : Block
      {
         var _loc10_:* = null as CoCButton;
         var _loc11_:* = null as String;
         var _loc12_:int = 0;
         var _loc13_:* = null as Object;
         var _loc14_:* = null as String;
         var _loc5_:Array = [];
         var _loc6_:Block = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Row),null,null,null,null,null,null,null),0,0,get_mainView().mainText.width,0,"");
         var _loc7_:TextField = new TextField();
         _loc7_.width = get_mainView().mainText.width * 0.4 - 5;
         _loc7_.defaultTextFormat = get_mainView().mainText.defaultTextFormat;
         _loc7_.multiline = true;
         _loc7_.wordWrap = true;
         _loc7_.htmlText = param4;
         var _loc8_:Block = new Block(new LayoutConfig(LayoutType.Grid(1,3),null,null,null,null,null,null,2),0,0,get_mainView().mainText.width * 0.6,0,"");
         Theme.current.buttonReset();
         var _loc9_:int = param3.start;
         while(_loc9_ < param3.end)
         {
            if(param2[_loc9_].quantity == 0)
            {
               _loc10_ = new CoCButton("空",(function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var next:Array = param2;
                  return function():void
                  {
                     _g[0].close(next[0]);
                  };
               })([this],[(function(param1:Array, param2:Array, param3:Array):Function
               {
                  var _g:Array = param1;
                  var slotNum:Array = param2;
                  var storage:Array = param3;
                  return function():void
                  {
                     _g[0].pickFrom(storage[0],int(slotNum[0]));
                  };
               })([this],[_loc9_],[param2])]),"","",Theme.current.nextButton(),false,false,true,0,0,0);
            }
            else
            {
               _loc11_ = Utils.cnName(param2[_loc9_].itype.get_shortName());
               _loc12_ = Theme.current.nextButton();
               _loc13_ = (function(param1:Array, param2:Array):Function
               {
                  var _g:Array = param1;
                  var next:Array = param2;
                  return function():void
                  {
                     _g[0].close(next[0]);
                  };
               })([this],[(function(param1:Array, param2:Array, param3:Array):Function
               {
                  var _g:Array = param1;
                  var slotNum:Array = param2;
                  var storage:Array = param3;
                  return function():void
                  {
                     _g[0].pickFrom(storage[0],int(slotNum[0]));
                  };
               })([this],[_loc9_],[param2])]);
               _loc14_ = Utils.cnName(Utils.titleCase(param2[_loc9_].itype.get_headerName()));
               _loc10_ = new CoCButton(_loc11_,_loc13_,param2[_loc9_].itype.get_description(),_loc14_,_loc12_,false,true,true,0,0,0);
               _loc10_.setCount(param2[_loc9_].itype,param2[_loc9_].quantity);
            }
            get_mainView().hookButton(_loc10_);
            _loc8_.addElement(_loc10_);
            new DragButton(param2,_loc9_,_loc10_,param3.acceptable,"空");
            _loc5_.push(_loc10_.buttonData());
            _loc9_++;
         }
         _loc8_.doLayout();
         _loc7_.height = _loc8_.get_height();
         _loc7_.autoSize = "left";
         _loc6_.addElement(_loc7_);
         _loc6_.addElement(_loc8_);
         _loc6_.doLayout();
         invenPane.addElement(_loc6_);
         stashTexts.push({
            "description":param4,
            "buttons":_loc5_
         });
         return _loc6_;
      }
      
      public function shieldRackDescription() : Boolean
      {
         return describeContents(gearStorage,shieldRack);
      }
      
      public function setup() : void
      {
         hideMenus();
         clearOutput();
         spriteSelect(null);
         hideUpDown();
         clearOutput();
         menu();
         get_mainView().mainText.visible = false;
         get_mainView().scrollBar.visible = false;
         get_mainView().resetTextFormat();
         if(scrollPane == null)
         {
            scrollPane = new CoCScrollPane();
         }
         var _loc1_:TextField = get_mainView().mainText;
         scrollPane.set_x(_loc1_.x);
         scrollPane.set_y(_loc1_.y);
         scrollPane.set_width(_loc1_.width + get_mainView().scrollBar.get_width());
         scrollPane.set_height(_loc1_.height);
         scrollPane.visible = true;
         if(invenPane != null)
         {
            invenPane.removeElements();
         }
         else
         {
            invenPane = new Block(new LayoutConfig(LayoutType.Flow(FlowDirection.Column),null,null,null,null,null,null,null));
         }
         invenPane.visible = true;
         scrollPane.addChild(invenPane);
         DragButton.setup(get_mainView(),get_mainView().toolTipView);
      }
      
      public function set_moveAll(param1:Boolean) : Boolean
      {
         get_camp().saveContent.storageMoveAll = param1;
         return param1;
      }
      
      public function returnItemToInventory(param1:Useable, param2:Boolean = true) : void
      {
         var _loc3_:* = null as ItemSlot;
         if(currentItemSlot == null)
         {
            takeItem(param1,callNext,callNext,null);
         }
         else if(currentItemSlot.quantity > 0)
         {
            _loc3_ = currentItemSlot;
            _loc3_.set_quantity(_loc3_.quantity + 1);
         }
         else
         {
            currentItemSlot.setItemAndQty(param1,1);
         }
         if(get_game().get_inCombat())
         {
            inventoryCombatHandler();
            return;
         }
         if(param2)
         {
            doNext(callNext);
         }
         else
         {
            callNext();
         }
      }
      
      public function replaceItem(param1:ItemType, param2:int, param3:ItemSlot = undefined) : void
      {
         clearOutput();
         if(get_player().itemSlots[param2].itype == param1)
         {
            outputText("你从堆叠中丢弃了 " + Utils.cnName(param1.get_longName()) + "，为新的腾出空间。");
         }
         else
         {
            if(get_player().itemSlots[param2].quantity == 1)
            {
               outputText("你丢弃了" + Utils.cnName(get_player().itemSlots[param2].itype.get_longName()) + "并将其替换为" + Utils.cnName(param1.get_longName()) + "。");
            }
            else
            {
               outputText("你丢弃了" + Utils.cnName(get_player().itemSlots[param2].itype.get_longName()) + "(x" + get_player().itemSlots[param2].quantity + ")并将其替换为" + Utils.cnName(param1.get_longName()) + "。");
            }
            get_player().itemSlots[param2].setItemAndQty(param1,1);
            if(param3 != null)
            {
               get_player().itemSlots[param2].damage = param3.damage;
            }
         }
         itemGoNext();
      }
      
      public function placeIn(param1:Array, param2:int, param3:int, param4:int, param5:Function, param6:Boolean = false) : Boolean
      {
         var eventNo:Function;
         var _g:Inventory;
         var _loc13_:int = 0;
         var _loc14_:* = null as ItemSlot;
         var _loc15_:int = 0;
         var _loc16_:* = null as ItemSlot;
         var _loc17_:* = null as ItemSlot;
         clearOutput();
         var _loc7_:ItemType = get_player().itemSlots[param4].itype;
         var _loc8_:int = get_moveAll() ? get_player().itemSlots[param4].quantity : 1;
         var _loc9_:int = _loc8_;
         var _loc10_:int = _loc7_.getMaxStackSize();
         if(!param6)
         {
            _g = this;
            eventNo = param5;
            param5 = function():void
            {
               _g.doNext(eventNo);
            };
         }
         var _loc11_:int = param2;
         var _loc12_:int = param3;
         while(_loc11_ < _loc12_)
         {
            _loc13_ = _loc11_++;
            _loc14_ = param1[_loc13_];
            if(!(_loc14_.itype != _loc7_ || _loc14_.quantity >= _loc10_))
            {
               _loc15_ = _loc10_ - _loc14_.quantity;
               if(_loc15_ > _loc8_)
               {
                  _loc15_ = _loc8_;
               }
               outputText("[pg-]你将 " + _loc15_ + " 个 " + _loc7_.get_shortName() + " 放入了储物槽 " + Utils.num2Text(_loc13_ + 1 - param2) + "。");
               _loc14_.set_quantity(_loc14_.quantity + _loc15_);
               _loc8_ -= _loc15_;
               if(_loc8_ <= 0)
               {
                  _loc16_ = get_player().itemSlots[param4];
                  _loc16_.set_quantity(_loc16_.quantity - _loc9_);
                  param5();
                  return true;
               }
            }
         }
         _loc14_ = get_player().itemSlots[param4];
         _loc14_.set_quantity(_loc14_.quantity - (_loc9_ - _loc8_));
         _loc11_ = param2;
         _loc12_ = param3;
         while(_loc11_ < _loc12_)
         {
            _loc13_ = _loc11_++;
            _loc16_ = param1[_loc13_];
            if(_loc16_.quantity <= 0)
            {
               _loc16_.setItemAndQty(_loc7_,_loc8_);
               outputText("[pg-]你将 " + _loc8_ + " 个 " + _loc7_.get_shortName() + " 放入了储物槽 " + Utils.num2Text(_loc13_ + 1 - param2) + "。");
               _loc17_ = get_player().itemSlots[param4];
               _loc17_.set_quantity(_loc17_.quantity - _loc8_);
               param5();
               return true;
            }
         }
         param5();
         return false;
      }
      
      public function pickFrom(param1:Array, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as ItemSlot;
         var _loc6_:Boolean = false;
         var _loc3_:ItemType = param1[param2].itype;
         if(get_moveAll())
         {
            _loc4_ = param1[param2].quantity;
            while(_loc4_ > 0 && (get_player().roomInExistingStack(_loc3_) >= 0 || get_player().emptySlot() >= 0))
            {
               if(!get_debugDupe())
               {
                  _loc5_ = param1[param2];
                  _loc5_.set_quantity(_loc5_.quantity - 1);
               }
               _loc4_--;
               takeItem(_loc3_,callNext,callNext,param1[param2],false);
            }
            stash();
         }
         else
         {
            _loc6_ = get_player().roomInExistingStack(_loc3_) >= 0 || get_player().emptySlot() >= 0;
            if(!get_debugDupe())
            {
               _loc5_ = param1[param2];
               _loc5_.set_quantity(_loc5_.quantity - 1);
            }
            takeItem(_loc3_,callNext,callNext,param1[param2],false);
            if(_loc6_)
            {
               stash();
            }
         }
      }
      
      public function manageEquipment() : void
      {
         var _loc1_:Player = get_player();
         DragButton.cleanUp();
         clearOutput();
         outputText("你想卸下什么？[pg]");
         menu();
         addButton(0,"武器",unequipWeapon).hint(_loc1_.get_weapon().get_tooltipText(),_loc1_.get_weapon().get_tooltipHeader()).disableIf(_loc1_.get_weapon().isUnarmed());
         addButton(1,"盾牌",unequipShield).hint(_loc1_.get_shield().get_tooltipText(),_loc1_.get_shield().get_tooltipHeader()).disableIf(_loc1_.get_shield() == ShieldLib.NOTHING);
         addButton(2,"饰品",unequipJewel).hint(_loc1_.get_jewelry().get_tooltipText(),_loc1_.get_jewelry().get_tooltipHeader()).disableIf(_loc1_.get_jewelry() == JewelryLib.NOTHING);
         addButton(5,"护甲",unequipArmor).hint(_loc1_.get_armor().get_tooltipText(),_loc1_.get_armor().get_tooltipHeader()).disableIf(_loc1_.get_armor() == ArmorLib.NOTHING);
         addButton(6,"上装",unequipUpperwear).hint(_loc1_.get_upperGarment().get_tooltipText(),_loc1_.get_upperGarment().get_tooltipHeader()).disableIf(_loc1_.get_upperGarment() == UndergarmentLib.NOTHING);
         addButton(7,"下装",unequipLowerwear).hint(_loc1_.get_lowerGarment().get_tooltipText(),_loc1_.get_lowerGarment().get_tooltipHeader()).disableIf(_loc1_.get_lowerGarment() == UndergarmentLib.NOTHING);
         addButton(14,"返回",inventoryMenu);
      }
      
      public function jewelryBoxDescription() : Boolean
      {
         return describeContents(gearStorage,jewelryBox);
      }
      
      public function itemStorageSize() : int
      {
         return int(itemStorage.length);
      }
      
      public function itemGoNext() : void
      {
         if(callNext != null)
         {
            doNext(callNext);
         }
      }
      
      public function inventoryMenu() : void
      {
         var _g:Inventory;
         var _loc4_:* = null as KeyItem;
         var _loc5_:* = null as CoCButton;
         var _loc6_:int = 0;
         DragButton.setup(get_mainView(),get_mainView().toolTipView);
         var _loc1_:Boolean = false;
         if(get_game().get_inCombat())
         {
            callNext = inventoryCombatHandler;
         }
         else
         {
            spriteSelect(null);
            imageSelect(null);
            callNext = inventoryMenu;
         }
         hideMenus();
         hideUpDown();
         clearOutput();
         get_game().displayHeader("物品栏");
         outputText("<b><u>装备：</u></b>");
         outputText("[pg-]<b>武器：</b>" + Utils.cnName(get_player().get_weapon().get_name()) + "（攻击力：" + get_player().get_weaponAttack() + "）");
         outputText("[pg-]<b>盾牌：</b>" + Utils.cnName(get_player().get_shield().get_name()) + "（格挡值：" + get_player().get_shieldBlock() + "）");
         outputText("[pg-]<b>护甲：</b>" + (get_player().get_armor().get_id() == get_armors().VINARMR.get_id() ? "黑曜石藤蔓" : Utils.cnName(get_player().get_armor().get_name())) + "（防御力：" + get_player().get_armorDef() + "）");
         outputText("[pg-]<b>上身内衣：</b>" + Utils.cnName(get_player().get_upperGarment().get_name()) + "");
         outputText("[pg-]<b>下身内衣：</b>" + Utils.cnName(get_player().get_lowerGarment().get_name()) + "");
         outputText("[pg-]<b>饰品：</b>" + Utils.cnName(get_player().get_jewelryName()) + "");
         if(int(get_player().keyItems.length) > 0)
         {
            outputText("[pg]<b><u>关键物品：</u></b>");
         }
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().keyItems;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            outputText("[pg-]" + Utils.cnName(_loc4_.keyName));
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            outputText("[pg][bu: 木工物资：]");
            outputText("[pg-][b: 木材：] " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005));
            outputText("[pg-][b: 钉子：] " + get_player().keyItemv1("Carpenter\'s Toolbox"));
            outputText("[pg-][b: 石材：] " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2267));
         }
         menu();
         _loc2_ = 0;
         while(_loc2_ < 10)
         {
            _loc6_ = _loc2_++;
            if(get_player().itemSlots[_loc6_].unlocked)
            {
               if(get_player().itemSlots[_loc6_].quantity > 0)
               {
                  _loc5_ = addButton(_loc6_,get_player().itemSlots[_loc6_].get_invLabel(),(function(param1:Array, param2:Array):Function
                  {
                     var _g:Array = param1;
                     var slotNum:Array = param2;
                     return function():void
                     {
                        _g[0].useItemInInventory(int(slotNum[0]));
                     };
                  })([this],[_loc6_])).hint(get_player().itemSlots[_loc6_].get_tooltipText(),get_player().itemSlots[_loc6_].get_tooltipHeader());
                  _loc1_ = true;
               }
               else
               {
                  _loc5_ = addButtonDisabled(_loc6_,"无");
                  _loc5_.callback = (function(param1:Array, param2:Array):Function
                  {
                     var _g:Array = param1;
                     var slotNum:Array = param2;
                     return function():void
                     {
                        _g[0].useItemInInventory(int(slotNum[0]));
                     };
                  })([this],[_loc6_]);
               }
               new DragButton(get_player().itemSlots,_loc6_,_loc5_,Inventory.allAcceptable,"无");
            }
         }
         if(!get_game().get_inCombat())
         {
            addButton(10,"卸下",manageEquipment);
         }
         if(!get_game().get_inCombat() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977) == 1)
         {
            addButton(11,"删除物品：单个",deleteItems).hint("逐个丢弃你的物品。[pg]点击以丢弃一整叠。[pg-]双击停止。","删除物品 (单个)");
         }
         else if(!get_game().get_inCombat() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977) == 2)
         {
            addButton(11,"删除物品：全部",deleteItems).hint("丢弃一整叠物品。[pg]点击停止。[pg-]双击逐个丢弃物品。","删除物品 (整叠)");
         }
         else if(!get_game().get_inCombat() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977) == 0)
         {
            addButton(11,"删除物品：关",deleteItems).hint("开始丢弃你的物品。[pg]点击逐个丢弃物品。[pg-]双击丢弃一整叠物品。","删除物品 (关)");
         }
         if(!get_game().get_inCombat() && !get_inDungeon() && !get_inRoomedDungeon() && checkKeyItems(true))
         {
            _g = this;
            addButton(12,"关键物品",function():Boolean
            {
               return _g.checkKeyItems();
            });
            _loc1_ = true;
         }
         if(!_loc1_)
         {
            outputText("[pg-]你没有可用的物品。");
            if(!get_game().get_inCombat())
            {
               removeButton(11);
            }
            else
            {
               usedItem = false;
            }
            addButton(14,"返回",exitInventory);
            return;
         }
         if(get_game().get_inCombat() && get_player().hasStatusEffect(StatusEffects.Sealed) && get_player().statusEffectv1(StatusEffects.Sealed) == 3)
         {
            outputText("[pg-]你伸手去拿物品，但就是打不开你的小包。<b>你使用物品的能力被封印了，现在你白白浪费了一次攻击机会！</b>[pg]");
            inventoryCombatHandler();
            return;
         }
         outputText("[pg-]<b>容量：</b> " + getOccupiedSlots() + " / " + getMaxSlots());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977) > 0)
         {
            outputText("[pg-]你要丢弃哪个物品？");
         }
         addButton(14,"返回",exitInventory);
      }
      
      public function inventoryCombatHandler() : void
      {
         DragButton.cleanUp();
         if(get_player().hasPerk(PerkLib.QuickPockets) && !usedItem)
         {
            usedItem = true;
            get_combat().combatMenu(false);
            return;
         }
         if(!get_combat().combatRoundOver())
         {
            outputText("[pg]");
            get_combat().startMonsterTurn();
         }
      }
      
      public function innerTakeItem(param1:Function, param2:ItemType, param3:Function, param4:Object = undefined, param5:ItemSlot = undefined, param6:Boolean = true) : void
      {
         var _loc8_:* = null as ItemSlot;
         var _loc9_:int = 0;
         var _loc10_:* = null as String;
         if(param2 == null)
         {
            CoC_Settings.error("调用takeItem时传入了空的itemtype");
            return;
         }
         if(param2 == ItemType.NOTHING)
         {
            return;
         }
         callNext = param3 != null ? param3 : playerMenu;
         var _loc7_:int = get_player().roomInExistingStack(param2);
         if(_loc7_ >= 0)
         {
            _loc8_ = get_player().itemSlots[_loc7_];
            _loc9_ = _loc8_.set_quantity(_loc8_.quantity + 1);
            if(param6)
            {
               _loc10_ = Utils.cnName(param2.get_longName());
               outputText("[pg]你将" + _loc10_ + "放进你的" + inventorySlotName[_loc7_] + "个袋子里，现在你有" + _loc9_ + "个了。");
            }
            param1();
            return;
         }
         _loc7_ = get_player().emptySlot();
         if(_loc7_ >= 0)
         {
            get_player().itemSlots[_loc7_].setItemAndQty(param2,1);
            _loc9_ = param5 != null ? param5.damage : 0;
            get_player().itemSlots[_loc7_].damage = _loc9_;
            if(param6)
            {
               _loc10_ = Utils.cnName(param2.get_longName());
               outputText("[pg]你将" + _loc10_ + "放进你的" + inventorySlotName[_loc7_] + "个袋子里。");
            }
            param1();
            return;
         }
         callOnAbandon = param4 != null ? param4 : callNext;
         takeItemFull(param2,true,param5);
      }
      
      public function initializeGearStorage() : void
      {
         gearStorage.resize(0);
         while(int(gearStorage.length) < 45)
         {
            gearStorage.push(new ItemSlot());
         }
      }
      
      public function hasItemsInStorage() : Boolean
      {
         return getOccupiedSlots() > 0;
      }
      
      public function hasItemInStorage(param1:ItemType) : Boolean
      {
         var _loc4_:* = null as ItemSlot;
         var _loc2_:int = 0;
         var _loc3_:Array = itemStorage;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ != null && _loc4_.quantity > 0 && _loc4_.itype == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function giveHumanizer() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,28) > 0)
         {
            clearOutput();
            outputText("<b>我曾经是个作弊者，直到我的膝盖中了一箭……</b>");
            get_game().gameOver();
            return;
         }
         clearOutput();
         outputText("我不是骗子。但你是！<b>作弊者</b>！[pg]");
         get_inventory().takeItem(get_consumables().HUMMUS_,playerMenu);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,28,FlagDict_Impl_.arrayReadInt(_loc1_,28) + 1);
      }
      
      public function get_moveAll() : Boolean
      {
         if(get_camp().saveContent.storageMoveAll)
         {
            return get_camp().saveContent.storageMoveAll;
         }
         return false;
      }
      
      public function get_debugDupe() : Boolean
      {
         if(get_debug())
         {
            return debugDupe;
         }
         return false;
      }
      
      public function get_campStorage() : StorageArea
      {
         return new StorageArea(0,int(itemStorage.length),Inventory.allAcceptable);
      }
      
      public function getOccupiedSlots() : int
      {
         var _loc4_:* = null as ItemSlot;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:Array = get_player().itemSlots;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_.quantity > 0 && _loc4_.unlocked)
            {
               _loc1_.push(_loc4_);
            }
         }
         return int(_loc1_.length);
      }
      
      public function getMaxSlots() : int
      {
         var _loc1_:int = 3;
         if(get_player().hasPerk(PerkLib.StrongBack))
         {
            _loc1_++;
         }
         if(get_player().hasPerk(PerkLib.StrongBack2))
         {
            _loc1_++;
         }
         _loc1_ += int(get_player().keyItemv1("Backpack"));
         if(get_player().get_shield().get_id() == get_shields().CLKSHLD.get_id())
         {
            _loc1_ += 2;
         }
         return Utils.boundInt(3,_loc1_,10);
      }
      
      public function fixStorage() : int
      {
         var _loc1_:int = 4;
         if(get_player().hasKeyItem("Camp - Chest"))
         {
            _loc1_ += 6;
         }
         if(get_player().hasKeyItem("Camp - Murky Chest"))
         {
            _loc1_ += 4;
         }
         if(get_player().hasKeyItem("Camp - Ornate Chest"))
         {
            _loc1_ += 4;
         }
         if(int(itemStorage.length) > _loc1_)
         {
            itemStorage.resize(_loc1_);
         }
         else if(int(itemStorage.length) != _loc1_)
         {
            createStorage(_loc1_ - int(itemStorage.length));
         }
         return _loc1_;
      }
      
      public function exitInventory() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2977,0);
         DragButton.cleanUp();
         if(get_game().get_inCombat())
         {
            get_combat().combatMenu(false);
         }
         else
         {
            playerMenu();
         }
      }
      
      public function emptySlots() : void
      {
         var _loc3_:* = null as ItemSlot;
         var _loc1_:int = 0;
         var _loc2_:Array = get_player().itemSlots;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            _loc3_.emptySlot();
         }
      }
      
      public function dupeToggle() : void
      {
         debugDupe = !get_debugDupe();
         stash();
      }
      
      public function dresserDescription() : Boolean
      {
         return describeContents(gearStorage,dresserBox);
      }
      
      public function describeContents(param1:Array, param2:StorageArea) : Boolean
      {
         var _loc6_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = param2.start;
         var _loc5_:int = param2.end;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(param1[_loc6_] != null && param1[_loc6_].quantity > 0)
            {
               _loc3_.push(param1[_loc6_].itype.get_longName());
            }
         }
         if(int(_loc3_.length) <= 0)
         {
            return false;
         }
         outputText("它目前装有 " + Utils.formatStringArray(_loc3_) + "。");
         return true;
      }
      
      public function describe(param1:StorageArea) : String
      {
         var _gthis:Inventory = this;
         var jewelryLocation:Function = function():String
         {
            if(!_gthis.get_camp().get_builtCabin() || !_gthis.get_cabin().get_hasBed())
            {
               return "在你的铺盖卷旁边。";
            }
            if(_gthis.get_cabin().get_hasDresser())
            {
               return "在你的小屋里的梳妆台上。";
            }
            if(_gthis.get_cabin().get_hasNightstand())
            {
               return "在你的小屋里的床头柜上。";
            }
            return "在你的小屋里的床下。";
         };
         var _loc2_:IMap = new ObjectMap();
         _loc2_[jewelryBox] = "<b>首饰盒</b>\n你的首饰盒位于" + jewelryLocation();
         _loc2_[dresserBox] = "<b>梳妆台</b>\n你的小屋里有一个梳妆台，可以存放九种不同类型的内衣。";
         _loc2_[weaponRack] = "<b>武器架</b>\n这里设有一个武器架，最多可以放置九把不同的武器。";
         _loc2_[armorRack] = "<b>护甲架</b>\n你的营地里设有一个护甲架，用来存放你的各种装备。它似乎能存放九种不同类型的护甲。";
         _loc2_[shieldRack] = "<b>盾牌架</b>\n这里设有一个盾牌架，最多可以放置九面不同的盾牌。";
         var _loc3_:IMap = _loc2_;
         var _loc4_:String = _loc3_[param1];
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return "";
      }
      
      public function deleteItemsPrompt(param1:Useable, param2:int) : void
      {
         var slotNum1:int;
         var item1:Useable;
         var _g:Inventory;
         clearOutput();
         outputText("你确定要销毁 " + get_player().itemSlots[param2].quantity + " 个 " + Utils.cnName(param1.get_shortName()) + " 吗？你将无法找回" + (get_player().itemSlots[param2].quantity == 1 ? "它" : "它们") + "！");
         menu();
         _g = this;
         item1 = param1;
         slotNum1 = param2;
         addButton(0,"是",function():void
         {
            _g.deleteItem(item1,slotNum1);
         });
         addButton(1,"否",inventoryMenu);
      }
      
      public function deleteItems() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2977,int((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2977) + 1) % 3));
         DragButton.cleanUp();
         inventoryMenu();
      }
      
      public function deleteItemPrompt(param1:Useable, param2:int) : void
      {
         var slotNum1:int;
         var item1:Useable;
         var _g:Inventory;
         clearOutput();
         outputText("你确定要销毁 1 个" + Utils.cnName(param1.get_shortName()) + "吗？你将无法找回它！");
         menu();
         _g = this;
         item1 = param1;
         slotNum1 = param2;
         addButton(0,"是",function():void
         {
            _g.delete1Item(item1,slotNum1);
         });
         addButton(1,"否",inventoryMenu);
      }
      
      public function deleteItem(param1:Useable, param2:int) : void
      {
         clearOutput();
         outputText(get_player().itemSlots[param2].quantity + "个" + Utils.cnName(param1.get_shortName()) + "" + (get_player().itemSlots[param2].quantity == 1 ? "已" : "已") + "被销毁。");
         get_player().destroyItems(param1,get_player().itemSlots[param2].quantity);
         doNext(inventoryMenu);
      }
      
      public function delete1Item(param1:Useable, param2:int) : void
      {
         clearOutput();
         outputText("1 个 " + Utils.cnName(param1.get_shortName()) + " 已被销毁。");
         get_player().destroyItems(param1,1);
         doNext(inventoryMenu);
      }
      
      public function debugWand() : void
      {
         clearOutput();
         get_inventory().takeItem(get_useables().DBGWAND,stash);
      }
      
      public function createStorage(param1:int = 1) : void
      {
         while(param1 > 0)
         {
            itemStorage.push(new ItemSlot());
            param1--;
         }
      }
      
      public function countTotalFoodItems() : int
      {
         var _loc4_:* = null as ItemSlot;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = itemStorage;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(!(_loc4_ == null || _loc4_.quantity <= 0))
            {
               if(_loc4_.itype is Consumable && Boolean(get_consumables().foodItems.contains(_loc4_.itype)))
               {
                  _loc1_ += _loc4_.quantity;
               }
            }
         }
         return _loc1_;
      }
      
      public function consumeItemInStorage(param1:ItemType) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as ItemSlot;
         var _loc2_:int = 0;
         var _loc3_:int = int(itemStorage.length);
         var _loc4_:int = _loc3_ - 1;
         var _loc5_:int = _loc2_;
         while(_loc4_ >= _loc5_)
         {
            _loc6_ = _loc4_--;
            _loc7_ = itemStorage[_loc6_];
            if(_loc7_.itype == param1 && _loc7_.quantity > 0)
            {
               _loc7_.set_quantity(_loc7_.quantity - 1);
               return true;
            }
         }
         return false;
      }
      
      public function close(param1:Function) : void
      {
         GameViewData.stashData = null;
         GameViewData.screenType = ScreenType.Default;
         DragButton.cleanUp();
         get_mainView().resetMainFocus();
         clearOutput();
         param1();
      }
      
      public function clearStorage() : void
      {
         itemStorage.resize(0);
      }
      
      public function clearGearStorage() : void
      {
         gearStorage.resize(0);
      }
      
      public function chestDescription() : String
      {
         var _loc1_:Array = [];
         if(get_player().hasKeyItem("Camp - Chest"))
         {
            _loc1_.push("一个大型木铁箱");
         }
         if(get_player().hasKeyItem("Camp - Murky Chest"))
         {
            _loc1_.push("一个潮湿的箱子");
         }
         if(get_player().hasKeyItem("Camp - Ornate Chest"))
         {
            _loc1_.push("一个镀金的箱子");
         }
         if(int(_loc1_.length) == 0)
         {
            return "<b>藏匿处</b>\n你没有一个合适的地方来存放物品，但把一些东西留在营地里应该没问题。";
         }
         var _loc2_:String = "<b>箱子</b>\n你有" + Utils.formatStringArray(_loc1_) + "来帮助存放多余的物品，它们位于";
         if(get_camp().homeDesc() == "cabin")
         {
            _loc2_ += "你的木屋里。";
         }
         else
         {
            _loc2_ += "传送门入口附近。";
         }
         return _loc2_;
      }
      
      public function checkKeyItems(param1:Boolean = false) : Boolean
      {
         var _loc3_:* = null as String;
         var _loc2_:Boolean = false;
         if(!param1)
         {
            menu();
            DragButton.cleanUp();
         }
         if(get_player().hasKeyItem("Tamani\'s Satchel"))
         {
            if(!param1)
            {
               addNextButton("挎包",get_game().forest.tamaniScene.openTamanisSatchel);
            }
            _loc2_ = true;
         }
         if(get_player().hasKeyItem("Feathery hair-pin"))
         {
            if(!param1)
            {
               _loc3_ = "这是" + get_game().bazaar.benoit.benoitMF("本诺瓦","本诺瓦特") + "作为礼物送给你的羽毛发夹。";
               addNextButton("羽毛发夹",get_game().bazaar.benoit.equipUnequipHairPin).hint(_loc3_,"羽毛发夹");
            }
            _loc2_ = true;
         }
         if(!param1)
         {
            addButton(14,"返回",inventoryMenu);
         }
         return _loc2_;
      }
      
      public function armorRackDescription() : Boolean
      {
         return describeContents(gearStorage,armorRack);
      }
   }
}

