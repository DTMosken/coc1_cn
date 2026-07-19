package classes.scenes.places
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.lake.AbstractLakeContent;
   import classes.scenes.places.boat.SharkGirlScene;
   import classes.scenes.places.swim.JellyFishGirlScene;
   import classes.scenes.places.swim.SharkManScene;
   import classes.statusEffects.MermaidWateredBuff;
   import classes.statusEffects.MermaidWateredDebuff;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.ds.Either;
   
   public class Swim extends AbstractLakeContent
   {
      
      public var sharkManScene:SharkManScene;
      
      public var sharkGirlScene:SharkGirlScene;
      
      public var jellyFishGirlScene:JellyFishGirlScene;
      
      public var _explorationEncounter:Encounter;
      
      public function Swim()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         sharkGirlScene = new SharkGirlScene();
         jellyFishGirlScene = new JellyFishGirlScene();
         sharkManScene = new SharkManScene();
         super();
      }
      
      public function takeSword() : void
      {
         clearOutput();
         outputText("好吧，它倒是可以作为你营地里相当不错的装饰品。你拿走了这把剑，对这次探索的结果感到有些失望。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2684,1);
         get_inventory().takeItem(get_weapons().LRAVENG,get_camp().returnToCampUseOneHour);
      }
      
      public function swimExplore() : void
      {
         clearOutput();
         get_player().location = "swim";
         outputText("尽管水有些微的污染，但你的鳃在水中让你精神焕发，所以你决定冒这个险是值得的，然后潜入水中。");
         if(get_player().isFullMermaid())
         {
            get_player().createOrFindStatusEffect(StatusEffects.MermaidWatered).increase();
         }
         else
         {
            get_player().createOrFindStatusEffect(StatusEffects.MermaidDehydrated).increase();
         }
         get_player().hasGottenWashed();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            dynStats(DynStat.Cor(0.1));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            dynStats(DynStat.Cor(1));
         }
         else
         {
            dynStats(DynStat.Cor(0.5));
         }
         get_explorationEncounter().execEncounter();
      }
      
      public function nothingSpecial() : void
      {
         get_images().showImage("location-swim");
         var _loc1_:Array = ["你游了将近一个小时，直到你的四肢几乎因疲惫而燃烧起来。","你放弃了寻找任何有趣的东西，决定回去看看你的营地。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var exploreLoc:Number;
         var _g:SharkGirlScene;
         var _gthis:Swim = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         var _loc1_:CommonEncounters = get_game().commonEncounters;
         var _loc2_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("水母娘",null,null,OneOf_Impl_.fromA(jellyFishGirlScene.jellyFishGirlEncounter),null));
         _g = sharkGirlScene;
         exploreLoc = 1;
         var _loc3_:Either = OneOf_Impl_.fromA(function():void
         {
            _g.sharkGirlEncounter(exploreLoc);
         });
         var _loc4_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("鲨鱼娘",EncounterChance_Impl_.fromFloatConst(0.5),null,_loc3_,null));
         var _loc5_:Either = OneOf_Impl_.fromA(sharkManScene.sharkManEncounter);
         var _loc6_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("鲨鱼人",EncounterChance_Impl_.fromFloatConst(0.1 + (get_game().izmaScene.saveContent.sharkManTalk ? 0.1 : 0)),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.get_player().hasStatusEffect(StatusEffects.SharkGirl))
            {
               return !_gthis.sharkManScene.saveContent.encountered;
            }
            return false;
         }),_loc5_,null));
         var _loc7_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("海葵",null,null,OneOf_Impl_.fromA(get_game().anemoneScene.mortalAnemoneeeeee),null));
         var _loc8_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("什么也没有",null,null,OneOf_Impl_.fromA(nothingSpecial),null));
         var _loc9_:Either = OneOf_Impl_.fromA(findLightRailAvenger);
         var _loc10_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2684) != 1)
            {
               return _gthis.get_silly();
            }
            return false;
         });
         _explorationEncounter = Encounters.group("swim",_loc1_,_loc2_,_loc4_,_loc6_,_loc7_,_loc8_,EncounterOrDef_Impl_.fromDef(new EncounterDef("轻轨复仇者",EncounterChance_Impl_.fromFloatConst(0.05),_loc10_,_loc9_,null)));
         return _explorationEncounter;
      }
      
      public function findLightRailAvenger2() : void
      {
         clearOutput();
         outputText("你浮出水面，看着那把剑。");
         outputText("[pg]这是一把武士刀，配有相配的木制刀鞘。刀刃上的金属非常奇妙，锻造方式使得整个刀身呈现出类似龙的波浪形花纹。刀鞘是黑色的，上面有精美的红金双色龙纹，末端系着一根红丝带。");
         outputText("[pg]你用拇指摸了摸剑刃检查锋利度，令你惊讶的是，它完全是钝的。你试图砍切附近的东西，从木头到布料再到一根头发，但都不起作用。真是一把破剑！好吧，也许可以当装饰品卖掉。");
         menu();
         addButton(0,"拿走剑",takeSword).hint("拿走这把毫无价值的剑。");
         addButton(1,"离开",get_camp().returnToCampUseOneHour).hint("把这把毫无价值的剑留在湖里。");
      }
      
      public function findLightRailAvenger() : void
      {
         outputText("你靠近湖中心。你的四肢因疲惫而燃烧，很明显这里没有什么有趣的东西可以找到。");
         outputText("[pg]突然，湖底的一道闪光吸引了你的眼睛。");
         outputText("[pg]你靠近去调查。这是一件相当奇怪的事情；云层聚集的方式使得唯一的一缕阳光照射在水下的金属物体上。它的反射很强烈，几乎和太阳本身一样亮。");
         outputText("[pg]你决定潜下去看看那是什么。");
         outputText("[pg]这个物体隐藏在很深的水下，但是，[if (isMer) {多亏了你的水生形态|[if (hasGills) {多亏了你的鳃|出于某种原因}]}]，你没有感到呼吸急促。你已经在水下待了几十秒了，但你完全没事。盯着反射光让你有呼吸并让你充满活力。");
         outputText("[pg]你终于到达了那个物体，那是一把剑，附近还有一个剑鞘！它深深地刺在一块岩石上，但你非常轻松地把它拔了出来。你回到水面，以便更好地分析你的战利品。");
         doNext(findLightRailAvenger2);
      }
   }
}

