package classes.scenes.places
{
   import classes.CoC;
   import classes.ImageManager;
   import classes.Player;
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
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.Lake;
   import classes.scenes.areas.lake.AbstractLakeContent;
   import classes.scenes.places.boat.Kaiju;
   import classes.scenes.places.boat.MaraeScene;
   import classes.scenes.places.boat.SharkGirlScene;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.ds.Either;
   
   public class Boat extends AbstractLakeContent
   {
      
      public var sharkGirlScene:SharkGirlScene;
      
      public var marae:MaraeScene;
      
      public var kaiju:Kaiju;
      
      public var _explorationEncounter:Encounter;
      
      public function Boat()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         kaiju = new Kaiju();
         marae = new MaraeScene();
         sharkGirlScene = new SharkGirlScene();
         super();
      }
      
      public function takeSword() : void
      {
         clearOutput();
         outputText("好吧，它会成为你营地里相当不错的装饰品。你拿着剑，对你的探索结果有点失望。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2684,1);
         get_inventory().takeItem(get_weapons().LRAVENG,get_camp().returnToCampUseOneHour);
      }
      
      public function nothingSpecial() : void
      {
         get_images().showImage("location-boat");
         var _loc1_:Array = ["你划了将近一个小时的船[if (isMer) {，你的鳍在水中摆动}]，直到你的手臂几乎因为疲惫而燃烧起来。","你放弃了寻找任何有趣的东西，决定回去看看你的营地。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.BoatDiscovery);
      }
      
      public function goRowOnTheBoat() : void
      {
         if(get_player().isMermaid())
         {
            outputText("[pg]你警惕地坐在舒适的船上出发了，只把尾巴的末端浸入水中，想知道你是否会在湖中发现任何奇怪的岛屿或生物。[pg]");
            get_player().createStatusEffect(StatusEffects.MermaidWatered);
         }
         else
         {
            outputText("[pg]你出发了，想知道你是否会在湖中发现任何奇怪的岛屿或生物。[pg]");
         }
         get_explorationEncounter().execEncounter();
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var exploreLoc:Number;
         var _g:SharkGirlScene;
         var _gthis:Boat = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         var _loc1_:CommonEncounters = get_game().commonEncounters;
         var _loc2_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("izmakids",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,412) > 0)
            {
               return _gthis.get_game().izmaScene.izmaFollower();
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().izmaScene.findLostIzmaKids),null));
         var _loc3_:Encounter = marae.get_encounterObject();
         var _loc4_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("nothing",EncounterChance_Impl_.fromFloatConst(0.5),null,OneOf_Impl_.fromA(nothingSpecial),null));
         _g = sharkGirlScene;
         exploreLoc = 1;
         var _loc5_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("sharkgirl",null,null,OneOf_Impl_.fromA(function():void
         {
            _g.sharkGirlEncounter(exploreLoc);
         }),null));
         var _loc6_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("zealot",EncounterChance_Impl_.fromFloatConst(0.8),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(Number(FnHelpers.FN.ifLevelMin(2)()) != 0)
            {
               return _gthis.get_player().hasStatusEffect(StatusEffects.FetishOn);
            }
            return false;
         }),OneOf_Impl_.fromA(get_lake().fetishZealotScene.zealotBoat),null));
         var _loc7_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("anemone",null,null,OneOf_Impl_.fromA(get_game().anemoneScene.mortalAnemoneeeeee),null));
         var _loc8_:Either = OneOf_Impl_.fromA(findLightRailAvenger);
         var _loc9_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2684) != 1)
            {
               return _gthis.get_silly();
            }
            return false;
         });
         _explorationEncounter = Encounters.group("boat",_loc1_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,EncounterOrDef_Impl_.fromDef(new EncounterDef("lightrailavenger",EncounterChance_Impl_.fromFloatConst(0.05),_loc9_,_loc8_,null)),kaiju);
         return _explorationEncounter;
      }
      
      public function findLightRailAvenger2() : void
      {
         clearOutput();
         outputText("你浮出水面，爬上你的船。然后你看着那把剑。");
         outputText("[pg]这是一把武士刀，配有相配的木制剑鞘。刀刃上的金属令人惊叹，金属的锻造方式使其整个长度上呈现出类似龙的波浪图案。剑鞘是黑色的，上面有精美的红金相间的龙纹，尖端系着一条红丝带。");
         outputText("[pg]你用拇指摸了摸剑刃，想检查它的锋利程度，但令你惊讶的是，它绝对是钝的。你试图切开附近的任何东西，从木头到布料再到一根头发，但都不起作用。多糟糕的剑啊！好吧，它也许可以作为装饰品出售。");
         menu();
         addButton(0,"拿剑",takeSword).hint("拿走这把毫无价值的剑。");
         addButton(1,"离开",get_camp().returnToCampUseOneHour).hint("把这把毫无价值的剑留在湖里。");
      }
      
      public function findLightRailAvenger() : void
      {
         outputText("你靠近湖中心。你的手臂因疲惫而燃烧，很明显这里没有什么有趣的东西可找。");
         outputText("[pg]突然，湖底的一道闪光吸引了你的目光。");
         outputText("[pg]你靠近调查。这是一件相当奇怪的事情；云层聚集在一起，唯一的一缕阳光照射在水下的金属物体上。它的反射非常强烈，几乎和太阳本身一样亮。");
         outputText("[pg]你决定潜下去看看那是什么。");
         outputText("[pg]那东西藏在水下很深的地方，但不知为何，你并没有感到呼吸急促。你已经在水下待了几十秒了，但你绝对没事。盯着那反光让你有了呼吸，也让你充满了活力。");
         outputText("[pg]你终于够到了那个物体，那是一把剑，旁边还有一个剑鞘！它深深地刺在一块岩石上，但你却异常轻松地把它拔了下来。你回到水面，以便更好地分析你的战利品。");
         doNext(findLightRailAvenger2);
      }
      
      public function discoverBoat() : void
      {
         clearOutput();
         get_player().createStatusEffect(StatusEffects.BoatDiscovery,0,0,0,0);
         outputText("当你在湖边漫步时，空气清新，脚下的草地凉爽柔软。轻柔的波浪拍打着湖岸泥泞的沙滩，仿佛是从湖中向外辐射。你小心翼翼地绕过几个灌木丛，警惕着隐藏的“惊喜”，然后来到一个小码头。码头是用粗糙的绳子绑在一起的古树建成的。从绳子的外观来看，它非常古老，而且已经有很长一段时间没有被照看过了。码头上拴着一艘小划艇，只有大约七英尺长，三英尺宽。这艘船的状况似乎比码头好得多——它实际上看起来相当新。你确信它可以让你在湖上航行。[pg]");
         outputText("<b>（“船”已添加到地点菜单。）</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function boatExplore() : void
      {
         clearOutput();
         get_player().location = "船只";
         get_player().addStatusValue(StatusEffects.BoatDiscovery,1,1);
         outputText("你平安无事地到达码头并登上了小划艇。水面平静而安详，[if (ismer) {邀请你游泳，但是|非常适合划船。}]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 0)
         {
            outputText("它有一种淡淡的毒性。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("[if (ismer) {它|水}]看起来有些浑浊，并有一种淡淡的刺鼻气味。");
            if(get_player().get_inte() > 40)
            {
               outputText("你意识到那是什么味道——性爱的味道。");
            }
         }
         else
         {
            outputText("知道多年来被泵入其中的东西，玛莱需要时间来净化这一切。");
         }
         if(get_player().hasGills())
         {
            menu();
            addButton(0,"划船",goRowOnTheBoat);
            addButton(1,"游泳",get_game().swim.swimExplore);
         }
         else
         {
            goRowOnTheBoat();
         }
      }
   }
}

