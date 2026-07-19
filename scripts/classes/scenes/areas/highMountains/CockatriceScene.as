package classes.scenes.areas.highMountains
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.StareMonster;
   import classes.scenes.monsters.pregnancies.PlayerCockatricePregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CockatriceScene extends BaseContent
   {
      
      public function CockatriceScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerCockatricePregnancy(param1);
      }
      
      public function rideCockatriceForeplay() : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         clearOutput();
         var _loc1_:int = 0;
         var _loc2_:int = 1;
         var _loc3_:int = 2;
         var _loc4_:Number = _loc1_;
         outputText("你慢慢走向鸡蛇怪，");
         get_player().biggestTitSize();
         if(get_player().get_armor() != ArmorLib.NOTHING)
         {
            outputText("一边靠近一边脱下你的[armor]，");
         }
         outputText("站在他上方，好好打量着他。现在他不催你了，你可以看出他有一张相当迷人的脸，混合着调皮和善良的帅气。当你向他展示自己时，他抬头看着你，");
         if(get_player().biggestTitSize() >= 19)
         {
            outputText("或者至少是试图这么做，他的视线被你丰满的乳房挡住了。");
         }
         else
         {
            outputText("仿佛在用眼神请求许可。虽然他的头部与你的腹股沟齐平，这暗示了你的意图，但他一次也没有主动碰你。");
         }
         outputText("在你告诉他开始的那一刻，他笑了，长满鳞片的手慢慢滑上你[if (tailLeg) {蛇形下半身|小腿}]的后部。出乎意料的平滑和温暖，他有力的抓握按摩着你的[if (tailLeg) {tail|legs}]，当他向前倾身时，手掌停留在你的[butt]上。他呼吸的热气喷洒在你的[if (hasCock) {[cocks]|[if (hasVagina) {[vagina]|crotch}]}]上，让你浑身颤抖。[pg]");
         if(get_player().hasVagina() && get_player().hasCock())
         {
            _loc4_ = Utils.rand(2) == 0 ? _loc3_ : _loc2_;
         }
         else if(get_player().hasVagina())
         {
            _loc4_ = _loc3_;
         }
         else if(get_player().hasCock())
         {
            _loc4_ = _loc2_;
         }
         else
         {
            _loc4_ = _loc1_;
         }
         if(_loc4_ == _loc3_ == true)
         {
            outputText("对于一个刚才还像吃了糖的雪貂一样蹦蹦跳跳的生物来说，他以一种似乎不自然的缓慢速度舔舐着你的阴唇，他分叉的舌头拖过你的阴蒂，深情地蹭着你。他慢慢加快了速度，每一次舔舐，他的舌头都会探入你的[vagina]。他用舌头更深地探入，蹭着你的阴蒂，用每一次悠闲的弹动操弄着你。他长着爪子的手指稍微抓紧了你的[butt]，乞求地抬头看着你。他紫色的阴茎上沾满了先列腺液，他的臀部轻轻抽动，渴望将自己埋入你湿滑的小穴中。[if (hasCock) {你被冷落的[cock]因兴奋而渗出液体，先列腺液在龟头顶端渗出，你思考着你想怎么做。}]");
         }
         else
         {
            _loc5_ = _loc4_ == _loc2_;
            if(_loc5_ == true)
            {
               _loc6_ = get_player().longestCockLength();
               outputText("对于一个刚才还像吃了糖的雪貂一样蹦蹦跳跳的生物来说，他以一种似乎不自然的缓慢速度试探性地舔舐着你变硬的[cock]，他分叉的舌头慢慢地在龟头上弹动。[if (hasVagina) {你的小穴肉壁因共鸣的快感而颤抖，没有被填满的失望被抛在脑后，因为你们身体共享的快感有助于暂时满足你的双性。}]张开他的" + (get_noFur() ? "嘴" : "喙") + "，他慢慢吞下龟头，舌头卷住它吮吸着。" + (get_noFur() ? "" : "你惊讶于他的喙竟然如此柔软，边缘并不像你预期的那样坚硬锋利，而更像是一层坚实的橡胶。") + "你呻吟着，将手滑入他的羽毛中，轻轻揉捏他长满羽毛的耳朵后面以示鼓励。他伴随着轻微的呼噜声，急切地将你更多的肉棒塞进嘴里，他分叉的舌头在龟头上弹动，同时揉捏着你的臀瓣。");
               if(_loc6_ <= 5)
               {
                  outputText("当他嘴里湿润的热度和轻柔的吸吮挑逗着你的[cock]时，你忍不住将你的长度更深地塞进他的嘴里，你的臀部轻轻抽动。他轻松地吞下了你的长度，" + (get_noFur() ? "" : "他的喙刷过你的胯部") + "[if (hasVagina) {你的花穴滴着淫液|随着每一次挺送，你的[balls]撞击着他的下巴}]。");
               }
               else if(_loc6_ <= 12)
               {
                  outputText("当他嘴里湿润的热度和轻柔的吸吮挑逗着你的[cock]时，你忍不住将你的长度更深地塞进他的嘴里，你的臀部轻轻抽动。他有些艰难地吞下了你的长度，每一次抽插，你的[cock]都会进入他的喉咙。" + (get_noFur() ? "" : "他的喙刷过你的胯部[if (hasVagina) {你的花穴滴着淫液|随着每一次挺送，你的[balls]撞击着他的下巴}]。"));
               }
               else if(_loc6_ <= 18)
               {
                  outputText("当他嘴里湿润的热度和轻柔的吸吮挑逗着你的[cock]时，你忍不住将你的长度更深地塞进他的嘴里，你的臀部轻轻抽动。他勉强吞下了你的长度，当你挺送时，他的喉咙淫秽地鼓起。");
                  if(get_player().hasVagina() || get_player().balls > 0)
                  {
                     if(get_player().hasVagina())
                     {
                        outputText("你的小穴滴落着淫液");
                     }
                     if(get_player().balls > 0)
                     {
                        outputText("[if (hasVagina) {and your|你的}][balls]粗暴地摇晃[if (balls == 1) {着}]");
                     }
                     outputText("伴随着每一次肉棒入鞘的抽插。");
                  }
               }
               else
               {
                  outputText("当他嘴里湿润的热度与轻柔的吸吮挑逗着你的[cock]时，你忍不住将你的长度更深地挺进他嘴里，你的臀部轻轻抽动。不幸的是，你惊人的尺寸阻碍了你取得更多进展，你的大部分长度仍然只是暴露在空气中，而不是深埋在他紧收的喉咙里。");
                  if(get_player().hasVagina() || get_player().balls > 0)
                  {
                     if(get_player().hasVagina())
                     {
                        outputText("你的小穴滴落着淫液");
                     }
                     if(get_player().balls > 0)
                     {
                        outputText("[if (hasVagina) {and your|你的}][balls]粗暴地摇晃[if (balls == 1) {着}]");
                     }
                     outputText("伴随着每一次不完整的抽插。");
                  }
                  outputText("你注意到他紫色的肉棒上沾满了先列腺液，正从他的生殖裂中挤出来。当你把你的长度从他喉咙里抽出来时，你思考着如何才能最好地利用这一点。");
               }
            }
            else
            {
               outputText("带着一种对于一个刚才还像吃了糖的雪貂一样蹦蹦跳跳的生物来说显得不自然的缓慢，他带着好奇的神情打量着你。你没有生殖器似乎让他感到困惑。沉默了片刻后，你叹了口气，从他的抓握中挣脱出来，把他拖到附近的一块岩石上。这块平坦的石板非常适合你弯下腰，微微扭动着向他展示你的[ass]。当你告诉他把你弄得湿润舒服时，你的[breasts]轻轻摩擦着冰凉的表面。[pg]");
               outputText("当你的[nipples]感受到他呼在你脸颊上的热气时，它们[if (hasNippleCunts || isLactating) {湿润了|变硬了}]，他带爪的手指轻轻抠入，掰开你的臀瓣，让你的[butthole]暴露出来。当他湿润的呼吸拂过你颤动的通道时，你打了个寒颤，随着某种粗大湿润的东西开始试探你的深处，你喘息起来。他的舌头轻松地推开你的肌肉环，他那爬行动物般分叉的舌尖逗弄着你敏感的内壁。当他的舌头退回时，他的手滑上你的腰侧，抓住你的[hips]，然后对着你的股沟进行了漫长而用力的舔舐。当他的舌头在你的臀瓣上弹动时，你在岩石上摩擦着你的[chest]，一种痛苦的快感愉悦着你的感官。");
               outputText("他接下来的粗暴舔舐是画圈的，伴随着对你[butt]深情的轻咬，然后再次将舌头刺入你体内。你知道此时他至少已经把一英寸的舌头滑入你体内，而且他似乎不打算停下来，直到他尽可能多地品尝你。当他把舌头探得更深时，你听到他呜咽了一声。你带着一抹坏笑，将目光转向他粗大的紫色肉棒，他那跳动的长度紧贴着他的腹部，一条湿滑的先列腺液痕迹涂抹在他的" + (get_noFur() ? "皮肤" : "鳞片") + "上。你觉得他用那条舌头让你热身做得很好，现在是时候看看他那根粗大的肉棒是不是也一样厉害了。");
            }
         }
      }
      
      public function loseToCockatrice() : void
      {
         clearOutput();
         if((get_player().isTaur() || get_player().isDrider()) && get_player().hasVagina())
         {
            cockatriceLossOral();
         }
         else if(get_player().isTaur() || get_player().isDrider())
         {
            cockatriceLossOral();
         }
         else if(get_player().hasVagina())
         {
            cockatriceLossVaginal();
         }
         else
         {
            cockatriceLossAnal();
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function greeting() : void
      {
         var _loc1_:* = null as Cockatrice;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1311) == 0)
         {
            _loc1_ = new Cockatrice();
            outputText("当你沿着高山的小径前行时，岩石地形变得越来越不稳定，道路退化成了一系列松散的峭壁，周围是砾石般的沉积物、巨大的巨石和粗糙的垫脚石状结构。当你紧紧抓住岩壁，试图从一块岩石跨到另一块岩石时，你看到了远处的什么东西。一个身影，正以惊人的轻松姿态栖息在其中一块突出的岩石上。[pg]");
            outputText("虽然从这个距离你看不清太多细节，但这个个体鲜艳的色彩让你想起了统治这片天空的鹰身女妖。这里是她们的领地，你最好还是小心行事。[if (hasCock) {当你注意到自己在这里的危险处境时，你向你所知道的所有神明祈祷，希望那不是一只鹰身女妖。她们对你的[cock]的热情是你绝对不想领教的，[if (canFly) {尽管你可以用你的[wings]来确保安全。|尤其是在这么令人眼晕的高度。}]}] 在这么高的地方发生冲突绝对是你最不想看到的事。[pg]");
            outputText("你小心翼翼地前进，紧紧抓住岩石，将身体平贴在粗糙、冰凉的表面上。当你偷偷靠近时，那生物的羽毛蓬松起来，吓得你僵在原地。你屏住呼吸，等待着，希望它还没有注意到你的存在。经过几段紧张的时刻，那生物只是向前倾身，开始梳理自己的羽毛，注意力完全集中在自己身上。你松了一口气，沿着你一直紧紧抓住的山脊移动，最终设法来到一个小高原，这在这崎岖的地形中简直是天赐之物，让你能在相对安全的地方观察那生物。[pg]");
            get_images().showImage("monster-cockatrice");
            outputText("你面前的生物足有6英尺高，" + (get_noFur() ? "肩膀和上臂" : "") + "覆盖着一层鲜艳的午夜蓝羽毛，并带有绿松石色的点缀。它的外表看起来相当像鸟类，比你见过的那些飞来飞去的鹰身女妖更像。它有一张" + (get_noFur() ? "人类的" : "长着喙的") + "脸，长着长满羽毛的大耳朵，让人联想到猫头鹰。一圈更厚、更蓬松的绿松石色羽毛在它的脖子周围蓬松着，目前正是它梳理的目标。当它伸展身体时，你可以瞥见它紧致、柔软的腹部和平坦的胸部，那" + (get_noFur() ? "光滑的皮肤" : "光滑的奶油色鳞片腹部") + "被深蓝色的羽毛所包围。[pg]");
            outputText("它的手臂一直到前臂都覆盖着羽毛，不过在手肘周围似乎也有退化的飞羽。虽然它们不大，但看起来能够在杂技般的动作和跳远中辅助着陆。这生物手和前臂可见的部分与它明亮的鸟类形态形成了鲜明的对比，出奇地像爬行动物，覆盖着黑色的鳞片，指尖长着锋利的爪子。[pg]");
            outputText("当这生物改变站姿，显然已经完成了梳理时，你看到它绝对是某种鸟类/蜥蜴的混血儿。它那又长又粗的尾巴在紧致的臀部上方摆动，逐渐变细成一个尖端。它至少有身体一半的长度，一圈羽毛在向下约4英寸处呈V字形停止，从长满羽毛的身体过渡到午夜蓝色的鳞片。[pg]");
            outputText("从它略宽的臀部开始，强壮的" + (get_noFur() ? "" : "长满羽毛的") + "后腿在膝盖处过渡为爬行动物的腿，黑色的鳞片覆盖着它趾行的双腿。它的三个长脚趾末端长着看起来很邪恶的爪子，而脚跟处则长出一个较小的爪子。你可不想惹上那些东西。当你打量着它那似曾相识的特征时，你意识到这一定是某种鹰身女妖和蛇怪的混血儿，一只鸡蛇！天哪，[benoit name]说得对，它们长得真奇怪！[pg]");
            outputText("当它转身准备离开时，它注意到了你，那双电蓝色的眼睛兴奋地亮了起来。它轻松地在岩石间跳跃，伴随着嘎嘎的叫声迅速向你逼近。你准备好你的[weapon]，因为这生物丝毫没有减速的迹象。看来你有一场硬仗要打了！");
            StareMonster.speedReduce(get_player(),5);
         }
         else
         {
            if(Utils.rand(100) < 40)
            {
               _loc1_ = new WingedCockatrice();
            }
            else
            {
               _loc1_ = new Cockatrice();
            }
            get_images().showImage("monster-cockatrice");
            outputText("当你再次攀登高山时，你花了一些时间在一个岩石高原上喘口气，以避开松散的砾石地面。你看到远处有一只色彩鲜艳的生物，");
            if(_loc1_.canFly())
            {
               outputText("展开长满羽毛的翅膀以辅助它的动作，");
            }
            outputText("轻松地在石头间跳跃，似乎很享受。当你叹了口气准备离开时，那生物注意到了你，拍打着羽毛迅速在岩石间移动。它兴奋地嘎嘎叫着靠近，到达高原时丝毫没有减速。你现在看清楚了，那是一只鸡蛇，你知道它在如此兴奋的状态下不会或不能停下来。看来你必须战斗了！");
         }
         unlockCodexEntry(1312);
         startCombat(_loc1_);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1311,FlagDict_Impl_.arrayReadInt(_loc2_,1311) + 1);
      }
      
      public function defeatCockatrice() : void
      {
         var _g:Combat;
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            get_images().showImage("cockatrice-fallen-hp");
         }
         else
         {
            get_images().showImage("cockatrice-fallen-lust");
         }
         outputText("鸡蛇气喘吁吁地跪倒在地，看着你。");
         if(get_monster().get_HP() < 1)
         {
            outputText("他看起来被彻底打败了，羽毛凌乱，脸上沾满了战斗中扬起的碎屑。他眼中挑衅的神情是他之前狂躁能量的唯一残留。");
         }
         else
         {
            outputText("他慵懒地抚摸着自己紫色的肉棒，用一种充满诱惑的眼神抬头看着你。他凌乱的羽毛、沾满泥土的鳞片和悠闲的抽插动作，让他即使在战败时也显得相当迷人。");
         }
         menu();
         addButtonDisabled(0,"骑乘(阴道)","这个场景需要你拥有阴道，不是半人马或蛛化精灵，并且有足够的性奋度");
         addButtonDisabled(1,"骑乘(肛门)","这个场景需要你不是半人马或蛛化精灵，并且有足够的性奋度。");
         addButtonDisabled(2,"肏屁股","这个场景需要你拥有合适的阴茎，不是半人马或蛛化精灵，并且有足够的性奋度。");
         addButtonDisabled(3,"口交(阴茎)","这个场景需要你拥有阴茎，不是半人马或蛛化精灵，并且有足够的性奋度。");
         addButtonDisabled(4,"口交(阴道)","这个场景需要你拥有阴道，不是半人马或蛛化精灵，并且有足够的性奋度。");
         addButtonDisabled(5,"半人马性爱","这个场景需要你是半人马或蛛化精灵，拥有阴茎和/或阴道，并且有足够的性奋度。");
         if(get_player().get_lust() >= 33)
         {
            outputText("你要怎么处置他？");
            if(!get_player().isTaur() && !get_player().isDrider())
            {
               if(get_player().hasVagina())
               {
                  addButton(0,"骑乘(阴道)",cockatriceRideHimVag).hint("让他操你的小穴。");
               }
               addButton(1,"骑乘(肛门)",cockatriceRideHimAnal).hint("让他操你的屁股。");
               if(get_player().hasCockThatFits(get_monster().analCapacity()))
               {
                  addButton(2,"操屁股",cockatriceButtfuck).hint("操鸡蛇的屁股！");
               }
               if(get_player().hasCock())
               {
                  addButton(3,"口交(阴茎)",cockatriceOralCock).hint("让他给你口交！");
               }
               if(get_player().hasVagina())
               {
                  addButton(4,"口交(阴道)",cockatriceOralVag).hint("让他舔你的小穴！");
               }
            }
            else
            {
               if(get_player().isTaur() && (get_player().hasVagina() || get_player().hasCock()))
               {
                  addButton(5,"半人马性爱",cockatriceTaurButtFuck).hint("让他操你半人马的屁股！");
               }
               if(get_player().isDrider() && (get_player().hasVagina() || get_player().hasCock()))
               {
                  addButton(5,"蛛化精灵性爱",cockatriceDriderButtFuck).hint("让他操你蛛化精灵的屁股！");
               }
            }
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         var _loc1_:CoC = get_game();
         _g = get_combat();
         _loc1_.setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function cockatriceTaurButtFuck() : void
      {
         clearOutput();
         outputText("当你决定如何处置这只鸡蛇时，你的下半身因性唤起而发热，你意识到你很难做到任何事情，因为你的半人马形态与许多人的装备不太兼容。你简短地环顾四周，注意到山腰上有一个壁龛，这让你产生了一个绝妙的主意。你可以利用岩石把他固定在合适的高度，用他那长满小疙瘩的爬行动物肉棒操你的屁股。这可真是进退两难啊！[pg]");
         outputText("你抓住他的手臂，把他带到缝隙处，转过身，急切地用你的臀部压住他，热情地用你半人马的后臀摩擦他。他惊讶的尖叫很快就变成了像咕咕叫一样的呻吟，因为他坚硬的肉棒被你的[hips]包裹住了。" + (get_noFur() ? "" : "他毛茸茸的羽毛让你的大腿发痒，而他长满鳞片的肚子滑过你的肌肤。") + "你臀部的每一次弹跳都会让他的大腿摩擦你的[if (balls > 0) {ball[if (balls > 1) {}]|[if (hasVagina) {cunt|butt}]}]，而他的性器则戳刺着你的后门，用他滑溜溜的先列腺液慢慢地润滑你。他带爪的手指紧紧抓住你的侧腹，试图推入你体内，但你的摩擦确保他无法找到正确的角度。在某个时刻，你有意用力推向他，感觉到他的肉棒被压在你们的身体之间，他因渴望而发出呜咽。[pg]");
         outputText("[say: 求……求求你……]他嘶嘶地说着，爪子陷入你的肉里，他圆圆的瞳孔让他乞求的样子既可爱又可怜。你考虑着再陪他玩一会儿，漫不经心地想着摩擦他让他释放几次，然后再把他压住，让他奇妙地退缩。[pg]");
         outputText("[say: 让我看看你有多想要。]你带着坏笑说道，回头看着他。伴随着一声用力的咕哝和涨得紫红的脸颊，他点了点头，突然安静下来。你脸上的困惑显而易见，随后你的表情融化成震惊的“哦”。有什么东西蠕动着贴上了你的[if (hasVagina) {pussy|[if (balls > 0) {ball[if (balls > 1) {}]|cock}]}]，又粗又长满鳞片，像一个变态的肉质假阳具一样在你身上摩擦，以惊人的准确度寻找着你的生殖器。[if (!hasVagina) {它缠绕着你的肉棒，紧紧地挤压着你[if (balls > 0) {，靠近根部的地方轻轻地在你的[balls]上前后摩擦}]，把你包裹在一个温暖柔软的鞘里，随着每一次动作而弯曲。这真是一条令人印象深刻的尾巴！|它戳刺着你阴道的入口，锥形的尖端慢慢地挤进去，随着更多部分的进入而撑开你。缓慢的抽插导致这个长满鳞片的附属物每次撑开你时都会摩擦你的阴蒂，让你在紧缩这个入侵者时感到充实。这真是一条才华横溢的尾巴！}]与此同时，他的肉棒仍然紧贴着你的后门，在他的尾巴操弄你的性器时抽搐并渗出液体。[pg]");
         get_images().showImage("cockatrice-ridehim-taur-buttfuck");
         outputText("随着臀部的快速移动和前腿的下沉，你成功地将他的长度滑入你[if (analLooseness <= 1) {紧致的|经验丰富的}]通道，沉醉在你所接受的双重刺激中。你每一次向后挺动，他那长满小疙瘩的长度都会在你的内壁上拖拽，而那些令人愉悦的凸起在你每次退出时都会挑逗你[if (analLooseness > 1) {被撑开的|渴望的}]后庭。当你在他的肉棒上操弄自己时，他尾巴的动作减弱了，他的臀部反而随着你的每一次挺动而迎合你。[if (!hasVagina) {对你肉棒较松的抓握让你能轻松地滑过他盘绕的尾巴，给你带来顺滑的尾交，每次你夹紧他紫色的肉棒时，他的尾巴都会绷紧。| 尽管他尾巴的抽插现在变弱了，但你的动作弥补了这一点，在他的肉棒和尾巴上同时操弄你，这两个锥形的长度透过隔开它们的薄壁相互摩擦。}]他的肉棒抽搐着，爪子陷入你的臀部，臀部用力地抽插进你体内，尽可能地把你拉向他。伴随着一次有力的挺动，他把精液射进了你的屁股里，种子涂满了你的内脏，而他的尾巴[if (hasCock) {在你的肉棒周围起伏|深深地插进你的阴道}]。你的[if (hasCock) { 肉棒抽搐并胀大，因为他绞紧了你的长度，把你的精液射在地上[if (cumQuantity > 350) { 在你身下形成了一个相当大的水坑}]。| 阴道痉挛，因为他撞击了你的子宫颈，当你颤抖时，用女性精液涂满了他的尾巴[if (issquirter) {，慷慨地浸湿了你的胯部和他的大腿，然后逐渐减弱}]。}]你们俩都在那里气喘吁吁地待了一会儿，你们的腿努力支撑着你们俩，同时你们享受着肠道里的温暖。你们慢慢分开，互相搀扶着走到一个更舒适的地方恢复体力。[pg]");
         outputText("一旦你感觉到腿部恢复了力量，你就向他告别，注意到你可能真的让他累坏了，因为他蜷缩起来睡着了，羽毛因为你粗暴的对待而杂乱地竖起。");
         get_player().orgasm("Anal");
         get_player().buttChange(80,true);
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceRideHimVag() : void
      {
         clearOutput();
         rideCockatriceForeplay();
         outputText("[pg]他那可怜巴巴的乞求表情，以及他不顾你的动作，舌头依然在你[if (hasCock) {肿胀的肉棒|饥渴的小穴}]上忙碌的样子，加速了你的决定。你按住他结实但长满绒毛的肩膀，将他推开。你慢慢地跪起身来，让他能好好欣赏你的身体。他的呼吸变得急促，用贪婪的目光扫视着你[if (isLactating) {，在看到你那饱满的乳头时还舔了舔嘴唇}]。你的手滑过他那弯曲的爬行动物肉棒，将它对准你饥渴的小穴，顶端现在离你火热的肉体只有几厘米远。他发出一声低吟，试图挺动臀部，这表明他有多么渴望，但你只需轻轻一捏，就轻松地制止了他。[pg]");
         outputText("[say: ……求你了……]他嘶嘶地说，沙哑的声音中带着些许旋律感。如果不是因为你也同样渴望，你会很乐意继续戏弄他，好让他那催眠般的旋律进一步抚慰你的感官。你微微点头，将自己压向他，看着他一寸一寸地没入你的体内，你得意地笑了。他在你身下呜咽着、颤抖着，尾巴拍打着，喷出的先列腺液涂满了你的内壁。[pg]");
         get_images().showImage("cockatrice-ridehim-vag");
         outputText("他那逐渐变细的肉棒和凹凸不平的质感结合在一起，当你坐到底部时，你忍不住叹了口气，你火热的小穴紧贴着他冰凉的" + (get_noFur() ? "皮肤" : "鳞片") + "。他发出一声轻微的嘎嘎声，瞳孔放大成圆圈，将你拉向前，给了你一个深情的湿吻。你的[tongue]和他的舌头交织在一起，他的头偏向一侧，让你能更好地接触他的" + (get_noFur() ? "嘴" : "喙") + "，同时他的手[if (hairLength > 0) {穿过你的[hair]|托住你的后脑勺}]。[pg]");
         outputText("你开始顺着他的肉棒抬起身子，每拔出一寸，那些凸起就紧紧地摩擦着你的阴蒂。当你到达顶端时，你猛地将臀部砸下，享受着他的肉棒迅速撑开你，顶端戳中你子宫的感觉。你保持着这个节奏，结束了亲吻，规律的上升和快速的下降发出了淫荡的");
         if(get_player().vaginas[0].vaginalWetness >= 2)
         {
            outputText("吧唧");
         }
         else
         {
            outputText("啪啪");
         }
         outputText("声，你离高潮越来越近了。当你骑着他时，鸡蛇突然向前扑去，将你的一个[nipples]含在嘴里。他感觉到你的肉壁紧紧地包裹着他，便饥渴地吮吸着，渴望让你达到高潮。他的手伸向");
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("你的另一个乳头");
         }
         else
         {
            outputText("你的另一个乳头");
         }
         outputText("，一边吮吸一边捏着你的乳头，温柔的吮吸、急切的抽插和令人愉悦的疼痛交织成一首交响乐，将你包围。这让你达到了顶峰，你们俩一起挺动，将他的肉棒深深地埋在你颤动的通道里。你高潮时大叫出声[if (cumQuantity > 150) {，浸湿了你的大腿和他的肉棒}]，你湿滑的通道试图榨干他的精液。");
         if(get_player().hasCock())
         {
            outputText("你的");
            if(get_player().balls > 0)
            {
               outputText("的睾丸翻腾收紧，翻滚的精液渴望着被释放，你的");
            }
            outputText("[cock]射出了");
            if(get_player().cumQ() <= 150)
            {
               outputText("几股珍珠般的精液，涂满了你们的肚子。");
            }
            else if(get_player().cumQ() <= 350)
            {
               outputText("一股又一股珍珠般的精液，涂满了你们的肚子。");
            }
            else if(get_player().cumQ() <= 1000)
            {
               outputText("几股浓稠的珍珠般精液，在你们的胸口和肚子上涂上了一层厚厚的白浊。");
            }
            else
            {
               outputText("几股浓稠的珍珠般精液，像变态的喷泉一样浇在你们身上。");
            }
         }
         outputText("[pg]在你身下，鸡蛇怪呻吟着，他的肉棒抽搐着，精液开始涌出，让他的阴茎微微胀大，浓稠的精液喷射而出，势要彻底涂满你的子宫。你们俩躺在那里喘息了一会儿，他轻声鸣叫着，一只手穿过你的头发。当你终于从他身上爬下来时，[if (cumQuantity > 350) {你的身体因为高潮而变得湿滑，}]他的精液顺着你的大腿滴落，当你");
         outputText(get_player().get_armor() != ArmorLib.NOTHING ? "穿好衣服，" : "拿起装备，");
         outputText("你忍不住对他微笑。他已经站了起来，抖了抖身子，试图让自己看起来体面些，但他的羽毛却杂乱地蓬松着。这个笨蛋连羽毛都乱糟糟的！你轻笑一声，在他的" + (get_noFur() ? "鼻子" : "喙") + "尖上亲了一下，然后告诉他你玩得很开心。[pg]");
         outputText("[say: 我也是。下次再一起玩吧，]他微笑着说，然后最后一次抚平自己的羽毛，接着[if (monster.canFly) {展开翅膀飞走了|迈着轻快的步伐跑向了山脉深处}]。");
         get_player().orgasm("Vaginal");
         get_player().knockUpForce(3,225);
         get_player().cuntChange(get_monster().cockArea(0),true);
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceRideHimAnal() : void
      {
         clearOutput();
         rideCockatriceForeplay();
         outputText("[pg]他那圆圆的大瞳孔让他看起来像只可爱的小狗，他抬头看着你。如果不是他涨红的脸和吐出的舌头增添了几分淫靡的色彩，你真想把他抱起来好好抚摸一番。但你有一个更好的主意，一个能让这张脸在你完事后看起来绝对纯洁的主意。你按住他的肩膀把他推倒在地，他温暖的绒羽抚摸着你的手，然后你也跪下来，与他平齐。[pg]");
         outputText("对于这样一个轻盈的生物来说，他的肌肉线条出奇的好，他强健的肩膀轻松地支撑着你的重量。你调整好姿势，让他的肉棒夹在你的[butt]之间，轻轻地前后摩擦着他的长度。他分泌的大量先列腺液涂满了你的后庭，加上他肉棒上各种各样的凸起，你忍不住发出一声轻微的呻吟。当你把他的龟头拖过你的[asshole]时，享受着他的凸起划过你敏感的肉体时带来的每一次快感，你感觉到他的手滑到了你的臀部。他闭着眼睛，色情地喘息着，下半身紧绷，试图忍住不插入你，破坏你建立的这种挑逗的节奏。他的肉棒每一次抽搐都会喷出更多的先列腺液，润滑你的臀瓣，让他的长度在它们之间顺滑地滑动。[pg]");
         outputText("你得意地笑了笑，突然抬起臀部，刚好让他的龟头抵在你紧闭的后庭上，但又不足以让他进入。他发出一声嘶嘶声，爪子抓进了你的[butt]。[pg]");
         outputText("[say: 拜……拜托……]他嘶嘶地说道，沙哑的声音中带着一丝旋律感，你感觉到他粗壮的肉棒以更大的压力压在你的入口处。虽然你知道你很想再逗逗他，但你更想让他那根粗壮的爬行动物肉棒进入你体内。你又摇晃了几下臀部，把他的先列腺液涂抹在你的入口处，然后向下压去。[pg]");
         get_images().showImage("cockatrice-ridehim-anal");
         outputText("当他粗壮的龟头滑入你的后庭时");
         if(get_player().ass.analLooseness <= 1)
         {
            outputText("撑开了你紧致的通道");
         }
         outputText("你忍不住呻吟起来。他肉棒上的凸起摩擦着你敏感的后庭，你慢慢地吞下了他的全部长度，你忍不住");
         if(get_player().ass.analLooseness <= 1)
         {
            outputText("感到充实。");
         }
         else
         {
            outputText("在你经验丰富的后庭中享受他的尺寸。");
         }
         outputText("他的手放在你的屁股上，轻轻捏着你的臀瓣，他向前倾身，拉着你进行了一个张开嘴的吻。他轻轻地摇晃着臀部，确保他紧紧地贴在你体内，然后他轻轻一抬，催促你跟着动起来。[pg]");
         outputText("你开始向上抬起身子，享受着他那布满颗粒的肉棒在你体内摩擦的感觉，同时他的舌头也与你的舌头交缠在一起。你感觉到一股先列腺液喷溅在你的体内，当你再次滑下时，那股滑腻的温暖包裹着你的内壁。你加快了速度，开始在他的肉棒上起伏，他惊讶地发出一声轻微的叫声，随后便适应了你的节奏，与你一起挺动。当你骑乘他时，你能感觉到他的肉棒在抽动，你的屁股随着每一次挺动拍打着他的大腿，你的通道有节奏地紧紧夹住他，试图在他那布满颗粒的紫色肉棒刮擦你敏感的内壁时，将他的精华榨取出来。[pg]");
         outputText("当他的爪子抓过你的脸颊时，他发出了呜咽声，臀部短促而猛烈地向上挺动。当他用恳求的眼神看着你时，你能感觉到他的长度在你体内跳动和抽搐。随着你臀部的一次起伏和紧紧的挤压，你将他深深埋入你抽搐的通道中。当他浓稠滚烫的精液射入你体内，用他充满雄性气息的黏液覆盖你的内壁[if (hasCock) {并以惊人的力量撞击你的前列腺}]时，你喘息着。当你高潮时，你感觉到一阵快感的涟漪穿透你的全身");
         if(get_player().hasCock() || get_player().hasVagina())
         {
            if(get_player().hasVagina())
            {
               outputText("你的小穴浸湿了你的大腿");
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("并且");
            }
            if(get_player().hasCock())
            {
               outputText("你的肉棒喷射在他" + (get_noFur() ? "" : " 布满鳞片的") + "肚子上，你的睾丸颤抖着，释放出你");
               if(get_player().cumQ() < 150)
               {
                  outputText("少量的精液。");
               }
               else if(get_player().cumQ() < 350)
               {
                  outputText("中等量的精液。");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("大量的精液。");
               }
               else
               {
                  outputText("巨量的精液。");
               }
            }
         }
         else
         {
            outputText("你的后穴抽搐着，饥渴地将他榨干。[pg]");
         }
         outputText("你们俩在那里坐了一会儿，享受着余韵和彼此身体的温暖。你花了一点时间享受他羽毛在你皮肤上的柔软触感，然后伴随着一声湿润的“咕叽”声，从他身上离开。");
         if(get_player().get_armor() != ArmorLib.NOTHING)
         {
            outputText("当你穿衣服时，你又看了他一眼。");
         }
         else
         {
            outputText("当你拿起你的装备时，你又看了他一眼。");
         }
         outputText("他已经站了起来，抖了抖身子，试图让自己看起来体面些，但这无济于事，因为他的羽毛杂乱地蓬松着。这个笨蛋有事后乱发！你轻笑一声，在他" + (get_noFur() ? "鼻子" : "喙") + "的尖端亲了一下，然后告诉他你玩得很开心。[pg]");
         outputText("[say: 我也是。下次再一起玩吧，]他微笑着说，然后最后一次抚平自己的羽毛，接着[if (monster.canFly) {展开翅膀飞走了|迈着轻快的步伐跑向了山脉深处}]。");
         get_player().buttChange(80,true);
         get_player().orgasm("Anal");
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceOralVag() : void
      {
         clearOutput();
         outputText("你随意地走向他[if (hasArmor) {，自信地脱下你的[armor]并扔到一边}]，欣赏着他俯卧的身姿。鸡蛇仰面躺着，尾巴慵懒地搭在双腿间，用带爪的手指划过自己的胸肌。他那蓝宝石般的眼睛紧紧盯着你，贪婪地注视着你赤裸的身体。他的目光在你的[if (hasBreasts) {[breasts]|胸膛}]上停留了一会儿，让你的乳头挺立起来，然后视线向下游移到你的[pussy]，你的[pussy]让他忍不住舔了舔嘴唇。[pg]");
         outputText("他显然知道你对他有什么期望，这让事情变得容易多了。[pg]");
         outputText("[say: 是时候找点乐子了。]你微笑着站在他上方，捧起他" + (get_noFur() ? "" : "毛茸茸的") + "脸颊，引导他靠近你的阴道[if (balls > 0) {同时你把睾丸移开}]。他张开" + (get_noFur() ? "嘴" : "喙") + "，分叉的舌头滑出，轻轻地滑过你的阴阜，他灼热的呼吸让你的[if (vaginalWetness <= 2) {光滑的|湿漉漉的}]阴唇发痒。你轻声呜咽了一下，希望他能更用力地舔，然后更用力地推向他的" + (get_noFur() ? "嘴" : "喙") + "。你的阴蒂摩擦着" + (get_noFur() ? "他的鼻尖" : "他喙的曲线，那种坚硬感对你的[clit]来说简直是绝妙的刺激") + "。他的舌头探入你的阴道，突然卷起进入你的体内，然后在你肿胀湿润的阴唇间抽插，让你吓了一跳。当他把头向后移时，对你阴蒂的弹拨加上他" + (get_noFur() ? "柔软的嘴唇" : "坚硬的喙") + "的拖拽，让你的膝盖抽搐，肉洞紧缩。[pg]");
         get_images().showImage("cockatrice-ridehim-cunnilingus");
         outputText("他把长满鳞片的手环绕在你的臀部，用拇指的爪子轻轻抓挠着你的脸颊。他动作缓慢而从容，把你拉近，开始用坚定自信的动作舔舐你，渴望饮尽你的女性甘露。他的肉棒[if (hasCock) {像你的一样，}]直挺挺地立着，顶端渗出先列腺液，像蜡烛的蜡滴一样顺着肉棒慢慢滑落。他把脸埋进你饥渴的[cunt]里摩擦，舌头探入你的肉洞，在你的内壁上蠕动，寻找着那个深处的海绵状敏感点。一股暖流在你的小腹中积聚，一种盘旋的紧绷感让你试图寻找与他舌头相匹配的节奏。[pg]");
         outputText("伴随着一阵悦耳的嗡嗡声穿过他的" + (get_noFur() ? "嘴唇" : "喙") + "，直达你渴望的淫核，他的舌头向上顶着那个难以捉摸的敏感点，让你的膝盖锁紧，把他的脸夹在你的大腿之间。你的[cunt]痉挛着，试图把这个入侵者当成肉棒一样榨干，同时你彻底地分泌出爱液。当你度过高潮时[if (hasCock) {你的肉棒无力地向空中射精，}]，鸡蛇试图尽可能多地喝下你的汁液，剩下的滴落他的下巴和胸膛。你气喘吁吁地，幸福地让那模糊的高潮后余韵吞没你，你退后一步，欣赏着他身上闪烁着你蜜汁的样子，他的羽毛都黏结在了一起。[pg]");
         outputText("一旦你完全恢复了对你[if (tailLeg) {蛇尾|[if (isGoo) {黏黏|双腿}]}]的控制，你[if (hasArmor) {穿好衣服并}]感谢他的努力，亲吻他" + (get_noFur() ? "鼻子" : "喙") + "的尖端，并在他身上品尝到了你自己的味道。然后你转身离开，听着他慵懒的“啪啪”声，那是他在撸动自己紫色的肉棒，把自己舔干净。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceOralCock() : void
      {
         registerTag("longestCockLength",TagFun_Impl_.fromFloatFun(get_player().longestCockLength));
         clearOutput();
         outputText("你随意地走向他[if (hasArmor) {，自信地脱下你的[armor]并扔到一边}]，欣赏着他俯卧的身姿。鸡蛇仰面躺着，尾巴慵懒地搭在双腿间，用带爪的手指划过自己的胸肌。他那蓝宝石般的眼睛紧紧盯着你，贪婪地注视着你赤裸的身体。他的目光在你的[if (hasBreasts) {[breasts]|胸膛}]上停留了一会儿，让你的乳头挺立起来，然后视线向下游移到你的[cock]，你勃起的肉棒[if (cocks > 1) {们}]让他忍不住舔了舔嘴唇。[pg]");
         outputText("他显然知道你对他有什么期望，这让事情变得容易多了。");
         outputText("[pg][say: 是时候找点乐子了。]你微笑着站在他上方，捧起他" + (get_noFur() ? "" : "毛茸茸的") + "脸颊，引导他靠近你的肉棒。他顺从地张开" + (get_noFur() ? "嘴" : "喙") + "，分叉的舌头蛇般探出，以一种折磨人般缓慢的速度舔舐着你的[cockhead]。当他缩回舌头时，分叉的舌尖挑逗着你的尿道，让你不禁颤抖。他似乎对此很满意，再次舔舐你，灵活的舌头卷住你的肉棒，从根部到龟头细细品尝。随着你爱抚他的脸颊以示鼓励，他的动作变得更加大胆，没过多久，他就开始积极地吸吮你的肉棒，在龟头开始渗出先列腺液时，舌头在顶端打转。[if (balls > 0) { 他时不时地轻舔你的[balls]，确保它们能像你的肉棒一样得到彻底的口交[if (hasVagina) {，甚至把它们托起来，好让你的女性部分也能被好好品尝一番。}]|[if (hasVagina) { 偶尔他的舌头会滑得更低，寻找你滚烫的阴道，不肯放过你的女性部分。}]}][pg]");
         get_images().showImage("cockatrice-ridehim-oral");
         outputText("一旦你被一层闪亮的唾液覆盖，他就会[if (longestCockLength > 12) {尽其所能地}]把你的肉棒含进嘴里。" + (get_noFur() ? "" : "他的喙出乎意料地柔软，更像是一种坚硬的橡胶，里面奇妙地温暖湿润。") + "你舒服地叹了口气，引导着他的动作，帮助他在轻柔吸吮时建立起稳定的节奏。他每次退缩时，舌头都会向上顶你，确保你能从他那里得到对龟头的所有刺激。他在吸吮的同时也抚摸着自己，像一条蠕虫一样饥渴地吞咽着你的肉棒，回应着你的呻吟。你能感觉到自己开始在他的嘴里抽搐和跳动，你的臀部随着他的每一个动作开始抽动，你把双手插进他的羽毛里，捧住他的后脑勺。[pg]");
         outputText("伴随着鼓励的呻吟低语，你更用力地挺动臀部，[if (longestCockLength <= 12) {把你的肉棒埋进他的喉咙里|尽可能多地把你的肉棒埋进他的喉咙里}]，沉醉在紧致的空间和几乎要压碎你肉棒的突然痉挛中。他努力跟上你的节奏，眼睛里泛着泪光，几乎是在操自己的手，而他空闲的手则伸上来[if (balls > 0) {捧住你的[balls][if (hasVagina) {并用拇指揉捏你的阴道}]|[if (hasVagina) {用拇指揉捏你的阴道|捧住你的臀部}]}]。你感觉到[if (balls > 0) {你的睾丸收紧，充满了热量|热量聚集在你的小腹}]，随着你的肉棒抽动，你爆发性地射进了他的肚子里。[if (cumNormal) { 几股精液填满了他的肚子，当你拔出时，最后一股精液喷在了他的舌头上。|[if (cumMedium) { 几股浓稠的精液填满了他的肚子，当你拔出时，最后一股精液填满了他的嘴。|[if (cumHigh) { 浓稠的精液流进他的肚子，当你拔出时，精液淹没了他嘴。他的脸颊鼓了起来，但他设法包住了大部分，只有一点点顺着下巴滴落。| 粗壮的精液流涌进他的肚子，让他主动胀起了一个小肚子。你慢慢地从他体内拔出，同样淹没了他嘴。他的脸颊鼓了起来，然后干呕，你的男子气概对他来说实在难以承受，精液从他的" + (get_noFur() ? "嘴唇" : "喙") + "溢出，流下他的胸膛。你将最后几股精液射在外面，给了他一个颜射，" + (get_noFur() ? "精液滴落下来，把他的羽毛从蓝色变成了白色" : "让他长满羽毛的脸庞从蓝色变成了白色") + "。}]}]}][pg]");
         outputText("你让自己倒在[if (tailLeg) {你的蛇尾上|[if (isGoo) {地上|你的膝盖上}]}]，气喘吁吁[if (hasVagina) {同时你的小穴喷涌着爱液}]，沉浸在现在已经精疲力竭的器官[if (cocks > 1) {们}]的高潮余韵中。一旦你恢复了力气，你[if (hasArmor) {穿好衣服并}]看向鸡蛇。他躺在地上，带着满足和困倦的目光[if (cumQuantity > 1000) {在那层层浓稠的精液下}]，双手放在肚子和已经疲软的性器上。他给了你一个微笑，红着脸打了个小嗝。看来他和你一样享受。你挥手告别，转身返回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceLossVaginal() : void
      {
         clearOutput();
         outputText("你倒在地上，[if (hp <= 1) {精疲力竭|兴奋得无法继续}]。鸡蛇知道自己赢了，慢慢向你走来，饥渴的目光在你身上游移。[if (hasArmor) {他三下五除二地脱下你的[armor]，毫不在意地扔到一边。}]他突然扑上来，把你按在地上，你的手腕被他长满鳞片的手按住，你的[if (tailLeg) {盘绕的身体被压在|[if (isGoo) {黏黏的身体被压在|双腿张开环绕着}]}]他弯曲的臀部下。他粗大的紫色肉棒急切地从生殖裂中探出，摩擦着[if (hasCock) {你自己的[cock]|你的腹部}]，把粘稠的先列腺液抹在你身上。[pg]");
         get_images().showImage("cockatrice-loss-vag");
         outputText("他轻轻地将肉棒的顶端摩擦你的[cunt]，温柔地分开阴唇，并用鼻子蹭你的[clit]，足以让你喘息。当你[if (vaginalWetness <= 2) {湿透的|湿润的}]小穴紧紧贴着他的肉棒时，他慢慢进入你，随着他肉棒的变宽撑开你的小穴。[if (balls > 0 || hasCock) {你的[if (hasCock) {坚硬的[cock]轻轻抽搐，当他用肉棒刺穿你时拍打着你的腹部}][if (balls > 0 && hasCock) {，并且你的}][if (balls > 0) { [balls]随着他抽插你湿滑的小穴而弹跳。}]}]当他拔出时，你的内壁像情人的拥抱一样紧贴着他，让那些美妙的凸起以相当大的力量摩擦你的G点。[pg]");
         outputText("他很快就像一头发情的野兽一样在你体内抽插，搅动着你的内脏。你发出的每一声喘息都刺激着他，让他急切地在每一次抽插中都直没至柄。他俯身在你上方，在你的[if (hasBreasts) {breasts|chest}]上留下温柔的轻咬，然后他粗大分叉的舌头探出，安抚你的皮肤[if (isLactating) {，然后开始饥渴地吸吮你，他的舌头在你的[nipples]周围打转，不放过任何一滴}]。[pg]");
         outputText("他肉棒上明显的跳动预示着他快到了，随着他的抽插变得急促，他用一只手将你的双手手腕按住，另一只手伸下来揉搓你的[clit]。你在他充满情欲的抚摸下崩溃了，你的[pussy]在他周围颤动，你用淫液[if (vaginalWetness <= 2) {涂抹|浸透}]了他。[if (balls > 0 || hasCock) {你的[if (balls > 0) {[balls]收紧并因发热而泛红}]，[if (balls > 0 && hasCock) {同时你的}][if (hasCock) { [cock]在共鸣的高潮中喷射出粘稠的精液，涂满了你们的腹部[if (cumQuantity > 350) { 以及你们的胸部[if (hasBreasts) {，你[breasts]的下半部分承受了大部分的喷射}]}。]}]}][pg]");
         outputText("他用一波又一波浓稠的精液填满了你敏感的小穴，在拔出之前，用他充满男子气概的贡献沐浴了你的子宫。他直起身子，肉棒开始缩回生殖裂中，在把你留在地上之前把自己擦干净。当你的大脑因高潮后的满足感而变得模糊，你渴望入睡时，你最后看到的是鸡蛇摇摆的臀部和尾巴，他正迈着轻快的步伐继续赶路。");
         get_player().cuntChange(get_monster().cockArea(0),true,true);
         get_player().knockUpForce(3,225);
         get_player().orgasm("Vaginal");
      }
      
      public function cockatriceLossOral() : void
      {
         clearOutput();
         outputText("你倒在地上[if (hp <= 1) {筋疲力尽|兴奋得无法继续}]。鸡蛇大步走向你，一边打量着你，一边抚摸着他迅速勃起的肉棒。他漫不经心的靠近让你着迷，这种平静的自信是你没有从这只过度活跃的爬行动物身上预料到的。他托起你的下巴，看着你的眼睛，让你迷失在那电光蓝的凝视中，同时他轻轻地哼着歌。过了一会儿，他抓住你的[if (hairLength > 0) {[hair]|后脑勺}]，将他粗壮的紫色肉棒插入你的嘴里。你在他周围语无伦次，你的舌头被压在他的长度下，麝香般的先列腺液涂抹在你的上颚。你试图挣脱，但发现你的下半身无法移动，你的多条腿保持静止，而你的上半身在扭动。他把你石化了！[pg]");
         get_images().showImage("cockatrice-loss-oral");
         outputText("他粗暴地操着你的脸，你所能做的就是抓住他的二头肌进行微弱的挣扎。他的肉棒随着每一次抽插滑过你的舌头，龟头时不时地戳进你的喉咙[if (isBimbo) {当你放松它以便更好地吞下他的肉棒时|让你在每次突然的侵入时都想作呕}]。你吸吮着他，用舌尖沿着他长度上的一些凸起滑动，他稍微平静下来，缓慢而深入地抽插，这样你就可以为他代劳了。受到他反应的鼓励，你继续伺候他的肉棒[if (isBimbo) {你对肉棒的渴望慢慢蒙蔽了你的思想，让你渴望崇拜你嘴里的肉棒|很高兴能尽量减少它撞击你的喉咙，同时他在你的味蕾上涂满他独特的味道}]。[pg]");
         outputText("没过多久，他在你嘴里抽搐了一下，他的抽插开始加快速度，让他把骨盆捣进你[if (isBimbo) {柔软的|沾满口水的}]嘴唇里。他紧紧抓住你的脸，抽插变得更加不规律，他的肉棒随着每一次抽插推入你的喉咙，几乎没有给你任何喘息的机会。你的喉咙[if (isBimbo) {挤奶般地套弄着他|在他周围痉挛}]，他尽可能深地埋入你温暖湿润的喉咙里。你感觉到他的肉棒在你的舌头上膨胀，然后滚烫的精液流下你的喉咙，温暖了你的肚子。他慢慢地拔出，让最后的几股喷溅在你的舌头上，在你的嘴里留下他麝香般的味道。[pg]");
         outputText("他松开你的脸，喘着粗气，绕着你走，直到你看不见他。当他长满鳞片的手滑过你的侧腹时，你浑身发抖，不确定他接下来要做什么。你的性唤起已经平息，让你感到饥渴但理智，但你忍不住想知道他是否会再操你一次。令你惊讶的是，他花了一些时间按摩你[if (isCentaur) {像马一样的|[if (isTaur) {半人马形态的|像蜘蛛一样的}]}]下半身，缓解你肌肉的紧张，让你在他坚定而缓慢的揉捏下放松下来。很快他就结束了，把你留在地上，只挥了挥手就离开了。起初你很恐慌，担心自己被留给其他生物任其摆布，但当你[if (isTaur) {踢出|向前爬行}]时，你意识到自己又可以移动了。虽然感觉有些沉重，但你的[if (isCentaur) {半人马|[if (isTaur) {半人马形态|蛛化精灵}]}]身体不再石化，让你能够慢慢离开这个区域。你微微一笑，感谢这次按摩显然让你的关节从他眼睛的法术中解脱出来，想知道下次你是否可以直接跳过战斗，直接进行这样悠闲的按摩。[pg]");
         outputText("当你回到营地时，你感觉到你的下体因为这次遭遇而微微发热。");
      }
      
      public function cockatriceLossAnal() : void
      {
         clearOutput();
         outputText("你倒在地上，[if (hp <= 1) {精疲力竭|兴奋得无法继续}]。鸡蛇知道自己赢了，慢慢向你走来，饥渴的目光在你身上游移。[if (hasArmor) {他三下五除二地脱下你的[armor]，毫不在意地扔到一边。}]他突然扑上来，把你按在地上，你的手腕被他长满鳞片的手按住，你的[if (tailLeg) {盘绕的身体被压在|[if (isGoo) {黏黏的身体被压在|双腿张开环绕着}]}]他弯曲的臀部下。他粗大的紫色肉棒急切地从生殖裂中探出，摩擦着[if (hasCock) {你自己的[cock]|你的腹部}]，把粘稠的先列腺液抹在你身上。[pg]");
         get_images().showImage("cockatrice-loss-butt");
         outputText("他向前移动时挺起臀部，迫使你蜷缩起来，足以让他的肉棒坚持不懈地压在你的后庭入口，同时[if (tailLeg) {你盘绕的身体在他身下挤成一团|[if (isGoo) {黏黏的身体在他身下挤成一团|你的双腿勾住他的臀部}]}]。当他锥形的顶端挑逗着你张开时，涂抹在你后庭上的湿滑热度让你涨红了脸。你忍不住感觉到[if (hasCock) {你的[cock]在他稳定而持久的攻势下变硬}][if (hasCock && hasVagina) {，并且}][if (hasVagina) { 当他埋入你体内时，你的小穴变得湿润}][if (!hasCock && !hasVagina) {你的通道颤动着，试图将这个入侵者吸得更深}]，他凹凸不平的肉棒[if (analLooseness <= 1) {慢慢将你撑开|沉入你久经沙场的通道}]。[pg]");
         outputText("他开始抽离，让冷空气涌入他留下的空隙，然后再次塞入你体内，前后摇晃着臀部，直到他触及你火热后庭的底部，他肉棒上的凸起在进出时让你的括约肌抽搐。他加快了速度，一边呻吟一边轻咬你的[if (hasBreasts) {breasts|chest}]，同时身体前倾。你忍不住跟着他一起扭动臀部，尽可能深地将他的长度埋入你体内，让它[if (hasCock) {撞击你的前列腺，让你喷出微弱的精液|摩擦你内壁最薄的地方，将快感的电流送到你空虚却滴着淫液的小穴}]。[pg]");
         outputText("随着鸡蛇的抽插变得越来越不规律，他的肉棒在你的后庭中抽搐，粗重的喘息和肉体拍打的声音回荡在寂静的山腰上。没过多久，他的肉棒开始跳动，将一股又一股滚烫的精液射入你的直肠深处，然后瘫倒在你身上。当他用湿润浓稠的热流填满你时，你和他一起达到了高潮[if (hasCock) {，你的肉棒将浓稠的精液喷洒在你们俩的腹部}][if (cumQuantity > 350) {，把你们俩都彻底淋湿了}][if (hasCock && hasVagina) {，同时}][if (hasVagina) { 你的小穴紧缩，用顺着股沟滴落的淫液浸湿了你的大腿}][if (!hasCock && !hasVagina) {，你的后庭急切地榨取他所能给予的一切，热量在你的腹部汇聚，你的大脑在快感中一片空白}]。[pg]");
         outputText("伴随着一声湿润的“吧唧”声，他拔出了疲软的肉棒站了起来，留下你趴在地上，在性高潮后的迷离中沉沉睡去。你最后看到的是他摇摆的尾巴" + (get_noFur() ? "" : "和长满羽毛的臀部") + "，他正高兴地继续赶路。");
         get_player().buttChange(80,true);
         get_player().orgasm("Anal");
      }
      
      public function cockatriceDriderButtFuck() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 1;
         var _loc2_:int = 2;
         if(get_player().hasCock() && get_player().hasVagina())
         {
            _loc3_ = Utils.rand(2) == 0 ? _loc1_ : _loc2_;
         }
         else
         {
            _loc3_ = get_player().hasVagina() ? _loc1_ : _loc2_;
         }
         clearOutput();
         get_images().showImage("cockatrice-ridehim-drider");
         outputText("当你决定如何处置这只鸡蛇时，你的下半身因性唤起而发热，你意识到你很难做到任何事情，因为你的蜘蛛形态与许多人的装备不太兼容。你简短地环顾四周，注意到山腰上有一个壁龛，这让你产生了一个绝妙的主意。你可以把他绑在里面，让他用那根长满小疙瘩的爬行动物肉棒操你的屁股！[pg]");
         outputText("你牵着他的手，把他带到壁龛，然后用你的一些蜘蛛丝把他的手臂绑起来，把他固定在两堵墙之间。他挣扎了一下，然后你让他安静下来，转过身去。[pg]");
         outputText("[say:我要好好地、狠狠地操你。]你微笑着后退，将腹部置于他下方，让他的大腿贴在两侧，就像他在骑乘你一样。当他滑向你人类与蜘蛛半身交界处时，你感觉到他的阴茎挤压着你[if (buttRating <= 4) {紧致|柔软}]的臀瓣，而他那" + (get_noFur() ? "" : "长满羽毛的") + "大腿则紧紧抱住你的臀部。[pg]");
         outputText("你轻轻地前后摇晃，让他的阴茎随着他轻微的摆动在你的臀瓣[if (buttRating <= 4) {上|间}]摩擦。当你用臀部挑逗他粗壮的肉棒时，你的双手抚摸着胸膛，[if (hasbreasts) {托起你的[breasts]|抚过你的胸肌}]，同时捏弄着你的[nipples]。你感觉到湿润的液体顺着股沟流下，鸡蛇怪喘着粗气，享受着这场表演，他的肉棒也更容易地在你的菊穴上滑动。他肉棒上凹凸不平的触感让你浑身颤抖，你的后庭随着你的[if (hasCock) {[cock]变硬|[cunt]湿润}]而颤动。[pg]");
         if(_loc3_ == _loc1_)
         {
            outputText("你轻笑着将两根手指滑入你的[pussy]，夸张地配合着每一次抽插和呻吟，继续在他不断渗出液体的肉棒上摇晃。你转过头，用充满情欲的眼神看着鸡蛇怪，加快了速度，开始认真地自慰，你的阴蒂探出头来，乞求着你的抚摸。[if (balls > 0) {你用空出的手托起你的[balls]，在指间揉捏，感受着里面精液的翻滚}][if (balls > 0 && hasCock) {，同时}][if (hasCock) {你的[cock]在肚子上涂抹着源源不断的先列腺液，渴望被埋入一个温暖、紧致的洞穴中。}]没过多久，你的小穴就流出了花蜜，你轻弹着你的[clit]，同时将手指探入你火热粘稠的通道，让手指沾满淫液，然后在他鼻子底下挑逗地挥舞。他的鼻孔扩张，发出一声呻吟，扭动着臀部尽力向你挺送，你充满情欲的气味刺激着他沉醉在快感中的大脑。你将手指滑入他的嘴里，他闭上眼睛贪婪地吮吸干净，当你将自己刺入他的肉棒时，他从这种顺从的极乐中惊醒过来。");
         }
         else
         {
            outputText("你轻笑着抚弄你的[cock]，夸张地配合着每一次套弄和呻吟，继续在他不断渗出液体的肉棒上摇晃。你转过头，用充满情欲的眼神看着鸡蛇怪，加快了速度，开始自慰，先列腺液在龟头顶端渗出。[if (balls > 0 || hasVagina) {你[if (balls > 0) {托起你的[balls]，在指间揉捏，感受着里面精液的翻滚}][if (balls > 0 && hasVagina) {，并且你}][if (hasVagina) {感觉到你的小穴慢慢渗出汁液，粘稠的淫液涂满了你的大腿，尽管它被冷落了}]。}]没过多久，一股稳定的先列腺液从你的[cock]流出，你用指尖沾取了一些，然后在他鼻子底下挑逗地挥舞。他的鼻孔扩张，发出一声呻吟，扭动着臀部尽力向你挺送，你充满情欲的气味刺激着他沉醉在快感中的大脑。你将手指滑入他的嘴里，他闭上眼睛贪婪地吮吸干净，当你将自己刺入他的肉棒时，他从这种顺从的极乐中惊醒过来。");
         }
         outputText("[pg]你们俩花了一点时间享受终于结合在一起的感觉，然后你挺起臀部，开始利用摇晃的丝绳让他操你[if (analLooseness <= 1) {紧致|张开}]的后庭。当他的肉棒拔出时，那些肉突慢慢地拖拽并勾住你的内壁，在每一个肉突弹出时摩擦着你的入口，然后在他将肉棒埋入你体内、撑开你时，再次快速地刺入你[if (hasCock) {，尖端戳刺着你的前列腺}]。每一次抽插都伴随着呻吟和肉体碰撞的啪啪声打破了寂静，你的臀部在猛烈的操弄下慢慢变得有些红润。你继续取悦自己，有节奏地收缩你的通道，渴望在自己高潮前让他填满你。鸡蛇怪的肉棒在你的屁股里抽搐，他用大腿夹住你的臀部，绝望地在你的身后挺送，试图忍住。伴随着一阵脉动的颤抖，他的肉棒膨胀起来，将一波又一波滚烫的精液射入你的深处。他在将自己清空到你体内时咬了你的肩膀一口，让你也失去了理智。你猛烈地高潮了，[if (hasCock) {你的[cock]将珍珠白色的精液喷射在墙上[if (cumQuantity > 350) {，直到停止时已经把墙壁涂白了}]}][if (hasCock && hasVagina) {，并且}][if (hasVagina) {你的[pussy]浸湿了你的大腿，肉壁不断颤动}][if (balls > 0) {，热量蔓延穿过你紧绷的[balls]，随后[if (balls > 1) {它们慢慢放松|它慢慢放松}]}]。[pg]");
         outputText("你慢慢移开，脸颊微红，因为你的菊穴感到一阵寒意，毫无疑问是因为失去了他粗壮的阴茎。你转过身，试图保持镇定，而精液慢慢顺着你的臀瓣滴落，你解开鸡蛇怪的束缚，扶他到地上，揉了一会儿他的肩膀，你们俩在彼此的陪伴下享受着余韵。当你觉得准备好了，你向他道别，挑逗地说你明天还得再来，看着他睁大眼睛，肉棒微微抽搐，你忍不住笑了。");
         get_player().orgasm("Anal");
         get_player().buttChange(80,true);
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceButtfuck() : void
      {
         clearOutput();
         outputText("你走向他，[if (hasArmor) {一件件脱下你的[armor]，上演了一场相当精彩的表演，}]你的[hips]性感地摇曳着。他从地上抬头看着你，当你向他袒露自己时，他的眼中充满了困惑和欲望。在整个战斗过程中，你的目光一直无法从他那紧实、长满绒毛的臀部移开，现在你要把它据为己有。[pg]");
         outputText("你命令他跪下，轻轻地用手肘碰了碰他的侧腰，他慢慢地调整姿势，尾巴垂在后背上。动作缓慢而流畅，当他翻身四肢着地，然后看着你等待进一步的指示时，他那轻盈的身躯" + (get_noFur() ? "" : "在羽毛下") + "起伏着。当你打量他的身形时，你忍不住绕着他走了一圈，仔细观察他那轻盈、健美的身躯的每一个细节，然后将目光锁定在你的目标上。你伸出手，紧紧地抓住他的臀部，好好感受了一下那紧实的臀瓣" + (get_noFur() ? "" : "以及它们柔软的羽毛") + "。他惊讶地叫了一声，猛地向前一冲，甩动着尾巴。[pg]");
         outputText("现在，你可不能让那条调皮的尾巴碍事。你告诉他抬起尾巴，同时你在他身后[if (tailLeg) {盘起你的蛇尾|[if (isGoo) {趴在地上|跪下}]}]，一边亲昵地捧着他的臀瓣，大拇指轻轻按压，一边哄着说他是个多么乖的男孩。一旦他的尾巴移到一边，你就可以好好看看他了，抬起的根部让他的臀瓣微微分开。[pg]");
         outputText("当你用指尖顺着他略宽的臀部滑动，划过他" + (get_noFur() ? "" : " 毛茸茸的") + "后部时，你轻轻地拨开他的臀瓣，看看你将要面对的是什么。在他那小巧、肌肉发达的臀瓣之间，有一个紧致的褶皱，当你用手指划过它时，它微微抽搐着。虽然他绝对不经常这样做，但他显然偶尔也会享受一些后庭的欢愉。[pg]");
         outputText("你一边抚摸他的下背部，一边稍微吸吮了一下手指，让手指沾满唾液，然后开始挑逗他的屁股。你轻轻地把手指推入到第一个指关节，感觉到他温暖的内壁紧紧贴着你，这让鸡蛇发出一声带着喘息的呜咽。通过缓慢的扭动和旋转，你开始润滑他的入口，用空闲的手挤压和按摩他的臀部和尾巴根部。");
         outputText("[pg]没过多久，你就成功地将手指完全插了进去，时不时弯曲手指，摩擦他敏感的内壁。你的每一次动作都让他浑身颤抖，臀部微微抽搐，当你慢慢开始抽出手指时，他的呼吸也变得急促起来。");
         outputText("[pg]当你揉捏他的臀部时，他紫色的阴茎从包皮中挣脱出来，顶端渗出了先列腺液。你空出的手顺着他的阴茎向上滑动，用他滑腻的先列腺液进一步润滑你的手指，然后插入第二根手指，这次的速度快得多。当你的手指插到最深处时，他呻吟出声，他的阴茎向着腹部抽动，内壁紧紧包裹着你的手指。[pg]");
         outputText("你将手指抽插着，试图慢慢扩张他，同时确保他紧致的通道足够湿润。一旦你的手指能顺畅地进出，你便抚摸自己的[cock]，直到完全勃起。你对准位置，完全抽出手指，然后用缓慢而持续的压力将你的[cockhead]推入他体内，享受着此刻包裹着你的紧致热度，以及从他胸腔中引出的喘息和呜咽。");
         get_images().showImage("cockatrice-win-buttfuck");
         if(get_player().longestCockLength() <= 12)
         {
            outputText("你慢慢地将更多的[cock]送入他体内，沉醉于那紧紧依附着你的火热、抽搐的内壁，仿佛每一寸的深入都要将你榨干。");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]紧紧贴着他" + (get_noFur() ? "" : "毛茸茸") + "的臀瓣" + (get_noFur() ? "" : "，被他柔软的绒毛以一种令人愉悦的方式抚摸着") + "。");
            }
         }
         else
         {
            outputText("你慢慢地试图将更多的[cock]送入他紧致的腔道，但很快那令人窒息的紧致感就让你难以承受。你轻叹一声，退到一个更舒服的位置，有些失望自己太大，无法给他一个彻底的贯穿。");
         }
         outputText("你的每一个动作都让他颤抖，他的阴茎不断渗出先列腺液，起初是痛苦的呻吟，很快就变成了欢愉的喘息。[pg]");
         outputText("你很快开始抽插，起初很慢，温柔地确保他已经为你做好了充分的扩张，但随着他现在放松的通道让你深深埋入并饥渴地紧贴着你，你很快加快了速度。你能感觉到你的龟头在每一次抽插中都顶着他的前列腺，让他发出满足的呻吟，他的阴茎抽动着，将精液喷射到地上和他的腹部。当他开始享受，尽其所能地配合你的抽插时，你出其不意地在他紧致的臀瓣上狠狠拍了一巴掌，同时抓了一把。他的尾巴甩动着，后穴紧缩，你能感觉到自己在他那令人窒息的紧握下胀大。[pg]");
         outputText("伴随着一声呻吟，你再次拍打他，这次是在你完全没入他体内时拍打另一侧的臀瓣。在他的穴里感觉太棒了，他的内壁在你周围痉挛，而他的后穴紧紧夹住你的根部。你继续在他体内抽插，在他身上耸动，他在你身下颤抖呻吟，乞求更多。");
         if(get_player().balls > 0)
         {
            outputText("你感觉到你的[balls]在翻腾，沉甸甸地装满了浓稠的精液，迫不及待地想要倾注到他体内。");
         }
         else
         {
            outputText("你感觉到腹部涌起一股热流，你的阴茎胀大，准备好给他一次彻底的灌满。");
         }
         outputText("伴随着最后一次抽插，你准备释放，再次拍打那紧实的臀瓣，却发出一声压抑的呻吟，因为你的阴茎在他体内跳动却毫无效果，");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸紧缩着，因为" + (get_player().balls == 1 ? "它变得" : "它们变得") + "越来越热");
         }
         else
         {
            outputText("而你腹部的热量燃烧成了地狱之火");
         }
         outputText("[if (hasKnot) { 你的肉结肿胀，进一步将你堵在他体内}]。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("你的另一根" + (int(get_player().cocks.length) > 2 ? "阴茎只能" : "阴茎只能") + "喷出带有白色的先列腺液，顺着你的长度滴落。");
         }
         outputText("他紧致的后穴阻止了你射精，就像某种荡妇的阴茎环一样！[pg]");
         outputText("然而，鸡蛇怪却爆发性地射精了，他那布满凸起的紫色阴茎将浓稠的爬行动物精液喷射到地上和他的胸膛上，有些甚至溅到了他的" + (get_noFur() ? "下巴" : "喙") + "下方，然后才滑落。他在你身下颤抖，精疲力竭地喘息着，而你则试图通过抽插达到高潮，因为他的括约肌松开了紧握，他在高潮后的迷离中放松下来。你伴随着呜咽射精[if (cumNormal) { 喷射出的精液覆盖了他的内壁|[if (cumMedium) { 浓稠的精液覆盖了他的内壁，用热量将他填满|[if (cumHigh) { 粗壮的精液柱覆盖了他的内壁，将他完全填满，并从你的[cock]周围喷涌而出| 你淹没了他的后穴，精液覆盖了他的内壁，并回流将你们俩弄得一团糟}]}]}]，而[if (balls > 0) {你的[balls]里的紧绷感|你腹部的热量}]终于开始消退。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("你的另一根" + (int(get_player().cocks.length) > 2 ? "阴茎" : "阴茎") + "进一步涂抹了他的臀部，留下" + (get_noFur() ? "" : "他凌乱的羽毛和") + "尾巴下方黏糊糊的一团，这令人满足的景象让他的屁股看起来完全被占有了。");
         }
         outputText("[pg]伴随着湿润的吧唧声，你从他体内滑出[if (hasKnot) {尽管你的肉结让这有点困难}]，你让自己倒在地上，惊叹于你是如何将他紧致的屁股操成一个饥渴滴水的洞的。你休息了一会儿，然后清理干净自己[if (hasArmor) { 并重新穿好衣服}]，对这次遭遇感到非常满足。你留他在那里休息，想知道下次是否还能这样做。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function cockatriceBirth() : void
      {
         get_images().showImage("birth-cockatrice");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("你感到腹股沟传来一阵可怕的压力……然后是一阵剧痛，伴随着肉体撕裂的感觉。<b>你低下头，看到自己长出了一个新的阴道</b>。[pg]");
            get_player().createVagina();
         }
         outputText("你怀孕的肚子重量突然发生变化，让你踉跄了一下，跪倒在地。你意识到有什么东西要生出来了，你赶紧脱下[armor]，以免被即将到来的东西弄脏。一阵宫缩猛烈地穿过你的腹部，痛苦地撑开你的" + get_player().vaginaDescript() + "，阴唇大张，有什么东西开始顺着你的通道滑下。随着分娩的正式开始，一股粉红色的粘液浸透了下方的地面，白色的鸡蛋在你的阴唇间露出了头。你用力推挤，中等大小的蛋终于弹了出来，掉进粘液池中，让你松了一口气。");
         get_player().cuntChange(15,true,true,false);
         outputText("这种体验绝对让你兴奋不已，随着又一颗中等大小的蛋顺着产道滑下，你的阴蒂从包皮中露了出来，舒适地摩擦着你敏感的阴道壁。当宫缩将你紧紧拉伸，慢慢将下一颗蛋从你的下唇间挤出时，你喘息着、呻吟着。蛋弹出的那一刻，一声喘息吓了你一跳，直到你意识到那是你自己的声音在回应这突如其来的压力和快感。你兴奋得难以自制，开始自慰你的阴蒂，在沾满黏液的拇指和食指间上下抚弄。它随着你的心跳抽搐、跳动，那难以置信的敏感度让你的脆弱心智被一波波快感淹没。你猛烈地高潮了，每一颗中等大小的蛋在弹出前都让你的小穴微微张开。你瘫倒在地，神经紧绷，在性高潮的冲击下几乎失去了意识。[pg]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(3));
         outputText("当你发现自己能站起来时，你检查了自己生下的东西；" + Utils.num2Text(Math.floor(get_player().totalFertility() / 7)) + "颗中等大小的白色蛋，形状毫无疑问是鸡蛋。你拿起一颗，轻轻地贴在耳边；在里面，你能听到一颗小小的心脏在快速跳动。你小心翼翼地把它和它的同伴们放在一起，凝视着你的一窝蛋，一种令人作呕的复杂情绪牵扯着你。没有别的办法了：你必须把这窝蛋带回你的营地[pg]");
         outputText("当黎明破晓时，你醒来看到一窝蛋仍然静静地躺在一滩粉红色的黏液中。所有的蛋都空了，旁边还有小小的鸡蛇。它们有粉红色的胸部、侧腹、前腿、头部、颈部以及长长的背部。你慢慢地把自己拖成坐姿，在你面前终于出现了十几只刚孵化出来的鸡蛇，它们四肢着地爬来爬去，蛋液在它们的羽毛上慢慢变干，它们互相舔舐，甩动着鸡尾巴，用小脑袋里巨大的眼球眨巴着看着周围的环境，对更广阔世界产生了兴趣。你无法说清自己是觉得这景象极其可爱还是极其恶心，你也不知道自己无法移开视线是因为对这些你带到这个世界上的生物着迷，还是因为" + Utils.num2Text(Math.floor(get_player().totalFertility() / 7)) + "只小鸡蛇眼睛盯着你的效果。你怀疑无论哪种情况，答案都是两者兼而有之。[pg]");
         outputText("它们似乎很快就适应了自己所处的环境，越来越自信地绕着彼此跑来跑去，你可以看到即使在你观察的短短时间里，它们也长大了，它们娇嫩的羽毛在阳光和空气的拍打下变硬了。其中一只突然像公鸡一样急忙寻找掩护，你看着它消失在灌木丛后。它们很快就都行动起来，一个接一个地冲刺并从视线中消失。最后走的是最大的一只，也就是最先孵化出来的那只：它在慢慢转身并效仿之前，死死地盯着你。你敢发誓，在它离开之前，它给了你一个最微小的微笑，一个孩子般渴望的咧嘴笑。你留下的关于刚刚发生的事情的唯一证据就是一堆黏糊糊的废弃蛋壳。[pg]");
         if(get_player().cor < 33)
         {
            outputText("你发现自己被这次经历所震撼，并对你在这个世界上释放出的一窝怪物感到深深的不安。你爬起来，擦干身子离开，热切地向自己保证以后在鸡蛇周围会更加小心。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你爬起来，擦干身子离开。你对刚刚发生的事情感到矛盾；一方面，你对刚刚在这个世界上释放出的十几只怪物感到不安，另一方面，你又忍不住为它们和自己感到一种奇怪的自豪。");
         }
         else
         {
            outputText("带着温柔的微笑，你起身离开，享受着粉红色黏液顺着双腿流下的感觉。你迫不及待地想再次怀孕，让你的肚子因为装满蛋而鼓起来，向这个世界释放更多可爱的生物，它们长大后可以依次操你和其他所有人，这样每个人都能像你一样享受生活。");
         }
         if(get_player().hips.rating < 25)
         {
            var _temp_1:* = get_player().hips;
            _temp_1.rating = _temp_1.rating + 1;
            outputText("你的[hips]也变得更厚实了。");
         }
      }
   }
}

