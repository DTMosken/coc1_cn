package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class Jojo extends Monster
   {
      
      public function Jojo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         init();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().jojoScene.loseToJojo();
      }
      
      public function selfCorruption() : void
      {
         switch(FlagDict_Impl_.arrayReadInt(get_flags(),2311))
         {
            case 2:
               outputText("乔乔似乎陷入了沉思，没有发动攻击。");
               set_lust(get_lust() + 4);
               break;
            case 3:
               outputText("乔乔在和你战斗时脸红了，被一个杂念分了心。你觉得你看到了他宽松裤子里的凸起。");
               set_lust(get_lust() + 8);
               break;
            case 4:
               outputText("乔乔踉跄了一下，摇了摇头，把一只手从裤子里那顶坚硬的帐篷上移开。");
               set_lust(get_lust() + 10);
               break;
            default:
               outputText("乔乔疯狂地抽动着他的" + cockDescriptShort(0) + "，抚摸着" + cockDescriptShort(0) + "，一看到你，它就漏出了先列腺液。");
               set_lust(get_lust() + 15);
         }
         if(get_lust() >= maxLust())
         {
            doNext(get_game().combat.endLustVictory);
            return;
         }
         if(get_lust100() >= 85)
         {
            outputText("老鼠喘着粗气，轻声呜咽着，每一个动作似乎都让他的凸起更加明显。你觉得他坚持不了多久了。");
         }
         else if(get_lust100() >= 70)
         {
            outputText("老鼠因为腹股沟处坚硬的凸起而行动困难。");
         }
         else if(get_lust100() >= 60)
         {
            outputText("老鼠的眼睛不断在你最性感的部位游移，暴露了他的欲望。");
         }
         else if(get_lust100() > 50)
         {
            outputText("老鼠的皮肤因初现的性唤起而保持潮红。");
         }
         doNext(get_game().playerMenu);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(selfCorruption,0.33,FlagDict_Impl_.arrayReadInt(get_flags(),2311) > 1,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function init() : void
      {
         set_a("");
         set_short("Jojo");
         imageName = "jojo";
         set_long("乔乔是一个" + (get_game().get_noFur() ? "长着纯白毛茸茸耳朵的鼠人" : "长着纯白皮毛的拟人老鼠") + "。虽然他只有四英尺高，但他浑身都是精壮的肌肉，移动速度惊人。他穿着宽松的白衣，身上缠着念珠和破烂的祈祷纸。");
         set_race(get_game().get_noFur() ? "Mouse-Man" : "Mouse-Morph");
         createCock(7.5,1.8);
         balls = 2;
         ballSize = 1;
         cumMultiplier = 1;
         set_hoursSinceCum(1000);
         createBreastRow(0);
         ass.analLooseness = 1;
         ass.analWetness = 1;
         set_tallness(48);
         hips.rating = 2;
         butt.rating = 2;
         skin.tone = "white";
         var _loc1_:int = get_game().get_noFur() ? 0 : 1;
         skin.type = _loc1_;
         var _loc2_:String = get_game().get_noFur() ? "skin" : "fur";
         skin.desc = _loc2_;
         hair.color = "white";
         hair.length = 2;
         initStrTouSpeInte(35,40,65,55);
         initLibSensCor(15,40,FlagDict_Impl_.arrayReadInt(get_flags(),2311) * 15);
         set_weaponName(get_game().get_noFur() ? "拳头" : "爪子");
         set_weaponVerb("punch");
         set_armorName("robes");
         set_lust(15);
         lustVuln = 0.9;
         temperment = 1;
         level = 4;
         set_gems(Utils.rand(5) + 2);
         special1 = selfCorruption;
         corruptionBasedStats();
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2311) < 5)
         {
            set_drop(NO_DROP);
         }
         else
         {
            set_drop(new WeightedChoice(get_consumables().INCUBID,2).add(get_consumables().B__BOOK).add(get_consumables().SUCMILK));
         }
         checkMonster();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().jojoScene.defeatedJojo(param1);
      }
      
      public function corruptionBasedStats() : void
      {
         initLibSensCor(15,40,FlagDict_Impl_.arrayReadInt(get_flags(),2311) * 15);
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2311) == 3)
         {
            set_lust(get_lust() + 30);
            _temp_1.cockThickness += 0.2;
            _temp_2.cockLength += 1.5;
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
            {
               ass.analLooseness = 2;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2311) == 4)
         {
            set_lust(get_lust() + 40);
            _temp_3.cockThickness += 0.5;
            _temp_4.cockLength += 3.5;
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
            {
               ass.analLooseness = 3;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2311) >= 5)
         {
            set_lust(get_lust() + 50);
            _temp_5.cockThickness += 1;
            _temp_6.cockLength += 5.5;
            set_str(get_str() - 20);
            set_tou(get_tou() + 30);
            cor += 10;
            set_HP(get_HP() + 60);
            if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
            {
               ass.analLooseness = 4;
            }
            set_long("乔乔是一个" + (get_game().get_noFur() ? "长着纯白毛茸茸耳朵的鼠人" : "长着纯白皮毛的拟人老鼠") + "。虽然他只有四英尺高，但他浑身都是精壮的肌肉，移动速度惊人。他一丝不挂，一根被腐化的巨大肉棒正随着他的动作跳动着。一个" + (get_game().get_noFur() ? "无毛的" : "毛茸茸的") + "阴囊在他双腿间晃荡，里面的睾丸大得看起来都有些发疼。");
         }
      }
   }
}

