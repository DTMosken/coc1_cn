package classes.items.useables
{
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Useable;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class RubberBall extends Useable
   {
      
      public function RubberBall(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super("RBRBALL","Rubber Ball","a bouncy rubber ball",10,"A firm, dark-purple ball that bounces when impacting objects. With practice, you could catch it after it bounces back. A favorite among children.");
         invUseOnly = true;
      }
      
      override public function useItem() : Boolean
      {
         var showNext:Boolean;
         var item:Useable;
         var _g:Inventory;
         var _loc1_:* = null as Combat;
         var _loc2_:* = null as Creature;
         var _loc3_:* = null as Creature;
         var _loc4_:Number = NaN;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         if(get_game().get_inCombat())
         {
            if(get_player().get_weapon() == get_weapons().BAT)
            {
               outputText("你从包里拿出一个橡胶球，把它抛向空中，然后用尽全力挥动球棒，将球高速击向[themonster]！");
            }
            else
            {
               switch(Utils.rand(4))
               {
                  case 0:
                     outputText("你把弹力球扔向[themonster]");
                     break;
                  case 1:
                     outputText("你高速投出球");
                     break;
                  case 2:
                     outputText("你用力掷出橡胶球");
                     break;
                  case 3:
                     outputText("你把球弹向[themonster]");
               }
            }
            outputText("，");
            if(get_monster().get_short() == "goo-girl" || get_monster().get_short() == "green slime")
            {
               outputText("拍打在无定形的粘液上。这看起来是一次令人不快的撞击，但球完全没入了它们体内。看来你现在拿不回来了。");
               FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_useables().RBRBALL.get_id());
            }
            else
            {
               _loc1_ = get_combat();
               _loc2_ = get_player();
               _loc3_ = get_monster();
               if(Boolean(_loc1_.combatAvoidDamage(new AvoidDamageParameters(true,false,true,null,null,get_monster().standardDodgeFunc(get_player(),get_player().get_weapon() == get_weapons().BAT ? -10 : 10),_loc2_,_loc3_)).attackFailed))
               {
                  outputText("完全没打中，小物件很容易就被躲开了。");
               }
               else
               {
                  outputText("用高速飞行的玩具狠狠地砸了你的对手。那可能很疼。");
                  get_game().combat.damageType = "PhysicalR";
                  _loc4_ = 20 + Utils.rand(20);
                  if(get_player().get_weapon() == get_weapons().BAT)
                  {
                     _loc4_ += get_game().combat.calcWeaponDamage(false);
                  }
                  _loc4_ = get_game().combat.doDamage(get_monster().reduceDamageCombat(_loc4_),true,true);
                  if(!(Utils.rand(100) + get_player().get_spe() < 50 || get_player().get_weapon() == get_weapons().BAT && Utils.randomChance(33)))
                  {
                     outputText("[pg]球从敌人身上反弹，向你飞来。你很轻松地接住了它，准备再次投掷。");
                     get_inventory().returnItemToInventory(this);
                     return true;
                  }
                  outputText("[pg]虽然球从撞击点反弹，但它却朝着远离你的方向乱飞。");
               }
            }
            return false;
         }
         _loc5_ = [1,2,3];
         if(get_player().isGoo())
         {
            _loc5_.push(4);
         }
         if(get_player().canFly())
         {
            _loc5_.push(5);
         }
         _loc6_ = int(_loc5_[Utils.rand(int(_loc5_.length))]);
         switch(_loc6_)
         {
            case 1:
               outputText("手里拿着橡胶球，你把它扔在地上，让它高高弹起，以此来打发时间。" + (get_player().get_spe() < 20 ? "球弹起后总是偏离你很远，迫使你跑去捡，但你还是觉得玩起来很有趣。" : (get_player().get_spe() < 50 ? "当球弹开时，你冲到合适的位置去接它。有时你会失手，但这是个打发时间的好方法。" : "球弹开，撞到周围的其他物体，然后反弹回你身边。以你的专业水平，你完美地接住了它，并重复这个过程。")));
               break;
            case 2:
               outputText("你把橡胶球扔向附近的一块石头，导致它以一个尴尬的角度刚好从你头顶弹过。" + (get_player().get_spe() < 20 ? "你茫然地盯着，眨了几下眼睛，庆幸它没打中你的脸。因为一切发生得太快了，你花了几分钟才找到球掉在哪里" : (get_player().get_spe() < 50 ? "出于条件反射，你躲开了，球从你身后飞过。幸运的是，球并不难找" : "反应迅速，你接住了它")) + "。你继续把球扔向石头，磨练你预测它反弹角度的能力，并尽可能多地接住它。");
               break;
            case 3:
               outputText("你把球扔来扔去，让它弹来弹去。" + (get_game().akky.isOwned() ? "[akky]的眼睛睁得大大的，瞳孔放大，一看到球就行动起来。他跳起来想在球飞的时候抓住它，但你还是设法再次抓住了它。你觉得很有趣，开始和[akky]玩耍，看着他跑来跑去追赶玩具。" : ""));
               break;
            case 4:
               outputText("你把球扔向" + (get_camp().get_builtWall() ? "墙壁" : "一块石头") + "，当玩具反弹回来猛烈撞击你粘滑的身体时，你稍微震了一下。这发生得太突然了，球直接滑了进去。你小心翼翼地从你的身体里取出这个物体，庆幸自己缺乏刚性。");
               break;
            case 5:
               outputText("当你把玩具弹来弹去时，它飞到了天上。你跳起来在它飞得太远之前接住它，拍打着你的[wings]来帮助你。" + (!get_player().hasBigWings() ? "它们几乎帮不上什么忙，但你也没有受伤。最重要的是，你成功地在球落下时接住了它！" : "在你优雅的飞行中，你判断出球落下时的轨迹，并滑翔到它的路线上接住了它。"));
         }
         menu();
         _g = get_inventory();
         item = this;
         showNext = false;
         addButton(0,"继续",function():void
         {
            _g.returnItemToInventory(item,showNext);
         });
         return true;
      }
   }
}

