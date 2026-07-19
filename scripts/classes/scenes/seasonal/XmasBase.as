package classes.scenes.seasonal
{
   import classes.BaseContent;
   import flash.Boot;
   
   public class XmasBase extends BaseContent
   {
      
      public var xmasMisc:XmasMisc;
      
      public var xmasElf:XmasElf;
      
      public var snowAngel:XmasSnowAngel;
      
      public var nieve:Nieve;
      
      public var jackFrost:XmasJackFrost;
      
      public function XmasBase()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         snowAngel = new XmasSnowAngel();
         jackFrost = new XmasJackFrost();
         nieve = new Nieve();
         xmasMisc = new XmasMisc();
         xmasElf = new XmasElf();
         super();
      }
   }
}

