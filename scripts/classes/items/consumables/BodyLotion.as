package classes.items.consumables
{
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.scenes.Inventory;
   import flash.Boot;
   
   public class BodyLotion extends Consumable
   {
      
      public var _adj:String;
      
      public function BodyLotion(param1:String = undefined, param2:String = undefined, param3:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _adj = param2.toLowerCase();
         var _loc4_:String = param2 + " Lotion";
         var _loc5_:String = "一瓶" + Utils.cnName(_adj) + "润肤乳";
         var _loc6_:int = 6;
         var _loc7_:String = "一个小木瓶，里面装满了" + param3 + "。正面的标签上写着：\"" + Utils.cnName(param2) + "润肤露。\"";
         super(param1,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      override public function useItem() : Boolean
      {
         if(!get_player().hasUnderBody())
         {
            lotionSkin();
            return true;
         }
         outputText("你下半身的皮肤与其他部位不同。你想把这" + _adj + "润肤露涂在哪里？");
         menu();
         addButton(0,"身体",lotionSkin);
         addButton(1,"腹部",lotionUnderBodySkin);
         addButton(4,"算了",lotionCancel);
         return true;
      }
      
      public function lotionUnderBodySkin() : void
      {
         var _loc1_:* = null as String;
         if(get_player().underBody.skin.adj == _adj)
         {
            outputText("你" + get_player().clothedOrNaked("花了一点时间脱下衣服，然后拔开乳液瓶的塞子，将","拔开乳液瓶的塞子，将") + liquidDesc() + "涂抹在你的下半身。涂完后，你感觉精神焕发。");
            get_player().HPChange(10,true);
         }
         else
         {
            if(get_player().underBody.skin.type != 3)
            {
               _loc1_ = _adj != "clear" ? _adj : "";
               get_player().underBody.skin.adj = _loc1_;
            }
            switch(get_player().underBody.skin.type)
            {
               case 0:
                  outputText("你" + get_player().clothedOrNaked("花了一点时间脱下衣服，然后拔开乳液瓶的塞子，将","拔开乳液瓶的塞子，将") + liquidDesc() + "涂抹在你的下半身。当你把混合物涂在你的[chest]上时，它开始产生令人愉悦的刺痛感。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你[underBody.skinFurScales]的自然美就展现出来了，没有任何多余或不必要的东西。");
                  }
                  else if(_loc1_ == "rough")
                  {
                     outputText("很快，你胸腹部的皮肤变得更加粗糙，就好像你刚结束了一整天的辛勤劳作。");
                  }
                  else if(_loc1_ == "sexy")
                  {
                     outputText("很快，你下半身的皮肤变得如此性感，以至于你发现自己很难把手从自己身上拿开。");
                  }
                  else if(_loc1_ == "smooth")
                  {
                     outputText("很快，你胸腹部的皮肤变得更加光滑，呈现出一种自然健康的状态。");
                  }
                  else
                  {
                     outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  }
                  break;
               case 1:
                  outputText("" + get_player().clothedOrNaked("一旦你脱下衣服，你拿起乳液，","你拿起乳液，") + "开始将它按摩进你的皮肤，尽管你全身覆盖着毛发。这没费什么力气，但一旦你完成了……什么也没发生。过了一会儿，你的皮肤开始感到刺痛。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你拨开下半身的毛发，露出肌肤自然的美丽。");
                  }
                  else if(_loc1_ == "rough")
                  {
                     outputText("很快，你拨开腹部的毛发，露出粗糙的皮肤，看起来依然很自然。");
                  }
                  else if(_loc1_ == "sexy")
                  {
                     outputText("很快，你拨开下半身的毛发，露出性感的肌肤，让你忍不住想亲吻自己。");
                  }
                  else if(_loc1_ == "smooth")
                  {
                     outputText("很快，你拨开腹部的毛发，露出光滑的皮肤，看起来依然很自然。");
                  }
                  else
                  {
                     outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  }
                  break;
               case 2:
               case 5:
               case 6:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开乳液瓶塞，将","拔开乳液瓶塞，将") + liquidDesc() + "涂抹在你的下半身。当你把混合物揉进你的手臂和[chest]时，你全身都开始愉快地刺痛起来。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你[underBody.skinFurScales]的自然美就展现出来了，没有任何多余或不必要的东西。");
                     break;
                  }
                  if(_loc1_ == "rough")
                  {
                     outputText("很快，你腹部的鳞片变得更加粗糙，就好像你刚结束了一整天的辛勤劳作。");
                     break;
                  }
                  if(_loc1_ == "sexy")
                  {
                     outputText("很快，你下半身的鳞片变得如此性感，让你忍不住想摸摸自己。");
                     break;
                  }
                  if(_loc1_ == "smooth")
                  {
                     outputText("很快，你腹部的鳞片变得更加光滑，并且呈现出一种自然健康的状态。");
                     break;
                  }
                  outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  break;
               case 3:
                  outputText("你拿起乳液，将" + liquidDesc() + "倒在自己身上。混合物溶解了，你史莱姆般的表皮没有任何变化。事实上，什么也没发生。");
                  break;
               default:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔出油瓶的塞子，将","拔出油瓶的塞子，将") + "顺滑的液体涂抹在全身。甚至在涂满手臂和[chest]之前，你的全身皮肤就开始感到一阵愉悦的刺痛。在皮肤稍微变暗之后，它开始发生变化，直到你的下半身长出了" + _adj + "皮肤。");
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function lotionSkin() : void
      {
         var _loc1_:* = null as String;
         if(get_player().skin.adj == _adj)
         {
            outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开乳液瓶塞，将","拔开乳液瓶塞，将") + "这" + liquidDesc() + "涂抹在全身。涂完后，你感到焕然一新。");
            get_player().HPChange(10,true);
         }
         else
         {
            if([3,5].indexOf(get_player().skin.type) == -1)
            {
               _loc1_ = _adj != "clear" ? _adj : "";
               get_player().skin.adj = _loc1_;
            }
            switch(get_player().skin.type)
            {
               case 0:
                  outputText("你" + get_player().clothedOrNaked("花了一秒钟脱下衣服，然后拔开乳液瓶塞，将","拔开乳液瓶塞，将") + "这" + liquidDesc() + "涂抹在全身。当你将混合物揉进你的手臂和[chest]时，你全身开始产生一阵愉悦的酥麻感。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你的[skinFurScales]展现出了自然之美，没有任何多余的修饰。");
                  }
                  else if(_loc1_ == "rough")
                  {
                     outputText("很快，你的皮肤变得更加粗糙，就像你刚结束了一整天的辛勤劳作。");
                  }
                  else if(_loc1_ == "sexy")
                  {
                     outputText("很快，你的皮肤变得如此性感，让你都忍不住想摸摸自己。");
                  }
                  else if(_loc1_ == "smooth")
                  {
                     outputText("很快，你的皮肤变得更加光滑，但却是一种自然健康的光滑。");
                  }
                  else
                  {
                     outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  }
                  break;
               case 1:
                  outputText("" + get_player().clothedOrNaked("一旦你脱下衣服，你拿起乳液，","你拿起乳液，") + "开始将它按摩进你的皮肤，尽管你全身覆盖着毛发。这没费什么力气，但一旦你完成了……什么也没发生。过了一会儿，你的皮肤开始感到刺痛。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你拨开毛发，露出了肌肤自然的美感。");
                  }
                  else if(_loc1_ == "rough")
                  {
                     outputText("很快，你拨开皮毛，露出粗糙的皮肤，看起来依然很自然。");
                  }
                  else if(_loc1_ == "sexy")
                  {
                     outputText("很快，你拨开毛发，露出了性感的肌肤，让你都忍不住想亲吻自己。");
                  }
                  else if(_loc1_ == "smooth")
                  {
                     outputText("很快，你拨开皮毛，露出光滑的皮肤，看起来依然很自然。");
                  }
                  else
                  {
                     outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  }
                  break;
               case 2:
               case 6:
                  outputText("你" + get_player().clothedOrNaked("花了一点时间脱下衣服，然后拔出乳液瓶塞，将","拔出乳液瓶塞，将") + "" + liquidDesc() + "涂抹在全身。当你把这种混合物揉进双臂和[chest]时，你全身都开始产生一阵令人愉悦的酥麻感。");
                  _loc1_ = _adj;
                  if(_loc1_ == "clear")
                  {
                     outputText("很快，你的[skinFurScales]展现出了自然之美，没有任何多余的修饰。");
                     break;
                  }
                  if(_loc1_ == "rough")
                  {
                     outputText("很快，你的鳞片变得更加粗糙，仿佛你刚结束了一整天的辛勤劳作。");
                     break;
                  }
                  if(_loc1_ == "sexy")
                  {
                     outputText("很快，你的鳞片变得如此性感，让你都忍不住想摸摸自己。");
                     break;
                  }
                  if(_loc1_ == "smooth")
                  {
                     outputText("很快，你的鳞片变得更加光滑，散发着自然健康的光泽。");
                     break;
                  }
                  outputText("<b>这段文本不应该出现。请告知Kitteh6660。</b>");
                  break;
               case 3:
                  outputText("你拿起乳液，将" + liquidDesc() + "倒在自己身上。混合物溶解了，你史莱姆般的表皮没有任何变化。事实上，什么也没发生。");
                  break;
               case 5:
                  outputText("你拿起乳液，将" + liquidDesc() + "倒在你的鳞片上。混合物溶解了，但你的龙鳞没有发生任何变化。事实上，什么都没有发生。");
                  break;
               default:
                  outputText("你" + get_player().clothedOrNaked("花了一点时间脱下衣服，然后拔开油瓶的塞子，将","拔开油瓶的塞子，将") + "光滑的液体涂抹在你的全身。甚至在你涂满手臂和[chest]之前，你的皮肤就开始感到一阵愉悦的刺痛。在你的皮肤变暗了一点之后，它开始发生变化，直到你拥有了" + _adj + "的皮肤。");
            }
         }
         get_inventory().itemGoNext();
      }
      
      public function lotionCancel() : void
      {
         clearOutput();
         outputText("你把润肤露收了起来。[pg]");
         get_inventory().returnItemToInventory(this);
      }
      
      public function liquidDesc() : String
      {
         var _loc2_:* = null as Array;
         var _loc1_:String = _adj;
         if(_loc1_ == "clear")
         {
            _loc2_ = ["光滑的液体","浓稠的乳霜"];
            return _loc2_[Utils.rand(int(_loc2_.length))];
         }
         if(_loc1_ == "rough")
         {
            _loc2_ = ["磨砂黏液","粗糙的黏液"];
            return _loc2_[Utils.rand(int(_loc2_.length))];
         }
         if(_loc1_ == "sexy")
         {
            _loc2_ = ["光滑的液体","迷人的乳霜","美丽的乳霜"];
            return _loc2_[Utils.rand(int(_loc2_.length))];
         }
         if(_loc1_ == "smooth")
         {
            _loc2_ = ["光滑的液体","浓稠的乳霜"];
            return _loc2_[Utils.rand(int(_loc2_.length))];
         }
         return "乳霜";
      }
   }
}

