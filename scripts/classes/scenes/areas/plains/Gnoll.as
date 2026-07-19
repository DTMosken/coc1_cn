package classes.scenes.areas.plains
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.ChainedDrop;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class Gnoll extends Monster
   {
      
      public function Gnoll()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("gnoll");
         imageName = "gnoll";
         set_long("这个瘦长的身影" + (get_game().get_noFur() ? "大部分像人类，小腿和前臂覆盖着皮毛，" : "") + "粗糙的黄褐色皮毛上布满了黑色的斑点。结实的肌肉在长长的手脚上起伏，似乎永远处于狂热的运动中：每一刻都像是在半退缩半猛扑。她的头" + (get_game().get_noFur() ? "除了毛茸茸的鬣狗耳朵外，像人类一样，她的表情" : "带着黑色的口鼻") + "永远挂着淫笑，明亮的橙色眼睛带着野蛮动物的狡黠注视着你。在她的双腿之间，挂着一个乍看之下像是一根细长阴茎的东西；然而，仔细观察就会发现，那是一个由拉长的阴唇和阴蒂组成的融合皮管。这个鬣狗娘长着一根伪阴茎，而且从她来回躲闪时它翘得更高来看，她很高兴见到你！\n\n她穿着从其他稍小生物那里捡来的破烂布条，一只手紧紧抓着一根扭曲的棍棒。");
         set_race("Gnoll");
         createVagina(false,4,2);
         createBreastRow(Appearance.breastCupInverse("C"));
         ass.analLooseness = 4;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,25,0,0,0);
         set_tallness(72);
         hips.rating = 6;
         butt.rating = 2;
         skin.tone = "tawny";
         skin.setType(1);
         hair.color = "black";
         hair.length = 22;
         initStrTouSpeInte(80,70,75,60);
         initLibSensCor(65,25,60);
         set_weaponName("twisted club");
         set_weaponVerb("smash");
         set_weaponAttack(0);
         set_weaponPerk([]);
         set_weaponValue(25);
         set_armorName("skin");
         set_armorDef(2);
         bonusHP = 250;
         set_lust(30);
         lustVuln = 0.35;
         temperment = 2;
         level = 14;
         set_gems(10 + Utils.rand(5));
         set_drop(new ChainedDrop().add(get_consumables().REDUCTO,0.2).add(get_consumables().SUCMILK,0.5).add(get_consumables().GNOLSPT,0.5).elseDrop(get_consumables().BLACK_D));
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有被吓退...");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().plains.gnollScene.getRapedByGnoll();
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(eAttack,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(gnollTease,1,true,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.exec();
      }
      
      public function gnollTease() : void
      {
         var _loc1_:Number = Utils.rand(6);
         var _loc2_:Number = 0;
         if(_loc1_ == 0)
         {
            outputText("豺狼人花了一点时间伸展她那光滑健壮的身体。她空闲的手顺着身体侧面向上抚摸，并心照不宣地向你抛了个媚眼。");
            _loc2_ += 5;
         }
         else if(_loc1_ == 1)
         {
            outputText("鬣狗娘用一只手抓住她那八英寸长的阴蒂并抚摸着。[say: 我知道你很好奇！]她笑道。[say: 你想试试这个。]");
            _loc2_ += 5;
         }
         else if(_loc1_ == 2)
         {
            outputText("豺狼人向前跃出，但她并没有攻击你，而是将她柔软的身体贴在你的身上。[say: 我们没必要打架，]她娇笑着。[say: 如果我直接操你，事情会简单得多。]");
            _loc2_ += 10;
         }
         else if(_loc1_ == 3)
         {
            outputText("豺狼人的手指顺着她的伪阴茎滑下，收集着从末端滴落的乳白液体。几步之间，她就突破了你的防线，但她只是在你的鼻子前挥了挥手。那股浓烈的性爱气味几乎要把你熏倒了。");
            _loc2_ += 12;
         }
         else if(_loc1_ == 4)
         {
            outputText("[say: 我喜欢外乡人，]豺狼人一边绕着你转圈，一边向你吐露心声。[say: 当你们被用新的方式操时，叫声总是那么有趣。]她大笑着，那声音大得有些离谱。");
         }
         else
         {
            outputText("豺狼人向前舞动，然后又退后，她整个身体都充满了性感的律动。她捕捉到了你注视她的目光，得意地笑了笑，特意为你扭了扭臀部。");
            _loc2_ += 6;
         }
         get_player().takeLustDamage(_loc2_ + 10 + get_player().lib / 20 + Utils.rand(get_player().cor / 20),true);
         outputText("\n");
      }
      
      override public function eAttack() : void
      {
         var _loc1_:Number = 0;
         if(playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,true,null,null,null)))
         {
            return;
         }
         var _loc2_:Number = Utils.rand(6);
         if(_loc2_ == 0)
         {
            outputText("豺狼人向前猛扑，她的下巴狠狠地咬住了你的上臂。在你碰到她之前，她就扭身躲开了，全程都在大笑。");
            _loc1_ += 10;
         }
         else if(_loc2_ == 1)
         {
            outputText("伴随着一阵颤抖和踉跄，豺狼人猛地撞向你的腹部，她空着的那只手的爪子在你的肚子上划过。");
            _loc1_ += 3;
         }
         else if(_loc2_ == 2)
         {
            outputText("豺狼人翻滚到地上，然后抓起一把沙子站了起来。沙子扬了你一脸；棍棒砸在了你的脸颊上。哎哟。");
            _loc1_ += 13;
         }
         else if(_loc2_ == 3)
         {
            outputText("鬣狗娘咯咯笑着向前冲去，牙齿咔嗒作响。唾沫横飞，她那咔嗒作响的牙齿找到了目标，在你的身体上划出了一道道红色的血痕。");
            _loc1_ += 8;
         }
         else if(_loc2_ == 4)
         {
            outputText("伴随着嘲弄的笑声，豺狼人高高举起她的棍棒，然后狠狠地砸下，击中了你的太阳穴。");
            _loc1_ += 25;
         }
         else
         {
            outputText("豺狼人威胁地挥舞着她的棍棒，但却是她的脚从满是灰尘的平原上踢起，踢中了你的腹部。");
         }
         get_player().takeDamage(get_player().reduceDamage(_loc1_ + get_str() + get_weaponAttack(),this),true);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().plains.gnollScene.defeatHyena();
      }
   }
}

