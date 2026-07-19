package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class PhoenixSapper extends AbstractPhoenix
   {
      
      public function PhoenixSapper()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Phoenix Sapper");
         imageName = "phoenixmob";
         set_long("你面对着一排重装步兵，她们全副武装，身穿锁子甲，手持盾牌。她们看起来像是火蜥蜴和鹰身女妖的结合体，除了深红色的翅膀、长满鳞片的脚和长长的火焰尾巴外，其他部位都与人类无异。她们紧密地站在一起，形成一道盾墙，每个不死鸟都用塔盾保护着自己和身旁的战士。她们挥舞着弯刀，在房间里划出巨大的弧线，缓缓向你逼近。");
         set_plural(false);
         pronoun1 = "她";
         pronoun2 = "她";
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
         initStrTouSpeInte(60,60,100,40);
         initLibSensCor(40,45,50);
         set_weaponName("spears");
         set_weaponVerb("stab");
         set_weaponAttack(20);
         set_armorName("armor");
         set_armorDef(25);
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
         set_fatigue(0);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonMurdersPC();
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
                           outputText("没有了首领的命令，不死鸟破坏者不知道该怎么办了！");
                           return;
                        }
                        get_game().monsterArray[_loc1_].friendlyDanger = true;
                        break;
                     }
                  }
                  else if(Utils.rand(4) == 0)
                  {
                     outputText("没有了首领，不死鸟破坏者不知道该怎么办了！");
                     return;
                  }
               }
               _loc1_++;
            }
         }
         var _loc2_:MonsterAI = new MonsterAI().add(flashBang,1,ordered && !get_player().hasStatusEffect(StatusEffects.Blind),15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.add(armorRend,1,ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.add(eAttack,3,!ordered,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc2_.add(flashBang,1,!ordered && !get_player().hasStatusEffect(StatusEffects.Blind),15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.add(armorRend,1,!ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.exec();
         ordered = false;
      }
      
      override public function performCombatAction() : void
      {
         phoenixPlatoonAI();
      }
      
      public function flashBang() : void
      {
         set_fatigue(get_fatigue() + 15);
         outputText("不死鸟破坏者向你扔了一个黑色的小球。你拼命跳开，但它只是在地上无害地滚动。就在你放松警惕的时候，破坏者向小球吐出了一个小火球。[say:闪光弹，注意隐蔽！]");
         if(Utils.rand(3) != 0)
         {
            outputText("\n你没能及时捂住脸，球体爆炸发出难以置信的强光。你被<b>致盲了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,2 + Utils.rand(3),0,0,0);
         }
         else
         {
            outputText("\n在小球爆炸时，你护住自己并转过身去。你被强光炸得有些头晕，但除此之外毫发无伤。");
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonLosesToPC();
      }
      
      public function armorRend() : void
      {
         var _loc2_:Number = NaN;
         set_fatigue(get_fatigue() + 15);
         outputText("不死鸟破坏者冲出阵型，向前猛扑，用长矛发起了攻击！");
         var _loc1_:* = combatAvoidDamage(new AvoidDamageParameters(null,null,null,null,true,null,null,null));
         if(_loc1_.dodge != null)
         {
            outputText("你设法冲刺躲开了她的攻击。");
         }
         if(Boolean(_loc1_.block))
         {
            outputText("你设法举起盾牌，挡住了她的猛扑。");
         }
         if(Boolean(_loc1_.parry))
         {
            outputText("你迅速挥动[weapon]，格挡开了她长矛的尖端。");
         }
         if(Boolean(_loc1_.attackHit))
         {
            outputText("\n长矛刺穿了你的[armor]，撕开了一道痛苦的伤口！");
            _loc2_ = get_player().reduceDamage(Utils.rand(25) + get_str() + get_weaponAttack(),this);
            get_player().takeDamage(_loc2_,true);
            outputText("当她收回长矛时，你感到一阵头晕目眩，身体虚弱；矛尖有毒！");
            if(get_player().hasStatusEffect(StatusEffects.ArmorRent))
            {
               get_player().addStatusValue(StatusEffects.ArmorRent,1,5);
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.ArmorRent,5,0,0,0);
            }
         }
      }
   }
}

