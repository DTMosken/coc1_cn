package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class PigTruffle extends Consumable
   {
      
      public function PigTruffle(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1 ? "BoarTru" : "PigTruf",param1 ? "Boar Truffle" : "PigtailTruffle",param1 ? "a boar truffle" : "a pigtail truffle",6,param1 ? "It\'s clear where this fungus gets its name. A small, curly sprig resembling a pig\'s tail can be seen jutting out of it. Now that it\'s been enhanced by Lumi, it\'s larger and fuzzier than it was before, almost like a peach." : "It\'s clear where this fungus gets its name. A small, curly sprig resembling a pig\'s tail can be seen jutting out of it.");
      }
      
      override public function useItem() : Boolean
      {
         pigTruffle(get_id() == "BoarTru");
         return false;
      }
      
      public function pigTruffle(param1:Boolean) : void
      {
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc2_:String = "pigTruffle";
         if(param1)
         {
            _loc2_ += "-boar";
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         get_mutations().initTransformation([2,2,3],param1 ? 2 : 1);
         outputText("你咬了一口猪尾松露。奇怪的是，它尝起来像培根。你最终吃完了它。");
         get_player().refillHunger(20);
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().thickness < 75)
         {
            outputText(get_player().modThickness(75,3));
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().get_gender() >= 2 && get_player().tone > 20)
         {
            outputText(get_player().modTone(20,4));
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().get_gender() >= 2 && get_player().hips.rating < 15)
         {
            outputText("[pg]你的步态微微改变，以适应你变宽的[hips]。这种变化很微妙，但它们确实变宽了。");
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().butt.rating < 12)
         {
            outputText("[pg]当你站起来时，你的[ass]因为多出的一大块肉而晃动着。");
            var _temp_2:* = get_player().butt;
            _temp_2.rating = _temp_2.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().balls > 0 && get_player().ballSize < 4)
         {
            if(get_player().ballSize < 3)
            {
               outputText("[pg]一阵暖流穿过你的身体，你的腹股沟突然感到一阵沉重。你停下来检查这些变化，你游移的手指发现你的[balls]已经长得比人类的还要大了。");
            }
            else
            {
               outputText("[pg]一阵突如其来的热流包裹了你的腹股沟，集中在你的阴囊上。当你发现你的[balls]再次变大时，走路变得困难起来。");
            }
            var _temp_3:* = get_player();
            _temp_3.ballSize = _temp_3.ballSize + 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc2_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc2_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc2_);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().hasCockNotOfType(CockTypesEnum.PIG))
         {
            if(int(get_player().cocks.length) == 1)
            {
               outputText("[pg]你感觉到你的[cock]传来一阵不舒服的刺痛感。" + get_player().clothedOrNakedLower("你拉开你的[armor]","你低头看着你暴露的腹股沟") + "，看着它扭曲和改变。当变形完成时，你留下了一个闪亮的、粉红色的肉棒，顶端有一个突出的螺旋状结构。<b>你现在有了一根猪阴茎！</b>");
               get_player().cocks[0].set_cockType(CockTypesEnum.PIG);
            }
            else
            {
               outputText("[pg]你感觉到你的一根肉棒传来一阵不舒服的刺痛感。你拉开你的[armor]，看着它扭曲和改变。当变形完成时，你留下了一个闪亮的、粉红色的肉棒，顶端有一个突出的螺旋状结构。<b>你现在有了一根猪阴茎！</b>");
               get_player().setFirstCockNotOfType(CockTypesEnum.PIG);
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(param1 ? 3 : 4) == 0 && get_changes() < get_changeLimit() && get_player().ears.type != 14)
         {
            outputText("[pg]你感觉到耳朵上有一股压力，它们开始重塑。一旦变化完成，你试探性地弹了弹它们，<b>你留下了一对尖尖的、松软的猪耳朵。</b>");
            get_player().ears.type = 14;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(param1 ? 2 : 3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 14 && get_player().tail.type != 19)
         {
            if(get_player().tail.type > 0)
            {
               outputText("[pg]你感觉到你的[tail]传来一阵刺痛感，它开始扭曲变形。当这种感觉消散时，<b>你留下了一条小小的、卷曲的猪尾巴。</b>");
            }
            else
            {
               outputText("[pg]你感觉到脊椎底部被拉扯了一下，它稍微变长了一点。回头看去，<b>你发现你长出了一条小小的、卷曲的猪尾巴。</b>");
            }
            get_player().tail.type = 19;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(param1 ? 2 : 3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 14 && get_player().tail.type != 19 && get_player().isTaur() && (get_player().lowerBody.type == 1 || get_player().lowerBody.type == 11))
         {
            outputText("[pg]你的[tail]传来一阵刺痛感，它开始扭曲变形。当这种感觉消散时，<b>你留下了一条小小的、卷曲的猪尾巴。</b>这条新的、不匹配的尾巴在你马的下半身上看起来有点奇怪。");
            get_player().tail.type = 19;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(param1 ? 3 : 4) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 14 && get_player().tail.type == 19 && get_player().lowerBody.type != 21)
         {
            if(get_player().isTaur())
            {
               outputText("[pg]你痛苦地尖叫着，一阵可怕的疼痛席卷了你整个野兽般的下半身。你再也无法忍受，昏了过去。当你醒来时，你震惊地发现你不再拥有动物的下半身。相反，你只有两条腿。它们是趾行的，末端是偶蹄。<b>你现在有了猪腿！</b>");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你痛苦地尖叫着，一阵可怕的疼痛席卷了你整个[if (isNaga) {蛇一样的}]盘绕的下半身。你再也无法忍受，昏了过去。当你醒来时，你震惊地发现你不再拥有[if (isNaga) {蛇|鱼}]的下半身。相反，你只有两条腿。它们是趾行的，末端是偶蹄。<b>你现在有了猪腿！</b>");
            }
            else
            {
               outputText("[pg]你痛苦地尖叫着，你腿上的骨头断裂并重新排列。一旦疼痛消退，你检查你的腿，发现它们是趾行的，末端是偶蹄。<b>你现在有了猪腿！</b>");
            }
            get_player().lowerBody.type = 21;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && Utils.rand(param1 ? 2 : 3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 14 && get_player().tail.type == 19 && get_player().lowerBody.type == 21 && (get_player().face.type != 19 && get_player().face.type != 20))
         {
            outputText("[pg]你痛苦地大叫，你脸上的骨头开始断裂并重新排列。你拼命地揉着脸，试图减轻疼痛，但无济于事。当感觉过去后，你在附近的水坑里检查你的脸。<b>看到你新的猪脸，你几乎惊呼出声！</b>");
            get_player().face.type = 19;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().ears.type == 14 && get_player().tail.type == 19 && get_player().lowerBody.type == 21 && get_player().face.type == 19)
         {
            outputText("[pg]你痛苦地大叫，你脸上的骨头开始断裂并重新排列。你拼命地揉着脸，试图减轻疼痛，但无济于事。你的下牙也疼。你到底怎么了？当感觉过去后，你在附近的水坑里检查你的脸。<b>看到你长着獠牙的新野猪脸，你几乎惊呼出声！</b>");
            get_player().face.type = 20;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(param1 ? 3 : 4) == 0 && get_changes() < get_changeLimit())
         {
            _loc5_ = param1 ? ["深棕色","棕色","棕色"] : ["粉色","棕褐色","黑貂色"];
            _loc6_ = _loc5_[Utils.rand(int(_loc5_.length))];
            outputText("[pg]你的皮肤微微刺痛，你皮肤的颜色在你眼前发生变化。随着刺痛感减弱，你发现你的皮肤变成了" + _loc6_ + "。");
            get_player().skin.tone = _loc6_;
            get_player().arms.updateClaws(get_player().arms.claws.type);
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]奇怪的是，你没有感觉到任何变化。也许你很幸运？或者不是。");
         }
         var _loc7_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2077,FlagDict_Impl_.arrayReadInt(_loc7_,2077) + get_changes());
      }
   }
}

