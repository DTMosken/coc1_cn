package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class PhoenixPyro extends AbstractPhoenix
   {
      
      public function PhoenixPyro()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Phoenix Pyro");
         imageName = "phoenixmob";
         set_long("你面对着一排重装步兵，她们全副武装，身穿锁子甲，手持盾牌。她们看起来像是火蜥蜴和鹰身女妖的混血儿，除了深红色的翅膀、长满鳞片的脚和长长的火焰尾巴外，其他地方都像人类。她们站成一排紧密的盾墙，每个不死鸟都用塔盾保护着自己和身旁的战士。她们的弯刀在房间里划出巨大的弧线，慢慢向你逼近。");
         set_plural(false);
         pronoun1 = "she";
         pronoun2 = "her";
         pronoun3 = "her";
         createCock();
         balls = 2;
         ballSize = 1;
         cumMultiplier = 3;
         createVagina(false,5,2);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         lowerBody.type = 10;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(70,60,120,40);
         initLibSensCor(40,45,50);
         set_weaponName("spears");
         set_weaponVerb("stab");
         set_weaponAttack(40);
         set_armorName("armor");
         set_armorDef(50);
         bonusHP = 200;
         set_lust(20);
         lustVuln = 0.15;
         temperment = 3;
         level = 20;
         set_gems(Utils.rand(25) + 160);
         additionalXP = 50;
         horns.type = 3;
         horns.value = 2;
         tail.type = 11;
         wings.type = 9;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonMurdersPC();
      }
      
      public function phoenixPlatoonFireBreath() : void
      {
         outputText("突然，盾墙分开了，露出了小队中的一名成员，一个特别强壮的女孩，正勃起着。还没等你弄明白发生了什么，她就向后仰起身子，对着你呼气。令你惊恐的是，一大股火焰从她口中喷出，向你滚来。你赶紧扑倒，但还是被部分卷入了火海。");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:Number = 60 + Utils.rand(50);
         if(get_player().get_shield() == get_game().shields.DRGNSHL && Utils.rand(2) == 0)
         {
            outputText("\n你及时举起了龙壳盾，它非常轻松地吸收了这股火焰。");
         }
         else
         {
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function phoenixPlatoonAI() : void
      {
         var _loc1_:int = 0;
         if(int(get_game().monsterArray.length) > 1)
         {
            _loc1_ = 0;
            while(_loc1_ < int(get_game().monsterArray.length))
            {
               if(get_game().monsterArray[_loc1_] is PhoenixCommander)
               {
                  if(get_game().monsterArray[_loc1_].get_HP() > 0)
                  {
                     if(get_HP() / maxHP() < 0.5)
                     {
                        if(get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.Stunned) || get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.Fear))
                        {
                           outputText("没有首领的命令，派罗不知道该怎么办！");
                           return;
                        }
                        get_game().monsterArray[_loc1_].friendlyDanger = true;
                        break;
                     }
                  }
                  else if(Utils.rand(4) == 0)
                  {
                     outputText("没有首领，派罗不知道该怎么办！");
                     return;
                  }
               }
               _loc1_++;
            }
         }
         var _loc2_:MonsterAI = new MonsterAI().add(phoenixPlatoonFireBreath,1,ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.add(eAttack,3,!ordered,0,FATIGUE_NONE,CombatRange.Melee);
         _loc2_.add(phoenixPlatoonFireBreath,1,!ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.exec();
         ordered = false;
      }
      
      override public function performCombatAction() : void
      {
         phoenixPlatoonAI();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonLosesToPC();
      }
   }
}

