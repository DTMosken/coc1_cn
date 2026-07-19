package classes.items.armors
{
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class NephilaQueensGown extends Armor
   {
      
      public function NephilaQueensGown()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("NQ.Gwn","Nephila Gown","Nephila Queen\'s Gown","a baroque and unwieldy gown",18,200,"As you look at the seeming miles of dark purple silk that make up the gown, you can\'t help but imagine your nephila queen self wearing it. In your mind\'s eye, it clings to you obscenely. A pale, oozelike full body corset wraps around it. Shimmering like mother-of-pearl, the corset depicts a trio of women cupping and worshipping your breasts, hips, and one thigh. The corset is interleaved with an external bustle that bulges absurdly, taking the appearance of a hyperpregnant angel--her four wings spilling over the flanks of your prodigious, tentacle packed belly. The angel-bustle\'s legs are spread, and a train of frilled purple fabric spills out from her wrought mother-of-pearl pussy, trailing behind you for several yards and obscuring the existence of your swarming tentacle palanquin. The ensemble is heavy and encumbering, but sings with power.","Heavy");
         boost("法术修正",NumberFunc_Impl_.fromFloatFun(getSpellBonus),false);
         boost("最低欲望",NumberFunc_Impl_.fromFloatFun(getLustBonus),false);
      }
      
      override public function useText() : void
      {
         switch(get_player().get_gender())
         {
            case 1:
               outputText("你将络新妇女王长裙从头套到脚。它在你周围游动，看起来很滑稽，还阻碍了你的行动。你感受到了你涅菲拉女儿们的思想和情感。曾经这会给你带来欢乐，但现在被这些可怕寄生虫注视的感觉让你毛骨悚然。你心中充满了深深的不安。");
               break;
            case 2:
               outputText("你舒服地滑进络新妇女王长裙中。你转了几个圈，开心地咯咯笑着，让你的裙摆卷起来向你靠拢，然后你的触手后代将它扶正，让布料向外翻滚，漂浮在蠕动的垫子上。你涅菲拉女儿们的思想和情感从长裙上浮雕的珍珠母配饰中渗入你的体内，让你充满与所爱之人接触的温暖感觉。");
               break;
            default:
               outputText("你舒服地滑进络新妇女王长裙中。你转了几个圈，开心地咯咯笑着，让你的裙摆卷起来向你靠拢，然后你的触手后代将它扶正，让布料向外翻滚，漂浮在蠕动的垫子上。你涅菲拉女儿们的思想和情感从长裙上浮雕的珍珠母配饰中渗入你的体内，让你充满与所爱之人接触的温暖感觉。");
         }
         if(get_player().hasCock())
         {
            outputText("这件裙子非常宽大，即使你的[cock]通常会露出来，现在也被隐藏起来了。\n");
         }
      }
      
      override public function get_supportsBulge() : Boolean
      {
         return true;
      }
      
      override public function get_def() : Number
      {
         return 10 + int(get_player().statusEffectv1(StatusEffects.ParasiteNephila) / 2);
      }
      
      public function getSpellBonus() : Number
      {
         var _loc1_:Boolean = get_player().hasStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
         if(_loc1_)
         {
            return 10 + int(get_player().statusEffectv1(StatusEffects.ParasiteNephila) * 3);
         }
         return 10;
      }
      
      public function getLustBonus() : Number
      {
         var _loc1_:Boolean = get_player().hasStatusEffect(StatusEffects.ParasiteNephilaNeedCum);
         if(_loc1_)
         {
            return -10 - int(get_player().statusEffectv1(StatusEffects.ParasiteNephila));
         }
         return -10;
      }
   }
}

