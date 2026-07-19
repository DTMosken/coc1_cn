package classes.scenes.areas.glacialRift
{
   import classes.BaseContent;
   import classes.Player;
   import classes.items.Armor;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class FrostGiantScene extends BaseContent
   {
      
      public function FrostGiantScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function winAgainstGiant() : void
      {
         var _g:Combat;
         clearOutput();
         outputText("巨人踉跄着跪倒在地。你想知道接下来该怎么做。");
         if(get_player().get_weapon().isUnarmed() && get_player().get_armor().get_name() == "nothing" && get_player().get_shieldName() == "nothing")
         {
            awardAchievement("宛如查克·诺里斯",142);
         }
         menu();
         addButtonDisabled(0,"鼻交","这个场景需要你拥有阴茎并有足够的性奋度。");
         addButtonDisabled(1,"阴道骑乘","这个场景需要你拥有阴道并有足够的性奋度。");
         addButtonDisabled(2,"肛门骑乘","这个场景需要你有足够的性奋度。");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               addButton(0,"鼻交",noseJob);
            }
            if(get_player().hasVagina())
            {
               addButton(1,"阴道骑乘",rideVaginally);
            }
            addButton(2,"肛门骑乘",rideAnally);
         }
         _g = get_combat();
         setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function suckHimOff() : void
      {
         clearOutput();
         outputText("占位符");
         get_player().refillHunger(100);
         get_combat().cleanupAfterCombat();
      }
      
      public function rideVaginally() : void
      {
         clearOutput();
         outputText("你把手伸进[armor]里，慢慢地揉弄着你的[vagina]，试图在你想出如何平息它的同时，缓解它渴望被关注的悸动。当你检查昏迷的巨人的身体时，你注意到他胯部附近的冰霜盔甲上有一道裂缝。你用[weapon]凿开更多的冰霜，发现这个巨人确实是雄性。巨人巨大的肉棒让你感到震惊；即使是疲软状态，它依然");
         if(get_player().get_tallness() < 36)
         {
            outputText("比你高得多。");
         }
         else if(get_player().get_tallness() >= 36 && get_player().get_tallness() < 48)
         {
            outputText("和你一样高。");
         }
         else
         {
            outputText("只比你矮一点点。");
         }
         outputText("[pg]");
         if(int(get_player().cocks.length) <= 0)
         {
            outputText("眼看没有别的选择");
         }
         else
         {
            outputText("决定好好安抚你那渴望被关注的小穴");
         }
         outputText("，你小心翼翼地脱下并重新穿上[armor]的部件，这样你就可以在准备将你的小穴滑过巨人的肉棒时揉弄你的[chest]，而不会让身体的其他部位冻僵。");
         outputText("爬到巨人的胯部，你跨坐在他的肉棒上，在蹲下之前感受了一下。巨人的体温弥补了寒冷，足够温暖你饥渴的小穴，并打消了你害怕被粘在巨人身上的恐惧。你从[vagina]里收集了一些淫液，涂抹在肉棒上，准备滑上去释放自己。");
         outputText("[pg]深吸一口气，你终于接触到了。巨人的热度比你手感觉到的还要强烈，你发现自己很容易就能前后滑动。当你在这个巨大的肉棒上滑动时，它慢慢地勃起，直到它高高地耸立在你上方，你除了扭动臀部来取悦自己之外，几乎做不了什么。你努力保持滑动，但这是徒劳的。当你停下来准备从巨人身上下来时，他呻吟了一声，[say: 不……]然后两只手各抓住你的一条腿。你试图大喊，但在你有机会之前，他已经迅速地让你在他整个长度上前后滑动，基本上是在自慰，并带着你一起享受。感觉到他肉棒上的每一个隆起和凸起滑过你，你只花了几秒钟就达到了极限。[pg]");
         if(get_player().hasCock())
         {
            outputText("你从你的[cocks]射出成股的精液，射了他一胸。");
         }
         if(get_player().hasVagina())
         {
            outputText("女性的汁液从你的[vagina]四处飞溅，溅到了他的阴茎上。");
         }
         outputText("然而，巨人仍然需要释放，随着他继续抽插，你达到了数不清的高潮。最后，你听到巨人呻吟了一声，他把你扔在肉棒的根部，然后自己解决了。你累得动弹不得，躺在那里，看着巨人射精，几加仑的精液在空中划出一道弧线，以慢动作直接落在你身上。你勉强吞下足够的精液，才不至于被淹死。巨人笑着抓住你，把你舔干净，然后把你放下，用手为你遮挡寒冷，让你整理盔甲。一旦你重新穿好衣服，巨人发出一声大笑，然后漫步走到一座山后。");
         get_player().refillHunger(50);
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function rideAnally() : void
      {
         clearOutput();
         outputText("你慢慢地脱下[armor]的下半部分，试图在你想出如何平息它的同时，缓解它渴望被关注的悸动。当你检查昏迷的巨人的身体时，你注意到他胯部附近的冰霜盔甲上有一道裂缝。你用[weapon]凿开更多的冰霜，发现这个巨人确实是雄性。巨人巨大的肉棒让你感到震惊；即使是疲软状态，它依然");
         if(get_player().get_tallness() < 36)
         {
            outputText("比你高得多。");
         }
         else if(get_player().get_tallness() >= 36 && get_player().get_tallness() < 48)
         {
            outputText("和你一样高。");
         }
         else
         {
            outputText("只比你矮一点点。");
         }
         outputText("[pg]");
         outputText("你小心翼翼地脱下并重新穿好你的[armor]的一部分，这样你就可以让你的[asshole]滑过巨人的阴茎，而不会冻坏你身体的其他部分。爬到巨人的胯部，你跨坐在他的阴茎上，在蹲下之前感受了一下。巨人的体温弥补了寒冷，温暖得足以填满你的身体。你摆好姿势，滑下身子释放自己。");
         outputText("[pg]深吸一口气，你终于接触到了。巨人的热度比你手感觉到的还要强烈，你发现自己很容易就能前后滑动。当你滑过巨大的阴茎时，它慢慢地勃起，直到它高耸在你上方，你除了扭动臀部取悦自己之外，什么也做不了。你努力保持滑动，但这是徒劳的。幸运的是，你达到了高潮。");
         outputText("当你停下来准备从巨人身上下来时，他呻吟着，[say:不……]然后两只手各抓住你的一条腿。你试图大喊，但在你有机会之前，他正迅速地让你在他整个长度上前后滑动，基本上是在自慰并带你一起兜风。感觉到他阴茎上的每一个脊和凸起滑过你，你只花了几分钟就达到了极限。[pg]");
         if(get_player().hasCock())
         {
            outputText("你从你的[cocks]射出成股的精液，射了他一胸。");
         }
         if(get_player().hasVagina())
         {
            outputText("女性的汁液从你的[vagina]四处飞溅，溅到了他的阴茎上。");
         }
         outputText("然而，巨人仍然需要释放，随着他继续抽插，你达到高潮的次数多得数不清。最后，你听到巨人呻吟，他终于将他的整个长度滑入你体内。");
         get_player().buttChange(144,true,true,false);
         outputText("[pg]当巨人射精时，你惊讶地叫了一声，精液完全填满了你的肠道，塞满了你的胃。巨人笑着抓住你，把你舔干净，然后把你放下，用手为你遮挡寒冷，让你整理盔甲。一旦你重新穿好衣服，巨人发出一声大笑，漫步走到一座山后。因为被他的精液填满，你感到很温暖。");
         get_player().refillHunger(30);
         get_player().orgasm("Anal");
         get_combat().cleanupAfterCombat();
      }
      
      public function noseJob() : void
      {
         clearOutput();
         outputText("看着倒下的巨人，你的脑海中立刻浮现出一个念头：鼻交。你把玩着这个想法，直到你走近巨人的鼻子，它的鼻孔大小确实刚好可以把你的" + get_player().multiCockDescript() + "塞进去。[pg]");
         outputText("你小心翼翼地用手试探了一下鼻孔，这个危险的距离离巨人的嘴巴很近，他很容易就能在一瞬间把你吞下去。令人惊讶的是，巨人呼出的气息足够温暖，这也许能行……[pg]");
         outputText("你把手伸进你的[armor]里，掏出你的阴茎");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("。冷空气几乎立刻让它们变软了，但巨人的呼吸又让它们恢复了勃起。你再次思考你将要做的事情，让你的[cocks]完全硬起来。深吸一口气，你冲进了深处。虽然不完全像阴道，但巨人正在大口喘气，以弥补你造成的堵塞。");
         if(int(get_player().cocks.length) == 1)
         {
            outputText("他收缩的鼻孔按摩着你的肉棒，足以让你兴奋起来。");
         }
         else
         {
            outputText("他收缩的鼻孔按摩着你的肉棒，足以让你兴奋起来。");
         }
         outputText("在与巨人那足够巨大的胡须进行了一些尴尬的搏斗之后，你终于找到了节奏：吸气，肉棒拔出；呼气，肉棒插入。巨人鼻子里呼出的冷热交替的气流是一种奇怪的感觉，但并不令人讨厌——这种反差很好地互补了，随着你的睾丸因期待而紧绷，先列腺液终于开始滴入巨人的喉咙。你听到巨人开始发出咕噜声和咳嗽声，你意识到最好快点结束。[pg]");
         if(get_player().balls > 0)
         {
            outputText("为了加快高潮的到来，你把睾丸拉出来，让它们拍打巨人的上唇，他胡须的硬毛以你在这个世界待了这么久都未曾想象过的方式摩擦着你的阴囊。[pg]");
         }
         outputText("随着更多的先列腺液滴入他的鼻中隔，巨人开始咳嗽和喷嚏。你知道机不可失，于是你坚定地做了最后几次冲刺，然后把所有的精液都射进了他的鼻子里。[pg]");
         outputText("当你感觉到第一股喷射时，你加快了剩下的速度。巨人现在显然对填满他鼻腔的精液感到恼火。[say: 呃啊啊啊啊！什么！我的鼻子里有什么？啊啊啊啊！]他尖叫着，刚刚恢复意识。[pg]");
         outputText("你的喷射还在继续，在第二波中产生了更多的精液。你不断地射出一股股精液，直到最后他睁开布满血丝的眼睛，直直地看着你；你知道这是你离开的信号，你把[cocks]从巨人的鼻子里拔出来，把最后一股精液射进了他的眼睛里。在他能把你从他脸上拍下来之前，你跳了下来。现在非常愤怒的巨人又发出一声咆哮，他站起来，试图咳出那些本不该出现在那里的、大量的精液块。[pg]");
         outputText("当他继续咆哮和尖叫时，你把[cocks]塞回[armor]里，抓起你的战利品，立刻开溜。这个巨人在被鼻交之前就已经够刻薄的了，即使他已经消失在地平线之外，你还能清楚地听到他的叫喊声。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToGiant() : void
      {
         get_combat().cleanupAfterCombat();
      }
      
      public function exitGiant() : void
      {
         menu();
         get_combat().cleanupAfterCombat();
      }
   }
}

