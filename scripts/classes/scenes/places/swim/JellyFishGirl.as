package classes.scenes.places.swim
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   import haxe.IMap;
   
   public class JellyFishGirl extends Monster
   {
      
      public function JellyFishGirl(param1:String = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("jelly-girl");
         imageName = "jellygirl";
         set_long("与陆地上的黏液女孩不同，这种生物半透明的" + param2 + "身体大部分集中在顶部，呈伞帽状，包裹着一个红宝石般的细胞核。伞帽下悬挂着一个娇小可爱的[if (allowChild) {女孩|迷你女人}]，她小巧的体型与周围垂下的众多黏糊糊的危险触手形成了鲜明对比。");
         set_race("Jellyfish-Girl");
         createVagina(false,1,0);
         ass.analLooseness = 0;
         ass.analWetness = 0;
         set_tallness(36);
         if(get_game().get_allowBaby() || get_game().get_allowChild())
         {
            createBreastRow(Appearance.breastCupInverse("flat"));
         }
         else
         {
            createBreastRow(Appearance.breastCupInverse("A"));
         }
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = param2;
         hair.color = param1;
         hair.length = 16;
         initStrTouSpeInte(40,25,50,10);
         initLibSensCor(75,35,40);
         set_weaponName("tentacles");
         set_weaponVerb("tentacles");
         set_weaponAttack(7);
         set_armorName("tough skin");
         set_armorDef(5);
         bonusHP = 50;
         set_lust(10);
         lustVuln = 0.9;
         temperment = 2;
         level = 4;
         set_fireRes(0.3);
         set_gems(Utils.rand(15) + 5);
         set_drop(new ChainedDrop().add(get_weapons().PIPE,0.1).add(get_consumables().SLIMYCL,0.5).elseDrop(get_useables().GREENGL));
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().swim.jellyFishGirlScene.jellyLossChoices(param1);
      }
      
      override public function struggle() : void
      {
         if(!get_player().hasStatusEffect(StatusEffects.Grappled))
         {
            return;
         }
         clearOutput();
         if(Utils.trueOnceInN(3) || Utils.randomChance(get_player().get_str() * 1.25))
         {
            outputText("你在她的抓握中挣扎扭动，找准机会将你的[weapon]刺入凝胶女的伞帽内，击中了那颗红宝石核心！她痛呼一声，满脸震惊地松开了你。");
            get_player().removeStatusEffect(StatusEffects.Grappled);
            takeDamage(get_player().get_str() / 10 + Utils.rand(10));
         }
         else
         {
            outputText("你的挣扎扯断了一两根触手，但这无济于事，你依然被死死缠住。");
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:int = 0;
         switch(param1.index)
         {
            case 4:
               if(get_player().hasStatusEffect(StatusEffects.ChargeWeapon) && get_game().combat.lastAbilityUsed.isWeaponAbility)
               {
                  outputText("[pg-]能量穿过凝胶女孩的身体，她的薄膜随之颤抖。");
                  _loc2_ = int(Math.round(takeDamage(get_player().statusEffectv1(StatusEffects.ChargeWeapon))));
                  outputText(get_game().combat.getDamageText(_loc2_));
               }
               return true;
            case 7:
               jellyGrapple();
               return !get_player().hasStatusEffect(StatusEffects.Grappled);
            case 9:
               addHP(get_lust() / 5);
               return true;
            default:
               return true;
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,3,true,0,FATIGUE_NONE,CombatRange.Melee);
         if(get_player().hasStatusEffect(StatusEffects.Grappled))
         {
            _loc1_.add(molestPlayer,5,true,0,FATIGUE_NONE,CombatRange.Melee);
         }
         else
         {
            _loc1_.add(jellyGrapple,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         }
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         outputText("凝胶女旋转着她的伞帽，向你挥舞起触手！");
         if(FlagDict_Impl_.arrayReadInt(get_flags(),2138) > 0)
         {
            outputText("[b:暴击！]");
         }
         outputText(get_game().combat.getDamageText(param1));
      }
      
      public function molestPlayer() : void
      {
         if(get_player().statusEffectv2(StatusEffects.Grappled) > 1)
         {
            outputText("凝胶女用舌头在你身上留下一道滑腻的痕迹，同时她的小手抚摸着你的身体。");
         }
         else if(get_player().statusEffectv2(StatusEffects.Grappled) == 1)
         {
            outputText("那个[if (allowbaby) {蹒跚学步般大小的|矮胖小巧的}]史莱姆女孩用天真的眼神看着你，开始舔舐你的身体！");
         }
         else
         {
            if(get_player().hasWaited())
            {
               outputText("你保存体力，任由那些猥亵的丝带将你缠绕。");
            }
            else
            {
               outputText("你越是挣扎，就越是被无数的丝带和细线紧紧缠绕。");
            }
            outputText("凝胶女将你拉近，她矮胖的小身体开始在你的身上探索起来！");
         }
         var _loc1_:Number = Utils.randBetween(3,6) + (get_player().sens + get_player().cor + get_player().lib) / 100;
         var _loc2_:Number = Utils.rand(6);
         _loc2_ += 2.5 * get_player().statusEffectv2(StatusEffects.Grappled);
         get_player().takeLustDamage(_loc1_ * _loc2_,true);
         if(get_player().statusEffectv2(StatusEffects.Grappled) < 2)
         {
            get_player().addStatusValue(StatusEffects.Grappled,2,1);
         }
      }
      
      public function jellyGrapple() : void
      {
         outputText("[pg]丝带般的触手像被水流带动一样飘浮到你身侧，你移动时排开的水流也将它们拉向你。");
         if(Utils.trueOnceInN(2) || Utils.randomChance(get_player().get_str() * 1.25))
         {
            outputText("无论你怎么努力游走，都无法逃脱，像被网住一样被它缠住！");
            get_player().createStatusEffect(StatusEffects.Grappled,0,0);
         }
         else
         {
            outputText("幸运的是，你用力一推[if (isMer) {你的鳍}]，借着水流扫开了逼近的触手。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().swim.jellyFishGirlScene.jellyWinChoices(param1);
      }
   }
}

