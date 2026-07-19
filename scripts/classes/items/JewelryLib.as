package classes.items
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.jewelries.Nothing;
   import classes.items.jewelries.RingOfPatience;
   import classes.items.jewelries.RingofTheSpectre;
   import flash.Boot;
   
   public final class JewelryLib
   {
      
      public static var init__:Boolean;
      
      public static var NOTHING:Nothing;
      
      public static var MODIFIER_NONE:int = 0;
      
      public static var MODIFIER_MINIMUM_LUST:int = 1;
      
      public static var MODIFIER_FERTILITY:int = 2;
      
      public static var MODIFIER_CRITICAL:int = 3;
      
      public static var MODIFIER_REGENERATION:int = 4;
      
      public static var MODIFIER_HP:int = 5;
      
      public static var MODIFIER_ATTACK_POWER:int = 6;
      
      public static var MODIFIER_SPELL_POWER:int = 7;
      
      public static var PURITY:int = 8;
      
      public static var CORRUPTION:int = 9;
      
      public static var MODIFIER_FLAMESPIRIT:int = 10;
      
      public static var MODIFIER_ACCURACY:int = 11;
      
      public static var MODIFIER_ETHEREALBLEED:int = 12;
      
      public static var MODIFIER_SPECTRE:int = 13;
      
      public static var MODIFIER_FRENZY:int = 14;
      
      public static var DEFAULT_VALUE:Number = 6;
      
      public var SILVRNG:Jewelry;
      
      public var RING_SPECTR:Jewelry;
      
      public var REGNRN3:Jewelry;
      
      public var REGNRN2:Jewelry;
      
      public var REGNRN1:Jewelry;
      
      public var PURERNG:Jewelry;
      
      public var POWRRN3:Jewelry;
      
      public var POWRRN2:Jewelry;
      
      public var POWRRN1:Jewelry;
      
      public var PLATRNG:Jewelry;
      
      public var PATIENCERING:Jewelry;
      
      public var MYSTRN3:Jewelry;
      
      public var MYSTRN2:Jewelry;
      
      public var MYSTRN1:Jewelry;
      
      public var LTHCRNG:Jewelry;
      
      public var LIFERN3:Jewelry;
      
      public var LIFERN2:Jewelry;
      
      public var LIFERN1:Jewelry;
      
      public var ICE_RN3:Jewelry;
      
      public var ICE_RN2:Jewelry;
      
      public var ICE_RN1:Jewelry;
      
      public var GOLDRNG:Jewelry;
      
      public var FLMSPRTRNG:Jewelry;
      
      public var FERTRN3:Jewelry;
      
      public var FERTRN2:Jewelry;
      
      public var FERTRN1:Jewelry;
      
      public var FABRING:Jewelry;
      
      public var ETHRTRINNG:Jewelry;
      
      public var DIAMRNG:Jewelry;
      
      public var CRITRN3:Jewelry;
      
      public var CRITRN2:Jewelry;
      
      public var CRITRN1:Jewelry;
      
      public var CRIMRN3:Jewelry;
      
      public var CRIMRN2:Jewelry;
      
      public var CRIMRN1:Jewelry;
      
      public var BLINDRAGERING:Jewelry;
      
      public var AQUARING:Jewelry;
      
      public var ACCRN3:Jewelry;
      
      public var ACCRN2:Jewelry;
      
      public var ACCRN1:Jewelry;
      
      public function JewelryLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         BLINDRAGERING = new Jewelry("BlindRageRing","BlindRage Ring","Ring of Blinding Rage","a half-finished silver ring shaped like overlapping knots",0,0,1,"An enchanted silver ring, shaped like two half finished knots interlocking in a circle. The details on it are rough and unfinished, as if the artisan gave up halfway through. It prompts a deep feeling of rage when worn. ","Ring");
         PATIENCERING = new RingOfPatience();
         FABRING = new Jewelry("FabRing","Fabulous Ring","fabulous ring","an ostentatiously fabulous ring",0,0,4000,"A gold ring studded with three gleaming jewels. You obtained it from the old demon you encountered with Dolores, and even looking at it almost makes you drool just thinking of its worth.","Ring");
         SILVRNG = new Jewelry("SilvRng","Silver Ring","silver ring","a normal silver ring",0,0,200,"A simple but pretty ring, made out of silver. ","Ring");
         PLATRNG = new Jewelry("PlatRng","Platinum Ring","platinum ring","a shining platinum ring",0,0,1000,"A shining ring made of platinum, a rare precious metal. ","Ring");
         GOLDRNG = new Jewelry("GoldRng","Gold Ring","gold ring","a shining gold ring",0,0,400,"A shining ring made of gold. ","Ring");
         var _loc1_:Jewelry = new Jewelry("DiamRng","Diamond Ring","gold and diamond ring","a shining gold and diamond ring",0,0,1000,"A ring made of gold, topped with a shining diamond. ","Ring");
         _loc1_._headerName = "Diamond Ring";
         DIAMRNG = _loc1_;
         AQUARING = new Jewelry("AquamarineRing","Aquamarine Ring","aquamarine ring","a calming milky blue aquamarine ring",0,0,5000,"The milky blue stone has a calming aura and smells like the lake.","Ring");
         RING_SPECTR = new RingofTheSpectre();
         ETHRTRINNG = new Jewelry("Eth.TearRing","Tearing Ring","Ring of Ethereal Tearing","an iridescent crimson ring",12,1,5000,"An iridescent crimson ring faintly humming with magical energy. It was skillfully fashioned from meteorite ore, giving it an almost ethereal feel. Remarkably when worn, it slows down the healing of inflicted wounds on opponents, even on the toughest creature. ","Ring");
         FLMSPRTRNG = new Jewelry("FlamesprtRng","Flamespirit Ring","Flamespirit Ring","a gold and black ring with a flame emblem",0,1,5000,"A golden ring engraved with the image of an everlasting flame, the emblem of the inquisitors. It increases the wearer\'s spell power tremendously, but will also raise the cost of spells.\n\n<i>Inquisitors were known to cast magic using their own lifeforce. The more devout and experienced among them wore this ring, and cared not for the pain they felt while purging the demonic plague.</i> ","Ring");
         LTHCRNG = new Jewelry("LthcRng","Lethicite Ring","lethicite ring","a glowing lethicite ring",9,10,5000,"An enchanted ring made from platinum and topped with lethicite. It exudes a small aura of corruption that seeps from it. ","Ring");
         PURERNG = new Jewelry("PureRng","Purity Ring","lesser purity ring","an enchanted diamond ring of purity",0,10,3000,"An enchanted, diamond-topped ring. It is a manifestation of chastity and purity, reducing the wearer\'s libido and making it harder for them to get turned on. ","Ring");
         ACCRN3 = new Jewelry("FocsRng3","G. Focus Ring","greater ring of focus","an enchanted onyx ring of focus",0,20,6000,"A greater enchanted ring topped with onyx. It will increase the wearer\'s focus, making them miss less often. ","Ring");
         POWRRN3 = new Jewelry("PowrRn3","G. Power Ring","greater ring of power","an enchanted ruby ring of power",0,12,6000,"A greater enchanted ring topped with ruby. It increases the wearer\'s physical prowess when worn. ","Ring");
         MYSTRN3 = new Jewelry("MystRn3","G. Mystic Ring","greater ring of mysticality","an enchanted sapphire ring of mysticality",0,40,6000,"A greater enchanted ring topped with sapphire. It increases the wearer\'s magical prowess when worn. ","Ring");
         LIFERN3 = new Jewelry("LifeRn3","G. Life Ring","greater ring of life","an enchanted emerald ring of life force",0,60,4000,"A greater enchanted ring topped with emerald. It boosts the wearer\'s health. ","Ring");
         REGNRN3 = new Jewelry("RegnRn3","G. Regen Ring","greater ring of regeneration","an enchanted amethyst ring of regeneration",0,4,8000,"A greater enchanted ring topped with amethyst. It helps hasten recovery from injuries when worn. ","Ring");
         CRITRN3 = new Jewelry("CritRn3","G. Critical Ring","greater ring of criticality","an enchanted topaz ring of criticality",0,7,6000,"A greater enchanted ring topped with topaz. It boosts the wearer\'s focus, allowing them to more easily take advantage of opponents\' weak spots. ","Ring");
         ICE_RN3 = new Jewelry("Ice_Rn3","G. Icestone Ring","greater icestone ring","an enchanted icestone ring",0,-20,8000,"A greater enchanted ring topped with icestone. It will reduce your ever-burning desires when worn. ","Ring");
         FERTRN3 = new Jewelry("FertRn3","G. Fertite Ring","greater fertite ring","an enchanted fertite ring",2,40,4000,"A greater enchanted ring topped with fertite. It makes the wearer more virile and fertile. ","Ring");
         CRIMRN3 = new Jewelry("CrimRn3","G. Crimstone Ring","greater crimstone ring","an enchanted crimstone ring",0,20,4000,"A greater enchanted ring topped with crimstone. When worn, it helps to keep your desires burning. ","Ring");
         ACCRN2 = new Jewelry("FocsRng2","Focus Ring","ring of focus","an enchanted onyx ring of focus",0,15,3000,"An enchanted ring topped with onyx. It will increase the wearer\'s focus, making them miss less often. ","Ring");
         POWRRN2 = new Jewelry("PowrRn2","Power Ring","ring of power","an enchanted ruby ring of power",0,9,3000,"An enchanted ring topped with ruby. It increases the wearer\'s physical prowess when worn. ","Ring");
         MYSTRN2 = new Jewelry("MystRn2","Mystic Ring","ring of mysticality","an enchanted sapphire ring of mysticality",0,30,3000,"An enchanted ring topped with sapphire. It increases the wearer\'s magical prowess when worn. ","Ring");
         LIFERN2 = new Jewelry("LifeRn2","Life Ring","ring of life","an enchanted emerald ring of life force",0,45,2000,"An enchanted ring topped with emerald. It boosts the wearer\'s health. ","Ring");
         REGNRN2 = new Jewelry("RegnRn2","Regen Ring","ring of regeneration","an enchanted amethyst ring of regeneration",0,3,4000,"An enchanted ring topped with amethyst. It helps hasten recovery from injuries when worn. ","Ring");
         CRITRN2 = new Jewelry("CritRn2","Critical Ring","ring of criticality","an enchanted topaz ring of criticality",0,5,3000,"An enchanted ring topped with topaz. It boosts the wearer\'s focus so they can more easily take advantage of opponents\' weak spots. ","Ring");
         ICE_RN2 = new Jewelry("Ice_Rn2","Icestone Ring","icestone ring","an enchanted icestone ring",0,-15,4000,"An enchanted ring topped with icestone. It will reduce your ever-burning desires when worn. ","Ring");
         FERTRN2 = new Jewelry("FertRn2","Fertite Ring","fertite ring","an enchanted fertite ring",2,30,2000,"An enchanted ring topped with fertite. It makes the wearer more virile and fertile. ","Ring");
         CRIMRN2 = new Jewelry("CrimRn2","Crimstone Ring","crimstone ring","an enchanted crimstone ring",0,15,2000,"An enchanted ring topped with crimstone. When worn, it helps to keep your desires burning. ","Ring");
         ACCRN1 = new Jewelry("FocsRng","L. Focus Ring","lesser ring of focus","an enchanted onyx ring of focus",0,10,1500,"A lesser enchanted ring topped with onyx. It will increase the wearer\'s focus, making them miss less often. ","Ring");
         POWRRN1 = new Jewelry("PowrRng","L. Power Ring","lesser ring of power","an enchanted ruby ring of power",0,6,1500,"A lesser enchanted ring topped with ruby. It increases the wearer\'s physical prowess when worn. ","Ring");
         MYSTRN1 = new Jewelry("MystRng","L. Mystic Ring","lesser ring of mysticality","an enchanted sapphire ring of mysticality",0,20,1500,"A lesser enchanted ring topped with sapphire. It increases the wearer\'s magical prowess when worn. ","Ring");
         LIFERN1 = new Jewelry("LifeRng","L. Life Ring","lesser ring of life","an enchanted emerald ring of life force",0,30,1000,"A lesser enchanted ring topped with emerald. It boosts the wearer\'s health. ","Ring");
         REGNRN1 = new Jewelry("RegnRng","L. Regen Ring","lesser ring of regeneration","an enchanted amethyst ring of regeneration",0,2,2000,"A lesser enchanted ring topped with amethyst. It helps hasten recovery from injuries when worn. ","Ring");
         CRITRN1 = new Jewelry("CritRng","L. Critical Ring","lesser ring of criticality","an enchanted topaz ring of criticality",0,3,1500,"A lesser enchanted ring topped with topaz. It boosts the wearer\'s focus, allowing them to more easily take advantage of opponents\' weak spots. ","Ring");
         ICE_RN1 = new Jewelry("Ice_Rng","L. Icestone Ring","lesser icestone ring","an enchanted icestone ring",0,-10,2000,"A lesser enchanted ring topped with icestone. It will reduce your ever-burning desires when worn ","Ring");
         FERTRN1 = new Jewelry("FertRng","L. Fertite Ring","lesser fertite ring","an enchanted fertite ring",2,20,1000,"A lesser enchanted ring topped with fertite. It makes the wearer more virile and fertile. ","Ring");
         CRIMRN1 = new Jewelry("CrimRng","L. Crimstone Ring","lesser crimstone ring","an enchanted crimstone ring",0,10,1000,"A lesser enchanted ring topped with crimstone. When worn, it helps to keep your desires burning. ","Ring");
         initializeJewelry();
      }
      
      public function initializeJewelry() : void
      {
         var _loc1_:Jewelry = MYSTRN1;
         _loc1_.boost("法术修正",NumberFunc_Impl_.fromInt(20),false);
         _loc1_ = MYSTRN2;
         _loc1_.boost("法术修正",NumberFunc_Impl_.fromInt(30),false);
         _loc1_ = MYSTRN3;
         _loc1_.boost("法术修正",NumberFunc_Impl_.fromInt(40),false);
         _loc1_ = ACCRN1;
         _loc1_.boost("命中率",NumberFunc_Impl_.fromInt(10),false);
         _loc1_ = ACCRN2;
         _loc1_.boost("命中率",NumberFunc_Impl_.fromInt(15),false);
         _loc1_ = ACCRN3;
         _loc1_.boost("命中率",NumberFunc_Impl_.fromInt(20),false);
         _loc1_ = CRITRN1;
         _loc1_.boost("暴击率",NumberFunc_Impl_.fromInt(3),false);
         _loc1_ = CRITRN2;
         _loc1_.boost("暴击率",NumberFunc_Impl_.fromInt(5),false);
         _loc1_ = CRITRN3;
         _loc1_.boost("暴击率",NumberFunc_Impl_.fromInt(7),false);
         _loc1_ = FLMSPRTRNG;
         _loc1_.boost("法术消耗",NumberFunc_Impl_.fromInt(2),true);
         var _loc2_:Jewelry = _loc1_;
         _loc2_.boost("法术修正",NumberFunc_Impl_.fromInt(100),false);
         _loc1_ = POWRRN1;
         _loc1_.boost("物理伤害",NumberFunc_Impl_.fromFloat(1.06),true);
         _loc1_ = POWRRN2;
         _loc1_.boost("物理伤害",NumberFunc_Impl_.fromFloat(1.09),true);
         _loc1_ = POWRRN3;
         _loc1_.boost("物理伤害",NumberFunc_Impl_.fromFloat(1.12),true);
         _loc1_ = LIFERN1;
         _loc1_.boost("最大生命值",NumberFunc_Impl_.fromInt(30),false);
         _loc1_ = LIFERN2;
         _loc1_.boost("最大生命值",NumberFunc_Impl_.fromInt(45),false);
         _loc1_ = LIFERN3;
         _loc1_.boost("最大生命值",NumberFunc_Impl_.fromInt(60),false);
         _loc1_ = REGNRN1;
         _loc1_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(2),false);
         _loc1_ = REGNRN2;
         _loc1_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(3),false);
         _loc1_ = REGNRN3;
         _loc1_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(4),false);
         _loc1_ = ICE_RN1;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(-10),false);
         _loc1_ = ICE_RN2;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(-15),false);
         _loc1_ = ICE_RN3;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(-20),false);
         _loc1_ = CRIMRN1;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(10),false);
         _loc1_ = CRIMRN2;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(15),false);
         _loc1_ = CRIMRN3;
         _loc1_.boost("最低欲望",NumberFunc_Impl_.fromInt(20),false);
         _loc1_ = PURERNG;
         _loc1_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.1),true);
         _loc1_ = PURERNG;
         _loc1_.boost("最低性欲",NumberFunc_Impl_.fromInt(-10),false);
         _loc1_ = BLINDRAGERING;
         _loc1_.boost("命中率",NumberFunc_Impl_.fromInt(-80),false);
         _loc1_ = BLINDRAGERING;
         _loc1_.boost("物理伤害",NumberFunc_Impl_.fromFloat(1.8),true);
      }
   }
}

