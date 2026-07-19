package classes.scenes.areas.forest
{
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class BaseKitsune extends Monster
   {
      
      public static var PHYSICAL_SKILL:String = "physical";
      
      public static var MAGICAL_SKILL:String = "magical";
      
      public static var SEAL_ATTACK:int = 0;
      
      public static var SEAL_TEASE:int = 1;
      
      public static var SEAL_SPELLS:int = 2;
      
      public static var SEAL_ITEMS:int = 3;
      
      public static var SEAL_MOVEMENT:int = 4;
      
      public static var SEAL_PHYSICAL:int = 5;
      
      public static var SEAL_MAGICAL:int = 6;
      
      public var sealTypes:Array;
      
      public function BaseKitsune()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         sealTypes = [0,1,2,3,4,5,6];
         super();
      }
      
      public function sealPlayerTease() : void
      {
         outputText("当狐妖不知从哪里出现在你面前，用指尖在你的胸口划过时，你大吃一惊。[Monster.he]画了一个小圈，留下了一个由火焰组成的、闪闪发光的符文。你突然发现，你所有关于诱惑和挑逗的知识都消失了。<b>狐妖的法术封印了你的挑逗能力！</b>看来在法术失效之前，你无法让任何人欲火焚身了。");
         get_player().createStatusEffect(StatusEffects.Sealed,4,1,0,0);
      }
      
      public function sealPlayerSpells() : void
      {
         outputText("[say: 哦，傻瓜，想在我的地盘打败我吗？]狐妖冷笑着说，[monster.he]突然出现在你面前，让你大吃一惊。[Monster.he]在你的嘴巴周围画了一个小圈，你发现自己变成了哑巴！你试图回忆起施法的神秘手势，却发现你也把它们忘了。<b>狐妖的法术封印了你的魔法！</b>在法术失效之前，你将无法施展任何法术。");
         get_player().createStatusEffect(StatusEffects.Sealed,4,2,0,0);
      }
      
      public function sealPlayerSpecial(param1:String) : void
      {
         outputText("当狐妖出现在你面前，羞涩地笑着时，你惊讶地跳了起来。当[monster.he]用[monster.his]指尖在你的额头上画了一个小圈时，你发现你突然不记得如何使用你的任何" + param1 + "技能了！");
         outputText("[pg][say: 哦，不，亲爱的，</i>我<i>才是这里花样最多的人。]");
         outputText("[pg]<b>狐妖的法术封印了你的" + param1 + "技能！</b>在法术失效之前，你将无法使用它们中的任何一个。");
         if(param1 == "physical")
         {
            get_player().createStatusEffect(StatusEffects.Sealed,4,5,0,0);
         }
         else if(param1 == "magical")
         {
            get_player().createStatusEffect(StatusEffects.Sealed,4,6,0,0);
         }
      }
      
      public function sealPlayerPhysicalSpecialSkills() : void
      {
         sealPlayerSpecial("physical");
      }
      
      public function sealPlayerMovement() : void
      {
         outputText("[say: 啧啧，这么快就走？]狐妖说着，突然出现在你面前。还没等你反应过来，[monster.he]就用[monster.his]指尖在你的胸口画了一个小圈，留下了一个由劈啪作响的蓝色火焰组成的闪光符文。你试图往另一个方向跑，但你的[legs]却一动不动！[pg][say: 抱歉宝贝，你只能留下来陪我玩了~。][monster.he]用唱歌般的语调说着，再次出现在你面前。<b>狐妖的法术阻止了你的逃跑！</b>你必须坚持到法术失效。");
         get_player().createStatusEffect(StatusEffects.Sealed,4,4,0,0);
      }
      
      public function sealPlayerMagicSpecialSkills() : void
      {
         sealPlayerSpecial("magical");
      }
      
      public function sealPlayerItems() : void
      {
         outputText("[say: 啧啧，使用物品？那可是作弊！]狐妖说着，[monster.he]突然出现在你面前，让你措手不及。[Monster.his]手指在你的[inv]上画了一个小圈，留下了一个由劈啪作响的火焰组成的闪光符文。无论你多么努力，似乎都无法将其撬开。<b>狐妖的法术封印了你的[inv]！</b>看来在法术失效之前，你无法使用任何物品了。");
         get_player().createStatusEffect(StatusEffects.Sealed,4,3,0,0);
      }
      
      public function sealPlayerAttack() : void
      {
         outputText("[Themonster]调皮地围着你转，羞涩地笑着。[Monster.he]不知怎么地就溜到了你够得着的地方，还没等你反应过来，就在你的胸口用[monster.his]指尖画了一个小圈。当你再次准备攻击时，[monster.he]留在你身上的燃烧符文发出耀眼的光芒，你的动作在半空中停住了。");
         outputText("[pg][say: 调皮调皮，你可得小心点。]");
         outputText("[pg]尽管你拼尽全力，每次你试图攻击[monster.him]时，你的肌肉都会不由自主地退缩，阻止你继续攻击。<b>狐妖的法术封印了你的攻击！</b>你必须等它失效后才能使用基本攻击。");
         get_player().createStatusEffect(StatusEffects.Sealed,4,0,0,0);
      }
      
      public function resistSeal() : void
      {
         outputText("[pg]随着你的触摸，封印消散了，你摆脱了狐妖的魔法！[Monster.he]失望地撅起嘴，看起来非常恼火，但很快又恢复了[monster.his]那副羞涩的骗子面孔。");
         get_player().removeStatusEffect(StatusEffects.Sealed);
      }
      
      public function kitsuneSealAttack(param1:int = -1) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc2_:int = calculateAttackResist();
         if(param1 >= 0)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc4_ = sealTypes;
            _loc3_ = int(_loc4_[Utils.rand(int(_loc4_.length))]);
         }
         switch(_loc3_)
         {
            case 0:
               sealPlayerAttack();
               break;
            case 1:
               sealPlayerTease();
               break;
            case 2:
               sealPlayerSpells();
               break;
            case 3:
               sealPlayerItems();
               break;
            case 4:
               sealPlayerMovement();
               break;
            case 5:
               sealPlayerPhysicalSpecialSkills();
               break;
            case 6:
               sealPlayerMagicSpecialSkills();
         }
         if(_loc2_ >= Utils.rand(100))
         {
            resistSeal();
         }
      }
      
      public function calculateAttackResist() : int
      {
         var _loc1_:int = 0;
         _loc1_ += int(Math.min(get_player().get_inte() / 2,40));
         if(get_player().hasPerk(PerkLib.Whispered))
         {
            _loc1_ += 20;
         }
         if(get_player().isReligious() && get_player().isPureEnough(20))
         {
            _loc1_ += int(20 - get_player().corAdjustedDown());
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails) || get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            _loc1_ += 30;
         }
         return _loc1_;
      }
   }
}

