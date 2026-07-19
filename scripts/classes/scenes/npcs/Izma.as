package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Izma extends Monster
   {
      
      public function Izma()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Izma");
         imageName = "izma";
         set_long("虎鲨人伊兹玛身高略超过6英尺，红橙色的皮肤上布满了横向条纹，覆盖了她身体的大部分。她银白色的头发垂过肩膀，披在一对令人印象深刻的DD罩杯乳房上，这双乳房几乎无法被一件暴露的黑色比基尼上衣束缚。在它们下方及膝的草裙下" + (FlagDict_Impl_.arrayReadInt(get_flags(),439) != 0 ? "隐藏着她湿润滴水的阴唇" : "沙沙作响的是她那野兽般的十五英寸阴茎和四个蛋蛋的阴囊") + "；当她移动时，你偶尔能瞥见它们。此刻她把平时戴的阅读眼镜塞进了储物柜。");
         set_race("Shark-Morph");
         createCock(15,2.2);
         balls = 4;
         ballSize = 3;
         createVagina(false,3,2);
         createStatusEffect(StatusEffects.BonusVCapacity,45,0,0,0);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,30,0,0,0);
         set_tallness(65);
         hips.rating = 10;
         butt.rating = 6;
         skin.tone = "striped red-orange";
         hair.color = "silver";
         hair.length = 20;
         initStrTouSpeInte(80,90,85,65);
         initLibSensCor(75,25,40);
         set_weaponName("clawed gauntlets");
         set_weaponVerb("clawed punches");
         set_weaponAttack(45);
         additionalXP = 200;
         createPerk(PerkLib.Parry,0,0,0,0);
         set_armorName("bikini and grass skirt");
         set_armorDef(8);
         bonusHP = 330;
         set_lust(20);
         lustVuln = 0.2;
         temperment = 2;
         level = 15;
         set_gems(Utils.rand(5) + 1);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_game().izmaScene.izmaFollower())
         {
            get_game().izmaScene.loseSpar(param1);
         }
         else if(param2)
         {
            outputText("[pg][say: 真恶心！] 伊兹玛大叫着后退，留下你一个人恢复。");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().izmaScene.IzmaWins();
         }
      }
      
      override public function runSuccess() : void
      {
         super.runSuccess();
         outputText("[pg]当你把虎鲨人甩在身后时，她嘲弄的声音在你身后响起。[say: 噢，看看那漂亮的背影！你是在逃跑还是在引诱我？哈哈，看来我们现在知道谁才是更优秀的物种了！记住：下次我们见面时，你欠我那个屁股！] 她的调戏让你的脸颊羞愧得发烫。");
         get_game().output.flush();
      }
      
      override public function runFail() : void
      {
         super.runFail();
         outputText("[pg]当你把虎鲨人甩在身后时，她嘲弄的声音在你身后响起。[say: 噢，看看那漂亮的背影！你是在逃跑还是在引诱我？哈哈，看来我们现在知道谁才是更优秀的物种了！记住：下次我们见面时，你欠我那个屁股！] 她的调戏让你的脸颊羞愧得发烫。");
         get_game().output.flush();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(IzmaSpecials1,1,true,20,FATIGUE_PHYSICAL,CombatRange.ChargingMelee);
         _loc1_.add(IzmaSpecials2,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(IzmaSpecials3,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      override public function eAttack() : void
      {
         outputText("伊兹玛滑到你面前，虚晃一招，然后向你发起了一阵暴雨般的刺拳！\n");
         super.eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         if(get_game().izmaScene.izmaFollower())
         {
            get_game().izmaScene.winSpar();
         }
         else
         {
            get_game().izmaScene.defeatIzma();
         }
      }
      
      public function IzmaSpecials3() : void
      {
         outputText("伊兹玛并没有攻击你，而是对你咧嘴一笑，抓住自己的乳房揉捏起来，同时用一只膝盖摩擦着她长长的阴茎。她的尾巴在身后重重地拍打着沙地，假装高潮，在空气中大声呻吟。这番景象让你比刚才更加兴奋了。");
         get_player().takeLustDamage(20 + get_player().lib / 5,true);
      }
      
      public function IzmaSpecials2() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Array = ["[BLIND]伊兹玛盲目地试图抱住你，但完全没有打中。\n","[SPEED]伊兹玛试图抱住你，但你利用速度保持在她够不着的距离。\n","[EVADE]伊兹玛试图抱住你，但她没算到你的闪避技巧。你在最后一秒成功地侧身躲开了她。\n","[MISDIRECTION]伊兹玛低头向前冲，试图抱住你，但多亏了拉斐尔的教导，你很容易就误导了她，避开了她笨拙的抓取。\n","[FLEXIBILITY]伊兹玛试图把你锁在怀里，但你像猫一样的柔韧性让你很容易就扭开了她的抓取。\n","[UNHANDLED]伊兹玛试图把你锁在怀里，但你及时滚开了。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc1_))
         {
            _loc2_ = 0;
            _loc2_ = Math.round(130 - Utils.rand(get_player().get_tou() + get_player().get_armorDef()));
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
            outputText("伊兹玛闪躲腾挪，努力拉近距离，并抱住了你。你无法使用武器，只能");
            if(get_player().get_armorDef() <= 10 || _loc2_ > 0)
            {
               outputText("痛苦地扭动，因为她将手套上的刀刃狠狠地划过你的背部");
               get_player().bleed(this);
            }
            else
            {
               outputText("大笑，因为她的刀刃在你穿戴着盔甲的背上徒劳地刮擦");
            }
            outputText("然后打破了她的拥抱并跳开。");
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function IzmaSpecials1() : void
      {
         var _loc1_:Array = ["[BLIND]伊兹玛试图拉近与你的距离，但因为失明完全没有打中。\n","[SPEED]伊兹玛试图靠近，但你在她戴着护手的手碰到你之前，成功地侧身躲开了。\n","[EVADE]伊兹玛试图靠近，但你在她戴着护手的手碰到你之前，成功地侧身躲开了。\n","[MISDIRECTION]伊兹玛试图靠近，但你运用拉斐尔的教导，侧身躲开了这个鲨鱼女孩，用你的动作迷惑了她。\n","[FLEXIBILITY]伊兹玛试图靠近，但你在她戴着护手的手碰到你之前，成功地侧身躲开了。\n","[UNHANDLED]伊兹玛试图靠近，但不知怎么的，你躲开了她的攻击。"];
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,true,null,false,null,null,null),_loc1_))
         {
            outputText("伊兹玛以惊人的速度冲向你，用指尖击打你关节上的几个精确位置，然后向后跳开。这并不疼，但你感到疲倦和酸痛。[say: 穴位……]她笑着说，看到了你困惑的表情。");
            get_player().changeFatigue(20 + Utils.rand(20));
         }
      }
   }
}

