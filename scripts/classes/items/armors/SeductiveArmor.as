package classes.items.armors
{
   import classes.CoC;
   import classes.Player;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Equippable;
   import flash.Boot;
   
   public final class SeductiveArmor extends Armor
   {
      
      public function SeductiveArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SeductA","SeductiveArmor","scandalously seductive armor","a set of scandalously seductive armor",0,1,"A complete suit of scalemail shaped to hug tightly against every curve, it has a solid steel chest-plate with obscenely large nipples molded into it. The armor does nothing to cover the backside, exposing the wearer\'s cheeks to the world.","Heavy");
      }
      
      override public function useText() : void
      {
         if(!get_game().ceraphFollowerScene.ceraphIsFollower())
         {
            outputText("在费力地穿上它之后，你感觉到这件暴露的新盔甲发生了突然的变化。令你恐惧的是，它开始向内折叠，暴露出越来越多的[skindesc][if (hasuppergarment || haslowergarment) {以及你穿在里面的内衣}]。变形的盔甲逐渐覆盖得越来越少，直到只剩下一对巨大的乳贴和一条银链。一声响亮的“咔嚓”声吓了你一跳，然后你尖叫起来，因为你感觉到有什么东西刺穿了你的乳头。在突如其来的剧痛中，你扭动着身体，鸡皮疙瘩爬满了你的肌肤。[pg]");
            outputText("在你有了喘息的机会后，你检查了受虐的乳头，发现你的盔甲已经完全消失了。唯一留下的就是一对无缝的黑色乳钉，嵌在你脆弱的肉体里。似乎也没有任何方法可以取下它们。[if (hasuppergarment || haslowergarment) {谢天谢地，你的内衣似乎没有受到盔甲突然消失的影响。}]不得不光着身子到处跑的念头顽固地锁在你的脑海里，你在心里咒骂着那个恶魔对你所做的一切。[pg]");
            outputText("仿佛是被你的想法召唤而来，你能听到她的声音在风中回荡，再次嘲弄着你，[say: 好好享受你新的束缚癖吧，小宠物！再穿一个孔，你就准备就绪了。被绑起来操的时候可别太开心了，好吗？][pg]");
            if(get_player().nipplesPierced > 0)
            {
               outputText("你只能暗自纳闷——以前的穿孔都去哪儿了？[pg]");
            }
            get_player().nipplesPierced = 1;
            get_player().nipplesPShort = "无缝黑色乳头钉";
            get_player().nipplesPLong = "无缝黑色乳钉";
            while(!get_game().ceraphScene.hasBondage())
            {
               get_game().ceraphScene.giveFetish();
            }
         }
         else
         {
            outputText("正当你试图穿上这件盔甲时，塞拉芙不知从哪里冒了出来，连声道歉，并在你扣上最后一条带子之前阻止了你。[say: 请不要穿那个，" + get_player().mf("主人","女主人") + "。我在那件盔甲上设了陷阱，用来给毫无防备的人穿刺上新的拘束饰品，这样我就可以把他们收入我的后宫了。我可不想惹您发火。] 她紧张地绞着双手。[say: 如果您把它交给我，我会帮您处理掉的。反正也没人会买。]");
            outputText("[pg]你耸耸肩，把盔甲扔给她，对失去了一件潜在的性感服装感到失望。");
            outputText("[pg]塞拉芙感激地鞠了一躬，迅速后退，并提议道，[say: 如果您哪天想让我给您塞满魔法拘束饰品，尽管开口，好吗？]");
            outputText("[pg]你还没来得及回答，她就不见人影了。有时候她惹的麻烦比带来的好处还多。");
         }
      }
      
      override public function playerEquip() : Equippable
      {
         super.playerEquip();
         return ArmorLib.NOTHING;
      }
   }
}

