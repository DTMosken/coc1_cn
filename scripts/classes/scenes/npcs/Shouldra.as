package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.ReactionContext;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Shouldra extends Monster
   {
      
      public function Shouldra()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("plain girl");
         imageName = "shouldra";
         set_long((ghostLoli() ? "她看起来像个小女孩，大概十二岁左右。" : "") + "她的脸并没有什么特别吸引人的地方；脸颊上散布着雀斑，眉毛太粗犷，算不上女性化，下巴也有点方。尽管如此，这些特征组合在一起，却构成了一张令人愉悦的面容，配上时髦的棕色波波头。她的胸部被灰色宽松的束腰外衣遮住，外衣下摆垂到大腿中部。她的腿上穿着紧身合体的皮马裤，一双舒适的皮鞋保护着她的脚底免受周围潜在有害环境的伤害。");
         set_race("Human?");
         createVagina(false,2,1);
         createStatusEffect(StatusEffects.BonusVCapacity,40,0,0,0);
         createBreastRow(Appearance.breastCupInverse(ghostLoli() ? "A" : "C"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(ghostLoli() ? 57 : 65);
         var _loc1_:Number = ghostLoli() ? 0 : 6;
         hips.rating = _loc1_;
         var _loc2_:Number = ghostLoli() ? 2 : 5;
         butt.rating = _loc2_;
         skin.tone = "white";
         hair.color = "white";
         hair.length = 3;
         initStrTouSpeInte(45,30,5,110);
         initLibSensCor(100,0,33);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_armorName("comfortable clothes");
         bonusHP = 30;
         set_lust(10);
         temperment = 1;
         level = 4;
         set_gems(0);
         set_drop(new ChainedDrop().add(get_consumables().ECTOPLS,0.3333333333333333));
         createPerk(PerkLib.BlindImmune);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().shouldraScene.loseToShouldra();
      }
      
      public function shouldrattack() : void
      {
         var _loc10_:Number = NaN;
         var _loc1_:Number = 0;
         doNext(get_game().playerMenu);
         var _loc2_:String = "[BLIND]女孩涉水过来挥出一击，但你灵巧地闪向一旁。她迅速恢复平衡，转身再次面向你。";
         var _loc3_:String = "[SPEED]女孩涉水过来挥出一击，但你灵巧地闪向一旁。她迅速恢复平衡，转身再次面向你。";
         var _loc4_:String = "[EVADE]女孩涉水过来挥出一击，但你灵巧地闪向一旁。她迅速恢复平衡，转身再次面向你。";
         var _loc5_:String = "[MISDIRECTION]女孩涉水过来挥出一击，但你巧妙地误导了她，避开了攻击。她迅速恢复平衡，转身再次面向你。";
         var _loc6_:String = "[FLEXIBILITY]女孩涉水过来挥出一击，但你灵巧地扭动柔软的身体躲开了。她迅速恢复平衡，转身再次面向你。";
         var _loc7_:String = "[UNHANDLED]女孩涉水过来挥出一击，但你灵巧地闪向一旁。她迅速恢复平衡，转身再次面向你。";
         var _loc8_:String = "[PARRY]女孩涉水过来挥出一击，但你用你的[weapon]格挡了这一击。她迅速恢复平衡，转身再次面向你。";
         var _loc9_:AvoidDamageParameters = new AvoidDamageParameters(true,true,false,null,false,null,null,null);
         if(!playerAvoidDamage(_loc9_))
         {
            _loc10_ = Utils.rand(3);
            if(_loc10_ == 0)
            {
               outputText("女孩低头靠近，一拳重重地打在你的腹部，留下一阵刺痛。");
            }
            else if(_loc10_ == 1)
            {
               outputText("女孩佯装冲锋，向后倾斜，一脚踢在你的[hips]上。你踉跄了一下，调整姿势，重新投入战斗。");
            }
            else if(_loc10_ == 2)
            {
               outputText("当女孩似乎绊倒时，你暂时放下了防备。当你向前迈步时，她稳住了身子，并在你的躯干上打出了一套一二连击。");
            }
            get_player().takeDamage(_loc1_,true);
            if(_loc1_ > 0)
            {
               if(lustVuln > 0 && get_player().get_armor() == get_game().armors.BONSTRP)
               {
                  outputText("\n" + get_capitalA() + Utils.cnName(get_short()) + " 擦过你暴露的皮肤，惊讶地猛然后退，因为看到你暴露了这么多而微微脸红。");
                  set_lust(get_lust() + 5 * lustVuln);
               }
            }
         }
         statScreenRefresh();
      }
      
      public function shouldraMagicLazers() : void
      {
         outputText("女孩后退一步，举起一只手，施放了一个小法术。从她的指尖射出四枚魔法飞弹，猛烈地击中你的皮肤，引起了令人惊讶的不适感。");
         get_player().takeDamage(16 + level + Utils.rand(10),true);
      }
      
      public function shouldraLustAttack() : void
      {
         if(Utils.rand(2) == 0)
         {
            outputText("女孩从你的一次挥击中旋转躲开，她的束腰外衣在臀部周围飘扬。这个动作让你清楚地看到了她" + (ghostLoli() ? "娇小、少女般" : "紧实且适度丰满") + "的臀部。她注意到了你的目光，并对你眨了眨眼。\n");
         }
         else
         {
            outputText("女孩的脚互相绊了一下，摔倒在地上。在你利用她的失误之前，她顺势翻滚，平稳地站了起来。然而，当她起身时，你向后退缩，困惑地挑起眉毛；她的乳房是不是填满了原本宽松的束腰外衣？她注意到了你的目光，笑了笑，在脚跟上做了一个小小的脚尖旋转，然后再次面对你。当她的躯干重新回到视线中时，你的困惑只增不减，她的乳房恢复了正常的比例。也许是光线的错觉？你摇了摇头，试图跟上战斗的节奏。");
         }
         get_player().takeLustDamage(8 + get_player().lib / 10,true);
      }
      
      override public function react(param1:ReactionContext) : Boolean
      {
         if(param1.index == 5)
         {
            outputText("令人惊讶的是，你的法术似乎对她毫无效果，当你困惑地站着时，差点被一记回旋踢击中。女孩对你露出灿烂的笑容，战斗继续。");
            return false;
         }
         return true;
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(shouldrattack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(shouldraLustAttack,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(shouldraMagicLazers,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function ghostLoli() : Boolean
      {
         return get_game().shouldraScene.ghostLoli();
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().shouldraScene.defeatDannyPhantom();
      }
   }
}

