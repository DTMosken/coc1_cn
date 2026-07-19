package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Creature;
   import classes.Monster;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.MonsterAI;
   import classes.internals.Utils;
   import classes.scenes.combat.AvoidDamageParameters;
   import classes.scenes.combat.CombatRange;
   import classes.statusEffects.combat.CalledShotDebuff;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Helspawn extends Monster
   {
      
      public var weaponRange:CombatRange;
      
      public var usedFocus:Boolean;
      
      public function Helspawn()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         weaponRange = CombatRange.Melee;
         usedFocus = false;
         super();
         var _loc1_:String = FlagDict_Impl_.arrayReadString(KFLAGS.flags,959);
         var _loc2_:IMap = new StringMap();
         if("bow" in StringMap.reserved)
         {
            _loc2_.setReserved("bow","反曲弓，使用钝头软箭");
         }
         else
         {
            _loc2_.h["bow"] = "反曲弓，使用钝头软箭";
         }
         if("scimitar" in StringMap.reserved)
         {
            _loc2_.setReserved("scimitar","弯刀，就像她妈妈的一样，并且摆出赫莉娅惯用的狂暴姿态");
         }
         else
         {
            _loc2_.h["scimitar"] = "弯刀，就像她妈妈的一样，并且摆出赫莉娅惯用的狂暴姿态";
         }
         if("scimitar and shield" in StringMap.reserved)
         {
            _loc2_.setReserved("scimitar and shield","弯刀和盾牌，这让她拥有了平衡的战斗风格");
         }
         else
         {
            _loc2_.h["scimitar and shield"] = "弯刀和盾牌，这让她拥有了平衡的战斗风格";
         }
         var _loc3_:StringMap = _loc2_;
         var _loc4_:String = _loc1_ in StringMap.reserved ? _loc3_.getReserved(_loc1_) : _loc3_.h[_loc1_];
         set_a("");
         set_short(get_game().helSpawnScene.get_helspawnName());
         imageName = "hollispawn";
         set_long(get_game().helSpawnScene.get_helspawnName() + "是一只年轻的火蜥蜴，看起来在十几岁左右。她穿着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,957) >= 50 ? "像她母亲一样暴露的鳞片比基尼，几乎遮不住什么" : "短裙、过膝长靴和天蓝色的衬衫，与她母亲暴露的穿着形成鲜明对比") + "，身高约六英尺，身后一条长长的、燃烧着的尾巴充满威胁地甩动着。她装备着一把" + _loc4_ + "。这位身材健美的年轻战士在你周围踱步，专注地研究着她导师的防御，准备迎接你的下一次攻击。");
         set_race("Salamander");
         createVagina(false,1,1);
         createStatusEffect(StatusEffects.BonusVCapacity,85,0,0,0);
         createBreastRow(Appearance.breastCupInverse("E+"));
         ass.analLooseness = 0;
         ass.analWetness = 0;
         createStatusEffect(StatusEffects.BonusACapacity,85,0,0,0);
         set_tallness(78);
         hips.rating = 12;
         butt.rating = 9;
         skin.tone = "dusky";
         hair.color = "red";
         hair.length = 13;
         initStrTouSpeInte(50,50,65,40);
         initLibSensCor(35,55,20);
         set_weaponName(_loc1_);
         var _loc5_:IMap = new StringMap();
         if("bow" in StringMap.reserved)
         {
            _loc5_.setReserved("bow","钝箭");
         }
         else
         {
            _loc5_.h["bow"] = "钝箭";
         }
         if("scimitar" in StringMap.reserved)
         {
            _loc5_.setReserved("scimitar","挥砍");
         }
         else
         {
            _loc5_.h["scimitar"] = "挥砍";
         }
         if("scimitar and shield" in StringMap.reserved)
         {
            _loc5_.setReserved("scimitar and shield","挥砍");
         }
         else
         {
            _loc5_.h["scimitar and shield"] = "挥砍";
         }
         var _loc6_:StringMap = _loc5_;
         set_weaponVerb(_loc1_ in StringMap.reserved ? _loc6_.getReserved(_loc1_) : _loc6_.h[_loc1_]);
         var _loc7_:IMap = new StringMap();
         var _loc8_:CombatRange = CombatRange.Ranged;
         if("bow" in StringMap.reserved)
         {
            _loc7_.setReserved("bow",_loc8_);
         }
         else
         {
            _loc7_.h["bow"] = _loc8_;
         }
         _loc8_ = CombatRange.ChargingMelee;
         if("scimitar" in StringMap.reserved)
         {
            _loc7_.setReserved("scimitar",_loc8_);
         }
         else
         {
            _loc7_.h["scimitar"] = _loc8_;
         }
         _loc8_ = CombatRange.Melee;
         if("scimitar and shield" in StringMap.reserved)
         {
            _loc7_.setReserved("scimitar and shield",_loc8_);
         }
         else
         {
            _loc7_.h["scimitar and shield"] = _loc8_;
         }
         var _loc9_:StringMap = _loc7_;
         weaponRange = _loc1_ in StringMap.reserved ? _loc9_.getReserved(_loc1_) : _loc9_.h[_loc1_];
         set_weaponAttack(20);
         if(_loc1_ == "bow")
         {
            normalAttackAvoid.doParry = false;
            normalAttackAvoid.doCounter = false;
         }
         set_armorName("scales");
         set_armorDef(12);
         set_armorPerk("");
         set_armorValue(50);
         bonusHP = 175;
         set_lust(30);
         lustVuln = 0.55;
         temperment = 2;
         level = 12;
         set_gems(10 + Utils.rand(5));
         tail.type = 25;
         tail.recharge = 0;
         set_drop(NO_DROP);
         checkMonster();
      }
      
      override public function won(param1:Boolean, param2:Boolean = false) : void
      {
         get_game().helSpawnScene.loseSparringToDaughter();
      }
      
      public function tailWhipShitYo() : void
      {
         var _loc1_:Number = int(get_str() - Utils.rand(get_player().get_tou()));
         outputText("[pg][helspawn]挥舞着她的尾巴向你抽来，试图用她那耀眼的火焰烧伤你！");
         if(_loc1_ <= 0 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n你避开了攻击。");
         }
         else
         {
            outputText("\n当你试图躲闪时，[helspawn]的尾巴扫到了你。你听到[armor]发出一声嘶嘶声，你惊叫着向后跳去，她给你造成了轻微的烧伤。");
            get_player().takeDamage(_loc1_,true);
         }
      }
      
      public function sluttyMander() : void
      {
         var _loc1_:Number = NaN;
         outputText("[helspawn]跳出你的攻击范围，然后转过身，将武器插在地上，背对着你，有节奏地摇晃着她那丰满的屁股，充满诱惑地扭动着她那圆润的臀部。");
         if(Utils.rand(2) == 0)
         {
            outputText("\n她到底想干什么？你走过去，狠狠地踢了她的屁股一脚，[say: 专心点，孩子。拿起你的武器！]");
         }
         else
         {
            outputText("\n你向后靠去，欣赏着这场表演，这个淫荡的小火蜥蜴直接滑过了你的防线，几乎是在你身上摩擦，直到你感觉到下腹部燃起了一团火！");
            _loc1_ = get_player().lustVuln * (10 + get_player().lib / 10);
            get_player().takeLustDamage(_loc1_);
         }
      }
      
      override public function performCombatAction() : void
      {
         var _loc1_:MonsterAI = new MonsterAI();
         _loc1_.add(helspawnTwinStrikes,1,true,10,FATIGUE_PHYSICAL,weaponRange);
         _loc1_.add(calledShot,1,FlagDict_Impl_.arrayReadString(get_flags(),959) == "bow",10,FATIGUE_PHYSICAL,CombatRange.Ranged);
         _loc1_.add(helSpawnBerserk,1,get_weaponAttack() < 50 || FlagDict_Impl_.arrayReadString(get_flags(),959) == "scimitar",10,FATIGUE_PHYSICAL,CombatRange.Self);
         _loc1_.add(helSpawnShieldBash,1,FlagDict_Impl_.arrayReadString(get_flags(),959) == "scimitar and shield",10,FATIGUE_PHYSICAL,CombatRange.Melee);
         _loc1_.add(sluttyMander,1,FlagDict_Impl_.arrayReadInt(get_flags(),957) >= 50,0,FATIGUE_NONE,CombatRange.Tease);
         _loc1_.add(helSpawnFocus,1,FlagDict_Impl_.arrayReadInt(get_flags(),957) < 50 && !usedFocus,5,FATIGUE_NONE,CombatRange.Self);
         _loc1_.exec();
         if(Utils.rand(4) == 0)
         {
            tailWhipShitYo();
         }
      }
      
      public function helspawnTwinStrikes() : void
      {
         if(FlagDict_Impl_.arrayReadString(get_flags(),959) == "bow")
         {
            outputText("[helspawn]向后跳出你的攻击范围，搭上两支钝头箭，一起拉开弓弦，同时射出！\n");
         }
         else
         {
            outputText("[helspawn]向你猛扑过来，弯刀划破空气直逼你的喉咙！\n");
         }
         createStatusEffect(StatusEffects.Attacks,0,0,0,0);
         eAttack();
      }
      
      public function helSpawnShieldBash() : void
      {
         var _loc1_:Number = get_player().reduceDamage(get_str(),this);
         outputText("[helspawn]用她的盾牌猛击，试图把你击退！");
         if(_loc1_ <= 0 || Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n你避开了攻击。");
         }
         else
         {
            outputText("\n她的盾牌正中你的脸，把你打倒在地，让你破绽百出！");
            get_player().takeDamage(_loc1_,true);
            if(get_player().stun(0,33,100,false))
            {
               outputText("<b>这一击将你打晕了。</b>");
            }
         }
      }
      
      public function helSpawnFocus() : void
      {
         outputText("看到混战中出现了短暂的平静，[helspawn]滑出攻击范围，踉跄着后退，紧紧抓住她身上到处都是的瘀伤。[say: 来吧，[helspawn]，你能做到的。集中注意力，集中注意力，]她嘟囔着，试图喘口气。片刻之后，她似乎恢复了体力，以一种新的活力准备好了她的武器。");
         set_lust(get_lust() - 50);
         if(get_lust() < 0)
         {
            set_lust(0);
         }
         changeFatigue(-50);
         addHP(maxHP() / 2);
         usedFocus = true;
      }
      
      public function helSpawnBerserk() : void
      {
         outputText("[helspawn]发出一声野蛮的战吼，在原始的狂喜中仰起头，然后带着狂野眼神中纯粹的嗜血冲回战场！");
         set_weaponAttack(get_weaponAttack() + 30);
         set_armorDef(0);
      }
      
      override public function defeated(param1:Boolean) : void
      {
         get_game().helSpawnScene.beatUpYourDaughter();
      }
      
      public function calledShot() : void
      {
         var _loc2_:* = null as CalledShotDebuff;
         outputText("[helspawn]拉开弓弦，多花了一秒钟瞄准，然后放箭！");
         var _loc1_:Number = get_player().reduceDamage(get_str() + get_weaponAttack(),this);
         if(_loc1_ <= 0 || Utils.rand(2) == 0 && Boolean(combatAvoidDamage(new AvoidDamageParameters(true,false,false,null,null,null,null,null)).attackFailed))
         {
            outputText("\n你避开了攻击！");
         }
         else
         {
            outputText("\n她的一支箭正中你的[leg]，差点把你打翻。真他妈的疼！你要瘸好一阵子了！");
            _loc2_ = get_player().createOrFindStatusEffect(StatusEffects.CalledShot);
            _loc2_.increase();
            get_player().takeDamage(_loc1_,true);
         }
      }
   }
}

