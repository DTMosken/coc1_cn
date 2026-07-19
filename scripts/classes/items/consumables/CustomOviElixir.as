package classes.items.consumables
{
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import flash.Boot;
   import haxe.IMap;
   
   public class CustomOviElixir extends Consumable
   {
      
      public function CustomOviElixir(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4,param5);
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as IMap;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         get_player().slimeFeed();
         outputText("你拔开软木塞，大口吞下这浓稠的绿色液体。味道很奇特，和你以前尝过的任何东西都不一样。");
         if(get_player().get_pregnancyType() == 32)
         {
            outputText("[pg]有那么一瞬间，你觉得肚子比之前更胀了。但这种感觉很快就被一阵隐隐的阵痛所取代。看来，由于瓦莱里娅的史莱姆填满了你的子宫，产卵灵药无法对你发挥它的魔力了。");
            return false;
         }
         if(get_player().get_pregnancyType() == 33)
         {
            outputText("[pg]有那么一瞬间，你觉得肚子比之前更胀了。但这种感觉很快就被一阵隐隐的阵痛所取代。看来，由于蠕虫填满了你的子宫，产卵灵药无法对你发挥它的魔力了。");
            return false;
         }
         var _loc1_:int = get_player().get_pregnancyIncubation();
         if(_loc1_ == 0)
         {
            outputText("[pg]这药剂立刻对你的肚子产生了效果，让它微微隆起，就像怀孕了一样。你猜你很快就要下蛋了！");
            createPregnancy(Utils.rand(6),randBigEgg(),randEggCount());
            return false;
         }
         var _loc2_:Boolean = false;
         if(get_player().get_pregnancyType() == 5)
         {
            if(this is OvipositionMax && !get_player().hasPerk(PerkLib.Oviposition) && !canSpeedUp())
            {
               outputText("[pg]你开始感觉到一阵轻微的翻滚。你低头看向肚子，它似乎开始微微抽搐，然后又停了下来。你正看着空空的强效排卵药剂瓶子想找点说明，突然你的子宫猛地向前一坠，肚子开始微微膨胀。你把瓶子掉在地上，将脸埋在干裂的泥土中呻吟着，随着肚子里的翻滚变得更加剧烈和痛苦，你张开嘴无声地尖叫着……然后一切戛然而止。你蜷缩成胎儿的姿势颤抖着，等待着下一次并没有到来的阵痛。也许你该停止喝这些东西了。");
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,1295,FlagDict_Impl_.arrayReadInt(_loc3_,1295) + 1);
            }
            if(get_player().hasStatusEffect(StatusEffects.Eggs))
            {
               if(get_player().statusEffectv2(StatusEffects.Eggs) == 0)
               {
                  if(randDoIncEggSize())
                  {
                     get_player().addStatusValue(StatusEffects.Eggs,2,1);
                     outputText("[pg]你怀孕的肚子突然感觉比以前更沉重、更胀了。你想知道这药剂刚才到底起了什么作用。");
                     _loc2_ = true;
                  }
               }
               _loc4_ = bonusEggQty();
               if(_loc4_ > 0)
               {
                  outputText("[pg]一阵翻滚从你的子宫蔓延开来，它不舒服地蠕动着，你的肚子也变得更大了些。");
                  get_player().addStatusValue(StatusEffects.Eggs,3,_loc4_);
                  _loc2_ = true;
               }
            }
         }
         if(!_loc2_ && canSpeedUp())
         {
            outputText("[pg]你喘着粗气，因为你的孕期突然向前推进，肚子向外凸出了几英寸，离分娩的时间更近了。");
            _loc5_ = doSpeedUp(_loc1_);
            if(_loc5_ < 2)
            {
               _loc5_ = 2;
            }
            get_player().knockUpForce(get_player().get_pregnancyType(),_loc5_);
         }
         return false;
      }
      
      public function randEggCount() : int
      {
         return Utils.rand(3) + 5;
      }
      
      public function randDoIncEggSize() : Boolean
      {
         return Utils.rand(3) == 0;
      }
      
      public function randBigEgg() : Boolean
      {
         return false;
      }
      
      public function doSpeedUp(param1:int) : int
      {
         return param1 - (int(param1 * 0.3 + 10));
      }
      
      public function createPregnancy(param1:int, param2:Boolean, param3:int) : void
      {
         get_player().knockUp(5,50,1,1);
         get_player().createStatusEffect(StatusEffects.Eggs,param1,param2 ? 1 : 0,param3,0);
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().hasVagina())
         {
            return true;
         }
         outputText("你拔开软木塞准备喝下这东西，但那气味几乎让你作呕。你急忙把它塞了回去。[pg]");
         return false;
      }
      
      public function canSpeedUp() : Boolean
      {
         if(get_player().get_pregnancyIncubation() > 20)
         {
            return get_player().get_pregnancyType() != 9;
         }
         return false;
      }
      
      public function bonusEggQty() : int
      {
         if(Utils.rand(2) == 0)
         {
            return Utils.rand(4) + 1;
         }
         return 0;
      }
   }
}

