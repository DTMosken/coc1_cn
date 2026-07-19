package classes.items.consumables
{
   import classes.Player;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class GiantChocolateCupcake extends Consumable
   {
      
      public static var ITEM_VALUE:int = 250;
      
      public function GiantChocolateCupcake()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("CCupcak","Choc.Cupcake","a gigantic, chocolate cupcake",250,"A gigantic, chocolate cupcake. You could easily get full from eating this!");
      }
      
      override public function useItem() : Boolean
      {
         outputText("你低头看着这个巨大的巧克力纸杯蛋糕，想知道自己怎么可能把它全吃完。它填满了超大的包装纸，并从顶部凸出来，不知为何，即使它只是一种烘焙甜点，看起来也有些猥亵。它的顶端插着一根蜡烛，像变魔术一样突然燃烧起来。八颗红色的软糖环绕在纸杯蛋糕的外缘，被火焰照亮。[pg]");
         outputText("你犹豫地咬了一口。正如你所料，它是甜的，但也有一股微咸的巧克力底味。即使知道牛头人在麦迪的混合物里放了什么，你还是感到庆幸，这个新作品似乎没有他任何的“特殊调料”。在你慢慢吞食这个巨大的、松饼状的杰作时，被下药可不是什么好事。不知不觉中，大部分纸杯蛋糕都不见了，你吃掉最后几口巧克力，然后把手指舔干净。[pg]");
         outputText("天哪，你觉得好重！你走起路来微微摇晃，身体开始变厚、膨胀，直到你感觉自己像房子一样宽。慵懒感蔓延到你的四肢，你被迫静坐了一会儿，直到打出一个慵懒的饱嗝。[pg]");
         outputText("当你在糖分昏迷中放松时，你意识到你的肌肉线条正在消退，直到你的[skindesc]看起来几乎和麦迪的一样柔软海绵状。你抚摸着那柔软、矮胖的肉团，高兴得发抖，隐约想知道这个纸杯蛋糕女孩是不是一直都有这种感觉。");
         outputText(get_player().modTone(0,100));
         outputText(get_player().modThickness(100,100));
         get_player().refillHunger(100);
         return false;
      }
   }
}

