package classes.scenes.areas.lake
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRange;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class FetishCultist extends Monster
   {
      
      public static var NAUGHTY_NURSES_UNIFORM:String = "淘气护士服";
      
      public static var TEACHERS_OUTFIT:String = "教师装";
      
      public static var SWIMSUIT:String = "泳装";
      
      public static var NOBLES_CLOTHING:String = "贵族服饰";
      
      public static var PERVY_NUNS_CLOTHING:String = "变态修女服";
      
      public static var FETISHY_OUTFIT:String = "恋物癖套装";
      
      public function FetishCultist()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("fetish cultist");
         imageName = "fetishcultist";
         set_long("你对面的女人闭着眼睛，双手合十，似乎在低声吟唱。她穿着一件紧贴她曲线的宗教服装，裙子短得让你能清楚地看到她的阴唇。\n\n她显然已经失去了理智，并用纯粹的变态填补了空虚。");
         set_race("Human?");
         createVagina(false,3,2);
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 2;
         ass.analWetness = 1;
         set_tallness(67);
         hips.rating = 6;
         butt.rating = 8;
         skin.tone = "pale";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(35,25,30,1);
         initLibSensCor(75,80,90);
         set_weaponName("whip");
         set_weaponVerb("whip-crack");
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("恋物癖套装");
         set_lust(25);
         temperment = 3;
         level = 2;
         set_gems(5 + Utils.rand(10));
         set_drop(new WeightedChoice().add(get_consumables().LABOVA_,1).add(get_weapons().RIDINGC,1).add(get_consumables().OVIELIX,2).add(get_consumables().L_DRAFT,6).add(get_armors().SCHLGRL,2));
         special1 = cultistRaisePlayerLust;
         special2 = cultistLustTransfer;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param1)
         {
            super.won(param1,param2);
         }
         else
         {
            if(param2)
            {
               outputText("[pg]邪教徒看着你挣扎的样子咯咯直笑。[pg]");
            }
            get_game().lake.fetishCultistScene.cultistRapesYou();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(cultistRaisePlayerLust,1,true,5,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(cultistLustTransfer,1,true,5,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         clearOutput();
         if(param1)
         {
            outputText("因为受伤太重而无法继续控制自己的力量，这名邪教徒无助地倒下了。");
         }
         else
         {
            outputText("被欲望吞噬，这名邪教徒失去了控制自己的能力，瘫倒在地。");
         }
         if(get_armorName() == "变态修女服" && Utils.randomChance(5) && !get_player().hasItemAnywhere(get_armors().NNUNHAB))
         {
            setLoot(get_armors().NNUNHAB);
         }
         get_game().output.menu();
         var _loc4_:String = get_armorName();
         if(_loc4_ == "变态修女服")
         {
            _loc2_ = "膜拜";
            _loc3_ = "在这个虔诚的女人身上满足你自己。";
         }
         else if(_loc4_ == "泳装")
         {
            _loc2_ = "泳装荡妇";
            _loc3_ = "穿得这么暴露，她简直是在自找的。";
         }
         else
         {
            _loc2_ = "强暴";
            _loc3_ = "现在就满足你自己！";
         }
         get_game().output.addNextButton(_loc2_,get_game().lake.fetishCultistScene.playerRapesCultist).hint(_loc3_).sexButton();
         get_game().output.addNextButton("母乳喂养",get_game().lake.fetishCultistScene.fetishCultistHasAMilkFetish).disableIf(get_player().lactationQ() < 500 && !get_player().hasStatusEffect(StatusEffects.Feeder),"这个场景需要你有足够的乳汁。");
         if(get_player().hasMultiTails())
         {
            get_game().output.addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         get_game().setSexLeaveButton();
      }
      
      public function cultistRaisePlayerLust() : void
      {
         var _g:Combat;
         if(Utils.rand(2) == 0)
         {
            if(get_armorName() == "变态修女服")
            {
               outputText("她突然停止了吟唱，张开双腿，一手掰开她松弛的小穴，像个荡妇一样呻吟着。她用另一只手玩弄着自己的乳房，抚摸着其中一颗乳头。[pg]你不由自主地被眼前的景象激起了性欲。");
            }
            if(get_armorName() == "贵族服饰")
            {
               outputText("她突然红着脸咯咯笑了起来，一边拉下裙子，一边用温柔顺从的声音说道：“真的吗，大人！”这个动作让你能更清楚地看到她的乳沟，她的乳房看起来比以前更加丰满了。[pg]你不由自主地被眼前的景象激起了性欲。");
            }
            if(get_armorName() == "泳装")
            {
               outputText("她做了一系列淫荡的伸展动作，全方位展示着她紧身衣下性感的身体。尤其是她那兴奋充血的阴唇，轮廓清晰可见，似乎在乞求你来抚摸它们……而这仅仅是个开始。你不由自主地被眼前的景象激起了性欲。");
            }
            if(get_armorName() == "教师装")
            {
               outputText("显然她的身体非常柔软，她一手叉腰拱起背，展示着她紧实圆润的屁股，同时用淫荡的表情看着你。她用性感的嗓音说道，[say:也许下课后……我们应该私下谈谈……]你不由自主地被眼前的景象激起了性欲。");
            }
            if(get_armorName() == "淘气护士服")
            {
               outputText("她依然在紧身衣下展示着自己的身材，带着淫荡的笑容问道，[say:亲爱的，有什么需要我来满足你的吗？]她抓住自己一只紧实饱满的乳房，[say:也许你渴了？]你不由自主地被眼前的景象激起了性欲。");
            }
            if(get_armorName() == "恋物癖套装")
            {
               outputText("她突然开始穿着性感的衣服摆出各种姿势。你不由自主地被激起了性欲。");
            }
         }
         else
         {
            outputText("她突然开始揉捏自己匀称的乳房，手指几乎短暂地陷进柔软饱满的肉里，同时急切地用手指抠弄着自己，发出各种淫荡的声音。你被眼前的景象迷住了，她所经历的性兴奋化作温暖的波浪，从你的腹股沟处传遍全身。");
         }
         get_player().takeLustDamage(get_player().lib / 10 + get_player().cor / 20 + 4,true);
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            _g = get_game().combat;
            doNext(function():void
            {
               _g.combatMenu();
            });
         }
      }
      
      public function cultistLustTransfer() : void
      {
         var _g:Combat;
         if(get_lust() <= 30 || Utils.rand(2) == 0)
         {
            outputText("她的眼神变得迷离，");
            if(get_player().cor < 40)
            {
               outputText("而你几乎不敢去想");
            }
            else
            {
               outputText("而你希望自己能知道");
            }
            outputText("她在想些什么，因为你几乎能感觉到她的欲望在不断膨胀。");
            set_lust(get_lust() + 10);
         }
         else
         {
            outputText("她的眼神变得迷离，你感觉自己的脑海突然被你能想到的所有性变态的模糊画面填满，甚至还有更多。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("你感觉到你的" + get_player().vaginaDescript(0) + "突然涌出一股液体，湿透了自己");
               if(get_player().cockTotal() > 0)
               {
                  outputText("，同时一股先列腺液突然喷涌而出，顺着你的[cocks]流下，大量的血液涌向你的腹股沟，让它硬得发痛");
               }
               outputText("。");
            }
            else if(get_player().cockTotal() > 0)
            {
               outputText("一股先列腺液突然喷涌而出，顺着你的[cocks]流下，大量的血液涌向你的腹股沟，让它硬得发痛。");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("你无性别的身体突然充满了一种变态的温暖。");
            }
            get_player().takeLustDamage(get_lust() / 3 * (1 + get_player().cor / 300),true);
            outputText("[pg]你注意到这个年轻女人似乎平静了一些。");
            set_lust(get_lust() - 50);
            if(get_lust() < 0)
            {
               set_lust(10);
            }
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            _g = get_game().combat;
            doNext(function():void
            {
               _g.combatMenu();
            });
         }
      }
      
      override public function combatRoundUpdate() : void
      {
         super.combatRoundUpdate();
         var _loc1_:Boolean = false;
         switch(Utils.rand(5))
         {
            case 0:
               if(get_armorName() != "变态修女服")
               {
                  set_long("你对面的女人闭着眼睛，双手合十，似乎在低声吟唱。她穿着一件紧贴她曲线的宗教长袍。在她的阴唇上方有一个特别设计的开口。");
                  set_armorName("变态修女服");
                  _loc1_ = true;
               }
               break;
            case 1:
               if(get_armorName() != "贵族服饰")
               {
                  set_armorName("贵族服饰");
                  set_long("她穿着一件暴露的贵族长裙，让你能通过过度宽大的领口清楚地看到她丰满的胸罩。她的裙子太短了，你可以清楚地看到她的阴唇。她以一种相当可爱的方式对你微笑。她看起来就像是从一幅画里走出来的，由一位相当堕落和充满欲望的艺术家创作。");
                  _loc1_ = true;
               }
               break;
            case 2:
               if(get_armorName() != "泳装")
               {
                  set_long("她现在穿着一件显然对她来说太小的泳装，因为它紧绷在她的每一道曲线上，清晰地勾勒出它们让你看到。她巨大的乳房看起来随时都会撑破布料。你甚至能看到她勃起的乳头和肿胀的下唇。");
                  set_armorName("泳装");
                  _loc1_ = true;
               }
               break;
            case 3:
               if(get_armorName() != "教师装")
               {
                  set_long("她现在穿着一套教师装，配有眼镜、化妆品，黑发梳成紧紧的发髻，还有一套看起来很严肃的衣服……但完全没有背面。她转过身让你好好看看她的臀部，调皮地微笑着。");
                  set_armorName("教师装");
                  _loc1_ = true;
               }
               break;
            case 4:
               if(get_armorName() != "淘气护士服")
               {
                  set_long("这个女人化着浓妆，穿着一件放荡的护士服，似乎是白色乳胶材质，胸部有两个开口，胯部和大腿内侧有一个大开口。这让她充血的阴唇自由地悬挂着，她自豪地展示着。");
                  set_armorName("淘气护士服");
                  _loc1_ = true;
               }
         }
         if(_loc1_)
         {
            outputText("恋物癖邪教徒的衣服扭曲变形，变成了" + get_armorName() + "的模样。[pg]");
         }
         set_lust(get_lust() + lustVuln * 3);
      }
   }
}

