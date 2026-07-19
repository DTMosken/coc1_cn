package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class Ectoplasm extends Consumable
   {
      
      public function Ectoplasm()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("EctoPls","Ectoplasm","a bottle of ectoplasm",6,"The green-tinted, hardly corporeal substance flows like a liquid inside its container. It makes you feel... uncomfortable, as you observe it.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc1_:String = "ectoplasm";
         get_player().slimeFeed();
         outputText("你皱着眉头拔开瓶塞，尽力无视飘入鼻腔的诡异气味。你硬着头皮将瓶子举到唇边，把里面的东西一饮而尽，当那玩意滑下喉咙时，你不禁打了个寒颤。至少它的味道出乎意料地不错，尝起来几乎像橘子。");
         get_mutations().initTransformation([2,3]);
         if(get_player().get_inte100() < 100 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的头开始剧烈地跳痛，让你忍不住轻声呻吟。你痛苦地皱起眉头，揉着太阳穴，随着悸动持续，疼痛很快开始消退；取而代之的是一种奇怪的自信与机智感。");
            dynStats(DynStat.Inte(1));
            if(get_player().get_inte100() < 50)
            {
               dynStats(DynStat.Inte(1));
            }
         }
         if(get_player().get_sens100() >= 20 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]哇哦，搞什么……你捏了捏自己的[skinfurscales]来证实你的猜想；这份幽灵小吃显然降低了你的敏感度。");
            dynStats(DynStat.Sens(-2));
            if(get_player().get_sens100() >= 75)
            {
               dynStats(DynStat.Sens(-2));
            }
         }
         if(get_player().get_lib100() < 100 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_lib100() < 50)
            {
               outputText("[pg]你漫不经心地将一只手伸向胯部，随着");
            }
            else
            {
               outputText("[pg]你费了很大的劲，才忍住没有去抚摸自己，因为");
            }
            outputText("幽灵女孩的一丝欲望转移到了你的体内。你忍不住想，她到底有多饥渴……");
            dynStats(DynStat.Lib(1));
            if(get_player().get_lib100() < 50)
            {
               dynStats(DynStat.Lib(1));
            }
         }
         if(get_player().hasCock() && get_changes() < get_changeLimit())
         {
            if(Utils.rand(3) == 0 && get_player().cocks[0].get_cockType() != CockTypesEnum.HUMAN)
            {
               outputText("[pg]你的[cock]后方开始出现一种奇怪的刺痛感，并慢慢蔓延到整个长度。虽然既不特别令人兴奋，也不觉得不舒服，但随着感觉的加剧，你还是紧张地动了动。你忍住了脱下[armor]检查的冲动，但从感觉上来看，你的阴茎正在改变形状。最终，这种变形的感觉消退了，<b>给你留下了一根完全人类的阴茎。</b>");
               get_player().cocks[0].set_cockType(CockTypesEnum.HUMAN);
               set_changes(get_changes() + 1);
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
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hair.type != 2)
         {
            outputText("[pg]一种失重感袭击了你的头皮。你困惑地伸出手，抓了一把头发。当你真的感觉到毛囊在你的抓握中变得越来越轻，直到你几乎感觉不到你抓着任何东西时，你的困惑进一步加深了。拔下一根发丝，你把它举到面前，惊讶地发现……它是完全透明的！你长出了透明的头发！");
            get_player().hair.type = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && (get_player().skin.tone != "sable" && get_player().skin.tone != "white"))
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]一股暖流在你的腹部升起，慢慢蔓延到你的躯干和四肢。热量不断积聚，变得令人不适，然后是痛苦，最后几乎难以忍受。你的视线因疼痛而模糊，当灼热感消退时，你已经能感觉到发生了一些变化。你抬起一只手，盯着那乳白色的肌肤。你的目光被手背上的静脉吸引，看着它们逐渐变成漆黑色。<b>你拥有了白色的皮肤，以及黑色的静脉！</b>");
               get_player().skin.tone = "white";
               get_player().skin.adj = "milky";
               get_player().skin.desc = "skin";
               get_player().skin.type = 0;
            }
            else
            {
               outputText("[pg]一股暖流在你的腹部升起，慢慢蔓延到你的躯干和四肢。热量不断积聚，变得令人不适，然后是痛苦，最后几乎难以忍受。你的视线因疼痛而模糊，当灼热感消退时，你已经能感觉到发生了一些变化。你抬起一只手，盯着那乌黑的肌肤。你的目光被手背上的静脉吸引，看着它们逐渐变成灰白色。<b>你拥有了黑色的皮肤，以及白色的静脉！</b>");
               get_player().skin.tone = "sable";
               get_player().skin.adj = "ashen";
               get_player().skin.desc = "skin";
               get_player().skin.type = 0;
            }
            get_player().underBody.restore();
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(get_player().hasPerk(PerkLib.Incorporeality) && !get_player().lowerBody.incorporeal)
         {
            get_player().lowerBody.incorporeal = true;
         }
         if(get_changes() < get_changeLimit() && !get_player().hasPerk(PerkLib.Incorporeality) && (get_player().skin.tone == "white" || get_player().skin.tone == "sable") && get_player().hair.type == 2)
         {
            outputText("[pg]一种超凡脱俗的感觉从你的腹部开始，一直蔓延到你的[hips]。还没等你反应过来，你的[legs]就开始发麻，一阵剧烈的颤抖穿过它们，你一屁股跌坐在地上。在你的注视下，你的下半身闪烁着光芒，变得空灵起来，一缕缕轻烟从你新变成幽灵般的[legs]上升起。你勉强站了起来，惊讶地发现你新的幽灵形态和以前的实体形态一样坚固。突然，就像决堤的洪水一样，转瞬即逝的幻象和画面涌入你的脑海，但停留的时间都不够长，让你无法集中注意力看清任何一个。你甚至都没有意识到，你的双手飞快地举到头上，紧紧抓住太阳穴，痛苦地呻吟着。精神上的轰炸来得快去得也快，留下的是一种令人惊讶的精神上的优越感。<b>你拥有了幽灵腿！</b>[pg]");
            outputText("<b>(获得特质：灵体化</b>)");
            get_player().createPerk(PerkLib.Incorporeality,0,0,0,0);
            get_player().lowerBody.incorporeal = true;
         }
         if(get_changes() == 0)
         {
            outputText("你感到一种奇妙的神清气爽，仿佛刚刚吞下了一整瓶阳光。随着活力充盈全身，你的唇边泛起一丝微笑。");
            get_player().HPChange(get_player().level * 5 + 10,true);
         }
         get_player().refillHunger(20);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2077,FlagDict_Impl_.arrayReadInt(_loc2_,2077) + get_changes());
         return false;
      }
   }
}

