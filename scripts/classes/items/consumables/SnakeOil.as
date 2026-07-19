package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class SnakeOil extends Consumable
   {
      
      public function SnakeOil()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SnakOil","Snake Oil","a vial of snake oil",6,"A vial roughly the size of your fist, made of dark brown glass. It contains what appears to be an oily, yellowish liquid. The odor is abominable.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "snakeOil";
         get_player().slimeFeed();
         get_mutations().initTransformation([2,2]);
         outputText("你捏住鼻子，迅速拔掉小瓶的塞子，把它送到嘴边，决心看看它会对你的身体产生什么影响。你尽可能多地倒进去，痛苦地咽下去，然后再喝一口，把瓶子倒空。");
         if(!get_game().get_inCombat())
         {
            outputText("几分钟过去了，你开始希望自己带了水，以摆脱余味。");
         }
         if(get_player().get_spe100() < 70 && Utils.rand(2) == 0)
         {
            dynStats(DynStat.Spe(2 - get_player().get_spe() / 10 / 5));
            outputText("[pg]你的肌肉颤抖着，感觉准备好以蛇一般的速度出击！");
            if(get_player().get_spe100() < 40)
            {
               outputText("当然，你远没有那么快。");
            }
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if((get_player().wings.type != 0 || get_player().rearBody.type == 3) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]一阵紧绷感蔓延到你的背部，感觉就像有人把匕首刺入你的脊椎。片刻之后，疼痛过去了，尽管你的鳍不见了！");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]一阵紧绷感蔓延到你的背部，感觉就像有人把匕首刺入你的每个肩胛骨。片刻之后，疼痛过去了，尽管你的翅膀不见了！");
            }
            get_player().wings.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().antennae.type != 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeAntennae();
         }
         if(get_changes() == 0 && Utils.rand(3) == 0)
         {
            get_mutations().gainSnakeTongue();
         }
         if(get_changes() == 0 && get_player().tongue.type == 1 && get_player().face.type != 5 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]毫无预兆地，你感觉你的犬齿长了将近一英寸，与你的牙龈发生碰撞，把自己割得很厉害。当你试图找到一种新的方法来闭上嘴巴而不使下巴脱臼时，你注意到它们滴着一种苦涩的卡其色液体。小心，<b>尽量不要用你的毒牙咬到舌头！</b>");
            if(get_player().face.type != 0 && get_player().face.type != 4 && get_player().face.type != 8 && get_player().face.type != 10)
            {
               outputText("随着变化的进行，你的[face]重塑了。这种感觉比牙齿切入牙龈要愉快得多，随着刺痛的转变完成，<b>你获得了一张看起来很正常的，人类的面容。</b>");
            }
            get_player().face.type = 5;
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0 && get_player().face.type == 5 && get_player().lowerBody.type != 3 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]随着你的腿开始感到虚弱，你发现越来越难以保持站立。你迅速倒下，无法支撑自己的体重。");
            outputText("[pg]试图重新站起来，你意识到大腿内侧的皮肤正在融合在一起，就像被一根看不见的针缝合一样。");
            outputText("这个过程继续贯穿你的" + get_player().legs() + "，最终到达你的[feet]。就在你以为转变已经结束时，你发现自己被一种压倒性的疼痛感钉在地上。你听到骨头断裂的可怕声音，融合在一起，变成别的东西，而你在不可思议的痛苦中扭曲。一段时间后，你感觉疼痛开始减轻，你躺在地上，被这可怕的经历耗尽了体力。一旦你觉得恢复了，你试图站起来，但令你惊讶的是，你发现你不再有[legs]：你身体的下半部分就像蛇一样。");
            outputText("[pg]你想知道自己的生殖器怎么了，于是把手顺着身体正面往下摸，直到在骨盆区域发现了一条巨大的横向裂缝，里面包含了你所有的性器官。");
            if(get_player().balls > 0 && get_player().ballSize > 10)
            {
               outputText("你很高兴再也不用拖着那些睾丸到处跑了。");
            }
            outputText("但紧接着，你的皮肤表面开始长出鳞片，慢慢变得清晰可见，将你腰部以下的身体重新染成了蛇一样的图案。这种感觉……其实还不赖，有点像长了老茧，只不过是长在整个下半身。变形完成后，你站了起来，用你新长出的蛇尾支撑着身体。你情不自禁地为自己这具雄伟的新身体感到自豪。");
            get_player().lowerBody.type = 3;
            get_player().lowerBody.legCount = 1;
            get_player().tail.type = 0;
            get_player().tail.venom = 0;
            get_player().tail.recharge = 0;
            if(get_player().hasReptileUnderBody())
            {
               get_player().skin.tone = "绿色的";
               get_player().underBody.skin.tone = "浅绿色的";
            }
            else
            {
               get_player().underBody.setProps({
                  "type":4,
                  "skin":{
                     "type":2,
                     "tone":"绿色的",
                     "adj":"",
                     "desc":"鳞片"
                  }
               });
            }
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() == 0)
         {
            outputText("[pg]令人惊讶的是，蛇油没有产生任何效果。蛇油不起作用，你真的应该感到惊讶吗？");
         }
         get_player().refillHunger(5);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2077,FlagDict_Impl_.arrayReadInt(_loc2_,2077) + get_changes());
         return false;
      }
   }
}

