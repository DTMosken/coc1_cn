package classes.items.consumables
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.lists.ColorLists;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import flash.Boot;
   import haxe.IMap;
   
   public class Liddellium extends Consumable
   {
      
      public var penisRemoved:Boolean;
      
      public function Liddellium(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         penisRemoved = false;
         var _loc2_:String = "Liddellium";
         var _loc3_:String = "Strange Potion";
         var _loc4_:String = "a strange potion";
         var _loc5_:String = "一个标有\"喝我\"的奇怪玻璃瓶。";
         var _loc6_:int = 0;
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      public function wakeUp() : void
      {
         clearOutput();
         outputText("你迷迷糊糊地醒来。你试图站起来，但四肢却不听使唤。当你强迫身体移动时，一阵阵悸痛传遍全身。你费了九牛二虎之力，才从仰卧翻身成俯卧。你低头看了看自己的手臂——和身体的其他部位一样，毫无肌肉可言。");
         outputText("[pg]通过调整呼吸并坚持你的决心，你终于站了起来。你变得像" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) > 0 ? "爱丽丝" : "一个病弱的孩子") + "一样矮小、虚弱、可怜。确实，这似乎就是目的所在。");
         if(penisRemoved)
         {
            outputText("你甚至失去了你的男根。");
         }
         outputText("现在的你只是一个娇小可爱的小女孩，既没有威胁任何人的力量，也没有用来诱惑的资本。模糊的视线提醒着你，仅仅是站着就已经让你气喘吁吁了。恶魔们到底是怎么应付这种状况的！？你需要花上相当长的时间来重新训练你的身体以适应战斗，即便如此，这种持续的气喘吁吁的感觉天知道会持续多久。");
         outputText("[pg]你跌跌撞撞地走到水桶旁找点喝的，喝完水后凝视着自己的倒影。好吧，至少你很可爱。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:* = null as IMap;
         var _loc1_:String = "liddellium";
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727))
         {
            case 0:
               outputText("\"喝我\"这标签也太直白了吧。肯定没人觉得你会<i>那么</i>天真，对吧？");
               get_inventory().returnItemToInventory(this);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2727,FlagDict_Impl_.arrayReadInt(_loc2_,2727) + 1);
               return true;
            case 1:
               outputText("如果有人喝了一瓶标有\"毒药\"的药水，迟早会引起不适……但这上面没写毒药。不过，也许还是先给炼金术士看看比较好？");
               get_inventory().returnItemToInventory(this);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2727,FlagDict_Impl_.arrayReadInt(_loc2_,2727) + 1);
               return true;
            case 2:
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2727,FlagDict_Impl_.arrayReadInt(_loc2_,2727) + 1);
               outputText("那个标签非常有说服力。要喝掉它吗？");
               menu();
               addButton(0,"是",useItem);
               addButton(1,"否",noUse);
               return true;
            default:
               bigChanges();
               if(get_player().hasVagina())
               {
                  get_player().vaginas[0].virgin = true;
               }
               get_player().ass.analLooseness = 0;
               get_player().set_age(1);
               if(get_player().get_str() > 10)
               {
                  get_player().set_str(10);
               }
               if(get_player().get_tou() > 10)
               {
                  get_player().set_tou(10);
               }
               get_player().createStatusEffect(StatusEffects.GlobalFatigue,40,720,0,1,false);
               get_player().changeFatigue(999);
               get_player().createPerkIfNotHasPerk(PerkLib.LoliliciousBody);
               get_player().createPerkIfNotHasPerk(PerkLib.TransformationResistance);
               outputText("在好奇心和糟糕判断力的驱使下，你决定喝下这瓶药水。它的味道……很奇妙。很美味。这是一种由樱桃派、蛋奶冻、菠萝、烤火鸡、太妃糖和热奶油吐司混合而成的奇特味道。这种奇妙的美味混合物舒缓并温暖了你的全身，随后让你陷入了一阵令人目眩的晕眩中。周围的世界似乎在旋转扭曲，以你意想不到的方式变化着。你倒在地上，无法支撑自己的身体。药水的舒缓感已经完全消失了。虚弱感占据了你，让你失去了知觉。");
               doNext(wakeUp);
               return true;
         }
      }
      
      public function noUse() : void
      {
         outputText("[pg]你把药水放回了原处");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2727,2);
         get_inventory().returnItemToInventory(this);
      }
      
      override public function get_value() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            return 500;
         }
         return 0;
      }
      
      override public function get_shortName() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            return "Liddellium";
         }
         return "Potion";
      }
      
      override public function get_longName() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            return "Liddellium";
         }
         return "strange potion";
      }
      
      override public function get_description() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            return "一瓶利德尔药水，这是一种经过精心蒸馏的混合物，通常用于将恶魔变成小孩子。";
         }
         return "这是一个奇怪的玻璃瓶，上面标着\"喝我\"";
      }
      
      override public function canUse() : Boolean
      {
         if(!get_player().hasPerk(PerkLib.LoliliciousBody) && !get_game().get_inCombat())
         {
            return true;
         }
         if(get_player().hasPerk(PerkLib.LoliliciousBody) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) == -2)
         {
            outputText("哦，不。不，你不会再这么做了。");
            return false;
         }
         return true;
      }
      
      public function bigChanges() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as String;
         var _loc1_:Boolean = false;
         if(get_player().get_tallness() > 48)
         {
            get_player().set_tallness(48);
            _loc1_ = true;
         }
         if(get_player().biggestTitSize() > 1)
         {
            _loc2_ = 0;
            while(int(get_player().breastRows.length) > _loc2_)
            {
               get_player().breastRows[_loc2_].breastRating = 1;
               _loc2_++;
            }
            _loc1_ = true;
         }
         if(get_player().hips.rating > 2)
         {
            get_player().hips.rating = 2;
            _loc1_ = true;
         }
         if(get_player().hasCock())
         {
            get_player().removeCock(0,10);
            penisRemoved = true;
            _loc1_ = true;
         }
         if(!get_player().hasVagina())
         {
            get_player().createVagina();
            _loc1_ = true;
         }
         if(get_player().skin.type == 0 && get_player().skin.desc == "skin")
         {
            _loc3_ = ColorLists.HUMAN_SKIN;
            if(!Boolean(_loc3_.contains(get_player().skin.tone)))
            {
               _loc4_ = _loc3_;
               _loc5_ = _loc4_[Utils.rand(int(_loc4_.length))];
               get_player().skin.tone = _loc5_;
               _loc1_ = true;
            }
         }
         if(Boolean(["rubber","thick","latex","rough"].contains(get_player().skin.adj)))
         {
            _loc2_ = Utils.rand(3);
            switch(_loc2_)
            {
               case 0:
                  get_player().skin.adj = "smooth";
                  break;
               case 1:
                  get_player().skin.adj = "milky";
                  break;
               case 2:
                  get_player().skin.adj = "freckled";
            }
            _loc1_ = true;
         }
         if(get_player().get_femininity() < 60)
         {
            get_player().set_femininity(60);
            _loc1_ = true;
         }
         if(get_player().hair.length < 10)
         {
            get_player().hair.length = 10;
            _loc1_ = true;
         }
         return _loc1_;
      }
   }
}

