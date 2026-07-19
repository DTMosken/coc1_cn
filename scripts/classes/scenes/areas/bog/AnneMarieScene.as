package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class AnneMarieScene extends BaseContent
   {
      
      public static var MET_ANNE:int = 1;
      
      public static var RUDE_TO_ANNE:int = 2;
      
      public function AnneMarieScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function mysteriousStranger() : void
      {
         outputText("\n在你的对手反应过来之前，你看到远处有枪口闪光。");
         if(Utils.rand(9) < 8)
         {
            outputText("[pg]一瞬间后，你的对手被什么东西击中了！一枚弹丸干净利落地穿透了[themonster]，以戏剧性的方式撕裂出一个伤口，巨大的动能导致[monster.him]踉跄了一下。");
            get_combat().doDamage(get_monster().reduceDamage(150 + Utils.rand(150),get_player(),50),true,true);
         }
         else
         {
            outputText("[pg]一瞬间后，你对手旁边的地面在猛烈冒烟的撞击下破裂并形成了一个坑！刚才擦过[monster.him]的东西如果击中，肯定会造成严重的伤害。");
         }
         outputText("\n然后你听到一声巨大的轰鸣声，就像一门巨炮——或者大炮——开火的声音。你可能真的有一个守护天使在看着你！[pg]");
      }
      
      public function encounterAnneMarie() : void
      {
         clearOutput();
         outputText("你尽己所能穿过茂密的沼泽，努力在泥泞和锋利的锯齿叶中穿行。");
         outputText("[pg]有什么东西引起了你的注意；一块隆起的土地，上面是一片坚实得多的土壤。在这个小岛的中心，有更令人感兴趣的东西；一个小木屋！");
         outputText("[pg]你走近小木屋，现在没有泥泞拖慢你的速度，行动起来容易多了。你绕着周围走了一圈，警惕任何潜在的伏击，但没有发现任何可疑之处。走进去，你注意到小木屋外面有一个冒烟的壁炉，还有一串浅浅的脚印通向房子；这个地方肯定有人住。你放慢脚步，不想引起小木屋主人的注意。");
         outputText("[pg]你小心翼翼地、有条不紊地移动，确保避开窗户，伸手去推小木屋的门。门在移动时发出嘎吱声，你透过越来越大的缝隙观察里面的小房间，希望能在这个居民发现你之前发现它。");
         outputText("[pg]门撞在木墙上，你挠了挠头，对里面空无一人感到困惑。你往里走了一步，听到头顶传来金属的咔哒声。你抬起头，倒吸了一口凉气。");
         doNext(continueConv);
      }
      
      public function encounter3wakeup() : void
      {
         clearOutput();
         outputText("你醒来时感觉到有虫子在脸上爬。你呻吟着从地上爬起来。你环顾四周；小屋里空无一人。你可能再也找不到那个充满敌意的女孩了。");
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function encounter2(param1:Boolean = true) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你慢慢举起双手，向那个倒挂着的女孩表明你无意伤害她。[say: 我是[name]。我对你没有恶意，我只是在探索。把子弹留给重要的人吧。]");
            outputText("你挑了挑眉，好奇她会作何反应。她眯起眼睛，思考着。[say: 好吧，[name]。你的好奇心迟早会害了你。放下武器，你可以进来了。]");
            outputText("[pg]你松了一口气，开始放下装备，那把大口径步枪的枪管一直指着你的头。当你的装备离你有一段安全距离时，她放下了武器，以惊人的敏捷跳回地面。");
            outputText("[pg]从这个角度，你可以更好地观察她。她相当矮，只有5英尺4英寸，你惊讶地发现她那把巨大的钢木步枪几乎和她一样高。她的腿比她瘦弱的手臂要粗壮得多，不过都被厚厚的皮革包裹着，就像她单薄的胸部一样，这让她呈现出明显的“梨形”身材。她的短发及至后颈，三缕刘海垂在脸颊两侧和额头上，形成一个“M”形。她头顶上那对又长又细、不时抽动的耳朵使她的整体形象更加完整，也让你看清了她的本质；她是一个蝙蝠兽人。");
            outputText("你打量着她的脸，注意到她似乎很生气，明亮的绿眼睛死死地盯着你。她显然想让你解释清楚。");
            outputText("[pg][say: 你为什么这么紧张？]你问她。[pg]她垂下眼睑，显然对这个问题感到错愕。[say: 真是个愚蠢的问题。这里的一切要么想伤害我，要么想强暴我，或者两者兼有。我必须时刻监视每一个游荡进我营地的生物，不管有没有理智。保持警惕才是我在这里活下去的资本。]");
            outputText("[pg]你理解地点了点头。[say: 可以理解。我在我的营地里也很难完全放松。]");
            outputText("[pg]听到这话，她的耳朵抽动了一下，眼睛也睁大了，第一次放下了戒备。[say: 你有营地？在哪里？你也不是本地人？]");
            outputText("[pg][say: 在这北边的森林里。那里的腐化少得多，居民也不太有敌意。即使有敌意的，嗯，也没那么危险。]");
            outputText("[pg]她把长着翅膀的手臂举到下巴处。你注意到她只有三根能用的手指；另外两根“手指”穿过翼膜延伸出去，大概是为了辅助飞行。[say:有意思。谢谢你的情报。]");
            outputText("[pg][say: 不客气。]");
            outputText("[pg][say: ……]她盯着你，想知道你为什么还没从她的视线中消失。");
            outputText("[pg]你咳嗽了一声，她的耳朵又抽动了一下。[say: 你看起来很紧张。]");
            outputText("[pg][say: 观察力很敏锐。是的。我很紧张。我现在想让你离开。]");
            outputText("[pg][say: 为什么？]你问道，此时已经被推出了她的小屋。");
            outputText("[pg][say: 我没必要回答你。走开。]她在你身后关上门，把你的装备从窗户扔了出来。你一边清理装备上的泥巴一边嘟囔着。也许她下次会友好一点。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2681,1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你握紧拳头，准备攻击。[say: 如果你开枪，最好别打偏。你不会有开第二枪的机会。]");
            outputText("[pg]她短促地笑了一声。[say: 谢谢你的警告。我不会的。]");
            outputText("[pg]你试图抓住步枪的枪管，在她开火前把它推开。令你惊讶的是，你成功了，但这毫无意义，因为女孩已经松开了武器。相反，她从口袋里拿出一个装满冒泡液体的黑色玻璃球，扔在地上。");
            outputText("[pg]在你捂住眼睛之前，玻璃球破裂了，周围的氧气与液体发生反应，产生巨大的强光，让你完全失明。然后你感觉到她的步枪枪托击中了你的胸部，接着又击中了你的头部，导致你迅速倒在地上。");
            outputText("[pg]你昏迷前听到的最后一句话是[say: 操。我得换个地方。]");
            doNext(encounter3wakeup);
         }
      }
      
      public function continueConv() : void
      {
         var kind1:Boolean;
         var _g1:AnneMarieScene;
         var kind:Boolean;
         var _g:AnneMarieScene;
         clearOutput();
         outputText("[pg]离你眼睛只有几英寸的地方，是一把步枪的枪口。而且不是什么好兆头。你因警惕而僵在原地，试图打量这把大枪的主人。奇怪的是，她倒挂在小屋的顶部；那是一个深灰色的女人，留着黑色短发。由于金属物体挡住了视线，你看不清太多细节，但你注意到她的手臂精瘦而结实，有一层薄膜连接着她的躯干，形成了一对没有羽毛的翅膀。她的脖子上覆盖着一簇毛茸茸的皮毛，让你想起一条别致的围巾。她的深色皮甲上布满了缝制精细的口袋和枪套，里面装着各种武器、独特的装置和装有未知液体的瓶子。皮甲的设计很奇特，显然是为了适应她那双看起来不同寻常的手臂。");
         outputText("[pg][say: 你。把手放在我能看到的地方。我<b>是认真的</b>。你是谁？]——她沙哑的声音把你从恍惚中拉了回来，提醒你目前的处境。");
         outputText("[pg]你可以试着说服她不要开枪，或者试着教训她一下，让她知道拿枪指着你会有什么下场。");
         menu();
         _g = this;
         kind = true;
         addButton(0,"不伤害",function():void
         {
            _g.encounter2(kind);
         }).hint("最好不要激怒那个把上膛的枪指着你额头的人。");
         _g1 = this;
         kind1 = false;
         addButton(1,"别打偏",function():void
         {
            _g1.encounter2(kind1);
         }).hint("如果她开枪，最好别打偏。你可不会容忍这种随便的人。");
      }
   }
}

