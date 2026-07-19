package classes.items.consumables
{
   import classes.BreastRow;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes._StatusEffect.DataStore;
   import classes.bodyParts.Hips;
   import classes.items.Consumable;
   import flash.Boot;
   
   public class BimboChampagne extends Consumable
   {
      
      public function BimboChampagne()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BimboCh","Bimbo Cham.","a bottle of bimbo champagne",1,"A bottle of bimbo champagne. Drinking this might incur temporary bimbofication.");
         addTags("Fluid");
      }
      
      override public function useItem() : Boolean
      {
         return applyEffect(get_player(),false);
      }
      
      public function removeBimboChampagne() : void
      {
         var _loc1_:StatusEffect = get_player().statusEffectByType(StatusEffects.BimboChampagne);
         outputText("\n<b>哇哦！你的头脑正在变得清醒，感觉像是很久以来第一次能够清晰地思考了。妮芙带的这玩意儿劲真大！你摇了摇头，把脑子里的蜘蛛网甩掉，很高兴自己终于不再像个交了蛇怪男友的地精那样迟钝了。</b>");
         dynStats(DynStat.Spe(10),DynStat.Lib(-1));
         if(_loc1_.value2 > 0)
         {
            var _temp_1:* = get_player().breastRows[0];
            _temp_1.breastRating = _temp_1.breastRating - _loc1_.value2;
            outputText("随着这危险的药剂效果消退，你的[chest]失去了一些……无脑波霸的魅力。没有了额外的重量拖拽，你的背部感觉轻松多了。");
         }
         if(_loc1_.value3 > 0)
         {
            outputText("与此同时，你的[vagina]慢慢闭合，消失得和出现时一样快。再见了，女儿身。");
            get_player().removeVagina();
         }
         if(_loc1_.value4 > 0)
         {
            var _temp_2:* = get_player().butt;
            _temp_2.rating = _temp_2.rating - _loc1_.value4;
            outputText("当然，你屁股上多出来的那些肉也消退了，让你变回了原本的[butt]。");
         }
         var _loc2_:Hips = get_player().hips;
         var _loc3_:DataStore = _loc1_.dataStore;
         var _loc4_:Object = _loc3_ != null ? _loc3_.hipRatingChange : null;
         _loc2_.rating -= _loc4_ != null ? Number(_loc4_) : 0;
         get_player().removeStatusEffect(StatusEffects.BimboChampagne);
         outputText("\n");
      }
      
      public function applyEffect(param1:Player, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         if(param2)
         {
            clearOutput();
         }
         if(param3)
         {
            if(param1.hasPerk(PerkLib.FutaFaculties) && param1.hasPerk(PerkLib.FutaForm) || param1.hasPerk(PerkLib.BimboBody) && param1.hasPerk(PerkLib.BimboBrains))
            {
               outputText("你敢发誓，当你看到妮芙对别人用这东西时，它明明是有效的，但不知为何，它对你，呃，好像没起作用。真奇怪！");
            }
            else if(!param1.hasStatusEffect(StatusEffects.BimboChampagne))
            {
               outputText("你拔出瓶塞，吸入起泡酒那嘶嘶作响、带有辛香的香气。深吸一口气后，你张开嘴，开始将这不断冒泡的液体倒进嘴里。它尝起来甜甜的，还有点粘稠，滑下喉咙的感觉非常……棒？简直，太棒了！");
            }
            else
            {
               outputText("你发现自己进一步陷入了那种迟钝的无脑荡妇思维中。不过，你确实感觉，呃，超级爽之类的！");
               outputText("[pg]你淫荡地呻吟着，开始左右摇摆臀部，向任何可能看到你的人展示自己。你只是觉得……太性感了。性感得无法隐藏。你的身体渴望展现自己，渴望感受到某人，任何人的目光。嗯……这让你好湿！你满意地呻吟了一声，将手指插入泥泞的小穴中。不知为何，你觉得你现在可以和任何人做爱！");
            }
         }
         var _loc4_:StatusEffect = param1.statusEffectByType(StatusEffects.BimboChampagne);
         if(_loc4_ != null)
         {
            _loc4_.value1 += 4;
            dynStats(DynStat.Spe(-2),DynStat.Lib(1),DynStat.Lust(10));
         }
         else
         {
            _loc4_ = param1.createStatusEffect(StatusEffects.BimboChampagne,8,0,0,0);
            if(param1.breastRows[0].breastRating < 5)
            {
               outputText("[pg]你感觉到你的咪咪里有一种，呃，超级美妙的刺痛感……然后你的[armor]变得，呃，更紧了；哇，看来妮芙的酒让你的咪咪变大了！太棒了！你咯咯笑着，尽可能多地大口吞下……啊；你的咪咪现在<b>有点</b>大了，但是，呃，你想要像妮芙那样又大又弹又晃荡的咪咪。那绝对超性感的！");
               _loc4_.value2 = 5 - param1.biggestTitSize();
               param1.breastRows[0].breastRating = 5;
            }
            if(!param1.hasVagina())
            {
               param1.createVagina();
               outputText("[pg]你能感觉到");
               if(param1.hasCock())
               {
                  outputText("你肉棒下方的肉[if (hasBalls) {以及你[balls]后面的肉}]");
               }
               else
               {
                  outputText("你胯部那片空白的肉");
               }
               outputText("开始发麻并蠕动……嗯……感觉真好！有一种你无法形容的感觉，然后你的胯部感觉全湿了……但那是种好的、黏糊糊的感觉。哦，哇！<b>你，好像，刚刚长出了一个新的处女小穴！</b>太棒了！");
               _loc4_.value3 = 1;
            }
            if(param1.butt.rating < 12)
            {
               outputText("[pg]你的屁股美味地晃动着——感觉就像饮料里的气泡在把你的丰满臀部往外推，像袋装起泡酒一样把它填满！你那充满气泡的屁股膨胀变大，直到感觉和你的脑袋一样轻飘飘的。好像，这太太太柔软了！");
               _loc4_.value4 = 12 - param1.butt.rating;
               param1.butt.rating = 12;
               if(param1.hips.rating < 12)
               {
                  if(_loc4_.dataStore == null)
                  {
                     _loc4_.dataStore = new DataStore(null,null,null,null,null);
                  }
                  _loc4_.dataStore.hipRatingChange = 12 - param1.hips.rating;
                  param1.hips.rating = 12;
               }
            }
            dynStats(DynStat.Spe(-10),DynStat.Lib(1),DynStat.Lust(25));
         }
         return false;
      }
   }
}

