package classes.scenes.camp
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.camp._ImpGangBang.SaveContent;
   import flash.Boot;
   
   public class ImpGangBang extends BaseContent implements SelfDebug, SelfSaving, TimeAwareInterface
   {
      
      public var steppedOutside:Boolean;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var checkedDay:int;
      
      public var askedDay:int;
      
      public function ImpGangBang()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         steppedOutside = false;
         askedDay = 0;
         checkedDay = 0;
         globalSave = false;
         saveVersion = 1;
         saveName = "impGangbang";
         saveContent = new SaveContent(null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(get_time().hours != 2 || checkedDay == get_time().days)
         {
            return false;
         }
         return gangbangCheck();
      }
      
      public function timeChange() : Boolean
      {
         return false;
      }
      
      public function sleepingInside() : Boolean
      {
         if(!steppedOutside && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2006) > 0)
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Marble")
            {
               return FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "";
            }
            return true;
         }
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent = new SaveContent(null);
      }
      
      public function outsideYes() : void
      {
         steppedOutside = true;
         clearOutput();
         get_game().impScene.impGangabangaEXPLOSIONS();
      }
      
      public function outsideNo() : void
      {
         clearOutput();
         gangbangCheck();
      }
      
      public function outsideNever() : void
      {
         saveContent.neverAsk = true;
         clearOutput();
         gangbangCheck();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_debugName() : String
      {
         return "小恶魔轮奸";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function gangbangCheck() : Boolean
      {
         var _loc7_:* = null as String;
         if(get_player().isGenderless() || get_player().hasStatusEffect(StatusEffects.DefenseCanopy))
         {
            return false;
         }
         checkedDay = get_time().days;
         steppedOutside = false;
         var _loc1_:Boolean = Utils.randomChance(10 + get_player().get_inte() * 1.5);
         var _loc2_:Boolean = _loc1_ && sleepingInside();
         var _loc3_:Number = Utils.boundFloat(0,1 + get_player().statusEffectv1(StatusEffects.BirthedImps) * 2,7);
         if(get_player().hasPerk(PerkLib.PiercedLethite))
         {
            _loc3_ += 4;
         }
         if(get_player().get_inHeat())
         {
            _loc3_ += 2;
         }
         if(get_game().vapula.vapulaSlave())
         {
            _loc3_ += 7;
         }
         var _loc4_:Number = Utils.boundFloat(0,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1304) * 4,100);
         var _loc5_:Number = 1;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) > 0)
         {
            _loc5_ *= 1 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) / 100;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2179) > 0)
         {
            _loc5_ *= 2;
         }
         var _loc6_:Number = _loc3_ * (1 - _loc4_ / 100) / _loc5_;
         if(!saveContent.neverAsk && askedDay != get_time().days && get_player().hasPerk(PerkLib.BroodMother) && !get_game().camp.campGuarded() && (_loc5_ > 1 || _loc4_ > 0) && Utils.randomChance(_loc3_))
         {
            askedDay = get_time().days;
            outputText("[pg]子宫的渴望再次呼唤着你，可惜陷阱现在阻挡了小恶魔。你可以改变这一点。");
            outputText("[pg]你要在外面度过余下的夜晚吗？");
            menu();
            addButton(0,"是",outsideYes);
            addButton(1,"否",outsideNo);
            addButton(2,"绝不",outsideNever);
            return true;
         }
         if(!Utils.randomChance(_loc6_))
         {
            return false;
         }
         if(get_game().camp.campGuarded())
         {
            outputText("[pg][bstart]");
            _loc7_ = get_game().camp.campGuardRandom();
            if(_loc7_ == "Helia")
            {
               outputText("赫莉娅一边喝着啤酒，一边告诉你她昨晚狠狠地教训了一些小恶魔。她还摇了摇尾巴以示强调。");
            }
            else if(_loc7_ == "Holli")
            {
               outputText("夜里，你听到远处传来惊讶的尖叫声，紧接着是高潮的呻吟声。看来有些小恶魔闯进了霍莉的树冠里……");
            }
            else if(_loc7_ == "Jojo")
            {
               outputText("乔乔告诉你，他昨晚解决了一群试图潜入营地的小恶魔。");
            }
            else if(_loc7_ == "Kiha")
            {
               outputText("你醒来后发现营地周围到处都是烧焦的小恶魔尸体。看来奇哈击退了一大群这些小混蛋。");
            }
            else if(_loc7_ == "Nieve")
            {
               outputText("你被一阵异常的寒意惊醒，向[if (builtcabin) {外面|营地周围}]看去，你看到了一群被冻住的小恶魔，而尼芙正站在她的冰堡上骄傲地对你微笑。");
            }
            else if(_loc7_ == "小A")
            {
               outputText("你的睡眠被一阵细小爪子四散逃窜的声音短暂打断。当你坐起身时，你看到小A正用手臂紧紧勒住一只挣扎的、被打晕的小恶魔，脸上带着饥饿的表情。她注意到你的目光，有些不好意思地退到了一个更文雅的距离，然后才开始她喧闹的进食。");
            }
            outputText("[bend][pg]");
            doNext(playerMenu);
         }
         else if(_loc2_)
         {
            outputText("你的睡眠被小恶魔敲打小木屋门的声音短暂打断。幸运的是，你在睡觉前锁上了门。");
            doNext(playerMenu);
         }
         else
         {
            get_game().impScene.impGangabangaEXPLOSIONS();
         }
         return true;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

