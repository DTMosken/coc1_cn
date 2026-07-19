package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import classes.scenes.areas.glacialRift.Amarok;
   import classes.scenes.areas.glacialRift.Valkyrie;
   import classes.scenes.areas.highMountains.Basilisk;
   import classes.scenes.areas.highMountains.Phoenix;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.monsters.GoblinElder;
   import flash.Boot;
   
   public class AspectOfLaurentius extends Monster
   {
      
      public var summonedTurn:Number;
      
      public var prevHP:Number;
      
      public function AspectOfLaurentius()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         summonedTurn = 0;
         prevHP = Number(Math.NaN);
         super();
         set_a("");
         set_short("Aspect of Laurentius");
         imageName = "aspctlaurentius";
         set_long("");
         initStrTouSpeInte(90,0,75,200);
         initLibSensCor(60,60,50);
         lustVuln = 1;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 35;
         bonusHP = 3200;
         set_weaponName("nothing");
         set_weaponVerb("bash");
         set_weaponAttack(0);
         set_armorName("ethereal robes");
         set_armorDef(0);
         set_lust(30);
         bonusLust = 20;
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         createPerk(PerkLib.PhysicalResistance,0.6,0,0,0);
         createPerk(PerkLib.Immovable);
         additionalXP = 3200;
         set_gems(2500);
         checkMonster();
         prevHP = maxHP();
      }
      
      public function whitefire() : void
      {
         var _loc1_:Array = ["[say: 肉体是一个陷阱。没有出路。]","[say: 这个世界在燃烧。我们可以建立一个不朽的世界。]","[say: 他们试图回到他们的世界。我试图创造一个全新、更好的世界。]","[say: 活下去。向我证明你内心的火焰比你周围的更强大。]"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         outputText("\n那个灵体在空中挥了挥手。你脚下的地面开始摇晃，突然，一根巨大的蓝色火焰与闪电之柱喷涌而出！");
         if(Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,get_player().standardDodgeFunc(this,30),null,null)).attackFailed))
         {
            outputText("\n你及时跳开躲过了攻击！");
         }
         else
         {
            outputText("\n你没能及时躲开，被那无物不焚的魔法火焰烧伤了！");
            get_game().combat.monsterDamageType = "Fire";
            get_player().takeDamage((100 + Utils.rand(50)) * Math.pow(2,statusEffectv1(StatusEffects.Apotheosis)),true);
         }
      }
      
      public function summonFodder() : void
      {
         get_game().monsterArray.resize(1);
         outputText("\n这位空灵的巫师编织了一个强大的法术，在手中凝聚出一个发光的青色光球。他将其向下掷出，光球在强烈的闪光中爆炸了！");
         outputText("\n光球膨胀开来，从中出现了三个新的敌人！");
         outputText("\n[say: 看好了，勇者。我们的灵魂是一座熔炉，通过它我们可以重塑世界。测试你新获得力量的极限，将你的意志施加于那些低等生物之上吧。]");
         var _loc1_:Array = [new Amarok(),new GoblinElder(),new Phoenix(),new Valkyrie(),new Basilisk()];
         var _loc2_:int = Utils.rand(int(_loc1_.length));
         var _loc3_:String = "ethereal " + _loc1_[_loc2_].get_short();
         _loc1_[_loc2_].set_short(_loc3_);
         outputText("\n一个新的<b>" + _loc1_[_loc2_].get_short() + "</b>出现了！");
         get_game().monsterArray.push(_loc1_[_loc2_]);
         _loc1_.splice(_loc2_,1);
         _loc2_ = Utils.rand(int(_loc1_.length));
         _loc3_ = "ethereal " + _loc1_[_loc2_].get_short();
         _loc1_[_loc2_].set_short(_loc3_);
         outputText("\n一个新的<b>" + _loc1_[_loc2_].get_short() + "</b>出现了！");
         get_game().monsterArray.push(_loc1_[_loc2_]);
         _loc1_.splice(_loc2_,1);
         _loc2_ = Utils.rand(int(_loc1_.length));
         _loc3_ = "ethereal " + _loc1_[_loc2_].get_short();
         _loc1_[_loc2_].set_short(_loc3_);
         outputText("\n一个新的<b>" + _loc1_[_loc2_].get_short() + "</b>出现了！");
         get_game().monsterArray.push(_loc1_[_loc2_]);
         _loc1_.splice(_loc2_,1);
         get_game().monsterArray[1].tookAction = true;
         get_game().monsterArray[2].tookAction = true;
         get_game().monsterArray[3].tookAction = true;
         outputText("\n<b>劳伦提斯向后退去并在一旁观战，用一层坚不可摧的护盾将自己包围。</b>");
         createPerk(PerkLib.Invincible,0,0,0,0);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         summonedTurn = get_game().combat.combatRound;
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:Number = NaN;
         if(param1 == ReactionContext.AfterDamaged && get_HP() > 0)
         {
            get_game().output.text("\n[say: 真是微不足道。想说服现实我比你弱……你需要一个更有力的论点。]");
            _loc2_ = Math.round((prevHP - get_HP()) * 0.6);
            addHP(_loc2_);
            get_game().output.text(" <b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + _loc2_ + "</font>)</b>");
            prevHP = get_HP();
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:int = 0;
         if(int(get_game().monsterArray.length) > 1 && summonedTurn + 3 == get_game().combat.combatRound)
         {
            outputText("劳伦提斯再次走上前。他一挥手，所有被召唤出来的敌人都消失了，化作发光的蓝色尘埃流向这位巫师。他重新加入了战斗！");
            outputText("<b>劳伦提斯不再是无敌的了！</b>");
            _loc1_ = 1;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               if(get_game().monsterArray[_loc1_].get_HP() <= 0)
               {
                  outputText("\n劳伦提斯因为吸收了一只被击败的生物而受了伤。");
                  set_HP(get_HP() - 100);
                  outputText("<b>(<font color=\"" + get_game().mainViewManager.colorHpMinus() + "\">" + 100 + "</font>)</b>");
               }
               _loc1_++;
            }
            removePerk(PerkLib.Invincible);
            removePerk(PerkLib.StunImmune);
            get_game().combat.removeMonster(1,3);
            return;
         }
         if(hasPerk(PerkLib.Invincible))
         {
            outputText("劳伦提斯在一旁注视着。");
            return;
         }
         prevHP = get_HP();
         if(int(get_game().combat.combatRound % 4) == 0 && get_game().combat.combatRound != 0)
         {
            apotheosis();
            return;
         }
         if(statusEffectv1(StatusEffects.Apotheosis) >= 1 && int((get_game().combat.combatRound + 3) % 8) == 0 && get_game().combat.combatRound > 0)
         {
            summonFodder();
            return;
         }
         whitefire();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "表现出了欲望，但你怀疑他是否会因为纯粹的欲望而放弃战斗。");
      }
      
      override public function handleStun() : Boolean
      {
         if(int(get_game().combat.combatRound % 4) == 0 && get_game().combat.combatRound != 0 || statusEffectv1(StatusEffects.Apotheosis) >= 1 && summonedTurn == 0)
         {
            return true;
         }
         return Boolean(super.handleStun());
      }
      
      override public function handleFear() : Boolean
      {
         outputText("[say: 这个世界上没有什么能让我感到害怕，[name]。坚强你的心智，不要试图削弱我的意志。]");
         return true;
      }
      
      public function apotheosis() : void
      {
         switch(get_game().combat.combatRound)
         {
            case 4:
               outputText("[say: 是的，你很强大！在我的旅途中，我见过许多像你一样的人。未经雕琢的钻石，准备好被提炼，去接受神性之光。拥抱它吧！]");
               break;
            case 12:
               outputText("[say: 向我展示你的力量，巫师！释放你真正的潜能！征服现实，压倒它！]");
               break;
            case 20:
               outputText("[say: 你看到了吗？你的意志对物质位面施加的力量。重塑它，按照你的意志改造它，这是你的责任！]");
               break;
            default:
               outputText("[say: 是的！这股能量，这团火焰！这些是一个新世界的基石！这就是时空之轮运转的动力！]");
         }
         outputText("\n这个空灵的实体发出明亮的光芒，释放出一股奥术能量的脉冲！");
         outputText("\n法术击中了你，你非但没有受伤，反而感到豁然开朗；你与以太的联系更加紧密，脑海中充满了魔法知识！");
         outputText("\n<b>法术强度翻倍！</b>");
         outputText("\n<b>劳伦提斯的法术强度翻倍了！</b>");
         if(!get_player().hasStatusEffect(StatusEffects.Apotheosis))
         {
            get_player().createStatusEffect(StatusEffects.Apotheosis,1,0,0,0);
            createStatusEffect(StatusEffects.Apotheosis,1,0,0,0);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.Apotheosis,1,1);
            addStatusValue(StatusEffects.Apotheosis,1,1);
         }
      }
   }
}

