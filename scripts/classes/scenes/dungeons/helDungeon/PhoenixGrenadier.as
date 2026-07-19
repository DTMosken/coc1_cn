package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class PhoenixGrenadier extends AbstractPhoenix
   {
      
      public function PhoenixGrenadier()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Phoenix Grenadier");
         imageName = "phoenixmob";
         set_long("你面对着一排重装步兵，她们全副武装，身穿锁子甲，手持盾牌。她们看起来像是火蜥蜴和鹰身女妖的混合体，除了深红色的翅膀、长满鳞片的脚和长长的火焰尾巴外，其他部分都像人类。她们紧密地站成一排盾墙，每只不死鸟都用塔盾保护着自己和身旁的战士。她们的弯刀在房间里挥舞出巨大的弧线，缓缓向你逼近。");
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
         initStrTouSpeInte(60,60,120,40);
         initLibSensCor(40,45,50);
         set_weaponName("spears");
         set_weaponVerb("stab");
         set_armorName("armor");
         set_armorDef(30);
         bonusHP = 100;
         set_lust(20);
         lustVuln = 0.3;
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
      
      public function phoenixPlatoonLustbang() : void
      {
         outputText("[say: 催情弹，卧倒！]最后面的一只不死鸟大喊道，所有其他战士立刻躲到盾牌后面。一个巨大的玻璃球从盾墙后滚了出来，随即爆炸成一大团粉红色的烟雾。你咳嗽着挥舞手臂，但当烟雾散去时，你感到头晕目眩，欲火焚身，几乎无法抗拒扑向不死鸟们，乞求他们肉棒和阴户的冲动。");
         get_player().takeLustDamage(23);
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
                           outputText("没有了首领的命令，不死鸟掷弹兵不知道该怎么办了！");
                           return;
                        }
                        get_game().monsterArray[_loc1_].friendlyDanger = true;
                        break;
                     }
                  }
                  else if(Utils.rand(4) == 0)
                  {
                     outputText("没有了首领，不死鸟掷弹兵不知道该怎么办了！");
                     return;
                  }
               }
               _loc1_++;
            }
         }
         var _loc2_:MonsterAI = new MonsterAI().add(phoenixPlatoonLustbang,1,ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc2_.add(eAttack,3,!ordered,0,FATIGUE_NONE,CombatRange.Melee);
         _loc2_.add(phoenixPlatoonLustbang,1,!ordered,15,FATIGUE_PHYSICAL,CombatRange.Ranged);
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

