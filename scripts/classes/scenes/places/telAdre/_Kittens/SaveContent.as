package classes.scenes.places.telAdre._Kittens
{
   import coc.view.selfDebug.BitflagComponent;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var metKittens:Boolean;
      
      public var kittensResult:int;
      
      public var disabledDate:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         disabledDate = 0;
         kittensResult = 0;
         metKittens = false;
         if(param1 != null)
         {
            metKittens = param1;
         }
         if(param2 != null)
         {
            kittensResult = param2;
         }
         if(param3 != null)
         {
            disabledDate = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("metKittens","",new BoolComponent(metKittens,function(param1:Boolean):Boolean
         {
            return _gthis.metKittens = param1;
         })),new DebugComp("kittensResult","",new BitflagComponent(kittensResult,function(param1:int):int
         {
            return _gthis.kittensResult = param1;
         },"未使用","已帮助","已离开","已拿走","反抗","顺从","已观看","已打屁股")),new DebugComp("disabledDate","",new IntComponent(disabledDate,function(param1:int):int
         {
            return _gthis.disabledDate = param1;
         }))];
      }
   }
}

