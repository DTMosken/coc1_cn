package classes.items.consumables
{
   import classes.DynStat;
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class PurityPhilter extends Consumable
   {
      
      public static var ITEM_VALUE:int = 100;
      
      public function PurityPhilter()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("PPhiltr","PurityPhilter","a vial of purity philter",100,"This silver vial feels cool to the touch. In fact, it feels a bit cold. Given the label, you suspect this will help to erase corruption.");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你拔开银色小瓶的盖子，把它凑到唇边。你仰起头，将冰冷无味的液体灌入喉咙。[pg]");
         if(get_player().cor < 20)
         {
            outputText("当一股冰冷清爽的感觉传遍全身时，你打了个寒颤。你感觉比以前平静多了。");
         }
         if(get_player().cor >= 20 && get_player().cor < 40)
         {
            outputText("当冰冷的液体在你的体内涌动时，你冒出了一身冷汗。尽管有些不适，但你的思绪似乎更清晰了。");
         }
         if(get_player().cor >= 40 && get_player().cor < 60)
         {
            outputText("当冰冷的液体进入你的胃里时，你突然感觉自己仿佛置身于暴风雪中。你的手脚变得麻木，尽管你这辈子从未觉得如此寒冷，但你却浑身是汗。最终，你开始感觉恢复了正常，而且你的思绪绝对变得更清晰了。");
         }
         if(get_player().cor >= 60)
         {
            outputText("当你吞下液体时，你喘着粗气跪倒在地。感觉就像有人把一根冰柱刺穿了你的身体。随着这种感觉的蔓延，你冒出了一身冷汗，你感觉血液在血管里冻结了。谢天谢地，你晕了过去。");
            outputText("[pg]后来，当你醒来时，通常笼罩着你思绪的持续不断的欲望阴霾似乎变淡了一些。");
         }
         var _loc1_:Number = 5 + Math.floor(get_player().cor / 10);
         dynStats(DynStat.Cor(-_loc1_));
         return false;
      }
   }
}

