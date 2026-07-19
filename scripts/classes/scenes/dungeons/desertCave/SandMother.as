package classes.scenes.dungeons.desertCave
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SandMother extends Monster
   {
      
      public var preparingGigaFire:Boolean;
      
      public var damageTaken:Number;
      
      public function SandMother()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         damageTaken = 0;
         preparingGigaFire = false;
         super();
         set_a("");
         set_short("Sand Mother");
         imageName = "sandmother";
         set_long("沙之母是一个身材高大、胸部丰满的女人。她穿着比她的姐妹们更丝滑、更具王者风范的长袍，但这长袍几乎无法包裹住她那四只充满乳汁的乳房，在它们摇晃的重量下紧绷着。沙之母白金色的头发在她周围呈扇形散开，长长地垂在身后，以一种奇特的方式让你联想到光环。这位女巫女王正颇具威胁地挥舞着一根珍珠白色的权杖，不过从她握着它的方式来看，很明显她并不打算把它当作物理武器来使用。");
         set_race("Human?");
         createVagina(false,2,2);
         createStatusEffect(StatusEffects.BonusVCapacity,70,0,0,0);
         createBreastRow(Appearance.breastCupInverse("DD"));
         createBreastRow(Appearance.breastCupInverse("DD"));
         ass.analLooseness = 1;
         ass.analWetness = 1;
         createStatusEffect(StatusEffects.BonusACapacity,50,0,0,0);
         set_tallness(102);
         hips.rating = 10;
         butt.rating = 8;
         skin.tone = "bronzed";
         hair.color = "platinum-blonde";
         hair.length = 15;
         initStrTouSpeInte(55,55,35,45);
         initLibSensCor(55,40,30);
         set_weaponName("fists");
         set_weaponVerb("punches");
         set_weaponAttack(0);
         set_weaponPerk([]);
         set_weaponValue(150);
         set_armorName("robes");
         set_armorDef(1);
         bonusHP = 130;
         set_lust(20);
         lustVuln = 0.6;
         temperment = 3;
         level = 7;
         set_gems(Utils.rand(15) + 55);
         createPerk(PerkLib.StunImmune,0,0,0,0);
         createPerk(PerkLib.Focused,0,0,0,0);
         createPerk(PerkLib.ImprovedSelfControl,0,0,0,0);
         createPerk(PerkLib.SpellcastingAffinity,65,0,0,0);
         createPerk(PerkLib.SpeedyRecovery,0,0,0,0);
         createPerk(PerkLib.ControlledBreath);
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().dungeons.desertcave.loseToTheSandMother();
      }
      
      override public function set_HP(param1:Number) : Number
      {
         if(preparingGigaFire && param1 < get_HP())
         {
            damageTaken += get_HP() - param1;
         }
         return _HP = param1;
      }
      
      public function sandWitchMotherAI() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         if(!hasStatusEffect(StatusEffects.Sandstorm))
         {
            sandStormAttack();
            return;
         }
         if(preparingGigaFire)
         {
            gigaFire2();
            return;
         }
         _loc1_.add(getWhispered,1,!get_player().hasStatusEffect(StatusEffects.Whispered),15,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(eatALightningBolt,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(gigaFire,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.add(earthShield,1,!hasStatusEffect(StatusEffects.Earthshield),10,FATIGUE_MAGICAL,CombatRange.Self);
         _loc1_.add(sandMotherTelekinesis,1,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         _loc1_.exec();
      }
      
      public function sandStormAttack() : void
      {
         outputText("沙之母得意地笑了笑，宣告道：[say: 你不只是在和我战斗，还有这变移的沙子。]她漫不经心地弹了弹手腕，沙子从地板、墙壁，甚至各个地方升起。在无形之风的吹拂下，沙子开始旋转，整个房间都被卷入了一场变移的沙尘暴中。沙砾不断地试图钻进你的眼睛。你很可能会时不时地被它迷住眼睛。");
         createStatusEffect(StatusEffects.Sandstorm,0,0,0,0);
      }
      
      public function sandMotherTelekinesis() : void
      {
         outputText("她眯起眼睛看着你，一股巨大的魔法压力向你袭来，抓住了你。它将你在半空中旋转，然后狠狠地砸向墙壁！");
         var _loc1_:Number = 100;
         var _loc2_:Number = get_player().thickness / 100 + 0.5;
         _loc1_ += get_player().get_tallness() * _loc2_;
         if(_loc1_ < 140)
         {
            outputText("你立刻希望自己不要这么小巧，因为你确信她不可能这么轻易地把一个更重的勇者扔出去。");
         }
         else if(_loc1_ >= 200)
         {
            outputText("你很庆幸自己的体型，因为她似乎无法像她希望的那样快地把你加速撞向石头。有时候吃得多还是有回报的。");
         }
         var _loc3_:Number = _loc1_ / 170;
         var _loc4_:Number = 20;
         _loc4_ = _loc3_ * _loc4_;
         get_player().takeDamage(_loc4_,true);
      }
      
      override public function performCombatAction() : void
      {
         sandWitchMotherAI();
      }
      
      public function gigaFire2() : void
      {
         get_game().combat.monsterDamageType = "Fire";
         var _loc1_:int = 40 + Utils.rand(11);
         if(damageTaken < 10)
         {
            outputText("沙之母双手握住权杖，将环绕在权杖上的火焰汇聚成一场巨大而耀眼的烈焰。她指向你，火焰如巨蛇般席卷而出，在你试图躲避时向你扭曲缠绕，每当落空便会折返。根本无法躲避！你被吞噬的火焰包围了！");
            _loc1_ *= 3;
         }
         else
         {
            outputText("沙之母被你重击后跌回地面，她捂住头，一团火焰熄灭了。她及时恢复过来，抓起法杖向你掷去，但力量只有她预期的一小部分。尽管如此，它依然灼烧着你。");
         }
         get_player().takeDamage(_loc1_,true);
         preparingGigaFire = false;
         damageTaken = 0;
      }
      
      public function gigaFire() : void
      {
         outputText("沙之母松开权杖，张开双手，每只手上都闪烁着诡异的白色火焰。她闭上眼睛集中精神，脚跟慢慢离开地面漂浮起来。你能感觉到力量和热浪从她身上一波波地涌来，如果你不设法打断她，你很可能会被烤成焦炭。");
         if(get_player().get_inte() > 40)
         {
            outputText("她甚至看都没看你一眼，似乎对情欲的干扰无动于衷。也许你可以用力打她一下，打破她的专注。");
         }
         preparingGigaFire = true;
         damageTaken = 0;
      }
      
      public function getWhispered() : void
      {
         outputText("女巫动了动嘴唇，[say: 你能听到我说话吗？]她的声音侵入了你的脑海，与她的口型一字不差。她用言语和思想淹没了你的心智，全都是关于你的失败或屈服，一个比一个更贬低、更羞辱人。也许最糟糕的是那些她将你彻底击溃后交由莉希丝处置的画面……这些混乱的思想和情绪既让你震惊又让你兴奋，让你在努力理清受困的意识时无法发动攻击。");
         get_player().createStatusEffect(StatusEffects.Whispered,0,0,0,0);
         get_player().takeLustDamage(15,true);
      }
      
      public function eatALightningBolt() : void
      {
         outputText("她将法杖收回，抬起空着的那只手，手指呈扇形张开。火花在她纤细的指间跳跃，像蛇一样缠绕着。刹那间，火花涌向她的掌心，爆发出了一道闪电，瞬间且无可避免地击中了你！");
         var _loc1_:int = 30 + Utils.rand(10);
         get_player().takeDamage(_loc1_,true);
      }
      
      public function earthShield() : void
      {
         outputText("这位八英尺高的女巫将权杖指向地面，突然闷哼一声，仿佛举起千钧重物般将其抬起。当这根小巧的法杖经过她的胸前时，地面的碎石和岩块开始升空，加速形成一个环绕着她的泥土漩涡。<b>现在物理攻击很难打中她了！</b>");
         createStatusEffect(StatusEffects.Earthshield,0,0,0,0);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().dungeons.desertcave.defeatTheSandMother();
      }
   }
}

