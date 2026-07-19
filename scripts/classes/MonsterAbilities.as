package classes
{
   import classes.internals.Utils;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class MonsterAbilities extends BaseContent
   {
      
      public function MonsterAbilities()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function whitefire() : void
      {
         outputText("[Themonster]眯起[monster.his]眼睛，带着致命的杀意集中[monster.his]精神。[Monster.he]打了个响指，你被一阵白色的火焰包围了！");
         var _loc1_:int = int((get_monster().get_inte() + Utils.rand(50)) * get_monster().spellMod());
         if(get_player().isGoo())
         {
            _loc1_ *= 1.5;
            outputText("效果拔群！");
         }
         get_player().takeDamage(_loc1_,true);
      }
      
      public function wait() : void
      {
         outputText("[Themonster]等待着[monster.s]。");
         get_monster().changeFatigue(-10);
      }
      
      public function might() : void
      {
         outputText("[Themonster]涨红了脸，汲取[monster.his]身体的欲望来强化[monster.his]肌肉并让[monster.his]变得更加坚韧。");
         outputText("成功与力量的快感流遍[monster.his]全身。[Monster.he]感觉自己无所不能！");
         get_monster().createStatusEffect(StatusEffects.Might,20 * get_monster().spellMod(),20 * get_monster().spellMod(),0,0);
         var _loc1_:Monster = get_monster();
         _loc1_.set_str(_loc1_.get_str() + 20 * get_monster().spellMod());
         var _loc2_:Monster = get_monster();
         _loc2_.set_tou(_loc2_.get_tou() + 20 * get_monster().spellMod());
      }
      
      public function heal() : void
      {
         outputText("[Themonster]将注意力集中在[monster.his]身体和结束痛苦的渴望上，试图汲取[monster.his]的性奋而不使其增强。");
         var _loc1_:int = int((int(10 + get_monster().get_inte() / 2 + Utils.rand(get_monster().get_inte() / 3))) * get_monster().spellMod());
         outputText("随着[monster.his]伤口开始愈合，[Monster.he]因成功而涨红了脸！<b>(<font color=\"" + get_game().mainViewManager.colorHpPlus() + "\">+" + _loc1_ + "</font>)</b>.");
         get_monster().addHP(_loc1_);
      }
      
      public function distanceSelfWait() : void
      {
         outputText("[pg]你等待着，任由[themonster]拉开距离。\n\n");
         get_game().combatRangeData.moveMonsterDistant(get_monster());
         get_game().combat.execMonsterAI(get_game().combat.currMonsterIndex + 1);
      }
      
      public function distanceSelfChase() : void
      {
         outputText("\n你追赶着[themonster]，试图不让[monster.him]拉开任何距离。\n");
         get_player().changeFatigue(10,2);
         if(!get_monster().reactWrapper(ReactionContext.Approached))
         {
            get_game().combatRangeData.moveDistantSafe(get_monster());
            outputText("\n");
            return;
         }
         if(Utils.randomChance(get_player().movementChance(get_monster())))
         {
            outputText("你成功跟上了[themonster]，你们双方都保持在近战范围内。\n\n");
         }
         else
         {
            outputText("你没能跟上[monster.him]，[monster.he]成功地与你拉开了距离！\n\n");
            get_game().combatRangeData.moveMonsterDistant(get_monster());
         }
         get_game().combat.execMonsterAI(get_game().combat.currMonsterIndex + 1);
      }
      
      public function distanceSelf() : void
      {
         get_monster().moveCooldown = 3;
         get_game().combat.blockTurn = true;
         outputText("[Themonster]做好准备，向后冲刺，与你拉开了一些距离！");
         get_game().combat.combatAbilities.tfScorchCheck();
         if(get_player().canMove())
         {
            get_game().menu();
            get_game().addButton(0,"追击",distanceSelfChase).hint("追击敌人！");
            get_game().addButton(1,"等待",distanceSelfWait).hint("静静等待。");
            get_game().combat.combatAbilities.whipTripFunc.createButton(2);
            get_game().combat.combatAbilities.vineTripFunc.createButton(2);
         }
         else
         {
            get_game().combat.blockTurn = false;
            outputText("[pg]你等待着，任由[themonster]拉开距离。\n\n");
            get_game().combatRangeData.moveMonsterDistant(get_monster());
         }
      }
      
      public function chargeweapon() : void
      {
         outputText("[Themonster]念出力量之语，在[monster.his]" + get_monster().get_weaponName() + "周围召唤出一股电荷。<b>看来[monster.he]现在能造成更多物理伤害了！</b>");
         get_monster().createStatusEffect(StatusEffects.ChargeWeapon,25 * get_monster().spellMod(),0,0,0);
      }
      
      public function blind() : void
      {
         outputText("[Themonster]怒视着你并指着你！一道强光在你面前爆发！");
         if(Utils.rand(get_player().get_inte() / 5) <= 4)
         {
            outputText("<b>你失明了！</b>");
            get_player().createStatusEffect(StatusEffects.Blind,1 + Utils.rand(3),0,0,0);
         }
         else
         {
            outputText("你在千钧一发之际眨了眨眼！");
         }
      }
      
      public function arouse() : void
      {
         outputText("[Themonster]做出一系列神秘的手势，汲取[monster.his]的欲望并将其施加在你身上！");
         var _loc1_:int = int(get_monster().get_inte() / 10 + get_player().lib / 10 + Utils.rand(10) * get_monster().spellMod());
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function approachWait() : void
      {
         outputText("[pg]你等待着，让[themonster]靠近你。\n");
         get_game().combatRangeData.closeDistance(get_monster());
         get_game().combat.execMonsterAI(get_game().combat.currMonsterIndex + 1);
      }
      
      public function approachDistance() : void
      {
         outputText("[pg]你拉开与[themonster]的距离，试图阻止[monster.him]靠近你。\n");
         get_player().changeFatigue(10,2);
         if(!get_monster().reactWrapper(ReactionContext.Distanced))
         {
            get_game().combatRangeData.closeDistance(get_monster());
            outputText("\n");
            return;
         }
         if(Utils.randomChance(get_player().movementChance(get_monster())))
         {
            outputText("你成功拉开了与[themonster]的距离。\n");
         }
         else
         {
            outputText("你跟不上[monster.his]速度，[monster.he]成功拉近了你们之间的距离！\n\n");
            get_game().combatRangeData.closeDistance(get_monster());
         }
         get_combat().execMonsterAI(get_combat().currMonsterIndex + 1);
      }
      
      public function approach() : void
      {
         get_game().combat.blockTurn = true;
         outputText("[Themonster]做好了准备，向你冲来，企图拉近距离！");
         get_game().combat.combatAbilities.tfScorchCheck();
         if(get_player().canMove())
         {
            get_game().menu();
            get_game().addButton(0,"拉开距离",approachDistance).hint("尽量保持距离！");
            get_game().addButton(1,"等待",approachWait).hint("只需等待。");
         }
         else
         {
            outputText("[pg]你等待着，让[themonster]靠近你。\n");
            get_game().combatRangeData.closeDistance(get_monster());
         }
      }
   }
}

