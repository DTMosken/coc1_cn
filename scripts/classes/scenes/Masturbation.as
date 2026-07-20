package classes.scenes
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.armors.NaughtyNunsHabit;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Masturbation extends BaseContent
   {
      
      public function Masturbation()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function updateMasturbation() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2074,FlagDict_Impl_.arrayReadInt(_loc1_,2074) + 1);
      }
      
      public function titFuckSingle() : void
      {
         var _loc1_:* = null as CockTypesEnum;
         if(get_player().get_lib100() < 45)
         {
            outputText("你握住自己的" + get_player().cockDescript() + "，开始小心翼翼地将它引向");
         }
         else if(get_player().get_lib100() < 70)
         {
            outputText("你因期待而颤抖着，将");
            _loc1_ = get_player().cocks[0].get_cockType();
            if(_loc1_ == CockTypesEnum.DEMON)
            {
               outputText("一圈凸起环绕的");
            }
            else
            {
               while(true)
               {
                  if(_loc1_ != CockTypesEnum.ANEMONE)
                  {
                     if(_loc1_ != CockTypesEnum.DISPLACER)
                     {
                        if(_loc1_ == CockTypesEnum.HORSE)
                        {
                           outputText("外扩的");
                           break;
                        }
                        if(_loc1_ == CockTypesEnum.TENTACLE)
                        {
                           outputText("球茎状的");
                           break;
                        }
                        if(_loc1_ != CockTypesEnum.DOG)
                        {
                           if(_loc1_ != CockTypesEnum.FOX)
                           {
                              if(_loc1_ != CockTypesEnum.WOLF)
                              {
                                 break;
                              }
                           }
                        }
                        outputText("尖尖的");
                        break;
                     }
                  }
                  outputText("蠕动的");
                  break;
               }
            }
            outputText("那根" + get_player().cockDescript() + "的顶端抵在");
         }
         else
         {
            outputText("你毫不犹豫地把");
            _loc1_ = get_player().cocks[0].get_cockType();
            if(_loc1_ == CockTypesEnum.ANEMONE)
            {
               outputText("布满触手的蘑菇状物，也就是");
            }
            else if(_loc1_ == CockTypesEnum.DEMON)
            {
               outputText("一圈圈凸起环绕的怪物般东西，也就是");
            }
            else if(_loc1_ == CockTypesEnum.DISPLACER)
            {
               outputText("张开的顶部，也就是");
            }
            else if(_loc1_ == CockTypesEnum.HORSE)
            {
               outputText("充血胀大的伞状顶端，也就是");
            }
            else if(_loc1_ == CockTypesEnum.HUMAN)
            {
               outputText("你那");
            }
            else if(_loc1_ == CockTypesEnum.TENTACLE)
            {
               outputText("大得夸张的蘑菇状物，也就是");
            }
            else
            {
               while(true)
               {
                  if(_loc1_ != CockTypesEnum.DOG)
                  {
                     if(_loc1_ != CockTypesEnum.FOX)
                     {
                        if(_loc1_ != CockTypesEnum.WOLF)
                        {
                           outputText(get_player().cockHead() + "，也就是");
                           break;
                        }
                     }
                  }
                  outputText("你那");
                  break;
               }
            }
            outputText("你的" + get_player().cockDescript() + "插进");
         }
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("其中一个");
         }
         else
         {
            outputText("你的");
         }
         if(get_player().averageNipplesPerBreast() > 1)
         {
            outputText("众多");
         }
         if(get_player().averageVaginalLooseness() < 2)
         {
            outputText("被撑得生疼的乳头");
         }
         else if(get_player().averageVaginalLooseness() < 4)
         {
            outputText("肿胀得异常的乳头");
         }
         else
         {
            outputText("巨大肿胀、像小穴般的乳头");
         }
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("，长在你下方的一只乳房上");
         }
         outputText("。");
         if(get_player().averageLactation() == 0)
         {
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("你");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("滑腻的淫液滴落");
               _loc1_ = get_player().cocks[0].get_cockType();
               if(_loc1_ == CockTypesEnum.ANEMONE)
               {
                  outputText("，淌过近乎透明的皮肤，那是");
               }
               else if(_loc1_ == CockTypesEnum.CAT)
               {
                  outputText("淌过覆盖其上的粉色带刺突起");
               }
               else if(_loc1_ == CockTypesEnum.DEMON)
               {
                  outputText("顺着发亮的紫色皮肤和肉疙瘩淌下，来自");
               }
               else if(_loc1_ == CockTypesEnum.DISPLACER)
               {
                  outputText("淌过暗紫色的表面");
               }
               else if(_loc1_ == CockTypesEnum.HORSE)
               {
                  outputText("顺着斑驳的皮肤淌下，来自");
               }
               else if(_loc1_ == CockTypesEnum.LIZARD)
               {
                  outputText("顺着凹凸不平的紫色皮肤往下淌");
               }
               else if(_loc1_ == CockTypesEnum.TENTACLE)
               {
                  outputText("顺着橡胶般的皮肤淌下，来自");
               }
               else
               {
                  while(true)
                  {
                     if(_loc1_ != CockTypesEnum.DOG)
                     {
                        if(_loc1_ != CockTypesEnum.FOX)
                        {
                           if(_loc1_ != CockTypesEnum.WOLF)
                           {
                              outputText("顺着皮肤淌下，来自");
                              break;
                           }
                        }
                     }
                     outputText("顺着红色发亮的皮肤淌下，来自");
                     break;
                  }
               }
               outputText("你的" + get_player().cockDescript() + "和你");
            }
            else
            {
               outputText("滑腻的淫液从你的" + get_player().cockDescript() + "周围喷溅而出，溅到你");
            }
         }
         else if(get_player().averageLactation() < 2)
         {
            outputText("一道道乳白色淫液缓缓");
            _loc1_ = get_player().cocks[0].get_cockType();
            if(_loc1_ == CockTypesEnum.ANEMONE)
            {
               outputText("流淌着，并从无数细小触手上滴落，来自");
            }
            else if(_loc1_ == CockTypesEnum.CAT)
            {
               outputText("顺着带刺的粉色肉体淌下，来自");
            }
            else if(_loc1_ == CockTypesEnum.DEMON)
            {
               outputText("顺着发亮的紫色皮肤和肉疙瘩淌下，来自");
            }
            else if(_loc1_ == CockTypesEnum.DISPLACER)
            {
               outputText("淌过紫色、带有肉结的肉体，来自");
            }
            else if(_loc1_ == CockTypesEnum.HORSE)
            {
               outputText("顺着斑驳的皮肤淌下，来自");
            }
            else if(_loc1_ == CockTypesEnum.HUMAN)
            {
               outputText("顺着皮肤淌下，来自");
            }
            else if(_loc1_ == CockTypesEnum.LIZARD)
            {
               outputText("淌过紫色、凹凸不平的肉体，来自");
            }
            else if(_loc1_ == CockTypesEnum.TENTACLE)
            {
               outputText("顺着橡胶般的皮肤淌下，来自");
            }
            else
            {
               while(true)
               {
                  if(_loc1_ != CockTypesEnum.DOG)
                  {
                     if(_loc1_ != CockTypesEnum.FOX)
                     {
                        if(_loc1_ != CockTypesEnum.WOLF)
                        {
                           outputText("淌过敏感的皮肤，来自");
                           break;
                        }
                     }
                  }
                  outputText("顺着红色发亮的皮肤淌下，来自");
                  break;
               }
            }
            outputText("你的" + get_player().cockDescript() + "和你");
         }
         else
         {
            outputText("米尔琪的淫液从你的" + get_player().cockDescript() + "周围喷出，把");
            _loc1_ = get_player().cocks[0].get_cockType();
            if(_loc1_ == CockTypesEnum.ANEMONE)
            {
               outputText("那根古怪的水生肉茎染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.CAT)
            {
               outputText("粉色的猫科皮肤染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.DEMON)
            {
               outputText("它泛紫的皮肤染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.DISPLACER)
            {
               outputText("紫色、布满肉结的肉茎染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.HORSE)
            {
               outputText("它斑驳的皮肤染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.HUMAN)
            {
               outputText("它染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.LIZARD)
            {
               outputText("紫色、凹凸不平的肉茎染成白色。你");
            }
            else if(_loc1_ == CockTypesEnum.TENTACLE)
            {
               outputText("它橡胶般的皮肤染成白色。你");
            }
            else
            {
               while(true)
               {
                  if(_loc1_ != CockTypesEnum.DOG)
                  {
                     if(_loc1_ != CockTypesEnum.FOX)
                     {
                        if(_loc1_ != CockTypesEnum.WOLF)
                        {
                           outputText("整根都染成白色。你");
                           break;
                        }
                     }
                  }
                  outputText("它光亮的皮肤染成白色。你");
                  break;
               }
            }
         }
         if(Math.round(get_player().cockArea(0)) >= get_player().vaginalCapacity())
         {
            if(get_player().get_sens100() < 45)
            {
               outputText("用力低哼着，试图把你的" + get_player().cockDescript() + "塞进");
            }
            else if(get_player().get_sens100() < 70)
            {
               outputText("强忍着眼泪，试图把你的" + get_player().cockDescript() + "塞进");
            }
            else
            {
               outputText("在痛苦与快感交织中尖叫着，试图把你的" + get_player().cockDescript() + "塞进");
            }
            if(get_player().averageVaginalLooseness() < 2)
            {
               outputText("你肿胀乳头上那小小的、被过度撑开的口子里。");
            }
            else if(get_player().averageVaginalLooseness() < 4)
            {
               outputText("你肥大肿胀的乳头上那充血鼓胀的开口里。");
            }
            else
            {
               outputText("你非人乳头小穴那大张的交合口里。");
            }
            if(Math.round(get_player().cockArea(0)) == get_player().vaginalCapacity())
            {
               if(get_player().averageVaginalLooseness() < 2)
               {
                  outputText("你可怜而饱受折磨的乳头勉强才足以容纳你的" + get_player().cockDescript() + "，但它终究还是将其吞纳了进去。");
               }
               else if(get_player().averageVaginalLooseness() < 4)
               {
                  outputText("你将自己的" + get_player().cockDescript() + "狠狠顶入深处，肿胀乳头末端那充血的开口被撑到了极限。");
               }
               else
               {
                  _loc1_ = get_player().cocks[0].get_cockType();
                  if(_loc1_ == CockTypesEnum.ANEMONE)
                  {
                     outputText("你胀大乳头肿起的尖端裹住了环绕在你的" + get_player().cockDescript() + "顶端周围、带来刺痛的触手，随着湿滑的咕叽声不断抽搐，在人为催发的欲望中变得通红发炎。");
                  }
                  else if(_loc1_ == CockTypesEnum.CAT)
                  {
                     outputText("你胀大乳头肿起的尖端被你的" + get_player().cockDescript() + "那带倒刺的顶端撑开，像一张巨口般将其吞下。");
                  }
                  else if(_loc1_ == CockTypesEnum.DEMON)
                  {
                     outputText("你胀大乳头肿起的唇瓣被你的" + get_player().cockDescript() + "那布满结节环的顶端撑开，像一张巨口般将其吞下。");
                  }
                  else if(_loc1_ == CockTypesEnum.DISPLACER)
                  {
                     outputText("你胀大乳头肿起的尖端裹住了你的" + get_player().cockDescript() + "那伸展张开的头部，随着它在你体内蠕动，发出湿滑的咕叽声不断抽搐。");
                  }
                  else if(_loc1_ == CockTypesEnum.HORSE)
                  {
                     outputText("你胀大乳头肿起的唇瓣被你的" + get_player().cockDescript() + "那外扩的顶端撑开，像一张巨口般将其吞下。");
                  }
                  else if(_loc1_ == CockTypesEnum.HUMAN)
                  {
                     outputText("你胀大乳头肿起的唇瓣被你的" + get_player().cockDescript() + "顶端撑开，像一张巨口般将其吞下。");
                  }
                  else if(_loc1_ == CockTypesEnum.LIZARD)
                  {
                     outputText("你胀大乳头肿起的尖端裹住了你的" + get_player().cockDescript() + "那尖锐的顶端，随着它吞下这根布满肉结的肢体，诡异地被撑开。");
                  }
                  else if(_loc1_ == CockTypesEnum.TENTACLE)
                  {
                     outputText("你胀大乳头肿起的唇瓣被你的" + get_player().cockDescript() + "那圆润的顶端撑开，像一张巨口般将其吞下。");
                  }
                  else
                  {
                     while(true)
                     {
                        if(_loc1_ != CockTypesEnum.DOG)
                        {
                           if(_loc1_ != CockTypesEnum.FOX)
                           {
                              if(_loc1_ != CockTypesEnum.WOLF)
                              {
                                 outputText("你胀大乳头肿起的尖端裹住了你的" + get_player().cockDescript() + "的" + get_player().cockHead() + "，像一张巨口般将其吞下。");
                                 break;
                              }
                           }
                        }
                        outputText("你胀大乳头肿起的唇瓣被你的" + get_player().cockDescript() + "那尖锐的顶端撑开，像一张巨口般将其吞下。");
                        break;
                     }
                  }
               }
               outputText("每一次挺动，你都将自己的" + get_player().cockDescript() + "更深地埋进贪婪的乳房里。交叠的感受几乎将你淹没，你的理智几乎无法承受那份强烈的充实感——这种地方本不该有这样的感觉。");
            }
            if(Math.round(get_player().cockArea(0)) > get_player().vaginalCapacity())
            {
               if(get_player().averageVaginalLooseness() < 2)
               {
                  outputText("你可怜的乳头被折磨得不成样子，和你的" + get_player().cockDescript() + "相比实在太过狭小；可你被欲火烧得神志恍惚，还是不停地尝试。");
               }
               else if(get_player().averageVaginalLooseness() < 4)
               {
                  outputText("你肿胀乳头末端那充血的开口被撑到极限，甚至还要更开，只为了让你的" + get_player().cockDescript() + "彻底顶进去。");
               }
               else
               {
                  _loc1_ = get_player().cocks[0].get_cockType();
                  if(_loc1_ == CockTypesEnum.ANEMONE)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那刺痛的尖端仍把它们撑得更开，并将虚假的欲火灌入其中。");
                  }
                  else if(_loc1_ == CockTypesEnum.CAT)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那带倒刺的尖端仍把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.DEMON)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "前端仍把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.DISPLACER)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那宽大的龟头仍把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.HORSE)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那外扩的前端仍把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.HUMAN)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "前端仍把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.LIZARD)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那尖锐的前端仍缓缓把它们撑得更开。");
                  }
                  else if(_loc1_ == CockTypesEnum.TENTACLE)
                  {
                     outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "前端仍把它们撑得更开。");
                  }
                  else
                  {
                     while(true)
                     {
                        if(_loc1_ != CockTypesEnum.DOG)
                        {
                           if(_loc1_ != CockTypesEnum.FOX)
                           {
                              if(_loc1_ != CockTypesEnum.WOLF)
                              {
                                 outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "的" + get_player().cockHead() + "仍把它们撑得更开。");
                                 break;
                              }
                           }
                        }
                        outputText("你胀大的乳头上，那肿起的唇瓣大大张开，但你的" + get_player().cockDescript() + "那粗大的尺寸仍把它们撑得更开。");
                        break;
                     }
                  }
               }
               outputText("你一边用力一边喘息冒汗，尽可能把你的" + get_player().cockDescript() + "塞进被撑到过度扩张的乳头里。" + get_player().cockDescript() + "周围那难以置信的紧致感，和你胀大乳头传来的疼痛交织在一起，化作一种令人神魂颠倒的感觉，让你头晕目眩。");
            }
            if(get_player().averageLactation() > 0)
            {
               outputText("乳白色的");
            }
            else
            {
               outputText("滑腻的");
            }
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("淫液很快为你的" + get_player().cockDescript() + "整根都裹上一层闪亮的爱液。");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("淫液顺着你的" + get_player().cockDescript() + "成股淌下，");
               if(get_player().cocks[0].hasKnot())
               {
                  outputText("在你根部附近的[knotword]周围汇成一滩。");
               }
               else
               {
                  _loc1_ = get_player().cocks[0].get_cockType();
                  if(_loc1_ == CockTypesEnum.ANEMONE)
                  {
                     outputText("在你根部附近蠕动的触手周围汇成一滩。");
                  }
                  else if(_loc1_ == CockTypesEnum.CAT)
                  {
                     outputText("在你根部附近的棘刺周围汇成一滩。");
                  }
                  else if(_loc1_ == CockTypesEnum.DEMON)
                  {
                     outputText("汇聚在你的肉棒根部。");
                  }
                  else if(_loc1_ == CockTypesEnum.HORSE)
                  {
                     outputText("积聚在你的阴鞘内外。");
                  }
                  else if(_loc1_ == CockTypesEnum.LIZARD)
                  {
                     outputText("汇聚在你根部附近的球状隆起周围。");
                  }
                  else if(_loc1_ == CockTypesEnum.TENTACLE)
                  {
                     outputText("和触手自身分泌的润滑液混在一起。");
                  }
                  else
                  {
                     while(true)
                     {
                        if(_loc1_ != CockTypesEnum.DISPLACER)
                        {
                           if(_loc1_ != CockTypesEnum.DOG)
                           {
                              if(_loc1_ != CockTypesEnum.FOX)
                              {
                                 if(_loc1_ != CockTypesEnum.WOLF)
                                 {
                                    outputText("积聚在你的胯间。");
                                    break;
                                 }
                              }
                           }
                        }
                        outputText("汇聚在你根部附近的球状隆起周围。");
                        break;
                     }
                  }
               }
            }
            else
            {
               outputText("随着你的" + get_player().cockDescript() + "每一次抽送，淫液都从你备受折磨的乳头里喷涌而出，溅得你的手臂和脸上满是自己的分泌物。");
            }
         }
         if(Math.round(get_player().cockArea(0)) < get_player().vaginalCapacity())
         {
            if(get_player().get_sens100() < 45)
            {
               outputText("你愉悦地叹息起来");
            }
            else if(get_player().get_sens100() < 70)
            {
               outputText("你愉悦地呻吟起来");
            }
            else
            {
               outputText("你欢愉地尖叫起来");
            }
            outputText("，你的" + get_player().cockDescript() + "滑入");
            if(get_player().averageVaginalLooseness() < 2)
            {
               outputText("你肿胀乳头上那被撑得过紧的小小开口。你的" + get_player().cockDescript() + "轻易刺入肿胀的乳头，第一次挺进就滑入了一半。");
            }
            else if(get_player().averageVaginalLooseness() < 4)
            {
               outputText("你肥大肿胀的乳头上那充血鼓胀的开口。你的" + get_player().cockDescript() + "深深刺入那异常充血肿大的乳头，轻易就贯穿了进去。");
            }
            else
            {
               outputText("你那非人乳头小穴上大张的交媾口。臃肿乳头上肿胀的肉唇吞住了");
               if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
               {
                  outputText("外扩的");
               }
               outputText("你的" + get_player().cockDescript() + "顶端，并开始顺着整根肉棒往下滑，");
               _loc1_ = get_player().cocks[0].get_cockType();
               if(_loc1_ == CockTypesEnum.ANEMONE)
               {
                  outputText("将它完全吞没，在所过之处留下一道灼热的欲望痕迹。");
               }
               else if(_loc1_ == CockTypesEnum.CAT)
               {
                  outputText("将它完全吞没，每一根弹性倒刺都让你因快感而颤抖。");
               }
               else if(_loc1_ == CockTypesEnum.DEMON)
               {
                  outputText("将它完全吞没，每一个凸起和小结都让你因邪异的快感而颤抖。");
               }
               else if(_loc1_ == CockTypesEnum.LIZARD)
               {
                  outputText("一边将它完全吞入；沿途每一个鼓胀的肉结都把那个孔穴撑得更开。");
               }
               else if(_loc1_ == CockTypesEnum.TENTACLE)
               {
                  outputText("一边将它完全吞入；它还自行扭动、脉动着，抽插着你的乳头。");
               }
               else
               {
                  while(true)
                  {
                     if(_loc1_ != CockTypesEnum.DISPLACER)
                     {
                        if(_loc1_ != CockTypesEnum.DOG)
                        {
                           if(_loc1_ != CockTypesEnum.FOX)
                           {
                              if(_loc1_ != CockTypesEnum.WOLF)
                              {
                                 outputText("将它完全吞入。");
                                 break;
                              }
                           }
                        }
                     }
                     outputText("甚至毫不费力地吞下你鼓胀的肉结。");
                     break;
                  }
               }
            }
            outputText("你沉浸在这种感觉中，慢慢地将你的" + get_player().cockDescript() + "在撑开的乳头里进进出出地套弄。你的阴茎被那畸形乳房温暖湿润地包裹着，而");
            if(get_player().averageLactation() > 0)
            {
               outputText("乳白色的");
            }
            else
            {
               outputText("滑腻的");
            }
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("淫液很快为你的" + get_player().cockDescript() + "整根都裹上一层闪亮的爱液。");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("淫液沿着你的" + get_player().cockDescript() + "成股淌下，在你的胯间积成一滩。");
            }
            else if(get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0)
            {
               outputText("淫液从你肿胀的乳头里涌出，淋在你的" + get_player().cockDescript() + "和手上，在你身下的地面上积成一滩。");
            }
            else if(get_player().hasSheath())
            {
               outputText("淫液沿着你的" + get_player().cockDescript() + "成股淌下，在你的肉鞘内外积聚起来。");
            }
            else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
            {
               outputText("淫液从你肿胀的乳头里涌出，淋在你的" + get_player().cockDescript() + "和手上，在你身下的地面上积成一滩。");
            }
            else if(get_player().countCocksOfType(CockTypesEnum.DEMON) > 0)
            {
               outputText("淫液从你肿胀的乳头里涌出，淋在你的" + get_player().cockDescript() + "和手上，在你身下的地面上积成一滩。");
            }
            else
            {
               outputText("淫液从你肿胀的乳头里涌出，淋在你的" + get_player().cockDescript() + "和手上，在你身下的地面上积成一滩。");
            }
         }
      }
      
      public function titForeplay() : void
      {
         if(int(get_player().breastRows.length) == 1 && get_player().biggestTitSize() > 3)
         {
            if(get_player().get_lib100() < 45)
            {
               outputText("你用手指轻轻抚摸你的[breasts]");
            }
            else if(get_player().get_lib100() < 70)
            {
               outputText("你用双手粗暴地揉抓你的[breasts]");
            }
            else
            {
               outputText("你用双手狠狠挤压你的[breasts]");
            }
         }
         else if(int(get_player().breastRows.length) > 1 && get_player().biggestTitSize() > 3)
         {
            if(get_player().get_lib100() < 45)
            {
               outputText("你迟疑地用双手拂过身前，依次爱抚你那" + Utils.num2Text(get_player().totalBreasts()) + "只乳房。");
            }
            else if(get_player().get_lib100() < 70)
            {
               outputText("你用双手拂过身前，依次揉捏你那" + Utils.num2Text(get_player().totalBreasts()) + "只乳房。");
            }
            else
            {
               outputText("你粗暴地用双手拂过身前，依次揉抓你那" + Utils.num2Text(get_player().totalBreasts()) + "只乳房。");
            }
            if(get_player().cor <= 25)
            {
               outputText("当你切实触摸到自己异常的禀赋时，羞耻的泪水几乎夺眶而出；可你还是忍不住把你的" + get_player().allBreastsDescript() + "挤在一起");
            }
            else if(get_player().cor < 75)
            {
               outputText("尽管你心里有一小部分仍因自己这异乎寻常的禀赋而感到惊恐，但这并不妨碍你把自己的" + get_player().allBreastsDescript() + "挤在一起");
            }
            else
            {
               outputText("这些异常禀赋带来的触感提醒让你感到一阵美妙的战栗。你轻叹一声，把自己的奶子挤在一起");
            }
         }
         if(get_player().hasFuckableNipples() && get_player().biggestTitSize() > 3)
         {
            if(int(get_player().breastRows.length) >= 1)
            {
               outputText("，同时把注意力转向自己的乳头");
            }
            if(get_player().get_lib100() < 60)
            {
               outputText("。你犹豫着用手指摩挲着");
            }
            else
            {
               outputText("。你急切地开始用力抚弄");
            }
            if(get_player().averageVaginalLooseness() < 2)
            {
               outputText("每颗乳头尖端那细小而娇嫩的开口。");
            }
            else if(get_player().averageVaginalLooseness() < 4)
            {
               outputText("每颗乳头尖端那皱缩的小孔。");
            }
            else if(get_player().averageNipplesPerBreast() > 1)
            {
               outputText("众多");
            }
            else
            {
               outputText("长在每只乳房顶端、肿胀得像小穴般的唇瓣。");
            }
            if(get_player().get_sens100() < 45)
            {
               outputText("你满足地叹了口气，当");
            }
            else if(get_player().get_sens100() < 70)
            {
               outputText("你淫荡地呻吟着，当");
            }
            else
            {
               outputText("你舒服得尖叫起来，当");
            }
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("感觉到自己的乳头渐渐松弛开来。");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("开始把从胀大的乳头里渗出的滑腻分泌物，慢慢涂满你的[breasts]。");
            }
            else
            {
               outputText("一小股一小股的");
               if(get_player().averageLactation() > 0)
               {
                  outputText("乳白色的");
               }
               outputText("淫液从你胀大的乳头里喷出来。");
            }
            if(get_player().averageLactation() > 0 && get_player().averageLactation() < 2)
            {
               outputText("你那怪异的乳房滴下由小穴淫液和乳汁混成的黏液，溅得你的[legs]和胯间到处都是。");
            }
            else if(get_player().averageLactation() < 3)
            {
               outputText("你那怪异的乳房泄出一道道混着乳汁的黏稠淫液，流得你的[legs]和胯间到处都是。");
            }
            else
            {
               outputText("你那怪异的乳房不断淌出源源不绝的乳白色淫液，把你的[legs]和胯间都浸在乳状黏液里。");
            }
         }
         else if(int(get_player().breastRows.length) > 0 && get_player().biggestTitSize() > 3)
         {
            outputText("，发出");
            if(get_player().get_sens100() < 45)
            {
               outputText("一声声愉悦的轻喘；每当你拨弄自己的");
            }
            else if(get_player().get_sens100() < 70)
            {
               outputText("一声声愉悦的响亮呻吟；每当你拨弄自己的");
            }
            else
            {
               outputText("一声声愉悦的尖叫；每当你拨弄自己的");
            }
            if(get_player().totalNipples() > 2)
            {
               outputText("众多");
            }
            if(get_player().get_lust100() >= 50)
            {
               if(get_player().biggestLactation() > 2)
               {
                  outputText("又大又肿胀的乳头。");
               }
               else if(get_player().biggestLactation() > 1)
               {
                  outputText("肥厚而皱缩的乳头。");
               }
               else
               {
                  outputText("挺立的乳头。");
               }
            }
            else
            {
               outputText("乳头。");
            }
            if(get_player().biggestLactation() > 1 && get_player().biggestLactation() < 2)
            {
               outputText("一滴滴乳汁从每颗乳头上淌下，溅落在你的[legs]和胯间。");
            }
            else if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() < 3)
            {
               outputText("细细的乳汁从每颗乳头喷出，溅落在你的[legs]和胯间。");
            }
            else if(get_player().biggestLactation() >= 3)
            {
               outputText("乳汁不断从每颗乳头上淋淋沥沥地流下，浸湿了你的[legs]和胯间。");
            }
         }
      }
      
      public function titDrink() : void
      {
         if(get_player().biggestTitSize() > 5 && get_player().averageLactation() > 1)
         {
            get_images().showImage("masti-tit");
            if(get_player().biggestLactation() > 3)
            {
               outputText("你把自己的一只[breasts]举到唇边，贪婪地大口吞咽那股珍贵乳汁。乳汁溅了你满脸，害你差点噎住。[pg]");
               get_player().refillHunger(50);
               get_player().boostLactation(0.05);
               get_player().milked();
            }
            else if(get_player().biggestLactation() > 2)
            {
               outputText("你把自己的一只[breasts]举到唇边，尽情享用这份丰盛的馈赠。浓郁的奶香充满你的口腔，你贪婪地一口口吞下。[pg]");
               get_player().refillHunger((get_player().biggestLactation() - 2) * 30 + 20);
               get_player().boostLactation(0.05);
               get_player().milked();
            }
            else if(get_player().biggestLactation() > 1)
            {
               outputText("你把自己的一只[breasts]举到唇边，吮吸着这份丰盛的馈赠。你大口吞下大部分乳汁，感受着甜美浓郁的奶香。[pg]");
               get_player().refillHunger((get_player().biggestLactation() - 1) * 20);
               get_player().boostLactation(0.05);
               get_player().milked();
            }
         }
      }
      
      public function titCum(param1:Number = 3) : void
      {
         if(get_player().averageLactation() >= 2 && !get_player().hasFuckableNipples())
         {
            outputText("随着一波又一波的高潮在你的体内激荡，你感觉到乳房里的压力越来越大，然后突然释放出来，因为");
            if(get_player().averageLactation() <= 2.6)
            {
               outputText("一道道细细的乳汁从你的");
            }
            if(get_player().averageLactation() > 2.6 && get_player().averageLactation() < 3)
            {
               outputText("一股股浓稠的乳汁从你的");
            }
            if(get_player().averageLactation() >= 3)
            {
               outputText("汹涌如潮的乳汁从你的");
            }
            if(get_player().nippleLength <= 1)
            {
               outputText("挺立的乳头喷射而出，");
            }
            if(get_player().nippleLength > 1 && get_player().nippleLength < 4)
            {
               outputText("肥厚皱缩的乳头喷射而出，");
            }
            if(get_player().nippleLength >= 4)
            {
               outputText("巨大肿胀的乳头喷射而出，");
            }
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               if(get_player().averageLactation() < 2.6)
               {
                  outputText("溅进那团黏液里。");
               }
               if(get_player().averageLactation() >= 2.6)
               {
                  outputText("把那团黏液灌满了你的乳汁。");
               }
            }
            else
            {
               if(get_player().averageLactation() <= 2.6)
               {
                  outputText("乳汁溅得到处都是。");
               }
               if(get_player().averageLactation() > 2.6 && get_player().averageLactation() < 3)
               {
                  outputText("将附近的一切都覆满乳汁。");
               }
               if(get_player().averageLactation() >= 3)
               {
                  outputText("把整片区域都浸得湿透。");
               }
            }
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("一种奇异的感觉在你的乳房中积聚，乳头似乎也随之绷紧、颤动，像是在期待着什么。你");
            if(get_player().get_sens100() < 70)
            {
               outputText("在狂喜中呻吟起来，你那肿胀得异乎寻常的乳头");
            }
            if(get_player().get_sens100() >= 70)
            {
               outputText("在狂喜中尖叫起来，你那肿胀得异乎寻常的乳头");
            }
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("滴滴答答地流出");
            }
            if(get_player().averageVaginalWetness() >= 2 && get_player().averageVaginalWetness() < 4)
            {
               outputText("喷洒出");
            }
            if(get_player().averageVaginalWetness() >= 4)
            {
               outputText("喷涌出");
            }
            if(get_player().averageLactation() > 0)
            {
               outputText("乳汁和");
            }
            outputText("小穴淫液");
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               outputText("混进覆盖你身体的蓝色黏液里。");
            }
            else
            {
               outputText("弄得到处都是。");
            }
         }
      }
      
      public function tentacleSelfFuck() : void
      {
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         var _loc3_:int = 0;
         while(_loc3_ < int(get_player().cocks.length))
         {
            if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               if(_loc1_ == -1)
               {
                  _loc1_ = _loc3_;
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < int(get_player().cocks.length))
         {
            if(_loc3_ != _loc1_)
            {
               if(_loc2_ < 0)
               {
                  _loc2_ = _loc3_;
               }
               else if(Utils.rand(2) == 0 && get_player().cocks[_loc2_].get_cockType() != CockTypesEnum.TENTACLE)
               {
                  _loc2_ = _loc3_;
               }
               else if(get_player().cocks[_loc3_].get_cockType() == CockTypesEnum.TENTACLE)
               {
                  _loc2_ = _loc3_;
               }
            }
            _loc3_++;
         }
         clearOutput();
         doStripCheck();
         outputText("几乎就在同时，你的" + get_player().cockDescript(_loc1_) + "像等着被喂食的宠物一样立刻精神起来，而你不得不承认，你正打算给那根扭动的触手它想要的东西——一道又热又滑、能让它钻进去的缝隙。你的[vagina]已经变得");
         if(get_player().wetness() <= 2)
         {
            outputText("湿润");
         }
         else if(get_player().wetness() <= 3)
         {
            outputText("湿透");
         }
         else if(get_player().wetness() <= 4)
         {
            outputText("又湿又滑");
         }
         else
         {
            outputText("湿得一塌糊涂");
         }
         outputText("。那道滑腻的缝隙正慢慢分开，而你伸手去抓住那根扭动的肉棒");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("，途中手还擦过了自己另一根");
            if(get_player().get_lust100() <= 70)
            {
               outputText("半硬的");
            }
            else
            {
               outputText("勃起的");
            }
            outputText("阴茎");
            if(int(get_player().cocks.length) > 2)
            {
               outputText("es");
            }
            outputText("在路上");
         }
         outputText("。你大声呻吟，竭力承受这股异样感官的洪流，可握在手里的那条激起快感的卷须，感觉和人类阴茎完全不同。你几乎像是被迫要把它挺进某个孔里，随便哪个都行，只要那里温暖又紧致。[pg]");
         if(_loc2_ >= 0)
         {
            outputText("它在你与它较劲时缠上你的" + get_player().cockDescript(_loc2_) + "，用紧密的螺旋勒住另一根阳物，带来挤压般、花瓣般的摩擦。");
         }
         outputText("[pg]");
         get_images().showImage("masti-tentacle-vag");
         outputText("你弓起背脊，试图压下突然涌入下身的一波波欲望，可这根本没用。短短几秒内，你就认定自己现在非得操点什么不可。前戏已经不在选项里了。");
         if(get_player().balls > 0)
         {
            outputText("你把你的[balls]挪到一边，然后");
         }
         else
         {
            outputText("你");
         }
         outputText("把手腕向下拧去。改变方向比试着撸动它要容易得多。你松开那些本能绷住的异样肌肉，任由你的" + get_player().cockDescript(_loc1_) + "去做它生来该做的事。它蜿蜒着向下滑去，紫色的龟头又沉又烫，抵在你湿润的肉丘上，力道刚好让你忍不住反压回去。它缓缓撑开你紧裹的甬道，一点点将它那淫猥的粗度挤进去。");
         get_player().cuntChange(get_player().cockArea(_loc1_),true,true,false);
         outputText("[pg]当你的" + get_player().cockDescript(_loc1_) + "尽可能深地埋进你天鹅绒般的甬道时，阵阵愉悦的涟漪沿着它扩散开来。粗大的紫色龟头一路撑开你，尺度恰到好处，让后面的茎身也舒舒服服地嵌进小穴里。你拽着露在外面的部分，发现自己正狂乱地抽动着自己的那根，一边挤压它，一边被阵发的狂喜夺走了精细控制肌肉的能力。被操与狠狠抽插的双重感觉在你体内重叠，纠缠成一团乱结。");
         if(_loc2_ >= 0)
         {
            outputText("你的" + get_player().cockDescript(_loc2_) + "正被那根胀大的阴茎卷须的动作套弄着，乳白色的前液缓缓漏出，洒在不断抽动的茎身上。");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("没过多久，第二条卷须也领会了意思，伸长着探向你空着的肛门。它侵犯你的[asshole]前，你还象征性地抵抗了一瞬，但随后剩下的就只有火热滚烫的肛交了。");
               get_player().buttChange(get_player().cockArea(_loc2_),true,true,false);
            }
         }
         outputText("[pg]你兴奋得神志恍惚，一把抓住自己的[chest]");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，揉捏着柔软的乳房");
         }
         outputText("，在快感把你的身体烧得白热时拧弄你的[nipple]");
         if(get_player().hasFuckableNipples())
         {
            outputText("，甚至还把一根手指塞进那湿滑滴液的乳首小穴里");
         }
         outputText("。");
         if(get_player().lactationQ() >= 250)
         {
            outputText("乳汁几乎立刻从你肿胀的奶头喷射出来，化作潮湿乳白的雨点洒落在你扭动的身躯上。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            outputText("你张成“O”形的嘴里一直发出的欢愉声，被你另一根树状阳物的突然侵入截断了。这一根毫不停顿地直捣你的喉咙，顺滑地滑过你的舌头，好受得让你几乎不在乎自己在干呕。你香甜的前液正从[eachCock]滴滴答答地流进你的孔穴");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) < int(get_player().cocks.length))
            {
               outputText("以及露在外面的空气中");
            }
            outputText("。");
            if(get_player().biggestTitSize() >= 4)
            {
               outputText("它正躺在你的双乳之间，没多久茎身就伸长到足以分别缠住两只乳房，慢慢环绕着每一团弧度柔软的乳肉，把它们夹向自己；它一边在你毫不抵抗的嘴里抽插，一边享受着乳交。");
            }
         }
         else
         {
            outputText("从你张成“O”形的嘴唇间漏出的愉悦声一秒比一秒尖细。有那么一瞬间，你甚至希望自己能再多一根触手，这样就能一边操自己，一边含着它吮吸了。");
            if(_loc2_ >= 0 && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE && get_player().cocks[_loc2_].cockLength >= 20)
            {
               outputText("幸运的是，你下面大得惊人，一颗多汁的龟头正好就在够得着的地方。你想也不想便弯下身去含住它，放纵地忙着自我口交。");
            }
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 6)
         {
            outputText("[pg]多余的绿色家伙们在你上方抬起。它们像是粗糙地模仿着有意识的观察者，审视着眼前的景象，仿佛在欣赏你热切自慰时那不断变动、扭动的画面。事实上，你只是在想该把它们插到哪里去。几滴欲液从它们的尖端渗出，像是也被这快感牵动，这让你想到该怎么处置它们。它们朝你的躯干伸去，却在最后一刻转向两侧。脉动的植物阴茎把液体滴到你的肩上，随后缓缓挤进你的腋下，用那充满情欲的液体润滑你的[skinfurscales]。");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 7)
            {
               outputText("它们全都挤在那里，彼此之间和你一样剧烈蠕动，在你被汗水打湿的肌肤上相互摩擦。");
            }
            outputText("你正在操自己的腋下，而那感觉简直妙不可言，舒服得没过多久，你的腋窝就变成了一片湿漉漉的性爱泥沼。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
         {
            outputText("[pg]最后一根绿色家伙在你上方抬起。它像是粗糙地模仿着有意识的观察者，审视着眼前的景象，仿佛在欣赏你热切自慰时那不断变动、扭动的画面。事实上，你只是在想该把它插到哪里去。一滴欲液从尖端渗出，像是也被这快感牵动，这让你想到该怎么处置它。它朝你的躯干伸去，却在最后一刻偏向左侧。脉动的植物阴茎把液体滴到你的肩上，随后缓缓挤进你的腋下，用那充满情欲的液体润滑你的[skinfurscales]。你正在操自己的腋下，而那感觉简直妙不可言，舒服得你很快就把腋窝弄得湿滑一片，又把这根多余的肉棒绕过自己，好让它能同时从两侧双重抽插。");
         }
         outputText("[pg]熟悉的刺颤从你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸");
         }
         else
         {
            outputText("腹股沟");
         }
         outputText("深处开始泛起。高潮正迅速逼近，而你这疯狂的植物躯体此刻已经完全停不下来了。你");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            outputText("咕噜作响");
         }
         else
         {
            outputText("呻吟");
         }
         outputText("着，体内的肌肉开始紧紧收缩，压力一路堆积到硬胀而悸动的顶点。然后，当你");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            outputText("的众多阴茎");
         }
         outputText("深深顶进自己体内时，一座快感的火山轰然喷发，将浓稠的白色黏液直直泵进你的小穴");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2)
         {
            outputText("和肛门");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 2)
         {
            outputText("、肛门和嘴巴");
         }
         outputText("。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            outputText("你尽可能把那股咸涩的液体吞咽下去");
            if(get_player().cumQ() >= 500)
            {
               outputText("。但你的精液量实在太大，这点努力根本算不上什么，");
               if(get_player().cumQ() < 1000)
               {
                  outputText("每一次喷射都撑得你的脸颊鼓起来");
               }
               else
               {
                  outputText("精液很快就从你的嘴角喷溢出来，你的脸颊也像卡通里一样夸张地鼓起");
               }
            }
            outputText("。");
         }
         outputText("你的产道很快被白浊的精液灌满");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 2)
         {
            outputText("，而你的[ass]内部也被涂成一片亮白");
         }
         outputText("。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2)
         {
            outputText("你那无人理会的" + get_player().cockDescript(_loc2_) + "开始射精，精液喷洒在你身上");
            if(get_player().cumQ() < 50)
            {
               outputText("，一小股一小股地");
            }
            else if(get_player().cumQ() < 200)
            {
               outputText("，拉成一条条浓稠的白线");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("，大团大团地");
            }
            else
            {
               outputText("，就像精力旺盛的洒水器一样");
            }
            outputText("。");
            if(int(get_player().cocks.length) > 2)
            {
               outputText("另外");
               if(int(get_player().cocks.length) > 3)
               {
                  outputText("几根的射量也不输它");
               }
               else
               {
                  outputText("一根的射量也不输它");
               }
               outputText("，尽管你根本没做什么来刺激");
               if(int(get_player().cocks.length) == 3)
               {
                  outputText("它");
               }
               else
               {
                  outputText("它们");
               }
               outputText("。你那些能灵活卷动的阴茎传来的快感实在太过强烈，简直像是一场全身性的高潮。");
            }
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
         {
            outputText("与此同时，紫色的龟头");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 4)
            {
               outputText("胀大起来");
            }
            else
            {
               outputText("胀大起来");
            }
            outputText("在你的腋下");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 5)
            {
               outputText("");
            }
            outputText("，并猛然充血胀大，紧紧顶进那片柔软凹陷的肉里，精液化作带着压力的水柱喷射而出，把你的手臂浸得湿透。");
         }
         outputText("[pg]顿时，你全身无力地向后瘫倒，疲惫得像被抽空了一样。拉长的触手");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            outputText("收缩");
         }
         else
         {
            outputText("收缩");
         }
         outputText("回到");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
         {
            outputText("它的");
         }
         else
         {
            outputText("它们的");
         }
         outputText("正常长度，并从你的阴道");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2)
         {
            outputText("和肛门");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 2)
         {
            outputText("、肛门和嘴巴");
         }
         outputText("里弹出，让你的孔穴");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            outputText("");
         }
         outputText("把射尽后的精液滴落在地上。该死，真是爽透了。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1 * (1 + get_player().countCocksOfType(CockTypesEnum.TENTACLE))));
         get_player().knockUp(39,120);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tentacleGoesUpYerPooperNewsAtEleven() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < int(get_player().cocks.length))
         {
            if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               break;
            }
            _loc1_++;
         }
         var _loc2_:int = _loc1_ + 1;
         while(_loc2_ < int(get_player().cocks.length))
         {
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE && get_player().cocks[_loc2_].cArea() > get_player().cocks[_loc1_].cArea())
            {
               _loc1_ = _loc2_;
            }
            _loc2_++;
         }
         clearOutput();
         doStripCheck();
         get_images().showImage("masti-tentacle-butt");
         outputText("你急切地露出自己的植物肉棒，它自行蠕动扭摆，在它绿色的表面各处轻轻摩挲；随着你的挑逗，它的色泽也不断变化。把你的触手肉棒玩弄了一会儿后，你决定进入正题；你运用新获得的阴茎肌肉，熟练地引导那根不断扭动的" + get_player().cockDescript(_loc1_) + "绕到身后，对准自己的臀部。你用顶端在你的[butt]上摩擦，前液从蘑菇般的龟头流出，抹在你的[skinfurscales]上。你把自己的精液当作天然润滑剂，将" + get_player().cockDescript(_loc1_) + "的顶端抵在自己的后门前，一点点撑开肛门，小心不撕伤自己的内里。这样持续了一会儿，直到你突然失去所有耐心，粗暴地把自己的" + get_player().cockDescript(_loc1_) + "全力塞进结肠里。");
         get_player().buttChange(get_player().cockArea(_loc1_),true,true,false);
         outputText("[pg]这番鲁莽的举动让你在快感与疼痛交织中叫出声来，你的[asshole]被强烈的感官刺激彻底淹没。好在你的" + get_player().cockDescript(_loc1_) + "质地柔嫩而富有弹性，带来更敏锐的触感，那细微的摩擦让酥麻从你的胯下一路窜上脊背。你因这股施加在自己身上的原始快感而颤抖不已。你的" + get_player().cockDescript(_loc1_) + "继续在你的体内蠕动摩擦，让你像娼妓一样发颤、娇笑，直到它一路深入你的结肠，并调整到一个更舒服的位置。随后，你开始凶狠地操弄自己的[asshole]，每一次挺进都把它撑得更开一些。");
         outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "在被蹂躏得不成样子的体内扭动摩擦，再加上你粗暴地给自己手交，这些叠加在一起的刺激最终让你发情的身体难以承受，[eachCock]释放出巨量精液，把性液喷得到处都是，既灌满了体内，也溅到体外。精液从你体内涌出时，压力在你的肛门里（以及你的手中）不断积聚");
         if(get_player().cumQ() >= 1000)
         {
            outputText("，让[eachCock]鼓胀起来。这额外的感觉将你彻底推过临界点，你很快迎来高潮，射了一波又一波");
         }
         outputText("。");
         if(get_player().cumQ() >= 500)
         {
            outputText("你的肚子被灌进去的精液撑得微微鼓起。");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("你可怜的内里承受不住倾泻进你[asshole]里的巨量精液，有相当一部分白浆溢了出来，随意地弄脏了地板。");
         }
         outputText("你呻吟一声，懒懒地把你的" + get_player().cockDescript(_loc1_) + "从肛门里拔出来，任由快感带来的困意将你吞没。");
         if(int(get_player().cocks.length) > 0)
         {
            if(int(get_player().cocks.length) == 1)
            {
               if(get_player().get_lib100() < 30)
               {
                  outputText("你筋疲力尽，很快就睡着了。");
               }
               else if(get_player().get_lib100() < 55)
               {
                  outputText("你翻了个身，开始打起盹，半勃起的" + get_player().cockDescript() + "在身上晃荡。");
               }
               else if(get_player().get_lib100() <= 80)
               {
                  outputText("当你闭上眼放松下来，你的" + get_player().cockDescript() + "又重新硬了起来，确保");
                  if(get_player().cor < 50)
                  {
                     outputText("你的梦里满是性爱。");
                  }
                  else
                  {
                     outputText("你沉入一场堕落而变态的淫梦。");
                  }
               }
               else
               {
                  outputText("你呻吟着渐渐睡去，坚挺的" + get_player().cockDescript() + "因持续不断的欲望而一阵阵搏动、抽跳。");
               }
            }
            if(int(get_player().cocks.length) > 1)
            {
               if(get_player().get_lib100() < 30)
               {
                  outputText("你筋疲力尽，很快就睡着了。");
               }
               else if(get_player().get_lib100() < 55)
               {
                  outputText("你翻了个身，开始打一个小时的盹，半勃起的几根鸡巴在身上晃荡。");
               }
               else if(get_player().get_lib100() <= 80)
               {
                  outputText("当你闭上眼放松下来，你的几根鸡巴又重新硬了起来，确保");
                  if(get_player().cor < 50)
                  {
                     outputText("你的梦里满是性爱。");
                  }
                  else
                  {
                     outputText("你沉入一场堕落而变态的淫梦。");
                  }
               }
               else
               {
                  outputText("你呻吟着陷入短暂的小睡，一根根坚挺勃起的鸡巴因持续不断的欲望而一阵阵搏动、抽跳。");
               }
            }
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stimBeltUse() : void
      {
         clearOutput();
         if(get_player().hasKeyItem("Self-Stimulation Belt"))
         {
            get_images().showImage("masti-stimBelt");
            if(!get_player().hasStatusEffect(StatusEffects.used_self_dash_stim))
            {
               get_player().createStatusEffect(StatusEffects.used_self_dash_stim,0,0,0,0);
               outputText("满怀期待地，你给那台怪异装置上的小齿轮箱上好了发条。你把机器放下，脱光衣服。双腿穿过那件带子的套环后，你把它拉了上来。假阳具并没有伸出来，于是你花了点时间，把这根人造阳具慢慢送进自己的小穴深处。等假鸡巴在你穴里安顿好后，你把腰带彻底拉好，并收紧了带子。你躺下来，拨动开关。机器在你身上和体内剧烈震动起来。几乎立刻，一波波快感和抽搐就在你的阴户周围旋转，并沿着脊背上下窜动。机器不受人类的极限与疲劳所限，以不可思议的高速不停摩擦、爱抚着你的内壁。几分钟内，你便开始感受到高潮将至时那标志性的收缩。双手空出来后，你可以在装置不断冲撞的同时抚摸自己的乳房和身体。你揉捏着自己的");
               outputText(get_player().breastCup(0));
               outputText("罩杯乳房，身体在一阵阵连续高潮中痉挛。你珍惜着每一刻，沉溺于灼烧全身的欢愉刺痛之中。最终，腰带的动作越来越慢，直到停下，你的乐趣也随之结束。你意识到齿轮的发条已经走完，若想继续享受，就得重新给盒子上弦。你决定不要让自己太过吃不消，于是小心地取下玩具，把它留到下次再用。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Sens(-1));
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("释放的渴望让你笨手笨脚地摆弄起那台机械装置。你穿上自慰腰带时，不小心把用来给齿轮箱上弦的钥匙掉在了地上。你沮丧地咒骂着，别扭地四处摸索钥匙。像这样在地上乱扒拉的模样若是被旁人看见，肯定会让他们笑个不停；折腾了片刻后，你总算找到了钥匙，并给主发条上好了弦。[pg]");
               outputText("打开腰带的开关后，它立刻开始震动，并摩擦你[vagina]上每一处敏感的地方。机器在你饥渴的小穴上施展着它的魔力，你顿时被快感点燃。担心机器停下，你时不时重新给齿轮箱上弦，确保这台不知疲倦的装置能在你承受得住的时间里尽情折腾你。[pg]");
               outputText("最终，机器恰到好处地撩拨着你的神经和[clit]，引爆了一场猛烈的高潮，让你像未驯服的野马一样疯狂挺动，在令人头脑发麻的快感中尖叫。你无法控制的动作把钥匙从齿轮箱上震脱了下来，而你别无选择，只能等机器和仍在高潮中的身体一同慢慢停歇，然后再去找那该死的玩意儿。大约十五分钟后，机器耗尽了最后一点能量，把你留成一团抽搐的烂泥，直到你能动弹去找那把烦人的钥匙为止。[pg]");
               outputText("幸运的是，你在脚边找到了钥匙，省下了再为这装置配一把的花费。欲火暂时得到满足后，你把机器收到一边。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Sens(-1));
               doNext(get_camp().returnToCampUseOneHour);
            }
            updateMasturbation();
            get_player().cuntChange(1,true,true,false);
         }
      }
      
      public function stickADildoInYourVagooSlut() : void
      {
         clearOutput();
         if(get_player().hasVirginVagina())
         {
            if(get_player().cor <= 50)
            {
               outputText("你紧张地红着脸，握住自己的阳具形玩具。坚挺的假阳具在你手中微微弯曲。想到要做这种事，你觉得自己有些变态，双手发抖地解开了[armor]的下摆。");
               outputText("[pg]你坐在自己的[butt]上，开始用那根细长管状玩具摩擦你的[vagina]。轻柔的刺激让你的神经平静下来，也帮助你放松紧绷的身体。随着速度加快，呻吟开始从你唇间漏出。假鸡巴滑过你的[clit]时，你的[clit]充血并微微抽动。你用另一只手温柔地抚摸自己的[chest]，呼吸也随之变得更加急促。");
               if(get_player().wetness() <= 2)
               {
                  outputText("随着你的淫液覆上玩具，它滑动得更加顺畅。[pg]");
               }
               else
               {
                  outputText("多亏你丰沛得近乎不像人类的润滑，玩具毫不费力地滑动着。[pg]");
               }
               get_images().showImage("masti-dildo-vag");
               outputText("你咽了口唾沫，向后靠去，将假阳具对准自己的[vagina]，入口渴望着被插入而微微抽动。你试探性地往前一推，顶了顶那个洞口，这才惊觉这东西到底有多大。它可远不像手指那样又细、又短、又能弯。你思索着自己为什么要做这种事——也许是因为你的处女身太珍贵，不能冒险让恶魔夺走；又或许你只是在这个腐化的世界里变得更加淫荡了。不管怎样，你咬住嘴唇，把玩具压进体内。决定已经做下，处女膜被撕裂的痛楚顿时贯穿全身。你倒吸一口气，放松了对玩具的压力，让它又沉入一英寸后，便彻底松开了手。");
               get_player().cuntChange(8,true,true,false);
               outputText("[pg]你喘着粗气，慢慢将那根侵入你身体的假阳具从刺痛的小穴里拔出。假阳具前端几英寸已经染上了一层淡淡的血迹。你深吸一口气，再次把玩具推回去，这一次疼痛减轻了许多。最糟糕的部分已经过去，你开始轻柔地抽插。你那曾经纯洁的小穴，如今正深深接纳着这个入侵者。随着你逐渐适应，速度也开始加快。你在呻吟间呼吸愈发沉重，将这根破处棒推向未知的极乐。眼中因疼痛积起的泪水，此刻又因快感涌得更多。你一只手让仿制阴茎在[vagina]里活塞般进出，另一只手则按摩着[clit]周围，刺激几乎变得难以承受。即使刚破处的余痛仍在，你也忍不住扭动[hips]，慢慢滑倒在地，准备迎接自己的第一次插入式高潮。你的呻吟变得更响、更激烈，阴液顺着臀瓣滴落。伴随着最后一声尖叫般的呻吟，你抬起大腿，把假阳具尽可能深地捅入体内，将自己推过了高潮的边缘。");
               outputText("[pg]你让[butt]重新落回地面，双臂无力地垂在身侧。过了好几分钟，等呼吸终于平复下来后，你带着如释重负又满足的叹息，将玩具从体内拔出。这场体验相当耗费体力；你决定在清洗之前再多休息一会儿。");
            }
            else
            {
               outputText("[pg]你带着淫荡的羞红，握住自己的阳具形玩具。坚挺的假阳具在你手中微微弯曲。脱下[armor]时，一阵小小的雀跃感掠过你的身体。");
               outputText("[pg]你赤裸着轻快地来到一处舒服的位置，坐在自己的[butt]上，把玩具鸡巴放到一旁，迫不及待地准备起你的[vagina]。你轻轻揉弄阴唇，放松阴道肌肉。不想让嘴也错过这份乐趣，你抓起这根假阳具，开始舔舐并吮吸它。这个动作中的热情催促着你继续，你将一根手指推入自己的[vagina]。小穴紧紧夹住你的手指，清楚地暴露出它的生涩——而这个问题你很快就会解决。[pg]");
               get_images().showImage("masti-dildo-vag");
               outputText("你的假阳具已经被唾液弄得滑腻，于是你把手指从还未经人事的深处抽出。你将顶端抵在入口处，细细品味最后的处女时光。你可怜的处女膜不过是鸡巴面前的一道障碍，而真正配得上夺走你处女身的人只有你自己。你把这个催动欲望的东西推入体内。痛楚猛然贯穿全身，逼得你倒吸一口气，却没能阻止你心爱的破处棒继续前进。等你终于推进到所能达到的最深处时，你松开假阳具，深深呼吸，等待疼痛过去。");
               get_player().cuntChange(8,true,true,false);
               outputText("[pg]还没得到满足的你重新稳住心神，开始抽插自己刚被采摘的花蕾。另一只手急切地揉弄、爱抚敏感的[chest]。一想到将来会有各种怪物巨根插进你体内，你就被这幻想催促着做出粗暴的活塞运动，迫不及待地训练你的[vagina]去完成它命定的任务。你顺势躺倒在地，身体彻底沉溺于快感，呻吟和呜咽不断从口中溢出。刺激不断累积，又因经验不足带来的轻微疼痛而更加强烈。没过几分钟，你便浑身绷紧，在狂喜中尖叫起来。体液从你的[vagina]喷涌而出，你欣喜地笑了。高潮过去后，你把那根被充分使用过的玩具从新近调教好的荡妇小穴里拔出。你把假阳具送到唇边，亲昵地吻了吻它，并舔去表面上的处女血。");
               outputText("[pg]在余韵中沉浸片刻后，你清理好自己，重新穿上衣物。");
            }
         }
         else
         {
            outputText("你脱下[armor]，在离营地不远的一块岩石后坐下，并确保把玩具也带在身边。[pg]");
            get_images().showImage("masti-dildo-vag");
            outputText("你张开[legs]，用两根手指在阴唇间摩挲，同时含住那根尺寸可观的假阳具吮吸，为它润滑。片刻之间，你的[vagina]就被淫液沾湿，你迫不及待地将一根手指探入那饥渴的小穴。手指缓慢而深入地滑进去，以温柔的刺激取悦着你的内壁。你的肌肉开始放松，感觉已经准备好进入正题。你把沾满唾液的玩具从嘴里拿出来，用它替换了手指。假阳具顺畅地没入下体的满足感，与舌尖上蔓延的女性滋味一同袭来。被堵住的嘴里泄出含糊的呻吟，那心爱的玩具深深沉入你的[vagina]。你用空着的手揉捏、爱抚自己的[chest]。");
            get_player().cuntChange(8,true,true,false);
            outputText("[pg]那根阳具状物开始加快色情的抽插节奏，你也随着心跳和小穴内壁的收缩，温柔地建立起韵律。你的呼吸变得急促，呻吟几乎和欲望一样饥渴。很快，快感化作一股无法阻挡的浪潮，将你推向由阳具带来的狂喜。你从岩石边滑倒侧躺在地，却仍然满怀愉悦地操弄着自己。玩具持续不断的抽插让你开始颤抖、节奏紊乱，身体只想尽可能又快又狠地被干。");
            outputText("[pg]你将假阳具强行顶入最深处，高潮也在极大的释放感中降临。淫液从你的性器喷溅而出，你翻身仰躺下来休息。等呼吸平稳后，你把那根被彻底用过的玩具从[vagina]里拔出，准备回到营地。");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1.5));
         statScreenRefresh();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function setMasturbateButton(param1:Boolean = false, param2:int = 8) : void
      {
         var description:String;
         var _g:Masturbation;
         var _loc3_:* = null as Function;
         if(paladinCheck())
         {
            if(get_player().get_lust() == get_player().maxLust())
            {
               addButton(param2,"鞭笞",flagellate).hint("通过伤害自己来摆脱罪恶的念头。");
            }
            else
            {
               addButtonDisabled(param2,canMeditate() ? "冥想" : "自慰","没时间" + (canMeditate() ? "冥想" : "自慰") + "！快去杀恶魔！");
            }
         }
         else if(canMeditate())
         {
            if(param1)
            {
               _g = this;
               description = "place";
               _loc3_ = function():void
               {
                  _g.meditate(description);
               };
            }
            else
            {
               _loc3_ = masturbateMenu;
            }
            addButton(param2,"冥想",_loc3_).hint("通过冥想来降低欲望与腐化。").disableIf(get_player().get_lust() < 30,"你现在不需要这个。");
         }
         else
         {
            addButton(param2,"自慰",param1 ? masturbateGo : masturbateMenu).hint("释放你积累的性欲。").disableIf(get_player().get_lust() < 30,"你的欲望尚不足够。");
         }
      }
      
      public function religionCheck() : Boolean
      {
         if(get_player().isReligious())
         {
            return get_player().isPureEnough(66);
         }
         return false;
      }
      
      public function paladinCheck() : Boolean
      {
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            return get_player().isPureEnough(25);
         }
         return false;
      }
      
      public function orgazmo(param1:Boolean, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         outputText("[pg]");
         var _loc3_:int = 0;
         if(int(get_player().cocks.length) > 0)
         {
            _loc3_ = 1;
            if(int(get_player().cocks.length) == 1)
            {
               outputText("这些感觉让你难以承受，你感到一股紧绷感正在你的");
               if(get_player().countCocksOfType(CockTypesEnum.HUMAN) == 1)
               {
                  outputText("抽动的阳具中迅速积聚。你疯狂地套弄着，感受着精液即将喷发时带来的压力。");
               }
               else if(get_player().hasKnot())
               {
                  outputText("肿胀、球状的肉结中积聚。你感觉它变得越来越紧，直到几乎有你的" + get_player().cockDescript() + "两倍宽。那股压力带来令人煎熬的快感，随着你越来越接近高潮，只会越攀越高。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) == 1)
               {
                  outputText("肿胀的马类鞘囊中积聚，慢慢开始沿着你的阴茎往上推进。前列腺液开始从你的" + get_player().cockDescript() + "中不断涌出，将你的" + get_player().cockDescript() + "弄得湿滑，让你做好喷发的准备。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
               {
                  outputText("藤蔓般扭动的阴茎中迅速积聚。你感觉触手肉棒那橡胶般的表面在即将喷发时不断收缩。浓稠的液泡聚集起来，沿着你的" + get_player().cockDescript() + "一路移动，其中最前面的一股几乎已经到了你过大的顶端。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DEMON) == 1)
               {
                  outputText("受污的男根中迅速积聚。你感觉靠近根部的瘤节肿胀搏动，掀起一波波快感向上涌去。你龟头冠周围那一圈肉凸膨胀到原来的两倍，随着你的" + get_player().cockDescript() + "准备喷射而向外鼓起。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.CAT) == 1)
               {
                  outputText("饱满的猫科鞘囊中积聚。你感觉它一阵阵发麻跳动，那些倒刺也因兴奋而脉动。你感觉底部的倒钩正在变粗，一团团液体沿着你的" + get_player().cockDescript() + "向顶端涌去。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == 1)
               {
                  outputText("肿胀的阴茎中积聚。你能感觉到它诡异地发麻鼓胀，开始收缩并跳动。前列腺液从你的" + get_player().cockDescript() + "中稳定地流出，每一个“球泡”几乎都膨胀到原来的两倍，随后又一个接一个瘪下去，同时你的尿道也大大张开。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) == 1)
               {
                  outputText("根部。环绕着你的" + get_player().cockDescript() + "的触手全都发了疯，紧紧缠住它，在榨出一场强烈得让你臀部抽动的高潮时，还不经意地把催情物质射进那正在高潮的肉体里。");
               }
               else
               {
                  outputText("抽动的阳具中迅速积聚。你疯狂地套弄着，感受着精液即将喷发时带来的压力。");
               }
               outputText("当精液从你的" + get_player().cockDescript() + "中喷发出来时，令人愉悦的痉挛淹没了你");
               outputText("。你的臀部随着喷发在空中抽动，将精液喷");
               if(param1)
               {
                  outputText("进你渴求的嘴里。");
               }
               if(param2)
               {
                  outputText("进你异常乳房的深处。");
               }
               else if(!param1)
               {
                  outputText("到空中。");
               }
               if(param1)
               {
                  if(get_player().cumQ() < 25)
                  {
                     outputText("当精液从你的胯下迸发出来时，你设法吞下了大部分；高潮的快感驱使你近乎强迫地吞咽着。");
                  }
                  else if(get_player().cumQ() < 250)
                  {
                     outputText("你的高潮猛烈到让你应接不暇，精液把你的嘴塞得满满当当；你一边吞咽，一边又让它从嘴角淌出，甚至呛得从口中喷出些许精液。");
                  }
                  else if(get_player().cumQ() < 500)
                  {
                     outputText("一波又一波的精液从你的" + get_player().cockDescript() + "喷进嘴里。你尽力吞咽，却实在太多了。随着高潮久久不退，精液沿着你的阴茎流下，在你身上积成一滩。");
                  }
                  else
                  {
                     outputText("你的高潮仿佛永无止境，整个世界都融化在你的" + get_player().cockDescript() + "带来的感觉中；它一股又一股地把精液喷进你嘴里。你几乎被呛住，满溢的精液如河流般喷涌而出，在你周围积成一滩。");
                  }
                  if(get_player().cumQ() < 1000)
                  {
                     get_player().refillHunger(get_player().cumQ() / 20);
                  }
                  else if(get_player().cumQ() < 3000)
                  {
                     get_player().refillHunger(50 + (get_player().cumQ() - 1000) / 40);
                  }
                  else
                  {
                     get_player().refillHunger(100);
                  }
               }
               else if(param2)
               {
                  if(get_player().cumQ() < 25)
                  {
                     outputText("你感觉到数股浓稠的精液溅在你的乳房内侧。");
                  }
                  else if(get_player().cumQ() < 250)
                  {
                     outputText("随着一股又一股黏稠的精液把你被折腾的乳房灌到溢出，精液沿着你的阴茎缓缓淌下。");
                  }
                  else if(get_player().cumQ() < 500)
                  {
                     outputText("一波又一波的精液溅入你的乳房深处，让它因压力而鼓胀起来。随着高潮久久不退，精液如洪流般沿着你的阴茎淌下，在你身上积成一滩。");
                  }
                  else
                  {
                     outputText("你的高潮仿佛永无止境，整个世界都融化在你的" + get_player().cockDescript() + "带来的感觉中；它一股又一股地把精液喷进你被折腾的乳房里。伴随一声“噗”，你的阴茎被内部的压力挤了出来。它仍在四处喷射精液，而一股精液则从你扩张的乳头中倾泻而出，在你周围积成一滩。");
                  }
               }
               else if(get_player().cumQ() < 25)
               {
                  outputText("几股浓稠的精液从你的胯下迸发出来，肆意溅满你全身。");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("高潮久久不退，一股又一股的精液覆满你的身体。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你的身体剧烈痉挛，每一次喷射都让你比上一次抽搐得更厉害。一股又一股精液飞落如雨。");
               }
               else
               {
                  outputText("高潮仿佛永无止境，你的世界只剩下每一股精液从阴茎喷发而出的感觉。你的意识隐约感知到每一次喷发溅落在身上的触感，但这只会让快感更加强烈。");
               }
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你的精液被黏糊糊的包覆物吸收了。");
               }
            }
            if(int(get_player().cocks.length) > 1)
            {
               outputText("这些刺激对你来说太过强烈，你感觉到胯下的紧绷感正在积聚。");
               if(get_player().countKnottedCocks() > get_player().countCocksOfType(CockTypesEnum.HUMAN) && get_player().countKnottedCocks() > get_player().countCocksOfType(CockTypesEnum.HORSE))
               {
                  _loc4_ = 0;
                  while(_loc4_ < int(get_player().cocks.length))
                  {
                     if(get_player().cocks[_loc4_].hasKnot())
                     {
                        break;
                     }
                     _loc4_++;
                  }
                  outputText("你感觉自己的肉结鼓起肿胀，越来越紧，直到它们几乎有一根" + get_player().cockDescript(_loc4_) + "的两倍宽。随着你离高潮越来越近，那令人痛苦的压力每一秒都变得更强、更紧绷。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) > get_player().countCocksOfType(CockTypesEnum.HUMAN))
               {
                  _loc4_ = 0;
                  while(_loc4_ < int(get_player().cocks.length))
                  {
                     if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.HORSE)
                     {
                        break;
                     }
                     _loc4_++;
                  }
                  outputText("你感到肉鞘里一阵阵搏动，慢慢沿着你的" + get_player().cockDescript(_loc4_) + "们向上蔓延。前列腺液从你的" + get_player().cockDescript(_loc4_) + "们里涌出，把那些晃动的马般肉棒润得滑腻，仿佛随时都要喷发。");
               }
               else
               {
                  outputText("你的阳具们一阵抽动，涨到了最大。你急切地套弄着它们，感受着精液即将喷发前不断积聚的压力。");
               }
               if(param2)
               {
                  if(get_player().cumQ() < 25)
                  {
                     outputText("你感到好几股浓稠的精液溅进自己的乳房里。高潮中你挺腰抽动，肉棒开始从被折腾得不成样子的双乳间弹出来。");
                  }
                  else if(get_player().cumQ() < 250)
                  {
                     outputText("精液顺着你的肉棒淌下，被折腾得不成样子的双乳被一股接一股黏稠的精液灌满，直到溢出。高潮中你挺腰抽动，肉棒开始从被折腾得不成样子的双乳间弹出来。");
                  }
                  else if(get_player().cumQ() < 500)
                  {
                     outputText("一波又一波精液溅入你乳房深处，让它们因压力而鼓胀。大量精液沿着你的肉棒流下，在你身旁积成一滩。高潮中你挺腰抽动，肉棒开始从被折腾得不成样子的双乳间弹出来。");
                  }
                  else
                  {
                     outputText("伴随着爆发般的释放，你终于射了出来。高潮仿佛永无止境，世界只剩下你的[cocks]带来的感觉，它们一股接一股地把精液喷进你被折腾得不成样子的双乳里。随着一连串湿漉漉的“啵”声，肉棒被内部的压力挤了出来。它们依旧四处喷洒精液，而成股的精液也从你扩张的乳头里涌出，在你周围积成一滩。");
                  }
               }
               outputText("快感淹没了你脆弱的理智，精液从你的[cocks]中喷涌而出。你的胯部随着每一次喷发在空中抽动，精液四处飞溅，让你的身体活像一只变态的洒水器。");
               if(param1)
               {
                  if(get_player().cumQ() < 25)
                  {
                     outputText("精液从你胯间喷出时，你设法吞下了大部分；高潮的快感驱使着你，几乎是本能地不停吞咽。");
                  }
                  else if(get_player().cumQ() < 250)
                  {
                     outputText("高潮强烈到你根本来不及应付，精液把你的嘴塞得满满当当，你一边吞咽一边漏得满嘴都是，甚至从口中喷了出来。其余的那些“家伙”也把精液溅到你身上，把你弄成一团黏糊糊的狼狈模样。");
                  }
                  else if(get_player().cumQ() < 500)
                  {
                     outputText("一股又一股的精液从你的" + get_player().cockDescript() + "喷射到你的嘴里。你尽可能地吞咽，但对你来说太多了。随着高潮的持续，精液顺着你的" + get_player().cockDescript() + "流下，在你身上积聚。在整个过程中，精液从你其余的“装备”上如雨般洒落在你身上。");
                  }
                  else
                  {
                     outputText("高潮仿佛永无止境，世界只剩下你的" + get_player().cockDescript() + "带来的感觉，它一股接一股地把精液喷进你嘴里。你差点被呛住，满溢的精液像河一样喷涌而出，在你周围积成一滩。与此同时，你其他的“家伙”也不停把精液洒在你身上，让你浑身泡在精液里。");
                  }
                  if(get_player().cumQ() < 1000)
                  {
                     get_player().refillHunger(get_player().cumQ() / 20);
                  }
                  else if(get_player().cumQ() < 3000)
                  {
                     get_player().refillHunger(50 + (get_player().cumQ() - 1000) / 40);
                  }
                  else
                  {
                     get_player().refillHunger(100);
                  }
               }
               if(get_player().cumQ() < 25)
               {
                  outputText("几股浓稠的精液从你的肉棒里迸出，肆意溅满了你全身。");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("高潮持续不断，一股又一股精液从每根肉棒上喷出，把你裹得满身都是。");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("你的身体剧烈痉挛，每一次喷射都让你比上一次抽搐得更厉害。随着每根阳具的高潮开始重叠，一条又一条精液喷洒而下。你几乎在快感中昏厥过去。");
               }
               else
               {
                  outputText("高潮仿佛永无止境，你的世界几乎只剩下多根肉棒喷射精液的感觉。你的意识只能朦胧地感到每一次喷发都溅满自己，但这反而让快感更加强烈。");
               }
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            _loc3_ = 2;
            if(int(get_player().vaginas.length) == 1)
            {
               if(get_player().get_gender() == 3)
               {
                  outputText("你的雌");
               }
               else
               {
                  outputText("你的");
               }
               outputText("性器因压倒性的快感而颤抖，夺走了你对肌肉的控制，你的甬道在手指周围一阵阵起伏收缩。");
               if(get_player().getClitLength() >= 4.5)
               {
                  outputText("一只手摸上你那像肉棒一样的阴蒂，边揉捏边抚弄。撕扯小穴般的高潮震颤着你的全身，那根过大的快乐开关几乎让你被它带来的感觉冲得昏厥过去。");
               }
               else if(get_player().getClitLength() > 1.5)
               {
                  outputText("每一次肌肉抽搐都仿佛让你那又大又敏感的阴蒂被撑得更大，每一次碰撞与触碰都让你欢喜地尖叫出声。");
               }
               if(get_player().vaginas[0].vaginalWetness == 5)
               {
                  outputText("一股液体从你的下身喷涌而出，随着你的[vagina]一阵阵抽动而同步脉动。");
               }
            }
         }
         if(get_player().averageLactation() >= 2 || get_player().hasFuckableNipples())
         {
            _loc3_ = 3;
            titCum(get_player().cumQ());
            titDrink();
         }
         if(get_player().get_armor() == get_armors().GOOARMR)
         {
            _loc4_ = 0;
            if(get_player().hasVagina())
            {
               if(get_player().vaginas[0].vaginalWetness >= 3)
               {
                  _loc4_ += int(get_player().vaginas[0].vaginalWetness * 3);
               }
            }
            if(get_player().hasCock())
            {
               if(get_player().cumQ() < 100)
               {
                  _loc4_ += int(get_player().cumQ() / 5);
               }
               else if(get_player().cumQ() >= 100 && get_player().cumQ() < 500)
               {
                  _loc4_ += int(20 + get_player().cumQ() / 20);
               }
               else if(get_player().cumQ() >= 500 && get_player().cumQ() < 3500)
               {
                  _loc4_ += int(40 + get_player().cumQ() / 50);
               }
               else if(get_player().cumQ() >= 3500)
               {
                  _loc4_ += 100;
               }
            }
            _loc4_ += int(Math.sqrt(get_player().lactationQ()));
            get_game().valeria.feedValeria(_loc4_);
            if(_loc4_ > 0)
            {
               outputText("[pg][say:多谢你的体液！]瓦莱丽娅说道。");
            }
         }
         if(_loc3_ == 1)
         {
            get_player().orgasm("Dick");
         }
         else if(_loc3_ == 2)
         {
            get_player().orgasm("Vaginal");
         }
         else if(_loc3_ == 3)
         {
            get_player().orgasm("Tits");
         }
         updateMasturbation();
         dynStats(DynStat.Sens(-0.5));
      }
      
      public function onaholeUse() : void
      {
         clearOutput();
         get_images().showImage("masti-Onahole");
         if(!get_player().hasStatusEffect(StatusEffects.PlainOnaholeUsed))
         {
            get_player().createStatusEffect(StatusEffects.PlainOnaholeUsed,0,0,0,0);
            outputText("你脱光衣服，带着新玩具安顿下来。这个东西看起来并不怎么诱人，甚至有点滑稽。不过，在寻找新快感这件事上，你从来都不是什么会偷懒的人。");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("你用空着的那只手把自己的[cocks]拍到“立正”，然后将飞机杯慢慢套上你的肉棒。");
            }
            else
            {
               outputText("你用空着的那只手把自己的鸡巴拍到“立正”，然后将飞机杯慢慢套上你的肉棒。");
            }
            outputText("[pg]让你相当意外的是，贾科莫居然没提到这个丑陋的橡胶套内侧是贯通的，而且正紧紧包裹着你的肉棒，带来相当惊人的握感。你毫不犹豫地开始套弄自己的鸡巴，仿佛明天世界就要毁灭。一下又一下的抽动中，你逼迫自己的身体在巨大的高潮脉冲里被撕成两半。玩具内部，你的分身因快感而收紧、胀大，激出大量前列腺液涌进套管，让感觉变得更加鲜明。");
            outputText("[pg]你的身体很快回应了你的需求，把大量精液泵进玩具里。你细细品味每一次射出，享受着精液的热度在里面扩散开来、让你的阴茎变得更加温暖的感觉。");
         }
         else if(get_player().cor > 66)
         {
            onaholeRepeatUse(true);
         }
         else
         {
            onaholeRepeatUse(false);
         }
         dynStats(DynStat.Sens(-0.75));
         onaholeContinuation();
      }
      
      public function onaholeRepeatUse(param1:Boolean) : void
      {
         var _loc3_:* = null as IMap;
         var _loc4_:* = null as Player;
         var _loc2_:int = 0;
         if(get_player().countCockSocks("gilded") > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,899) < get_player().countCockSocks("gilded"))
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,899,FlagDict_Impl_.arrayReadInt(_loc3_,899) + 1);
            _loc2_ = midasCockJackingGemsRoll();
            _loc4_ = get_player();
            _loc4_.set_gems(_loc4_.get_gems() + _loc2_);
         }
         if(param1)
         {
            outputText("胯下的酸胀让你又觉得好笑又有些烦躁，于是你拿出那只用得很顺手的飞机杯，准备给自己来一场老派又痛快的榨精。你目标明确地将玩具套上你的" + get_player().cockDescript() + "，随即猛烈抽送起来，仿佛整个世界都仰赖着你的高潮。你的拳头快得只剩下一片残影，玩具将你的" + get_player().cockDescript() + "撸弄到近乎失控的地步。随着精液不断积聚，每一阵快感的抽搐都令你沉醉其中；你绷紧锻炼有素的骨盆肌肉，既让快感更加强烈，也防止这份惊人的积蓄过早释放。时间一点点过去，即便你对身体有着出色的控制力，也终究抵不过射出的渴望。直到那股压力几乎挤爆你的阴茎根部时，你才将玩具从肉棒上褪下，胯下一阵用力挤压，顿时释放出一道惊人的白浆，在空中划出弧线，飞出数码远。你被自己的高潮震撼到，咧嘴一笑，咬紧牙关，继续收缩胯下肌肉，试图在这场高潮中再次射出同样夸张的距离。一道又一道浓稠的精液喷洒在周围，将你压倒性的欲望彻底倾泻一空。射出几十发之后，你的身体终于清空了需求，疲惫也随之袭来。在清理干净自己、重新整理好周围以避开你弄出的大片精液水洼后，");
            if(_loc2_ > 0)
            {
               outputText("<b>你发现那滩液体正泛着奇异的微光。凑近一看，你的精液竟然凝结成了宝石！你一边数着，一边把它们收集起来。最后你得到了" + _loc2_ + "颗宝石，而精液几乎所剩无几。</b>");
            }
            else
            {
               outputText("你向后一躺，恢复体力，同时心里明白，你的肉棒之后还会要求更多照顾。");
            }
         }
         else
         {
            outputText("让你既恼火又尴尬的是，你感觉自己必须释放掉这股欲求。你认命地叹了口气，从包里取出用过的飞机杯。你的" + get_player().cockDescript() + "像有自己的意识一般猛地挺立起来，期待着即将到来的刺激与释放。你的性器轻而易举地顶开玩具的入口，你也开始颇有力道地套弄起自己的阴茎。随着你逐渐兴奋起来，快感开始在你的" + get_player().cockDescript() + "中阵阵脉动。不断积聚的液体顶压着你的内脏，带来一种痛楚与快感并存的矛盾感受。纯粹的本能接管了一切，你的臀部也开始反射性地挺动起来。随着性器根部突然传来一阵尖锐的收紧感，射精的欲望彻底支配了你的身体");
            if(_loc2_ > 0)
            {
               outputText("。你将玩具从肉棒上拔下，任由身体本能地对着天空挺胯。");
               outputText("[pg]你喘着粗气，用力挺动着，看着喷射出的精液在空中闪烁。在金色阴茎套的光芒照耀下，它凝结并扭曲成小水晶。在一阵闪闪发光的阵雨中，一");
               if(get_player().cumQ() < 25)
               {
                  outputText("零星的");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("如雨般的");
               }
               else
               {
                  outputText("洪流般的");
               }
               outputText("宝石落在你身上，取代了原本的精液，在你的[skinfurscales]上弹跳开来。");
               outputText("[pg]<b>你强撑着在昏过去前捡起了这" + _loc2_ + "颗宝石。</b>");
            }
            else
            {
               outputText("，几股精液从你的肉棒中喷涌而出，在你周围弄得一片狼藉。你浑身都被自己的体液浸湿，只好花了点时间把自己清理干净，然后将玩具放回包里，带着欲望得到释放的满足感入睡。");
            }
         }
      }
      
      public function onaholeMulticockContinuation() : void
      {
         outputText("你把湿滑黏腻的玩具从还在滴液的阴茎上拔下来，笑着把它那滑溜溜的表面套到另一根[cocks]上。你迅速在几根阴茎之间来回套弄，不断高潮，直到");
         if(get_player().balls > 0)
         {
            outputText("你带着酸痛又空空如也的睾丸昏了过去。");
         }
         else
         {
            outputText("你带着因过度使用而酸痛的[cocks]昏了过去。");
         }
         dynStats(DynStat.Sens(-1));
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onaholeFutaContinuation() : void
      {
         outputText("[pg]你的性别所带来的祝福——或诅咒，取决于你怎么看——追上了你。和你这个性别的所有成员一样，你根本不可能只高潮一次。你感觉胯间深处的肌肉猛地收紧。意识到自己即将射出惊人的一大股精液时，你的眼睛睁大了。压力在你体内一路推进，朝着阴茎涌去；伴随着最后一次用力，你把一股精液洪流逼出了身体。你握住飞机杯的手劲不够，竟把它射飞了");
         outputText(Std.string(int((Math.random() * get_player().get_str() / 12 + get_player().get_str() / 6) * 10) / 10));
         outputText("英尺远。你沉醉在快感中，继续扮演着“精液火山”，把自己和周围都洒满了你的种子。");
         outputText("随着高潮渐渐退去，你发现自己被弄得一塌糊涂，随即昏了过去。");
         dynStats(DynStat.Sens(-1));
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onaholeContinuation() : void
      {
         updateMasturbation();
         if(int(get_player().cocks.length) > 1)
         {
            if(get_player().get_gender() == 3 && Utils.rand(2) == 0)
            {
               doNext(onaholeFutaContinuation);
            }
            else
            {
               doNext(onaholeMulticockContinuation);
            }
         }
         else if(get_player().get_gender() == 3)
         {
            doNext(onaholeFutaContinuation);
         }
         else
         {
            get_player().orgasm("Dick");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function nephilaHunt() : void
      {
         clearOutput();
         outputText("你游荡进营地附近的树林。子宫里的史莱姆寄生体饥饿难耐，再加上你强烈的欲火，让你几乎心神恍惚；成群的子嗣簇拥着你向前，你勉强才能保持清醒。");
         outputText("[pg]你呼喊着让子嗣们停下，好让自己缓解一些性紧张；它们把你放到一条小溪边，让你趴伏下来。你扯下[armor]，开始疯狂抚弄你的" + get_player().vaginaDescript(0) + "，一边揉搓阴蒂；寄生在你子宫里的黏滑触须在你体内进进出出，并拉扯着你的手，让你继续摩擦那颗裹满史莱姆黏液的小豆豆。");
         outputText("[pg]随着你的挑逗越来越深入、越来越急促，寄生体也随之动得更快。你慢慢把更多手指插进你的" + get_player().vaginaDescript(0) + "，让快感愈发强烈。尽管你才刚开始自慰没多久，却已经高潮了；可不管你高潮多少次，体内那种空虚感始终挥之不去。");
         outputText("[pg]很快，你整只拳头都塞进了你的[vagina]里，小穴中的史莱姆贪婪地夹紧并吮吸着这个闯入者。可即便如此，那份空虚依旧让你的脑子被欲望搅得一片迷蒙。");
         outputText("[pg]一只模样纤细秀美的鹿打断了你的自慰，它从灌木丛中走出，低下修长的脖颈到溪边饮水。你一时愣住，欣赏着它的美丽，随后意识到解脱就在眼前，不由得露出微笑。你命令子嗣们缩回体内，然后向那只动物轻声哄着，朝它伸出一只手。");
         outputText("[pg][say: 漂亮姑娘是谁呀？]你说道。[say: 过来，宝贝。]");
         outputText("[pg]那只小兽抬头看向你，随后僵在原地，浑身发抖。你触发了它战斗或逃跑的本能。若是过去的你，看到这无辜生灵显而易见的恐惧，或许还会感到愧疚；但现在的你所能感到的只有饥饿。意识到这生物有多么脆弱，你按压自己硕大腹部的两侧，催促子嗣们出击。");
         outputText("[pg]你的[vagina]像虹膜般张开，一股五彩斑斓的史莱姆触手从中渗出，湿答答地啪嗒一声落在森林的泥土上。触手几乎带着嬉戏般的姿态笨拙地向前蠕动；直到最前面的触手爬上它的腿，那只鹿才从僵直中惊醒。它惊恐地尖叫着，向后扬起身体，却随即被掀翻在地，覆上一层疯狂翻腾的史莱姆。那野兽被彻底吞没前，你最后看到的，是一只惊慌乱转的眼睛。");
         outputText("[pg]你咯咯笑着，向后伸手分开自己柔软饱满的阴唇，看着你的宝宝们把猎物拖向你等待已久的阴道巨口。随后，当触手将那只鹿拖进你的子宫时，你在性的狂喜中眼前一片发白，终于——哪怕只是暂时地——感到自己被填满了。");
         outputText("[pg]暂时得到满足后，你返回营地，好继续猎捕你真正渴求的猎物。");
         get_player().orgasm("Vaginal");
         updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nagaTailsturbation() : void
      {
         clearOutput();
         get_images().showImage("masti-naga-tailsex");
         outputText("带着猥亵的笑，你决定好好利用一下自己修长的娜迦身体……");
         outputText("[pg]你蜿蜒游到营地外一处安全的地方，调整姿势，好让自己能抓住尾巴末端。你用[tongue]舔舐并润滑尾端，愉悦地轻轻含吮着尖端。掰开自己的[vagina]后，你把沾满唾液、滑溜溜的尾端抵在入口处摩擦。你用现在空出来的双手揉弄自己的[chest]、摩擦[nipples]，一边做一边发出呻吟。感觉准备得差不多了，你便集中精神操控尾巴插入。试探着顶了几下后，尾尖找到了穴口，你开心地将它挺了进去。");
         get_player().cuntChange(get_player().get_tallness() + 12,true);
         outputText("这个姿势一开始有些别扭，但你并没有放弃，很快便掌握了舒适而轻柔的节奏，将那截美妙得像阳具一般的尾端送入自己渴求的深处。习惯了这种动作后，你又开始刺激身体的其他地方；一只手轻轻挤压、爱抚自己的[breasts]，另一只手则探向[clit]揉搓。刺激逼得你呻吟、呜咽不止，也让你的脸因情欲而泛红。这些淫欲的挑逗交织在一起，将你一次次推向高潮边缘。你几乎失去控制，伸手抓住这根临时充当假阳具的尾巴，疯狂地插进自己兴奋过度的[vagina]。泪水在眼眶里打转，你尽可能深地顶入，终于被送上顶点。高潮让你全身战栗，沉醉的呻吟从胸腔里迸发而出。你的肌肉一软，仰面倒下，任由尾巴从[vagina]里滑出，啪地砸在地上，发出一声闷响。随着呼吸慢慢平复，你开始闭上眼睛休息。以后你肯定还会再试一次。");
         outputText("[pg]小睡片刻后，你清理干净，回到营地。");
         updateMasturbation();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function multiTitFuck() : Boolean
      {
         var _loc1_:int = int(get_player().totalNipples());
         var _loc2_:int = int(get_player().cocks.length);
         var _loc3_:Boolean = false;
         var _loc4_:int = Utils.rand(_loc2_);
         multiNippleFuckPrep(_loc4_);
         if(_loc1_ >= _loc2_)
         {
            if(_loc2_ == 2)
            {
               outputText("你迅速把另一根肉棒抵到");
            }
            else if(_loc2_ == 2 || _loc1_ == 2)
            {
               outputText("你迅速把又一根肉棒抵到");
            }
            else if(_loc1_ >= _loc2_)
            {
               outputText("你迅速把剩下的肉棒抵到其他乳头上。");
            }
            if(_loc1_ == 2)
            {
               outputText("你的另一个乳头上。");
            }
            else if(_loc2_ <= 2)
            {
               outputText("你的另一个乳头上。");
            }
         }
         if(_loc2_ > 2 && _loc1_ < _loc2_)
         {
            outputText("你一时愣住了，因为你发现自己的乳头根本不够容纳所有肉棒。");
            if(get_player().vaginalCapacity() >= 2 * get_player().cockArea(_loc4_))
            {
               _loc3_ = true;
               outputText("“多重插入”这个念头掠过你被欲望搅得昏沉的脑海，于是你开始把两根肉棒抵向一个可怜又毫无防备的乳头，准备进行双重插入。");
               if(2 * _loc1_ >= _loc2_)
               {
                  outputText("你高兴地咯咯笑了起来，因为你意识到，多亏了双重插入，你将能够把你所有的[cocks]都塞进你那被蹂躏的乳头里！");
               }
               else
               {
                  outputText("你心头闪过一阵烦躁，因为你意识到，就算每个洞都塞进两根肉棒，也还是没法把全部" + Utils.num2Text(int(get_player().cocks.length)) + "根都塞进这对饱受摧残的乳房里。既然如此，你决定尽量多塞几根进去。");
               }
            }
            else
            {
               outputText("意识到自己也无可奈何后，你开始用力往里顶。");
            }
         }
         if(get_player().averageLactation() == 0)
         {
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("你");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("滑腻的淫液顺着你的肉棒淌下，你");
            }
            else
            {
               outputText("滑腻的淫液从你的肉棒周围喷溅而出，你");
            }
         }
         else if(get_player().averageLactation() < 2)
         {
            outputText("乳白色的雌液汇成细流，顺着你的肉棒淌下，你");
         }
         else
         {
            outputText("乳白色的雌液从你的肉棒周围喷出，把它们染得一片雪白。你");
         }
         if(Math.round(get_player().cockArea(_loc4_)) >= get_player().vaginalCapacity())
         {
            if(get_player().get_sens100() < 45)
            {
               outputText("用力喘哼着，试图把肉棒塞进");
            }
            else if(get_player().get_sens100() < 70)
            {
               outputText("强忍着泪水，试图把肉棒塞进");
            }
            else
            {
               outputText("因痛感与快感交织而尖叫着，试图把肉棒塞进");
            }
            if(get_player().averageVaginalLooseness() < 2)
            {
               outputText("你肿胀乳头上那些被过度撑开的小口。");
            }
            else if(get_player().averageVaginalLooseness() < 4)
            {
               outputText("你肥大肿胀的乳头上，那些充血鼓胀、被撑开的入口。");
            }
            else
            {
               outputText("你非人乳头小穴上大张着的待插穴口。");
            }
            if(Math.round(get_player().cockArea(_loc4_)) == get_player().vaginalCapacity())
            {
               if(get_player().averageVaginalLooseness() < 2)
               {
                  outputText("你那可怜、饱受折磨的乳头几乎承受不住你肿胀的肉棒，但它们还是硬生生容纳了进去。");
               }
               else if(get_player().averageVaginalLooseness() < 4)
               {
                  outputText("你充血乳头顶端那些皱缩的小口被撑到了极限，你把粗大的肉棒狠狠顶入其中。");
               }
               else
               {
                  outputText("你鼓胀乳头上肿起的唇瓣被你抽动的肉棒撑开，将它们整个吞没。");
               }
               outputText("每一次挺动，你都把肉棒更深地埋进自己贪婪的乳房里。多重快感交织在一起，令你的意识几乎无法承受那种本不该存在的强烈充实感。");
            }
            if(Math.round(get_player().cockArea(_loc4_)) > get_player().vaginalCapacity())
            {
               if(get_player().averageVaginalLooseness() < 2)
               {
                  outputText("你那可怜、饱受折磨的乳头，和你肿胀肉棒的宽度相比实在太过狭小。可在欲望的昏乱中，你还是继续把它们往里推进。");
               }
               else if(get_player().averageVaginalLooseness() < 4)
               {
                  outputText("你充血乳头顶端那些皱缩的小口被撑到极限，甚至超过了极限，而你仍把粗大的肉棒狠狠顶入其中。");
               }
               else
               {
                  outputText("你鼓胀乳头上肿起的唇瓣大大张开，可你抽动阳具那惊人的粗度又将它们撑得更开。");
               }
               outputText("你一边用力喘息、汗流浃背，一边尽可能把肉棒塞进每一个被过度撑开的乳头里。肉棒被紧紧包裹的惊人感觉，与乳头被撑开的疼痛交织在一起，化作一阵令人神魂颠倒的感官风暴，让你头晕目眩。");
            }
            if(get_player().averageLactation() > 0)
            {
               outputText("乳白色的");
            }
            else
            {
               outputText("滑腻的");
            }
            if(get_player().averageVaginalWetness() < 2)
            {
               outputText("淫液顺着你的肉棒淌下，给它们裹上一层闪闪发亮的爱液。");
            }
            else if(get_player().averageVaginalWetness() < 4)
            {
               outputText("淫液从你备受折磨的乳头里一股股淌出，在你的屁股下方积成一摊。");
            }
            else
            {
               outputText("随着你每一次挺动腰胯，淫液都从你备受折磨的乳头里喷涌而出，把你的手臂和脸都溅满了分泌物。");
            }
         }
         if(Math.round(get_player().cockArea(_loc4_)) < get_player().vaginalCapacity())
         {
            if(!_loc3_)
            {
               if(get_player().get_sens100() < 45)
               {
                  outputText("你愉悦地叹息着，僵硬的肉棒滑入");
               }
               else if(get_player().get_sens100() < 70)
               {
                  outputText("你愉悦地呻吟着，僵硬的肉棒滑入");
               }
               else
               {
                  outputText("你快意地尖叫着，僵硬的肉棒滑入");
               }
               if(get_player().averageVaginalLooseness() < 2)
               {
                  outputText("你肿胀乳头上那些被过度撑开的小口。你坚硬的肉棒轻易刺入充血鼓胀的乳头，第一次挺动就滑进了一半。");
               }
               else if(get_player().averageVaginalLooseness() < 4)
               {
                  outputText("你肥厚肿胀的乳头上，那些充血鼓胀的开口。你坚硬的肉棒深深刺入那异样胀大的乳头，轻易就贯穿了进去。");
               }
               else
               {
                  outputText("你那非人乳头小穴上张开的交合口。肿胀鼓起的乳头唇瓣吞住你坚硬的肉棒，开始顺着棒身向下滑动，将它们完全吞没。");
               }
               outputText("你沉醉在这种感觉中，慢慢地让肉棒在胀开的乳头里进进出出。你的肉棒被你那异样乳房温暖湿润地包裹着，而");
               if(get_player().averageLactation() > 0)
               {
                  outputText("乳白色的");
               }
               else
               {
                  outputText("滑腻的");
               }
               if(get_player().averageVaginalWetness() < 2)
               {
                  outputText("淫液顺着你的肉棒淌下，给它们裹上一层闪闪发亮的爱液。");
               }
               else if(get_player().averageVaginalWetness() < 4)
               {
                  outputText("淫液从你肥厚的乳头里成股流出，在你的屁股下方积成一滩。");
               }
               else
               {
                  outputText("淫液从你肿胀的乳头里不断倾泻而出，黏稠的液体在你身下汇成一大滩。");
               }
            }
            else
            {
               if(get_player().get_sens100() < 45)
               {
                  outputText("你愉悦地叹息着，僵硬的肉棒滑入");
               }
               else if(get_player().get_sens100() < 70)
               {
                  outputText("你愉悦地呻吟着，僵硬的肉棒滑入");
               }
               else
               {
                  outputText("你快意地尖叫着，僵硬的肉棒滑入");
               }
               if(4 * Math.round(get_player().averageCockThickness()) < get_player().averageVaginalLooseness())
               {
                  if(get_player().averageVaginalLooseness() < 2)
                  {
                     outputText("你肿胀乳头上被过度撑开的开口。虽然它们相对细小而娇嫩，但你仍能轻易地把两根小肉棒滑进每条滑腻的通道里。");
                  }
                  else if(get_player().averageVaginalLooseness() < 4)
                  {
                     outputText("你肥厚肿胀的乳头上，那些充血鼓胀的开口。它们很容易就被撑开，竟能轻松吞下各自两根肉棒，没费多少力气就包住了你胀硬的棒身。");
                  }
                  else
                  {
                     outputText("你那非人乳头小穴上张开的交合口。鼓胀乳头的肿胀唇瓣被挤开，毫不费力地吞下你粗大的肉棒。");
                  }
                  outputText("每一次抽插，你都把肉棒更深地埋进贪婪的乳房里。肉棒在你非人乳房温暖湿润的包裹中彼此摩擦，那感觉将你推向疯狂边缘，让你短暂地无法理解周围的一切。");
               }
               else
               {
                  if(get_player().averageVaginalLooseness() < 2)
                  {
                     outputText("你肿胀乳头上那些细小却被过度撑开的开口。你可怜又饱受折磨的乳头被痛苦地撑开，因为你把两根悸动的肉棒硬塞进了同一个乳头里。");
                  }
                  else if(get_player().averageVaginalLooseness() < 4)
                  {
                     outputText("你肥厚肿胀的乳头上，那些充血鼓胀的开口。当你把两根粗大的肉棒塞进同一个乳头时，它们被撑到了极限。");
                  }
                  else
                  {
                     outputText("你那非人乳头小穴上张开的交合口。当你把两根粗大的肉棒推进同一个乳头时，鼓胀乳头的肿胀唇瓣被撑到了极限。");
                  }
                  outputText("你费力地喘着粗气、浑身冒汗，把尽可能多的肉棒塞进每个被过度撑开的乳头里。肉棒在你非人乳房温暖湿润的包裹中被挤压在一起，那感觉将你推向疯狂边缘，让你短暂地无法理解周围的一切。");
               }
               if(get_player().averageLactation() > 0)
               {
                  outputText("乳白色的");
               }
               else
               {
                  outputText("滑腻的");
               }
               if(get_player().averageVaginalWetness() < 2)
               {
                  outputText("淫液顺着你的肉棒淌下，给它们裹上一层闪闪发亮的爱液。");
               }
               else if(get_player().averageVaginalWetness() < 4)
               {
                  outputText("淫液从你备受折磨的乳头里一股股淌出，在你的屁股下方积成一摊。");
               }
               else
               {
                  outputText("随着你每一次挺动腰胯，淫液都从你备受折磨的乳头里喷涌而出，把你的手臂和脸都溅满了分泌物。");
               }
            }
         }
         if(!_loc3_ && _loc2_ <= _loc1_ || _loc3_ && _loc2_ <= _loc1_ * 2)
         {
            return false;
         }
         return true;
      }
      
      public function multiNippleFuckPrep(param1:int) : void
      {
         if(get_player().get_lib100() < 70)
         {
            outputText("你因期待而颤抖着，将");
         }
         else
         {
            outputText("你毫不犹豫地把");
         }
         if(get_player().cocks[param1].get_cockType() == CockTypesEnum.HUMAN)
         {
            outputText("你那");
            if(get_player().countCocksOfType(CockTypesEnum.HUMAN) > 1)
            {
               outputText("" + Utils.num2Text(get_player().countCocksOfType(CockTypesEnum.HUMAN)) + "根" + get_player().cockDescript(param1) + "中的一根的尖端");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(param1) + "");
            }
         }
         if(get_player().cocks[param1].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("你那");
            if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 1)
            {
               outputText("" + Utils.num2Text(get_player().countCocksOfType(CockTypesEnum.HORSE)) + "根" + get_player().cockDescript(param1) + "中的一根外扩的顶端");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(param1) + "");
            }
         }
         if(get_player().cocks[param1].hasKnot())
         {
            outputText("你那");
            if(get_player().countKnottedCocks() > 1)
            {
               outputText("" + Utils.num2Text(get_player().countKnottedCocks()) + "根" + get_player().cockDescript(param1) + "中的一根尖尖的顶端");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(param1) + "");
            }
         }
         if(get_player().cocks[param1].get_cockType().get_Index() >= 3)
         {
            outputText("你那");
            if(get_player().countCocksOfType(CockTypesEnum.HUMAN) > 1)
            {
               outputText("" + Utils.num2Text(get_player().countCocksOfType(CockTypesEnum.HUMAN)) + "根" + get_player().cockDescript(param1) + "中的一根的尖端");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(param1) + "");
            }
         }
         if(get_player().get_lib100() < 70)
         {
            outputText("抵住");
         }
         else
         {
            outputText("插进");
         }
         if(int(get_player().breastRows.length) > 1)
         {
            if(get_player().averageNipplesPerBreast() > 1)
            {
               outputText("其中一个");
            }
            else
            {
               outputText("这个");
            }
         }
         else
         {
            outputText("你的");
         }
         if(get_player().averageNipplesPerBreast() > 1)
         {
            outputText("众多");
         }
         if(get_player().averageVaginalLooseness() < 2)
         {
            outputText("被撑得发痛的乳头");
         }
         else if(get_player().averageVaginalLooseness() < 4)
         {
            outputText("肿胀得畸形的乳头");
         }
         else
         {
            outputText("巨大肿胀的阴户乳头");
         }
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("，长在你下方的一只乳房上");
         }
         else if(get_player().averageNipplesPerBreast() > 1)
         {
            outputText("");
         }
         outputText("。");
      }
      
      public function midasCockJackingGemsRoll() : int
      {
         var _loc1_:int = get_player().countCockSocks("gilded");
         var _loc2_:int = 10 + Utils.rand(20);
         if(get_player().cumQ() < 1000 * _loc1_)
         {
            _loc2_ += int(get_player().cumQ() / 10);
         }
         else if(get_player().cumQ() < 2500 * _loc1_)
         {
            _loc2_ += int(100 + get_player().cumQ() / 50);
         }
         else if(get_player().cumQ() < 5000 * _loc1_)
         {
            _loc2_ += int(150 + get_player().cumQ() / 150);
         }
         else if(get_player().cumQ() < 10000 * _loc1_)
         {
            _loc2_ += int(200 + get_player().cumQ() / 450);
         }
         else
         {
            _loc2_ += int(250 + get_player().cumQ() / 1350);
         }
         if(_loc2_ > 200 * _loc1_)
         {
            _loc2_ = 200 * _loc1_ + Utils.rand(20);
         }
         return _loc2_;
      }
      
      public function meditate(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "岩石";
         }
         clearOutput();
         if(get_player().get_gender() == 2)
         {
            get_images().showImage("masti-meditate-female");
         }
         else
         {
            get_images().showImage("masti-meditate-male");
         }
         outputText("你找了块平坦又舒适的" + param1 + "坐下冥想。一如既往，冥想为你带来平和与宁静，但也消耗了你一天中的两个小时。[pg]");
         dynStats(DynStat.Lust(-50),DynStat.Cor(-0.3 - 0.3 * get_player().countCockSocks("alabaster")));
         if(get_player().hasPerk(PerkLib.Enlightened) && get_player().isPureEnough(10))
         {
            get_player().HPChange(50,true);
         }
         get_player().changeFatigue(-10);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function masturbateMenu() : void
      {
         var _g4:Masturbation;
         var _g3:Masturbation;
         var _g2:Masturbation;
         var _g1:Masturbation;
         var _g:Masturbation;
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2640) > 0)
         {
            clearOutput();
            outputText("尽管你的身体渴求着高潮，但你知道，没有女主人的许可，你根本不可能获得任何释放。你坐下来，绝望地检查这个装置，想找出取下它的办法，但很快就放弃了。要拆掉这玩意儿，你要么需要钥匙，要么得找个懂诅咒神器的人帮忙。");
            addNextButton("继续",playerMenu);
            if(canMeditate())
            {
               _g = this;
               addNextButton("冥想",function():void
               {
                  _g.meditate();
               });
            }
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            clearOutput();
            outputText("你前列腺内寄生虫的骚动提醒着你，普通的阴茎或阴道刺激毫无意义。不管你怎么撸弄、怎么挑逗，只有直接刺激前列腺，你才能达到高潮。[pg]");
            outputText("想到这一点，你开始考虑自己的选择。");
            if(canMeditate())
            {
               _g1 = this;
               addNextButton("冥想",function():void
               {
                  _g1.meditate();
               });
            }
            addNextButton("拳交自己",fistForFullFeelings);
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
            {
               addNextButton("触手入肛",tentacleGoesUpYerPooperNewsAtEleven);
            }
            if(get_player().hasKeyItem("Dildo"))
            {
               addNextButton("肛用假阳具",dildoButts);
            }
            if(get_player().canOvipositBee() && get_player().get_lust() >= 33 && get_player().biggestCockArea() > 100)
            {
               addNextButton("屌内产卵",getHugeEggsInCawk);
            }
            if(get_player().hasKeyItem("All-Natural Self-Stimulation Belt") && int(get_player().vaginas.length) > 0 && !get_player().isTaur())
            {
               addNextButton("天然刺激腰带",allNaturalStimBeltUse);
            }
            setExitButton("返回",playerMenu);
            return;
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE && !fappingItems(false))
         {
            clearOutput();
            outputText("尽管你的蜜蜂鸡巴隐隐作痛，但你知道自己没法独自获得释放。每当你触碰肉棒，或是想到射精时，那个蜂女的身影和她催眠般的嗡鸣声就会充满你的脑海。");
            if(canMeditate())
            {
               outputText("[pg]你可以通过冥想来净化自己的欲望。");
               _g2 = this;
               addNextButton("冥想",function():void
               {
                  _g2.meditate();
               });
            }
            if(get_player().hasItem(get_consumables().BEEHONY) || get_player().hasItem(get_consumables().PURHONY) || get_player().hasItem(get_consumables().SPHONEY))
            {
               outputText("[pg]幸运的是，如果你愿意，你可以把蜂蜜抹满你的" + get_player().cockDescript() + "来释放自己。");
               addNextButton("使用蜂蜜",masturbateGo);
            }
            setExitButton("返回",playerMenu);
            return;
         }
         if(canMeditate())
         {
            _g3 = this;
            addNextButton("冥想",function():void
            {
               _g3.meditate();
            });
            if(!religionCheck())
            {
               addNextButton("自慰",masturbateGo);
            }
         }
         else if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10 && get_player().get_lust() >= 33 && get_player().statusEffectv2(StatusEffects.ParasiteNephilaNeedCum) >= 1)
         {
            outputText("[pg]<b>子宫内寄生物的躁动搅得你心神不宁；除了照常自慰之外，你还可以去狩猎，以缓解这份煎熬。</b>");
            outputText("[pg]<b>想到这里，你开始考虑自己的选择。</b>");
            addNextButton("狩猎",nephilaHunt);
         }
         else
         {
            addNextButton("自慰",masturbateGo);
         }
         if(get_player().hasCock() && (get_player().hasPerk(PerkLib.Flexibility) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) > 0))
         {
            addNextButton("舔鸡巴",catAutoLick);
         }
         if(get_player().hasVagina() && (get_player().hasPerk(PerkLib.Flexibility) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) > 0))
         {
            addNextButton("舔小穴",lickYerGirlParts);
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0 && get_player().hasVagina())
         {
            addNextButton("触手入穴",tentacleSelfFuck);
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
         {
            addNextButton("触手入肛",tentacleGoesUpYerPooperNewsAtEleven);
         }
         if(get_player().canOvipositBee() && get_player().get_lust() >= 33 && get_player().biggestCockArea() > 100)
         {
            addNextButton("屌内产卵",getHugeEggsInCawk);
         }
         if(get_player().canOviposit() && get_player().hasFuckableNipples() && get_player().get_lust() >= 33 && get_player().biggestTitSize() >= 21)
         {
            addNextButton("乳内产卵",layEggsInYerTits);
         }
         if(get_player().hasVagina() && get_player().isNaga() && get_player().get_lust() >= 33)
         {
            addNextButton("娜迦尾巴",nagaTailsturbation);
         }
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            addNextButton("修女服",get_player().get_armor().naughtyNunMasturbationMenu).hint("向你的主献上一点虔诚吧。");
         }
         if(get_player().hasCock() && get_watersportsEnabled() && (get_player().hasPerk(PerkLib.Flexibility) || get_player().longestCockLength() >= get_player().get_tallness() * 0.33))
         {
            addNextButton("喝尿",drinkPiss).hint("舒展一下身体，喝点自己的尿。");
         }
         if(!get_player().isGenderless() && get_player().hunger < 5 && get_player().get_lust() >= 33)
         {
            addNextButton("饥饿",hungerRub).hint("试着在这悲惨的状态下找到释放。");
         }
         if(!get_player().isGenderless() && (get_player().hasItem(get_useables().TELBEAR) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2796) > 0) && get_player().get_lust() >= 33)
         {
            addNextButton("用熊熊",fuckBear).hint("像特莉当初那样，把满满的爱都灌进它里面。");
         }
         if(fappingItems(false))
         {
            _g4 = this;
            addNextButton("物品",function():Boolean
            {
               return _g4.fappingItems();
            });
         }
         var _loc1_:Array = get_output().getAvailableButtons();
         if(int(_loc1_.length) == 1)
         {
            button(int(_loc1_[0])).click();
            return;
         }
         setExitButton("返回",playerMenu);
      }
      
      public function masturbateGo() : void
      {
         var _loc4_:Number = NaN;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Dysfunction))
         {
            outputText("你很想自慰，但性器的麻木让你根本做不到。你得找个能让你操的对象，才能纾解这股欲火。");
            doNext(playerMenu);
            return;
         }
         if(get_player().hasCock() && get_player().cocks[0].get_cockType() == CockTypesEnum.BEE && !(get_player().hasItem(get_consumables().BEEHONY) || get_player().hasItem(get_consumables().PURHONY) || get_player().hasItem(get_consumables().SPHONEY)))
         {
            outputText("尽管你的蜂化肉棒隐隐作痛，但你知道自己根本没办法独自获得解脱。每当你触碰自己的肉棒，或是想到射精时，脑海里就会浮现出那个蜂女的身影，以及她催眠般的嗡鸣声。");
            doNext(playerMenu);
            return;
         }
         if(get_player().isTaur())
         {
            if(centaurMasturbation())
            {
               updateMasturbation();
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               doNext(playerMenu);
            }
            return;
         }
         if(get_player().get_gender() == 0)
         {
            genderlessMasturbate();
            updateMasturbation();
            dynStats(DynStat.Lust(-50));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan) && get_player().statusEffectv2(StatusEffects.Exgartuan) == 0)
         {
            updateMasturbation();
            if(get_player().isNaga() && Utils.rand(2) == 0 && get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
            {
               get_game().exgartuan.exgartuanNagaStoleMyMasturbation();
            }
            else
            {
               get_game().exgartuan.exgartuanMasturbation();
            }
            return;
         }
         if(get_player().countCockSocks("gilded") > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,899) < get_player().countCockSocks("gilded"))
         {
            updateMasturbation();
            gildedCockTurbate();
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         doStripCheck();
         titForeplay();
         if(int(get_player().cocks.length) > 0)
         {
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.BEE && (get_player().hasItem(get_consumables().BEEHONY) || get_player().hasItem(get_consumables().PURHONY) || get_player().hasItem(get_consumables().SPHONEY)))
            {
               if(get_player().hasItem(get_consumables().BEEHONY))
               {
                  get_player().consumeItem(get_consumables().BEEHONY,1);
               }
               else if(get_player().hasItem(get_consumables().PURHONY))
               {
                  get_player().consumeItem(get_consumables().PURHONY,1);
               }
               else if(get_player().hasItem(get_consumables().SPHONEY))
               {
                  get_player().consumeItem(get_consumables().SPHONEY,1);
               }
               outputText("你取出一小瓶蜂蜜，涂满你的蜂化肉棒。感觉舒服极了，疼痛很快就退去了。");
            }
            if(int(get_player().cocks.length) == 1)
            {
               outputText("你抚弄着你的" + get_player().cockDescript());
               if(get_player().get_lib100() < 45)
               {
                  outputText("，急切地让自己迅速硬到饱胀搏动。");
               }
               else if(get_player().get_lib100() < 70)
               {
                  outputText("，懒洋洋地享受着它几乎一直坚硬的感觉。");
               }
               else
               {
                  outputText("，挑逗般地抚摸着；由于你一直处于兴奋状态，前列腺液顺着整根肉棒流淌下来。");
               }
            }
            else
            {
               outputText("你抚弄着你的" + get_player().cockDescript());
               if(get_player().get_lib100() < 45)
               {
                  outputText("，急切地让你的肉棒们迅速硬到饱胀搏动。");
               }
               else if(get_player().get_lib100() < 70)
               {
                  outputText("，懒洋洋地享受着它们几乎一直坚硬的感觉。");
               }
               else
               {
                  outputText("，挑逗般地抚摸着；由于你一直处于兴奋状态，前列腺液顺着你的肉棒们流淌下来，在你周围积成一滩。");
               }
            }
         }
         if(get_player().get_gender() == 3)
         {
            get_images().showImage("masti-herm");
         }
         else if(get_player().get_gender() == 2)
         {
            get_images().showImage("masti-female");
         }
         else
         {
            get_images().showImage("masti-male");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(int(get_player().vaginas.length) == 1)
            {
               if(get_player().get_lib100() < 45)
               {
                  outputText("你抚摸并玩弄着你的[vagina]，");
               }
               else if(get_player().get_lib100() < 70)
               {
                  outputText("你轻轻拍打自己的小穴，");
               }
               else
               {
                  outputText("你抚摸着自己发热而兴奋的[vagina]，");
               }
               _loc4_ = get_player().vaginas[0].vaginalWetness;
               if(_loc4_ == 0)
               {
                  outputText("熟练地挑逗着你的女性部位。");
               }
               else if(_loc4_ == 1)
               {
                  outputText("轻叹着感受它很快变得湿润。");
               }
               else if(_loc4_ == 2)
               {
                  outputText("你轻声笑着，手指也沾上了一点湿意。");
               }
               else if(_loc4_ == 3)
               {
                  outputText("你微微一笑，手指上已裹满了滑腻的淫液。");
               }
               else if(_loc4_ == 4)
               {
                  outputText("用不断从[vagina]滴落的淫液润湿手指");
               }
               else
               {
                  outputText("你舔了舔嘴唇，一小股液体从下体喷涌而出。");
               }
            }
            if(int(get_player().vaginas.length) > 1)
            {
               if(get_player().get_lib100() < 45)
               {
                  outputText("你抚摸并玩弄着自己层层叠叠的阴唇，");
               }
               else if(get_player().get_lib100() < 70)
               {
                  outputText("你轻轻拍打自己的小穴们，");
               }
               else
               {
                  outputText("抚摸你发热而兴奋的[vagina]s，");
               }
               _loc4_ = get_player().vaginas[0].vaginalWetness;
               if(_loc4_ == 0)
               {
                  outputText("熟练地挑逗着你的女性部位。");
               }
               else if(_loc4_ == 1)
               {
                  outputText("轻轻叹息着，它们很快就变得湿润起来。");
               }
               else if(_loc4_ == 2)
               {
                  outputText("你轻声笑着，手指也沾上了一点湿意。");
               }
               else if(_loc4_ == 3)
               {
                  outputText("你微微一笑，手指上已裹满了滑腻的淫液。");
               }
               else if(_loc4_ == 4)
               {
                  outputText("用从[vagina]s里不断淌出的淫液濡湿手指");
               }
               else
               {
                  outputText("舔了舔嘴唇，随着一小股体液从你的下体喷溅出来。");
               }
            }
         }
         if(int(get_player().cocks.length) == 1)
         {
            outputText("[pg]");
            if(get_player().cocks[0].cockThickness < 1.8)
            {
               outputText("你轻松地用一只手握住你的" + get_player().cockDescript() + "，开始自慰。");
            }
            else if(get_player().cocks[0].cockThickness < 3)
            {
               outputText("你有些难以用手完全握住你的" + get_player().cockDescript() + "，一边开始自慰，一边沉醉于你那");
               if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
               {
                  outputText("野兽般的性器");
               }
               else if(get_player().hasKnot())
               {
                  outputText("球茎状兽根");
               }
               else
               {
                  outputText("硕大的性器");
               }
               outputText("带来的快感。");
            }
            else if(get_player().cocks[0].cockThickness < 5)
            {
               outputText("你用双手握住你的" + get_player().cockDescript() + "，开始自慰时，感受着你的" + (get_player().hasKnot() ? "肉结" : "阴茎") + "一阵阵悸动。");
            }
            else
            {
               outputText("你用双手抓住你的" + get_player().cockDescript() + "，但即使这样也无法完全环住，随后开始自慰。");
            }
            if(get_player().cocks[0].cockLength < 12)
            {
               if(get_player().countCocksOfType(CockTypesEnum.HUMAN) >= 1)
               {
                  outputText("你快速套弄着，取悦着自己敏感的肉棒，一边向下探去抚弄阴茎根部。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 1)
               {
                  outputText("你快速套弄，沉醉于敏感的马根带来的快感，手还不时滑向下方，抚弄着敏感的鞘囊。");
               }
               else if(get_player().dogCocks() >= 1)
               {
                  outputText("你快速套弄，取悦着敏感的犬类勃起物，手还不时滑向下方，抚弄阴茎根部敏感的鞘囊。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 1)
               {
                  outputText("你快速套弄，取悦着柔韧的触手状性器，沿着每一寸扭动的长度上下滑动，抚弄着每一个非人的结节。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 1)
               {
                  outputText("你快速套弄着，取悦着那根恶魔阳具上凹凸不平的隆脊，手掌滑过整根抽动的长度时，还抚弄着每一个非人的疙瘩。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.CAT) >= 1)
               {
                  outputText("你快速套弄着，感受着你的" + get_player().cockDescript() + "上细小的“倒刺”从指间滑过，甚至还向下探去，绕着鞘部周围敏感的皮肤打转。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) >= 1)
               {
                  outputText("你快速套弄着，取悦着你敏感的" + get_player().cockDescript() + "，手指滑过那布满肉结的整根上每一道隆脊和凸起。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 1)
               {
                  outputText("你快速套弄着，手指被你的" + get_player().cockDescript() + "根部周围和冠部下方那些带有催情成分的触手反复刺痛，让你不禁喘息起来。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DISPLACER) >= 1)
               {
                  outputText("你快速套弄着，取悦着你敏感的异形肉棒，一边向下探去抚弄敏感的鞘部；你尖细的顶端则张开成了一个扭动着、像海星一样的形状。");
               }
               else
               {
                  outputText("你快速套弄着，取悦着自己敏感的肉棒，一边向下探去抚弄阴茎根部。");
               }
            }
            else if(get_player().cocks[0].cockLength < 20)
            {
               if(get_player().countCocksOfType(CockTypesEnum.HUMAN) >= 1)
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "冠部，每次套弄到末端时都揉搓它，挤出一团团前液抹在上面，用来挑逗自己。它似乎随着每一次套弄而搏动、抽搐，对每一次触碰都有反应。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 1)
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "那敏感而外扩的顶端，每次套弄到末端时都揉搓它，挤出一团团前液抹在上面，用来挑逗自己。它似乎随着每一次套弄而搏动、泛起涟漪，对每一次触碰都有反应。");
               }
               else if(get_player().dogCocks() >= 1)
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "那尖细的顶端，每次套弄到末端时都揉搓它，挤出一团团前液抹在上面，用来挑逗自己。你的肉结似乎随着每一次套弄而搏动、抽搐，对每一次触碰都有反应。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 1)
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "那过大的蘑菇状顶端，每次套弄之后都爱抚它，同时挤出一团团前液，沿着它黏滑的整根抹开。它仿佛有自己的意志般在你手中扭动翻搅，随着每一轮套弄时长时短。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 1)
               {
                  outputText("你享受着挑逗那些围绕着你的" + get_player().cockDescript() + "冠部形成一圈的较大凸起，看着它们随着你挤出并抹遍整根的一团团前液而同步抽动、痉挛。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.CAT) >= 1)
               {
                  outputText("你享受着挑逗自己" + get_player().cockDescript() + "上遍布的敏感小突起，每次套弄到末端时都绕着阴茎尖端打转，收集前液再涂满整根。每一根细小的“倒刺”都会随着套弄带来阵阵快感，催促你继续下去。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) >= 1)
               {
                  outputText("你享受着挑逗那些覆盖在你" + get_player().cockDescript() + "上的圆润鼓包，先用指尖绕着它们打转，再滑向尿道口，收集一滴前液。你把它抹在自己敏感的爬行动物皮肤上，沉醉于贯穿全身的快感之中。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 1)
               {
                  outputText("你享受着抓住根部周围那些细小、刺人的触手，把它们夹在你的" + get_player().cockDescript() + "和手掌之间挤压。松开它们、沿着整根套弄时，催情物质涌入你的血液；你收集一团团前液涂满自己，还“不小心”碰到冠部的其他触手。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DISPLACER) >= 1)
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "那张开的顶端，每次套弄到末端时都揉搓它，看着它挤出一团团前液，再被你抹在上面用来挑逗自己。你的肉结似乎随着每一次套弄而搏动、抽搐，对每一次触碰都有反应。");
               }
               else
               {
                  outputText("你享受着挑逗自己的" + get_player().cockDescript() + "冠部，每次套弄到末端时都揉搓它，挤出一团团前液抹在上面，用来挑逗自己。它似乎随着每一次套弄而搏动、抽搐，对每一次触碰都有反应。");
               }
            }
            else if(get_player().cocks[0].cockLength < 26)
            {
               if(get_player().countCocksOfType(CockTypesEnum.HUMAN) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "龟头朝你的脸晃了过来，一团前液在顶端慢慢积起。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "外扩的顶端朝着你的脸晃来晃去，顶端慢慢鼓起一团前液。");
               }
               else if(get_player().dogCocks() >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "尖细的顶端朝你的脸翘起，一团前液正慢慢从中渗出。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "那过宽的龟头撞上你的嘴唇，像寻找孔洞的蛇一样来回摆动。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "紫红色的龟头碰上了你的嘴唇，随着每一次心跳涨成更深的颜色。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.CAT) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "略尖的顶端碰上了你的嘴唇；你手中的肉刺越胀越粗，它也随之充血发红。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "尖尖的紫色顶端碰上了你的嘴唇，带着肉结的表面涨成近乎紫色，看起来也变得更粗了。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 1)
               {
                  outputText("你抚弄着自己的" + get_player().cockDescript() + "，那被触手环绕的顶端擦过你的嘴唇，带来一阵人工般的灼热刺痒。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DISPLACER) >= 1)
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "绽开的顶端朝你的脸昂起，一团前液从舒展开的顶端慢慢渗了出来。");
               }
               else
               {
                  outputText("你自慰时，你的" + get_player().cockDescript() + "龟头朝你的脸晃了过来，一团前液在顶端慢慢积起。");
               }
               if(get_player().hasFuckableNipples() && get_player().biggestTitSize() >= 3)
               {
                  _loc3_ = true;
                  titFuckSingle();
               }
               else
               {
                  outputText("你屈服于诱惑，将顶端吞入口中，贪婪地吮吸着，把你的" + get_player().cockDescript() + "里的前液榨了出来。");
                  _loc1_ = true;
               }
               if(get_player().canTitFuck() && get_player().biggestTitSize() > 3 && !_loc3_)
               {
                  outputText("你的双手像是不受控制般移向胸部，用丰满的乳肉裹住你的" + get_player().cockDescript() + "，让它在枕头般柔软的双乳间上下抽动。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
            }
            else
            {
               if(get_player().countCocksOfType(CockTypesEnum.HUMAN) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "龟头晃了过来，撞上你的脸，把大量前液抹在你的嘴唇上。你无法抗拒地张开嘴将它含住，任自己的肉棒塞满口腔。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "外扩的顶端晃了过来，撞上你的脸，把大量前液抹在你的嘴唇上。你无法抗拒地张开嘴将它含住，任马屌塞满口腔。");
               }
               else if(get_player().dogCocks() >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "的龟头晃动着，撞到了你的脸，在你嘴唇上抹上了大量的先列腺液。你忍不住张开嘴吸了下去，让你的" + get_player().cockDescript() + "填满你的嘴。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "那球状、蘑菇般的龟头急切地顶上你的脸，把前液抹在你的嘴唇上，寻找着最近的入口。你无法抗拒地张开嘴将它含住，任那滑腻而有橡胶质感的肉棒触手塞满口腔。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "污秽而肿胀的龟头顶上你的脸，把甜腻的前液抹在你的嘴唇上。你无法抗拒地张大嘴，含住这根恶魔般的阳具，彻底屈从于取悦自己堕落肉体的欲望。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.CAT) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "尖端顶上你的脸，把前液抹在你的嘴唇上，无数倒刺轻轻搔弄着你。你无法抗拒地张大嘴含住这根" + get_player().cockDescript() + "，满足地发出半哼半呼噜的声音。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "略尖的顶端顶上你的脸，把前液抹在你急切的嘴唇上。你忍不住张大嘴让它滑入口中，同时双手抚过你整根阴茎上那些爬虫般的鼓起。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "圆润、被触手环绕的顶端滑过你的脸，把前液抹在你的嘴唇上，其中的催情剂刺得你欲火焚身、喘息不止。你无法抗拒地张大嘴贪婪吮吸，短短几秒内，细小而酥麻的刺痛就在你的口腔中爆开，令你充满欲望与快感。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.DISPLACER) >= 1)
               {
                  outputText("你的" + get_player().cockDescript() + "的龟头晃动着，撞到了你的脸，在你嘴唇上抹上了大量的先列腺液。它在你的嘴唇上扭动，顶端“星星”的各种突起将你那令人陶醉的分泌物涂抹在你身上。你忍不住张开嘴吸了下去，让你的" + get_player().cockDescript() + "填满你的嘴。");
               }
               else
               {
                  outputText("你的" + get_player().cockDescript() + "龟头晃了过来，撞上你的脸，把大量前液抹在你的嘴唇上。你无法抗拒地张开嘴将它含住，任自己的肉棒塞满口腔。");
               }
               if(get_player().hasFuckableNipples() && get_player().biggestTitSize() >= 3)
               {
                  _loc3_ = true;
                  titFuckSingle();
               }
               else
               {
                  if(get_player().cor > 60)
                  {
                     if(get_player().countCocksOfType(CockTypesEnum.HUMAN) >= 1)
                     {
                        outputText("你的肉棒散发出的浓郁气息充满鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住自己的肉棒。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 1)
                     {
                        outputText("浓烈的野兽气味充满你的鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住自己的肉棒。");
                     }
                     else if(get_player().dogCocks() >= 1)
                     {
                        outputText("你的肉棒散发出浓烈的动物气味，充满你的鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住自己的肉棒。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 1)
                     {
                        outputText("你的" + get_player().cockDescript() + "散发出的甜美气味充满鼻腔，随着一寸又一寸的触手强行挤进你的喉咙深处。你短暂地与它挣扎，努力不让它一路顶进你的胃里；而与自己的肉棒搏斗带来的快感，又让你一阵迷醉。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 1)
                     {
                        outputText("你的" + get_player().cockDescript() + "散发出的辛辣恶魔气味充满鼻腔。你把一寸又一寸被污染的肉茎强行吞进喉咙。你短暂地挣扎了一下，但你的" + get_player().cockDescript() + "很快压倒了你的抵抗，你的呕吐反射一时间仿佛消失了。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.CAT) >= 1)
                     {
                        outputText("你的肉棒散发出甜美而略带酸涩的气味，充满你的鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住那根长满细刺的肉棒。当你无视呕吐反射、把它塞得更深时，覆盖在表面的柔软棘刺竟然感觉相当舒服。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.LIZARD) >= 1)
                     {
                        outputText("你的" + get_player().cockDescript() + "散发出咸涩而干燥的气味，充满你的鼻腔。你把它一寸又一寸地塞进嘴里，尽可能吞下那根鼓胀的肉棒。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 1)
                     {
                        outputText("你带着刺痛感、混有催情成分的" + get_player().cockDescript() + "慢慢滑进喉咙。你越吞越深，喉咙也变得愈发敏感，让你愉快地发出含混的咕噜声。");
                     }
                     else if(get_player().countCocksOfType(CockTypesEnum.DISPLACER) >= 1)
                     {
                        outputText("你的肉棒散发出浓烈的动物气味，充满你的鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住自己的肉棒。");
                     }
                     else
                     {
                        outputText("你的肉棒散发出的浓郁气息充满鼻腔。你把它一寸又一寸地塞进嘴里，尽可能深喉含住自己的肉棒。");
                     }
                  }
                  _loc1_ = true;
               }
               if(get_player().canTitFuck() && get_player().biggestTitSize() > 3 && !_loc3_)
               {
                  outputText("你的双手伸向自己柔软的乳房，把它们裹在你的" + get_player().cockDescript() + "茎身周围，让你兴奋地发出含混的呻吟。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
            }
         }
         else if(int(get_player().cocks.length) == 2)
         {
            if(get_player().hasSheath())
            {
               outputText("你的手指沿着肉鞘周围游移，引得你的双根肉棒不由自主地抽搐起来。");
            }
            outputText("你每只手各握住一根[cocks]，");
            if(get_player().averageCockThickness() <= 1.8)
            {
               outputText("手指环住每一根家伙，只是这样握着自己，两根肉棒带来的感觉就几乎让你难以承受。");
            }
            else
            {
               outputText("尽可能把你的家伙们都圈进手指里用力挤压。紧握着自己粗大的双根肉棒，那感觉既美妙又令人难以招架。");
            }
            if(get_player().averageCockLength() <= 10)
            {
               outputText("你的腰胯不受控制地抽动起来，强行操弄着自己的双手。转眼间，你已经激烈地自慰起来，轮流套弄每一根肉棒；快感在根部堆积，每套弄一次都变得更加迫切。你轻轻尖叫一声，加快了自慰的节奏，渴望着释放。");
            }
            else if(get_player().averageCockLength() < 20)
            {
               outputText("你低头看向自己颤抖的肉棒，它们近在咫尺。你试探着舔了舔其中一个龟头，两根肉棒立刻都有前液渗了出来。");
               if(get_player().hasFuckableNipples())
               {
                  if(get_player().dogCocks() > 0)
                  {
                     if(get_player().hasFuckableNipples())
                     {
                        _loc3_ = true;
                        if(multiTitFuck())
                        {
                           _loc1_ = true;
                        }
                     }
                     else if(get_player().dogCocks() != int(get_player().cocks.length))
                     {
                        _loc3_ = true;
                        _loc1_ = true;
                        if(get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0)
                        {
                           titFuckSingle();
                        }
                     }
                  }
                  else
                  {
                     _loc3_ = true;
                     if(multiTitFuck())
                     {
                        _loc1_ = true;
                     }
                  }
               }
               if(get_player().canTitFuck() && !_loc3_)
               {
                  outputText("你用自己[breastcup]的奶子裹住[cocks]，把它们夹进柔软的乳丘之间。你开始用乳房慢慢为自己套弄，动作慢得令人沉醉；肉棒在丰腴的乳房间相互摩擦，舌头则在龟头上画着8字。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().canTitFuck() && get_player().mostBreastsPerRow() > 2 && !_loc3_)
               {
                  outputText("你用[breastcup]的奶子裹住你的[cocks]，把它们夹在你那" + get_player().totalBreasts() + "只乳房之间。你以令人沉醉的缓慢节奏开始用奶子给自己套弄，光滑的乳肉按摩着你的肉棒，同时你激烈地舔舐并吮吸着顶端。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，许多乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().biggestTitSize() <= 3 && !_loc3_)
               {
                  outputText("你缓缓套弄着自己，每撸几下就停下来，把从你的[cocks]渗出的缕缕先液抹遍自己的身体。随着你变得越来越湿滑、越来越欲火难耐，你逐渐加快节奏，最后开始又快又用力地抽动，并在快感中把自己的阴茎挤到一起。");
               }
            }
            else
            {
               outputText("你的[cocks]擦过脸颊，因欲望而跳动。你张开嘴，把其中一根肉棒含入口中，尽可能吞得更深，舌头沿着下侧舔过。你笑着把它吐出来，又把另一根肉棒送进嘴里。");
               if(get_player().hasFuckableNipples())
               {
                  if(get_player().dogCocks() > 0)
                  {
                     if(get_player().hasFuckableNipples())
                     {
                        _loc3_ = true;
                        if(multiTitFuck())
                        {
                           _loc1_ = true;
                        }
                     }
                     else if(get_player().dogCocks() != int(get_player().cocks.length))
                     {
                        _loc3_ = true;
                        _loc1_ = true;
                        if(get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0 || get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
                        {
                           titFuckSingle();
                        }
                     }
                  }
                  else
                  {
                     _loc3_ = true;
                     if(multiTitFuck())
                     {
                        _loc1_ = true;
                     }
                  }
               }
               if(get_player().canTitFuck() && !_loc3_)
               {
                  outputText("你用[breastcup]罩杯的乳房裹住你的[cocks]，把它们夹在柔软丰满的胸脯之间。你以令人销魂的缓慢节奏开始用乳房为自己套弄，肉棒在丰盈的乳房间彼此摩擦，同时轮流把每一根阴茎含进嘴里抽送。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().mostBreastsPerRow() > 2 && get_player().biggestTitSize() > 3 && !_loc3_)
               {
                  outputText("你用[breastcup]罩杯的乳房裹住你的[cocks]，把它们夹在你的" + get_player().totalBreasts() + "只乳房之间。你以令人销魂的缓慢节奏开始用乳房为自己套弄，光滑的乳肉按摩着你的肉棒，而你则激烈地轮流用嘴套弄每一根阴茎。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，许多乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().biggestTitSize() <= 3 && !_loc3_)
               {
                  outputText("你缓缓套弄着自己，每撸几下就停下来，把从你的[cocks]渗出的缕缕先液抹遍自己的身体。随着你变得越来越湿滑、越来越欲火难耐，你逐渐加快节奏，最后开始又快又用力地抽动，并在快感中把自己的阴茎挤到一起。");
               }
            }
         }
         else if(get_player().cockTotal() >= 3)
         {
            if(get_player().hasSheath())
            {
               outputText("你的手指沿着肉鞘周围轻轻划过，引得几根肉棒不由自主地抽搐起来。");
            }
            outputText("你每只手各握住一根[cocks]，");
            if(get_player().averageCockThickness() <= 1.8)
            {
               outputText("手指环住每一根家伙，就这么握着自己；你那" + Utils.num2Text(int(get_player().cocks.length)) + "根肉棒带来的感觉让你一阵晕乎乎的兴奋。");
            }
            else
            {
               outputText("尽可能把手指能圈住的那些家伙全都握在一起。成束的肉棒彼此摩擦的感觉难以形容，你的双眼在无法控制的快感中翻了上去。");
            }
            if(get_player().averageCockLength() <= 10)
            {
               outputText("你的腰胯不由自主地抽动起来，迫使你操弄自己的双手。转眼间，你便激烈地自慰起来，轮流套弄每一根肉棒，快感在胯间不断堆积，每一次抽动都变得更加迫切。你轻轻尖叫一声，加快自慰的节奏，急切地渴望释放。");
            }
            else if(get_player().averageCockLength() < 20)
            {
               outputText("你低头看着近在咫尺、颤抖不已的肉棒，试探着舔了舔龟头。你的几根肉棒立刻作出回应，开始渗出前液。");
               if(get_player().hasFuckableNipples())
               {
                  if(get_player().dogCocks() > 0)
                  {
                     if(get_player().hasFuckableNipples())
                     {
                        _loc3_ = true;
                        if(multiTitFuck())
                        {
                           _loc1_ = true;
                        }
                     }
                     else if(get_player().dogCocks() != int(get_player().cocks.length))
                     {
                        _loc3_ = true;
                        _loc1_ = true;
                        if((get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0 || get_player().countCocksOfType(CockTypesEnum.HORSE) > 0) && int(get_player().cocks.length) - get_player().dogCocks() == 1)
                        {
                           titFuckSingle();
                        }
                        if(int(get_player().cocks.length) - get_player().dogCocks() > 1)
                        {
                           multiTitFuck();
                        }
                     }
                  }
                  else
                  {
                     _loc3_ = true;
                     if(multiTitFuck())
                     {
                        _loc1_ = true;
                     }
                  }
               }
               if(get_player().canTitFuck() && !_loc3_)
               {
                  outputText("你用[breastcup]的奶子裹住你的[cocks]，把它们夹在柔软饱满的乳肉之间。你以令人沉醉的缓慢节奏开始用奶子给自己套弄，几根肉棒在丰腴的乳房间相互摩擦，你的舌头则在顶端舔出一个个8字形。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().mostBreastsPerRow() > 2 && get_player().biggestTitSize() > 3 && !_loc3_)
               {
                  outputText("你用[breastcup]的奶子裹住你的[cocks]，把它们夹在你那" + get_player().totalBreasts() + "只乳房之间。你以令人沉醉的缓慢节奏开始用奶子给自己套弄，光滑的乳肉按摩着你的肉棒，同时你激烈地舔舐并吮吸着顶端。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，许多乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().biggestTitSize() <= 3 && !_loc3_)
               {
                  outputText("你缓缓套弄着自己，每撸几下就停下来，把从你的[cocks]渗出的缕缕先液抹遍自己的身体。随着你变得越来越湿滑、越来越欲火难耐，你逐渐加快节奏，最后开始又快又用力地抽动，并在快感中把自己的阴茎挤到一起。");
               }
            }
            if(get_player().averageCockLength() >= 20)
            {
               outputText("你的[cocks]擦过脸颊，因欲望而跳动。你张开嘴，把其中一根肉棒含入口中，尽可能吞得更深，舌头沿着下侧舔过。你笑着把它吐出来，又把另一根肉棒送进嘴里。");
               if(get_player().hasFuckableNipples())
               {
                  if(get_player().dogCocks() > 0)
                  {
                     if(get_player().hasFuckableNipples())
                     {
                        _loc3_ = true;
                        if(multiTitFuck())
                        {
                           _loc1_ = true;
                        }
                     }
                     else if(get_player().dogCocks() != int(get_player().cocks.length))
                     {
                        _loc3_ = true;
                        _loc1_ = true;
                        if((get_player().countCocksOfType(CockTypesEnum.HUMAN) > 0 || get_player().countCocksOfType(CockTypesEnum.HORSE) > 0) && int(get_player().cocks.length) - get_player().dogCocks() == 1)
                        {
                           titFuckSingle();
                        }
                        if(int(get_player().cocks.length) - get_player().dogCocks() > 1)
                        {
                           multiTitFuck();
                        }
                     }
                  }
                  else
                  {
                     _loc3_ = true;
                     if(multiTitFuck())
                     {
                        _loc1_ = true;
                     }
                  }
               }
               if(get_player().canTitFuck() && !_loc3_)
               {
                  outputText("你用[breastcup]罩杯的乳房裹住你的[cocks]，把它们夹在柔软丰满的胸脯之间。你以令人销魂的缓慢节奏开始用乳房为自己套弄，肉棒在丰盈的乳房间彼此摩擦，同时轮流把每一根阴茎含进嘴里抽送。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().mostBreastsPerRow() > 2 && get_player().biggestTitSize() > 3 && !_loc3_)
               {
                  outputText("你用[breastcup]罩杯的乳房裹住你的[cocks]，把它们夹在你的" + get_player().totalBreasts() + "只乳房之间。你以令人销魂的缓慢节奏开始用乳房为自己套弄，光滑的乳肉按摩着你的肉棒，而你则激烈地轮流用嘴套弄每一根阴茎。");
                  if(get_player().biggestLactation() > 0)
                  {
                     outputText("你的臀部每一次挺动，许多乳头都会喷出一股股乳汁，混入早已大量覆盖在你身上的体液之中。");
                  }
               }
               if(get_player().biggestTitSize() <= 3 && !_loc3_)
               {
                  outputText("你缓缓套弄着自己，每撸几下就停下来，把从你的[cocks]渗出的缕缕先液抹遍自己的身体。随着你变得越来越湿滑、越来越欲火难耐，你逐渐加快节奏，最后开始又快又用力地抽动，并在快感中把自己的阴茎挤到一起。");
               }
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("[pg]");
            if(int(get_player().vaginas.length) == 1)
            {
               outputText("你的手在阴唇上游走，慢慢挑逗着自己，又探入更深的褶皱间，让阴蒂兴奋地露出来。");
               if(get_player().getClitLength() < 1.5)
               {
                  outputText("你在那颗敏感的小小快感点周围抚弄挑逗，同时让手指探向下方深处。");
               }
               else if(get_player().getClitLength() < 4.5)
               {
                  outputText("你硕大的阴蒂已经从你的");
                  if(get_player().vaginas[0].vaginalWetness > 0)
                  {
                     outputText("湿亮的");
                  }
                  outputText("唇瓣间探了出来。你轻柔地抚摸、拨弄它，直到它膨胀得像一根小小的阴茎。");
               }
               else
               {
                  outputText("你那根阴茎般大小的阴蒂已经完全充血，敏感得令人沉醉。你轻轻碰触它，喉间不由得溢出一声低吟。");
               }
               _loc4_ = get_player().vaginas[0].vaginalWetness;
               if(_loc4_ == 0)
               {
                  outputText("你相对干涩的小穴让你有些费力，但你放慢动作，仍然温柔而愉悦地自慰起来。");
               }
               else if(_loc4_ == 1)
               {
                  outputText("你发情的小穴渴求着抚慰，而你也顺从了它，将手指探入湿润的蜜穴中，激烈地自慰起来。");
               }
               else if(_loc4_ == 2)
               {
                  outputText("胯间湿润的裂缝索求着你的全部注意力，牵引着你的手指深深探入其中，探索那条湿热的通道。");
               }
               else if(_loc4_ == 3)
               {
                  outputText("你滑腻小穴里闷热的欲火渴望被什么填满，而你也顺从了它，将手指探入自己湿滑的小穴。");
               }
               else if(_loc4_ == 4)
               {
                  outputText("温热的湿意顺着你的双腿成股流下，从你的[vagina]中汩汩涌出。你羞怯地笑了笑，沿着已经湿滑的双腿向上抚到阴唇，将它们分开，让手指探入湿润的甬道。");
               }
               else
               {
                  outputText("雌性情欲的浓烈气味弥漫在空气中，你那滚烫的私处把淫液淋得到处都是。手指自行探入体内时，你惊讶地喘息出声，随即激烈地指奸着自己的甬道，每一次插入都挤出一股股淫液。");
               }
            }
         }
         orgazmo(_loc1_,_loc3_);
         outputText("[pg]");
         if(int(get_player().cocks.length) > 0)
         {
            if(int(get_player().cocks.length) == 1)
            {
               if(get_player().get_lib100() < 30)
               {
                  outputText("你很快就疲惫地睡着了。");
               }
               else if(get_player().get_lib100() < 55)
               {
                  outputText("你翻了个身，开始打起盹来，半勃起的" + get_player().cockDescript() + "在身上晃荡。");
               }
               else if(get_player().get_lib100() <= 80)
               {
                  outputText("当你闭上眼放松下来时，你的" + get_player().cockDescript() + "又重新硬挺起来，保证");
                  if(get_player().cor < 50)
                  {
                     outputText("你的梦里满是性爱。");
                  }
                  else
                  {
                     outputText("你沉入一场堕落而变态的淫梦。");
                  }
               }
               else
               {
                  outputText("你呻吟着渐渐睡去，硬挺的" + get_player().cockDescript() + "因持续不断的欲望而跳动、抽 throbbing。");
               }
            }
            else if(get_player().get_lib100() < 30)
            {
               outputText("你很快就疲惫地睡着了。");
            }
            else if(get_player().get_lib100() < 55)
            {
               outputText("你翻了个身，开始打一个小时的盹，半勃起的肉棒在身上晃荡。");
            }
            else if(get_player().get_lib100() <= 80)
            {
               outputText("当你闭上眼放松下来时，你的肉棒又重新硬挺起来，保证");
               if(get_player().cor < 50)
               {
                  outputText("你的梦里满是性爱。");
               }
               else
               {
                  outputText("你沉入一场堕落而变态的淫梦。");
               }
            }
            else
            {
               outputText("你呻吟着陷入短暂的小睡，硬挺的勃起因持续不断的欲望而跳动、悸动。");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你轻轻叹了口气，带着性爱后的气味陷入短暂小睡。");
         }
         else
         {
            outputText("你叹了口气，渐渐睡去。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lickYerGirlParts() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         get_images().showImage("masti-lick-girl");
         if(!get_player().hasPerk(PerkLib.Flexibility))
         {
            outputText("你脱下[armor]，在地上坐下。你张开双腿，低头看着自己的性器。它渴望的不只是你的手指，而你也渴望尝尝从里面流出来的淫液。一个关于猫的极其下流的念头闪过脑海，让你脸上浮现出顽皮的笑容。你侧躺下来，张开双腿，让自己能清楚看见自己的" + get_player().vaginaDescript() + " 你低下头凑向那快感之穴，却在半路停住了。你伸出舌头，试图再多够出几寸，但这除了让你的饥渴和欲望更强之外毫无用处，一滴温热的唾液落在你的[vagina]上。你徒劳地伸长舌头、扭动身体，想要尝到自己湿淋淋的小穴，渴望舌尖抚过阴唇、探入深处的感觉……可惜就是够不着。你重新坐起身，既挫败，又比刚才更加兴奋。");
            dynStats(DynStat.Lust(15));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,67,FlagDict_Impl_.arrayReadInt(_loc1_,67) + 1);
            outputText("你脱下[armor]，在地上坐下。你张开双腿，低头看着自己的性器。它渴望的不只是你的手指，而你也渴望尝尝从里面流出来的淫液。一个极其下流的念头闪过脑海，让你脸上露出笑容。你侧躺下来，再次张开双腿，让自己能清楚看见自己的" + get_player().vaginaDescript() + "。你吐着舌头低下头，一点点靠近自己的小穴，感受着阴部的热气拂上脸颊，而你灼热的呼吸也把暖意回送过去。只差一点就能尝到了，可你的身体已经弯不下去。你的小穴几乎能感觉到舌头就在几厘米外蠕动着，滑腻、温热又湿润。你把头缩回来，挫败地叹了口气，这才想起村里的猫是怎么够到那些难以触及的地方的：它们会把一条腿高高伸直。你照着它们的样子，把一条腿直指天空，闭上眼睛猛地低下头。你慢慢睁开一只眼，发现自己正和自己的[vagina]面对面；你惊讶地发现自己居然真的做到了。你开始用舌头上下舔弄那淫荡的小穴。[pg]");
            outputText("那感觉美妙极了，你的舌尖掠过自己肿胀的" + get_player().clitDescript() + "。汁液从湿润的穴口渗出，让你的嘴里充满了女性淫液的甜味。你的舌头探入[vagina]深处时，能感觉到整个性器都在舌头周围跳动、悸动。你的呻吟和快感尖叫带来的震颤让感觉变得更加强烈，使你成了自己欲望的奴隶。你试图吞下每一滴淫液，可汁水仍沿着下巴流淌。你伸长脖子，好让自己更深入地探入那渴求的蜜穴。舌头顶进小穴、吸吮着汁液时，你能感觉自己正围着舌头收紧，慢慢逼近顶点。你用力舔舐并吸吮[clit]周围，同时用双手把小穴掰得更开。你的头像猫梳理自己毛发时那样上下移动。你持续舔弄、挑逗，直到感觉身体绷紧，已经准备要高潮了。[pg]");
            outputText("你用嘴覆住整个小穴，向里面吹入一股热气；刹那间，一阵强烈而淫靡的感觉席卷全身。你的小穴紧紧夹住舌头，汁液喷得满脸都是。你竭尽全力想全都接进嘴里，却发现很难做到；这场由你自己带来的美妙高潮让全身不受控制地颤抖，令你难以接住自己的女性淫液。终于，高潮渐渐平息，你带着自豪吞下自己的汁液，放松地叹了口气。你仍躺在地上，舔过嘴唇，品味着自己独特的味道，并发出一声满足的叹息。你现在很想打个猫盹。");
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,67,FlagDict_Impl_.arrayReadInt(_loc1_,67) + 1);
            outputText("你迅速脱下[armor]，两张嘴都因期待彼此而流着口水。你要先做些伸展，好让自己的舌活更加灵巧。你站直身体，分开双腿，然后向后仰，把[vagina]向前挺出。保持片刻后，你换了个姿势，把" + get_player().allBreastsDescript() + "向前倾，将" + get_player().assDescript() + "撅出来给所有人看。你前后交替弯身，看起来就像是在对荒野中某个未知的生物挑逗地挺动，告诉对方你已经准备好被干了。很快，你的脊背变得相当柔软——接下来该活动双腿了。你再次站直，抬起一边膝盖抱到胸前，压在" + get_player().allBreastsDescript() + "上。这让它稍微放松了些，但你知道自己还能更加柔韧。你用双手托住那条腿的下方，然后把剩下的腿也抬高，让脚尖指向天空。你慢慢把手从腿上拿开，惊讶地发现自己竟然能让它自己保持在那里。赤裸着摆出这个姿势，让你的玩乐穴完全暴露在空气中，你感觉一阵凉风拂过湿淋淋的性器。它随之颤抖，让你因那感觉而轻声呻吟。你的腿已经和脊背一样柔软，于是你换到另一条腿。你立刻把另一条腿甩到头旁，根本不需要用手帮忙就能把脚踝勾到耳后。你保持这个姿势几分钟，小穴已经滴着淫液，急切地等着你亲吻它。很快你把腿放下；现在你的背、腿，甚至那胀痛的淫穴都已经拉伸开了。你在躺到铺盖上时又快速活动了一下下巴。你把一条腿甩过头顶，轻松地低下头，凑向另一对唇瓣。[pg]");
            outputText("你的" + get_player().vaginaDescript() + "现在就在脸前，你忍不住伸舌舔了一下。那感觉美妙极了，你的舌尖掠过自己肿胀的" + get_player().clitDescript() + "。汁液从湿润的穴口渗出，让你的嘴里充满了女性淫液的甜味。你的舌头探入[vagina]深处时，能感觉到整个性器都在舌头周围跳动、悸动。你的呻吟和快感尖叫带来的震颤让感觉变得更加强烈，使你成了自己欲望的奴隶。你试图吞下每一滴淫液，可汁水仍沿着下巴流淌。你伸长脖子，好让自己更深入地探入那渴求的蜜穴。舌头顶进小穴、吸吮着所有汁液时，你能感觉自己正围着舌头收紧，慢慢逼近顶点。你用力舔舐并吸吮[clit]周围，同时用双手把小穴掰得更开。你的头像猫梳理自己毛发时那样上下移动。你持续舔弄、挑逗，直到感觉身体绷紧，已经准备要高潮了。[pg]");
            outputText("你每一秒都舔得更用力、更快速，越来越接近尝到即将从体内喷出的女性淫液。你感觉饥渴的性器最后一次围着舌头收紧，随后便把甜美的蜜液释放进你渴求的口中。你尽可能大口吞咽，但还是有些漏到了[face]上。你把舌头伸进滑腻的小穴里，逗弄出最后几滴精液。你的舌头再次探索深处，在[vagina]内壁四处摸索，搜集任何可能还没流出来的东西。你让舌头在里面扭动了一会儿，直到确信自己已经得到了大部分女性淫液。你从自己的性器上移开，放松地摊在铺盖上，发出一声叹息，就像刚一口气喝光了一整壶麦酒。你伸展四肢，蜷起身子，准备打个猫盹。");
         }
         updateMasturbation();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function layEggsInYerTits() : void
      {
         clearOutput();
         get_images().showImage("masti-eggs-in-tits");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 2 && get_player().statusEffectv2(StatusEffects.Exgartuan) == 0)
         {
            outputText("你对自己露出恶作剧般的笑容，低头看向被附身的[chest]，告诉埃克斯加图安，你有件非常想为她做的事。");
            outputText("[pg][say: 喂，婊子，我知道你在打什么主意。你以为你能随便把卵产进我身体里？嗯……我为你骄傲，这才是这对宏伟奶子应得的关注。]");
            outputText("[pg]你那恶作剧般的笑容变成了困惑，因为你分明感觉到，如果埃克斯加图安有指关节可以掰响、有骨节可以活动，她现在一定已经这么做了。当然，你的[chest]那种诡异的晃动也确实暗示着某种活动正在发生。");
            outputText("[pg][say: 好吧。你确定要这么做？不，我逗你玩的，你现在非做不可了。]");
            outputText("[pg]埃克斯加图安的热情无穷无尽，她的欲望也像磁石一样牵引着你。你发现自己的双手不受控制地揉捏起胸脯，而埃克斯加图安显然乐在其中。没过多久，埃克斯加图安就把你挑逗得足够兴奋，产卵管也从鞘中探出，如今垂在你的身下。意识到接下来的操作再怎么说都会很麻烦，埃克斯加图安便把全部重量猛地甩向一侧，你立刻翻倒在地。你开始纳闷，明明是你想占她便宜，怎么反倒被埃克斯加图安掌控了局面，可你又突然发现自己重新控制住了双臂。");
            outputText("[pg]你知道该怎么做，于是用一只手肘撑起身体，同时继续爱抚、取悦那对被附身的大奶子；逗弄[nipple]会让埃克斯加图安微微发颤。你的另一只手滑到[legs]之间，同时尽可能把腹部向内收紧。你握住产卵管，开始把它往上拉向你的[chest][if (cocks > 0) {，越过你的}][if (cocks > 2) {那片}][if (cocks > 0) {肉棒}][if (cocks > 1) {群}]。");
            outputText("[pg]突然，埃克斯加图安从那只没有被挤压的[nipple]里嚷了起来，[say: 等等，勇者，就这么一根管子可不够。]");
            outputText("[pg]你的手不由自主地把产卵管牵引到你的[chest]之间。埃克斯加图安开始念起一种古怪的咒文，虽然实际上并没有声音，但你能在[chest]里感觉到它，使它们随之震颤[if (isLactating) {，乳汁也随之喷出}]。然后，疼痛开始了。");
            outputText("[pg]等你再次有所察觉时，发现双手又能动了，于是把产卵管从藏匿处拉了出来。你在心里纠正自己：是产卵管们。更准确地说，在你的产卵管根部附近，它从同一根主干分成了两条管柱。埃克斯加图安的目的已经再清楚不过了，于是你把两个尖端分别抵在两枚[nipple]上。");
            outputText("[pg][say: 行了，贱货，我已经给这些大家伙腾出地方了，现在你要让我当妈妈。好好伺候我，说不定哪天我还会让你保留这根双管呢。]");
            outputText("[pg]埃克斯加图安难道真的很享受怀孕这个念头吗？你并不完全明白这个恶魔是怎么运作的，只知道她牢牢盘踞在你的[chest]里。埃克斯加图安开始撑开你的……她的——管它呢——[nipples]，而你将产卵管的尖端刺入其中，双膝紧紧蜷向胸前，把产卵管推入你的[fullChest]……她体内。");
            outputText("[pg]因为种种原因，把产卵管插进自己体内的感觉不只是美妙，埃克斯加图安更是几乎沉醉其中。润滑液刚涌出[if (isLactating) {，并将乳汁从管子边缘挤出来}]，你的卵便开始顺着产卵管下行。你猜埃克斯加图安又重新集中起了精神，因为你的[chest]变得稍微更挺翘，也更不受重力影响了。[pg]");
            outputText("第一枚卵沿着其中一根管子滑下，紧随其后的那枚则进了另一根。一开始你还为此惊叹，但很快便意识到，是埃克斯加图安亲自强行维持着这种对称。之后你会私下猜想，如果埃克斯加图安能把此刻投入的这股劲用在人生其他方面，你们两个早就比现在强得多了；但那不是现在该想的事。现在，是第一枚卵抵达你[nipple]的时刻。");
            outputText("[pg]你用力了一下，它便开始挤进[nipple]里。被撑开的感觉让你愉悦地呻吟出声，而你的[chest]也因其独有的快感而颤抖。你先稍稍拖延了一瞬，等另一枚卵也开始不依不饶地压向你[chest]另一侧时，才让它们同时进入。");
            outputText("[pg]你得到的回报，是一场由你与埃克斯加图安共同分享的、尖锐而强烈的高潮。那快感随后化作一波波余韵，而卵仍不可阻挡地继续挤入你的[chest]。你能看见卵的轮廓开始使你胸前柔软宽阔的部分变形；要不是埃克斯加图安比你更清楚你乳房里发生了什么，你恐怕真会担心起来。");
            outputText("[pg]事实上，埃克斯加图安压制住了你可能做出的所有动作和抗议，只让你臣服于她此刻的感受。你意识到，除了产下卵时那种欣快的释放，以及正在你[chest]中上演的双重人格高潮之外，你几乎什么都感觉不到。");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("你的几根肉棒虽然仍然挺立着，却只是把精液滴滴答答地淌在你的乳房和管子上，完全没有平时那种力道和冲劲。");
            }
            else if(int(get_player().cocks.length) == 1)
            {
               outputText("你的[cock]虽然仍然挺立着，却只是把精液滴滴答答地淌在你的乳房和管子上，完全没有平时高潮时的力道和冲劲。");
            }
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]让黏稠的液体沿着大腿缓缓流出；你只能从[legs]上湿漉漉的触感察觉到这一点。感觉棒极了！");
            }
            outputText("[pg]卵的涌出很快便结束了，你的乳房感觉像是因为孩子们的圆卵而大了好几个罩杯，至少重量上是如此。你怀着轻柔的敬畏，将产卵管从[nipples]中抽出——既敬畏这份欣快，也敬畏埃克斯加图安。");
            outputText("[pg]埃克斯加图安的声音似乎低沉了许多，也稍显闷闷的，她说道：[say: 即使按我的标准来看，那也是一次挺有意思的体验。我不会让你随时都能用这套双产卵管，所以我就先收回来了。]");
            outputText("[pg]你的双手自动把产卵管拉到两乳之间，而它重新融合回自身的过程远没有分裂时那么痛。随着产卵管缩回你的腹部，你也放松下来。");
            outputText("[pg][say: 你知道吗，我觉得你和我真的可以相处得不错，只要你继续像这样好好对我。] 你脑中闪过一个念头：所谓“像这样”，本质上就是对她的心血来潮近乎崇拜般地服从。[say: 现在睡吧，我需要一点时间适应。]");
            outputText("[pg]你也赞同这个提议，毕竟这番折腾已经让你疲惫到做不了别的事。你昏倒在自己体液汇成的一滩里，差不多一个小时后才醒来。");
         }
         else
         {
            outputText("既然已经决定屈服于更原始的欲望，你也看不出有什么理由不干脆一边解决所有问题，一边产下那些一直让你不堪重负的圆卵。开始之前，你环顾了一下四周，[if (corruption < 50) {担心自己可能会被人看见。}][if (corruption > 50) {反倒希望能找到一个对象，好让你把负担卸到对方身上。}]");
            outputText("[pg]确认不会有人打扰后，你迅速脱下[armor]，侧身靠在一块舒适的岩石旁躺下。你已经想明白了：仰躺会让产卵管别扭地扭曲，四肢着地又会让你的卵承担风险。你的[chest]柔软地压在身旁的腐殖土上，而你开始挑逗并撑开自己的[nipples]，为这个疯狂的计划做准备。");
            outputText("[pg]随着对重头戏的期待不断高涨，你扭曲的身体很快便对自己的抚弄起了反应。[if (cocks > 1) {你的几根肉棒开始}][if (cocks = 1) {你的肉棒开始}][if (cocks > 0) {变硬，并朝着你的[chest]挺起；那里对雄性器官而言简直是一片应许之地，但今天这并不是你关心的重点。}]");
            if(get_player().hasVagina())
            {
               if(get_player().balls > 0)
               {
                  outputText("在你的[balls]后方，你");
               }
               else
               {
                  outputText("你");
               }
               outputText("的[vagina]开始悄然滴液，微微张开；你不禁希望自己足够柔软，能把卵种进里面。");
            }
            outputText("[pg]终于，你的产卵管开始从藏身处探出头来。你一把抓住它，飞快地套弄着，催促它进一步伸长。接着，你把腹部紧紧贴向自己，将它从你的[legs]之间拉过来，[if (cocks > 0) {越过你的男性器官}]一路拉到你的[chest]。");
            outputText("[pg]你用空着的手把[nipple]用力撑开，撑得又宽又痛，然后把产卵管的尖端挤了进去，同时将产卵管拉伸到极限。你懊恼地叹了口气，弓起身子，试图让它再长一些，却无意间把产卵管推进了自己的[nipple]里。你抽搐了一下，[if (isLactating) {乳汁和}]");
            if(get_player().canOvipositBee())
            {
               outputText("蜜液");
            }
            else
            {
               outputText("绿色液体");
            }
            outputText("在这突如其来的插入压力下从你体内喷溅而出。");
            outputText("[pg]被性欲的欢愉彻底淹没，你开始猛地弓折身体，将产卵管从尖端一路顶进乳房深处。你用一只手稳住一切，另一只手则开始把玩空着的[nipple]。[if (cocks > 0) {[EachCock]完全硬挺起来，迫使你停下片刻调整姿势，最后只能改用空着的手套弄[oneCock]。}]");
            if(get_player().hasVagina())
            {
               outputText("与此同时，你的[vagina]已经完全张开，开始把淫液");
               if(get_player().wetness() >= 4)
               {
                  outputText("大量地");
               }
               outputText("滴落到你的[legs]和腹部上。");
            }
            outputText("[pg]你的产卵管已经开始履行它的任务。你能看到圆鼓鼓的隆起正沿着管道一路向上。当前头的那一枚即将抵达终点时，你把身体紧紧弓起，将产卵管尽可能深地顶进自己的胸口。鼓胀的异物把你的[nipple]撑得更开，带来令人愉悦的酸痛；就在卵从产卵管尖端弹出的瞬间，一阵低沉而温柔的高潮从你的[chest]向全身扩散开来。");
            if(get_player().eggs() < 20)
            {
               outputText("[pg]你带着满足的余韵，让卵一枚接一枚进入体内。每一次都像浪潮般冲击你的意识，缓慢地侵蚀着你的理智，直到你的乳房开始感到些许不适。你又让一枚卵通过，随后抽出产卵管，引发了一小股[if (isLactating) {乳汁和}]");
               if(get_player().canOvipositBee())
               {
                  outputText("蜜液");
               }
               else
               {
                  outputText("黏液");
               }
               outputText("的爆发。你迅速把它插进另一侧乳房，让产卵继续。你忽然意识到自己的处境，于是捏住先前那侧的[nipple]，不让它张开。");
               if(get_player().hasCock())
               {
                  outputText("与此同时，你的[chest]和产卵管正因你绵长的快感而缓缓覆上一层白浊。");
               }
               outputText("[pg]最终，管道里再也没有卵滑下。你满足地叹了口气，松开产卵管，同时紧紧抱住自己的[chest]，防止卵逃出来，随后便昏睡过去，直到这一小时结束。");
            }
            else if(get_player().eggs() < 40)
            {
               outputText("[pg]随着卵每一次转移都带来阵阵高潮般的浪潮，你的[chest]开始发麻，心跳也越来越快。你的乳房很快变得满胀，而腹部才刚刚开始瘪下去。你既担忧又渴望榨出最后一枚卵，于是一直握着产卵管，直到再也塞不下任何卵为止。那只装满卵的乳房已经明显膨胀变大；在拔出产卵管后，你不得不捏紧自己的[nipple]，把卵留在里面。[if (isLactating) {在巨大的压力下，乳汁不断从你的[nipple]里流出。}]");
               outputText("[pg]你把手臂紧紧压在刚被装满卵的乳房上，用那只手撑开另一侧[nipple]，好把产卵管插进去。在持续不断的快感冲击下，你开始咯咯发笑[if (cocks > 0) {，而你的乳房和产卵管早已被不断流出的精液遮住了本来的颜色，精液甚至已经开始在你身下积成一滩}]。很快，第二只乳房也开始胀得难受；而你也不是第一次开始担心，自己这样做到底明不明智。");
               outputText("[pg]终于，你的卵囊再也没有东西能送进你的[chest]里了。你拔出那截正在萎缩的器官，想看着它缩回去，可你刚刚胀大的[chest][if (cocks > 0) {和逐渐疲软的勃起肉棒}][if (cocks > 1) {们}]挡住了视线。你花了好一阵子抚摸自己肿胀的[chest]，里面的圆卵让表面微微凹凸不平；而这漫长的片刻仿佛被拉成永恒，直到你昏了过去。");
            }
            else
            {
               outputText("[pg]随着每一次输送，卵都带来一波波高潮般的快感，你的[chest]开始发麻，心跳也越来越快。你的乳房迅速变得胀满，而腹部甚至还没开始消下去。怀着一半担忧、一半不愿放过最后一颗卵的急切，你继续按住产卵管，直到再也塞不进任何卵为止。那只装满卵的乳房已经膨胀了许多，拔出产卵管后，你不得不捏紧自己的[nipple]，免得里面的卵漏出来。[if (isLactating) { 在强烈的压力下，乳汁不断从你的[nipple]里流出。}]");
               outputText("[pg]你用手臂紧紧压住刚被塞满卵的那只乳房，又用同一只手撑开另一边的[nipple]，好把产卵管插进去。在持续不断的狂喜冲击下，你开始咯咯地笑起来[if (cocks > 0) {，而你的乳房和产卵管早就被自己源源不断射出的精液盖住了原本的颜色，那些精液已经在你身下积成一滩}]。很快，第二只乳房也被卵彻底塞满，而你已经不止一次开始怀疑，这么做到底是不是明智之举。");
               if(get_player().bRows() > 1)
               {
                  outputText("[pg]你迅速换到另一个[nipple]，接着又换下一个，直到最后，你的卵囊再也没有东西能送进你的[chest]里了。你拔出那截正在萎缩的器官，想看着它缩回去，可你刚刚胀大的[chest]让你根本看不见。你花了好一阵子抚摸自己肿胀的[chest]，里面的圆卵让表面微微凹凸不平；而这漫长的片刻仿佛被拉成永恒，直到你昏了过去。");
               }
               else
               {
                  outputText("[pg]你意识到自己根本没办法把卵全部产完，于是发出一声半是高潮、半是懊恼的呻吟。无处可产的现实切断了产卵时那种美妙的感觉。随后，你明白了自己必须怎么做。");
               }
               if(get_player().bRows() < 2)
               {
                  outputText("[pg]拔出产卵管后，你盯着那根搏动的器官看了片刻；没有一个温暖舒适的孔洞，它甚至连卵都不再往外送。你感觉自己被困住了，卡在高潮边缘，一颗卵还半截停在管子里。最终，欲望和绝望再次压过了你的理智，你为自己的产卵管张大了嘴。立刻，先前堵在里面的产卵管润滑液涌进你的喉咙，顺着食道流下去，你的口腔和咽喉也开始产生异样的感觉。");
                  outputText("[pg]卵很快重新开始前进，这一次是朝着你的喉咙而去。没过多久，那颗卵就顶到了你的牙齿，新的问题随之出现——它太大了。挫败的泪水开始涌出，紧接着，你突然感觉产卵管剧烈痉挛了一下，那颗卵伴随着你下巴可怕的咔哒声被硬生生挤过牙关，随后你的嘴就保持着新近被撑开的状态合不拢。你开始慌了起来，因为你意识到，如果那颗卵连你的下颌都难以通过，就更不可能吞下去；可它还是滑进了你的喉咙。你这才明白，整个结构都已经被麻痹并拓宽，以适应你的需求。");
                  outputText("[pg]当最后一颗卵进入产卵管、开始它的旅程时，就连你的胃也已经胀得难受。等它一滑进你的食道，伴随着最后一次高潮，一股巨大的解脱感席卷了你。你抱着自己肿胀的肚子和[chest]昏了过去。");
               }
            }
         }
         if(!get_player().hasStatusEffect(StatusEffects.Eggchest))
         {
            get_player().createStatusEffect(StatusEffects.Eggchest,3 + Utils.rand(10),1 + Utils.rand(4),0,0);
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         get_player().dumpEggs();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hungerRub() : void
      {
         clearOutput();
         outputText("需求啃噬着你，但你饿得几乎没法正常思考，更别提理清自己的欲望了。你的脑袋阵阵作痛，眼皮沉重得睁不开，只想好好休息，从这场清醒的噩梦中解脱出来；可每当你甚至刚要忘掉它，胃里就会突然爆发出刀刺般的疼痛。你根本不知道自己在这种状态下还能不能取悦自己。可你也不能再无视眼下的状况，否则迟早会付出代价。出于某种原因，你此刻这种古怪而半昏沉的心境，竟然又莫名让人兴奋。");
         outputText("[pg]你头昏脑涨地溜进自己的[cabin]，混乱的脑子在路上完全无法集中注意力。等你终于进到里面时，几乎当场倒下。你颤抖的[hands]几乎连[armor]都脱不下来；你踉跄向前时，[skinshort]上满是冷汗。你用尽最后一点力气，把自己挪到[bed]上，随后瘫倒下去。然而这个动作反而让你的眩晕更加严重，过了好一会儿你才重新辨清周围。");
         outputText("[pg]腹部的绞痛和脑中的搏动始终纠缠着你，但你眼下对此无能为力，只能在痛苦中扭动。你咬住嘴唇，心想不管是什么都比这样好。发烫的身体在催促你做点什么，可你的四肢酸软无力，甚至不确定自己还能不能再站起来。尽管如此，哪怕身体如此不适，你的[genitalis]已经[if (hascock) {[if (hasvagina) {蠢动起来|硬了起来}]|湿润起来}]，于是你开始了。");
         outputText("[pg]你试探着把手伸向自己的[if (hascock) {[cock]|[vagina]}]，刚一碰到，就像被电了一下。看来你的绝望正放大着你[if (sens > 70) {本就很高的}]敏感度。你稍稍放轻力道，慢慢探索自己的[genitals]，试图从这痛苦的状态中找到一丝分心的慰藉。");
         outputText("[pg]然而无论你多么努力，都无法摆脱它。它吞噬你、灼烧你，占据你脑中的每一个念头，直到你只剩下渴求，喘息不止，手指狂热地[if (hascock) {在肉棒上上下套动|在褶缝间进进出出}]。可即便被这种沉重的不适压迫着，在持续取悦自己的过程中，你仍感到一股不断膨胀的兴奋开始浮现。于是你已别无选择，只能向它屈服，拥抱体内翻涌的一切感受。");
         outputText("[pg]谵妄开始攫住你。你的腹肌痉挛般绷紧，肠胃深处灼人的疼痛与核心处攀升的快感融为一体，化作一种近乎崇高的感觉，把你送上你从未想象过的高度。全身每一根神经都被点燃时，你的视野渐渐发黑，周围的[cabin]也逐渐淡去，你的世界只剩下拉扯着你的这两种极端。你本能地蜷缩起来，发热的[hand]更加卖力，疯狂揉搓着所有最敏感的部位，可你已经不再意识到自己的动作。临近终点时，你把注意力集中在[if (hascock) {龟头|阴蒂}]上，一点点把自己推向崩溃的边缘，直到几乎无法承受。");
         outputText("[pg]伴随着一声嘶哑的叫喊，你达到了高潮，用浪费掉的[if (hascock) {精种|淫液}]弄脏了[bed]。高潮撕裂般贯穿你全身，绷紧你存在的每一根纤维；你的肌肉僵硬收缩，意识也几乎在压力下爆裂。你只能支离破碎地躺在那里，任由周围的世界慢慢恢复成可以辨认的模样。然而，当你终于再次清醒过来、在激情退去后瑟瑟发抖时，你最先感觉到的，是一种沉闷的全身酸痛，而你只觉得比之前更加空虚。");
         get_player().orgasm(get_player().hasCock() ? "Dick" : "Vaginal");
         updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gildedCockTurbate() : void
      {
         clearOutput();
         var _loc1_:int = 0;
         while(_loc1_ < int(get_player().cocks.length))
         {
            if(get_player().cocks[_loc1_].sock == "gilded")
            {
               break;
            }
            _loc1_++;
         }
         var _loc2_:int = _loc1_ + 1;
         while(_loc2_ < int(get_player().cocks.length))
         {
            if(get_player().cocks[_loc2_].sock == "gilded" && get_player().cocks[_loc2_].cArea() > get_player().cocks[_loc1_].cArea())
            {
               _loc1_ = _loc2_;
            }
            _loc2_++;
         }
         outputText("你脱下衣物，轻轻打了个寒颤。你咬住嘴唇低头看去，这才意识到，尽管天气暖和，套在你鸡巴上的闪亮金属套筒却是凉的，甚至有些冰冷。");
         outputText("[pg]光线落在金色鸡巴套上，向四周散射开来。你咧嘴一笑，伸手握住它，拇指摩挲着套鞘光滑的顶部，手指则蹭过下方紧绷的皮绳。你的鸡巴在鸡巴套的金属内壁间胀大；尽管你显然越来越热，那闪亮的套鞘摸起来依旧冰凉。[pg]");
         get_images().showImage("masti-cocksock");
         outputText("你的手指轻松滑过光滑的金属织物，开始自慰。随着你的动作越来越快，金色套鞘沿着你的肉茎上下移动。金色外壳隔绝了你熟悉的手感，反倒像是某个急切的陌生人在抚弄你的鸡巴。");
         if(get_player().cocks[_loc1_].cArea() < 6)
         {
            outputText("被阴茎套包裹着，你几乎看不到自己那根小鸡巴的顶端，只有每次向下撸动时，龟头才会探出来。金属套筒圆润的边缘凉爽而光滑，令人发狂地摩擦着你的龟头。");
         }
         else if(get_player().cocks[_loc1_].cArea() < 20)
         {
            outputText("你的龟头抵在阴茎套的边缘，每一次撸动都会撞上去。以你的粗度来说，这个阴茎套正好合身；你上下套弄时，它每次上拉都会牵扯着你的阴茎，轻轻拉伸着你的鸡巴。");
         }
         else
         {
            outputText("金属外壳紧紧夹在你的阴茎上，看起来更像是一只巨大的阴茎环。金色护套反倒让你能更好地握住这根巨物，在你滚烫的肉棒周围形成一圈冰凉的触感。");
         }
         outputText("[pg]压力不断积聚，快感的颤栗掠过你的全身，你的动作也越来越快。你发出一声轻轻的呻吟，将阴茎套筒沿着你的" + get_player().cockDescript(_loc1_) + "上下套动。你的阴茎在套筒的束缚中胀大，隔着金属护套一阵阵跳动。高潮来临时，你浑身一颤，背脊弓起，足足" + Math.round(get_player().cumQ()) + "毫升精液高高射向头顶的空中。");
         outputText("[pg]你喘着气，看着那道精液在空中闪闪发亮，被金色阴茎套的光芒映照着。它在光中凝成珠滴、扭转形状，逐渐结晶。随后，");
         if(get_player().cumQ() < 25)
         {
            outputText("零星几颗");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("一阵");
         }
         else
         {
            outputText("如洪流般的");
         }
         outputText("宝石代替精液落在你身上，从你的[skinfurscales]上弹开。");
         var _loc3_:int = midasCockJackingGemsRoll();
         outputText("[pg]<b>你勉强还保持着足够的清醒，在倒头小睡之前，把射出的" + Utils.num2Text(_loc3_) + "颗宝石收集了起来。</b>");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         var _loc4_:Player = get_player();
         _loc4_.set_gems(_loc4_.get_gems() + _loc3_);
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,899,FlagDict_Impl_.arrayReadInt(_loc5_,899) + 1);
         statScreenRefresh();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getHugeEggsInCawk() : void
      {
         clearOutput();
         get_images().showImage("masti-cock-eggs");
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && get_player().statusEffectv2(StatusEffects.Exgartuan) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,593) == 0)
         {
            outputText("你决定是时候找点乐子了。");
            outputText("[pg]脱下你的[armor]，你安顿下来");
            if(get_player().cor < 33)
            {
               outputText("在你的睡袋里");
               if(get_camp().hasCompanions())
               {
                  outputText("，希望你的某个同伴能看到");
               }
            }
            else if(get_player().cor < 66)
            {
               outputText("躲到一块岩石后面，遮住自己的视线，至少声音可遮不住");
            }
            else
            {
               outputText("到营地外的荒原上，离开视线，也不去想别的");
            }
            outputText("，好好处理一下你那些天赋异禀的部位。");
            outputText("[pg]你仰躺着伸手握住自己的[cock biggest]，开始用双手抚弄它的长柄，惊叹于它的尺寸。你能感觉到埃克斯加图安在体内蠢蠢欲动，终于准备好、也迫不及待地想来点动作。与此同时，你还能感觉到虫蜂半身里的卵正在挪动，让你的欲火进一步苏醒；一个有趣的念头也随之浮现在脑海。你绷紧那些自己仍只能勉强控制的肌肉，虽然很费劲，但你还是设法把腹部向上卷起，让尾针指向自己的阳具。也正是在这一刻，埃克斯加图安似乎意识到有些不对劲。");
            outputText("[pg][say:呃？勇者……把那玩意儿拿离我远点。]");
            outputText("[pg]你咧嘴一笑，绷紧肌肉，尾针旁的裂口随之张开；你的产卵管顺畅地滑了出来，那根原本软塌的管子随着你脑海中涌动的淫乱幻想而变硬，你的欲望也愈发高涨。你伸手握住自己的[cockHead 1]，把它弯向产卵管，打算让两者贴合在一起，看看你是否真的能把卵产进自己那根巨大的阳具里。");
            outputText("[pg]你体内的恶魔意识到发生了什么，而且完全不想掺和，便开始反抗。于是，一场争夺你身体控制权的斗争就此展开：他一边试图把你的[cock 1]从你的蜂形半身旁拽开，一边用自己的魔力和你的手刺激你的肉棒，好让你射出来，反正也就没必要再继续了。你");
            if(get_game().shouldraFollower.followerShouldra())
            {
               outputText("，在舒尔德拉的帮助下，");
            }
            outputText("设法与他抗衡，让你的阴茎稳稳留在原处。趁他的注意力被分散，你得以把产卵管直接降到龟头尖端；随着一阵绷紧和猛推，你终于成功把它硬塞了进去。");
            outputText("[pg]你感觉自己的裂口被撑开，那感觉与你经历过的任何事都截然不同——你同时成了被插入者与插入者。一声淫荡的呻吟从你肺里滚出，纯粹的快感让你的背脊弓起；一枚卵不受控制地试图向下挤进你的阴茎里，把那道裂口撑得更开。");
            outputText("[pg][say:这不可能！]");
            outputText("[pg]违背你的意愿，你能感觉到你那根[cock biggest]里的恶魔开始把……某种东西沿着你的尿道往上推，仿佛想堵住卵通过的道路。乳白色的液体从你的尖端渗出，体内压力不断积聚，你这才意识到，他竟然在拿你自己的精液对付你！你明明还没高潮，可这个狡猾的恶魔似乎比你想象中更能控制你的身体。你奋力反击，把产卵管插得更深，并随着一次狠狠的猛推，竟然连同那枚卵一起，把接下来的几英寸也硬塞了进去。");
            outputText("[pg]那感觉几乎让你眼前一黑，你的粗度被撑开到记忆中前所未有的程度，只为容纳这个侵入你体内的东西；你进一步蜷在自己身上，期待感不断催促着你。你把更多产卵用的管道沿着肉棒往下塞，而此时，刺激性的蜜液开始从你肿胀鼓起的阴茎孔口渗出，混着埃克斯加图安试图用来对付你的残余精液。或许是已经认命于自己的“命运”，那恶魔似乎沉默了下来——不过以你对他的了解，他多半只是在盘算别的花招。");
            outputText("[pg]更多卵开始从你的腹部升起，一枚接一枚地挤入你可怜又被撑开的肉棒。第一枚已经差不多滑过你那 " + Utils.num2Text(get_player().cocks[get_player().biggestCockIndex()].cockLength) + " 英寸长度的一半，而你又感觉到另一枚进入了你的裂口。接着，你在深处感到了别的东西，那感觉让你下巴都垂了下来。你的阴茎开始抽动，仿佛即将高潮，而你也意识到埃克斯加图安在做什么了。他想让你射出来，好把卵强行挤出去！");
            outputText("[pg]你挣扎着，");
            if(get_game().shouldraFollower.followerShouldra())
            {
               outputText("幽灵辅助的");
            }
            outputText("意志与恶魔诱发的高潮抗衡，卵与精液相互对抗，而你似乎真的正在落于下风。你的阴茎根部鼓胀起来，你一边呻吟，一边被聚集的精种迅速填满、胀大；随着那恶魔扭转局势，你能感觉到高潮的压力不断升起。你的双眼向上翻去，眼皮也开始合拢，就在这时，你看见了自己的救星。你的螫针！它就悬在你龟头尖端的上方，尽管你畏惧接下来要做的事，却仍希望它能让你压过体内的恶魔同伴。你硬下心来，准备完成必须做的事。");
            outputText("[pg]预感到即将发生的一切，你绷紧身体、用力收缩，将自己的螫针刺向自己的[cockHead]。当那根带毒的针刺入你的肉棒并将其贯穿时，疼痛几乎让你喊出声来；但你的蜂类部位却自主地把那种诱发欲望与快感的毒液直接注入你的阴茎。快感与疼痛交织，让你的视野蒙上一层雾；可片刻之后，快感便开始掩盖其他一切。你发现自己瘫成一团，气喘吁吁，舌头从[face]里垂出，同时把你能挤出的所有毒液全都注入那根可怜又饱受折磨的阴茎。");
            outputText("[pg]这让你的产卵管彻底超负荷运作，一枚又一枚卵被迫挤下你鼓胀的肉棒，把你的精液进一步推回体内，也锁定了你对那恶魔的胜利。你几乎神志不清，却仍能感觉到一枚接一枚卵沿着你的肉棒滑下；你看着那些卵形的鼓包缓缓沉入你的尿道，朝你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("[hips]");
            }
            outputText("。");
            if(get_player().balls > 0)
            {
               outputText("[pg]那些卵朝你的睾丸挤去；你又开始预感到，当它们抵达那对贴在地面、胀得过满的球体时究竟会发生什么。你感觉到一枚卵正顶着某种入口，随着阴茎里的压力不断积聚，你眯起了眼；卵已经开始一枚接一枚地堵在一起。你用力绷紧并向外推挤，终于感觉到某处被撑开了。快感与恶心交织成一种精妙的感受，一枚又一枚卵强行挤进你沉重的囊袋里");
               if(get_player().fertilizedEggs() > 0)
               {
                  outputText("，而你无比确信，用不了多久它们就会受精，你也将能够产下自己的卵");
               }
               outputText("。");
            }
            else
            {
               outputText("[pg]随着卵在你体内推进，你能感觉到腹部某处压力不断积聚，仿佛它们遇到了某种阻塞。那感觉诡异至极，却又美妙得令人愉悦；你绷紧身体，奋力施压，想把它们推过任何阻碍它们的东西。你感觉那处阻塞终于松动，温热、黏稠而辉煌的极乐感填满了你；一枚接一枚卵擦过你的前列腺，落入你体内任何能够容纳它们的空间。");
            }
            if(get_player().balls > 0)
            {
               outputText("[pg]你的阴囊开始被那团疙疙瘩瘩的负担撑得鼓起");
            }
            else
            {
               outputText("[pg]你的腹部开始鼓胀起来，显出一种明显却古怪的孕相");
            }
            outputText("，一枚接一枚的卵强行进入你的体内，直到你的产卵管再也挤不出任何东西，它才开始从你的肉棒里退出。你终于伴随着一声响亮的“噗嗤”把它拔了出来，随后瘫软在地上，从这番折磨中慢慢缓过来。");
            outputText("[pg]当你开始陷入短暂的小睡时，你听见埃克斯加图安的声音在脑海中响起。[say:这倒没我想的那么糟……]");
            outputText("[pg]你勉强笑了两声，随后疲惫彻底压过了你，你便沉沉睡去。");
         }
         else
         {
            outputText("你感到有些欲火上涌，于是悄悄钻");
            if(get_player().cor < 33)
            {
               outputText("进你的铺盖里");
            }
            else if(get_player().cor < 66)
            {
               outputText("到一块岩石后面");
            }
            else
            {
               outputText("进营地外的树林里");
            }
            outputText("，脱下了身上的[armor]。你能感觉到腹部在身后沉甸甸地晃动，提醒着你已经有一段时间没有产卵了。这让你有些犯难。在把它们排出去之前，你会一直感到体内满是卵，可你现在就想自慰；附近却没有任何可用的接纳对象。");
            outputText("[pg]你让自己舒服地安顿下来，开始抚弄自己的肉棒，闭上眼沉浸在快感之中。你的肉棒进一步硬起，在手中显得饱满而充实，一个突如其来的念头在脑海中闪过。要是你自己就是那个容器呢？你睁开眼，低头看向自己。不知不觉间，你蜂类半身上的产卵管已经伸了出来，正把金黄色、散发甜香的蜜液滴落在地上。你开始打量自己，琢磨着究竟能把卵产在自己身体的什么地方，来减轻这份负担。");
            if(get_player().get_gender() == 3)
            {
               outputText("[pg]你打量着自己的肉棒");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("");
               }
               outputText("和自己的小穴，决定先试试后者。你绷紧那些仍然不太熟悉的肌肉，把腹部向自己身前卷来，努力想把它拉到合适的位置，可它就是没有柔韧到能弯那么远。就算用上双臂，");
               if(get_player().get_str() > 50)
               {
                  outputText("就算凭借你相当惊人的力量，");
               }
               outputText("你也没法把它弯到足以够到那里。你甚至开始感觉到腹部与身体相连处传来疼痛，于是把这个念头当成坏主意抛开了。");
            }
            else
            {
               outputText("[pg]你低头看着自己，心想或许还能试试你确实拥有的那个洞。你开始绷紧腹部，想把它卷向自己的肛门，但很快你就意识到，除非把腹部从身体上拆下来——而那并不是你愿意考虑的前景——否则这根本不可能做到。");
            }
            outputText("[pg]只剩下自己的肉棒这一个可能，你好奇地低头看着它。要不是你现在有这么大，你肯定会立刻把这个想法彻底否决。然而……你握住自己的[cock biggest]，抚弄了几下，让它重新硬得跳动起来。你的腹部卷在自己身前，一只手若有所思地抵着下巴，思索着各种可能。你想这应该不会有什么坏处，而且事到如今，你至少也得试着把卵产进自己体内。");
            outputText("[pg]你把产卵管再往内卷了一点，然后发现——没错，你真的够得着。好奇心与欲望一同占据了你，你把这根管状器官伸向自己，并用双手帮着自己的肉棒和那根滴着蜜液的东西碰到一起。可你很快被短暂的僵局难住了，因为你意识到，单是产卵管本身就不太塞得进去，更别提那些让你腹部阵阵发紧的卵了。但急切之下你又有了想法——看着那个孔口，它几乎已经够大了。");
            outputText("[pg]你决定孤注一掷，试了起来。一推，一挤，再稍微用力撑开，然后……你忍不住大声呻吟起来；产卵管顺畅地把你的尿道口撑开，滑入其中，你自己的前列腺液和滴落的蜜液极好地润滑了入口。你停下来休息片刻，沉浸在用自己身体插入自己的感觉中；在来到这片土地之前，这种行为你连想都不可能想，更别说真的做出来了。");
            outputText("[pg]你停下来片刻，只是单纯地沉浸在快感里，但那执拗的跳动感，以及你此刻高高托在腹部里的沉重卵块，很快又把你拉回现实……某种意义上来说。你没浪费多少时间，便开始抽送；这个姿势让动作显得有些别扭，但没过多久，你就找到了一个能够维持、又不会伤到身体好几处部位的节奏。");
            outputText("[pg]前液顺着你的阴茎畅快地涌上来；当它在你的产卵管周围冒起泡时，你能感觉到欲火愈发高涨——温热的体液裹住那根黑色器官，而来自你蜜蜂半身、能催起情欲的蜜液则开始渗入被抽出的空隙并发挥作用。你尽可能加快抽送，在你那");
            if(get_player().cor >= 75)
            {
               outputText("被腐化的");
            }
            else
            {
               outputText("变异后的");
            }
            outputText("身体的放荡作弄下，喘息与呻吟一同从喉间溢出。你插得更深，感觉到一颗卵正开始滑过你的产卵管，而此刻你已经迫不及待想感受它被挤进你阴茎深处的滋味了。");
            outputText("[pg]抽送之间，你开始感觉有什么东西刺到了你的[cockHead]，但你很快就将其抛到脑后，只顾继续把自己推向那场你确信会是此生最奇异、也最美妙的高潮之一。这可不是什么明智之举，因为下一瞬，你便感觉有什么东西扎进了你的龟头，整个世界几乎被疼痛刺得一片空白。");
            outputText("[pg]是你的螫针！你在被欲望搅得昏头转向时把它忘得一干二净，现在竟然直接蜇到了自己的阴茎。毒液已经流入你的肉棒，而当你意识到接下来会有多么舒服时，你根本没有做任何阻止。果不其然，几秒之内，随着螫针退出，一阵情欲的迷雾仿佛笼罩住了你；你能感觉到更多卵正朝你的阴茎挤来，第一颗已经快抵到你被撑开的龟头了。");
            outputText("[pg]只需再稍微用点力，你便放松下来，准备享受接下来的一切。一颗卵顶住你狭窄的尿道口，有那么一瞬间你担心它根本挤不进去。随后，你感觉自己被撑得更开，一声长长的呻吟从唇间溢出，那颗圆卵硬是挤过开口滑了进去。更多卵紧随其后，几乎已经在你体内排成一串；随着一颗又一颗卵被挤进你胀大的阴茎，你彻底沉溺在阵阵收缩之中，甚至能亲眼看见它们沿着你被撑胀的尿道向下移动，朝着你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText("[hips]");
            }
            outputText("。");
            if(get_player().balls > 0)
            {
               outputText("[pg]你开始期待它们旅程的终点，想亲眼看见自己的囊袋被自己的卵填满，并知道它们会立刻被你的精液受精。你心不在焉地想着，这到底算是自慰、乱伦，还是克隆；但当第一颗卵抵达阴茎根部、走到旅途尽头时，这些念头便全都散去了。它消失在你体内，有那么一刻你还怀疑它是不是走错了路。然而紧接着，你就感觉它顶上了体内某种阻碍，令你的腹部紧绷起来；你只得绷紧肌肉，试图帮它继续前进。");
               outputText("[pg]你成功了，终于将那颗卵更深地挤进体内；它擦过你的前列腺后，稳稳地落入你的囊袋。");
               if(!get_player().isTaur())
               {
                  outputText("更多卵开始跟上，你一边按摩着迅速胀大的睾丸，一边感受它们被一颗又一颗卵填满。");
               }
               outputText("你的肚腹略微抗议起来，但在蜜液与毒液的镇静作用下，那点不适几乎算不上什么。");
            }
            else
            {
               outputText("[pg]你开始期待它们旅程的终点，猜想着自己的卵究竟会落到哪里；你只能想象那会是你精液产生的地方，也就是说，它们会立刻被你自己受精。你短暂思索着这是否算某种古怪的克隆，但当第一颗卵挤过阴茎根部、更深地进入你的身体时，这些念头便被彻底赶出了脑海。你感觉它顶上了体内某种堵塞，不由得呻吟出声，只能绷紧身体，试图把它挤得更深。");
               outputText("[pg]你的努力有了回报，那颗卵滑过阻碍，在你体内某处安定下来；当它擦过你的前列腺时，引发了一次小小的、不受控制的高潮。紧接着，更多圆卵迅速跟了上来，逆着试图将它们推回去的精液流向前推进。");
            }
            outputText("[pg]接下来的几分钟里，愉悦的收缩仍在继续，你沉浸在用卵与带着麻醉感的蜜液填满自己的感觉中。但就像总会发生的那样，美好时光在你再没有圆卵可挤入体内后结束了。你抽出产卵管，瘫软地躺在地上，放松下来，享受着大功告成后的余韵。你很快便被一阵小睡带走");
            if(!get_player().isTaur())
            {
               outputText("，而你还漫不经心地抚摸着自己的");
               if(get_player().balls == 0)
               {
                  outputText("胀鼓鼓的肚子");
               }
               else
               {
                  outputText("鼓胀的囊袋");
               }
            }
            outputText("，还梦见自己将来某天也会产下卵。");
         }
         if(get_player().fertilizedEggs() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,592) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,592,48);
         }
         get_player().dumpEggs();
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,593,FlagDict_Impl_.arrayReadInt(_loc1_,593) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function genderlessMasturbate() : void
      {
         clearOutput();
         get_images().showImage("masti-genderless-fuck");
         doStripCheck();
         titForeplay();
         if(!get_player().hasStatusEffect(StatusEffects.FappedGenderless))
         {
            outputText("这下可能有点麻烦了。你明明已经准备好好发泄一番，却完全不知道该怎么做。除了反复尝试，也没别的办法。你用双手轻轻抚过本该是生殖器所在的位置。你轻柔地摩挲那片皮肤，感受指尖挑逗着曾经最能带给你快感的地方。那感觉确实舒服得不得了，却始终没法让你到达顶点。你在边缘徘徊，只让自己更加烦躁。不知道接下来该怎么办时，你的身体把你轻轻推向一条从未探索过的道路，而你决定顺着它走下去。[pg]");
            get_player().createStatusEffect(StatusEffects.FappedGenderless,0,0,0,0);
         }
         outputText("你的[asshole]开始抽动起来。它简直是在渴求你的关注。[pg]");
         outputText("你侧身躺下，小心地把手伸到身后。你的手掌落在自己的[ass]上。你将手指滑入臀缝，找到了自己的[asshole]。你用手指缓缓绕着那敏感的穴口边缘打转，感觉一阵酥麻从那里扩散开来。想到接下来会发生的事，一抹笑意悄悄爬上你的嘴角。[pg]");
         if(get_player().ass.analWetness < 2)
         {
            outputText("你把手抬到嘴边，给你的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("中指");
            }
            else if(get_player().ass.analLooseness == 3)
            {
               outputText("前两根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("裹上厚厚一层唾液，然后再次伸向你的[asshole]。[pg]");
         }
         else
         {
            outputText("你弄出的润滑让你能轻松地把手指");
            if(get_player().ass.analLooseness >= 3)
            {
               outputText("");
            }
            outputText("插进自己的肛门。一阵战栗窜上你的脊背，你将");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("一直插到指节处");
            }
            else if(get_player().ass.analLooseness == 3)
            {
               outputText("一直插到前两个指节");
            }
            else if(get_player().ass.analLooseness == 4)
            {
               outputText("三根手指都插进去");
            }
            else
            {
               outputText("四根手指深深插进去");
            }
            outputText("。你开始慢慢地推拉手指");
            if(get_player().ass.analLooseness >= 3)
            {
               outputText("");
            }
            outputText("在肛门里进出。随着节奏逐渐加快，你忍不住轻轻呻吟了一声。[pg]");
         }
         if(get_player().ass.analLooseness == 5)
         {
            outputText("一个邪恶的念头掠过你的脑海。你曾让各种各样的野兽和存在进入过自己的身体。要靠自己重现它们带给你的快感，真正可行的办法只有一个。你慢慢把整只手塞进自己的[asshole]，随之而来的饱胀感，是你从未想过在无人帮助下也能达到的。随着手在体内进出，你开始慢慢攥成拳头，又一次次张开。[pg]");
         }
         outputText("快感开始化作暖意充盈你的全身。你怀着深切的渴望，有意扭动手腕，抽插着自己的快感穴口。你的肛门开始剧烈地开合，裹住那入侵的");
         if(get_player().ass.analLooseness <= 2)
         {
            outputText("手指");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("手指");
         }
         else
         {
            outputText("手");
         }
         outputText("，你的脚趾蜷紧，高潮席卷全身。");
         if(get_player().ass.analWetness >= 2)
         {
            outputText("你抽出自己的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("手指");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("几根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("，发现上面沾满了你分泌出的温热润滑液。你身上的气味和沉浸其中的狂喜将你推过顶点，你开始把刚才还在体内的东西舔得干干净净。又一阵高潮贯穿全身，让你的身体颤抖了好几秒。");
            if(get_player().get_lib100() >= 75)
            {
               outputText("[pg]你翻过身睡去，小穴还在滴着淫液、阵阵抽搐，注定让你的梦里也充满最淫靡的念头。");
            }
            else
            {
               outputText("[pg]你翻过身，彻底筋疲力尽，沉沉睡去；被充分玩弄过的小穴仍在滴着液。");
            }
         }
         else
         {
            outputText("你抽出自己的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("手指");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("几根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("，把");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("它");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("擦干。");
            if(get_player().get_lib100() > 75)
            {
               outputText("你心满意足地翻过身，渐渐睡去。你的小穴依旧温热，随时准备再来一轮。");
            }
            else
            {
               outputText("你心满意足地翻过身，渐渐睡去。");
            }
         }
      }
      
      public function fuckBearLeave() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         outputText("它已经没法再作为一只小熊履行自己的职责了，但看着它的小脸，你觉得自己仿佛能从中看到某种理解。它用这种不寻常的方式，带给了你真正的平静、真正的慰藉，哪怕只有短短片刻。没有哪只小熊会为与你分享这一刻而感到羞愧；当你最后一次将它安置好时，你心中也没有半点后悔。");
         if(get_player().hasItem(get_useables().TELBEAR))
         {
            get_player().consumeItem(get_useables().TELBEAR);
         }
         else
         {
            _loc1_ = 2796;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBearFix() : void
      {
         clearOutput();
         outputText("这只熊值得被好好照料。刚刚让它承受了那些之后，你实在不该拒绝它现在所需要的修补。你温柔地拾起散落的各个小零件，开始清理和缝补。特莉当初花了很多心思才把它做出来，所以你也不允许自己有半点敷衍，尽可能把这只熊恢复到最好的状态。");
         outputText("[pg]当你用[hands]捧着修好的玩具时，你知道这一切都是值得的。一切都回到了原位，只有几道针脚还留着，见证着你那粗暴的爱。小熊的表情依旧和从前一样，但不知为何，你能感觉到它正对你微笑，而你也忍不住回以笑容。你把它贴在胸前，最后拥抱了一下，随后将它放回它应在的位置，准备好再次陪伴你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBear() : void
      {
         clearOutput();
         outputText("你在[bed]上坐定，叹了口气。你吸了口气，闭上眼，让肩头的紧绷慢慢散去，整个世界仿佛缩小到你身边这几尺范围。玛瑞斯并不是最让人安心的地方，所以偶尔留些只属于自己的时刻十分重要。为此，你拿出自己在集市买下的那只小熊；一看到它，你便立刻放松了些。");
         outputText("[pg]你端详着这只小熊，惊叹于它看起来是多么蓬松，简直像一朵可以抱在怀里的云。你把它举到脸颊边蹭了蹭，享受着那份纯粹的柔软。它所用的毛绒布料如此舒服，以至于你开始好奇，特莉究竟是从哪里在这个严酷的世界里找到这种材料的。不过，无论如何，它确实就在这里，而且令人安心。");
         outputText("[pg]但你想要更多。你[i:早就知道]自己想要更多，这也是你会来到这里的原因。你缓缓地，几乎像是在假装这一切根本没有发生一样，开始[if (isnaked){脱下护甲，然后}]让它顺着你的[skindesc]滑下去。那感觉美妙得像在天堂。它每擦过一寸皮肤，那里都会因愉悦而颤抖；而它每离开一寸，那一寸又都能清楚感到失落。");
         outputText("[pg]你把它拿开，又看了它一眼。[if (ischild){像你这个年纪的孩子玩这种玩具再正常不过，可涌上你脸颊的热意却一点也不天真。|它看起来如此天真——本该是给孩子的东西——可你看着它时，还是忍不住感到身体发热。}]在某种层面上，你知道这是不对的，你不该对一只毛绒熊产生这样的感觉；可随着欲望开始蒙蔽你的脑海，你已经不在乎了。你就是要这么做。");
         outputText("[pg]但在那之前，还有件事得先做。你[if (hascock){开始拉扯它胯部附近的缝线。你尽可能放轻动作，却带着明确的意图。布料开始裂开，而你继续稳定地施压，直到那道开口足够大|开始把填充棉挤进它的一条胳膊里。没过多久，你就做出了一个适合你目的的鼓胀凸起}]。你迅速把[armor]挪开，把小熊贴在自己裸露的[skindesc]上片刻，不由得一颤。但也只有片刻，因为你已经等不下去了，很快便把它带到因期待而悸动的[genitals]处。");
         outputText("[pg]于是，所有犹豫都离你而去，你对着泰迪熊进行了第一次挺动[if (hascock){，插了进去|，压了上去}]。那感觉美妙无比，几乎比你预想的还要好，而你已经渴望得到更多。你的伴侣不需要任何准备——它永远都准备好接受你的爱意，于是你一头沉进去，带着放纵的欲望开始动作。");
         outputText("[pg]小熊只能回望着你，除此之外什么也做不了，但你仍然小心地做一个温柔的伴侣。你把它抱在身前，随着身体前后摇动，同时确保不造成不必要的损坏。可这实在很难，因为它那诱人的柔软仿佛在央求你更快、更用力，尽情夺取你想要的一切。");
         outputText("[pg]一缕缕绒毛摩擦着你的[if (hascock){龟头|阴蒂}]，每一次动作都让电流般的刺激贯穿全身，你能感觉到自己快到了。你加快速度，而小熊承受着这一切，优雅地接纳着你的热情，任由你的动作变得越来越激烈。快感在你体内回响，摩擦达到发热的顶点；随后你彻底放开，再也无法抵抗冲动，整个身体都随着高潮而颤抖。");
         outputText("[pg]当你开始[if (hascock){射进|[if (vaginalwetness > 2) {喷洒在|滴落在}]}]小熊身上时，你发出一声响亮而绵长的呻吟。绒毛温柔地爱抚着你，提供着恰到好处的刺激，让你能舒适地熬过整个高潮。你[if (hascock){一股接一股地射进小熊体内，尽可能用你的爱把它填满|用自己的淫液涂满小熊，让它的毛皮染上你爱意的证明}]。包裹着你的柔软触感把你的意识带入彻底的极乐之中；你颤抖的双手紧抱着小熊，一种被接纳的感觉弥漫全身。");
         outputText("[pg]最后一次释放之后，你彻底泄了力，在高潮的余韵中沉重地喘息。小熊仍紧贴着你，像是在拥抱并安抚你，陪你慢慢平静下来。最终，你还是把它拉开，再次看向它。它的结构已经被破坏，你能看到有些绒毛开始掉出来。不过，你大概还是能把它修好的。");
         get_player().orgasm("Generic");
         menu();
         addNextButton("修好它",fuckBearFix);
         addNextButton("放着不管",fuckBearLeave);
      }
      
      public function flagellate() : void
      {
         clearOutput();
         outputText("你跪倒在地，以忏悔的姿势低头弯身，清楚意识到自己那些罪恶的念头。教会教导过你，色欲是通往腐化的大门，而你绝不能让自己堕落！");
         outputText("[pg]你脱下 [armor]，深深呼吸，为即将到来的试炼做好准备。你拿起自己的鞭笞工具，那是一条皮制鞭子，两端都带着锋利的钩刺，是你的主人们为这种情况赐予你的工具。你闭上眼睛，集中精神，朝自己的后背抽了一下。");
         outputText("[pg]钩刺撕扯着你的血肉，剧痛让你全身绷紧。你颤抖着，但你知道，那个叫你停下、向欲望屈服的声音来自恶魔，绝不能听从。");
         outputText("[pg]又是一鞭。钩刺如今已经沾满鲜血，滴落在下方冰冷的地面上。");
         outputText("[pg]第三鞭。你忍不住尖叫出声。你知道这痛楚源自你自身罪恶的念头，而这一切只能怪你自己。");
         outputText("[pg]你继续鞭笞自己数分钟，在身上留下伤痕与鲜血，也将腐化的影响从脑海中驱除。结束之后，你精疲力尽、浑身疼痛地向前倒去，手中的鞭子已完全被鲜血覆盖。");
         outputText("[pg]一小时后你醒了过来，身上依然火辣辣地疼，但你的目标无比明确：把这份痛苦化作惩戒恶魔的力量！");
         dynStats(DynStat.Str(-0.25),DynStat.Spe(-0.25),DynStat.Inte(-0.25),DynStat.Tou(-0.5));
         get_player().set_lust(0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fistForFullFeelings() : void
      {
         clearOutput();
         outputText("不用搞什么花样。根据之前的经验，你知道该怎么做才能得到释放，");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("哪怕那里再紧也是如此。[pg]");
         }
         else
         {
            outputText("而且你现在已经非常习惯了。[pg]");
         }
         outputText("你脱下[armor]，躺到床上，");
         if(get_player().lib < 50)
         {
            outputText("满怀期待地喘息着，开始抚弄自己的身体。");
         }
         else
         {
            outputText("因欲望而颤抖，几乎忍不住要立刻操弄自己。");
         }
         if(get_player().ass.analWetness >= 3)
         {
            outputText("[pg]有你自身分泌的天然润滑，就不需要任何外物辅助了。");
         }
         else
         {
            outputText("[pg]你用你的" + get_player().multiCockDescript() + "不断分泌出的大量预精液涂满手掌。");
         }
         outputText("[pg]你开始挑逗自己的穴口，慢慢戳弄、试探着[asshole]，将手指越伸越深，享受随之而来的种种感觉。寄生物察觉到即将到来的入侵，随即开始扭动起来，");
         if(get_player().sens < 33)
         {
            outputText("让你心跳加速，呼吸也急促起来。");
         }
         if(get_player().sens >= 33 && get_player().sens < 66)
         {
            outputText("让你在心跳加速的同时，忍不住舒服地呻吟起来。");
         }
         if(get_player().sens >= 66)
         {
            outputText("让你扭动着身体呻吟不止，心跳飞快，汗珠也开始从全身冒出。");
         }
         outputText("随着你的挑逗越来越深入、越来越快，寄生物也随之动得更快。你慢慢把更多手指插入[asshole]，让快感越发强烈。");
         outputText("[pg]尽管你才刚开始自慰没多久，");
         if(get_player().cumQ() < 50)
         {
            outputText("一小滩预精液已经在你的" + get_player().multiCockDescript() + "下方形成，浓稠的丝线还将它与你的身体连在一起。");
         }
         if(get_player().cumQ() < 250 && get_player().cumQ() > 50)
         {
            outputText("你的[legs]上沾满黏腻的预精液，让你在扭动时在床上打滑。");
         }
         if(get_player().cumQ() >= 250)
         {
            outputText("你浑身上下都沾满了预精液，这只会让你更加兴奋。");
         }
         outputText("很快，你整只拳头都塞进了[ass]里，[asshole]贪婪地夹紧、吮吸着这个入侵者。");
         outputText("[pg]你开始缓缓抽动拳头，并调整角度朝向前列腺。随着快感加剧，节奏迅速加快，没过多久你就把自己抽插得飞快，连手臂都开始酸痛。可你一点也不在乎，毕竟这种感觉实在太舒服了。寄生物似乎也很享受前列腺被冲击的感觉，于是继续更加剧烈地蠕动、挣扎着回应。");
         outputText("快感不断堆积，你已经到了无法回头的临界点。");
         outputText("[pg]一波又一波高潮攫住你的身体，你除了扭动和呻吟，什么也做不了。");
         outputText("[pg]你已经无法控制自己的动作，拳头从你的[ass]里退了出来，发出响亮而湿润的啵的一声；只剩下屁眼自发地收缩，继续延长你的高潮。而这已经绰绰有余了。");
         outputText("[pg]你疯狂地扭动着身体，因为你");
         if(get_player().cumQ() < 50)
         {
            outputText("把精液淋得自己满身都是，");
         }
         if(get_player().cumQ() < 250 && get_player().cumQ() > 50)
         {
            outputText("让一滩滩精液流满你和你的床，");
         }
         if(get_player().cumQ() >= 250)
         {
            outputText("让河流般的精液淹没你和你的床，");
         }
         outputText("完全顾不上那一片狼藉，脑子里只剩下快感。");
         outputText("[pg]随着一阵阵高潮渐渐平息，你终于停止扭动，瘫在床上休息。");
         outputText("[pg]几分钟后你醒了过来，注意到寄生物的蠕动明显减弱。你确信这招管用了；它的后代很快就会离开你。");
         get_player().orgasm("Anal");
         updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fingerFuck() : void
      {
         get_images().showImage("masti-genderless-fuck");
         outputText("你的[asshole]开始抽动起来。它简直是在渴求你的关注。[pg]");
         outputText("你侧身躺下，小心地把手伸到身后。你的手掌落在自己的[ass]上。你将手指滑入臀缝，找到了自己的[asshole]。你用手指缓缓绕着那敏感的穴口边缘打转，感觉一阵酥麻从那里扩散开来。想到接下来会发生的事，一抹笑意悄悄爬上你的嘴角。[pg]");
         if(get_player().ass.analWetness < 2)
         {
            outputText("你把手抬到嘴边，给你的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("中指");
            }
            else if(get_player().ass.analLooseness == 3)
            {
               outputText("前两根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("裹上厚厚一层唾液，然后再次伸向你的[asshole]。[pg]");
         }
         else
         {
            outputText("你弄出的润滑让你能轻松地把手指");
            if(get_player().ass.analLooseness >= 3)
            {
               outputText("");
            }
            outputText("插进自己的肛门。一阵战栗窜上你的脊背，你将");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("一直插到指节处");
            }
            else if(get_player().ass.analLooseness == 3)
            {
               outputText("一直插到前两个指节");
            }
            else if(get_player().ass.analLooseness == 4)
            {
               outputText("三根手指都插进去");
            }
            else
            {
               outputText("四根手指深深插进去");
            }
            outputText("。你开始慢慢地推拉手指");
            if(get_player().ass.analLooseness >= 3)
            {
               outputText("");
            }
            outputText("在肛门里进出。随着节奏逐渐加快，你忍不住轻轻呻吟了一声。[pg]");
         }
         if(get_player().ass.analLooseness == 5)
         {
            outputText("一个邪恶的念头掠过你的脑海。你曾让各种各样的野兽和存在进入过自己的身体。要靠自己重现它们带给你的快感，真正可行的办法只有一个。你慢慢把整只手塞进自己的[asshole]，随之而来的饱胀感，是你从未想过在无人帮助下也能达到的。随着手在体内进出，你开始慢慢攥成拳头，又一次次张开。[pg]");
         }
         outputText("快感开始化作暖意充盈你的全身。你怀着深切的渴望，有意扭动手腕，抽插着自己的快感穴口。你的肛门开始剧烈地开合，裹住那入侵的");
         if(get_player().ass.analLooseness <= 2)
         {
            outputText("手指");
         }
         else if(get_player().ass.analLooseness < 5)
         {
            outputText("手指");
         }
         else
         {
            outputText("手");
         }
         outputText("，你的脚趾蜷紧，高潮席卷全身。");
         if(get_player().ass.analWetness >= 2)
         {
            outputText("你抽出自己的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("手指");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("几根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("，发现上面沾满了你分泌出的温热润滑液。你身上的气味和沉浸其中的狂喜将你推过顶点，你开始把刚才还在体内的东西舔得干干净净。又一阵高潮贯穿全身，让你的身体颤抖了好几秒。");
            if(get_player().get_lib100() >= 75)
            {
               outputText("[pg]你翻过身睡去，小穴还在滴着淫液、阵阵抽搐，注定让你的梦里也充满最淫靡的念头。");
            }
            else
            {
               outputText("[pg]你翻过身，彻底筋疲力尽，沉沉睡去；被充分玩弄过的小穴仍在滴着液。");
            }
         }
         else
         {
            outputText("你抽出自己的");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("手指");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("几根手指");
            }
            else
            {
               outputText("手");
            }
            outputText("，把");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("它");
            }
            else if(get_player().ass.analLooseness < 5)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("擦干。");
            if(get_player().get_lib100() > 75)
            {
               outputText("你心满意足地翻过身，渐渐睡去。你的小穴依旧温热，随时准备再来一轮。");
            }
            else
            {
               outputText("你心满意足地翻过身，渐渐睡去。");
            }
         }
         get_player().buttChange(4 + get_player().ass.analLooseness * 2,true);
         get_player().orgasm("Anal");
         updateMasturbation();
      }
      
      public function fappingItems(param1:Boolean = true) : Boolean
      {
         if(param1)
         {
            menu();
         }
         var _loc2_:Boolean = int(get_player().cocks.length) > 0 && (!get_player().isTaur() || get_player().cocks[get_player().longestCock()].cockLength >= get_player().get_tallness() * 0.8333333333333334);
         var _loc3_:Boolean = false;
         if(get_player().hasKeyItem("Deluxe Dildo") && get_player().hasVagina() && !get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("豪华假阳具",deluxeDildo);
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("All-Natural Onahole") && _loc2_)
         {
            if(param1)
            {
               addNextButton("纯天然飞机杯",allNaturalOnaholeUse).hint("一个纯天然飞机杯，这件器具看起来更像是一个球茎状生物，而不是性玩具。尽管如此，它露出的滑腻孔口看上去依然十分诱人。","纯天然飞机杯");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Deluxe Onahole") && _loc2_)
         {
            if(param1)
            {
               addNextButton("豪华飞机杯",deluxeOnaholeUse).hint("这是一件豪华飞机杯，采用上等材料和精湛工艺制成，旨在将使用者送上欢愉的巅峰。","豪华飞机杯");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Plain Onahole") && _loc2_)
         {
            if(param1)
            {
               addNextButton("飞机杯",onaholeUse).hint("这就是所谓的“飞机杯”。这件器具是一个带有纹理的简易套筒，设计成能舒适地套住男性器官，带来快感。","飞机杯");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Self-Stimulation Belt") && int(get_player().vaginas.length) > 0 && !get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("刺激腰带",stimBeltUse).hint("这是一条自刺激腰带。它们通常被称为刺激腰带，是专为取悦女性身体而设计的发条装置。","自刺激腰带");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("All-Natural Self-Stimulation Belt") && int(get_player().vaginas.length) > 0 && !get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("天然刺激腰带",allNaturalStimBeltUse).hint("这是一条全天然的自我刺激带。用于制造这种快感装置的方法无人知晓。它似乎具有有机性质。","全天然刺激带");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Dual Belt") && get_player().get_gender() == 3 && !get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("双重刺激带",dualBeltMasturbation).hint("这是一件奇怪的自慰装置，意在刺激所有可用的敏感部位。","双重刺激带");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Fake Mare") && get_player().hasCock() && get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("假母马",centaurDudesGetHorseAids).hint("这匹假母马由金属和木头制成，但那具备真实解剖结构的阴道看起来和任何雌性半人马的一样柔软湿润。","假母马");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Centaur Pole") && get_player().hasVagina() && get_player().isTaur())
         {
            if(param1)
            {
               addNextButton("半人马柱",centaurGirlsGetHorseAids).hint("这个被称作“半人马柱”的东西，似乎是为马类女性设计的性玩具。奇怪的是，它被雕成了一只巨大小恶魔的模样，还长着一根更大的马屌。","半人马柱");
            }
            _loc3_ = true;
         }
         if(get_player().hasKeyItem("Dildo"))
         {
            if(param1)
            {
               addNextButton("肛用假阳具",dildoButts);
            }
            _loc3_ = true;
            if(param1 && get_player().hasVagina())
            {
               addNextButton("假阳具",stickADildoInYourVagooSlut);
            }
         }
         if(param1)
         {
            setExitButton("返回",masturbateMenu);
         }
         return _loc3_;
      }
      
      public function exgartuanCheck() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            return get_player().statusEffectv2(StatusEffects.Exgartuan) == 0;
         }
         return false;
      }
      
      public function enlightenedCheck() : Boolean
      {
         if(get_player().hasPerk(PerkLib.Enlightened))
         {
            return get_player().isPureEnough(10);
         }
         return false;
      }
      
      public function dualBeltMasturbation() : void
      {
         clearOutput();
         get_images().showImage("masti-stimBelt-play");
         outputText("你看着面前的东西叹了口气，你的[cocks]和[vagina]都滴着体液。你紧张地叹息着，踏进那个看起来像内衣的装置里，把它沿着双腿拉了上来；冰冷的金属贴在你的[skindesc]上，感觉舒服得不得了，一阵异样的感觉随之窜遍全身。你把你的" + get_player().cockDescript() + "向下塞进腰带前方的一个孔里，多出来的长度则从另一侧探了出去。在那个孔的下方、正好位于你小穴上方的位置，还有另一块金属方片，里面似乎有个小凸点正摩擦着你的阴蒂。你被那感觉弄得发颤，停在那里片刻，满怀期待地等待着。最后，你伸手摸到腰带侧面，把开关拨到了开启的位置。[pg]");
         outputText("腰带嗡嗡作响地启动了，在你腰间震动起来，里面的小凸点撞击着你的阴蒂，将一阵阵快感送入体内。[say:噢……]突然，套在你肉棒周围的圆环震动了一下，接着狠狠收紧，将你的肉棒紧紧箍住；腰带也沉沉贴上你的身体，牢牢锁定。你立刻感到担忧，试着扭动身体把它取下来，却毫无用处。你看到某种黑色物质从金属边缘冒泡渗出，愈发担心那会不会是某种酸液。它开始以令人不安的速度爬过你的皮肤，向下蔓延到你的[legs]，将它们包裹进黑暗之中，又缠住你的肉棒，");
         if(get_player().tail.type > 0)
         {
            outputText("盖住你的尾巴，");
         }
         outputText("随后又沿着你的身体向上蔓延，覆盖住你的" + get_player().allBreastsDescript() + "和脖子。你全身唯一没有被这套衣物包住的地方，只剩下头部。那片黑色触感光滑而柔顺，几乎有些冰冷；一种奇异的感觉冲刷过你，直到你意识到这是一套橡胶衣。[pg]");
         outputText("还没等你做出其他反应，腰带再次启动，包覆着你的" + get_player().cockDescript() + "的乳胶开始在那根肉柱周围收紧、脉动，并逐渐升温，感觉就像处女的小穴一样。它开始起伏、抽动，模拟着插入紧窄孔洞的感觉，而整套衣服也贴合着你的身体成形，硬是从你唇间逼出一声呻吟。还没等你习惯这套衣服榨弄你肉棒的感觉，那个一直挑逗你阴蒂的小凸点突然膨胀并向外顶出，乳胶光滑的触感随之挤进你的小穴。变硬的黑色乳胶撑开你的甬道，把你向两侧扩张开来，并深深刺入体内。两边的动作同时停下，你的眼睛一瞬间睁大；紧接着，你的世界便在一阵快感的闪光中炸裂。那块硬化的突起开始在你的[vagina]里来回抽插，剧烈震动着，同时上方又隆起一块凸起，位置精准地在你的G点上来回摩擦。[pg]");
         outputText("与此同时，包裹着你" + get_player().cockDescript() + "的乳胶开始以前所未有的速度脉动、起伏。你浑身颤抖，双[legs]发软撑不住身体，而它还在你的" + get_player().allBreastsDescript() + "周围挑逗、跳动。你的双手无力地滑下身体，开始抚弄被包裹住的肉棒，沿着整根上下摩擦。可惜，一切终有尽头；快感变得实在过于强烈，你感觉自己射了出来。你的腰胯疯狂挺动，感受着精液喷进乳胶里，末端随之鼓胀、充满，变得像一个");
         if(get_player().cumQ() > 200)
         {
            outputText("巨大的");
         }
         outputText("气球。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("它越胀越大，大到你确信它一定会爆开，可它并没有。它只是晃荡着——一个巨大的液泡，几乎高到你的腰部。");
         }
         outputText("你在颤抖的狂喜中闭上双眼，小穴痉挛着，紧紧夹住深埋在体内的那段硬物。");
         if(get_player().biggestLactation() >= 2)
         {
            outputText("高潮时，乳汁从你的[breasts]中喷涌而出，在衣服内侧铺上一层滑腻的乳液，并形成一团团乳泡，淫靡地挂在你的胸前。");
         }
         outputText("然而，这套衣服远远还没结束；它继续维持着所有动作，将你困在持续高潮的平台上，确保你永远停不下来。你的双手垂到身侧，身体也随之倒下，再也支撑不住；意识逐渐淡去，而这套衣服仍在被你的各种体液填满。[pg]");
         outputText("当你醒来时，黑色乳胶已经不再覆盖你的身体，腰间的腰带也安静无声。精液从你的肉棒尖端滴落，你[legs]的上半部分则沾满了你的淫液。");
         if(get_player().biggestLactation() >= 2)
         {
            outputText("一缕缕乳白的奶水从你的" + get_player().allBreastsDescript() + "流下，你的躯干和腹部都被它弄得湿淋淋的。");
         }
         outputText("你彻底满足了，便取下腰带，发现它轻而易举就滑了下来。你把它收回营地，急切地期待着下次再用它、让这套衣服再次好好折腾你。");
         dynStats(DynStat.Sens(-1));
         updateMasturbation();
         get_player().orgasm("Generic");
         if(get_player().get_lib100() < 30)
         {
            dynStats(DynStat.Lib(0.5));
         }
         if(get_player().get_lib100() < 50)
         {
            dynStats(DynStat.Lib(0.5));
         }
         if(get_player().get_lib100() < 60)
         {
            dynStats(DynStat.Lib(0.5));
         }
         if(get_player().get_sens100() > 40)
         {
            var _temp_1:* = get_player();
            _temp_1.sens = _temp_1.sens - 1;
         }
         if(get_player().get_sens100() > 60)
         {
            var _temp_2:* = get_player();
            _temp_2.sens = _temp_2.sens - 1;
         }
         if(get_player().get_sens100() > 80)
         {
            var _temp_3:* = get_player();
            _temp_3.sens = _temp_3.sens - 1;
         }
         if(get_player().get_tou100() > 50)
         {
            dynStats(DynStat.Tou(-1));
         }
         if(get_player().get_tou100() > 75)
         {
            dynStats(DynStat.Tou(-1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkPiss() : void
      {
         clearOutput();
         outputText("自慰的念头开始挑起你的兴致，你感到血液涌向胯间；当你用双掌揉搓那根尺寸可观的肉棒时，你的[cock]也开始变硬。不过，你感受到的冲动并不只有欲望。你盯着自己的阳具，暗自露出一抹坏笑。你平躺在地，感觉膀胱里的压力逐渐积聚，尿意不断在脑中催促着你。");
         outputText("[pg]你用双手握住肉棒，指向天空并释放出来。当你把自己浸泡在尿液中时，你开始咯咯地笑，尿流在你的身体上交错，而你的手开始撸动肉棒。当温暖的尿液流过你的[if (hasBreasts) {[breasts]|胸膛}]并顺着你的身体流下时，你颤抖了一下。尿液开始在你身下积聚成一滩。");
         outputText("[pg]尿流仍在不断涌出，你将龟头直接对准自己的脸，张大嘴，把尿径直尿进嘴里。温热咸涩的尿液积在口中，你用舌头搅动几下，随后咽了下去。你把整张脸都用尿液浸湿；解放感与欲望交织着从肉棒扩散开来，让你的脚趾都蜷缩起来。尿液顺着脸颊流下，涌进鼻子，掠过你因快感而紧闭的眼皮。你把膀胱里最后一点尿全都排在[if (hasBreasts) {[breasts]|胸膛}]之间，然后更加用力地套弄起肉棒。一阵凉风吹过，你仍被浸湿的[skinfurscales]顿时起了一层鸡皮疙瘩，汗毛也根根竖起。");
         outputText("[pg]高潮将至，你弓起背，大声低吼着，把精液喷洒在自己身上。浓稠的精种喷涌而出，在你发亮的皮肤上划出一道道淫靡的痕迹。等感觉渐渐退去，你又瘫倒回自己弄出的水洼里，喘着气，任由尿骚味、汗味与性味将你包围。几分钟后，你坐起身，走到溪边清洗自己。");
         get_player().orgasm("Dick");
         updateMasturbation();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doStripCheck() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) <= 0 || get_inRoomedDungeon())
         {
            if(get_player().cor < 15)
            {
               outputText("你有些难为情地找了几块岩石藏身，在那里");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("你脱下沾满黏液的[lowerGarment]，然后");
                  }
                  outputText("你把手伸向自己满是黏液的胯间。");
               }
               else
               {
                  outputText("你脱下你的[armor]。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 15 && get_player().cor < 30)
            {
               outputText("你确认周围没有别人，然后");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("你脱下沾满黏液的[lowerGarment]，然后");
                  }
                  outputText("你把手伸向自己满是黏液的胯间。");
               }
               else
               {
                  outputText("脱得一丝不挂。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 30 && get_player().cor < 60)
            {
               outputText("你开心地");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下沾满黏液的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("脱下你的[armor]");
               }
               outputText("，迫不及待地想要自慰。[pg]");
            }
            if(get_player().cor >= 60 && get_player().cor < 80)
            {
               outputText("你");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("用夸张的动作脱得一丝不挂");
               }
               outputText("，希望也许有人正在看着。[pg]");
            }
            if(get_player().cor >= 80)
            {
               outputText("你");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸向沾满黏液的胯间，");
               }
               else
               {
                  outputText("脱得一丝不挂，");
               }
               if(get_player().hasCock() || get_player().hasVagina())
               {
                  outputText("一边抚弄自己的私处，一边");
               }
               outputText("向四周投去诱惑的目光，希望附近有什么人或什么东西能来干你。[pg]");
            }
         }
         else
         {
            if(get_player().cor < 15)
            {
               outputText("你有些难为情地走进小屋，关好屋门和窗户的百叶窗，确保不会被人看见。");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你");
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("接着，你又脱下了[armor]。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 15 && get_player().cor < 30)
            {
               outputText("你走进小屋并关上门，却忘了关窗户的百叶窗。");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你");
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("接着，你又脱下了[armor]。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 30 && get_player().cor < 60)
            {
               outputText("你走进小屋，却让窗户的百叶窗敞着。");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你");
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("你愉快地脱下[armor]。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 60 && get_player().cor < 80)
            {
               outputText("你走进自己的小屋，打开百叶窗和门，希望有人能注意到你。");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你");
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("你急切地脱下[armor]。");
               }
               outputText("[pg]");
            }
            if(get_player().cor >= 80)
            {
               outputText("你走进自己的小屋，打开百叶窗和门。你挪动床铺，让自己能被窗外看见，希望借此引起某人的注意。");
               if(get_player().get_armor() == get_armors().GOOARMR)
               {
                  outputText("你");
                  if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
                  {
                     outputText("脱下被黏液浸透的[lowerGarment]，然后");
                  }
                  outputText("把手伸进沾满黏液的胯间");
               }
               else
               {
                  outputText("你动作夸张地急切脱下[armor]。");
               }
               outputText("[pg]");
            }
         }
      }
      
      public function dildoButts() : void
      {
         clearOutput();
         outputText("一个下流的念头闪过脑海，你抓起假阳具。在离营地不远处找了个安全的地方，解开[armor]，坐在自己的[butt]上。");
         outputText("[pg]你调整姿势，张开[legs]，让自己能最舒服地触及[asshole]。你随意舔湿一根试探用的手指，将它探向臀瓣之间那渴望的入口。");
         if(get_player().analCapacity() <= 8)
         {
            outputText("你紧窄的小洞起初有些抗拒，但在温柔而润滑的指交下，很快放松下来。");
         }
         else
         {
            outputText("你经验丰富的小洞很快便接纳了那根沾满唾液的手指。");
         }
         outputText("你轻轻摩擦着体内，同时用空着的手向上捏弄、揉搓[nipples]。动作变得更顺畅后，你又将第二根手指也推了进去。很快，你敏感的肛门入口便开始渴求更合适的东西，而你也欣然满足它。[pg]");
         get_images().showImage("masti-dildo-anal");
         outputText("你抓起玩具，湿漉漉地舔了好几下，然后抬起[legs]，让这根替代的肉棒去完成它真正的任务。你把顶端在[asshole]上摩擦片刻，终于将它推入体内。断断续续的呻吟从你唇间溢出，屁股终于被急需的坚挺假阳具填满");
         if(get_silly())
         {
            outputText("，这番头韵带来的感觉又进一步挑起你的兴奋");
         }
         outputText("。你脚趾蜷起，开始前后抽动，用顺滑的动作套弄着假阳具。你的舌头从嘴里垂出，呼吸变得沉重，呻吟淫荡地宣泄着纯粹的欲望，而你也逐渐加快节奏。没过多久，你感觉自己的皱口变得更加敏感，知道高潮很快就要来了。");
         get_player().buttChange(8,true,true,false);
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[pg]你在狂喜中呻吟，[vagina]和[cocks]一同喷发出性爱的汁液。");
         }
         else if(get_player().hasCock())
         {
            outputText("[pg]你在狂喜中呻吟，精液从你的[cocks]喷射而出。");
         }
         else if(get_player().hasVagina())
         {
            outputText("[pg]你在狂喜中呻吟，淫液");
            if(get_player().wetness() >= 4)
            {
               outputText("喷涌而出");
            }
            else
            {
               outputText("缓缓淌下");
            }
            outputText("，从你的[vagina]里流出。");
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你的身体在肛门高潮中颤抖摇晃，随后仰面瘫倒下去。那玩具随着你剧烈的心跳一下下被愉悦地夹紧，你就这样休息起来。");
         outputText("[pg]过了一会儿，你收拾好东西，回到了营地。");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(0.5));
         statScreenRefresh();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function deluxeOnaholeUse() : void
      {
         clearOutput();
         get_images().showImage("masti-Onahole");
         if(!get_player().hasStatusEffect(StatusEffects.DeluxeOnaholeUsed))
         {
            get_player().createStatusEffect(StatusEffects.DeluxeOnaholeUsed,0,0,0,0);
            outputText("你脱光衣服，带着新玩具安顿下来。这个玩具在工艺上的用心和细节让你惊讶不已。你不禁想知道，它用起来是否也和看起来一样舒服。[pg]");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("你用空着的那只手把自己的[cocks]拍到“立正”，然后将飞机杯慢慢套上你的肉棒。");
            }
            else
            {
               outputText("你用空着的那只手把自己的鸡巴拍到“立正”，然后将飞机杯慢慢套上你的肉棒。");
            }
            outputText("当你给这个玩具“开苞”时，它真实到令人震惊的触感让你几乎愣住。贾科莫自己肯定也用过这种东西，因为它的感觉简直该死地接近真正的小穴。你尤其喜欢它能用恰到好处的力道夹紧你的方式。");
            outputText("[pg]你毫不犹豫地开始套弄自己的鸡巴，仿佛明天世界就要毁灭。一下又一下的抽动中，你逼迫自己的身体在巨大的高潮脉冲里被撕成两半。玩具内部，你的分身因快感而收紧，激出大量前列腺液涌进套管，让感觉变得更加鲜明。当前列腺液填满玩具小穴的每一道褶皱和缝隙时，它开始变得温热，感觉就像真正湿润润的小穴一样！太棒了！");
            outputText("[pg]你的身体很快回应了你的需求，把大量精液泵进玩具里。你细细品味每一次射出，享受着精液的热度在里面扩散开来、让你的阴茎变得更加温暖的感觉。");
         }
         else if(get_player().cor > 66)
         {
            onaholeRepeatUse(true);
         }
         else
         {
            onaholeRepeatUse(false);
         }
         dynStats(DynStat.Sens(-1.5));
         onaholeContinuation();
      }
      
      public function deluxeDildoAnal() : void
      {
         get_player().slimeFeed();
         clearOutput();
         get_images().showImage("masti-dildo-anal");
         if(get_player().cor > 66)
         {
            outputText("你从随身物品里取出那根软塌塌的粉色假阳具，在营地中央脱下衣服，因这种暴露带来的性兴奋而微微发抖。");
         }
         else if(get_player().cor > 33)
         {
            outputText("你取出那根软塌塌的假阳具，捏了捏它，感受着海绵般的表面微微凹陷，不由得心满意足地叹了口气。你鬼鬼祟祟地四下张望，找了个隐蔽的地方脱下衣服。");
         }
         else
         {
            outputText("你满脸滚烫地抓起那根粉色假阳具。它淫荡地晃来晃去，你跑到几块岩石后面，脱下衣服准备用它。你觉得自己真是个变态。");
         }
         outputText("[pg]");
         if(get_player().cor < 50)
         {
            outputText("你把那根假肉棒举得离自己远远的，虽然已经被勾起欲火，却仍然对它淫猥的形状有些反感。");
         }
         else
         {
            outputText("你握着那根假肉棒，一边捏着它，一边因那逼真的触感咯咯笑了起来。你已经等不及要试试它了。");
         }
         outputText("一滴粉色催情液从顶端渗出，预示着接下来等待你的快感。你特意让它滴在胯间，让液体渗进你的[ass]里。暖意向外扩散，蔓延到你的大腿。");
         outputText("。你");
         if(get_player().cor > 50)
         {
            outputText("毫不");
         }
         outputText("犹豫地");
         if(get_player().cor < 50)
         {
            outputText("慢慢将它送入体内，因[ass]被增强的敏感而喘息起来。");
         }
         else
         {
            outputText("将它狠狠顶进深处，随着它摩擦你如今敏感过度的内壁而呻吟出声。");
         }
         outputText("你张开[legs]，让它留在体内躺在那里，感受着它回应你的兴奋，也让你每一秒都变得更加欲火难耐。[pg]");
         if(get_player().ass.analWetness < 3)
         {
            outputText("玩具的粗度逐渐增加，随着它对你的热意作出反应，把你填得越来越满。你双手抓住它，开始把那根膨胀的肉棒狠狠捅进自己的[asshole]，用力地操弄自己。随着越来越多地精的性药渗入你体内，那感觉也变得越来越强烈。[pg]");
         }
         else if(get_player().ass.analWetness < 5)
         {
            outputText("玩具的粗度似乎在你体内一阵阵跳动、膨胀，一边吸收你不自然的淫液，一边变得更大，把你撑得大开。你双手握住它，开始在自己的[asshole]里进进出出地抽送；假阳具上的每一道凸起和纹理都恰到好处地摩擦着你，让你喘息不止、身体发颤。你的[ass]每一寸都因渴望被触碰、揉搓和挤压而阵阵发麻。");
            if(int(get_player().cocks.length) > 0)
            {
               outputText("就连你的" + get_player().multiCockDescript() + "也隐隐发胀");
               if(get_player().totalCocks() == 1)
               {
                  outputText("");
               }
               outputText("，一阵阵跳动");
               if(get_player().totalCocks() == 1)
               {
                  outputText("");
               }
               outputText("，在你的肚皮上弹动。");
            }
            outputText("你回应着这份需求，把那根肥厚多汁的肉棒更加用力地活塞般捅进自己被撑得紧绷的穴里；每一次抽插，都有细小的液体喷溅出来，让你忍不住低声呻吟。[pg]");
         }
         else
         {
            outputText("你能感觉到假阳具在你体内变大，它对汩汩涌出的肛液作出反应，把你的[ass]撑得大开。即使你开始用它操弄自己，它也没有停下来的意思。倒不如说，它只会越来越粗，直到你的汁液几乎只能贴着它勉强挤出，连臀部都开始发酸。然而，假阳具里那带着春药效果的热烫精液所引发的麻痒快感，压过了这根不断胀大的操弄道具带来的不适；你反而更加用力地抽送，沉醉于被撑到超出平常极限的感觉。[pg]");
         }
         if(get_player().get_sens100() < 80)
         {
            outputText("你几乎是在用那根肿胀的塞穴棒粗暴摧残自己的[ass]，最终把自己送上高潮。你的[hips]猛地离开地面，在空中抵着你的双手颤抖；你把玩具尽可能深地捅进体内。你能感觉到它在你里面喷射，就像真正的男人一样。你扭动着、呻吟着，肌肉痉挛一路蔓延过你的[legs]，让你被榨得精疲力尽。粉色假阳具突然缩回原本的大小，软塌塌地滑了出来，只留下你的[asshole]被撑开，滴滴答答流出一滩粉色精液。");
            dynStats(DynStat.Sens(5));
         }
         else
         {
            outputText("你用那根胀大的玩具粗暴地折腾着被撑开的[asshole]，总算让自己射了出来。你的身体震颤、痉挛，[hips]向空中挺起，仿佛正在和一个不存在的爱人交合。假阳具沉入你的深处，你的双臂本能地满足着自己想被彻底贯穿的欲望。一股温热湿意突然浸湿你的腹部，那根操棒猛地爆发，将你填满。就在那一瞬间，刚才的高潮仿佛只是前戏。你的双眼翻白，身体开始抽搐；药物和你早已过度敏感的屁股让你几乎像是被快感击到发作。你瘫在那里，扭动着、射得脑子一片空白，仿佛持续了一个永恒；但它终究还是结束了。等一切平息时，假阳具已经恢复正常大小，躺在一滩春药和精液之中。");
         }
         get_player().orgasm("Anal");
         updateMasturbation();
         outputText("[pg]");
         get_player().buttChange(get_player().analCapacity() * 0.9,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function deluxeDildo() : void
      {
         get_player().slimeFeed();
         clearOutput();
         if(get_player().hasVagina())
         {
            get_images().showImage("masti-dildo-vag");
            if(get_player().hasVirginVagina())
            {
               outputText("你满脸通红地抓起那根粉色假阳具。它淫荡地晃来晃去，你赶紧跑到几块岩石后面，脱下衣服准备使用它。质感、形状和气味都如此诱人；如果传闻中那种催情剂真有那么强力，那这次一定会非常刺激。");
               outputText("[pg]你坐下来，挑逗般地抚摸那根粉色肉棒，享受着它的触感。顶端开始渗出催情剂，你忍不住对着假阳具饥渴地长长舔了一口。" + (get_silly() ? "这份兴奋甚至比押头韵还要强烈。" : ""));
               outputText("当那甜美的液体触到你的舌尖，一股暖意便扩散到全身。你的[vagina]因渴求而发麻，而你也乐意满足它。你把地精玩具向下调整角度，开始在自己的阴唇间来回摩擦。那种增强性欲的液体不断刺激着你，让你的阴唇因敏感与欢愉而颤动。");
               outputText("光滑的玩具擦过你的[clit]时，快感几乎灼烧起来。你血液里翻腾着被填满的强烈渴望，身体也在呼喊着想要被插入。你的处女小穴太珍贵了，不能就这么屈服于欲望；但你还是妥协了，把假肉棒的顶端抵在自己纯洁的入口上。它摩擦着那细小而无垢的开口，将珍贵的粉色汁液渗入其中，你感到一阵释然，可这依然不够。你一只手掐住自己的[nipples]，另一只手则用假阳具施加更大的压力。");
               outputText("你试图抗拒那股撕开贞洁的冲动，却只是徒劳。欲望彻底压倒了你，你更加用力地顶向自己的入口，终于插进那未经人事的甬道。你喉间逸出一声喘息，泪水也在眼眶中打转，但其中没有疼痛，只有药物催生的狂喜。");
               outputText("<b>你的处女膜被撕裂，夺走了你的处女之身。</b>");
               outputText("[pg]你欣然屈服于女人身体的需求，让肉棒在自己深处不断抽插。你感谢所有能想到的神明，赐予你的第一次如此强烈的快感。当你的鲜血和淫液渗进这件设计精巧的玩具时，它开始变大，撑开你已经受创的内壁。那根假造的品红色阳具填满你饥渴[vagina]里的每一处缝隙，你的肌肉控制也随之瓦解。双腿之间的性器肌肉抽搐颤抖着，将你推向此生最强烈的高潮之一。");
               outputText("[pg]你拼命不让玩具滑出去，双手伸到腿间，将那根肉棒牢牢按在原处。你侧躺下来，大腿夹住自己的手和手腕。你感觉一股股精液从这件美妙的性玩具中喷涌而出，过度的刺激让你一阵眩晕。等你终于平静下来，那根豪华假阳具突然缩回原本大小，轻易地从你的[vagina]里滑了出来。");
               outputText("[pg]黏滑的粉色精液从你刚被撑开的肉穴里流淌出来，而你也渐渐睡了过去。");
               get_player().orgasm("Vaginal");
               updateMasturbation();
               outputText("[pg]");
               get_player().cuntChange(get_player().vaginalCapacity() * 0.9,true);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().cor > 66)
            {
               outputText("你从随身物品里取出那根软塌塌的粉色假阳具，在营地中央脱下衣服，因这种暴露带来的性兴奋而微微发抖。");
            }
            else if(get_player().cor > 33)
            {
               outputText("你取出那根软塌塌的假阳具，捏了捏它，感受着海绵般的表面微微凹陷，不由得心满意足地叹了口气。你鬼鬼祟祟地四下张望，找了个隐蔽的地方脱下衣服。");
            }
            else
            {
               outputText("你满脸滚烫地抓起那根粉色假阳具。它淫荡地晃来晃去，你跑到几块岩石后面，脱下衣服准备用它。你觉得自己真是个变态。");
            }
            outputText("[pg]");
            if(get_player().cor < 50)
            {
               outputText("你把那根假肉棒举得离自己远远的，虽然已经被勾起欲火，却仍然对它淫猥的形状有些反感。");
            }
            else
            {
               outputText("你握着那根假肉棒，一边捏着它，一边因那逼真的触感咯咯笑了起来。你已经等不及要试试它了。");
            }
            outputText("一滴粉色催情液从顶端渗出，让你预感到接下来会有多么愉悦。你赶紧让它滴在胯间，任由液体渗入你的[vagina]。暖意向外扩散，蔓延到大腿间，你的[clit]");
            if(get_player().getClitLength() < 0.5)
            {
               outputText("变得坚硬而敏感");
            }
            else if(get_player().getClitLength() < 3)
            {
               outputText("从阴唇褶皱间探出来");
            }
            else if(get_player().getClitLength() < 6)
            {
               outputText("充血起来，像一根小小的肉棒般勃起");
            }
            else
            {
               outputText("充血起来，像男人的肉棒一样抽动、搏动");
            }
            outputText("。你");
            if(get_player().cor > 50)
            {
               outputText("毫不");
            }
            outputText("犹豫地");
            if(get_player().cor < 50)
            {
               outputText("，随后慢慢将它送入体内，[vagina]骤然变得更加敏感，令你喘息起来。");
            }
            else
            {
               outputText("将它狠狠顶进深处，随着它摩擦你如今敏感过度的内壁而呻吟出声。");
            }
            outputText("你分开[legs]，任由它插在体内，就这样躺着感受它对你的湿润作出反应，而你也一秒比一秒更加兴奋。[pg]");
            if(get_player().vaginas[0].vaginalWetness < 3)
            {
               outputText("玩具的粗度逐渐增加，随着它对你体液产生反应，把你填得越来越满。你双手握住它，开始把它一次次猛插进你的[vagina]，用这根不断胀大的阳具激烈地干着自己。随着越来越多地精的性药渗入体内，快感也不断攀升。连你的[clit]和阴唇都因渴求而发麻。你回应着这份渴望，加快节奏，越来越快地抽送起来。[pg]");
            }
            else if(get_player().vaginas[0].vaginalWetness < 5)
            {
               outputText("玩具的周径似乎在你体内一阵阵搏动、膨胀，一边吸收你自然涌出的湿润，一边变得更大，把你撑得大开。你双手握紧它，开始在[vagina]里来回抽送；假阳具上的每一道凸起、每一处细节都恰到好处地摩擦着你，让你喘息颤抖。你下身的每一寸都因渴望被触碰、摩擦和挤捏而发麻。");
               if(int(get_player().cocks.length) > 0)
               {
                  outputText("就连你的" + get_player().multiCockDescript() + "也隐隐发胀");
                  if(get_player().totalCocks() == 1)
                  {
                     outputText("");
                  }
                  outputText("，一阵阵跳动");
                  if(get_player().totalCocks() == 1)
                  {
                     outputText("");
                  }
                  outputText("，在你的肚皮上弹动。");
               }
               outputText("你回应着这份需求，把那根肥厚多汁的肉棒更加用力地活塞般捅进自己被撑得紧绷的穴里；每一次抽插，都有细小的液体喷溅出来，让你忍不住低声呻吟。[pg]");
            }
            else
            {
               outputText("你能感觉到假阳具在你体内变大，它对汹涌涌出的雌性体液作出反应，把你的[vagina]撑得大大张开。即使你开始用它自慰，它也丝毫没有停下来的意思。恰恰相反，它似乎只会越来越粗，直到你的淫液几乎没空隙从它周围喷出来，连臀部都开始发酸。然而，假阳具那催情精液带来的灼热酥麻感压过了这根不断变粗的抽插玩具带来的不适，你越发用力地摆弄它，沉醉于自己被撑到超出平常极限的感觉。[pg]");
            }
            if(get_player().get_sens100() < 80)
            {
               outputText("你几乎是用那根膨胀的塞穴玩具粗暴地蹂躏着自己的小穴，终于把自己送上高潮。你的[hips]猛地离地，在你的双手间悬在空中颤抖，而你把玩具尽可能深地顶进体内。你能感觉到它在你里面喷射，就像真正的男人一样。你扭动着身体，呻吟出声，肌肉痉挛一路蔓延到你的[legs]，让你被榨得精疲力尽。粉色假阳具突然缩回原本的大小，软塌塌地滑了出来，留下你的[vagina]被撑开，淌出一滩粉色精液。");
               dynStats(DynStat.Sens(5));
            }
            else
            {
               outputText("你用那根鼓胀的玩具粗暴地蹂躏着被撑开的泄欲肉穴，总算让自己高潮了。你的身体剧烈震颤、抽搐，[hips]高高挺向空中，仿佛在和一个想象中的情人交合。假阳具沉入你最深处，你的双臂本能地满足着自己被彻底贯穿的欲望。突然，一股温热的湿意浸透了你的子宫，那根抽插棒猛然喷发，将你填满。就这么一下，你刚才的高潮仿佛都只算前戏。你的双眼翻了上去，身体开始痉挛，药物和早已敏感过度的骚穴几乎让你像快感发作一样失控。你瘫在那里，扭动着、高潮着，爽到脑子一片空白，感觉仿佛过了永恒之久；但它终究还是结束了。等一切平息时，假阳具已经恢复了正常大小，躺在一滩催情液和淫液之中。");
            }
            if(get_game().jojoScene.campCorruptJojo())
            {
               outputText("[pg]当你站起身来试着清理自己时，你发现乔乔就在远处的树林里，");
               if(get_player().hasStatusEffect(StatusEffects.TentacleJojo))
               {
                  outputText("他那些触手正把老鼠精液溅得到处都是，显然是看着你的表演射了出来。");
               }
               else
               {
                  outputText("他在欣赏完你无意间上演的表演后射了出来，把老鼠精液溅了自己一身。你还没来得及反应，他就跑掉了。");
               }
            }
            get_player().orgasm("Vaginal");
            updateMasturbation();
            outputText("[pg]");
            get_player().cuntChange(get_player().vaginalCapacity() * 0.9,true);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function centaurNippleCunt() : void
      {
         var _loc1_:Boolean = false;
         outputText("你脱下[armor]，");
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("一边情欲高涨地喘息，想象着自己抚弄[nipples]时被人撞见的样子。");
         }
         else if(get_player().cor < 33)
         {
            outputText("低头看向自己的[nipples]时，脸上微微泛红。");
         }
         else if(get_player().cor < 66)
         {
            outputText("暴露在外的[nipples]被空气一拂，你不由得打了个哆嗦。");
         }
         else
         {
            outputText("你毫不掩饰地盯着自己的[nipples]看，忍不住暗自微笑。");
         }
         outputText("这些开口柔软、敏感又湿滑，你将一根指尖缓缓探入");
         if(get_player().totalNipples() > 2)
         {
            outputText("其中两个");
         }
         outputText("开口里。");
         if(get_player().biggestTitSize() > 2)
         {
            outputText("突如其来的挤入让你的[breasts]诱人地晃动起来，这一下也把一阵阵快感深深送进你的体内。");
         }
         else
         {
            outputText("这些开口很浅，最多只能容下一截指尖，但里面的肉壁异常敏感，将一波波快感射向你身体深处。");
         }
         outputText("你空着的手指缓缓抚过[nipples]唇瓣的外缘，直到在开口上方内侧摸到一颗细小而敏感、像阴蒂般的凸起时才停下。[pg]");
         get_images().showImage("masti-centaur-nipple");
         outputText("你因快感而颤抖，只好跪下来，免得双腿支撑不住。你一边玩弄那些湿滑的乳头小穴，感受着它们随着你越来越兴奋而变得坚硬、肿胀，[face]也烧得更加滚烫。");
         if(get_player().biggestLactation() > 1)
         {
            outputText("浓稠乳白的润滑液顺着你乳房的曲线流淌而下，你的自慰无意间催出了乳汁。");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("一缕缕润滑液顺着你乳房的曲线流下，胸前小穴则紧紧夹住侵入其中的手指。");
         }
         else
         {
            outputText("你用手指抽插着胸前小穴，湿滑的润滑液在指间发出黏腻的声响。");
         }
         outputText("你呻吟着俯下身，把第二根手指也塞进每个小穴里，同时用拇指揉弄那些迷你阴蒂，逐渐逼近高潮。[pg]");
         if(get_player().hasVagina() || get_player().hasCock())
         {
            _loc1_ = false;
            outputText("始终没有被碰过一下，你的");
            if(get_player().hasCock())
            {
               if(get_player().hasVagina())
               {
                  outputText("[cocks]和[vagina]");
               }
               else
               {
                  outputText(get_player().cockDescript());
               }
               if(get_player().hasVagina() || get_player().totalCocks() > 1)
               {
                  _loc1_ = true;
               }
            }
            else
            {
               outputText(get_player().vaginaDescript());
            }
            if(_loc1_)
            {
               outputText("也渗出各自的体液，因你无法伸手满足的酸胀与渴求而颤动。");
            }
            else
            {
               outputText("渗出自身的淫液，因你无法触及并满足的酸胀与欲求而颤抖不已。");
            }
            if(get_player().totalCocks() > 1)
            {
               outputText("随着肌肉绷紧，你感觉每根[cocks]都拍打着你的肚子，尽可能从你的雄性本钱中榨取快感。");
            }
            else if(get_player().totalCocks() == 1)
            {
               outputText("随着肌肉绷紧，你感觉你的[cocks]拍打着肚子，尽可能从你的雄性本钱中榨取快感。");
            }
            if(get_player().balls > 0)
            {
               outputText("你的[balls]在囊袋里微微晃动，一次次紧缩着贴向身体，随时准备释放。");
            }
            outputText("[pg]");
         }
         outputText("一阵缓慢的收缩从你每个[nipples]深处开始。它向着[breasts]表面蔓延时愈发强烈，最终攀升到顶点，将你推上快感的巅峰。你的眼睛向上翻去，在高潮的 bliss 中瘫软下来，手指仍不停抽插着你湿滑的乳孔。吵闹的湿润咕叽声和连绵不断的呻吟，把你从快感引发的恍惚中唤醒，最终让你回到现实。[pg]");
         if(get_player().hasCock())
         {
            if(get_player().cumQ() < 50)
            {
               outputText("一小滩精液已经在你身下积起，");
            }
            else if(get_player().cumQ() < 200)
            {
               outputText("一滩不小的白色精液已经在你身下积起，");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("一大滩白色精液已经在你身下积起，甚至溅到了你的下腹，");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("一滩冒着泡的浓稠精液已经在你身下积起，浸湿了你的双腿和下腹，");
            }
            else
            {
               outputText("一小片精液湖泊围在你周围，");
            }
            outputText("那是被这场强烈高潮从你的[cocks]中释放出来的。");
            if(get_player().hasVagina())
            {
               outputText("");
            }
         }
         if(get_player().hasVagina())
         {
            if(get_player().wetness() < 2)
            {
               outputText("小穴的气味弥漫在空气中，缠绕着你湿润而肿胀的阴唇。");
            }
            else if(get_player().wetness() < 4)
            {
               outputText("空气里满是发情马穴的气味。若你后腿之间那湿漉漉的感觉说明了什么，那你的后半身现在看起来、闻起来大概都像一匹发情的母马。");
            }
            else if(get_player().wetness() < 5)
            {
               outputText("空气里饱含着发情马穴那令人迷醉的气味；若你后腿之间的湿意说明了什么，那你的后臀对任何敢于进入你的人来说，都会是一条滑溜溜的快感滑道。");
            }
            else
            {
               outputText("空气中充满了你那兽性马穴浓重的麝香气息。若那些一路滴落到蹄子的湿痕说明了什么，那你或许得学着习惯这种味道了。");
            }
         }
         if(get_player().hasCock() || get_player().hasVagina())
         {
            outputText("[pg]");
         }
         outputText("从天色判断，至少已经过去了一个小时。你叹了口气，把僵硬的手指从酸痛的[nipples]里拔出来，用掌心揉了揉发疼的入口，然后爬回[feet]上。穿好衣服时，你清楚地意识到，这场美妙的指交让你感觉好了太多。");
         if(get_player().cor > 66)
         {
            outputText("你已经迫不及待想再来一次了。");
         }
         else if(get_player().cor > 33)
         {
            outputText("你有点困惑，自己竟然会如此享受这种变态的行为。");
         }
         else
         {
            outputText("你为应付内心的变态欲望而做出的事，令你感到惊恐。");
         }
         get_player().orgasm("Nipples");
         dynStats(DynStat.Sens(-0.5));
      }
      
      public function centaurMasturbation() : Boolean
      {
         clearOutput();
         var _loc1_:Boolean = get_player().hasCock() && get_player().get_tallness() * 0.8333333333333334 < get_player().cocks[get_player().longestCock()].cockLength;
         if(get_player().hasFuckableNipples())
         {
            if(_loc1_ && Utils.rand(2) == 0)
            {
               centaurHugeCock();
               return true;
            }
            centaurNippleCunt();
            return true;
         }
         if(_loc1_)
         {
            centaurHugeCock();
            return true;
         }
         centaurCantMasturbate();
         return false;
      }
      
      public function centaurHugeCock() : void
      {
         var _loc1_:int = get_player().longestCock();
         var _loc2_:Boolean = int(get_player().cocks.length) > 1;
         outputText("你把[armor]从身上褪下，不过作为半人马，它本来也挡不住你的[cocks]。");
         if(get_player().cor < 33)
         {
            outputText("失望又羞愧地叹了口气，");
         }
         else if(get_player().cor < 66)
         {
            outputText("认命般叹了口气，");
         }
         else
         {
            outputText("兴奋地笑着，");
         }
         outputText("你脸上一红，只见");
         if(_loc2_)
         {
            outputText("每一根");
         }
         outputText("你的[cocks]在你身下膨胀，从你马一样的后躯垂下，因为");
         if(!_loc2_)
         {
            outputText("它变得又胀又硬。");
         }
         else
         {
            outputText("它们变得又胀又硬。");
         }
         if(_loc2_)
         {
            outputText("片刻之后，它们从你的前腿下方探出来，得意地展示着你的[cocks]。");
         }
         else
         {
            outputText("片刻之后，它从你的前腿下方探出来，得意地露出你的[cockhead " + (_loc1_ + 1) + "]。");
         }
         if(get_player().get_tallness() * 1.5 < get_player().cocks[get_player().longestCock()].cockLength)
         {
            outputText("没过多久，你就因为长度而几乎无法动弹");
            if(_loc2_)
            {
               outputText("所有");
            }
            outputText("你的[cocks]就因长度惊人，几乎让你动弹不得。");
         }
         outputText("[pg]");
         get_images().showImage("masti-centaur-huge");
         if(get_player().get_tallness() * 1.5 >= get_player().cocks[get_player().longestCock()].cockLength)
         {
            outputText("你弯下身，用双手抓住");
            if(_loc2_)
            {
               outputText("一根");
            }
            else
            {
               outputText("你的");
            }
            outputText(get_player().cockDescript(_loc1_) + "，将它抬起来，紧紧按在腹部，同时开始抚弄它敏感的下侧。");
            if(get_player().cumQ() > 500)
            {
               outputText("浓稠的前列腺液开始从你的顶端一股股淌下，被你惊人的性液分泌量硬生生挤了出来。");
            }
            else if(get_player().cumQ() > 100)
            {
               outputText("随着你越来越投入，一缕前列腺液开始从顶端渗出。");
            }
            else
            {
               outputText("随着你渐渐投入，一小滴前列腺液慢慢在你的顶端凝聚起来。");
            }
            if(get_player().hasVagina())
            {
               outputText("你被冷落的[vagina]渴望着被插入，可你现在这种状态根本不可能够得到它。");
            }
            outputText("你叹了口气，庆幸自己用这具身体至少还能爱抚一个性器官");
            if(get_player().cor < 40)
            {
               outputText("，但你也担心自己正在堕入这个奇异世界潜藏的变态欲望之中");
            }
            outputText("。那感觉实在太舒服了，你闭上眼睛，愉悦地嘶鸣起来。[pg]");
            outputText("你把前列腺液抹在顶端，用手掌揉过敏感的龟头，舒服得几乎站不稳。与此同时，你的另一只手也没闲着，爱抚着下侧，抚弄着你勉强能够到的那一小段。即使能碰到的地方有限，你依然能感觉到自己的" + get_player().cockDescript(_loc1_) + "在掌中搏动，在每一次触碰与爱抚下变得更加坚硬。");
            if(get_player().totalCocks() == 2)
            {
               outputText("你的另一根肉棒也模仿着它幸运兄弟的快感，尽管为了让你专注于当前的“玩具”，它被冷落了。");
            }
            else if(get_player().totalCocks() > 2)
            {
               outputText("你的其他[cocks]也模仿着它们幸运兄弟的快感，尽管为了让你专注于当前的“玩具”，它们被冷落了。");
            }
            outputText("你的后腿一软，整个人瘫了下去，只能用前腿撑住身体；你颤抖不止，毫无疑问，高潮就要来了。[pg]");
         }
         else
         {
            outputText("你弯下身，用双手抓住");
            if(_loc2_)
            {
               outputText("一根");
            }
            else
            {
               outputText("你的");
            }
            outputText(get_player().cockDescript(_loc1_) + "，将它抬起来，让它微微弯起，然后开始用绵长而流畅的爱抚抚弄下侧。你甚至设法弯下身舔了它一下，惹得自己在快感中一阵战栗。");
            if(get_player().cumQ() > 500)
            {
               outputText("浓稠的前列腺液开始从你的顶端一股股淌下，被你惊人的性液分泌量硬生生挤了出来。");
            }
            else if(get_player().cumQ() > 100)
            {
               outputText("随着你越来越投入，一缕前列腺液开始从顶端渗出。");
            }
            else
            {
               outputText("随着你渐渐投入，一小滴前列腺液慢慢在你的顶端凝聚起来。");
            }
            if(get_player().hasVagina())
            {
               outputText("你被冷落的[vagina]渴望着被插入，可你现在这种状态根本不可能够得到它。");
            }
            outputText("你叹了口气，庆幸自己能用这具身体爱抚自己的性器官");
            if(get_player().cor < 33)
            {
               outputText("，但你也担心自己正在堕入这个奇异世界潜藏的变态欲望之中");
            }
            outputText("。感觉实在太舒服了，你闭上眼睛，双手抚弄着自己巨大的肉棒，愉悦地发出马嘶般的叫声。[pg]");
            outputText("你把流出的前液抹在龟头上，手掌碾过敏感的顶端，刺激得你几乎站不稳。与此同时，另一只手也充分利用起你惊人的长度，用绵长而流畅的动作套弄着你。没过多久，你就感觉到你的" + get_player().cockDescript() + "在掌中搏动，随着你狂热的抚弄变得越来越硬。");
            if(get_player().totalCocks() == 2)
            {
               outputText("你的另一根肉棒也模仿着它幸运兄弟的快感，尽管为了让你专注于当前的“玩具”，它被冷落了。");
            }
            else if(get_player().totalCocks() > 2)
            {
               outputText("你的其他[cocks]也模仿着它们幸运兄弟的快感，尽管为了让你专注于当前的“玩具”，它们被冷落了。");
            }
            outputText("你的后腿一软，整个人瘫了下去，只能用前腿撑住身体；你颤抖不止，毫无疑问，高潮就要来了。[pg]");
         }
         if(get_player().get_tallness() * 1.5 >= get_player().cocks[get_player().longestCock()].cockLength)
         {
            outputText("紧紧包裹住你的" + get_player().cockHead());
         }
         else
         {
            outputText("用力抽动");
         }
         outputText("，你射精了，每一次");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]");
         }
         else
         {
            outputText("喷发，都让释放的快感流遍全身");
         }
         outputText("。你弓起背，将精液猛地射出，浑身颤抖着喷向空中。它湿漉漉地溅在一块岩石上，顺着如今黏滑的表面");
         if(get_player().cumQ() < 50)
         {
            outputText("流淌而下，直到你终于在上面射完。");
         }
         else if(get_player().cumQ() < 200)
         {
            outputText("流淌而下，而你还在不断把更多精液射到上面。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("流淌而下，而你还在像喷泉一样把越来越多的精液洒在上面。等你终于结束时，岩石底部已经积起了一小滩，你也把那块石头彻底裹上了一层精液。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("流淌而下，而你还在继续用精液轰射着它。精液在它下方积成一滩，慢慢扩散，并渗进贫瘠的土地里。");
         }
         else
         {
            outputText("流淌而下，而你还在继续把精液喷得到处都是。浓稠的精液在底部积成厚厚一滩，不断扩散，直到连你的蹄子都被裹了进去。");
            if(get_player().cumQ() > 3000)
            {
               outputText("当你终于射完时，那滩精液变得更深了。它足有几英寸厚，每当你迈出一步都会四处飞溅。");
            }
         }
         outputText("你瘫倒回去，仍因快感而颤抖，同时感觉到你的");
         if(!_loc2_)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴茎");
         }
         if(get_player().hasSheath())
         {
            if(_loc2_)
            {
               outputText("慢慢软下来，滑回你的阴鞘里。");
            }
            else
            {
               outputText("正慢慢软下来，滑回你的阴鞘里。");
            }
         }
         else if(get_player().minLust() > 40 || get_player().get_lib100() > 50)
         {
            if(_loc2_)
            {
               outputText("稍微软了一些。你似乎这么需要性爱，这倒也不让你意外。");
            }
            else
            {
               outputText("正稍微软下来一些。你似乎这么需要性爱，这倒也不让你意外。");
            }
         }
         else if(_loc2_)
         {
            outputText("慢慢软下来，逐渐缩小。");
         }
         else
         {
            outputText("正慢慢软下来，逐渐缩小。");
         }
         outputText("[pg]");
         if(get_player().hasVagina())
         {
            if(get_player().wetness() <= 1)
            {
               outputText("一缕湿液顺着你的大腿淌下，随着你的高潮，空气中弥漫起半人马交合后的气味。");
            }
            else if(get_player().wetness() == 2)
            {
               outputText("体液顺着你的大腿流下，随着你达到高潮，空气中弥漫起半人马交合后的气味。");
            }
            else if(get_player().wetness() == 3)
            {
               outputText("浓稠而清澈的液体浸湿了你的大腿，随着你达到高潮，空气中弥漫起半人马淫液的气味。");
            }
            else if(get_player().wetness() == 4)
            {
               outputText("浓稠的液体裹满你的大腿，滴落到地上汇成一摊。随着你达到高潮，空气中弥漫着半人马淫液刺鼻的气味。");
            }
            else
            {
               outputText("一股股体液从你的大腿间喷涌而出，在你高潮时将大腿上部覆上一层浓厚而清澈的女性润滑液。你的液态半人马欲望不断滴落，在后腿之间迅速积成一滩，空气中也充满了它的气味。");
            }
            if(get_player().hasFuckableNipples())
            {
               if(get_player().totalNipples() > 2)
               {
                  outputText("你所有的");
               }
               else
               {
                  outputText("你那");
               }
               outputText("" + Utils.num2Text(get_player().totalNipples()) + "颗[nipples]一阵颤抖，");
               if(get_player().wetness() < 4 && get_player().biggestLactation() < 2)
               {
                  outputText("渗出");
               }
               else if(get_player().wetness() < 5 && get_player().biggestLactation() < 3)
               {
                  outputText("滴下");
               }
               else
               {
                  outputText("喷出");
               }
               outputText("等量的");
               if(get_player().biggestLactation() < 1)
               {
                  outputText("清澈的");
               }
               else
               {
                  outputText("掺着奶液的");
               }
               outputText("润滑液。你停下来，用手指抚弄它们的入口，随着高潮慢慢平息，你不自觉地颤抖起来。");
            }
            outputText("[pg]");
         }
         outputText("暂时满足后，你休息了大约一个小时，才重新用四蹄站起身来。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-0.5));
      }
      
      public function centaurGirlsGetHorseAids() : void
      {
         clearOutput();
         if(get_player().keyItemv1("Centaur Pole") == 0)
         {
            if(get_player().cor < 50)
            {
               outputText("你觉得有些心痒难耐，决定试试惠特尼那个所谓的[say: 半人马柱]。你把它从藏物处翻出来，笨拙地花了几分钟把它拖到僻静的地方架好。[pg]");
            }
            else
            {
               outputText("由于半人马形态让你没法满足自己的欲望，你决定拿惠特尼的半人马玩具派上用场。你从储物处翻出半人马柱，把它拖到营地中央。[pg]");
            }
         }
         outputText("等你把它准备好后，这根[say:柱子]看起来还真挺有气势。那是一座大型金属雕像，造型似乎是个尺寸格外雄伟的小恶魔；他强壮的双腿之间，骄傲地展示着一根巨大、龟头外扩的马阳具。你试探性地抚弄了几下那根硕大的紫色阳具，令你惊喜的是，它竟像真正勃起一样膨胀起来，在你掌中变得硬如岩石。你舔了舔嘴唇，终于忍不住把那根阳具含进嘴里。[pg]");
         outputText("虽然尝起来有些橡胶味，但那根肉棒的分量和尺寸在你体内感觉……正合适……你幸福地吮吸了这根马阳具假棒好几分钟，把它弄得湿滑无比，准备好迎接自己。等你觉得小恶魔雕像的老二已经润滑得足够充分后，你让它从嘴里弹出来，确认它依旧笔直地从雕像上挺出，然后转过身去。[pg]");
         outputText("你的[hips]满怀期待地扭动着，努力把已经准备好的" + get_player().vaginaDescript() + "对准那根马阳具假棒。由于你的马臀挡住视线，看不见玩具，你焦急地摸索了好一会儿，才终于感觉到它外扩的顶端抵上了你的马穴。你向后挪动身体，随着那根粗大的马阳具推进体内，你愉悦地喘息起来。你越是吞入它，它就仿佛越在你体内充气、膨胀，直到你被紫色橡胶彻彻底底填满——甚至还不止如此。那根阳具仍在继续变大，撑开你的[vagina]，令你闷哼出声，最后发出一声痛苦的呜咽。");
         get_player().cuntChange(get_player().vaginalCapacity() - 3,true,true,false);
         outputText("[pg]");
         get_images().showImage("masti-centaur-cPole-female");
         outputText("不过就在这时，那根阳具似乎停了下来。它在你体内安定下来时，你又哼又喘，直到只剩下适度而愉快的撑胀感，才终于松了口气。可现在你被假马阳具塞得满满当当，一时却不知道接下来该怎么办……[say:咿呀！]小恶魔雕像的双手突然伸出，抓住了你的[hips]，你惊叫出声。你睁大眼睛，感觉那根粗大的假棒正从你的小穴里抽出，小恶魔的胯部也随之后撤。[pg]");
         outputText("你只来得及绝望地咒骂一声，那玩具便猛地重新撞进你体内。那一下冲击既猛烈又令人头脑发麻地愉悦，你试图向前跳开，却被它有力的双手牢牢按住。雕像开始粗暴地干你，强劲的抽插一次次深入你的[vagina]，直到那根假棒不断撞击你的宫颈，你又叫又喊。阳具内部有什么东西开始收缩又膨胀，改变着你体内那根棒子的粗细与分量，把你小穴的内壁撑得更开，直到你舌头垂出、双眼上翻，彻底被快感淹没。[pg]");
         outputText("一股滚烫黏稠的液体涌入你体内，你意识到自己的高潮也快来了。雕像将一大股炽热的仿真精液射入你的子宫，用那奇异的种子灌满你的小穴，你在快感中放声尖叫。被填得如此彻底、如此满溢，你根本无法再压抑高潮。你射了，你的[vagina]紧紧夹住埋在体内的假阳具，像榨取一般逼出更多浓稠乳白的精液。[pg]");
         outputText("当高潮终于退去时，你已经四肢着地地瘫倒在地，头晕目眩地摇晃着，而雕像仍不断将一缕缕精液滴落到你的[ass]上。你摇摇晃晃地站起身，开始拆下这根柱子。你把它拖回储物处，每走一步，臀间都会发出淫靡的湿黏声，大团假精液从你的马穴里漏出来。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
         get_player().addKeyValue("Centaur Pole",1,1);
      }
      
      public function centaurDudesGetHorseAids() : void
      {
         var _loc2_:* = null as IMap;
         var _loc3_:int = 0;
         var _loc4_:* = null as Player;
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         if(get_player().keyItemv1("Fake Mare") == 0)
         {
            if(get_player().cor < 50)
            {
               outputText("你决定试试惠特尼给你的那具母马般的阴茎套。你花了几分钟，笨拙地把那坨金属拖到某个僻静处并架设起来。完事后，你站在一具木铁制成的母马复制品身后，它的高度已经调到最适合你的位置。你打量着[say:她]，目光被她两腿之间那对光滑的黑色飞机杯唇瓣吸引过去；它被巧妙地做成了母马小穴的形状，而上方似乎还有一个更小的开口，模拟着肛门。[pg]");
            }
            else
            {
               outputText("你决定玩玩惠特尼给你的母马形阴茎套。你把它从储物处拖出来，花了几分钟在营地中央架设好。完事后，你站在一具木铁制成的母马复制品身后，它的高度已经调到最适合你的位置。你打量着[say:她]，目光被她两腿之间那对光滑的黑色飞机杯唇瓣吸引过去；它被巧妙地做成了母马小穴的形状，而上方似乎还有一个更小的开口，模拟着肛门。[pg]");
            }
         }
         outputText("看着玩具暴露在外、张开的性器，你感觉自己的[cocks]有了反应。你渴望抚弄自己，可和往常一样，半人马的下半身妨碍了你。你恼火地哼了一声，小跑到玩具旁，试探性地把拳头插进它宽大的小穴里。");
         if(get_player().cockArea(_loc1_) < 30)
         {
            outputText("你的手轻松地滑了进去……毕竟它是为真正的马屌准备的，对你来说有点太大，根本带不来什么快感。你的目光移向玩具的假肛门，那里看起来更合你的尺寸。");
         }
         else
         {
            outputText("你的拳头轻松地滑了进去，你对着玩具预先抽插了几下，确认它已经润滑充分，准备好迎接你粗大的肉棒。");
         }
         outputText("[pg]");
         outputText("确认玩具已经准备好后，你哒哒地后退几步，然后猛冲上前。你轻松地骑上玩具，腹部擦过它光滑温热的背，直到胸口撞上母马的头。你抓住她的肩膀支撑身体，开始挺动臀部，你的" + get_player().cockDescript(_loc1_) + "四处顶弄，寻找入口。最后，你感觉到肉棒的顶端");
         if(get_player().cockArea(_loc1_) < 30)
         {
            outputText("抵在玩具肛门紧窄的环口上");
         }
         else
         {
            outputText("对准玩具张开的阴户");
         }
         outputText("。你抬起[hips]，猛地插进母马早已等候的穴里。[pg]");
         get_images().showImage("masti-centaur-cPole-male");
         outputText("玩具的甬道似乎在你的" + get_player().cockDescript(_loc1_) + "周围挪动、收缩，塑形般完美地将你包裹其中。真是个了不起的小玩具！你一路向前滑去，直到整根没入，胯部贴上母马宽大的屁股，[chest]则紧压在她背上。如今你已经完全骑了上去，开始对着母马玩具抽送起来，让你的臀部");
         if(get_player().balls > 0)
         {
            outputText("和[balls]");
         }
         outputText("重重拍打在她的臀上，同时不断顶入她紧致滑腻的");
         if(get_player().cockArea(_loc1_) >= 30)
         {
            outputText("马穴");
         }
         else
         {
            outputText("肛门");
         }
         outputText("。[pg]");
         outputText("终于得到了自己无法独自获得的释放，你感觉高潮正在体内深处积蓄。你一边越来越快地挺动着玩具，一边发出响亮的马嘶，用你的" + get_player().cockDescript(_loc1_) + "狠狠贯穿她，直到快感彻底吞没你。你在射精时放声叫喊，将半人马精液尽可能射进玩具深处");
         if(get_player().countCockSocks("gilded") > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,899) < get_player().countCockSocks("gilded"))
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,899,FlagDict_Impl_.arrayReadInt(_loc2_,899) + 1);
            _loc3_ = midasCockJackingGemsRoll();
            outputText("。[pg]得到满足后，你又花了几分钟，陶醉地享受着这个母马般的飞机杯带来的温暖与紧致，直到你的" + get_player().cockDescript(_loc1_) + "在里面软下来。你从她身上跳下，重新落回四只马蹄上。<b>你惊讶地看到闪闪发亮的宝石正从她的");
            if(get_player().cockArea(_loc1_) >= 30)
            {
               outputText("马穴");
            }
            else
            {
               outputText("肛门");
            }
            outputText("里涌出来，于是赶紧把这" + _loc3_ + "颗全都收集起来。</b>确认自己没有漏掉任何亮晶晶的东西后，你把玩具拆开，拖回自己的藏物处。");
            _loc4_ = get_player();
            _loc4_.set_gems(_loc4_.get_gems() + _loc3_);
         }
         else
         {
            outputText("，直到她被灌得满满当当，开始漏到地上。[pg]");
            outputText("得到满足后，你又花了几分钟，陶醉地享受着这个母马般的飞机杯带来的温暖与紧致，直到你的" + get_player().cockDescript(_loc1_) + "在里面软下来。你从她身上跳下，重新落回四只马蹄上。你满足地打了个哈欠，把玩具拆开，拖回自己的藏物处，而你的精液一路都从里面漏个不停。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
         get_player().addKeyValue("Fake Mare",1,1);
      }
      
      public function centaurCantMasturbate() : void
      {
         var _loc1_:* = null as IMap;
         get_images().showImage("masti-centaur-fail");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,60) == 0)
         {
            outputText("不管你怎么扭来扭去，都够不到自己的");
            if(get_player().hasCock() || get_player().hasVagina())
            {
               outputText("生殖器");
            }
            else
            {
               outputText("任何稍微带点性意味的地方");
            }
            outputText("！看来成为半人马有个相当要命的缺点——你根本够不到自己，没法自慰来满足欲望！[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,60,FlagDict_Impl_.arrayReadInt(_loc1_,60) + 1);
         }
         else
         {
            outputText("你还是够不到自己，没法自慰。半人半马还真是不方便！[pg]");
         }
         if(get_player().hasKeyItem("Cock Milker - Installed At Whitney\'s Farm") && int(get_player().cocks.length) > 0)
         {
            outputText("也许你可以去惠特尼的农场，使用你安置在那里的阴茎榨乳器来排解这股欲火？又或者，你只能去别处找个愿意帮忙的伴了。");
         }
         else
         {
            outputText("看来你得找个伴来发泄积压的欲望了，不过以你现在的状态，不管找到什么，多半都只能当被插的那一方！");
         }
      }
      
      public function catAutoLick() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         var _loc3_:* = null as Player;
         clearOutput();
         get_images().showImage("masti-lick-boy");
         if(!get_player().hasPerk(PerkLib.Flexibility))
         {
            outputText("你脱下[armor]，在地上坐下，你的" + get_player().cockDescript() + "直直指向自己的脸。你抚弄了几下勃起的肉棒，随后想起村里的那些猫。你盯着自己的" + get_player().cockDescript() + "；越看那根阴茎，你的嘴就越渴望含住它吸吮。你尽可能张大嘴，朝自己的阴茎凑过去，却在离顶端还有一半距离时停住了。你伸出舌头，试图舔到龟头。你假装自己的舌头正绕着龟头打转，但这只让你的阴茎因渴望而变得更硬。你猛地把头向前甩，试图用舌尖扫到它，可你的" + get_player().cockDescript() + "却在你前倾时向后缩去。你无力地仰倒在地，发出一声挫败的呻吟。你唯一做到的，就是让自己比开始时更加兴奋。");
            dynStats(DynStat.Lust(15));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,67,FlagDict_Impl_.arrayReadInt(_loc1_,67) + 1);
            outputText("你脱下[armor]，在地上坐下。你打量着自己变化后的身体，留意到一些此前没注意过的地方。突然，一个念头冒了出来：村里的猫能用舌头够到自己身上的任何地方！你不禁想……闭上眼，慢慢弯下身，试着尽可能靠近自己的" + get_player().cockDescript() + "。没过多久，你就感觉到温热的呼吸吹在自己的阴茎上。你睁开眼，正和自己勃起的肉棒面对面。你的身体扭曲弯折成只有猫才能做到的姿势。你朝自己的鸡巴呼出一团热气，随之而来的感觉让你的眼睛不由得向上翻去。那感觉不可思议，而随着另一个念头掠过脑海，事情还会变得更刺激，你脸上露出下流的笑容。[pg]");
            outputText("你舔了舔自己跳动的男性肉棒顶端，又一阵令全身震颤的快感流过身体。你又舔了几次，享受着体内奔涌的感觉。你弯得更低，从阴茎根部一路舔到顶端。随后，你慢慢把龟头含进嘴里，开始吸吮它，努力不让口水流出去。那感觉几乎足以让你射出来，但你忍住了，继续下去。你又把几寸肉棒含入口中，开始抽动和挺送，发出淫荡的呻吟与吸吮声。这感觉比你曾经得到过的任何口交都要好。你开始抽送得越来越快，渴望把精液射满自己的脸。光是想到你正在对自己做这种事，就让你更加兴奋。你把剩下的" + get_player().cockDescript() + "也含进嘴里。你能闻到[sack]散发出的浓烈气味。你的喉咙收紧包住肉棒，同时哼鸣着，用舌尖扫过它的顶端。[pg]");
            outputText("一种无比熟悉的快感冲过全身，让你颤抖起来。你把阴茎抽出来，一边吸吮顶端，一边开始撸动，几乎是在喝下自己的前列腺液。你能感觉到精液正在积聚，准备释放。在舌尖扫过" + get_player().cockDescript() + "的顶端后，你感觉精液的洪流正沿着阴茎涌上来");
            if(get_player().countCockSocks("gilded") > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,899) < get_player().countCockSocks("gilded"))
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,899,FlagDict_Impl_.arrayReadInt(_loc1_,899) + 1);
               _loc2_ = midasCockJackingGemsRoll();
               outputText("，同时你的鎏金肉棒套忽然传来一阵寒意，让你在高潮的彻底极乐充满全身的瞬间，本能地从" + get_player().cockDescript() + "的顶端退开。你的脸离龟头不到一寸，看着精液射向空中。它被金色肉棒套的光芒映照，在光中凝珠、扭转，结晶成一阵闪闪发亮的雨。一");
               if(get_player().cumQ() < 25)
               {
                  outputText("小把");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("阵");
               }
               else
               {
                  outputText("大股");
               }
               outputText("宝石取代精液落在你身上，从你的[skinfurscales]上弹开。你的背越弓越高，直到唯一还碰着地面的只剩下你的头顶和脚尖！精液停止喷涌后，你的腰仍因强烈的高潮在空中抽动了好一会儿。[pg]");
               outputText("<b>你花了点时间，把刚才射得到处都是的闪亮宝石全都收集起来，总共 " + _loc2_ + " 颗</b>，然后蜷起身子，短暂地小睡了一会儿。");
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
            }
            else
            {
               outputText("。突然，一股彻底的 bliss 感席卷全身，你开始扭动挣扎，精液直直射进你的喉咙。你从龟头上退开，让下一波射在脸上。很快，那股精液洪流渐渐平息，尽管你的腰仍因强烈的高潮在空中抽动。你稍微调整姿势躺好，决定小睡一会儿。");
               if(get_player().cumQ() < 1000)
               {
                  get_player().refillHunger(get_player().cumQ() / 20);
               }
               else if(get_player().cumQ() < 3000)
               {
                  get_player().refillHunger(50 + (get_player().cumQ() - 1000) / 40);
               }
               else
               {
                  get_player().refillHunger(100);
               }
            }
         }
         else
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,67,FlagDict_Impl_.arrayReadInt(_loc1_,67) + 1);
            outputText("你迅速脱下[armor]，肉棒已经因期待舌头的魔法而淌着前列腺液。你打算做些伸展，好让自己的舌活更灵巧。你站直身体，分开双腿，然后向后仰去，把勃起的" + get_player().cockDescript() + "向前挺出。保持片刻后，你换了个姿势，胸口向前倾，把你的" + get_player().assDescript() + "高高翘起给所有人看——如果附近真有人的话。你来回交替着前倾后仰，看上去就像在操某个看不见的婊子。很快，你的脊背变得相当柔软——接下来该活动双腿了。你再次站直，抬起一边膝盖抱到胸前，把它压在你的" + get_player().allBreastsDescript() + "上。这让它稍微放松了一些，但你知道自己还能更柔韧。你用双手托住腿的下侧，然后把剩下的腿也抬起来，脚尖指向天空。你慢慢松开双手，惊讶地发现自己竟然能让腿自己保持在空中。赤裸着摆出这个姿势，让你的男根完全暴露在外，你感觉到一阵凉风拂过肉棒。它跳动得更厉害，令你因那感觉而低吟呻吟。你的腿感觉已经和脊背一样柔软，于是你换到另一条腿。你立刻把另一条腿甩到头旁，根本不需要双手帮忙，就能把脚踝放到耳后。你保持这个姿势好几分钟，肉棒一跳一跳地淌着前列腺液，迫不及待地等着你去舔舐吮吸。很快你放下腿，欲火比以往任何时候都更旺。你躺到铺盖上，快速活动了一下下巴。把一条腿甩过头顶后，你轻松地低下头，凑向自己的肉棒。[pg]");
            outputText("你的" + get_player().cockDescript() + "现在正戳着你[face]的左脸颊；你误判了自己需要多柔软。你用舌头引导这根迫不及待的肉棒滑进湿淋淋的嘴里。你的嘴唇含住顶端，一边吮吸，一边用舌头绕着龟头打转。你开始把头向前倾，让" + get_player().cockDescript() + "更深地进入嘴里。你的舌头按摩着下侧，并尽力伸出去，想覆盖尽可能多的肉棒。少量前列腺液射出，把咸味一路送进你的喉咙。你抬起头，舌头紧跟着离开，拉出一道唾液的丝线；你继续舔弄那跳动的龟头，发出湿滑的啧响。你再次把肉棒吞进喉咙，沿着棒身上下套弄，同时让舌头左右拨动。你开始把头动得更快、更用力，逼得自己发出淫荡的干呕声，但现在感觉太好了，根本停不下来。你的整根肉棒都被唾液浸湿，口水顺着棒身滴到地上。很快，你开始尽可能地摆动腰部；你已经不再是在给自己口交——而是在用喉咙操自己。淫荡的干呕声变得更响、更激烈；路过的人恐怕会以为你在掐鸡脖子。[pg]");
            outputText("又一股前列腺液射进你的喉咙，紧接着便是释放前不断积聚的压力。你强迫自己把头压到" + get_player().cockDescript() + "的根部，让它深深顶进喉咙，感受那温热光滑的内壁紧紧裹住入侵的肉棒。幸好你正屏住呼吸，不然现在已经要窒息了。你赶在被自己的肉棒噎住前加快动作，头来回抽动，手则抚弄着肉棒根部。");
            if(get_player().countCockSocks("gilded") > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,899) < get_player().countCockSocks("gilded"))
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,899,FlagDict_Impl_.arrayReadInt(_loc1_,899) + 1);
               _loc2_ = midasCockJackingGemsRoll();
               outputText("当你抵达无法回头的临界点时，你又一次感到一丝凉意，随即让你的" + get_player().cockDescript() + "从嘴里啪地弹了出来。你满心欢喜地看着马眼张开，开始你知道即将到来的闪耀喷洒。你的精液在金色阴茎套的光芒映照下凝成珠滴、在光中扭转，结晶成一场闪闪发亮的雨。 一");
               if(get_player().cumQ() < 25)
               {
                  outputText("小把");
               }
               else if(get_player().cumQ() < 250)
               {
                  outputText("阵");
               }
               else
               {
                  outputText("大股");
               }
               outputText("宝石取代精液落在你身上，从你的[skinfurscales]上弹开。你的背越弓越高，直到唯一还碰着地面的只剩下你的头顶和脚尖！精液停止喷涌后，你的腰仍因强烈的高潮在空中抽动了好一会儿。");
               outputText("[pg]<b>你花了点时间，把刚才射得到处都是的闪亮宝石全都收集起来，总共 " + _loc2_ + " 颗</b>，然后蜷起身子，短暂地小睡了一会儿。");
               _loc3_ = get_player();
               _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,67) > 10 && get_player().balls > 1 && Utils.rand(5) == 0)
               {
                  outputText("但这还不够，你被迫抬起头来换气。");
                  outputText("[pg]你一边喘着气，一边不满地瞪着自己的" + get_player().cockDescript() + "。就在这时，你的[sack]吸引了你的注意。它因你的情欲汗光而闪闪发亮，你看着其中一颗睾丸慢慢滑向一侧。");
                  outputText("[pg]你觉得自己能做到！你把另一条腿也甩过头顶，双脚落在自己的背上。你把嘴凑向[sack]，脚趾沿着背慢慢往下挪。你现在离自己的" + get_player().ballsDescriptLight() + "只差一英寸，自己的气味充满鼻腔，越发刺激着你。然后，你终于够到了！那感觉几乎把你冲昏过去！把自己的睾丸含进嘴里的感觉简直难以置信——你能感觉到它们在你嘴里翻动——你的[feet]也开始揉捏自己的后背。你抬起双手同样按摩[balls]，让它们轮流进到嘴里。你完全沉醉在自己的气味中，彻底忘了时间——只剩下吮吸、舔舐、按摩自己睾丸的 bliss……");
                  outputText("[pg]你突然意识到，[eachCock]已经把你的躯干浸满了前列腺液——显然你已经在高潮边缘徘徊好一阵了。你一个利落的动作抬起头，又猛地把嘴罩到自己的" + get_player().cockDescript() + "上，双手则继续按摩睾丸。");
                  outputText("[pg]释放立刻到来。你感觉到高潮的收缩顶在你的[face]上，你的[feet]不由自主地开始按摩后背，也感觉到你的" + get_player().cockDescript() + "在嘴里一胀一缩，把精液一股股送进你的胃里。这比任何事都更令人放松——每一次收缩都让你觉得自己仿佛要稍微融化一点，仿佛会永远保持这个姿势。");
                  outputText("[pg]你的[feet]和双手仍在按摩各自负责的部位，直到你意识到自己开始软下来了！你试着把[balls]里最后一滴精液都按摩出来，同时持续吮吸着你的" + get_player().cockDescript() + "，趁它软下去时不肯停口。等它完全瘪软后，才慢慢从你嘴里滑出，让你微微皱起眉头。你仍觉得这个姿势很舒服，于是再次埋头舔弄自己的[sack]——用嘴交替舔吮它们，再用双手按摩。");
                  outputText("[pg]终于满足后，你开始把自己从纠缠的姿势里解开，这才意识到自己浑身又汗又黏。你又想起村子里的猫，于是像它们一样，把自己够得到的每一寸都舔干净，并发现了一种新的快感。把自己舔干净后，你舒展成大字形，活动掉几处轻微的酸僵，也欣赏自己被唾液润得发亮的裸体。就在你开始打瞌睡时，<b>你觉得自己的睾丸好像变得更紧实沉重了一点。</b>");
                  get_player().modCumMultiplier(0.3);
               }
               else
               {
                  outputText("这股积蓄已久的压力从你的肉棒里喷发出来，顺着你的喉咙涌下去。你实在承受不住；你的脸颊被精液塞得鼓起，只好把头往后拉，终于让嘴巴脱离时发出响亮的啵声，而积在你颊中的精液也洒得你的肉棒到处都是。你的肉棒又往肚子上喷了几道精液。你抚弄了几下那根疲惫的家伙，把最后几滴精液榨了出来。满足了最后一点欲望后，你躺到铺盖上，打了个短短的猫盹。");
               }
               if(get_player().cumQ() < 1000)
               {
                  get_player().refillHunger(get_player().cumQ() / 20);
               }
               else if(get_player().cumQ() < 3000)
               {
                  get_player().refillHunger(50 + (get_player().cumQ() - 1000) / 40);
               }
               else
               {
                  get_player().refillHunger(100);
               }
            }
         }
         updateMasturbation();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function canMeditate() : Boolean
      {
         if(religionCheck() || enlightenedCheck())
         {
            return !exgartuanCheck();
         }
         return false;
      }
      
      public function birthBeeEggsOutYourWang() : void
      {
         outputText("[pg]你感觉比平时更加淫欲高涨、兴奋难耐。当你察觉到这种感觉时，它却变得越来越强烈；尽管你试着继续手头正在做的事，可现在你已经分心得根本没法继续了。你唯一能做的，就是一屁股坐到地上，准备自慰，因为到了这个地步，你的身体似乎只允许你做这一件事。");
         outputText("[pg]你迅速脱下[armor]，一屁股坐到你的[ass]上，同时小心别压到腹部。你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸感觉");
         }
         else
         {
            outputText("肚子感觉");
         }
         outputText("沉甸甸的，而");
         if(get_player().isTaur())
         {
            outputText("你");
         }
         else
         {
            outputText("抚摸着");
            if(get_player().balls > 0)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("，用的是那只没有忙着套弄你[cock biggest]的手。你");
         }
         outputText("感觉到体内有什么在挪动；该产卵了！");
         outputText("[pg]你仰躺在地上，呻吟着看着手中的[cock biggest]迅速完全硬起，同时感觉到你的");
         if(get_player().balls == 0)
         {
            outputText("肚子");
         }
         else
         {
            outputText("睾丸");
         }
         outputText("随着卵开始试图向外移动而传来动静。你的套弄速度加快了；卵一动起来，你的欲火就只会越烧越旺。没过多久，你就弓起背、挺动腰，简直像是在操自己的手，彻底沉溺在这份快感之中。[pg]");
         get_images().showImage("birth-cock-eggs");
         outputText("你开始感觉到有什么东西顶在阴茎根部，体内流出的所有前液都停了下来，因为第一枚卵堵住了你的阴茎。你加倍用力套弄，试图把那该死的东西逼出来，却失败了……它似乎卡得死死的！你开始后悔没有先做点扩张就贸然开始，但说到底，这件事一开始也没给你多少选择余地。");
         outputText("[pg]为了维持这疯狂的节奏，你已经气喘吁吁，光是继续下去都变得十分吃力。你尽可能快速地摩擦着，希望体内不断累积的压力足以在你累到无法继续之前把卵逼出来；可更糟的是，你还能感觉到更多卵正在体内下落。随着堵塞慢慢加剧，卵在你的阴茎根部越积越多；你能看到最前面那枚卡住的卵，正被压力一点点推着沿阴茎向上移动。");
         outputText("[pg]一开始，你阴茎根部只鼓起了一个包，但随着被困在体内的前液、精液和其他卵不断堆积，它很快就越胀越大。这让你的阴茎根部看起来简直像世界上最下流的交通堵塞。你继续拉扯着，希望压力能继续帮上忙，同时也能感觉到一场真正的高潮也在体内不断累积，搅得你心神不宁，让你的动作变得更加慌乱而失控。");
         outputText("[pg]所有这些东西仿佛都在合起伙来折磨你——不断逼近的高潮、精液、卵，还有前液，全都堵在你迅速胀大的阴茎里。最终，这一切实在太过了，你射了出来，快感几乎把你逼疯。");
         outputText("[pg]你的肉棒根部一时间变得更加糟糕，以一种你确信绝不该发生的方式鼓胀起来；你甚至能看见好几枚卵卡在尿道里，每一枚都想挤过其他的卵，而压力也迅速逼近了崩溃的临界点。");
         outputText("[pg]你剧烈地抽搐起来，整个人蜷成一团，仿佛周围的一切都在轰然塌下。你的肉棒软塌塌地倒下来，靠在你的头上，里面塞满的东西带来的重量让它根本无法继续挺起。压力越积越高，直到变成疼痛，随后又在一瞬间骤然释放。");
         outputText("[pg]一阵炸裂般的快感几乎要当场把你击昏，你的身体以你自己绝不可能做到的力量，将一切都从那敏感的尿道口向上、向外推挤出去。卵、精液和蜂蜜全都从你的肉棒里狂喷而出，像逃命似的四处飞溅，在地面上摔落、弹跳。你不由得庆幸昆虫的卵似乎相当柔韧又结实，因为你几乎可以肯定，换成其他种类的卵，早就在你射精的力道下碎掉了。");
         outputText("[pg]你已经数不清有多少枚卵穿过你被撑开、饱受折磨的尿道，也数不清它们离开你身体时那惊人的感觉让你射了多少次。最后几枚卵缓缓沿着你的肉棒向上移动时，你昏了过去，而高潮的收缩仍在继续，持续的时间远远超过了平常应有的长度。");
         outputText("[pg]几分钟后你醒了过来，浑身沾满精液、蜂蜜，以及也许还残留着的前液，感觉比之前轻松了许多。你朝面前的地面“上方”看去；一堆松散的蜜蜂卵躺在地上，表面覆着精液和更多蜂蜜。");
         outputText("[pg]你看着这些由自己孕育出的孩子，微微笑了笑，已经能听见卵中传来轻微的嗡鸣。看来你终究还是成功让它们受精了，而且它们一定是在你体内某处附着住了，所以才会等到完全孕育成熟后才出来。");
         outputText("[pg]你翻过身，看着这些小东西孵化，而你并没有等太久。嗡鸣声越来越响，第一枚卵裂开了，露出一只非常小、湿漉漉、毛茸茸的小蜜蜂。你微笑着看你的孩子第一次试探着飞起来，而你");
         if(get_player().cor < 50)
         {
            outputText("忍俊不禁");
         }
         else
         {
            outputText("有点恼火");
         }
         outputText("，因为它居然正好落在了你的鼻尖上。你顺手把它摘下来放到地上，它便抬头看着你，挥了挥手，还露出一个笑容。");
         outputText("[pg]这时其他卵也开始孵化了，它们一个接一个找到自己的翅膀，飞上空中；在朝森林飞去做蜜蜂该做的事之前，它们常常会先向你挥挥手，或是在你身边嗡嗡绕上一会儿。");
         outputText("[pg]你感觉身体轻松了许多，心情也比这段时间以来好了些，于是撑起身子，重新穿好衣服，很快返回营地。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,592,0);
         get_player().orgasm("Dick");
      }
      
      public function allNaturalStimBeltUse() : void
      {
         clearOutput();
         if(get_player().hasKeyItem("All-Natural Self-Stimulation Belt"))
         {
            get_images().showImage("masti-stimBelt-allNatural");
            if(!get_player().hasStatusEffect(StatusEffects.UsedNaturalSelfStim))
            {
               get_player().createStatusEffect(StatusEffects.UsedNaturalSelfStim,0,0,0,0);
               outputText("满怀期待地，你戴上手套，以免过早触发机器。你把腰带放下，彻底脱光衣服。双腿穿过那件带子的套环后，你把它拉了上来。你花了点时间，把那个小突起对准自己小穴的入口。让凸钮抵在穴口后，你脱下手套，向后躺下，用手指触碰那些琥珀色垫片。[pg]");
               outputText("你听见一声独特的湿滑挤压声，随即感觉腰带在你的腰腹和骨盆周围收紧。它越收越紧，直到因为你自己的身形而根本不可能取下。尽管有些担忧，你仍然保持镇定；最后，腰带终于停止收紧。接着是一阵停顿。几分钟过去了，几乎什么也没发生。你注意到腰带的整个前部开始变暖。那不是毯子或金属常有的热度，而更像是肌肤贴着肌肤的温暖。你又听见更多湿滑的声音，感觉那个突起开始蠕动，摩擦着你的入口。快感缓缓累积，装置似乎制造出的挑逗让你既受刺激又觉得有趣。毫无预兆地，你感觉自己的小穴被撑开了，有什么东西猛地刺进了你体内。[pg]");
               doNext(allNaturalSelfStimulationBeltContinuation);
            }
            else if(get_player().cor < 50)
            {
               outputText("你为自己性欲的深度感到羞耻，却还是穿上那条可憎的刺激腰带，准备承受它终将对你饥渴小穴施加的蹂躏。还没等你触碰启动器，装置上的有机部分就像感知到了你的需求一般膨胀起来，埋进你的阴道，开始以狂暴的速度抽动。突如其来的刺激让你被震得向后痉挛，倒在地上扭动，而那可怖的共生体则以淫猥肮脏的方式蠕动着。你清楚地感觉到有个突起在你的阴蒂周围生长，变形、变化成一个吸盘。吸力开始疯狂玩弄你的阴蒂，仿佛它是一根迷你阴茎般吞吸、吮咬、抽拽，激起又一波痛苦而愉悦的连续高潮。[pg]");
               outputText("当那生物顶开你的子宫颈，开始向你的子宫注入滚烫浓稠的精液……或者不管它射进你体内的究竟是什么时，你震惊地叫出了声。与之前不同，那液体带来的感觉本身就以奇怪的方式作用于你的大脑和身体。疼痛变得迟钝，最终从你的意识中滤去，只剩下这场体验带来的快感。液体持续注入，直到满溢出来。体内被灌满的感觉让你矛盾地既欣喜若狂，又感到反胃。不知过了多久，那东西终于停止操你，并松开了对你骨盆的钳制，只留下你一身黏腻、疲惫不堪。你有一部分还想再试一次腰带，但你已经累得连清理自己都懒得做了。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Lib(-1),DynStat.Sens(0.75),DynStat.Cor(1));
               doNext(get_camp().returnToCampUseOneHour);
            }
            else
            {
               outputText("你几乎没花时间脱衣服，就迅速把这条腰带形状的野兽套上了臀间。它立刻夹紧，开始那套再熟悉不过的、对你入口的掠夺。它猛然深入你的小穴深处，很快吸附住你的[clit]，那雷鸣般动作带来的舒缓快感浇灭了你对欢愉的渴求。那生物很快开始把它的液体倾注进你体内。你已经不再像第一次使用腰带时那样感到疼痛，只是躺在无尽的极乐中，任由那股温热的液体把你填满。生物感知到你体内已有多少汁液后，停止喷射，转而开始搅动它留下的精液。滚烫液体真的在你体内搅拌、打旋，这种独特的快感从你身体里引出一波高潮，把那些精液拖得更深，深入你的女穴。几乎就像每一次骨盆收缩，都在让你的身体把那精液吸进最深处。[pg]");
               outputText("那生物又喷出一股精液洪流，并重复起这个过程。你被欲望灌得神魂颠倒，不明白自己怎么能容纳这么多精液，而不像之前那样喷涌出来。每当你试图思考这件事，又一场高潮就会摧毁任何理性思绪。等那东西终于玩够你时，已经过去了好几个小时。你从持续数小时的高潮中坠落下来，疲惫不堪，脑子里唯一能想到的，就是下一次让那条腰带缠上腰胯的机会。");
               get_player().orgasm("Vaginal");
               dynStats(DynStat.Lib(-0.5),DynStat.Sens(1),DynStat.Cor(1.5));
               if(!get_player().isPureEnough(100,false))
               {
                  doNext(allNaturalSelfStimulationBeltBadEnd);
               }
               else
               {
                  doNext(get_camp().returnToCampUseFourHours);
               }
            }
         }
         updateMasturbation();
         get_player().cuntChange(1,true);
         get_player().slimeFeed();
      }
      
      public function allNaturalSelfStimulationBeltContinuation() : void
      {
         clearOutput();
         get_images().showImage("masti-stimBelt-allNatural");
         outputText("你震惊地尖叫起来，因为你意识到那个突起已经瞬间长成了一根巨大的有机假阳具。它轻易就顶到最深处，抵在你的子宫颈上，而你还在从最初被贯穿的震撼中恢复。随着刺痛渐渐消退，那根邪异的附肢开始自行运作。它以漫长而缓慢的动作蠕动抽插，并小心地调整自身，以贴合你体内每一道曲线。你被彻底压倒，身体开始违背清醒的意志自行反应，慢慢配合着那东西挺动骨盆。[pg]");
         outputText("就像它突然插入你一样，它又骤然切换到了另一种运作阶段。它尽可能深地埋进你体内，开始短促而快速地抽动。这个玩具冲撞你内里的速度，比任何男人能做到的都要快。你立刻高潮，并接连达到顶点。你的身体失去了仅剩的运动控制，随着装置无休止地活塞般贯穿你的小穴，疯狂地挺动、扭摆。你扯着嗓子尖叫。每一声喊叫，都向世界宣告着你快感与欲望的深度。[pg]");
         outputText("那条邪恶的腰带再次变化。它埋到最深处，你感觉自己的小穴深处承受着一股压力。你感到一股滚烫的液体喷进了体内。你反射性地大喊：\"<b>它射了！它射在我里面了！</b>\"确实，那根不断顶弄的肉茎每一次推进，都用液体淹没你的小穴。它射着……射着……射着……不停地射着……[pg]");
         outputText("仿佛过了永恒那么久，你的小穴已经酸痛不堪。它被撑开，并被那东西用来当作精液的玩意儿彻底灌满。它从你的穴里缩了回去，而你的身体终于有机会把承受不住的精液全都挤出来，你也随之感到最后一阵压力的刺痛。黏液从腰带两侧喷溅而出，把你弄成一团又臭又黏的狼狈模样。你感觉到腰带的张力缓和下来，逐渐松开。机器的流程已经结束。你立刻昏了过去。");
         get_player().slimeFeed();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function allNaturalSelfStimulationBeltBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         get_images().showImage("badend-stimBelt");
         outputText("不管这条腰带究竟是什么，不管它做了什么，对你来说都已经不重要了。你唯一想要的，就是感受这条腰带和其中的生物日日夜夜把你操到彻底崩溃。你迅速再次穿上那生物，它开始像往常一样，对你那永不满足的小穴施展淫欲的魔法。无尽的高潮浪潮将你吞没。如今你所知的一切，只剩永恒高潮带来的无边极乐。[pg]");
         outputText("你的意识被腰带和快感彻底侵蚀，以至于没注意到一张熟悉的面孔靠近了你不断扭动的身体。那正是把这个邪恶玩具卖给你的人——商人贾科莫。[pg]");
         outputText("[say: 哎呀，哎呀，]贾科莫说道。[say: 浪子们说得没错。那生物的体液会让人成瘾。这个可怜的女人已经彻底成了那野兽的奴隶！][pg]");
         outputText("你在他面前因那几乎要把腰折断的快感而扭动不止，贾科莫则思索着眼前的状况。忽然，他那棱角分明的脸上亮了起来，显然是想到了什么主意。[pg]");
         outputText("[say:啊哈！]那鹰隼般精明的商贩叫道。[say:我有新商品可卖了！我就叫它“独角女秀”！][pg]");
         outputText("贾科莫为自己的点子得意地咯咯笑起来。[say:谁知道会有人愿意花多少钱，买一个停不下高潮的活女人呢！][pg]");
         outputText("贾科莫把你装上他的货车，动身赶往下一场买卖。你根本不在乎。你也没有意识到发生了什么。你只知道那生物还在射，而那感觉……实在是太——他妈的爽了！");
         get_game().gameOver();
      }
      
      public function allNaturalOnaholeUse() : void
      {
         clearOutput();
         get_images().showImage("masti-Onahole-allNatural");
         if(!get_player().hasStatusEffect(StatusEffects.AllNaturalOnaholeUsed))
         {
            get_player().createStatusEffect(StatusEffects.AllNaturalOnaholeUsed,0,0,0,0);
            outputText("你挠了挠头，想不明白这么滑稽的玩意儿怎么可能带来贾科莫吹嘘的那种极致快感。你耸耸肩，脱下衣服，很快把那根女用假阳具摆弄好，准备来一次痛快的快餐。你没费什么力气就拨开了两片软垫，插进了这个玩具里。它摸起来很温暖，像是血肉的温度。你把飞机杯一路套到阴茎根部，直到顶到底。你感觉玩具底部有某种柔软的突起，正压在你尿道口上。");
            outputText("[pg]你开始用玩具轻柔地套弄自己。这次你决定放慢节奏，悠闲享受，而不是像平常那样急躁。这个玩具很温暖，也相当舒服。虽说还远远配不上贾科莫的推销说辞，但你觉得这钱花得还算值。至少，它确实挺不一样的。");
            outputText("[pg]毫无预兆地，你感觉一股巨大的压力夹住了你的阴茎。你吓了一跳，本能地想要拔出来。可你的挣扎只让玩具沿着肉柱往上滑了一小段，随后它又自己爬了回去。不管出了什么问题，你的阴茎已经被卡住了。你感觉飞机杯内部的两片软垫传来一阵脉动。那东西在你的阴茎上猛地向前一冲，嵌得更深了。你又恼又急，开始把被困住的阴茎往地上拍打，试图把那东西甩下来，却毫无用处。那东西又沿着你的阴茎往下猛地一压。现在你已经顶到底了，能清楚感觉到那个恼人的突起正抵着龟头。");
            outputText("[pg]你还没来得及反应，就感觉那个突起动了起来。它挪动着……调整着。你完全困惑又反胃，停下来想弄明白到底发生了什么。接着，你感觉到有什么东西正戳弄着龟头上的开口，那感觉绝不会认错。可怕的现实像倒塌的墙一样砸向你——这个“玩具”是个活物！");
            outputText("[pg]当这可怕处境的真相不断冲击你的脑海时，你感觉一条纤细的触须挤过你的尿道口，钻进了你的尿道！你的身体完全不习惯这种“插入”，顿时抽搐、挺动，试图把那东西甩掉。你抓住这生物开始往外拔，却看见主开口周围的小孔里伸出了针一样的增生物。它们顶在你耻丘根部，你能感觉到那些针尖刺在皮肤上。你一试图拉扯，那些针就像要刺穿你的皮肤；你一停下，它们又缩回去。你终于明白，除非把自己撕烂，否则根本不可能把这东西从阴茎上弄下来。");
            outputText("[pg]那条触须继续在你的尿道里探索，直到停在你的前列腺里。它开始用末端在你体内的敏感处来回弹拨，而那具肌肉质的身体则开始在你的阴茎上起伏抽送。几分钟内，这小生物的节奏就变得狂乱起来。你的肺里爆发出一声又一声尖叫，因为那生物正在掠夺你的体内。痛苦与快感混成了同一种感觉，你正承受着此生最猛烈的一次榨精。");
            outputText("[pg]当你感觉精液逐渐积聚时，体内突然传来一股尖锐的吸力。那吸力立刻触发了你的高潮，你的肌肉痉挛着，拼命想要射精。可你并没有射出一发精液，而是感觉那触须像真空一样把你的精液吸走了！它为了进食而膨胀起来，你也感觉自己的内管随之被撑开。尿道在高潮中被迫扩张，这种完全失控的感觉又逼得你再次高潮，而那生物又一次把精液从你体内直接吸了出去。");
            outputText("[pg]你产生的精液越多，那该死的东西就吸得越凶。最终，痛楚渐渐退去，只剩下这种深层插入和刺激带来的亵渎般的快感。原来这就是那个疯商人说的东西。你从未像现在这样射得如此猛烈、如此之多。你的脑子被欲望污染，满心只想让这东西继续榨干你，让你沉醉在快感中。这种折磨般的体验让你在清醒与昏迷之间反复摇摆。你每次醒来，都只来得及把又一发精液泵进它那无底的管道里。每次醒来射精时，你都看到那东西变得越来越肥大。");
            outputText("[pg]清醒……昏过去……清醒，又昏过去。接下来的几分钟、几小时，或者不知多久，全都变成一片模糊。你感觉自己需要射精。你感觉肌肉收缩，想把种子逼出去。你感觉那动物，或不管它到底是什么，正在把你的生命之乳吸走。它变得更肥了。你还想再感受肌肉收紧！你还想再感受精液奔涌！你还想让那东西再多套弄你的肉柱！无尽的快感。无尽的高潮。你昏了过去。");
            outputText("[pg]你完全不知道过去了多久。不过，当你醒来时，性器从里到外都酸痛不已。地上有几小滩滴落的精液，而你看到那东西已经膨胀到了原来的两倍大。你惊恐地伸手想抓住它、杀了它——却停住了。毕竟，在你克服了被插入的恐惧之后，那些高潮确实是你这辈子体验过的最棒的高潮。");
         }
         else if(get_player().cor > 66)
         {
            outputText("你咧嘴笑着，从包里抓出你的“宠物”，把阴茎深深埋进它的口器里。那生物似乎被你的热情弄得有些发愣，只是懒洋洋地挪动着。你不耐烦地晃动自己的阴茎，连带着把那生物也摇来摇去，试图把这个榨精的小混蛋叫醒。那野兽终于活了过来，开始做它唯一知道该做的事。它固定在你勃起的阴茎上，轻而易举地钻进你已经被撑开的尿道，将自己插入其中，开始又一次进食。享受着这生物努力榨取你体液的感觉，你决定稍微加点料。你开始绷紧骨盆肌，让阴茎上下跳动。肌肉收缩带来的轻微快感让你很舒服，而那生物却把你的自娱自乐误认为你想把它甩掉，于是把触须更深地刺进你的前列腺，激起更强烈的反应。快感涌上来时，你仰起头，不断收缩肌肉，迫使那野兽更深地掠夺你的体内。感到一大股精液正在积聚时，你双手抓住那动物，熟练地控制着射精反射。凭借一次次自我探索磨练出的技巧，你把一股又一股精液强行喂进那野兽体内。那东西很快鼓胀起来，因为即使它胃口贪婪，也完全敌不过你一发接一发的喷射。它迅速膨胀，从你体内脱离出来，显然已经被撑得饱到不能再饱。可你毫不退缩，也仍不满足，又用性器喷发出的一大股精液把那生物从阴茎上冲飞出去。它稳稳落到地上，而你立刻摇摇晃晃地走过去，把剩余憋了许久的精液全都倾泻在它的外壳上。你被榨得心满意足，而那野兽也完全被你的欲望覆盖。你擦去额头上的汗，默默祝贺自己把宠物喂得如此饱足。你检查了一下，确认自己的精力没有伤到那生物；见它除此之外并无损伤，便把它放到一旁，让它在你喂给它的那一大堆精液中慢慢消化。");
         }
         else
         {
            outputText("你一半后悔买下它，另一半却渴望那种强烈到极点的快感，于是伸手探进包里，取出这个被贾科莫笑着称作“纯天然”的飞机杯的生物。你告诉自己，这生物需要进食，也和任何动物一样有生存的权利，随后才不情愿地把那野兽放到自己坚硬而不肯退缩的勃起上。它立刻活了过来，马上压住你的肉柱，将自己牢牢夹在原处。比起之前，这生物的进食管动作更加熟练，突破你的尿道，一路挤进性器深处。它的身体蠕动着，触手不断弹拨，强迫你的身体分泌出它赖以生存的性液。你咬着嘴唇低声呻吟，只能忍受敏感生殖器被迫产出的痛苦快感。性液在体内积聚的独特感觉刺激了这可憎之物，迫使它动得更快。片刻之后，一波高潮让你的身体痉挛到绷成一团，你把精液逼进那生物体内。一发又一发射进野兽身体里，它也因你的欲望而变得肥胀。等你被榨干后，那生物收回触须，又逼出你最后一发精液，随后放开了你那根被使用过、还受了些折腾的阴茎。你倒在地上，还没从这场遭遇中恢复过来就睡了过去。");
         }
         dynStats(DynStat.Lib(-1.5),DynStat.Sens(0.75),DynStat.Cor(0.5));
         updateMasturbation();
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

