package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class HairDye extends Consumable
   {
      
      public var _color:String;
      
      public function HairDye(param1:String = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _color = param2.toLowerCase();
         var _loc3_:String = param2 + " Dye";
         var _loc4_:String = "一小瓶" + Utils.cnName(_color) + "染发剂";
         var _loc5_:int = 6;
         if(param2 == "rainbow")
         {
            _loc5_ = 100;
         }
         var _loc6_:String = "这瓶染发剂可以让你改变头发的颜色。当然，如果你没有头发，用它就是浪费。";
         super(param1,_loc3_,_loc4_,_loc5_,_loc6_);
         addTags("Dye");
      }
      
      override public function useItem() : Boolean
      {
         menu();
         if(get_player().hair.length > 0)
         {
            outputText("你有一头[haircolor]头发。");
            if(get_player().hair.color != _color)
            {
               addButton(0,"头发",dyeHair);
            }
            else
            {
               addButtonDisabled(0,"头发","你已经有" + Utils.cnName(get_player().hair.color) + "的头发了！");
            }
         }
         else
         {
            outputText("你没有头发。");
            addButtonDisabled(0,"头发","你是秃头！");
         }
         if(get_player().hasFur())
         {
            outputText("[pg]你有一身[furcolor]的皮毛。");
            if(get_player().skin.furColor != _color)
            {
               addButton(1,"皮毛",dyeFur);
            }
            else
            {
               addButtonDisabled(1,"皮毛","你已经有" + Utils.cnName(_color) + "皮毛了！");
            }
         }
         else if(get_player().hasFeathers() || get_player().hasCockatriceSkin())
         {
            outputText("[pg]你有[furcolor]羽毛。");
            if(get_player().skin.furColor != _color)
            {
               addButton(1,"羽毛",dyeFeathers);
            }
            else
            {
               addButtonDisabled(1,"羽毛","你已经有" + Utils.cnName(_color) + "羽毛了！");
            }
         }
         else
         {
            outputText("[pg]你没有毛发。");
            addButtonDisabled(1,"皮毛","你没有皮毛！");
         }
         if(get_player().hasFurryUnderBody())
         {
            outputText("[pg]你的下腹长有[underbody.furcolor]的皮毛。");
            if(get_player().underBody.skin.furColor != _color)
            {
               addButton(2,"下腹皮毛",dyeUnderBodyFur);
            }
            else
            {
               addButtonDisabled(2,"下腹皮毛","你的下腹已经长有" + Utils.cnName(_color) + "的皮毛！");
            }
         }
         else if(get_player().hasFeatheredUnderBody())
         {
            outputText("[pg]你的下腹长有[underbody.furcolor]的羽毛。");
            if(get_player().underBody.skin.furColor != _color)
            {
               addButton(2,"下腹羽毛",dyeUnderBodyFeathers);
            }
            else
            {
               addButtonDisabled(2,"下腹羽毛","你的下腹已经有" + Utils.cnName(_color) + "的羽毛了！");
            }
         }
         else
         {
            outputText("[pg]你的下腹没有特殊的毛发或皮草。");
            addButtonDisabled(2,"下腹毛发","你的下腹没有特殊的毛发或皮草！");
         }
         if(get_player().wings.canDye())
         {
            outputText("[pg]你长着[wingColor]的翅膀。");
            if(!get_player().wings.hasDyeColor(_color))
            {
               addButton(3,"翅膀",dyeWings);
            }
            else
            {
               addButtonDisabled(3,"翅膀","你已经有" + Utils.cnName(_color) + "翅膀了！");
            }
         }
         else
         {
            outputText("[pg]你的翅膀无法被染色。");
            addButtonDisabled(3,"翅膀","你的翅膀无法被染色！");
         }
         if(get_player().neck.canDye())
         {
            outputText("[pg]你有着[neckColor]的脖子。");
            if(!get_player().neck.hasDyeColor(_color))
            {
               addButton(5,"脖子",dyeNeck);
            }
            else
            {
               addButtonDisabled(5,"脖子","你已经有一个" + Utils.cnName(_color) + "的脖子了！");
            }
         }
         else
         {
            outputText("[pg]你的脖子不能被染色。");
            addButtonDisabled(5,"脖子","你的脖子不能被染色！");
         }
         if(get_player().rearBody.canDye())
         {
            outputText("[pg]你有一个[rearBodyColor]的后背。");
            if(!get_player().rearBody.hasDyeColor(_color))
            {
               addButton(6,"后半身",dyeRearBody);
            }
            else
            {
               addButtonDisabled(6,"后半身","你已经有一个" + Utils.cnName(_color) + "的后半身了！");
            }
         }
         else
         {
            outputText("[pg]你的后半身无法被染色。");
            addButtonDisabled(6,"后半身","你的后半身无法被染色！");
         }
         addButton(4,"算了",dyeCancel);
         return true;
      }
      
      public function finalize() : void
      {
         if(get_player().get_lust100() > 50)
         {
            outputText("[pg]清凉的水稍微平息了你的冲动，让你能更清晰地思考。");
            dynStats(DynStat.Lust(-15));
         }
         get_inventory().itemGoNext();
      }
      
      public function dyeWings() : void
      {
         clearOutput();
         outputText("你将染料揉进[wings]里，几分钟后用一桶凉爽的湖水冲洗干净。");
         get_player().wings.applyDye(_color);
         outputText("你现在拥有了[wingColor]的翅膀。");
         finalize();
      }
      
      public function dyeUnderBodyFur() : void
      {
         clearOutput();
         outputText("你将染料揉进腹部的毛发中，几分钟后用一桶清凉的湖水冲洗干净。");
         get_player().underBody.skin.furColor = _color;
         outputText("你现在的腹部拥有了[underbody.furcolor]的毛发。");
         finalize();
      }
      
      public function dyeUnderBodyFeathers() : void
      {
         clearOutput();
         outputText("你将染料揉进腹部的羽毛里，几分钟后用一桶凉爽的湖水冲洗干净。");
         get_player().underBody.skin.furColor = _color;
         outputText("你现在腹部有了[underbody.furcolor]的羽毛。");
         finalize();
      }
      
      public function dyeRearBody() : void
      {
         clearOutput();
         outputText("你将染料涂抹在你的[rearBody]上，几分钟后用一桶清凉的湖水冲洗干净。");
         get_player().rearBody.applyDye(_color);
         outputText("你现在拥有了[rearBodyColor]的后半身。");
         finalize();
      }
      
      public function dyeNeck() : void
      {
         clearOutput();
         outputText("你将染料涂抹在你的[neck]上，几分钟后用一桶清凉的湖水冲洗干净。");
         get_player().neck.applyDye(_color);
         outputText("你现在拥有了[neckColor]的脖子。");
         finalize();
      }
      
      public function dyeHair() : void
      {
         clearOutput();
         if(get_player().hair.length == 0)
         {
            outputText("你把染发剂抹在光头上，但没有任何效果。");
         }
         else if(get_player().hair.color.indexOf("rubbery") != -1 || get_player().hair.color.indexOf("latex-textured") != -1)
         {
            outputText("你把染发剂揉进你的[hair]里，但染发剂无法渗透你头发那不透水的材质。");
         }
         else
         {
            outputText("你把染发剂抹在你的[hair]上，几分钟后用一桶凉爽的湖水冲洗干净。");
            get_player().hair.color = _color;
            outputText("你现在拥有了[hair]。");
            if(get_player().get_lust100() > 50)
            {
               outputText("[pg]清凉的水稍微平息了你的冲动，让你能更清晰地思考。");
               dynStats(DynStat.Lust(-15));
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function dyeFur() : void
      {
         clearOutput();
         outputText("你将染料揉进毛发中，几分钟后用一桶清凉的湖水冲洗干净。");
         get_player().skin.furColor = _color;
         outputText("你现在拥有了[furcolor]的毛发。");
         finalize();
      }
      
      public function dyeFeathers() : void
      {
         clearOutput();
         outputText("你将染料揉进羽毛里，几分钟后用一桶凉爽的湖水冲洗干净。");
         get_player().skin.furColor = _color;
         outputText("你现在有了[furcolor]的羽毛。");
         finalize();
      }
      
      public function dyeCancel() : void
      {
         clearOutput();
         outputText("你把染发剂收了起来。[pg]");
         get_inventory().returnItemToInventory(this);
      }
      
      override public function canUse() : Boolean
      {
         return true;
      }
   }
}

