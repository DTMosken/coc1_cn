package coc.view
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class ButtonData
   {
      
      public var visible:Boolean;
      
      public var toolTipText:String;
      
      public var toolTipHeader:String;
      
      public var text:String;
      
      public var enabled:Boolean;
      
      public var callback:Function;
      
      public function ButtonData(param1:String = undefined, param2:Object = undefined, param3:String = undefined, param4:String = undefined, param5:Boolean = true, param6:Boolean = true)
      {
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         toolTipText = "";
         toolTipHeader = "";
         visible = true;
         enabled = false;
         callback = null;
         text = "";
         text = Utils.cnName(param1);
         callback = param2;
         enabled = param2 != null && param5;
         toolTipText = Utils.cnName(param3);
         toolTipHeader = Utils.cnName(param4);
         visible = param6;
      }
      
      public function sexButton(param1:int = 0, param2:Boolean = true) : ButtonData
      {
         var _loc3_:CoCButton = new CoCButton("",null,"","",0,true,true,true,0,0,0).sexButton(param1,param2);
         enabled = _loc3_.enabled;
         if(!enabled)
         {
            toolTipText = _loc3_.toolTipText;
         }
         return this;
      }
      
      public function hint(param1:String = undefined, param2:String = undefined) : ButtonData
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         toolTipText = Utils.cnName(param1);
         toolTipHeader = Utils.cnName(param2);
         return this;
      }
      
      public function enable(param1:String = undefined, param2:String = undefined) : ButtonData
      {
         enabled = true;
         if(param1 is String)
         {
            toolTipText = Utils.cnName(param1);
         }
         if(param2 is String)
         {
            toolTipHeader = Utils.cnName(param2);
         }
         return this;
      }
      
      public function disableIf(param1:Boolean, param2:String = undefined, param3:String = undefined) : ButtonData
      {
         if(param1)
         {
            disable(param2,param3);
         }
         return this;
      }
      
      public function disableEnable(param1:Boolean, param2:String = undefined) : ButtonData
      {
         enabled = !param1;
         if(param1 && param2 is String)
         {
            toolTipText = Utils.cnName(param2);
         }
         return this;
      }
      
      public function disable(param1:String = undefined, param2:String = undefined) : ButtonData
      {
         enabled = false;
         if(param1 is String)
         {
            toolTipText = Utils.cnName(param1);
         }
         if(param2 is String)
         {
            toolTipHeader = Utils.cnName(param2);
         }
         return this;
      }
      
      public function applyTo(param1:CoCButton) : void
      {
         if(!visible)
         {
            param1.hide();
         }
         else if(!enabled)
         {
            param1.showDisabled(text,toolTipText,toolTipHeader,true);
         }
         else
         {
            param1.show(text,callback,toolTipText,toolTipHeader,true);
         }
      }
   }
}

