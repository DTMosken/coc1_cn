package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Succubus extends AbstractSuccubus
   {
      
      public function Succubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("ivory succubus");
         imageName = "ivorysuccubus";
         set_long("你面前的这只魅魔是典型的淫荡恶魔。两根角从她的额头突出，一对翅膀从她的背上长出，一条末端呈黑桃形的尾巴在甩动。她一丝不挂，G罩杯的乳房和湿润的小穴一览无余。时不时地，你能看到她抖动的屁股，显然是在勾引你。她似乎没有拿任何武器。");
         set_race("Demon");
         createVagina(false,2,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse("G"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "ivory";
         hair.color = "black";
         hair.length = 4;
         initStrTouSpeInte(25,20,35,42);
         initLibSensCor(75,45,90);
         set_weaponName("fists");
         set_weaponVerb("punch");
         set_armorName("skin");
         set_lust(50);
         temperment = 2;
         level = 3;
         set_gems(Utils.rand(5) + 5);
         set_drop(new WeightedChoice().add(get_consumables().INCUBID,1).add(get_consumables().SUCMILK,1).add(get_consumables().SDELITE,1));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().succubusScene.loseToSuccubus();
      }
      
      public function succubusBarrage() : void
      {
         var _loc1_:int = 0;
         outputText("那只魅魔看起来像是朝你跑了过来。");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("你拼命奔跑，直到她不再追赶为止。");
         }
         else
         {
            _loc1_ = 0;
            outputText("尽管你拼命冲刺，它还是拉近了距离，扑到你身上，又撕又抓。");
            if(Utils.rand(get_player().get_str() / 3 + 10) < get_str() / 3 + 10)
            {
               outputText("你试图把她甩开，但她的力量太大了，在你被推倒在地之前，她对你进行了一阵痛苦的抓挠和殴打。你站起身来，继续战斗。");
               _loc1_ = int(10 + get_str());
            }
            else
            {
               outputText("你使出浑身解数把她甩开，只受了点轻伤。");
               _loc1_ = int(Math.floor((5 + get_str()) / 2));
            }
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(kissAttack,1,true,0,FATIGUE_NONE,CombatRange.ChargingMelee);
         _loc1_.add(seduceAttack,1,true,10,FATIGUE_PHYSICAL,CombatRange.Tease);
         _loc1_.add(succubusBarrage,1,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().succubusScene.winAgainstSuccubus();
      }
   }
}

