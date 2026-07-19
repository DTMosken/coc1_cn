package classes.scenes.areas.lake
{
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.SettingsNPC;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.UndergarmentLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class FetishZealot extends Monster
   {
      
      public static var RELIGIOUS_CLOTHES:String = "religious clothes";
      
      public static var LEATHER_CLOTHES:String = "皮衣";
      
      public static var STUDENTS_CLOTHES:String = "学生服";
      
      public static var ALL_CLOTHES:Array = ["religious clothes","皮衣","学生服"];
      
      public var shotaZealot:Boolean;
      
      public function FetishZealot()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         shotaZealot = get_game().get_allowChild() && get_npcSettings().genericLoliShota;
         set_a("");
         set_short("fetish zealot");
         imageName = "fetishzealot";
         set_armorName("religious clothes");
         set_long(getDesc());
         set_race("Human?");
         if(shotaZealot)
         {
            createCock(4,0.9);
         }
         else
         {
            createCock(6,1.5);
         }
         createBreastRow(0);
         ass.analLooseness = 3;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(shotaZealot ? 55 : 69);
         hips.rating = 1;
         butt.rating = 2;
         skin.tone = new WeightedChoice().add("white",6).add("olive",6).add("tan",6).add("pale white",1).add("mahogany",1).choose();
         hair.color = new WeightedChoice().add("brown",9).add("black",9).add("blond",1).add("ginger",1).choose();
         hair.length = 4;
         initStrTouSpeInte(35,35,30,1);
         initLibSensCor(75,80,90);
         set_weaponName("wavy dagger");
         set_weaponVerb("stab");
         set_weaponAttack(3);
         set_armorDef(5);
         set_lust(25);
         lustVuln = 0.75;
         temperment = 2;
         level = 5;
         set_gems(5 + Utils.rand(10));
         set_drop(new WeightedChoice().add(get_armors().C_CLOTH,1).add(get_consumables().L_DRAFT,4).add(get_weapons().L_DAGGR,1).add(get_undergarments().SEA_SHIRT.isGoneCompletely() ? get_undergarments().SEA_SHIRT : null,4));
         checkMonster();
         get_game().lake.fetishZealotScene.currentZealot = this;
         get_game().lake.fetishZealotScene.registerTags();
      }
      
      public function zealotSpecial2() : void
      {
         outputText("狂热者突然大叫一声，向你伸出双臂；你的脑海中突然涌起一阵强烈的性奋，你能想象到的各种恋物癖的画面交织在一起，向你席卷而来。片刻之后你恢复了过来，但你注意到狂热者似乎不像刚才那么兴奋了。");
         get_player().takeLustDamage(get_lust() / 2,true);
         set_lust(get_lust() / 2);
      }
      
      public function zealotSpecial1() : void
      {
         var _loc1_:* = null as String;
         var _loc2_:String = get_armorName();
         if(_loc2_ == "religious clothes")
         {
            _loc1_ = "狂热者大喊道：[say: 孩子，你准备好向圣杖献上你的供品了吗？]同时指着他在长袍间滑动的肉棒。整个场景让你分心了片刻，并感到了强烈的性奋。";
         }
         else if(_loc2_ == "学生服")
         {
            _loc1_ = "狂热者学生有些害羞地看着你，嘴里叼着一支铅笔，同时把一只手挡在腹股沟前，试图隐藏一个相当明显的凸起。整个场景相当可爱，之后你感到异常兴奋。";
         }
         else if(_loc2_ == "皮衣")
         {
            _loc1_ = "狂热者转过身来，让你一览他紧身皮衣包裹的身体。他拍了拍自己的屁股，说道：[say: 你喜欢你看到的，不是吗，" + get_player().mf("种马","荡妇") + "？]你忍不住被这一幕弄得欲火焚身。";
         }
         else
         {
            _loc1_ = "虫子般的狂热者以一种非常像虫子的方式挑逗你。";
         }
         outputText(_loc1_);
         get_player().takeLustDamage(7 + Utils.rand(get_player().lib / 20 + get_player().cor / 20),true);
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]狂热者无视了这变态的展示，像什么都没发生一样继续着……");
            get_player().orgasm("Generic");
            doNext(get_game().lake.fetishZealotScene.zealotLossRape);
         }
         else
         {
            get_game().lake.fetishZealotScene.zealotLossRape();
         }
      }
      
      override public function postAttack(param1:int) : void
      {
         if(param1 > 0)
         {
            outputText("[pg-]你注意到某种不自然的灼热感正从伤口流入你的身体");
            if(get_player().get_inte() > 50)
            {
               outputText("，刀上是不是涂了某种催情剂？");
            }
            else
            {
               outputText("。");
            }
            get_player().takeLustDamage(get_player().lib / 20 + 5,true);
         }
         super.postAttack(param1);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(zealotSpecial1,1,true,5,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(zealotSpecial2,1,true,5,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function getDesc() : String
      {
         var _loc1_:String = get_armorName();
         if(_loc1_ == "religious clothes")
         {
            return "这个[if (shotaZealot) {年轻的}][zealotSkin]皮肤狂热者身高[if (shotaZealot) {[if (metric) {不到一米半|大约四英尺半}]|[if (metric) {将近两米|差几英寸就六英尺}]}]，身穿带有白色镶边的深蓝色长袍。他的[zealotHair]头发梳理得很整齐，虽然整个装束显然带有某种仪式感，但长袍敞开，露出他那至少看起来还算正常的[if (shotaZealot) {小|人类}]肉棒，将他的淫荡暴露无遗。";
         }
         if(_loc1_ == "学生服")
         {
            return "狂热者似乎打扮得像个年轻学者；当然，这身装扮和之前一样变态，露着肚脐，穿着毫无遮掩作用的超短裤，露出了他[if (shotaZealot) {小巧的}]肉棒。";
         }
         if(_loc1_ == "皮衣")
         {
            return "狂热者现在全身包裹在皮衣中，遮住了他大部分的[zealotSkin]肌肤，胯部有一个带有巨大拉链的阴茎套。";
         }
         return "狂热者的外貌看起来不可思议。你思索了片刻，得出结论：他最像某种虫子。";
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().lake.fetishZealotScene.zealotDefeated();
      }
      
      override public function combatRoundUpdate() : void
      {
         super.combatRoundUpdate();
         var _loc1_:Array = FetishZealot.ALL_CLOTHES;
         var _loc2_:String = _loc1_[Utils.rand(int(_loc1_.length))];
         if(get_armorName() != _loc2_)
         {
            set_armorName(_loc2_);
            set_long(getDesc());
            outputText("[pg-]恋物狂热者的衣服扭曲变形，直到他穿上了[monster.armor]。[pg-]");
         }
         set_lust(get_lust() + lustVuln * 5);
      }
   }
}

