package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class SlimyCloth extends Consumable
   {
      
      public function SlimyCloth()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SlimyCl","Slimy Cloth","a wet cloth dripping with slippery slime",6,"A cloth dripping with a viscous slime. You\'ve no doubt rubbing it on your body would have some kind of strange effect.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Player;
         var _loc1_:String = "gooGasmic";
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
         {
            if(get_armors().VINARMR.saveContent.clothUsed)
            {
               outputText("你再次将这块破布在你的[skindesc]上滑动，引起了藤蔓的反应。滑溜溜的黏液给你带来一种温暖、刺痛的感觉，令你震惊的是，藤蔓从你身上滑落下来。这套有机服装现在失去了宿主，在你的[feet]处枯萎死亡。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 1 && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDHO) != 0)
               {
                  outputText("[pg]那个婊子。所有其他的废话都只是毫无意义的差事！");
               }
               get_player().setArmor(ArmorLib.NOTHING);
               get_armors().VINARMR.reset();
            }
            else
            {
               outputText("你把黏液布拿在手里，在身上摩擦，慢慢地把奇怪的黏液涂抹在你的[skindesc]上。藤蔓颤抖着，你感觉全身都有点奇怪。");
               get_armors().VINARMR.saveContent.clothUsed = true;
            }
            return false;
         }
         outputText("你把黏液布拿在手里，在身上摩擦，慢慢地把奇怪的黏液涂抹在你的[skindesc]上。");
         if(get_player().get_lib100() < 80)
         {
            dynStats(DynStat.Lib(0.5 + (90 - get_player().lib) / 10),DynStat.Lust(get_player().lib / 2));
            outputText("[pg]你红着脸，感到欲火焚身，确保把它擦在你的胸部和勃起的乳头上，让奇怪的黏液浸透你。");
         }
         if(get_player().get_sens100() < 50)
         {
            outputText("[pg]滑溜溜的黏液浸透了你的[skindesc]，让它因温暖而刺痛，对每一次触摸都变得敏感。");
            dynStats(DynStat.Sens(1));
         }
         else if(get_player().get_sens100() > 50)
         {
            outputText("[pg]滑溜溜的黏液让你的[skindesc]微微发麻，只留下温柔的暖意。");
            dynStats(DynStat.Sens(-1));
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
         if(get_player().wings.type != 0 || get_player().rearBody.type == 3)
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]你叹了口气，感觉背部有一阵湿热的刺痛。当你感觉到你的鳍慢慢变成污泥，滴落到地上，你的身体变得更像黏液时，它有点痒。");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]你叹了口气，感觉背部有一阵湿热的刺痛。当你感觉到你的翅膀慢慢变成污泥，滴落到地上，你的身体变得更像黏液时，它有点痒。");
            }
            get_player().wings.restore();
            return false;
         }
         var _loc2_:WeightedChoice = new WeightedChoice().add("green",30).add("purple",20).add("blue",20).add("cerulean",20).add("emerald",10);
         if(get_player().hair.type != 3)
         {
            get_player().hair.type = 3;
            if(get_player().hair.length <= 0)
            {
               outputText("[pg]你的头愉快地嗡嗡作响，突然感觉又热又湿。你本能地伸手去摸湿润的来源，发现你长出了一些黏糊糊的头发。它不时地滴落，顺着你的背流到你的[ass]缝里。");
               get_player().hair.length = 5;
            }
            else if(get_player().hair.color.indexOf("rubbery") == -1 && get_player().hair.color.indexOf("latex-textured") == -1)
            {
               outputText("[pg]你的头愉快地嗡嗡作响，突然感觉又热又湿。你本能地伸手去摸湿润的来源，发现你的头发变成了一团滑溜溜、黏糊糊的东西。它不时地滴落，顺着你的背流到你的[ass]缝里。");
            }
            else
            {
               outputText("[pg]你那奇怪的无机头发发生了变化，变得部分熔化，液态物质的小溪顺着你的背流下。真奇怪。");
            }
            if(ColorLists.GOO_MORPH.indexOf(get_player().hair.color) == -1)
            {
               outputText("更奇怪的是，你半液体状头发的颜色变成了");
               get_player().hair.color = _loc2_.choose();
               outputText("[haircolor]。");
            }
            dynStats(DynStat.Lust(10));
            return false;
         }
         if(get_mutations().tfNoFur(2) && get_player().hair.type == 3 && (get_player().skin.type != 3 || get_player().skin.desc != "skin" || get_player().skin.adj != "slimy"))
         {
            if(get_player().hasPlainSkin())
            {
               outputText("[pg]你叹了口气，感觉到你的[armor]陷进了你的身体，你的皮肤变得不再坚固，甚至变得黏糊糊的。你意识到你的整个身体都变成了半固体和部分液体的状态！");
            }
            else if(get_player().hasFur())
            {
               outputText("[pg]你叹了口气，突然感觉你的皮毛变得又热又湿。你低下头，看到你的[armor]部分陷进了你的身体。你猛地意识到你的皮毛已经融化了，融入了现在作为你皮肤的史莱姆状涂层中。你变得部分液态，而且黏糊糊的！");
            }
            else if(get_player().hasScales())
            {
               outputText("[pg]你叹了口气，感觉鳞片上有一层滑溜溜的湿气。你伸手去抓，却抓下了一层滑溜溜的湿润涂层。你的鳞片已经变成了黏糊糊的黏液！仔细一看，你意识到你的整个身体在本质上变得更加液态，并且是半固体的。你的[armor]甚至部分陷进了你的身体。");
            }
            get_player().skin.type = 3;
            get_player().skin.desc = "skin";
            get_player().skin.adj = "slimy";
            get_player().underBody.restore();
            if(ColorLists.GOO_MORPH.indexOf(get_player().skin.tone) == -1)
            {
               outputText("更奇怪的是，你的肤色变成了");
               get_player().skin.tone = _loc2_.choose();
               outputText("[skintone]！");
               if(get_player().arms.type != 0 || get_player().arms.claws.type != 0)
               {
                  get_mutations().restoreArms(_loc1_);
               }
            }
            return false;
         }
         if(get_player().skin.type == 3 && get_player().skin.adj == "slimy" && get_player().skin.desc == "skin" && get_player().lowerBody.type != 8)
         {
            outputText("[pg]你的视线迅速下降，因为你[ass]和腹股沟以下的所有东西都融合成了一团无定形的黏液。值得庆幸的是，你发现你仍然可以在你那黏糊糊的新下盘上滚动，但这仍然是一种全新的奇怪体验。");
            _loc3_ = get_player();
            _loc3_.set_tallness(_loc3_.get_tallness() - (3 + Utils.rand(2)));
            if(get_player().get_tallness() < 36)
            {
               get_player().set_tallness(36);
               outputText("黏液变得坚实，你恢复了之前的高度。要想比你现在更矮，那可真是太难了！");
            }
            get_player().lowerBody.type = 8;
            get_player().lowerBody.legCount = 1;
            return false;
         }
         if(!get_player().hasVagina())
         {
            outputText("[pg]一股湿润的暖流蔓延过你黏糊糊的腹股沟，一道狭窄的裂口出现在你腹股沟的表面。<b>你长出了一个阴道。</b>");
            get_player().createVagina();
            get_player().vaginas[0].vaginalWetness = 4;
            get_player().vaginas[0].vaginalLooseness = 3;
            get_player().setClitLength(0.4);
            return false;
         }
         if(get_player().vaginalCapacity() < 9000)
         {
            if(!get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
            {
               get_player().createStatusEffect(StatusEffects.BonusVCapacity,9000,0,0,0);
            }
            else
            {
               get_player().addStatusValue(StatusEffects.BonusVCapacity,1,9000);
            }
            outputText("[pg]你的" + get_player().vaginaDescript(0) + "内壁感到一阵奇怪的紧绷感。你试探性地滑入几根手指，然后是你的手，接着是你大部分的前臂。<b>看来你现在的性器官几乎可以容纳任何东西。</b>");
            return false;
         }
         if(get_player().get_tallness() < 100 && Utils.rand(3) <= 1)
         {
            outputText("[pg]你凝胶状的身体因为吸收了额外的黏液而膨胀起来。如果要猜的话，你敢打赌你长高了大约两英寸。");
            _loc3_ = get_player();
            _loc3_.set_tallness(_loc3_.get_tallness() + 2);
            dynStats(DynStat.Str(1),DynStat.Tou(1));
         }
         else if(!get_player().hasStatusEffect(StatusEffects.SlimeCraving))
         {
            outputText("[pg]你感到肠胃里有一种越来越强烈的啃噬感。你觉得……饿了，但不是对食物的渴望。不，你需要一些湿润、黏糊糊的东西注入你的体内。你需要它。你能从骨子里感觉到它。<b>如果你不满足这种需求……你会变得越来越虚弱，甚至可能会死。</b>");
            get_player().createStatusEffect(StatusEffects.SlimeCraving,0,0,0,1);
         }
         else
         {
            outputText("[pg]你暂时感到饱足，但你知道这只是对你不断需要被“注入”液体的渴望的短暂缓解。");
            get_player().changeStatusValue(StatusEffects.SlimeCraving,1,0);
         }
         if(Utils.rand(2) == 0)
         {
            outputText(get_player().modFem(85,3));
         }
         if(Utils.rand(2) == 0)
         {
            outputText(get_player().modThickness(20,3));
         }
         if(Utils.rand(2) == 0)
         {
            outputText(get_player().modTone(15,5));
         }
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,2077,FlagDict_Impl_.arrayReadInt(_loc4_,2077) + get_changes());
         return false;
      }
   }
}

