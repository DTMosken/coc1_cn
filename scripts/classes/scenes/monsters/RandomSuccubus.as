package classes.scenes.monsters
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatDistance;
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class RandomSuccubus extends Monster
   {
      
      public var special:String;
      
      public function RandomSuccubus(param1:String = undefined, param2:String = undefined)
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc17_:* = null as Array;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null as Array;
         var _loc21_:int = 0;
         if(param1 == null)
         {
            param1 = "R";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         special = param2;
         set_a("");
         set_race("Demon");
         var _loc3_:Boolean = true;
         set_tallness(36);
         lowerBody.type = 5;
         if(param1 == "R" && Utils.rand(10) < 1)
         {
            switch(Utils.rand(2))
            {
               case 0:
                  param1 = "M";
                  break;
               case 1:
                  param1 = "H";
            }
         }
         if(param1 == "M")
         {
            createCock(5 + Utils.rand(7) + Utils.rand(7) - Utils.rand(5),Utils.rand(501) * 0.01 + 1,CockTypesEnum.DEMON);
            set_femininity(Utils.rand(10) + Utils.rand(10) + Utils.rand(20) + Utils.rand(60) + Utils.rand(4) + 1);
            _loc3_ = false;
         }
         if(param1 == "H")
         {
            createCock(5 + Utils.rand(7) + Utils.rand(7) - Utils.rand(5),Utils.rand(501) * 0.01 + 1,CockTypesEnum.DEMON);
            set_femininity(Utils.rand(100) + 1);
         }
         if(_loc3_)
         {
            createVagina(false,Utils.rand(5) + 1,Utils.rand(5) + 1);
         }
         switch(get_gender())
         {
            case 1:
               set_short("incubus");
               imageName = "RndInc";
               _loc4_ = Utils.rand(2) + Utils.rand(2) + Utils.rand(2) + Utils.rand(2) + Utils.rand(2) + Utils.rand(2) + Utils.rand(2);
               _loc5_ = Utils.rand(2);
               hips.rating = _loc4_ + _loc5_;
               _loc6_ = Utils.rand(3) + Utils.rand(3);
               _loc7_ = Utils.rand(3);
               butt.rating = _loc6_ + _loc7_;
               balls = Utils.rand(2) * 2 + 2 - Utils.rand(2) * 2;
               ballSize = Utils.rand(10) + 1;
               set_tallness(get_tallness() + (Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(13) + Utils.rand(13) + Utils.rand(13) + Utils.rand(13)));
               lowerBody.type = 0;
               hair.length = Utils.rand(13);
               break;
            case 2:
               set_short("succubus");
               imageName = "RndSucc";
               createBreastRow(Utils.rand(6) + Utils.rand(5) + 1);
               _loc4_ = Utils.rand(6) + Utils.rand(6) + Utils.rand(6);
               _loc5_ = Utils.rand(6);
               hips.rating = _loc4_ + _loc5_;
               _loc6_ = Utils.rand(6) + Utils.rand(6) + Utils.rand(6);
               _loc7_ = Utils.rand(6);
               butt.rating = _loc6_ + _loc7_;
               set_tallness(get_tallness() + (Utils.rand(7) + Utils.rand(7) + Utils.rand(13) + Utils.rand(13) + Utils.rand(13) + Utils.rand(13)));
               _loc8_ = Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7);
               _loc9_ = Utils.rand(7);
               hair.length = _loc8_ + _loc9_;
               break;
            case 3:
               set_short("omnibus");
               imageName = "RndOmni";
               createBreastRow(Utils.rand(11));
               hips.rating = Utils.rand(21);
               butt.rating = Utils.rand(21);
               balls = Utils.rand(2) * 2 + 2 - Utils.rand(2) * 2;
               ballSize = Utils.rand(11);
               set_tallness(get_tallness() + (Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(7) + Utils.rand(13) + Utils.rand(13) + Utils.rand(25)));
               hair.length = Utils.rand(31);
         }
         _loc4_ = Utils.rand(5);
         ass.analLooseness = _loc4_ + 1;
         ass.analWetness = Utils.rand(6);
         var _loc10_:Array = ["蓝色","紫色","浅紫色","深紫色","深蓝色","靛蓝色","酒红色","薰衣草色","午夜黑"];
         _loc5_ = Utils.rand(int(_loc10_.length));
         skin.tone = _loc10_[_loc5_];
         var _loc11_:Array = ["蓝色","紫色","浅紫色","深紫色","深蓝色","金发"];
         _loc6_ = Utils.rand(int(_loc11_.length));
         hair.color = _loc11_[_loc6_];
         var _loc12_:Array = [0,0,3];
         _loc7_ = Utils.rand(int(_loc12_.length));
         tail.type = int(_loc12_[_loc7_]);
         var _loc13_:Array = [0,0,1,10];
         _loc8_ = Utils.rand(int(_loc13_.length));
         horns.type = int(_loc13_[_loc8_]);
         if(horns.type != 0)
         {
            _loc9_ = Utils.rand(4);
            horns.value = _loc9_ + 1;
         }
         var _loc14_:Array = [0,0,0,6,6,7,5,13,10,9];
         _loc9_ = Utils.rand(int(_loc14_.length));
         wings.type = int(_loc14_[_loc9_]);
         if(wings.type == 9)
         {
            wings.color = "黑色";
         }
         var _loc15_:Array = [4,4,4,0,20];
         var _loc16_:int = Utils.rand(int(_loc15_.length));
         ears.type = int(_loc15_[_loc16_]);
         if(hasCock())
         {
            _loc17_ = [CockTypesEnum.DEMON,CockTypesEnum.DOG,CockTypesEnum.HORSE,CockTypesEnum.HUMAN,CockTypesEnum.TENTACLE];
            cocks[0].set_cockType(_loc17_[Utils.rand(int(_loc17_.length))]);
            if(cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
            {
               while(Utils.rand(3) < 1)
               {
                  createCock(5 + Utils.rand(7) + Utils.rand(7) - Utils.rand(5),Utils.rand(501) * 0.01 + 1,CockTypesEnum.TENTACLE);
               }
            }
         }
         temperment = 3;
         initStrTouSpeInte(50 + Utils.rand(51),40 + Utils.rand(61),50 + Utils.rand(26) + Utils.rand(26),80 + Utils.rand(21));
         initLibSensCor(70 + Utils.rand(31),60 + Utils.rand(41),100 - Utils.rand(11));
         level = 7 + Utils.rand(5);
         set_weaponName("claws");
         set_weaponAttack(10 + Utils.rand(11));
         set_weaponVerb("punch");
         set_weaponPerk([]);
         set_armorName("demonic skin");
         set_armorDef(5 + Utils.rand(6));
         bonusHP = Utils.rand(11) * 100;
         bonusLust = Utils.rand(11) * 10;
         set_gems(100 + Utils.rand(1001) + Utils.rand(11) * 10);
         additionalXP = 250 + Utils.rand(251);
         set_drop(new WeightedChoice().add(get_consumables().INCUBID,1).add(get_consumables().SUCMILK,1).add(get_consumables().SDELITE,1).add(get_weapons().SUCWHIP,0.01));
         set_long("");
         if(special != "")
         {
            if(special == "LiddelliumCampSucc")
            {
               _loc17_ = ["蓝色","靛蓝色","紫色","酒红色","薰衣草色","蓝色","靛蓝色","紫色","酒红色","薰衣草色","午夜黑"];
               _loc18_ = Utils.rand(int(_loc17_.length));
               skin.tone = _loc17_[_loc18_];
               horns.type = 1;
               _loc19_ = Utils.rand(4);
               horns.value = _loc19_ + 1;
               _loc20_ = ["黑色 ","赤褐色 ","紫罗兰色 ","海军蓝 ",""];
               _loc21_ = Utils.rand(int(_loc20_.length));
               hair.color = _loc20_[_loc21_];
               tail.type = 3;
               wings.type = 7;
               set_long("这只魅魔是女性完美的恶魔象征，展现出引人注目的曲线和" + Std.string(allBreastsDescript) + "她的皮肤是" + skin.tone + "的，完美无瑕。她的头上装饰着两只恶魔角，分开" + Appearance.hairDescription(this) + "" + hair.color + "的头发随着她的移动而美丽地摇曳。像任何其他魅魔一样，她有一条细长且带有铲形尖端的尾巴，以一种可爱却又充满威胁的方式左右摇摆。在她的身后是巨大的蝙蝠状翅膀，可能提供一些有限的短途飞行能力。");
            }
            if(special == "LiddelliumHL")
            {
               skin.tone = "deep purple";
               hair.color = "black";
               tail.type = 3;
               wings.type = 7;
               set_str(get_str() + 25);
               set_tou(get_tou() + 30);
               set_spe(get_spe() + 30);
               set_inte(get_inte() + 10);
               lib += 15;
               sens += 20;
               cor += 10;
               level += 2;
               set_weaponAttack(get_weaponAttack() + 5);
               set_armorDef(get_armorDef() + 3);
               bonusHP += 500;
               bonusLust += 50;
               set_drop(new WeightedChoice().add(get_useables().LETHITE,1));
            }
         }
         checkMonster();
      }
      
      public function tailWhip() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Number = get_player().standardDodgeFunc(this,15);
         var _loc2_:int = int(eBaseDamage() / 3);
         outputText("希望能让你措手不及，" + get_short() + "佯装攻击，紧接着就是一记尾鞭。\n");
         if(!playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,null,_loc1_,null,null)))
         {
            outputText("铲形的尾尖像皮鞭一样抽打在你身上。");
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            _loc3_ = int(_loc2_ / 2);
            get_player().takeDamage(_loc2_,true);
            get_player().takeLustDamage(_loc3_,true);
         }
      }
      
      public function swipe() : void
      {
         outputText("这只" + get_short() + "的" + (wings.type == 0 ? "双腿紧绷" : "翅膀拍打着") + "，准备进行一次强有力的跳跃，以出乎你意料的速度拉近了距离。\n");
         var _loc1_:Number = get_player().standardDodgeFunc(this);
         var _loc2_:int = int(eBaseDamage());
         if(!playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,null,_loc1_,null,null)))
         {
            outputText((get_gender() == 1 ? "他" : "她") + "的爪子向你挥来，痛苦地划破了你的血肉。");
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            if(_loc2_ < get_player().maxHP() / 100)
            {
               outputText("伤口不深，但真的很疼！");
            }
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      override public function struggle() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Monster;
         if(get_player().hasStatusEffect(StatusEffects.Grappled))
         {
            clearOutput();
            _loc1_ = 0;
            _loc2_ = 0;
            _loc3_ = get_game().monsterArray;
            while(_loc2_ < int(_loc3_.length))
            {
               _loc4_ = _loc3_[_loc2_];
               _loc2_++;
               if(_loc4_.hasStatusEffect(StatusEffects.Grappling))
               {
                  _loc1_ += int(_loc4_.get_str());
               }
            }
            if(get_player().statusEffectv3(StatusEffects.Grappled) > 6 || get_player().get_str() + Utils.rand(100) > _loc1_ / get_player().statusEffectv2(StatusEffects.Grappled) + Utils.rand(100) + 10 * get_player().statusEffectv2(StatusEffects.Grappled))
            {
               if(special == "LiddelliumHL")
               {
                  outputText("你挣脱了男魅魔的手臂，将魅魔击退，战胜了这对恶魔。");
               }
               else
               {
                  outputText("你设法挣脱了这个淫荡的拥抱。");
               }
               get_player().removeStatusEffect(StatusEffects.Grappled);
               _loc2_ = 0;
               _loc3_ = get_game().monsterArray;
               while(_loc2_ < int(_loc3_.length))
               {
                  _loc4_ = _loc3_[_loc2_];
                  _loc2_++;
                  _loc4_.removeStatusEffect(StatusEffects.Grappling);
               }
            }
            else if(special == "LiddelliumHL")
            {
               outputText("你挣扎着想要逃离恶魔们的魔爪");
            }
            else
            {
               outputText("你挣扎着想要逃离恶魔的拥抱。");
            }
         }
      }
      
      override public function performCombatAction() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Grappled) && !hasStatusEffect(StatusEffects.Grappling))
         {
            if(special == "LiddelliumHL")
            {
               hlGrappleTease(int(get_player().statusEffectv3(StatusEffects.Grappled)));
               return;
            }
            grapple();
            return;
         }
         if(hasStatusEffect(StatusEffects.Grappling))
         {
            if(special == "LiddelliumHL")
            {
               hlGrappleTease(int(get_player().statusEffectv3(StatusEffects.Grappled)));
               return;
            }
            grappleTease();
            return;
         }
         var _loc1_:MonsterAI = new MonsterAI();
         if(special != "LiddelliumHL")
         {
            _loc1_.add(grapple,1,distance == CombatDistance.Melee,0,FATIGUE_NONE,CombatRange.Melee);
         }
         _loc1_.add(swipe,1,true,0,FATIGUE_NONE,CombatRange.Melee);
         _loc1_.add(lustMagicAttack,0.5,true,10,FATIGUE_MAGICAL,CombatRange.Ranged);
         if(tail.type == 3)
         {
            _loc1_.add(tailWhip,0.5,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         }
         if(lowerBody.type == 5)
         {
            _loc1_.add(heelKick,0.5,true,5,FATIGUE_PHYSICAL,CombatRange.Melee);
         }
         if(special == "LiddelliumHL")
         {
            _loc1_.add(hlGrapple,1,!get_player().hasStatusEffect(StatusEffects.Grappled) && (get_game().monsterArray[0].get_HP() > 0 && get_game().monsterArray[1].get_HP() > 0 && (get_game().monsterArray[0].get_lust() < get_game().monsterArray[0].maxLust() && get_game().monsterArray[1].get_lust() < get_game().monsterArray[1].maxLust())),10,FATIGUE_PHYSICAL,CombatRange.Melee);
         }
         _loc1_.exec();
      }
      
      public function lustMagicAttack() : void
      {
         outputText("这只恶魔做了一系列神秘的手势，身上明显闪烁着邪恶的光芒。");
         var _loc1_:int = int((5 + Utils.rand(6)) * ((2 * get_inte() + get_player().lib + 2 * get_player().cor) / 200));
         if(_loc1_ > 10)
         {
            outputText("" + (get_gender() == 1 ? "他" : "她") + "的魔法瞬间射入你的体内，一股暖流蔓延至你的全身！");
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function hlGrappleTease(param1:int) : void
      {
         createOrFindStatusEffect(StatusEffects.Grappling);
         var _temp_1:* = get_player().createOrFindStatusEffect(StatusEffects.Grappled);
         _temp_1.value3 = _temp_1.value3 + 1;
         var _loc2_:int = int((10 + Utils.rand(11)) * ((get_player().sens + get_player().cor + get_player().lib) / 100));
         switch(param1)
         {
            case 1:
               return;
            case 2:
               outputText("你仍然被这对恶魔中的男性紧紧抓住，而女性则趁机性感地抚摸着你的身体。她眼中闪烁着令人目眩的光芒，深深吸引着你。");
               get_player().takeLustDamage(_loc2_,true);
               break;
            case 3:
               return;
            case 4:
               outputText("魅魔在你的胸膛上印下亲吻。[say:别反抗，我们可是经验丰富的主人。做我们的奴隶会是非常美妙的体验……]她捧着你的脸颊，深情地凝视着你的双眼。");
               get_player().takeLustDamage(_loc2_ + 5,true);
               break;
            case 5:
               return;
            case 6:
               outputText("男魅魔和魅魔巨大的蝙蝠状翅膀从两侧伸展开来，将你包裹在他们共同的拥抱中。男魅魔那充满诱惑的低沉嗓音在你耳边低语。[say:别反抗我们。]");
               get_player().takeLustDamage(_loc2_ + 10,true);
               break;
            default:
               struggle();
         }
      }
      
      public function hlGrapple() : void
      {
         outputText("魅魔绕到你侧面，试图用踢击包抄你。这招很容易看穿并躲避，但这只是个佯攻，男魅魔趁机绕过来抓住了你！他的双臂从你腋下穿过，将你死死锁在全尼尔森式擒拿中。");
         createStatusEffect(StatusEffects.Grappling,0,0,0,0);
         get_player().createStatusEffect(StatusEffects.Grappled,0,0,1,0);
      }
      
      public function heelKick() : void
      {
         outputText("魅魔扭动身体，弯起一条腿，在提供相当不错的视野的同时，也严重暴露了她的攻击意图。\n");
         var _loc1_:Number = get_player().standardDodgeFunc(this,-20);
         var _loc2_:int = int(eBaseDamage() * 2);
         if(!playerAvoidDamage(new AvoidDamageParameters(null,null,null,null,null,_loc1_,null,null)))
         {
            outputText("女恶魔猛地向前一扑，将她那恶魔般的高跟鞋狠狠地踩进你的身体里。");
            _loc2_ = get_player().reduceDamage(_loc2_,this);
            get_player().takeDamage(_loc2_,true);
         }
      }
      
      public function grappleTease() : void
      {
         if(get_gender() != 1 && tail.type != 0)
         {
            outputText("她的尾巴扭动着，以一种有些让人发痒的方式戳着你，同时她深情地凝视着你的眼睛。她的乳房紧紧贴在你的身上。");
         }
         var _loc1_:int = int((5 + Utils.rand(6)) * ((get_player().sens + get_player().cor + get_player().lib) / 100));
         if(_loc1_ > 10)
         {
            outputText("这个淫荡的拥抱让你欲火焚身。");
         }
         get_player().takeLustDamage(_loc1_,true);
      }
      
      public function grapple() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.Grappled))
         {
            outputText("这只" + get_short() + "也加入了压制你的拥抱中。");
            var _temp_1:* = get_player().createOrFindStatusEffect(StatusEffects.Grappled);
            _temp_1.value2 = _temp_1.value2 + 1;
            createStatusEffect(StatusEffects.Grappling,0,0,0,0);
            return;
         }
         outputText("这只" + get_short() + "迅速冲了过来，张开" + (get_gender() == 1 ? "他" : "她") + "的双臂想要拥抱你。");
         if(get_player().get_spe() + Utils.rand(100) < get_spe() + Utils.rand(100))
         {
            outputText((get_gender() == 1 ? "他" : "她") + "用尽全力将你扑倒，在你们双双倒地时跨坐在你身上。");
            if(get_player().get_str() + Utils.rand(100) < get_str() + Utils.rand(100))
            {
               outputText((get_gender() == 1 ? "他" : "她") + "将你紧紧抓在" + (get_gender() == 1 ? "他" : "她") + "的魔爪中！");
               var _temp_2:* = get_player().createOrFindStatusEffect(StatusEffects.Grappled);
               _temp_2.value2 = _temp_2.value2 + 1;
               createStatusEffect(StatusEffects.Grappling,0,0,0,0);
            }
            else
            {
               outputText("谢天谢地，你成功地将" + (get_gender() == 1 ? "他" : "她") + "推开，并重新站稳了脚跟。");
            }
         }
         else
         {
            outputText("然而，你的速度更胜一筹，" + (get_gender() == 1 ? "他" : "她") + "根本无法靠近你");
         }
      }
   }
}

