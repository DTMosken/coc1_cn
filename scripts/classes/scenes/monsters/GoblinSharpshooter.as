package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.TargetMarked;
   import flash.Boot;
   
   public class GoblinSharpshooter extends Monster
   {
      
      public var smokeGrenade:Boolean;
      
      public var itsADraw:Boolean;
      
      public var ammo:Boolean;
      
      public function GoblinSharpshooter(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         itsADraw = false;
         smokeGrenade = true;
         ammo = true;
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("goblin sharpshooter");
         imageName = "goblinsharpshooter";
         set_long("她的外表和普通的地精一样，身材曲线优美，皮肤呈浅绿色，也许比一般的地精稍微高一点。她那波浪般狂野的头发是火红色的，不过由于她戴着一顶滑稽的骑士帽，你看不清太多。她的穿着凸显了她柔软的曲线，一条挂满各种小袋子的腰带斜挎在她丰满的胸前，一双网眼袜一直延伸到她粗壮的大腿上。她在原地蹦跳着，准备躲避你可能发出的任何攻击，尽管你的目光似乎总是游移到她裸露的小穴和抖动的屁股上。尽管她显然精通战斗，但她终究还是个地精——一根坚挺的肉棒能解决很多问题。[pg]<b>这个地精手里拿着一把旧火枪！</b> ");
         set_race("Goblin");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,90,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E"));
         ass.analLooseness = 2;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,50,0,0,0);
         set_tallness(35 + Utils.rand(4));
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "dark green";
         hair.color = "blue";
         hair.length = 7;
         initStrTouSpeInte(45,55,110,95);
         initLibSensCor(65,35,60);
         set_weaponName("blunderbuss");
         set_weaponVerb("shot");
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("leather straps");
         set_weaponAttack(130);
         bonusHP = 300;
         set_lust(50);
         temperment = 2;
         level = 20;
         set_gems(Utils.rand(50) + 25);
         createPerk(PerkLib.Evade,0,0,0,0);
         additionalXP = 350;
         set_drop(new WeightedChoice().add(get_weapons().BLUNDER,1).add(null,2));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(get_player().get_gender() == 0)
         {
            outputText("你倒在地精面前，伤得太重无法战斗。她咆哮着踢了你的头，让你眼冒金星。随着你的视线变暗，你听到她嘟囔着，[say:他妈的混蛋，连长个鸡巴或屄都不愿意。]");
            get_game().combat.cleanupAfterCombat();
         }
         else
         {
            get_game().goblinWarriorScene.gobboWarriorBeatYaUp();
         }
      }
      
      public function tryToGrabGobbo() : void
      {
         var _g:Combat;
         clearOutput();
         if(Utils.rand(get_player().get_spe()) > Utils.rand(get_spe()))
         {
            outputText("你以最快的速度冲进烟雾中。烟雾很浓，几乎漆黑一片，但你还是勉强辨认出了她丰满的轮廓。你伸出手臂，抓住她的丁字裤，让本就虚弱的地精惊叫一声，踉跄着脸朝下摔倒在地上。");
            outputText("[pg]当烟雾散去时，你看到一个颤抖的地精紧紧抓着一顶滑稽的骑士帽，惊恐地盯着你。");
            outputText("[pg]你双臂交叉。如果你见过被打败的地精，这就是了。");
            itsADraw = false;
            set_HP(0);
            get_game().goblinScene.generateGobboSexMenu(SpriteDb.get_goblinSharpshooter());
         }
         else
         {
            outputText("你以最快的速度冲进烟雾中。你疯狂地挥舞着手臂，试图抓住那个烦人的逃跑地精。\r\n然而，尽管你付出了努力，她还是设法智取了你，绕到你身后，轻轻踢了你的[butt]一脚。你失去平衡，脸朝下摔倒在地上，引得地精在逃跑时发出一阵大笑。");
            outputText("[pg]当烟雾散去时，地上除了一个满身泥土、恼羞成怒的勇者之外，什么也没有。你愤怒地咬牙切齿，然后站起身来，尽可能地清理自己。那个该死的地精。");
            _g = get_game().combat;
            doNext(function():void
            {
               _g.cleanupAfterCombat();
            });
         }
      }
      
      public function takeAim() : void
      {
         outputText("地精深吸一口气，用她的火枪仔细瞄准，锁定了你。[say: 得知道打哪儿才能把他们放倒，]她说着，脸上浮现出一丝微笑。\r\n你很确定她已经在你身上<b>标记</b>了一个位置，现在会造成更多的伤害！");
         addStatusEffect(new TargetMarked(6));
      }
      
      public function skeetShot() : void
      {
         ammo = false;
         outputText("地精从她的小包里拿出一个粉色的玻璃烧瓶，以一个相当大的弧度扔向你。你准备躲避这个物体，但她瞄准了它，试图在它到达你身边时射击它，以防止你躲避！");
         if(chanceToHit() - 30 > Utils.rand(100))
         {
            outputText("\n她开火并完全击中了烧瓶，在它到达你之前将其引爆，让你被粉色的薄雾覆盖！尽管你尽了最大努力，你还是不小心吸入了一些，感觉你的身体因为不想要的性唤起而发热。你再次看向地精，她向你飞吻，随后露出了一个恶作剧的微笑。现在看来，放弃抵抗，操她直到那个微笑消失似乎是个好主意……");
            get_player().takeLustDamage(30,true);
         }
         else
         {
            outputText("\n她开火了，但谢天谢地，这一枪打偏了。烧瓶在引信燃尽之前落在了你面前，给了你一些时间来躲避它的爆炸范围！");
            if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)))
            {
               outputText("\n手雷在你拉开足够距离之前就爆炸了！尽管你尽了最大努力，你还是不小心吸入了一些，感觉你的身体因为不想要的性唤起而发热。你再次看向地精，她向你飞吻，随后露出了一个恶作剧的微笑。现在看来，放弃抵抗，操她直到那个微笑消失似乎是个好主意……");
               get_player().takeLustDamage(20,true);
            }
         }
      }
      
      public function reload() : void
      {
         ammo = true;
         outputText("地精花了一些时间重新装填她的火枪。她的动作出奇地灵巧，但还不足以阻止你再次攻击她。");
      }
      
      public function pushBack() : void
      {
         var _loc1_:int = 0;
         ammo = false;
         outputText("地精迅速从她的小包里拿出一个红色的纸弹药筒，用嘴撕开，然后把它装进火枪里。令你惊讶的是，她没有保持距离，而是向前冲锋，打算近距离击中你！");
         if(!playerAvoidDamage(new AvoidDamageParameters(true,false,false,null,false,null,null,null)))
         {
            outputText("她出其不意地抓住了你，移动速度太快，让你无法躲避她的攻击。她把喇叭形的枪口抵在你的胸前，开火了！");
            outputText("[pg]你被向后击飞了几英尺，被她特殊射击的巨大定向爆炸力抛离了地面。当你终于落地时，你如释重负地注意到并没有弹丸。你站起身，看到地精也因为后坐力被向后抛出了好几英尺；看来你们现在<b>拉开距离</b>了！\r\n她重新站稳脚跟，调整了一下现在沾满泥土的帽子，依然盯着你。");
            distance = CombatDistance.Distant;
            _loc1_ = get_player().reduceDamage(get_weaponAttack() - 50,this);
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,3,ammo,0,FATIGUE_NONE,CombatRange.Ranged);
         _loc1_.add(pushBack,1,ammo && distance == CombatDistance.Melee,0,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(skeetShot,1,ammo && distance == CombatDistance.Distant,5,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(reload,1,!ammo,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.add(takeAim,1,!hasStatusEffect(StatusEffects.TargetMarkedBuff),25,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(buggerOut,99,get_HP() < maxHP() * 0.25 && smokeGrenade,0,FATIGUE_NONE,CombatRange.Omni);
         _loc1_.exec();
      }
      
      override public function handleCombatLossText(param1:Boolean, param2:int) : int
      {
         if(itsADraw)
         {
            outputText("[pg]你沮丧地叹了口气，转身走回营地。下次你一定会抓住她的，你这样安慰自己。");
            return 1;
         }
         return int(super.handleCombatLossText(false,param2));
      }
      
      override public function eAttack() : void
      {
         ammo = false;
         super.eAttack();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().goblinSharpshooterScene.defeatSharpshooter();
      }
      
      public function buggerOut() : void
      {
         itsADraw = true;
         outputText("地精踉跄着后退，她挣扎着站起来时，身体滑稽地抖动着。[say: 哎呀，你可真是个硬骨头，不是吗？真没劲，我不陪你玩了！]");
         if(!get_game().goblinSharpshooterScene.saveContent.sawSmokeGrenade)
         {
            outputText("[pg]她迅速从一个小包里抓出某种手雷。不过，它不像她其他的那些手雷那样是粉色的，你保持警惕，准备躲避。\r\n她短暂地威胁要把它扔向你，但在最后一刻却微笑着停了下来。[say: 总有一天我会抓住你的！]她说着，把手雷扔在了自己脚下。");
            outputText("[pg]手雷爆炸了，伴随着刺眼的闪光、震耳欲聋的巨响，如果这还不够，还有一团漆黑的烟雾。你咳嗽着揉了揉眼睛，完全被她的装置惊呆了。该死，她要逃跑了！");
            get_game().combat.overrideEndOfRoundFunction = get_game().goblinSharpshooterScene.goblinEscapes;
         }
         else
         {
            outputText("[pg]她再次伸手去拿烟雾弹，但这次你早有准备！你尽力背对她，并在装置爆炸前捂住耳朵。你听到砰的一声，转过身再次面对她，注意到有什么东西从烟雾中冲出，消失在视线之外。是时候抓住这个滑溜溜的地精了！");
            get_game().combat.overrideEndOfRoundFunction = tryToGrabGobbo;
         }
      }
   }
}

