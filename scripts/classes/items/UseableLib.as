package classes.items
{
   import classes.items.useables.AbyssalShard;
   import classes.items.useables.AkbalsPelt;
   import classes.items.useables.DebugWand;
   import classes.items.useables.DesertRose;
   import classes.items.useables.GoldenStatue;
   import classes.items.useables.RubberBall;
   import classes.items.useables.SimpleUseable;
   import classes.items.useables.TeddyBear;
   import flash.Boot;
   
   public final class UseableLib
   {
      
      public var T_SSILK:SimpleUseable;
      
      public var TELBEAR:TeddyBear;
      
      public var SKULL:SimpleUseable;
      
      public var RBRBALL:RubberBall;
      
      public var OBSHARD:SimpleUseable;
      
      public var LETHITE:SimpleUseable;
      
      public var IMPSKLL:SimpleUseable;
      
      public var GREENGL:SimpleUseable;
      
      public var GLDSTAT:GoldenStatue;
      
      public var EYEBALL:SimpleUseable;
      
      public var EBNFLWR:SimpleUseable;
      
      public var D_SCALE:SimpleUseable;
      
      public var DSTROSE:DesertRose;
      
      public var DBGWAND:DebugWand;
      
      public var CONDOM:SimpleUseable;
      
      public var B_CHITN:SimpleUseable;
      
      public var A_SHARD:AbyssalShard;
      
      public var AKBPELT:AkbalsPelt;
      
      public function UseableLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         DBGWAND = new DebugWand();
         SKULL = new SimpleUseable("Skull","Skull","a humanoid skull",10,"An old skull, weather-worn and bleached white by the sun.","这个苍白的、人形的头骨轻轻地放在你的手掌里，很难想象这么脆弱的东西曾经是一个人。盯着它，你开始想那个旅行者到底是谁。");
         EYEBALL = new SimpleUseable("Eyeball","Undead Eye","an undead girl\'s eye",1,"The eye of an undead girl. It has a beautiful grey-blue iris.","你看着这颗亡灵女孩的眼睛。这是一颗简单的蓝色眼睛，非常干净，没有血迹和污垢。它保存得很好，尽管与主人分离，似乎也没有腐烂。");
         var _loc1_:RubberBall = new RubberBall();
         _loc1_._headerName = "Rubber Bouncy Ball";
         RBRBALL = _loc1_;
         TELBEAR = new TeddyBear();
         GLDSTAT = new GoldenStatue();
         DSTROSE = new DesertRose();
         CONDOM = new SimpleUseable("Condom ","Condom","a packet of condoms",6,"A wrapper containing a condom that can be worn over a penis. It\'s designed to prevent pregnancy, though there is a small but ever-present chance it won\'t. It can be used in certain sexual encounters.","你看着这包未开封的避孕套。在适用的情况下，你可以使用避孕套在大多数时候防止怀孕。");
         A_SHARD = new AbyssalShard();
         IMPSKLL = new SimpleUseable("ImpSkll","Imp Skull","an imp skull",25,"A skull taken from a slain imp.","你看着这个小恶魔头骨。头骨上突出一对角。你欣赏着头骨的整体轮廓，但没发现它有什么明显的用途。");
         AKBPELT = new AkbalsPelt();
         var _loc2_:SimpleUseable = new SimpleUseable("ObShard","Obs. Shard","a shard of obsidian",200,"A small shard of obsidian, formed from rapidly cooled lava. It\'s a volcanic glass that is known to be very sharp, albeit fragile.","你小心翼翼地捧着这块黑曜石碎片仔细端详。它相当闪亮，能轻易反射阳光。知道这碎片有多锋利后，你可以找个人把它打造成致命的武器。");
         _loc2_._headerName = "Obsidian Shard";
         OBSHARD = _loc2_;
         var _loc3_:SimpleUseable = new SimpleUseable("E.Flower","Ebon Flower","an ebonbloom flower",600,"These gray metallic flowers are known to bloom in the deepest caves below the mountains.","你端详着这朵乌木花。它相当漂亮，只可惜反射阳光时刺眼得能把你闪瞎。这东西很稀有，所以如果你想卖肯定能卖掉，但你忍不住琢磨它是否还有其他用途。");
         _loc3_._headerName = "Ebonbloom Flower";
         EBNFLWR = _loc3_;
         LETHITE = new SimpleUseable("Lethite","Lethicite","a chunk of lethicite",1000,"A chunk of lethicite. The material is rare, as it\'s only produced when someone cums out their soul, and demons usually consume it right away for power.","你检查了这块紫色水晶。它一定是魔晶。你知道恶魔喜欢消耗它，但你确信它可能还有其他用途。");
         D_SCALE = new SimpleUseable("D.Scale","Dragon Scale","a freshly-shed dragon scale",45,"This sheet of dragon scale is incredibly strong and flexible.[if (silly) { No dragons were seriously harmed in the acquisition of this item.}]","你仔细端详着这片龙鳞。你曾听闻过各种关于龙鳞如何被制成坚固盔甲或用于炼金术的传说。");
         var _loc4_:SimpleUseable = new SimpleUseable("T.SSilk","Tough S.Silk","a bundle of tough spider-silk",6,"A bundle of fibrous spider silk which is incredibly tough and strong, though for some reason not sticky in the slightest. You have no idea how to work these tough little strands into anything usable, but maybe someone else would be able to.","你端详着这坚韧的蛛丝网，脸上写满了困惑。你自己确实没法拿它做什么实用的事。最好还是找个更熟悉这片土地上奇异物产的人，看看他们能不能搞出点名堂来。");
         _loc4_._headerName = "Tough Spider Silk";
         T_SSILK = _loc4_;
         GREENGL = new SimpleUseable("GreenGl","Green Gel","a clump of green gel",6,"This tough substance has no obvious use that you can discern.","你彻底检查了这团凝胶，发现它坚韧而有弹性，却又极其柔软。不知为何，你觉得吃掉它不是个好主意。");
         B_CHITN = new SimpleUseable("B.Chitn","Bee Chitin","a large shard of chitinous plating",6,"A perfect piece of black chitin from a bee-girl. It still has some fuzz on it.","你仔细查看了这块甲壳，但找不到它的用途。也许其他人会知道怎么用它。");
      }
   }
}

