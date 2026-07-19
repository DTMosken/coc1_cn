package classes.items.armors
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.items.Mutations;
   import classes.items.armors._VineArmor.SaveContent;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import flash.Boot;
   
   public class VineArmor extends ArmorWithPerk implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function VineArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "vinearmor";
         saveContent = new SaveContent(null,null,null,null);
         super("VinArmr","Black Vines","obsidian vines","tight wrappings of onyx-black vines",0,0,"Ominously dark vines wrapped tightly against your [skinshort], many of which find the ideal spots to emphasize your assets rather than cover them.","Light",PerkLib.AlrauneVines,0,0,0,0);
         boost("挑逗几率",NumberFunc_Impl_.fromFloatFun(getSeductionLevel),false);
         boost("挑逗伤害",NumberFunc_Impl_.fromFloatFun(getSeductionLevel),false);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         if(get_player().get_armor() is VineArmor && get_time().hours == 3 && Utils.rand(2) == 0)
         {
            dryadProgression();
            return true;
         }
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.armorChange = 0;
         saveContent.armorStage = 1;
         saveContent.flowerColor = "rose-red";
         saveContent.clothUsed = false;
      }
      
      override public function removeText() : void
      {
         outputText("你无法移除这些藤蔓。");
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      override public function get_description() : String
      {
         _description = "不详的暗色藤蔓" + (saveContent.armorStage > 1 ? "上开满了美丽的" + saveContent.flowerColor + "花朵，并且" : "") + "紧紧缠绕着你的[skinshort]，其中许多藤蔓找到了理想的位置来凸显你的身材，而不是遮盖它们。";
         var _loc1_:String = super.get_description();
         _loc1_ += "\n特殊效果：受到火焰伤害会增加疲劳值。";
         if(saveContent.armorStage > 2)
         {
            _loc1_ += "\n荆棘会伤害近战攻击者。";
         }
         if(saveContent.armorStage > 3)
         {
            _loc1_ += "\n获得藤蔓绊倒攻击。";
         }
         if(saveContent.armorStage > 4)
         {
            _loc1_ += "\n获得藤蔓抓取攻击。";
         }
         return _loc1_;
      }
      
      public function get_debugName() : String
      {
         return "ObsidianVines";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getSeductionLevel() : Number
      {
         return saveContent.armorStage * 2;
      }
      
      public function dryadProgression() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:Number = NaN;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         clearOutput();
         switch(saveContent.armorStage)
         {
            case 1:
               outputText("缠绕在你身上的黑色藤蔓收紧了，深深地勒进你的[skin]里。紧绷的张力将你的肌肉固定在原位" + (get_player().sleeping ? " 并把你从睡梦中唤醒" : "") + "。");
               break;
            case 2:
               outputText("冰冷的液体开始在你的血管中奔流，麻痹了你的肌肉" + (get_player().sleeping ? "，将你从沉睡中唤醒" : "") + "。黑色的藤蔓紧紧地缠绕着你的四肢，带来阵阵刺痛，并进一步附着在你的身上。");
               break;
            case 3:
               outputText("全身被深深刺穿的恐怖感觉让你陷入了短暂的恐慌，但不断收紧的藤蔓牢牢地抓住了你，让你动弹不得。");
               break;
            case 4:
               outputText("当你" + (get_player().sleeping ? "躺着" : "站着") + "时，漆黑的藤蔓摇晃碰撞，发出熟悉的灌木丛沙沙声。在不安的状态下，随着变化的展开，你尽力强迫自己的身体摆出一个更舒服的姿势。");
               break;
            case 5:
               if(get_player().sleeping)
               {
                  outputText("无边无际的茂密草地和雄伟的古树从四面八方环绕着你。这片风景给你带来了无与伦比的喜悦。你漫步在绚丽的山谷中，闻着自由飘荡的各种花香。当你深吸一口气时，阴影扫过地面，扼杀了所有无助扎根的植物的生命。力量与宁静蔓延至你的全身，完全定义了你的存在。伴随着一声喘息，你醒了过来。");
                  break;
               }
               outputText("黑色的藤蔓在你的[skin]上收紧并移动，深深地按摩着你。你对这种舒适的感觉叹了口气，享受着身体完全放松的状态。荆棘刺入你的身体，刺穿你的穴位，将它们赋予力量的能量注入你的体内。作为回报，你也分享了你的体液，完全沉浸在植物共生的完美和平之中。");
         }
         var _loc1_:Array = [];
         if(get_player().ears.type != 4)
         {
            _loc1_.push(1);
         }
         if(get_player().skin.type != 11 && get_player().skin.type != 10)
         {
            _loc1_.push(2);
         }
         if(get_player().hair.length > 0 && get_player().hair.type != 10)
         {
            _loc1_.push(3);
         }
         if(int(get_player().breastRows.length) > 1)
         {
            _loc1_.push(12);
         }
         if(get_player().hair.length > 0 && (get_player().hair.type != 10 || get_player().hair.adj == ""))
         {
            _loc1_.push(4);
         }
         if(get_player().hasHorns() && get_player().horns.type != 12)
         {
            _loc1_.push(5);
         }
         if(get_player().lowerBody.legCount != 2)
         {
            _loc1_.push(6);
         }
         if(get_player().hair.type == 10 && get_player().lowerBody.legCount == 2 && !(get_player().hasHorns() && get_player().horns.type != 12))
         {
            if(get_player().rearBody.type != 4)
            {
               _loc1_.push(7);
            }
            if(get_player().hair.adj == "leafy" && !get_player().hair.hasFlowers())
            {
               _loc1_.push(8);
            }
            if(get_player().canFly() && !Boolean([16,17].contains(get_player().wings.type)))
            {
               _loc1_.push(9);
            }
         }
         if(get_player().rearBody.type == 4 && !(get_player().canFly() && get_player().wings.type != 16))
         {
            if(get_player().skin.type != 11)
            {
               _loc1_.push(10);
            }
            if(get_player().lowerBody.type != 30)
            {
               _loc1_.push(11);
            }
         }
         _loc2_ = _loc1_;
         switch(int(_loc2_[Utils.rand(int(_loc2_.length))]))
         {
            case 1:
               outputText("[pg]震耳欲聋的噪音震撼着你的心灵，你的耳朵在原处扭曲弯折，拉长成了精灵的耳朵。");
               get_player().ears.type = 4;
               break;
            case 2:
               outputText("[pg]你的肉体变得僵硬紧绷，让你感到沉重和眩晕。当这种感觉终于过去时，你的皮肤看起来绿油油的，像植物一样，类似于花茎。");
               get_player().skin.type = 10;
               get_player().skin.adj = "plant-like";
               get_player().skin.desc = "stalk";
               get_player().skin.tone = "green";
               break;
            case 3:
               outputText("[pg]令人惊恐的是，头皮上的一阵酥麻感开始拨弄你的[hair]。虽然你很害怕自己要秃顶了，但你的头发改变了颜色，开始变得像细长的绿叶子纤维藤蔓。");
               get_player().hair.type = 10;
               get_player().hair.adj = "";
               break;
            case 4:
               if(get_player().hair.type == 10)
               {
                  outputText("[pg]你头皮上的藤蔓令人担忧地不停蠕动着，但很快就开始长出叶子。一片接一片的叶子以惊人的速度长出，直到很快你的头上完全覆盖着健康的绿叶子。");
               }
               else
               {
                  outputText("[pg]令人惊恐的是，头皮上的一阵酥麻感开始拨弄你的[hair]。虽然你很害怕自己要秃顶了，但你的脑袋开始变成一丛长满茂密叶子的细长藤蔓。");
               }
               get_player().hair.type = 10;
               get_player().hair.adj = "leafy";
               get_player().hair.color = "green";
               break;
            case 5:
               outputText("[pg]你的头骨传来一阵震颤，伴随着剧烈的头痛，你的[horns]发出断裂的脆响。木质的纹理蔓延其上，直到它们完全变成锋利的树枝状。");
               _loc3_ = get_player().horns.type == 5 ? 1 : 0;
               get_player().horns.value = _loc3_;
               get_player().horns.type = 12;
               break;
            case 6:
               get_mutations().restoreLegs("alraune vines");
               break;
            case 7:
               outputText("[pg]树皮的碎片从你的血肉中破出，开始覆盖你的身体。这些厚实粗糙的斑块蔓延到你的臀部和背部，谢天谢地，你其余的[skin]还露在外面。");
               get_player().rearBody.type = 4;
               dynStats(DynStat.Sens(-2),DynStat.Tou(4));
               break;
            case 8:
               outputText("[pg]你头上那绿叶子般的[haircolor]枝叶似乎在索求你身体越来越多的营养，原因很快就明朗了。无数的花朵开始在你的发丝间绽放，演变成一个美丽的头顶草甸" + (get_player().hair.length > 16 ? "，以宁静的威严垂下" : "") + "。");
               get_player().hair.type = 10;
               if(get_player().sleeping)
               {
                  _loc4_ = "rose-red";
               }
               else
               {
                  _loc5_ = ["deep purple","dark red"];
                  _loc4_ = _loc5_[Utils.rand(int(_loc5_.length))];
               }
               get_player().hair.flowerColor = _loc4_;
               break;
            case 9:
               if(get_player().wings.type == 18)
               {
                  outputText("[pg][if (hasWings) {你的[wings]惊人地颤抖弯曲，然后爆裂|一阵阵寒意顺着你的脊背上下游走，直到你在背部爆裂的触感下惊叫出声}]，变成了从两根下垂的树枝上垂下的螺旋状树叶。");
                  get_player().wings.type = 17;
               }
               else
               {
                  outputText("[pg]你的脊椎收缩，痛苦地弓起背，然后随着你的[wings]发出嘎吱声并撕裂开来而放松。当疼痛终于停止时，你意识到剩下的只有一副原本是翅膀的木制骨架。");
                  get_player().wings.type = 16;
               }
               break;
            case 10:
               outputText("[pg]你的[skin]变硬，褪去了以前的色素和纹理，变成了裸露木材的颜色和纹理。有一瞬间，你似乎感觉不到任何身体上的知觉，但谢天谢地，它又恢复了，尽管变得有些迟钝。");
               get_player().skin.type = 11;
               get_player().skin.adj = "tree-like";
               get_player().skin.desc = "wood-grain";
               _loc5_ = ["绿叶子","白皙","浅色"];
               if(Boolean(_loc5_.contains(get_player().skin.tone)))
               {
                  get_player().skin.tone = new WeightedChoice().add("tan",3).add("mahogany",3).add("almond",3).add("olive",3).add("hazel",3).add("brown",2).add("ash",2).add("ebony",1).choose();
               }
               dynStats(DynStat.Sens(-3),DynStat.Lib(-1),DynStat.Tou(5));
               break;
            case 11:
               outputText("[pg]你的[legs]发出嘎吱声并弯曲，分裂成一系列触须般的根须。分裂完成后，这些根须紧紧地缠绕在一起，硬化成一对功能正常的跖行双腿。");
               get_player().lowerBody.type = 30;
               get_player().lowerBody.legCount = 2;
               break;
            case 12:
               get_mutations().removeExtraBreastRow("alraune vines");
         }
         if(!get_player().sleeping)
         {
            _loc1_ = [];
            if(get_player().hair.color != "black" && get_player().hair.color != "dark purple" && get_player().hair.color != "indigo")
            {
               _loc1_.push(1);
            }
            if(get_player().skin.type != 11 && get_player().skin.tone != "pale white")
            {
               _loc1_.push(2);
            }
            if(get_player().rearBody.type == 4 && get_player().rearBody.color != "charcoal-black")
            {
               _loc1_.push(3);
            }
            _loc2_ = _loc1_;
            switch(int(_loc2_[Utils.rand(int(_loc2_.length))]))
            {
               case 1:
                  _loc5_ = ["black","dark purple","indigo"];
                  _loc4_ = _loc5_[Utils.rand(int(_loc5_.length))];
                  if(!get_player().hair.hasFlowers())
                  {
                     outputText("[pg]你的[hair]摇曳闪烁，神秘地变成了" + Utils.cnName(_loc4_) + "。");
                  }
                  else
                  {
                     outputText("[pg]点缀在你草地上的许多花朵改变了形状和颜色，变成了一片由深色玫瑰、紫罗兰和黑天鹅绒矮牵牛组成的不祥花床。你那新生的哥特式花园让你陷入了沉思，但你并不觉得不高兴。");
                     get_player().hair.flowerColor = "gothic";
                  }
                  get_player().hair.color = _loc4_;
                  break;
               case 2:
                  if(get_player().isFluffy() || get_player().hasScales())
                  {
                     outputText("[pg]你的[skin]一阵发麻，全身颤抖。出于条件反射，你想要活动身体，揉掉这种令人不安的感觉，然而当你的四肢终于听从使唤时，你看到你的[skindesc]已经完全脱落了。剩下的只有死一般苍白的皮肤。");
                     get_player().skin.type = 0;
                  }
                  else
                  {
                     outputText("[pg]你的[skin]开始变得娇嫩敏感，颜色也变成了令人不安的苍白色。");
                  }
                  get_player().skin.tone = "pale white";
                  break;
               case 3:
                  outputText("[pg]覆盖在你[hips]和背部的树皮外壳热得吓人，颜色也加深成了炭黑色。进一步检查后，它似乎一点也没有失去原有的坚固度。");
                  get_player().rearBody.color = "炭黑";
            }
         }
         if(saveContent.armorChange > 1 && saveContent.armorStage < 5)
         {
            saveContent.armorChange = 0;
            switch(saveContent.armorStage)
            {
               case 1:
                  if(get_player().sleeping)
                  {
                     _loc4_ = "rose-red";
                  }
                  else
                  {
                     _loc2_ = ["deep purple","dark red"];
                     _loc4_ = _loc2_[Utils.rand(int(_loc2_.length))];
                  }
                  saveContent.flowerColor = _loc4_;
                  outputText("[pg]黑曜石藤蔓颤抖了片刻，就像你吸食它们一样，它们也在吸食你，直到突然绽放出" + saveContent.flowerColor + "的花朵。这给这套衣服增添了一种特别的威严感。");
                  break;
               case 2:
                  outputText("[pg]藤蔓越咬越紧，缠绕着你的身体不断生长，长出许多尖刺。过了一会儿，尖刺开始无缝地退回黑色肉质的卷须中，但只要你一紧张，它们就会随时准备出击。");
                  break;
               case 3:
                  outputText("[pg]藤蔓勒紧了你的[skin]，让你感到酸痛。你前后挥动[arms]，试图弄松藤蔓，突然你猛地一震，因为一只手臂上的藤蔓向前抽打了好几[if (metric) {米|英尺}]。它很快又回到了原位，而你也不太清楚自己是怎么做到的。");
                  break;
               case 4:
                  outputText("[pg]你全身的藤蔓都在推搡和摇晃。尖刺在移动时不断地刺向你。老实说，这整个过程相当烦人。谢天谢地，一切都过去了。你感觉到一种非常奇怪的放松感。不知怎的，你感觉轻松多了。");
            }
            _temp_1.armorStage += 1;
         }
         outputText("[pg]");
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null));
      }
   }
}

