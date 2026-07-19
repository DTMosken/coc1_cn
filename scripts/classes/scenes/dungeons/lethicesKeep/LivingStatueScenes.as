package classes.scenes.dungeons.lethicesKeep
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class LivingStatueScenes extends BaseContent
   {
      
      public function LivingStatueScenes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function takeTheStone() : void
      {
         clearOutput();
         outputText("你小心翼翼地穿过坑坑洼洼的废墟去领取你的战利品。那是一块莱希石，");
         if(get_player().hasKeyItem("Marae\'s Lethicite"))
         {
            outputText("简直和玛莱的那块一样大。");
         }
         else
         {
            outputText("就像工厂里的紫色水晶一样，只是这块有它的三倍大。");
         }
         outputText("[pg]<b>获得莱希石！</b>");
         get_player().createKeyItem("Stone Statue Lethicite",0,0,0,0);
         get_combat().cleanupAfterCombat(get_game().dungeons.resumeFromFight);
      }
      
      public function fuckinMarbleOP(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         outputText("你颓然跪倒在地，不堪重负，甚至看不见落下的战锤的阴影。你最后的念头充满了悔恨。");
         get_game().gameOver();
      }
      
      public function encounter() : void
      {
         clearOutput();
         outputText("当你靠近时，巨大的雕像发出一声沉闷的呻吟并开始颤抖，抖落了多年的灰尘和污垢。几只乌鸦被从栖息地惊飞，发出惊恐的叫声。你后退一步，看着这个庞然大物撑起身体站了起来。它高耸入云，至少有三十英尺高，轻松地举起一把由与它闪闪发光的肌肉相同的纯白大理石雕刻而成的战锤。");
         if(get_silly())
         {
            outputText("往好处想，它似乎没有膝盖。这应该能让你更容易躲避它的攻击。");
         }
         outputText("苔藓附着在它的下巴上，就像岁月赐予的胡须。当它说话时，一些苔藓被抖落下来。[say:入侵者！]");
         outputText("[pg]这个庞然大物大步向你走来，将战锤高举过头顶。灰尘从它无缝的关节处倾泻而下，只有当它靠近时，你才发现它表面有麻点和几乎看不见的裂纹，这些都是它年代久远的标志。如果你想活命，就必须与这个雪白的破坏者战斗！");
         startCombat(new LivingStatue());
      }
      
      public function beatUpDaStatue(param1:Boolean) : void
      {
         clearOutput();
         outputText("裂纹从你最后一次攻击的地方呈蜘蛛网状散开，像野火一样蔓延到石巨人的表面。它痛苦地呻吟着，脸慢慢僵住，定格在一个非人痛苦的鬼脸中，然后整个身体分崩离析。大块的大理石掉落下来，扬起一阵白色的灰尘和泥土。当尘土散去，只剩下两只齐踝断裂的大理石脚，矗立在一片废墟之中。");
         outputText("[pg]中心一块闪闪发光的紫色石头吸引了你的目光。");
         menu();
         addButton(0,"拿走石头",takeTheStone);
      }
   }
}

