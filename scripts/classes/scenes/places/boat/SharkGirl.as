package classes.scenes.places.boat
{
   import classes.Appearance;
   import classes.CoC;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffects;
   import classes.display.SpriteDb;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class SharkGirl extends Monster
   {
      
      public function SharkGirl()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         set_a("");
         set_short("shark-girl");
         imageName = "sharkgirl";
         set_long("鲨鱼女孩身高[if (metric) {超过165厘米|将近五英尺半}]，灰色的皮肤[if (!isSwimming) {在[sun]光下闪烁着水珠的光芒}]，有着为游泳而生的修长肌肉。她齐肩的银发拂过她漂亮的脸庞，眼睛是引人注目的红色。她有一排排令人生畏的锋利牙齿在光线下闪闪发光。一条鱼一样的尾巴从她的背后伸出，一有机会就缠绕在她结实的腿上。她穿着一件相当暴露的黑色比基尼，系带的系法使它们在她的鳍周围移动；尽管泳衣本身几乎遮不住她挺拔的双乳和紧致的私处。");
         set_race("Shark-Morph");
         createVagina(false,4,1);
         createStatusEffect(StatusEffects.BonusVCapacity,15,0,0,0);
         createBreastRow(Appearance.breastCupInverse("D"));
         ass.analLooseness = 1;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,40,0,0,0);
         set_tallness(65);
         hips.rating = 8;
         butt.rating = 8;
         skin.tone = "gray";
         hair.color = "silver";
         hair.length = 16;
         initStrTouSpeInte(40,40,55,42);
         initLibSensCor(75,35,40);
         set_weaponName("shark teeth");
         set_weaponVerb("bite");
         set_weaponAttack(3);
         normalAttackAvoid.doParry = false;
         normalAttackAvoid.doCounter = false;
         set_armorName("tough skin");
         set_armorDef(5);
         bonusHP = 20;
         set_lust(40);
         lustVuln = 0.9;
         temperment = 2;
         level = 4;
         set_gems(Utils.rand(15) + 5);
         set_drop(new WeightedChoice().add(get_consumables().L_DRAFT,3).add(get_armors().S_SWMWR,1).add(get_consumables().SHARK_T,5).add(null,1));
         special1 = sharkTease;
         special2 = sharkTease;
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         if(param2)
         {
            outputText("[pg]你的敌人似乎并没有觉得恶心到要离开……");
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            get_game().boat.sharkGirlScene.sharkLossRape();
         }
      }
      
      public function sharkTease() : void
      {
         get_game().spriteSelect(SpriteDb.get_s_sharkgirl());
         if(Utils.rand(2) == 0)
         {
            outputText("你向鲨鱼女孩冲去，准备发动攻击，但当她弯下腰，向你扭动她结实的屁股时，你[if (isSwimming) {在水中挣扎|停下了脚步}]。这让你分心了足够长的时间，她的尾巴甩了出来，把你[if (isSwimming) {拍飞|打倒在地}]。她娇嗔道：[if (isSwimming && silly) {[say: 咕噜……咕噜咕噜！]|[say: 噢……你真的很喜欢我嘛！]}]");
            get_player().takeDamage(4 + Utils.rand(4),true);
            get_player().takeLustDamage(10 + get_player().lib / 20,true);
         }
         else
         {
            outputText("你收回你的[weapon]，[if (isSwimming) {加快速度|助跑}]准备发动攻击。鲨鱼女孩得意地笑了笑，拉起她的比基尼上衣，向你抖动她挺拔的双乳。你[if (isSwimming) {犹豫了|突然停下}]，被眼前的景象激起了性欲，就在这短暂的时间里，鲨鱼女孩一脚踢在你的脸上，把你[if (isSwimming) {踢飞|踢倒在地}]。她戏弄道：[if (isSwimming && silly) {[say: 咕噜，咕噜咕噜，咕噜咕噜噜！]|[say: 噢，别担心宝贝，你马上就能得到全套服务了！]}]");
            get_player().takeDamage(4 + Utils.rand(4),true);
            get_player().takeLustDamage(5 + get_player().lib / 10,true);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(sharkTease,2,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(eAttack,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.exec();
      }
      
      override public function outputAttack(param1:int) : void
      {
         super.outputAttack(param1);
         if(param1 > 0 && Utils.rand(3) == 0)
         {
            if(get_player().bleed(this))
            {
               outputText("\n鲨鱼女孩锋利的牙齿撕裂了你的皮肤，鲜血随着你的心跳喷涌而出！你<b>流血了！</b>");
            }
         }
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().boat.sharkGirlScene.sharkWinChoices();
      }
   }
}

