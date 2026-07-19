package classes.scenes.dungeons.helDungeon
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class PhoenixCommander extends AbstractPhoenix
   {
      
      public function PhoenixCommander()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Phoenix Commander");
         imageName = "phoenixmob";
         set_long("你面对着一排重装步兵，她们全副武装，身穿锁子甲，手持盾牌。她们看起来像是火蜥蜴和鹰身女妖的结合体，除了深红色的翅膀、长满鳞片的脚和长长的火焰尾巴外，其他部位都与人类无异。她们紧密地站在一起，形成一道盾墙，每个不死鸟都用塔盾保护着自己和身旁的战士。她们挥舞着弯刀，在房间里划出巨大的弧线，缓缓向你逼近。");
         set_plural(false);
         pronoun1 = "她";
         pronoun2 = "她";
         pronoun3 = "她的";
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
         initStrTouSpeInte(70,60,120,80);
         initLibSensCor(40,45,50);
         set_weaponName("spears");
         set_weaponVerb("stab");
         set_weaponAttack(20);
         canBlock = true;
         set_shieldBlock(20);
         set_shieldName("熨斗盾");
         set_armorName("armor");
         set_armorDef(50);
         bonusHP = 450;
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
      
      public function protectMe() : void
      {
         outputText("不死鸟指挥官用长矛敲击盾牌。[say: 防御阵型！保护你们的指挥官！]\n排里的其他士兵靠拢过来，在他们的首领周围形成了一道防御盾墙！");
         set_armorDef(70);
         shieldWall = true;
      }
      
      public function phoenixPlatoonAI() : void
      {
         if(int(get_game().monsterArray.length) > 1)
         {
            order();
         }
         if(HPRatio() < 0.4 && !shieldWall)
         {
            protectMe();
            return;
         }
         if(int(get_game().monsterArray.length) > 1 && Utils.rand(3) == 1 && hasFatigue(15,2) && !goingSolo())
         {
            inspire();
            return;
         }
         outputText("\n");
         eAttack();
      }
      
      override public function performCombatAction() : void
      {
         phoenixPlatoonAI();
      }
      
      public function order() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(get_game().monsterArray.length))
         {
            if(get_game().monsterArray[_loc1_] is PhoenixGrenadier && get_game().monsterArray[_loc1_].get_HP() > 0 && get_game().monsterArray[_loc1_].get_fatigue() <= 85 && get_player().get_lust() / get_player().maxLust() > 0.5 && Utils.rand(2) == 1)
            {
               outputText("不死鸟指挥官举起握着长矛的手臂，大声喊道。[say: 掷弹兵！快把那个目标弄得欲火焚身，动作快！]");
               get_game().monsterArray[_loc1_].ordered = true;
               return;
            }
            if(get_game().monsterArray[_loc1_] is PhoenixPyro && get_game().monsterArray[_loc1_].get_HP() > 0 && get_game().monsterArray[_loc1_].get_fatigue() <= 85 && get_player().get_HP() / get_player().maxHP() < 0.4 && Utils.rand(2) == 1)
            {
               outputText("不死鸟指挥官举起握着长矛的手臂，大声喊道。[say: 派罗！我要那个目标立刻被烧焦！]");
               get_game().monsterArray[_loc1_].ordered = true;
               return;
            }
            if(get_game().monsterArray[_loc1_] is PhoenixSapper && get_game().monsterArray[_loc1_].get_HP() > 0 && get_game().monsterArray[_loc1_].get_fatigue() <= 85 && friendlyDanger && Utils.rand(2) == 1)
            {
               outputText("不死鸟指挥官举起握着长矛的手臂，大声喊道。[say: 破坏者！给我们制造点优势！]");
               get_game().monsterArray[_loc1_].ordered = true;
               friendlyDanger = false;
               return;
            }
            _loc1_++;
         }
      }
      
      public function inspire() : void
      {
         var _loc2_:* = null as Monster;
         var _loc3_:* = null as Monster;
         changeFatigue(15,2);
         outputText("不死鸟指挥官发出一声怒吼，引得其他成员也跟着咆哮起来！[say: 为了女王的荣耀，士兵们！给这只爬虫点颜色看看；让他尝尝放血和长矛的滋味！]\n剩下的士兵似乎受到了指挥官话语的鼓舞！");
         var _loc1_:int = 0;
         while(_loc1_ < int(get_game().monsterArray.length))
         {
            if(get_game().monsterArray[_loc1_].get_HP() > 0)
            {
               if(get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.Stunned) && Utils.rand(2) == 0)
               {
                  get_game().monsterArray[_loc1_].removeStatusEffect(StatusEffects.Stunned);
               }
               if(get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.Fear) && Utils.rand(2) == 0)
               {
                  get_game().monsterArray[_loc1_].removeStatusEffect(StatusEffects.Fear);
               }
               if(get_game().monsterArray[_loc1_].hasStatusEffect(StatusEffects.Whispered) && Utils.rand(2) == 0)
               {
                  get_game().monsterArray[_loc1_].removeStatusEffect(StatusEffects.Whispered);
               }
               _loc2_ = get_game().monsterArray[_loc1_];
               _loc2_.set_fatigue(_loc2_.get_fatigue() - 15);
               if(get_game().monsterArray[_loc1_].get_fatigue() < 0)
               {
                  get_game().monsterArray[_loc1_].set_fatigue(0);
               }
               _loc3_ = get_game().monsterArray[_loc1_];
               _loc3_.set_HP(_loc3_.get_HP() + get_game().monsterArray[_loc1_].maxHP() * 0.15);
               if(get_game().monsterArray[_loc1_].get_HP() > get_game().monsterArray[_loc1_].maxHP())
               {
                  get_game().monsterArray[_loc1_].set_HP(get_game().monsterArray[_loc1_].maxHP());
               }
            }
            _loc1_++;
         }
      }
      
      public function goingSolo() : Boolean
      {
         var _loc3_:* = null as Monster;
         var _loc1_:int = 0;
         var _loc2_:Array = get_game().monsterArray;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            if(_loc3_ != this && _loc3_.get_HP() > 0)
            {
               return false;
            }
         }
         return true;
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.heltower.phoenixPlatoonLosesToPC();
      }
   }
}

