package classes.items
{
   import classes.items.shields.ClockwordShield;
   import classes.items.shields.DragonShellShield;
   import classes.items.shields.FlamegritShield;
   import classes.items.shields.Nothing;
   import classes.items.shields.TowerShield;
   import classes.items.shields.WoodenShield;
   import flash.Boot;
   
   public final class ShieldLib
   {
      
      public static var init__:Boolean;
      
      public static var NOTHING:Nothing;
      
      public static var DEFAULT_VALUE:Number = 6;
      
      public var WOODSHL:WoodenShield;
      
      public var TOWERSH:Shield;
      
      public var KITE_SH:Shield;
      
      public var GREATSH:Shield;
      
      public var FLMGRIT_SH:Shield;
      
      public var DRGNSHL:DragonShellShield;
      
      public var CLKSHLD:ClockwordShield;
      
      public var BUCKLER:Shield;
      
      public function ShieldLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         CLKSHLD = new ClockwordShield();
         WOODSHL = new WoodenShield();
         DRGNSHL = new DragonShellShield();
         TOWERSH = new TowerShield();
         FLMGRIT_SH = new FlamegritShield();
         KITE_SH = new Shield("Kite Sh","鸢形盾","kite shield","一面鸢形盾",8,150,"一面中等尺寸的鸢形盾。");
         GREATSH = new Shield("GreatSh","大盾","greatshield","一面大盾",12,300,"一面大型金属盾牌。有点重。");
         BUCKLER = new Shield("Buckler","小圆盾","buckler","一面小圆盾",5,50,"一面简单的木制圆形盾牌。");
      }
   }
}

