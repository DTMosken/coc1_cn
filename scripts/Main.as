package
{
   import classes.CoC;
   import flash.Lib;
   
   public class Main
   {
      
      public function Main()
      {
      }
      
      public static function main() : void
      {
         Lib.current.stage.scaleMode = "showAll";
         Lib.current.stage.align = "";
         Lib.current.stage.addChild(new CoC());
      }
   }
}

