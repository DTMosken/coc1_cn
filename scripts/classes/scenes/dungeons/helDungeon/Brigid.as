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
   
   public class Brigid extends Monster
   {
      
      public function Brigid()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Brigid the Jailer");
         imageName = "brigid";
         set_long("布里吉特是一只怪物般的鹰身女妖，比你见过的任何一只都要高出一英尺。她身上打满了穿孔，染成粉色的头发被剃成了长长的莫西干头。她浑身赤裸，除了右手拿着的烧红的拨火棍和左手拿着的盾牌，盾牌下面挂着的牢房钥匙让她每走一步都会发出叮当的响声。");
         set_race("Harpy");
         createVagina(false,5,2);
         createStatusEffect(StatusEffects.BonusVCapacity,13,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         set_tallness(Utils.rand(8) + 70);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "red";
         hair.color = "black";
         hair.length = 15;
         initStrTouSpeInte(90,60,120,40);
         initLibSensCor(40,45,50);
         set_weaponName("poker");
         set_weaponVerb("burning stab");
         set_weaponAttack(30);
         set_armorName("armor");
         set_armorDef(20);
         bonusHP = 1000;
         set_lust(20);
         lustVuln = 0.25;
         temperment = 3;
         level = 19;
         set_gems(Utils.rand(25) + 140);
         additionalXP = 50;
         wings.type = 9;
         tail.type = 3;
         horns.type = 1;
         horns.value = 2;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().brigidScene.pcDefeatedByBrigid();
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(get_player().hasStatusEffect(StatusEffects.Stunned))
         {
            get_player().removeStatusEffect(StatusEffects.Stunned);
            _loc1_.add(BrigidAssGrind,0.25,true,5,FATIGUE_NONE,CombatRange.Tease);
            _loc1_.add(brigidPoke,0.75,true,0,FATIGUE_NONE,CombatRange.Melee);
            _loc1_.exec();
            return;
         }
         _loc1_.add(BrigidAssGrind,0.25,true,5,FATIGUE_PHYSICAL,CombatRange.Tease);
         _loc1_.add(brigidBop,0.33,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(brigidPoke,0.42,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().brigidScene.pcDefeatsBrigid();
      }
      
      public function brigidPoke() : void
      {
         outputText("布里吉特自信地大步向前，她的盾牌吸收了你的防御性打击，直到她来到你面前。她把你的[weapon]拨到一边，用她滚烫的拨火棍猛击你，烫伤了你的[skin]，让你踉跄后退。");
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ < 30)
         {
            _loc1_ = 30;
         }
         get_player().takeDamage(_loc1_,true);
      }
      
      public function brigidBop() : void
      {
         outputText("鹰身女妖用她的拨火棍向你虚晃一招；你躲过了攻击，但当你转身时，她用沉重的盾牌猛击你，让你失去平衡，暴露了破绽。");
         var _loc1_:Number = 5;
         get_player().takeDamage(_loc1_,true);
         if(!get_player().stun(0,100))
         {
            outputText("[pg-]当然，你坚定的姿态让她无法真正使你失去行动能力。");
         }
      }
      
      public function BrigidAssGrind() : void
      {
         outputText("布里吉特咧嘴笑着向你逼近。她轻松地挡开了你几次防御性的攻击，一把抓住你的肩膀。她强迫你跪下，还没等你眨眼，她就转过身，把你的脸按进了她的屁股里！[say:嗯，你喜欢这样，不是吗？]她低吼着，用她那巨大柔软的屁股在你的脸上摩擦，让你近距离亲身感受她那适合产卵的丰臀。");
         get_player().takeLustDamage(30,true);
      }
   }
}

