package classes.items.consumables
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class SatyrWine extends Consumable
   {
      
      public function SatyrWine()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SatyrWn","Satyr Wine","a bottle of satyr wine",30,"A dark bottle with a brilliant red liquid sloshing around inside. On the label there is a picture of a satyr playing pipes.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc1_:String = "satyrTFs";
         outputText("你感到口渴，拔掉了一瓶酒的软木塞。当你把瓶子放在唇边，喝下那浓郁、令人振奋的液体时，你很快发现自己拿着一个空瓶子，脸上带着微笑。");
         get_player().refillHunger(10);
         get_mutations().initTransformation(null,3);
         if(Utils.rand(2) == 0)
         {
            outputText("[pg]当紧致圆润的屁股和湿润的小穴的画面涌入你的脑海时，热流涌向你的下体。");
            dynStats(DynStat.Lust(25));
            if(get_player().get_lib100() < 100)
            {
               if(get_player().get_lib100() < 50)
               {
                  dynStats(DynStat.Lib(1));
               }
               dynStats(DynStat.Lib(1));
            }
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().cocks[get_player().smallestCockIndex()].cockLength < 12)
         {
            outputText("[pg]随着酒精流遍全身，热量涌入你的阴茎。你伸手去检查，发现它变长了。");
            var _temp_1:* = get_player().cocks[get_player().smallestCockIndex()];
            _temp_1.cockLength = _temp_1.cockLength + 1;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().cocks[get_player().smallestCockIndex()].cockThickness < 4)
         {
            outputText("[pg]你的阴茎感觉很温暖。当你伸手去检查时，你的怀疑得到了证实；它变粗了。");
            get_player().cocks[get_player().smallestCockIndex()].thickenCock(0.5);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().balls > 0)
         {
            outputText("[pg]你感到脸上泛起一阵暖意，同时酒精的气泡在鼻尖跳跃。当这种感觉消退后，你注意到你的脸型变得更加阳刚、棱角分明。");
            dynStats(DynStat.Lust(20));
            if(get_player().cumMultiplier < 10)
            {
               var _temp_2:* = get_player();
               _temp_2.cumMultiplier = _temp_2.cumMultiplier + 1;
            }
            if(get_player().cumMultiplier < 50)
            {
               var _temp_3:* = get_player();
               _temp_3.cumMultiplier = _temp_3.cumMultiplier + 0.5;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina() && get_player().hasStatusEffect(StatusEffects.BonusVCapacity))
         {
            outputText("[pg]你感到阴道里有一种刺痛感……真奇怪。");
            if(get_player().statusEffectv1(StatusEffects.BonusVCapacity) >= 0)
            {
               get_player().addStatusValue(StatusEffects.BonusVCapacity,1,-(Utils.rand(5) + 5));
               if(get_player().statusEffectv1(StatusEffects.BonusVCapacity) <= 0)
               {
                  get_player().removeStatusEffect(StatusEffects.BonusVCapacity);
               }
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("[pg]你的阴道开始发热。脱下[armor]后，你低头看着你的阴道缩小到消失，<b>而你的阴蒂则变大形成了一根人类的阴茎</b>。");
            get_player().removeVagina();
            get_player().createCock(6,1,CockTypesEnum.HUMAN);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasCock() && get_player().balls <= 0)
         {
            outputText("毫无预兆地，你的身体开始颤抖，就在[eachCock]下方，你感到一股温暖的液体顺着身体流下。还没等你检查，这种感觉就变得势不可挡，[eachCock]变硬并射精" + get_player().clothedOrNaked("在你的[armor]里","在地上") + "。从强烈的性高潮中恢复过来后，你" + get_player().clothedOrNakedLower("脱下[armor]去") + "清理自己，发现[eachCock]下方挂着<b>一对新的睾丸</b>。");
            get_player().balls = 2;
            get_player().ballSize = 1;
            get_player().orgasm("Generic");
            set_changes(get_changes() + 1);
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
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().hasScales())
         {
            outputText("[pg]你感到一种奇怪的滚动感，你的鳞片开始变移，在生长和消失的过程中扩散和重组，<b>变成了正常的人类皮肤</b>。");
            get_player().skin.type = 0;
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().arms.type != 0)
         {
            outputText("[pg]你感到手臂上有一股令人愉悦的热量，烟雾从中升起，<b>留下了正常的人类手臂</b>。");
            get_player().arms.set_type(0);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type != 21)
         {
            outputText("[pg]你感到下半身有一种奇怪的感觉。你的[feet]发生变移，你听到骨头在重组时发出的断裂声。腿上长出了毛发，很快你就看到了一对<b>新的山羊腿</b>。");
            get_player().lowerBody.type = 21;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().lowerBody.type == 21 && get_player().horns.type == 6 && get_player().face.type != 0)
         {
            outputText("[pg]你的脸变得温暖，突然你的视线被烟雾吞没，你咳嗽着拍打烟雾，注意到你的面部特征发生了显著的变化。摸了摸自己，你确认你<b>再次拥有了一张正常人类形状的脸</b>。");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && !get_player().hasScales() && get_player().ears.type != 4)
         {
            outputText("[pg]你感到头部侧面有一种奇怪的变移感，伸手去检查，发现了一对<b>肉质的尖耳朵</b>。");
            _loc2_ = get_player().hasFur();
            get_player().ears.type = 4;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.type == 0)
         {
            outputText("[pg]你开始感到头顶有一种刺痛感。伸手去检查，你发现了一对坚硬的短角。<b>你现在有一对山羊角了。</b>");
            get_player().horns.type = 6;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.type != 6)
         {
            outputText("[pg]你开始感到一种奇怪的瘙痒感，你感觉到你的角在重新定位。结束后，你伸手去摸，发现了一对坚硬的短角。<b>你现在有一对山羊角了。</b>");
            get_player().horns.value = 1;
            get_player().horns.type = 6;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().horns.type == 6 && get_player().horns.value == 1)
         {
            outputText("[pg]你感到额头热气腾腾。你困惑地伸手去摸，发现你的山羊角正在生长变粗，变成了一对带有脊状突起和轻微弯曲的角。<b>你现在有一对高耸的山羊角了。</b>");
            get_player().horns.value = 2;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_changes() < get_changeLimit() && get_player().antennae.type != 0)
         {
            get_mutations().removeAntennae();
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().cockTotal() == 1 && get_player().countCocksOfType(CockTypesEnum.HUMAN) == 0)
         {
            outputText("[pg]你感到下半身一阵骚动，你的阴茎变得坚硬如石。你" + get_player().clothedOrNakedLower("把它从[armor]里掏出来，") + "看了一眼。看来你现在<b>又有一根人类的阴茎了</b>。");
            get_player().cocks[0].set_cockType(CockTypesEnum.HUMAN);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().cockTotal() > 1 && get_player().cockTotal() - get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0)
         {
            outputText("[pg]你的其中一根阴茎开始感觉很奇怪。你" + get_player().clothedOrNakedLower("把它从[armor]里掏出来，释放出","注意到") + "一股浓烟。当你低头看时，你看到它已经<b>变成了一根人类的阴茎</b>。");
            _loc3_ = 0;
            while(_loc3_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc3_].get_cockType() != CockTypesEnum.HUMAN)
               {
                  get_player().cocks[_loc3_].set_cockType(CockTypesEnum.HUMAN);
                  break;
               }
               _loc3_++;
            }
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().tail.type == 0)
         {
            outputText("[pg]你感到[ass]上方有一种奇怪的瘙痒感。扭头去检查，你发现了一条短粗的尾巴，当你高兴时它会摇摆。<b>你现在有一条山羊尾巴了。</b>");
            get_player().tail.type = 21;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0 && get_changes() < get_changeLimit() && get_player().tail.type > 0 && get_player().tail.type != 21)
         {
            outputText("[pg]你的[tail]突然变得麻木。回头看，你看到它在变化、扭曲和重组，变成了一条<b>短粗的类似山羊的尾巴</b>。");
            get_player().tail.type = 21;
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]除了轻微的醉意，这酒没有其他效果。");
         }
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,2077,FlagDict_Impl_.arrayReadInt(_loc4_,2077) + get_changes());
         return false;
      }
   }
}

