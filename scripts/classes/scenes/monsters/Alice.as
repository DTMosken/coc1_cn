package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.WebDebuff;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Alice extends Monster
   {
      
      public function Alice(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined)
      {
         if(param4 == null)
         {
            param4 = "white";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc5_:IMap = new StringMap();
         if("blonde" in StringMap.reserved)
         {
            _loc5_.setReserved("blonde","长长的亚麻色");
         }
         else
         {
            _loc5_.h["blonde"] = "长长的亚麻色";
         }
         if("black" in StringMap.reserved)
         {
            _loc5_.setReserved("black","长长的纯黑色");
         }
         else
         {
            _loc5_.h["black"] = "长长的纯黑色";
         }
         if("red" in StringMap.reserved)
         {
            _loc5_.setReserved("red","微卷的红色");
         }
         else
         {
            _loc5_.h["red"] = "微卷的红色";
         }
         if("auburn" in StringMap.reserved)
         {
            _loc5_.setReserved("auburn","波浪状的铜色");
         }
         else
         {
            _loc5_.h["auburn"] = "波浪状的铜色";
         }
         if("brown" in StringMap.reserved)
         {
            _loc5_.setReserved("brown","普通的棕色");
         }
         else
         {
            _loc5_.h["brown"] = "普通的棕色";
         }
         if("bronze" in StringMap.reserved)
         {
            _loc5_.setReserved("bronze","长长的古铜色");
         }
         else
         {
            _loc5_.h["bronze"] = "长长的古铜色";
         }
         var _loc6_:IMap = _loc5_;
         var _loc7_:IMap = new StringMap();
         if("milky-white" in StringMap.reserved)
         {
            _loc7_.setReserved("milky-white","乳白色");
         }
         else
         {
            _loc7_.h["milky-white"] = "乳白色";
         }
         if("fair" in StringMap.reserved)
         {
            _loc7_.setReserved("fair","白皙");
         }
         else
         {
            _loc7_.h["fair"] = "白皙";
         }
         if("olive" in StringMap.reserved)
         {
            _loc7_.setReserved("olive","温暖的橄榄色");
         }
         else
         {
            _loc7_.h["olive"] = "温暖的橄榄色";
         }
         if("dark" in StringMap.reserved)
         {
            _loc7_.setReserved("dark","深色");
         }
         else
         {
            _loc7_.h["dark"] = "深色";
         }
         if("ebony" in StringMap.reserved)
         {
            _loc7_.setReserved("ebony","优质乌木的颜色");
         }
         else
         {
            _loc7_.h["ebony"] = "优质乌木的颜色";
         }
         if("mahogany" in StringMap.reserved)
         {
            _loc7_.setReserved("mahogany","浓郁的红木色");
         }
         else
         {
            _loc7_.h["mahogany"] = "浓郁的红木色";
         }
         if("russet" in StringMap.reserved)
         {
            _loc7_.setReserved("russet","赤褐色");
         }
         else
         {
            _loc7_.h["russet"] = "赤褐色";
         }
         var _loc8_:IMap = _loc7_;
         var _loc9_:IMap = new StringMap();
         if("white" in StringMap.reserved)
         {
            _loc9_.setReserved("white"," 搭配着同色的内裤");
         }
         else
         {
            _loc9_.h["white"] = " 搭配着同色的内裤";
         }
         if("striped" in StringMap.reserved)
         {
            _loc9_.setReserved("striped","，内裤上的条纹透过薄薄的布料显露出来");
         }
         else
         {
            _loc9_.h["striped"] = "，内裤上的条纹透过薄薄的布料显露出来";
         }
         if("black" in StringMap.reserved)
         {
            _loc9_.setReserved("black","，与底下透出的黑色蕾丝内裤形成鲜明对比");
         }
         else
         {
            _loc9_.h["black"] = "，与底下透出的黑色蕾丝内裤形成鲜明对比";
         }
         var _loc10_:IMap = _loc9_;
         set_a("");
         set_short("Alice");
         set_long("这个身体尚未发育成熟的魅魔有着一张温柔的脸，长着" + param3 + "的眼睛和" + (param1 in StringMap.reserved ? _loc6_.getReserved(param1) : _loc6_.h[param1]) + "的头发。她的皮肤是" + (param2 in StringMap.reserved ? _loc8_.getReserved(param2) : _loc8_.h[param2]) + "的，身材娇小却柔软得惹人怜爱。她的额头顶端装饰着两只短角，只有在你摆脱了她的影响后才能看到。她穿着一件相当优雅的连衣裙，配有白色衬衫、海军蓝和红色相间的格子裙，衬衫领口系着一个红色蝴蝶结。她的腿上穿着白色长袜" + (param4 in StringMap.reserved ? _loc10_.getReserved(param4) : _loc10_.h[param4]) + "。脚上穿着平底玛丽珍鞋。她的身后是两只小小的蝙蝠状翅膀和一条铲状尾巴。");
         set_race("Demon");
         createVagina(false,3,1);
         createBreastRow(Appearance.breastCupInverse("A"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(50);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = param2;
         hair.color = param1;
         hair.length = 22;
         initStrTouSpeInte(20,20,45,50);
         initLibSensCor(60,65,100);
         set_weaponName("fists");
         set_weaponVerb("punch");
         set_armorName("skin");
         bonusHP = 80;
         set_lust(20);
         lustVuln = 0.9;
         temperment = 1;
         level = 6;
         set_gems(Utils.rand(8) + 8);
         set_drop(new WeightedChoice().add(get_consumables().LOLIPOP,2).add(get_consumables().SDELITE,3).add(null,5));
         tail.type = 3;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().aliceScene.aliceLoss();
      }
      
      override public function runCheck() : void
      {
         outputText("爱丽丝甚至没有试图阻止你逃跑，当你拉开一段距离回头看时，你能看到她脸上如释重负的表情。");
         get_game().combat.doRunAway();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:Boolean = distance == CombatDistance.Distant;
         var _loc2_:MonsterAI = new MonsterAI().add(aliceIllusion,_loc1_ ? 3 : 1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc2_.add(aliceTeases,2,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc2_.add(aliceArouse,hasStatusEffect(StatusEffects.LustAura) ? 2 : 4,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc2_.add(eAttack,0.5,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc2_.exec();
      }
      
      override public function initiativeValue() : int
      {
         return int(super.initiativeValue()) * 3;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().aliceScene.aliceWin();
      }
      
      public function aliceTeases() : void
      {
         var _loc1_:int = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("爱丽丝害羞地移开视线，拉起裙摆，露出穿着紧身裤的大腿和白色的内裤。");
         }
         else if(_loc1_ == 1)
         {
            outputText("爱丽丝害怕地把双手举到头上，大喊道：[say:求、求求你别伤害我！我只是个小女孩，但、但我发誓，如果你不伤害我，我会让你舒服的。]她用小狗般可怜巴巴的眼神抬头看着你。");
         }
         else if(_loc1_ == 2)
         {
            outputText("当爱丽丝从你身边跑开时，她的尾巴向上翘起，露出了她可爱的小内裤。");
         }
         else
         {
            outputText("爱丽丝似乎绊倒了，在试图躲避你的时候摔倒了。她脸朝下摔在地上，完美的桃心状屁股翘起，正对着你。这迷人的景象让你分心，没能利用这个失误。");
         }
         var _loc2_:int = int(5 + get_player().sens / 10);
         get_player().takeLustDamage(_loc2_,true);
      }
      
      public function aliceIllusion() : void
      {
         var _loc2_:* = null as WebDebuff;
         outputText("爱丽丝试图保持距离，同时嘴里似乎在低声嘟囔着什么。[pg]");
         var _loc1_:int = 0;
         if(get_player().get_inte() < 30)
         {
            _loc1_ = int(Math.round(get_player().get_inte()));
         }
         else
         {
            _loc1_ = 30;
         }
         if(get_player().hasPerk(PerkLib.Whispered))
         {
            _loc1_ += 20;
         }
         if(get_player().isReligious() && get_player().isPureEnough(20))
         {
            _loc1_ += int(20 - get_player().corAdjustedDown());
         }
         if(Utils.rand(100) > _loc1_)
         {
            _loc2_ = get_player().statusEffectByType(StatusEffects.Web);
            if(_loc2_ == null)
            {
               if(get_player().get_weapon() == get_weapons().BLUNDER || get_player().get_weapon() == get_weapons().FLINTLK)
               {
                  outputText("你开了一枪，希望能打断她，");
               }
               else
               {
                  outputText("你拿着[weapon]向前冲去，想要抓住她，");
               }
               outputText("但她似乎突然移动得快多了。或者也许是你变慢了？\n");
               _loc2_ = new WebDebuff();
               get_player().addStatusEffect(_loc2_);
            }
            else
            {
               outputText("爱丽丝的速度似乎比以前更快了！");
            }
            _loc2_.increase();
         }
         else
         {
            outputText("你瞬间感觉自己像是在果冻中移动，但你眯起眼睛，抵抗住了她施放的任何幻术。");
         }
      }
      
      public function aliceArouse() : void
      {
         outputText("随着一系列神秘的手势，她的双手开始发出微弱的光芒。你的膝盖颤抖着，下体开始发热。");
         var _loc1_:int = int(15 + get_player().sens / 10);
         get_player().takeLustDamage(_loc1_,true);
         if(!hasStatusEffect(StatusEffects.LustAura))
         {
            createStatusEffect(StatusEffects.LustAura,0,0,0,0);
         }
      }
   }
}

