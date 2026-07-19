package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.Shield;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.combat.CombatAbility;
   import classes.scenes.combat.CombatAttackBuilder;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.AngeredPugilist;
   import classes.statusEffects.combat.DazedDebuff;
   import flash.Boot;
   import haxe.IMap;
   
   public class DemonFistFighter extends Monster
   {
      
      public var hasAttemptedBSwordDisarm:Boolean;
      
      public var angryDemonfist:Boolean;
      
      public function DemonFistFighter(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         angryDemonfist = false;
         hasAttemptedBSwordDisarm = false;
         super();
         if(param1)
         {
            return;
         }
         set_a("");
         set_short("Demon Fistfighter");
         imageName = "imp";
         set_long("你面前的这个恶魔明显比一般的小恶魔更像个战士。他身高六英尺，头上长着显眼的黑色弯角，靛蓝色的皮肤下是精瘦但相当发达的肌肉。他双眼紧紧盯着你，左右移动，快速出拳，让自己保持兴奋状态。他绝对是个经验丰富的战士。");
         set_race("Demon");
         createCock(Utils.rand(2) + 11,2.5,CockTypesEnum.DEMON);
         balls = 2;
         ballSize = 1;
         createBreastRow(0);
         ass.analLooseness = 2;
         ass.analWetness = 1;
         set_tallness(Utils.rand(24) + 25);
         hips.rating = 0;
         butt.rating = 2;
         skin.tone = "indigo";
         hair.color = "black";
         hair.length = 5;
         initStrTouSpeInte(120,60,90,60);
         initLibSensCor(45,45,100);
         set_weaponName("fists");
         set_weaponVerb("jab");
         set_armorName("leathery skin");
         set_lust(40);
         temperment = 1;
         level = 20;
         set_gems(Utils.rand(5) + 5);
         createPerk(PerkLib.ExtraDodge,75);
         lustVuln = 0.1;
         set_drop(new WeightedChoice().add(get_consumables().SUCMILK,3).add(get_consumables().INCUBID,3).add(get_consumables().IMPFOOD,4));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         var _temp_1:* = get_scene().saveContent;
         _temp_1.consecutiveLosses = _temp_1.consecutiveLosses + 1;
         var _temp_2:* = get_scene().saveContent;
         _temp_2.timesLost = _temp_2.timesLost + 1;
         if(angryDemonfist)
         {
            get_scene().angryDemonfistPlayerLoss();
         }
         else
         {
            get_scene().regularPlayerLoss();
         }
      }
      
      public function twoFer() : void
      {
         outputText("[Themonster]闪转腾挪，试图在用凌厉的攻击连击两次之前扰乱你的视线！[pg]");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canBlock().canDodge().setHitChance(get_player().standardDodgeFunc(this,10));
         _loc1_.setCustomBlock("他刚开始佯攻，你就躲在盾牌后面，挡住了这两次攻击！");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("你试图躲闪，但佯攻分散了你的注意力，让[monster.him]有足够的时间在你的肋骨上打了一拳。你还没来得及对疼痛做出反应，肚子上又挨了一拳！他试图打第三拳，但你及时恢复过来，设法推开了他。");
            get_player().takeDamage(calcDamage() * 0.75,true);
            get_player().takeDamage(calcDamage() * 0.75,true);
         }
      }
      
      public function roundhouse() : void
      {
         var _loc2_:* = null as CombatAttackBuilder;
         outputText("[Themonster]迅速扭动身体转向你，同时抬起膝盖，向你发起强力的回旋踢！[pg]");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge().canBlock().setHitChance(get_player().standardDodgeFunc(this,10));
         _loc1_.setCustomBlock("你及时举起盾牌接住他的小腿，挡住了他的攻击。然而，令你惊讶的是，他利用你无意中提供的杠杆作为支撑，用另一条腿进行反向旋转踢，就在他另一只脚的脚跟向你踢来时，用膝盖推开了你的盾牌！[pg]");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("这凶狠的一脚结结实实地踢在你的头上，让世界瞬间天旋地转。当你倒在地上时，你的上半身因惯性而扭曲，你头晕目眩，甚至连剧烈的疼痛都需要一点时间才能真正感觉到。");
            outputText("[pg]然而，疼痛还是袭来了，即使你设法站起来，你的头还在嗡嗡作响。你[b:头晕目眩！]");
            get_player().takeDamage(calcDamage() * 1.25,true);
            get_player().addStatusEffect(new DazedDebuff(2));
         }
         if(_loc1_.isBlocked())
         {
            changeFatigue(10,FATIGUE_PHYSICAL);
            _loc2_ = new CombatAttackBuilder().canDodge().setHitChance(get_player().standardDodgeFunc(this,25));
            _loc2_.setCustomAvoid("你以最快的速度蹲下，旋转踢以一英寸的距离从你头顶掠过。就在[themonster]攻击的腿落地时，你向后冲刺，拉开了你和[monster.him]之间的距离。现在[monster.his]背对着你，[monster.he]微微歪着头看着你，你可以看出[monster.his]脸上带着微笑。[Monster.he]对你的速度印象深刻！");
            if(_loc2_.executeAttack().isSuccessfulHit())
            {
               outputText("[Monster.his]脚跟像锤子砸钉子一样落在你的额头上，以粉碎性的力量将你砸向地面。世界瞬间变黑，在遭受了这残酷的一击后，你的意识勉强维持着。");
               get_player().takeDamage(calcDamage() * 1.75,true);
               get_player().addStatusEffect(new DazedDebuff(2,-20,0.7));
               outputText("[pg][say: 躲在盾牌后面很安全，不是吗？来吧，站起来！]恶魔说道，同时嘲笑并激励着你。[pg-]");
               if(get_player().get_HP() > 0)
               {
                  outputText("你费了九牛二虎之力，才把自己从血迹斑斑的擂台地板上拖起来，头还在因为那一击而嗡嗡作响。");
               }
               else
               {
                  outputText("你尽力想站起来，但这毫无意义。要让你的肌肉再次听从你晕眩的大脑，需要的不仅仅是动力。");
               }
            }
         }
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         var _loc2_:* = null as Array;
         if(param1.index == 3)
         {
            clearOutput();
            outputText("你决定这一回合不采取任何行动。恶魔很快注意到了你的犹豫。[pg]");
            _loc2_ = ["[say: 你还在等什么？我可是破绽百出啊！]他张开双臂，脸上带着挑衅的笑容说道。","[say: 怎么了？就打我这里]——他笑着敲了敲自己的下巴——[say: 我保证会像石头一样倒下！来吧！]","[say: 觉得热吗？需要点时间冷静一下？真可悲！]他用嘲弄的声音说道。"];
            if(get_game().get_silly())
            {
               _loc2_.push("[say: 你可不是亚历山大！]他用拇指擦了擦鼻子说道。");
            }
            outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
            changeFatigue(-5);
            tookAction = true;
            return false;
         }
         return true;
      }
      
      public function quickJab() : void
      {
         var _loc2_:Number = NaN;
         outputText("[Themonster]向前闪避，试图在极近距离内进行闪电般的刺拳！[pg]");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge().canCounter().setHitChance(get_player().standardDodgeFunc(this,45));
         _loc1_.setCustomCounter("你试图以最快的速度对他的攻击做出反应，并迅速挥下肘部抵挡袭来的刺拳。他的手指痛苦地撞在上面，他不舒服地咕哝了一声，然后向后冲刺到安全的地方。希望你在整个战斗中都能保持这样敏锐的反应！");
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("刺拳打在你的下巴上，让你暂时失去了方向感。它没有造成太大的伤害，但你忍不住对这个恶魔的敏捷感到恼火。");
            get_player().takeDamage(calcDamage() / 3,true);
         }
         else if(_loc1_.isCountered())
         {
            _loc2_ = 0.15 * get_game().combat.calcWeaponDamage(false);
            get_game().combat.doDamage(_loc2_,true,true,false,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(get_fatigue() >= maxFatigue() && !angryDemonfist)
         {
            faint();
            return;
         }
         if(get_game().combat.currAbilityUsed != null && get_game().combat.currAbilityUsed.isMagic() && !angryDemonfist)
         {
            getAngry();
            return;
         }
         _loc1_.add(quickJab,1,true,4,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(twoFer,1,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(eAttack,1,true,1,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(roundhouse,get_player().get_shield() != null ? 0.75 : 0.5,true,10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(crossPunch,1,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.exec();
      }
      
      public function get_scene() : DemonFistFighterScene
      {
         return get_game().bazaar.demonFistFighterScene;
      }
      
      public function getAngry() : void
      {
         outputText("恶魔皱着眉头，朝地上吐了口唾沫，仍然在跳跃和闪避。[say: 你想玩阴的，是吗？你真没用！][pg]恶魔把指关节和脖子按得咔咔作响，明显对你[b:更生气]了！");
         addStatusEffect(new AngeredPugilist(99));
         angryDemonfist = true;
      }
      
      public function faint() : void
      {
         outputText("恶魔精力充沛的动作慢了下来，你注意到他的呼吸变得更沉重了。[pg][say: 我还能继续！我可是为了持久战训练过的！我……][pg]你威胁要再次攻击他，他向后冲刺，这个动作让他彻底筋疲力尽。他踉跄着后退，倒在地上，气喘吁吁，大汗淋漓。他试图再次站起来，但没过多久他就意识到自己现在看起来有多蠢。他呼出一口气，放松下来，对你笑了笑。[pg][say: 看来不行了。我认输。]");
         set_HP(0);
         defeated(true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2075,FlagDict_Impl_.arrayReadInt(_loc2_,2075) + 1);
         get_scene().saveContent.consecutiveLosses = 0;
         if(param1)
         {
            get_scene().playerWins(angryDemonfist);
         }
         else
         {
            get_scene().lustKO(angryDemonfist);
         }
      }
      
      public function crossPunch() : void
      {
         outputText("[Themonster]左腿猛地向前跨出，右臂蓄力准备打出一记交叉拳！[pg]");
         var _loc1_:CombatAttackBuilder = new CombatAttackBuilder().canDodge().canBlock().canParry().setHitChance(get_player().standardDodgeFunc(this));
         var _loc2_:Boolean = !get_player().get_weapon().isAttached() && !get_player().get_weapon().isFist() && (!hasAttemptedBSwordDisarm || get_player().get_weapon().get_id() != get_weapons().B_SWORD.get_id());
         if(_loc2_)
         {
            _loc1_.setCustomParry("你举起[weapon]成功招架住了他的手臂。然而他并没有放弃，他一边将手臂压在你的武器上，一边抓住你[weapon]的另一端，试图将武器从你手中夺走！");
         }
         if(_loc1_.executeAttack().isSuccessfulHit())
         {
            outputText("你没能及时防御，这一拳像巨石一样砸在你的脸上。你失去了平衡，嘴里充满了血腥味，你挣扎着想要站稳。");
            get_player().takeDamage(calcDamage() * 1.25,true);
            outputText("[pg]你及时恢复了理智，在他发动下一次攻击之前拉开了距离。你摸了摸酸痛的下巴和被划破的脸颊，往地上吐了一口混着血水的唾沫，这引来了恶魔的一丝微笑。");
         }
         if(_loc1_.isParried() && _loc2_)
         {
            changeFatigue(10,FATIGUE_PHYSICAL);
            if(Utils.rand(get_player().get_str()) < Utils.rand(get_str()))
            {
               outputText("[pg]尽管你拼命挣扎，他还是成功地把你的武器夺走了！[pg]");
               if(get_player().get_weapon().get_id() == get_weapons().B_SWORD.get_id())
               {
                  outputText("恶魔试图挥舞你的神圣之剑，但当他握住剑柄时，他的手发出了明显的灼烧声。[say:这到底是什么鬼东西？！]他痛苦地呻吟着，困惑地把剑扔到一边，你迅速把它捡了回来。");
                  get_game().combat.doDamage(15 + Utils.rand(15),true,true);
                  hasAttemptedBSwordDisarm = true;
               }
               else
               {
                  outputText("他端详了武器片刻，脸上带着嘲弄的神情。[say:不错，非常不错。介意我试一下吗？]恶魔说着，拿着你自己的武器向你冲来！[pg]");
                  attackWithPlayerWeapon();
                  if(get_player().get_weapon().get_id() == get_weapons().DULLSC.get_id())
                  {
                     outputText("恶魔在发动攻击后呻吟了一声。[say:这是什么被诅咒的武器？]他说道，身体因疼痛而紧绷，脸上满是困惑。");
                     get_game().combat.doDamage(50 + Utils.rand(15),true,true);
                     outputText("[pg]恶魔摇了摇头，把武器扔回给你，对它的性质仍然感到困惑。");
                  }
                  else
                  {
                     outputText("[pg]恶魔笑了笑，把武器扔回给你，你勉强接住并再次挥舞起来。");
                  }
               }
            }
         }
      }
      
      public function attackWithPlayerWeapon() : void
      {
         set_weaponName(get_player().get_weapon().get_name());
         set_weaponVerb(get_player().get_weapon().get_attackVerb());
         set_weaponAttack(get_player().get_weapon().get_attack());
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         eAttack();
         set_weaponName("fists");
         set_weaponVerb("jab");
         set_weaponAttack(0);
         normalAttackAvoid.doParry = true;
         normalAttackAvoid.doCounter = true;
      }
   }
}

