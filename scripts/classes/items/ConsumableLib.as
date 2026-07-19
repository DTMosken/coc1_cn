package classes.items
{
   import classes.items.consumables.AkbalSaliva;
   import classes.items.consumables.Ament;
   import classes.items.consumables.BeautifulSwordShard;
   import classes.items.consumables.BeeHoney;
   import classes.items.consumables.Beondegi;
   import classes.items.consumables.BimboChampagne;
   import classes.items.consumables.BimboLiqueur;
   import classes.items.consumables.BlackCatBeer;
   import classes.items.consumables.BlackRubberEgg;
   import classes.items.consumables.BlackSpellBook;
   import classes.items.consumables.BlueEgg;
   import classes.items.consumables.BodyLotion;
   import classes.items.consumables.BroBrew;
   import classes.items.consumables.BrownEgg;
   import classes.items.consumables.CaninePepper;
   import classes.items.consumables.CeruleanPotion;
   import classes.items.consumables.Clovis;
   import classes.items.consumables.Coal;
   import classes.items.consumables.DeBimbo;
   import classes.items.consumables.EchidnaCake;
   import classes.items.consumables.Ectoplasm;
   import classes.items.consumables.EmberEgg;
   import classes.items.consumables.EmberTFs;
   import classes.items.consumables.Equinum;
   import classes.items.consumables.FerretFruit;
   import classes.items.consumables.FishFillet;
   import classes.items.consumables.FoxBerry;
   import classes.items.consumables.FoxJewel;
   import classes.items.consumables.FrothyBeer;
   import classes.items.consumables.GiantChocolateCupcake;
   import classes.items.consumables.GnollSpot;
   import classes.items.consumables.GoblinAle;
   import classes.items.consumables.GodMead;
   import classes.items.consumables.GoldenRind;
   import classes.items.consumables.GoldenSeed;
   import classes.items.consumables.GraySpellBook;
   import classes.items.consumables.GroPlus;
   import classes.items.consumables.HairDye;
   import classes.items.consumables.HairExtensionSerum;
   import classes.items.consumables.HardBiscuits;
   import classes.items.consumables.HealPill;
   import classes.items.consumables.HerbalContraceptive;
   import classes.items.consumables.IceShard;
   import classes.items.consumables.ImpFood;
   import classes.items.consumables.IncubiDraft;
   import classes.items.consumables.IsabellaMilk;
   import classes.items.consumables.KangaFruit;
   import classes.items.consumables.KitsuneGift;
   import classes.items.consumables.LaBova;
   import classes.items.consumables.Lactaid;
   import classes.items.consumables.Liddellium;
   import classes.items.consumables.LoliPop;
   import classes.items.consumables.LustDraft;
   import classes.items.consumables.LustStick;
   import classes.items.consumables.MarbleMilk;
   import classes.items.consumables.MilkPotion;
   import classes.items.consumables.MinotaurBlood;
   import classes.items.consumables.MinotaurCum;
   import classes.items.consumables.Mint;
   import classes.items.consumables.MouseCocoa;
   import classes.items.consumables.NeonPinkEgg;
   import classes.items.consumables.NumbRocks;
   import classes.items.consumables.NumbingOil;
   import classes.items.consumables.OculumArachnae;
   import classes.items.consumables.OvipositionElixir;
   import classes.items.consumables.OvipositionMax;
   import classes.items.consumables.PeppermintWhite;
   import classes.items.consumables.PhoukaWhiskey;
   import classes.items.consumables.PigTruffle;
   import classes.items.consumables.PinkEgg;
   import classes.items.consumables.PrincessPucker;
   import classes.items.consumables.ProMead;
   import classes.items.consumables.PumpkinSeed;
   import classes.items.consumables.PurePearl;
   import classes.items.consumables.PurityPeach;
   import classes.items.consumables.PurityPhilter;
   import classes.items.consumables.PurpleEgg;
   import classes.items.consumables.PurpleFruit;
   import classes.items.consumables.RedRiverRoot;
   import classes.items.consumables.Reducto;
   import classes.items.consumables.RegularHummus;
   import classes.items.consumables.Reptilum;
   import classes.items.consumables.RhinoSteak;
   import classes.items.consumables.RingtailFig;
   import classes.items.consumables.RizzaRoot;
   import classes.items.consumables.SalamanderFirewater;
   import classes.items.consumables.SatyrWine;
   import classes.items.consumables.ScholarsTea;
   import classes.items.consumables.SensitivityDraft;
   import classes.items.consumables.SharkTooth;
   import classes.items.consumables.SheepMilk;
   import classes.items.consumables.ShriveledTentacle;
   import classes.items.consumables.SkinOil;
   import classes.items.consumables.SlimyCloth;
   import classes.items.consumables.SnakeOil;
   import classes.items.consumables.SpringWater;
   import classes.items.consumables.SuccubiMilk;
   import classes.items.consumables.SuccubisDelight;
   import classes.items.consumables.SuccubisDream;
   import classes.items.consumables.SuperHummus;
   import classes.items.consumables.SweetGossamer;
   import classes.items.consumables.TatteredScroll;
   import classes.items.consumables.Taurinum;
   import classes.items.consumables.TonOTrice;
   import classes.items.consumables.TrailMix;
   import classes.items.consumables.TrapOil;
   import classes.items.consumables.UnlabeledBrownMilkBottle;
   import classes.items.consumables.UrtaCum;
   import classes.items.consumables.VitalityTincture;
   import classes.items.consumables.WhiskerFruit;
   import classes.items.consumables.WhiteEgg;
   import classes.items.consumables.WhiteSpellBook;
   import classes.items.consumables.WingStick;
   import classes.items.consumables.WinterPudding;
   import classes.items.consumables.WolfPepper;
   import flash.Boot;
   
   public final class ConsumableLib
   {
      
      public static var DEFAULT_VALUE:Number = 6;
      
      public var foodItems:Array;
      
      public var YELLOOL:SkinOil;
      
      public var YELLODY:HairDye;
      
      public var YELGROL:SkinOil;
      
      public var W__BOOK:Consumable;
      
      public var W_STICK:WingStick;
      
      public var W_PDDNG:Consumable;
      
      public var W_FRUIT:Consumable;
      
      public var WOLF_PP:Consumable;
      
      public var WHITEOL:SkinOil;
      
      public var WHITEEG:Consumable;
      
      public var WHITEDY:HairDye;
      
      public var VIXVIGR:Consumable;
      
      public var VITAL_T:Consumable;
      
      public var URTACUM:Consumable;
      
      public var UBMBOTT:Consumable;
      
      public var TSTOOTH:Consumable;
      
      public var TSCROLL:Consumable;
      
      public var TRAPOIL:Consumable;
      
      public var TRAILMX:Consumable;
      
      public var TOTRICE:Consumable;
      
      public var TAURICO:Consumable;
      
      public var S_WATER:Consumable;
      
      public var S_GOSSR:Consumable;
      
      public var S_DREAM:Consumable;
      
      public var SUCMILK:Consumable;
      
      public var SPRGROL:SkinOil;
      
      public var SPHONEY:Consumable;
      
      public var SNAKOIL:Consumable;
      
      public var SMTH_LN:BodyLotion;
      
      public var SMART_T:Consumable;
      
      public var SMALL_EGGS:Array;
      
      public var SLIMYCL:Consumable;
      
      public var SILVROL:SkinOil;
      
      public var SHEEPMK:Consumable;
      
      public var SHARK_T:Consumable;
      
      public var SEXY_LN:BodyLotion;
      
      public var SENSDRF:Consumable;
      
      public var SDELITE:Consumable;
      
      public var SATYR_W:Consumable;
      
      public var SALAMFW:Consumable;
      
      public var RUSS_OL:SkinOil;
      
      public var RUSSDYE:HairDye;
      
      public var ROUGHLN:BodyLotion;
      
      public var RIZZART:Consumable;
      
      public var RINGFIG:Consumable;
      
      public var RHINOST:Consumable;
      
      public var REPTLUM:Consumable;
      
      public var RED__OL:SkinOil;
      
      public var RED_DYE:HairDye;
      
      public var REDUCTO:Consumable;
      
      public var RDRROOT:Consumable;
      
      public var RAINDYE:HairDye;
      
      public var P_WHSKY:PhoukaWhiskey;
      
      public var P_S_MLK:Consumable;
      
      public var P_SEED:PumpkinSeed;
      
      public var P_PEARL:Consumable;
      
      public var P_M_CUM:Consumable;
      
      public var P_LBOVA:Consumable;
      
      public var P_DRAFT:Consumable;
      
      public var PURPLOL:SkinOil;
      
      public var PURPLEG:Consumable;
      
      public var PURPEAC:Consumable;
      
      public var PURPDYE:HairDye;
      
      public var PURHONY:Consumable;
      
      public var PSDELIT:Consumable;
      
      public var PROMEAD:Consumable;
      
      public var PROBOVA:Consumable;
      
      public var PRNPKR:Consumable;
      
      public var PRFRUIT:Consumable;
      
      public var PPHILTR:Consumable;
      
      public var PINK_OL:SkinOil;
      
      public var PINKEGG:Consumable;
      
      public var PINKDYE:HairDye;
      
      public var PIGTRUF:Consumable;
      
      public var PEPPWHT:Consumable;
      
      public var OVI_MAX:OvipositionMax;
      
      public var OVIELIX:OvipositionElixir;
      
      public var ORANGOL:SkinOil;
      
      public var ORANGDY:HairDye;
      
      public var OLIVEOL:SkinOil;
      
      public var OCULUMA:Consumable;
      
      public var OCBLUOL:SkinOil;
      
      public var NUMBROX:Consumable;
      
      public var NUMBOIL:Consumable;
      
      public var NPNKEGG:NeonPinkEgg;
      
      public var M__MILK:Consumable;
      
      public var MYSTJWL:Consumable;
      
      public var MOUSECO:Consumable;
      
      public var MINOCUM:Consumable;
      
      public var MINOBLO:Consumable;
      
      public var MILKPTN:Consumable;
      
      public var MGHTYVG:Consumable;
      
      public var MAHOGOL:SkinOil;
      
      public var MAGSEED:Consumable;
      
      public var MAGENOL:SkinOil;
      
      public var L_WHTEG:Consumable;
      
      public var L_PRPEG:Consumable;
      
      public var L_PNKEG:Consumable;
      
      public var L_DRAFT:Consumable;
      
      public var L_BRNEG:Consumable;
      
      public var L_BLUEG:Consumable;
      
      public var L_BLKEG:Consumable;
      
      public var LUSTSTK:LustStick;
      
      public var LOLIPOP:LoliPop;
      
      public var LIGHTOL:SkinOil;
      
      public var LIDDELL:Consumable;
      
      public var LARGE_EGGS:Array;
      
      public var LARGEPP:Consumable;
      
      public var LACTAID:Consumable;
      
      public var LABOVA_:LaBova;
      
      public var KNOTTYP:Consumable;
      
      public var KITGIFT:KitsuneGift;
      
      public var KANGAFT:Consumable;
      
      public var IZYMILK:Consumable;
      
      public var INCUBID:Consumable;
      
      public var IMPFOOD:Consumable;
      
      public var ICICLE_:Consumable;
      
      public var H_PILL:Consumable;
      
      public var H_BISCU:Consumable;
      
      public var HUMMUS_:Consumable;
      
      public var HUMMUS2:Consumable;
      
      public var HRBCNT:Consumable;
      
      public var G__BOOK:Consumable;
      
      public var GROPLUS:Consumable;
      
      public var GREEN_D:HairDye;
      
      public var GREENOL:SkinOil;
      
      public var GRAYDYE:HairDye;
      
      public var GODMEAD:Consumable;
      
      public var GOB_ALE:Consumable;
      
      public var GNOLSPT:Consumable;
      
      public var GLDSEED:Consumable;
      
      public var GLDRIND:GoldenRind;
      
      public var F_DRAFT:Consumable;
      
      public var FR_BEER:Consumable;
      
      public var FRRTFRT:Consumable;
      
      public var FOXJEWL:Consumable;
      
      public var FOXBERY:Consumable;
      
      public var FISHFIL:Consumable;
      
      public var FAIR_OL:SkinOil;
      
      public var EXTSERM:HairExtensionSerum;
      
      public var EQUINUM:Consumable;
      
      public var EMBERBL:EmberTFs;
      
      public var ELVIOOL:SkinOil;
      
      public var ECTOPLS:Consumable;
      
      public var ECHIDCK:Consumable;
      
      public var EBONYOL:SkinOil;
      
      public var DRYTENT:Consumable;
      
      public var DRGNEGG:Consumable;
      
      public var DRAKHRT:EmberTFs;
      
      public var DPPNKOL:SkinOil;
      
      public var DEBIMBO:DeBimbo;
      
      public var DBLPEPP:Consumable;
      
      public var DARK_OL:SkinOil;
      
      public var C__MINT:Consumable;
      
      public var CYAN_OL:SkinOil;
      
      public var CUM_ITEM:Array;
      
      public var COAL___:Consumable;
      
      public var CLOVERS:Consumable;
      
      public var CLEARLN:BodyLotion;
      
      public var CERUL_P:Consumable;
      
      public var CCUPCAK:Consumable;
      
      public var CANINEP:Consumable;
      
      public var B__BOOK:Consumable;
      
      public var B_SHARD:BeautifulSwordShard;
      
      public var B_GOSSR:Consumable;
      
      public var BULBYPP:Consumable;
      
      public var BROWN_D:HairDye;
      
      public var BROWNEG:Consumable;
      
      public var BROBREW:Consumable;
      
      public var BOARTRU:Consumable;
      
      public var BLUE_OL:SkinOil;
      
      public var BLUEEGG:Consumable;
      
      public var BLUEDYE:HairDye;
      
      public var BLOND_D:HairDye;
      
      public var BLACK_D:HairDye;
      
      public var BLACKPP:Consumable;
      
      public var BLACKOL:SkinOil;
      
      public var BLACKEG:Consumable;
      
      public var BIMBOLQ:Consumable;
      
      public var BIMBOCH:BimboChampagne;
      
      public var BEONDEG:Consumable;
      
      public var BEEHONY:Consumable;
      
      public var BC_BEER:BlackCatBeer;
      
      public var AUBURND:HairDye;
      
      public var AMENT_:Consumable;
      
      public var AKBALSL:Consumable;
      
      public function ConsumableLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:CaninePepper = new CaninePepper(5);
         _loc1_._headerName = "Bulbous Canine Pepper";
         BULBYPP = _loc1_;
         var _loc2_:CaninePepper = new CaninePepper(4);
         _loc2_._headerName = "Knotty Canine Pepper";
         KNOTTYP = _loc2_;
         var _loc3_:CaninePepper = new CaninePepper(3);
         _loc3_._headerName = "Black Canine Pepper";
         BLACKPP = _loc3_;
         var _loc4_:CaninePepper = new CaninePepper(2);
         _loc4_._headerName = "Double Canine Pepper";
         DBLPEPP = _loc4_;
         var _loc5_:CaninePepper = new CaninePepper(1);
         _loc5_._headerName = "Large Canine Pepper";
         LARGEPP = _loc5_;
         var _loc6_:CaninePepper = new CaninePepper(0);
         _loc6_._headerName = "Canine Pepper";
         CANINEP = _loc6_;
         var _loc7_:BeeHoney = new BeeHoney(false,true);
         _loc7_._headerName = "Special Bee Honey";
         SPHONEY = _loc7_.addTags("Transformative","Fluid");
         var _loc8_:BeeHoney = new BeeHoney(true,false);
         _loc8_._headerName = "Pure Bee Honey";
         PURHONY = _loc8_.addTags("Transformative","Fluid");
         var _loc9_:BeeHoney = new BeeHoney(false,false);
         _loc9_._headerName = "Giant Bee Honey";
         BEEHONY = _loc9_.addTags("Transformative","Fluid");
         GNOLSPT = new GnollSpot();
         var _loc10_:UnlabeledBrownMilkBottle = new UnlabeledBrownMilkBottle();
         _loc10_._headerName = "Unlabeled Brown Milk Bottle";
         UBMBOTT = _loc10_.addTags("Transformative","Fluid");
         WOLF_PP = new WolfPepper();
         W_FRUIT = new WhiskerFruit();
         VIXVIGR = new FoxBerry(1).addTags("Transformative","Fluid");
         var _loc11_:SharkTooth = new SharkTooth(true);
         _loc11_._headerName = "Tigershark Tooth";
         TSTOOTH = _loc11_;
         var _loc12_:TatteredScroll = new TatteredScroll();
         _loc12_._headerName = "Tattered Scroll";
         TSCROLL = _loc12_;
         TRAPOIL = new TrapOil().addTags("Transformative","Fluid");
         TOTRICE = new TonOTrice().addTags("Transformative","Fluid");
         TAURICO = new Taurinum().addTags("Transformative","Fluid");
         SNAKOIL = new SnakeOil().addTags("Transformative","Fluid");
         SLIMYCL = new SlimyCloth();
         SHARK_T = new SharkTooth(false);
         SATYR_W = new SatyrWine().addTags("Transformative","Fluid");
         var _loc13_:SalamanderFirewater = new SalamanderFirewater();
         _loc13_._headerName = "Salamander Firewater";
         SALAMFW = _loc13_.addTags("Transformative","Fluid","Alcohol");
         var _loc14_:SweetGossamer = new SweetGossamer(0);
         _loc14_._headerName = "Sweet Gossamer";
         S_GOSSR = _loc14_;
         RIZZART = new RizzaRoot();
         RINGFIG = new RingtailFig();
         RHINOST = new RhinoSteak();
         REPTLUM = new Reptilum().addTags("Transformative","Fluid");
         RDRROOT = new RedRiverRoot();
         PROBOVA = new LaBova(1).addTags("Transformative","Fluid");
         PRFRUIT = new PurpleFruit();
         var _loc15_:PigTruffle = new PigTruffle(false);
         _loc15_._headerName = "Pigtail Truffle";
         PIGTRUF = _loc15_;
         var _loc16_:LaBova = new LaBova(2);
         _loc16_._headerName = "Purified LaBova";
         P_LBOVA = _loc16_.addTags("Transformative","Fluid");
         var _loc17_:OculumArachnae = new OculumArachnae();
         _loc17_._headerName = "Oculum Arachnae";
         OCULUMA = _loc17_;
         MYSTJWL = new FoxJewel(1);
         var _loc18_:MinotaurBlood = new MinotaurBlood();
         _loc18_._headerName = "Minotaur Blood";
         MINOBLO = _loc18_.addTags("Transformative","Fluid");
         MOUSECO = new MouseCocoa();
         var _loc19_:KangaFruit = new KangaFruit(1);
         _loc19_._headerName = "Mighty Veggie";
         MGHTYVG = _loc19_;
         var _loc20_:GoldenSeed = new GoldenSeed(1);
         _loc20_._headerName = "Magical Golden Seed";
         MAGSEED = _loc20_;
         LABOVA_ = new LaBova(0);
         KANGAFT = new KangaFruit(0);
         IMPFOOD = new ImpFood();
         HUMMUS_ = new RegularHummus();
         GOB_ALE = new GoblinAle().addTags("Transformative","Fluid","Alcohol");
         GLDSEED = new GoldenSeed(0);
         GLDRIND = new GoldenRind();
         FOXJEWL = new FoxJewel(0);
         FRRTFRT = new FerretFruit();
         FOXBERY = new FoxBerry(0);
         EQUINUM = new Equinum().addTags("Transformative","Fluid");
         EMBERBL = new EmberTFs();
         ECTOPLS = new Ectoplasm().addTags("Transformative","Fluid");
         ECHIDCK = new EchidnaCake();
         DRYTENT = new ShriveledTentacle();
         var _loc21_:EmberTFs = new EmberTFs(1);
         _loc21_._headerName = "Drake\'s Heart";
         DRAKHRT = _loc21_;
         BOARTRU = new PigTruffle(true);
         BEONDEG = new Beondegi().addTags("Transformative");
         AMENT_ = new Ament().addTags("Transformative");
         var _loc22_:SweetGossamer = new SweetGossamer(1);
         _loc22_._headerName = "Black Gossamer";
         B_GOSSR = _loc22_;
         var _loc23_:BeautifulSwordShard = new BeautifulSwordShard();
         _loc23_._headerName = "Beautiful Sword Shard";
         B_SHARD = _loc23_;
         W_STICK = new WingStick();
         var _loc24_:VitalityTincture = new VitalityTincture();
         _loc24_._headerName = "Vitality Tincture";
         VITAL_T = _loc24_.addTags("Fluid");
         var _loc25_:ScholarsTea = new ScholarsTea();
         _loc25_._headerName = "Scholar\'s Tea";
         SMART_T = _loc25_.addTags("Fluid");
         var _loc26_:SensitivityDraft = new SensitivityDraft();
         _loc26_._headerName = "Sensitivity Draft";
         SENSDRF = _loc26_.addTags("Fluid");
         var _loc27_:PrincessPucker = new PrincessPucker();
         _loc27_._headerName = "Princess Pucker";
         PRNPKR = _loc27_.addTags("Fluid");
         var _loc28_:PurityPhilter = new PurityPhilter();
         _loc28_._headerName = "Purity Philter";
         PPHILTR = _loc28_.addTags("Fluid");
         var _loc29_:PeppermintWhite = new PeppermintWhite();
         _loc29_._headerName = "Peppermint White";
         PEPPWHT = _loc29_.addTags("Fluid");
         OVI_MAX = new OvipositionMax();
         OVIELIX = new OvipositionElixir();
         NUMBROX = new NumbRocks();
         NUMBOIL = new NumbingOil();
         MILKPTN = new MilkPotion().addTags("Fluid");
         LUSTSTK = new LustStick();
         LACTAID = new Lactaid().addTags("Fluid");
         L_DRAFT = new LustDraft(0).addTags("Fluid");
         KITGIFT = new KitsuneGift();
         ICICLE_ = new IceShard();
         HRBCNT = new HerbalContraceptive();
         H_PILL = new HealPill();
         F_DRAFT = new LustDraft(1).addTags("Fluid");
         var _loc30_:HairExtensionSerum = new HairExtensionSerum();
         _loc30_._headerName = "Hair Extension Serum";
         EXTSERM = _loc30_;
         DEBIMBO = new DeBimbo();
         COAL___ = new Coal();
         CLOVERS = new Clovis().addTags("Transformative","Fluid");
         var _loc31_:CeruleanPotion = new CeruleanPotion();
         _loc31_._headerName = "Cerulean Potion";
         CERUL_P = _loc31_.addTags("Fluid");
         C__MINT = new Mint();
         var _loc32_:AkbalSaliva = new AkbalSaliva();
         _loc32_._headerName = "Akbal\'s Saliva";
         AKBALSL = _loc32_.addTags("Fluid");
         P_PEARL = new PurePearl().addTags("Rare");
         LIDDELL = new Liddellium().addTags("Special","Fluid");
         LOLIPOP = new LoliPop();
         HUMMUS2 = new SuperHummus();
         BROBREW = new BroBrew().addTags("Special","Fluid","Alcohol","Rare");
         var _loc33_:BimboLiqueur = new BimboLiqueur();
         _loc33_._headerName = "Bimbo Liqueur";
         BIMBOLQ = _loc33_.addTags("Special","Fluid","Alcohol","Rare");
         G__BOOK = new GraySpellBook().addTags("Book");
         W__BOOK = new WhiteSpellBook().addTags("Book");
         B__BOOK = new BlackSpellBook().addTags("Book");
         GROPLUS = new GroPlus();
         REDUCTO = new Reducto();
         var _loc34_:WinterPudding = new WinterPudding();
         _loc34_._headerName = "Winter Pudding";
         W_PDDNG = _loc34_;
         URTACUM = new UrtaCum().addTags("Fluid");
         TRAILMX = new TrailMix();
         S_WATER = new SpringWater().addTags("Fluid");
         SHEEPMK = new SheepMilk().addTags("Fluid");
         PURPEAC = new PurityPeach();
         var _loc35_:ProMead = new ProMead();
         _loc35_._headerName = "Premium Mead";
         PROMEAD = _loc35_.addTags("Fluid","Alcohol");
         var _loc36_:PumpkinSeed = new PumpkinSeed();
         _loc36_._headerName = "Pumpkin Seed";
         P_SEED = _loc36_;
         P_WHSKY = new PhoukaWhiskey();
         var _loc37_:MinotaurCum = new MinotaurCum(1);
         _loc37_._headerName = "Purified Minotaur Cum";
         P_M_CUM = _loc37_.addTags("Fluid");
         var _loc38_:MinotaurCum = new MinotaurCum(0);
         _loc38_._headerName = "Minotaur Cum";
         MINOCUM = _loc38_.addTags("Fluid");
         var _loc39_:MarbleMilk = new MarbleMilk();
         _loc39_._headerName = "Marble\'s Milk";
         M__MILK = _loc39_.addTags("Fluid");
         var _loc40_:IsabellaMilk = new IsabellaMilk();
         _loc40_._headerName = "Isabella\'s Milk";
         IZYMILK = _loc40_.addTags("Fluid");
         H_BISCU = new HardBiscuits();
         GODMEAD = new GodMead().addTags("Fluid","Alcohol");
         FR_BEER = new FrothyBeer().addTags("Fluid","Alcohol");
         FISHFIL = new FishFillet();
         var _loc41_:GiantChocolateCupcake = new GiantChocolateCupcake();
         _loc41_._headerName = "Chocolate Cupcake";
         CCUPCAK = _loc41_;
         var _loc42_:BimboChampagne = new BimboChampagne();
         _loc42_._headerName = "Bimbo Champagne";
         BIMBOCH = _loc42_;
         var _loc43_:BlackCatBeer = new BlackCatBeer();
         _loc43_._headerName = "Black Cat Beer";
         BC_BEER = _loc43_;
         var _loc44_:NeonPinkEgg = new NeonPinkEgg();
         _loc44_._headerName = "Neon-Pink Egg";
         NPNKEGG = _loc44_;
         DRGNEGG = new EmberEgg().addTags("Egg");
         var _loc45_:WhiteEgg = new WhiteEgg(1);
         _loc45_._headerName = "Large White Egg";
         L_WHTEG = _loc45_.addTags("Egg");
         var _loc46_:PurpleEgg = new PurpleEgg(1);
         _loc46_._headerName = "Large Purple Egg";
         L_PRPEG = _loc46_.addTags("Egg");
         var _loc47_:PinkEgg = new PinkEgg(1);
         _loc47_._headerName = "Large Pink Egg";
         L_PNKEG = _loc47_.addTags("Egg");
         var _loc48_:BrownEgg = new BrownEgg(1);
         _loc48_._headerName = "Large Brown Egg";
         L_BRNEG = _loc48_.addTags("Egg");
         var _loc49_:BlueEgg = new BlueEgg(1);
         _loc49_._headerName = "Large Blue Egg";
         L_BLUEG = _loc49_.addTags("Egg");
         var _loc50_:BlackRubberEgg = new BlackRubberEgg(1);
         _loc50_._headerName = "Large Black Egg";
         L_BLKEG = _loc50_.addTags("Egg");
         WHITEEG = new WhiteEgg(0).addTags("Egg");
         PURPLEG = new PurpleEgg(0).addTags("Egg");
         PINKEGG = new PinkEgg(0).addTags("Egg");
         BROWNEG = new BrownEgg(0).addTags("Egg");
         BLUEEGG = new BlueEgg(0).addTags("Egg");
         BLACKEG = new BlackRubberEgg(0).addTags("Egg");
         SMTH_LN = new BodyLotion("SmthLtn","Smooth","光滑、浓稠的乳状液体");
         SEXY_LN = new BodyLotion("SexyLtn","Sexy","漂亮的乳状物质");
         ROUGHLN = new BodyLotion("RoughLn","Rough","浓稠、带有磨砂感的乳霜");
         CLEARLN = new BodyLotion("ClearLn","Clear","光滑、浓稠的乳状液体");
         var _loc51_:SkinOil = new SkinOil("PinkOil","Pink");
         _loc51_._headerName = "粉色护肤油";
         PINK_OL = _loc51_;
         var _loc52_:SkinOil = new SkinOil("DPnkOil","Deep Pink");
         _loc52_._headerName = "深粉护肤油";
         DPPNKOL = _loc52_;
         var _loc53_:SkinOil = new SkinOil("MagenOl","Magenta");
         _loc53_._headerName = "品红护肤油";
         MAGENOL = _loc53_;
         var _loc54_:SkinOil = new SkinOil("EVioOil","Electric Violet");
         _loc54_._headerName = "电光紫护肤油";
         ELVIOOL = _loc54_;
         var _loc55_:SkinOil = new SkinOil("OBluOil","Ocean Blue");
         _loc55_._headerName = "海蓝色护肤油";
         OCBLUOL = _loc55_;
         var _loc56_:SkinOil = new SkinOil("CyanOil","Cyan");
         _loc56_._headerName = "青色护肤油";
         CYAN_OL = _loc56_;
         var _loc57_:SkinOil = new SkinOil("SpGrOil","Spring Green");
         _loc57_._headerName = "春绿色护肤油";
         SPRGROL = _loc57_;
         var _loc58_:SkinOil = new SkinOil("YlGrOil","Yellow Green");
         _loc58_._headerName = "黄绿色护肤油";
         YELGROL = _loc58_;
         var _loc59_:SkinOil = new SkinOil("SlvrOil","Silver");
         _loc59_._headerName = "银色护肤油";
         SILVROL = _loc59_;
         var _loc60_:SkinOil = new SkinOil("PurpOil","Purple");
         _loc60_._headerName = "紫色护肤油";
         PURPLOL = _loc60_;
         var _loc61_:SkinOil = new SkinOil("BlakOil","Black");
         _loc61_._headerName = "黑色护肤油";
         BLACKOL = _loc61_;
         var _loc62_:SkinOil = new SkinOil("BlueOil","Blue");
         _loc62_._headerName = "蓝色护肤油";
         BLUE_OL = _loc62_;
         var _loc63_:SkinOil = new SkinOil("WhitOil","White");
         _loc63_._headerName = "白色护肤油";
         WHITEOL = _loc63_;
         var _loc64_:SkinOil = new SkinOil("GrenOil","Green");
         _loc64_._headerName = "绿色护肤油";
         GREENOL = _loc64_;
         var _loc65_:SkinOil = new SkinOil("YeloOil","Yellow");
         _loc65_._headerName = "黄色护肤油";
         YELLOOL = _loc65_;
         var _loc66_:SkinOil = new SkinOil("OranOil","Orange");
         _loc66_._headerName = "橙色护肤油";
         ORANGOL = _loc66_;
         var _loc67_:SkinOil = new SkinOil("Red Oil","Red");
         _loc67_._headerName = "红色护肤油";
         RED__OL = _loc67_;
         var _loc68_:SkinOil = new SkinOil("RussOil","Russet");
         _loc68_._headerName = "赤棕色护肤油";
         RUSS_OL = _loc68_;
         var _loc69_:SkinOil = new SkinOil("OliveOl","Olive");
         _loc69_._headerName = "橄榄色护肤油";
         OLIVEOL = _loc69_;
         var _loc70_:SkinOil = new SkinOil("MahogOl","Mahogany");
         _loc70_._headerName = "红木色护肤油";
         MAHOGOL = _loc70_;
         var _loc71_:SkinOil = new SkinOil("LightOl","Light");
         _loc71_._headerName = "浅色护肤油";
         LIGHTOL = _loc71_;
         var _loc72_:SkinOil = new SkinOil("FairOil","Fair");
         _loc72_._headerName = "白皙护肤油";
         FAIR_OL = _loc72_;
         var _loc73_:SkinOil = new SkinOil("EbonyOl","Ebony");
         _loc73_._headerName = "乌木色染发剂";
         EBONYOL = _loc73_;
         var _loc74_:SkinOil = new SkinOil("DarkOil","Dark");
         _loc74_._headerName = "黑色染发剂";
         DARK_OL = _loc74_;
         var _loc75_:HairDye = new HairDye("WhiteDy","White");
         _loc75_._headerName = "白色染发剂";
         WHITEDY = _loc75_;
         var _loc76_:HairDye = new HairDye("YelloDy","Yellow");
         _loc76_._headerName = "黄色染发剂";
         YELLODY = _loc76_;
         var _loc77_:HairDye = new HairDye("RussetD","Russet");
         _loc77_._headerName = "赤棕色染发剂";
         RUSSDYE = _loc77_;
         var _loc78_:HairDye = new HairDye("Red Dye","Red");
         _loc78_._headerName = "红色染发剂";
         RED_DYE = _loc78_;
         var _loc79_:HairDye = new HairDye("RainDye","Rainbow");
         _loc79_._headerName = "彩色染发剂";
         RAINDYE = _loc79_;
         var _loc80_:HairDye = new HairDye("PurpDye","Purple");
         _loc80_._headerName = "紫色染发剂";
         PURPDYE = _loc80_;
         var _loc81_:HairDye = new HairDye("PinkDye","Pink");
         _loc81_._headerName = "粉色染发剂";
         PINKDYE = _loc81_;
         var _loc82_:HairDye = new HairDye("OrangDy","Orange");
         _loc82_._headerName = "橙色染发剂";
         ORANGDY = _loc82_;
         var _loc83_:HairDye = new HairDye("Green D","Green");
         _loc83_._headerName = "绿色染发剂";
         GREEN_D = _loc83_;
         var _loc84_:HairDye = new HairDye("GrayDye","Gray");
         _loc84_._headerName = "灰色染发剂";
         GRAYDYE = _loc84_;
         var _loc85_:HairDye = new HairDye("Brown D","Brown");
         _loc85_._headerName = "棕色染发剂";
         BROWN_D = _loc85_;
         var _loc86_:HairDye = new HairDye("BlueDye","Blue");
         _loc86_._headerName = "蓝色染发剂";
         BLUEDYE = _loc86_;
         var _loc87_:HairDye = new HairDye("Blond D","Blond");
         _loc87_._headerName = "金色染发剂";
         BLOND_D = _loc87_;
         var _loc88_:HairDye = new HairDye("Black D","Black");
         _loc88_._headerName = "黑色染发剂";
         BLACK_D = _loc88_;
         var _loc89_:HairDye = new HairDye("AuburnD","Auburn");
         _loc89_._headerName = "赤褐色染发剂";
         AUBURND = _loc89_;
         var _loc90_:SuccubisDelight = new SuccubisDelight(1);
         _loc90_._headerName = "Purified Succubi\'s Delight";
         PSDELIT = _loc90_.addTags("Fluid");
         var _loc91_:SuccubiMilk = new SuccubiMilk(1);
         _loc91_._headerName = "Purified Succubi Milk";
         P_S_MLK = _loc91_.addTags("Fluid");
         var _loc92_:IncubiDraft = new IncubiDraft(1);
         _loc92_._headerName = "Purified Incubus Draft";
         P_DRAFT = _loc92_.addTags("Fluid");
         SUCMILK = new SuccubiMilk(0).addTags("Transformative","Fluid");
         var _loc93_:SuccubisDelight = new SuccubisDelight(0);
         _loc93_._headerName = "Succubi\'s Delight";
         SDELITE = _loc93_.addTags("Fluid");
         var _loc94_:SuccubisDream = new SuccubisDream();
         _loc94_._headerName = "Succubi\'s Dream";
         S_DREAM = _loc94_.addTags("Transformative","Fluid");
         INCUBID = new IncubiDraft(0).addTags("Transformative","Fluid");
         LARGE_EGGS = [L_BLKEG,L_BLUEG,L_BRNEG,L_PNKEG,L_PRPEG,L_WHTEG];
         SMALL_EGGS = [BLACKEG,BLUEEGG,BROWNEG,PINKEGG,PURPLEG,WHITEEG];
         CUM_ITEM = [MINOCUM,URTACUM];
         foodItems = [BC_BEER,CCUPCAK,FISHFIL,FR_BEER,GODMEAD,H_BISCU,IZYMILK,M__MILK,P_WHSKY,PROMEAD,PURPEAC,SHEEPMK,S_WATER,TRAILMX,W_PDDNG,BEEHONY,BLACKPP,BOARTRU,BULBYPP,CANINEP,DBLPEPP,FOXBERY,FRRTFRT,GOB_ALE,HUMMUS_,IMPFOOD,KANGAFT,KNOTTYP,MOUSECO,PIGTRUF,PRFRUIT,PURHONY,SALAMFW,SATYR_W,W_FRUIT,WOLF_PP,L_BLKEG,L_BLUEG,L_BRNEG,L_PNKEG,L_PRPEG,L_WHTEG,BLACKEG,BLUEEGG,BROWNEG,PINKEGG,PURPLEG,WHITEEG,P_SEED];
      }
   }
}

