package classes.scenes.dungeons.wizardTower
{
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class ArchitectJeremiah extends Monster
   {
      
      public function ArchitectJeremiah()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("Architect Jeremiah");
         imageName = "archJeremiah";
         set_long("");
         initStrTouSpeInte(40,150,50,140);
         initLibSensCor(60,60,0);
         lustVuln = 0;
         set_tallness(72);
         createBreastRow(0,1);
         initGenderless();
         set_drop(NO_DROP);
         ignoreLust = true;
         level = 22;
         bonusHP = 4000;
         set_weaponName("nothing");
         set_weaponVerb("bash");
         set_weaponAttack(0);
         set_armorName("cracked stone");
         set_armorDef(100);
         set_lust(30);
         bonusLust = 20;
         additionalXP = 1000;
         set_gems(250 + Utils.rand(250));
         createPerk(PerkLib.PoisonImmune,0,0,0,0);
         createPerk(PerkLib.BleedImmune,0,0,0,0);
         checkMonster();
      }
      
      override public function replacesDescribeAttacked(param1:Weapon, param2:int, param3:Boolean = false) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1.isChanneling())
         {
            _loc4_ = param2 < 15 || param2 < maxHP() * 0.05;
            _loc5_ = param2 < 50 || param2 < maxHP() * 0.2;
            _loc6_ = param2 < 100 || param2 < maxHP() * 0.33;
            if(param2 <= 0)
            {
               outputText("你的" + param1.get_attackNoun() + "被" + get_themonster() + "弹开，没有造成任何伤害。");
            }
            else if(_loc4_)
            {
               outputText("你对" + get_themonster() + "造成了擦伤！");
            }
            else if(_loc5_)
            {
               outputText("你" + param1.get_attackVerb() + "了" + get_themonster() + "，把" + pronoun2 + "打得碎片四溅！");
            }
            else if(_loc6_)
            {
               outputText(get_Themonster() + "在你强力的" + param1.get_attackNoun() + "下碎裂了！");
            }
            else
            {
               outputText("你用强力的" + param1.get_attackNoun() + "[b:粉碎]了" + get_themonster() + "！");
            }
            if(param3)
            {
               outputText("[b:暴击！]");
            }
            outputText(get_game().combat.getDamageText(param2));
            return true;
         }
         return false;
      }
      
      public function rebuild() : void
      {
         var _loc4_:* = null as Monster;
         var _loc1_:Array = ["[say: 真没礼貌。首先，恶魔毁了我们的贞操。现在，又毁了我们的礼仪。]","[say: 维尔库斯很快就完事了。到时候你可以让他来惩罚你。他会做得<b>非常</b>彻底的。]","[say: 啊，痛苦。这是记住你人性的好方法！你正在伤害我，对吧？]","[say: 我给你看过我的雕像了吗？我真的很喜欢它们。这就像永远活着！或者永远死去。常见的误解。]"];
         if(get_player().demonScore() > 3)
         {
            _loc1_.push("[say: 你是恶魔吗？维尔库斯说过我们要把他们全部消灭。啊！你是来<b>被</b>消灭的！这就说得通了。]");
         }
         if(get_game().combat.damageType == "MagicalM" || get_game().combat.damageType == "MagicalR")
         {
            _loc1_.push("[say: 同道中人！你是来了解我的雕像的，对吧？嗯，有很多可以谈的。奥术符文，炼金材料，正确的月相，还有——啊，你好啊！]");
         }
         if(get_player().isNaga() && get_player().nagaScore() > 2 && get_player().get_gender() > 1)
         {
            _loc1_.push("[say: 哎呀。我一直很喜欢娜迦。幸好我什么感觉都没有，否则我现在就要打破好几个誓言了。]");
         }
         set_armorDef(100);
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         outputText("\n耶利米得意地笑着，身上闪烁着魔法能量的脉动，使房间里的大理石碎片加速重组。");
         var _loc2_:int = 0;
         var _loc3_:Array = get_game().monsterArray;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(_loc4_ is IncubusStatue || _loc4_ is SuccubusStatue || _loc4_ is ImpStatue)
            {
               _loc4_.addHP(100);
               outputText("\n[Themonster]被治愈了！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">" + Math.round(100) + "</font>)</b>");
            }
         }
         outputText("<b>\n耶利米的护甲恢复了！</b>");
      }
      
      override public function performCombatAction() : void
      {
         rebuild();
      }
      
      override public function outputDefaultTeaseReaction(param1:Number) : void
      {
         if(param1 == 0)
         {
            outputText("[pg]" + get_capitalA() + Utils.cnName(get_short()) + "似乎没有受到任何影响。");
         }
         outputText("[pg][say: 噢，你，想通过挑逗让我屈服。谢谢你的表演，但不行。]");
         if(get_lust() >= maxLust())
         {
            set_lust(0);
         }
      }
      
      override public function handleFear() : Boolean
      {
         return true;
      }
   }
}

