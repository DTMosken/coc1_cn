package classes.internals
{
   import classes.Player;
   import flash.Boot;
   import flash.errors.IllegalOperationError;
   
   public class PregnancyUtils
   {
      
      public function PregnancyUtils()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         throw new IllegalOperationError("无法创建 Util 类的实例");
      }
      
      public static function createVaginaIfMissing(param1:GuiOutput, param2:Player) : void
      {
         if(int(param2.vaginas.length) == 0)
         {
            param1.text("[pg]你感到腹股沟传来一阵可怕的压力……紧接着是伴随着血肉撕裂的剧痛。<b>你低下头，看到自己长出了一个新的阴道</b>。[pg]");
            param2.createVagina();
         }
      }
      
      public static function isMouseCum(param1:int) : Boolean
      {
         return [4,11,29].indexOf(param1) >= 0;
      }
   }
}

