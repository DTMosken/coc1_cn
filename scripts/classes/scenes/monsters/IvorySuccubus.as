package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class IvorySuccubus extends Monster
   {
      
      public var flightCooldown:int;
      
      public function IvorySuccubus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         flightCooldown = 0;
         super();
         set_a("");
         set_short("ivory succubus");
         imageName = "ivorysuccubus";
         set_long("这个异常苍白的魅魔身材高挑健美，身高[ivoryheight]，其中一小部分归功于她的恶魔高跟鞋。典型的恶魔特征，她拥有巨大的皮革翅膀，一对角，以及一条粗如绳索的长尾巴，尾巴末端有一系列隆起和一个可爱的黑桃形状——所有这些都与她灰白色的配色相匹配。她的[ivorybreasts]随着呼吸优雅地起伏，挺拔的灰色乳头似乎渴望得到关注。在乳房正下方，她穿着一件蕾丝紧身胸衣，搭配一条短而透明的裙子，勉强遮掩着她的开裆内裤。她纤细的双腿穿着和她身体其他部分一样纯白的丝袜。然而，你不敢分心，因为她手中握着一条象牙鞭子，鞭尖镶嵌着一块银子，在全速抽打下，可能会造成严重的伤害。");
         set_race("demon");
         createVagina(false,2,1);
         createBreastRow(Appearance.breastCupInverse("B"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         set_tallness(73);
         hips.rating = 4;
         butt.rating = 2;
         skin.tone = "pale";
         hair.color = "light gray";
         hair.length = 4;
         initStrTouSpeInte(75,60,80,70);
         initLibSensCor(66,30,100);
         set_weaponName("whip");
         set_weaponVerb("lash");
         set_weaponAttack(35);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("ivory corset");
         set_armorDef(10);
         set_fatigue(0);
         bonusHP = 300;
         set_lust(17 + Utils.rand(7));
         lustVuln = 1;
         bonusLust = 50;
         level = 12;
         set_gems(Utils.rand(10) + 15);
         set_drop(new WeightedChoice().add(get_consumables().SUCMILK,19).add(get_consumables().CLEARLN,19).add(get_consumables().W__BOOK,18).add(get_consumables().B__BOOK,18).add(get_weapons().SILWHIP,10).add(get_jewelries().SILVRNG,5).add(get_jewelries().MYSTRN1,5).add(get_jewelries().PLATRNG,1).add(get_jewelries().MYSTRN2,1).add(get_armors().IVCRSET,4));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().ivorySuccubusScene.won(param1);
      }
      
      public function whitefire() : void
      {
         outputText("几缕火焰在魅魔的指间穿梭，突然间，火焰在你身上跳跃。她打了个响指，火焰瞬间化作一片空灵的火海！");
         get_game().combat.monsterDamageType = "Fire";
         get_player().takeDamage(2.5 * get_inte() + Utils.rand(50),true);
      }
      
      public function tease() : void
      {
         var _loc1_:Array = ["魅魔摇晃着臀部，弄皱了她那透明的裙子，隐约露出她那开裆内裤。","象牙魅魔脚跟一转，向后拱起身体，像舞者一样展示着自己。[say: 完美的身体必须被享受，而不仅仅是它的主人，勇者，]她用性感的嗓音说道。","恶魔的尾巴从她的双腿间蜿蜒而上，掀起她的裙子，却依然让你无法看清她的下体。尾巴尖挑逗地来回摆动，魅魔完全清楚这个角度的诱惑力。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         get_player().takeLustDamage(12 + Utils.rand(20),true);
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(lash,4,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(tease,2,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(flight,1,flightCooldown < 1,0,FATIGUE_NONE,CombatRange.Self);
         _loc1_.add(blind,get_lust() < 50 ? 1 : 0.25,true,20,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(whitefire,get_lust() < 50 ? 1 : 0.25,true,15,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(charge,get_lust() < 50 ? 1 : 0.25,true,10,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(arouse,get_lust() >= 50 ? 1 : 0.25,true,10,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(attract,get_lust() >= 50 ? 1 : 0.25,!get_player().hasStatusEffect(StatusEffects.Attracted),15,FATIGUE_MAGICAL,CombatRange.Omni);
         _loc1_.add(lockUp,get_lust() >= 50 ? 1 : 0.25,true,20,FATIGUE_MAGICAL,CombatRange.Omni);
         if(((flightCooldown = int(flightCooldown - 1)) < 4 || !hasFatigue(5,FATIGUE_PHYSICAL)) && hasStatusEffect(StatusEffects.PermaFlyStatus))
         {
            land();
         }
         else
         {
            _loc1_.exec();
         }
      }
      
      public function lockUp() : void
      {
         outputText("女恶魔的手臂流畅地转动了一圈，然后手猛地握紧，你突然感到关节痛苦地停止了活动。");
         get_player().takeDamage(get_inte() / 4 + Utils.rand(10),true);
         get_player().changeFatigue(15,FATIGUE_PHYSICAL);
         get_player().stun();
      }
      
      public function lash() : void
      {
         var _loc1_:int = Utils.rand(3);
         outputText(["魅魔转了一会儿鞭子，然后朝你甩来，啪的一声抽在 ","象牙恶魔挥舞着鞭子抽打你，","她双手举过头顶，转了个圈，鞭子在她周围盘旋，然后优雅地跃起，向你抽来。"][_loc1_]);
         var _loc2_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge().setHitChance(get_player().standardDodgeFunc(this) + 10);
         _loc2_.setCustomBlock(["无害地击中了你的[shield]。","但攻击被偏转了。","闪亮的尖端击中你的[shield]，发出一声震耳欲聋的脆响。"][_loc1_]);
         _loc2_.setCustomAvoid(["它离你足够近，让你感觉到了空气的流动。","鞭子抽打的声音在你的[ears]里回荡。","你勉强及时躲开了这致命的表演。"][_loc1_]);
         if(_loc2_.executeAttack().isSuccessfulHit())
         {
            outputText(["金属楔子痛苦地击中了你的身体。","重击几乎将银色的尖端嵌入你的[if (isnaked) {flesh|[armor]}]中。","优雅的动作以她武器的尖端直接旋转刺入你的身体而告终。"][_loc1_]);
            get_player().takeDamage(get_player().reduceDamage(get_str() + get_weaponAttack() + Utils.rand(20),this),true);
         }
      }
      
      public function land() : void
      {
         outputText("魅魔展开双翼，最大化表面积，缓缓滑翔向地面。");
         removeStatusEffect(StatusEffects.PermaFlyStatus);
         get_game().combatRangeData.moveDistantSafe(this);
      }
      
      public function flight() : void
      {
         outputText("她展开翅膀向你扑来，一阵狂风将你吹得倒退，她则借势向后跳跃，腾空而起。象牙魅魔现在飞起来了。");
         flightCooldown = 7;
         createStatusEffect(StatusEffects.PermaFlyStatus);
         get_game().combatRangeData.moveDistantSafe(this);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().ivorySuccubusScene.defeated(param1);
      }
      
      override public function combatRoundUpdate() : void
      {
         if(hasStatusEffect(StatusEffects.PermaFlyStatus))
         {
            changeFatigue(5);
         }
         super.combatRoundUpdate();
      }
      
      public function charge() : void
      {
         outputText("女恶魔转动着她的鞭子，双手抓住了鞭子的大部分。她集中精神，施放了一个法术，盘绕的皮革闪烁着能量，金属鞭尖闪烁着电火花。");
         createStatusEffect(StatusEffects.ChargeWeapon,25,0,0,0);
      }
      
      public function blind() : void
      {
         outputText("她向你展示了片刻张开的手掌，紧接着是一道刺眼的闪光！");
         if(Utils.randomChance(33))
         {
            outputText("幸运的是，你就在那耀眼的光芒开始时眨了眼，免受了它致盲的刺痛。");
         }
         else
         {
            outputText("你条件反射地闭上眼睛，但当你睁开时，眼前一片漆黑。你需要一些时间来重新适应。");
            get_player().createStatusEffect(StatusEffects.Blind,2 + Utils.rand(3),0,0,0);
         }
      }
      
      public function attract() : void
      {
         var _loc1_:Array = ["[say:你感觉到了吗，]她戏弄道。她的身体在[sun]光下似乎散发着光芒，你感到内心一阵温暖的舒适。[say:你感觉到凝视我的身体有多美妙了吗？]","魅魔向你招手。[say: 膜拜我，]她命令道，招手的动作闪烁着魔法的光芒。"];
         outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
         outputText("[pg-][b:你的性欲抗性降低了！]");
         get_player().createStatusEffect(StatusEffects.Attracted,0.75,0,0,0);
      }
      
      public function arouse() : void
      {
         outputText("女恶魔做了一系列神秘的手势，身上明显散发着邪恶的光环。你感觉身体变暖了。");
         get_player().takeLustDamage(get_inte() / 4 + Utils.rand(15),true);
      }
   }
}

