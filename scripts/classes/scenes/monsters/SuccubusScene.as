package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.display.SpriteDb;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class SuccubusScene extends BaseContent
   {
      
      public function SuccubusScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstSuccubusRape() : void
      {
         clearOutput();
         outputText("看到魅魔处于如此脆弱的状态，你走到她身边" + get_player().clothedOrNakedLower("，脱下你的" + get_player().armorDescript() + "，露出你的" + get_player().cockDescript() + "","，而你的" + get_player().cockDescript() + "自由地晃动着") + "。[pg]");
         outputText("沉浸在这一刻，你将下半身紧贴着她摩擦，用你勃起的阴茎寻找着她的肉洞");
         if(get_player().cockTotal() > 1)
         {
            outputText("们。当你感觉到至少有一根稍微插进去时，你用力地刺入她，其他的则向四面八方散开。魅魔向你尖叫，显然受到了侵犯。但这只会让你更加兴奋，操得她更快更狠。你的一根鸡巴滑了出来，上面沾满了她自己的淫液和别人的精液，另一根又取而代之。[pg]");
         }
         else
         {
            outputText("当你感觉到自己稍微插进去时，你用力地刺入她。魅魔向你尖叫，显然受到了侵犯。但这只会让你更加兴奋，操得她更快更狠。[pg]");
         }
         outputText("她紧致的小穴，加上你疯狂的欲望，让你在她的最深处射出了一大股精液。但现在只射一次是不够的。你继续干着，全程保持着坚挺。");
         if(get_player().cockTotal() > 1)
         {
            outputText("她只是在试图从你身边挣脱时耗尽了力气，而你趁机小心翼翼地将你的另一根鸡巴塞进她体内。你能感觉到她被撑开了。");
         }
         outputText("你眼中闪烁着变态的光芒，低头看着她，一边慢慢地强暴她，一边欣赏着她脸上痛苦的表情。随着你不断地操她，她变得越来越湿，你公开嘲笑她似乎很享受这一切。你舔去她脸上滚落的泪水，继续干了一段时间。当你觉得她已经被玩坏时，你决定结束，突然加快了抽插的速度。魅魔嚎叫着，弄乱了你的头发，你再次将精液射满了她的体内。心满意足后，你拔了出来，把她留在那里喘息着，精疲力竭，被侵犯的证据从她的小穴里流了出来。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-2),DynStat.Cor(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function winAgainstSuccubus() : void
      {
         clearOutput();
         outputText("魅魔跪倒在地，伤得太重" + (get_monster().get_HP() <= 0 ? "无法战斗" : "发情过度") + "，无法继续战斗。");
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            outputText("[pg]遗憾的是，你的欲望并没有得到满足。当然，你总是可以强暴这个可怜的家伙。你要这么做吗？");
            addButton(0,"强暴她",winAgainstSuccubusRape).hint("强暴魅魔。");
            setSexLeaveButton();
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function tryToFlee() : void
      {
         clearOutput();
         startCombat(new Succubus());
         get_combat().runAway();
      }
      
      public function loseToSuccubus(param1:Boolean = true) : void
      {
         var _g:Combat;
         var _loc2_:* = null as Inventory;
         var _loc3_:* = null as Consumable;
         clearOutput();
         if(param1)
         {
            outputText("被魅魔" + (get_player().get_HP() <= 0 ? "打得太惨" : "挑逗得太厉害") + "，你屈服了，任由魅魔对你为所欲为。[pg]");
         }
         if(get_player().hasCock())
         {
            outputText("她向你款款走来，一路上扭动着臀部。当她走到你触手可及的范围内时，她立刻吻了你，将舌头尽可能深地伸进你的嘴里。同时，她用一条腿缠住你，勾在你的身后，抓住你坚挺的鸡巴，引导它走向她的下体。");
            outputText("[pg]她的体内已经温暖湿润，紧紧包裹着你，急切地扭动着。魅魔在你的嘴里呻吟，双手抚摸着你的身体。她熟练地将你们俩从站立的姿势放倒在地上，她依然骑在你身上。她开始在你的鸡巴上弹跳，尽可能深地吞吐。她强健的双腿以很少有人类女性能匹敌的速度弹跳着。她轻而易举地哄骗你在她体内射精，这种射精的感觉如此强烈，让你觉得你可能会当场爽死。魅魔在接受你的种子时发出色情的呻吟，并俯身在你的额头上吻了一下，仿佛在祝你晚安。");
            outputText("[pg]奇怪的是，那个吻是你最后的记忆。你在冰冷的地面上醒来，感到精疲力竭。感觉她带走了你灵魂的一部分……但那种感觉太棒了。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-2),DynStat.Cor(3));
            if(param1)
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseTwoHours);
            }
         }
         else
         {
            outputText("她向你款款走来，一路上扭动着臀部。当她走到你触手可及的地方时，她抚摸着你的脸颊，把你的脸拉近，将舌头深深地滑入你的口中。你" + (get_player().lib + get_player().cor < 80 ? "勉强地" : "热切地") + "回应着这个吻，用你的舌头与她交锋，试图压制住她。她熟练地舔舐着你的舌头，将其压在你的口腔底部。她抬起一条腿，像剪刀一样夹住你的耻骨区域，尽管那里什么也没有，她还是用力地摩擦着。她的目光向下游移，然后又回到你的眼睛上，眼中依然充满了欲望。她和你亲热了更长时间，继续舔舐你嘴唇的周围。一路上她用力地推着你，让你能感觉到她的耻骨压在你的耻骨上，伴随着她相当多的湿润。");
            outputText("[pg]当一切终于结束时，她一言不发地离开了你。突然，地上出现了一个以前没有的瓶子。你捡起它仔细端详。这是一种粘稠的白色液体，标签上写着“<i>梦魔药水</i>”。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-2),DynStat.Cor(3));
            _loc2_ = get_inventory();
            _loc3_ = get_consumables().INCUBID;
            _g = get_combat();
            _loc2_.takeItem(_loc3_,function():void
            {
               _g.cleanupAfterCombat();
            });
         }
      }
      
      public function fightAgainstSuccubus() : void
      {
         startCombatImmediate(new Succubus());
      }
      
      public function encounterSuccubus() : void
      {
         var fromBattle:Boolean;
         var _g:SuccubusScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ivory_succubus());
         outputText("当你正忙着自己的事情时，你发现远处有一个身影。那似乎是一个有着象牙色肌肤的魅魔，她正怒视着你。");
         unlockCodexEntry(2055);
         if(get_player().hasCock())
         {
            outputText("[pg]她对你的[cock]表现出了兴趣，并说道：[say: 你好啊，亲爱的。你有一根那么棒的鸡巴，我想把我的小穴献给你。那会非常舒服的。你觉得怎么样？]");
            menu();
            addButton(0,"战斗",fightAgainstSuccubus);
            _g = this;
            fromBattle = false;
            addButton(1,"接受",function():void
            {
               _g.loseToSuccubus(fromBattle);
            });
            addButton(4,"逃跑",tryToFlee);
         }
         else
         {
            outputText("她开始向你冲锋，拉近距离！战斗开始了！");
            startCombat(new Succubus());
         }
      }
   }
}

