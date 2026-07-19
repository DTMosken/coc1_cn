package
{
   import classes.Appearance;
   import classes.BonusDerivedStats;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.Contribution;
   import classes.ContributionType;
   import classes.Credit;
   import classes.CreditSection;
   import classes.Credits;
   import classes.DebugMenu;
   import classes.DisclaimerBG;
   import classes.GameLogo;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.MainMenu;
   import classes.MasteryLib;
   import classes.MasteryType;
   import classes.Measurements;
   import classes.Output;
   import classes.PerkLib;
   import classes.PerkType;
   import classes.Player;
   import classes.SettingsGlobalDisplay;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._BonusDerivedStats.BonusStat_Impl_;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.BindingPane;
   import classes.display.GameViewData;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Profiling;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.JewelryLib;
   import classes.items.Mutations;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponEffects;
   import classes.items.WeaponLib;
   import classes.items.armors.Nothing;
   import classes.items.jewelries.Nothing;
   import classes.items.shields.Nothing;
   import classes.items.undergarments.Nothing;
   import classes.items.weapons.IceWeapon;
   import classes.items.weapons.unarmed.Fists;
   import classes.items.weapons.unarmed.UnarmedClaws;
   import classes.lists.FlagLists;
   import classes.lists.PerkLists;
   import classes.masteries.BowMastery;
   import classes.masteries.CastingMastery;
   import classes.masteries.ClawMastery;
   import classes.masteries.FistMastery;
   import classes.masteries.ShieldMastery;
   import classes.masteries.TerrestrialFireMastery;
   import classes.masteries.WeaponMastery;
   import classes.parser.ConditionalConverters;
   import classes.parser.DoubleArgLookups;
   import classes.parser.Parser;
   import classes.parser.SingleArgLookups;
   import classes.perks.AscensionDesiresPerk;
   import classes.perks.AscensionEndurancePerk;
   import classes.perks.AscensionFertilityPerk;
   import classes.perks.AscensionFortunePerk;
   import classes.perks.AscensionMartialityPerk;
   import classes.perks.AscensionMoralShifterPerk;
   import classes.perks.AscensionMysticalityPerk;
   import classes.perks.AscensionSeductionPerk;
   import classes.perks.AscensionTolerancePerk;
   import classes.perks.AscensionVirilityPerk;
   import classes.perks.AscensionWisdomPerk;
   import classes.perks.BlademasterPerk;
   import classes.perks.CleansingPalmPerk;
   import classes.perks.ControlledBreathPerk;
   import classes.perks.CunningPerk;
   import classes.perks.DemonBiologyBerk;
   import classes.perks.ElvenBountyPerk;
   import classes.perks.EnlightenedPerk;
   import classes.perks.EvadePerk;
   import classes.perks.FrustrationPerk;
   import classes.perks.GiftFast;
   import classes.perks.GiftFrigid;
   import classes.perks.GiftLusty;
   import classes.perks.GiftPervert;
   import classes.perks.GiftSensitive;
   import classes.perks.GiftSmart;
   import classes.perks.GiftStrong;
   import classes.perks.GiftTough;
   import classes.perks.HeavyImpactPerk;
   import classes.perks.HistoryAlchemistPerk;
   import classes.perks.HistoryDEUSVULTPerk;
   import classes.perks.HistoryFighterPerk;
   import classes.perks.HistoryFortunePerk;
   import classes.perks.HistoryHealerPerk;
   import classes.perks.HistoryReligiousPerk;
   import classes.perks.HistoryScholarPerk;
   import classes.perks.HistorySlackerPerk;
   import classes.perks.HistorySlutPerk;
   import classes.perks.HistorySmithPerk;
   import classes.perks.HistoryThiefPerk;
   import classes.perks.HistoryWhorePerk;
   import classes.perks.HoldWithBothHandsPerk;
   import classes.perks.IronFists2Perk;
   import classes.perks.IronFists3Perk;
   import classes.perks.IronFistsPerk;
   import classes.perks.KillerInstinctPerk;
   import classes.perks.LightningStrikesPerk;
   import classes.perks.MilkMaidPerk;
   import classes.perks.MisdirectionPerk;
   import classes.perks.NaturalWeaponsPerk;
   import classes.perks.PatiencePerk;
   import classes.perks.PentUpPerk;
   import classes.perks.PiercedCrimstonePerk;
   import classes.perks.PiercedFertitePerk;
   import classes.perks.PiercedIcestonePerk;
   import classes.perks.Regeneration2Perk;
   import classes.perks.RegenerationPerk;
   import classes.perks.RiddleSightPerk;
   import classes.perks.ScatteringPerk;
   import classes.perks.SluttySeductionPerk;
   import classes.perks.SpellcastingAffinityPerk;
   import classes.perks.SpellswordPerk;
   import classes.perks.TacticianPerk;
   import classes.perks.ThunderousStrikesPerk;
   import classes.perks.UnhinderedPerk;
   import classes.perks.VineArmorPerk;
   import classes.perks.WizardsEndurancePerk;
   import classes.perks.WizardsFocusPerk;
   import classes.saves.SelfSaver;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.dungeons.DungeonAbstractContent;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import classes.scenes.npcs.ArianScene;
   import classes.scenes.npcs.EmberScene;
   import classes.scenes.places.bazaar.Benoit;
   import classes.scenes.places.farm.FarmCorruption;
   import classes.scenes.places.telAdre.Rubi;
   import classes.scenes.seasonal.Nieve;
   import classes.statusEffects.CombatStatusEffect;
   import classes.statusEffects.Exhaustion;
   import classes.statusEffects.IzumiPipeSmoke;
   import classes.statusEffects.KitsuneVision;
   import classes.statusEffects.MermaidWateredBuff;
   import classes.statusEffects.MermaidWateredDebuff;
   import classes.statusEffects.TellyVisedStatus;
   import classes.statusEffects.TranquilBlessing;
   import classes.statusEffects.combat.AkbalSpeedDebuff;
   import classes.statusEffects.combat.AmilyVenomDebuff;
   import classes.statusEffects.combat.AnemoneVenomDebuff;
   import classes.statusEffects.combat.AngeredPugilist;
   import classes.statusEffects.combat.AttractedDebuff;
   import classes.statusEffects.combat.BackstabBuff;
   import classes.statusEffects.combat.BasiliskSlowDebuff;
   import classes.statusEffects.combat.BerserkBuff;
   import classes.statusEffects.combat.BrawlerStanceBuff;
   import classes.statusEffects.combat.BrutalBlowsDebuff;
   import classes.statusEffects.combat.CalledShotDebuff;
   import classes.statusEffects.combat.ChantedDebuff;
   import classes.statusEffects.combat.ChargeWeaponBuff;
   import classes.statusEffects.combat.CirceScimitarBuff;
   import classes.statusEffects.combat.ClawStanceBuff;
   import classes.statusEffects.combat.CombatBonusStatBuff;
   import classes.statusEffects.combat.CombatInteBuff;
   import classes.statusEffects.combat.CombatSpeBuff;
   import classes.statusEffects.combat.CombatStrBuff;
   import classes.statusEffects.combat.CombatTouBuff;
   import classes.statusEffects.combat.ConstrictedDebuff;
   import classes.statusEffects.combat.CounterABStatus;
   import classes.statusEffects.combat.DazedDebuff;
   import classes.statusEffects.combat.DeafeningBuzz;
   import classes.statusEffects.combat.DivineWindBuff;
   import classes.statusEffects.combat.DodgedAttackBuff;
   import classes.statusEffects.combat.DriderIncubusVenomDebuff;
   import classes.statusEffects.combat.FrogPoisonDebuff;
   import classes.statusEffects.combat.FrostbiteDebuff;
   import classes.statusEffects.combat.GardenerSapSpeedDebuff;
   import classes.statusEffects.combat.GiantStrLossDebuff;
   import classes.statusEffects.combat.GnollSpearDebuff;
   import classes.statusEffects.combat.GroundPoundDebuff;
   import classes.statusEffects.combat.Immobilized;
   import classes.statusEffects.combat.LeechBuff;
   import classes.statusEffects.combat.LizanBlowpipeDebuff;
   import classes.statusEffects.combat.LurkBuff;
   import classes.statusEffects.combat.LustserkBuff;
   import classes.statusEffects.combat.MonkStanceBuff;
   import classes.statusEffects.combat.MothPheromones;
   import classes.statusEffects.combat.NagaBiteDebuff;
   import classes.statusEffects.combat.NagaVenomDebuff;
   import classes.statusEffects.combat.NephilaSlowDebuff;
   import classes.statusEffects.combat.OnFireDebuff;
   import classes.statusEffects.combat.ParalyzeVenomDebuff;
   import classes.statusEffects.combat.PermaFly;
   import classes.statusEffects.combat.RetributionBuff;
   import classes.statusEffects.combat.ScorpionBlind;
   import classes.statusEffects.combat.ScorpionVenom;
   import classes.statusEffects.combat.SeverTendonsDebuff;
   import classes.statusEffects.combat.StimulatingAuraDebuff;
   import classes.statusEffects.combat.TFGeodeKnuckleBuff;
   import classes.statusEffects.combat.TFInflameBuff;
   import classes.statusEffects.combat.TFQuakeBuff;
   import classes.statusEffects.combat.TFScorchBuff;
   import classes.statusEffects.combat.TFShellBuff;
   import classes.statusEffects.combat.TFTerraCoreBuff;
   import classes.statusEffects.combat.TargetMarked;
   import classes.statusEffects.combat.TerraStarBuff;
   import classes.statusEffects.combat.TerraStarCooldown;
   import classes.statusEffects.combat.TerraStarDebuff;
   import classes.statusEffects.combat.Tripped;
   import classes.statusEffects.combat.TrueParryBuff;
   import classes.statusEffects.combat.VineTangled;
   import classes.statusEffects.combat.WebDebuff;
   import classes.statusEffects.combat.WhisperedDebuff;
   import classes.statusEffects.combat.WitheringDebuff;
   import coc.script.Eval;
   import coc.view.ArrowDown;
   import coc.view.ArrowUp;
   import coc.view.Background;
   import coc.view.Background1;
   import coc.view.Background2;
   import coc.view.Background3;
   import coc.view.Background4;
   import coc.view.BackgroundPlayer;
   import coc.view.ButtonBackground0;
   import coc.view.ButtonBackground1;
   import coc.view.ButtonBackground2;
   import coc.view.ButtonBackground3;
   import coc.view.ButtonBackground4;
   import coc.view.ButtonBackground5;
   import coc.view.ButtonBackground6;
   import coc.view.ButtonBackground7;
   import coc.view.ButtonBackground8;
   import coc.view.ButtonBackground9;
   import coc.view.Connect;
   import coc.view.Connecth;
   import coc.view.DragButton;
   import coc.view.EastButton;
   import coc.view.InitIcon;
   import coc.view.LockedDoor;
   import coc.view.LockedDoorV;
   import coc.view.MainView;
   import coc.view.MediumButton0;
   import coc.view.MediumButton1;
   import coc.view.MediumButton2;
   import coc.view.MinimapBG;
   import coc.view.NorthButton;
   import coc.view.Npc;
   import coc.view.SidebarBg1;
   import coc.view.SidebarBg3;
   import coc.view.SidebarBg4;
   import coc.view.SidebarEnemy;
   import coc.view.SouthButton;
   import coc.view.StairsDown;
   import coc.view.StairsUp;
   import coc.view.StairsUpDown;
   import coc.view.StatBar;
   import coc.view.StatBarOptions;
   import coc.view.StatsBarBottom;
   import coc.view.Theme;
   import coc.view.TooltipBg;
   import coc.view.Trader;
   import coc.view.TransitionIcon;
   import coc.view.Warning;
   import coc.view.WestButton;
   import coc.view.mobile.BarDefinition;
   import coc.view.mobile.MobileUI;
   import coc.view.mobile.StatsView;
   import coc.view.selfDebug.DebugComp;
   import coc.view.themeAssets.ButtonBackground0;
   import coc.view.themeAssets.ButtonBackground1;
   import coc.view.themeAssets.ButtonBackground2;
   import coc.view.themeAssets.ButtonBackground3;
   import coc.view.themeAssets.ButtonBackground4;
   import coc.view.themeAssets.ButtonBackground5;
   import coc.view.themeAssets.ButtonBackground6;
   import coc.view.themeAssets.ButtonBackground7;
   import coc.view.themeAssets.ButtonBackground8;
   import coc.view.themeAssets.ButtonBackground9;
   import coc.view.themeAssets.DisclaimerBg;
   import coc.view.themeAssets.EastButton;
   import coc.view.themeAssets.MainBg;
   import coc.view.themeAssets.MediumButton0;
   import coc.view.themeAssets.MediumButton1;
   import coc.view.themeAssets.MediumButton2;
   import coc.view.themeAssets.MinimapBg;
   import coc.view.themeAssets.MmBackground;
   import coc.view.themeAssets.MmBackgroundPlayer;
   import coc.view.themeAssets.MmDown;
   import coc.view.themeAssets.MmExit;
   import coc.view.themeAssets.MmNPC;
   import coc.view.themeAssets.MmTransition;
   import coc.view.themeAssets.MmUp;
   import coc.view.themeAssets.MmUpDown;
   import coc.view.themeAssets.MonsterBg;
   import coc.view.themeAssets.NorthButton;
   import coc.view.themeAssets.SidebarBg;
   import coc.view.themeAssets.SouthButton;
   import coc.view.themeAssets.StatbarBottomBg;
   import coc.view.themeAssets.Stone;
   import coc.view.themeAssets.TextBgCombatImage;
   import coc.view.themeAssets.TextBgImage;
   import coc.view.themeAssets.TooltipBg;
   import coc.view.themeAssets.WarningImage;
   import coc.view.themeAssets.WestButton;
   import com.bit101.components.SearchBar;
   import flash.Boot;
   import flash.Lib;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display._CapsStyle.CapsStyle_Impl_;
   import flash.display._GradientType.GradientType_Impl_;
   import flash.display._InterpolationMethod.InterpolationMethod_Impl_;
   import flash.display._JointStyle.JointStyle_Impl_;
   import flash.display._LineScaleMode.LineScaleMode_Impl_;
   import flash.display._SpreadMethod.SpreadMethod_Impl_;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.ui._KeyLocation.KeyLocation_Impl_;
   import flash.ui._MouseCursor.MouseCursor_Impl_;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils._Endian.Endian_Impl_;
   import haxe.IMap;
   import haxe.Unserializer;
   import haxe._Unserializer.DefaultResolver;
   import haxe.crypto.Base64;
   import haxe.ds.Either;
   import haxe.ds.IntMap;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import haxe.io.FPHelper;
   import haxe.xml.Parser;
   import lime._internal.format.Base64;
   import lime.app._Event_Void_Void;
   import lime.app._Event_lime_ui_Gamepad_Void;
   import lime.app._Event_lime_ui_Joystick_Void;
   import lime.app._Event_lime_ui_Touch_Void;
   import lime.graphics._WebGL2RenderContext.WebGL2RenderContext_Impl_;
   import lime.system.System;
   import lime.ui.Gamepad;
   import lime.ui.Joystick;
   import lime.ui.Touch;
   import lime.ui._GamepadAxis.GamepadAxis_Impl_;
   import lime.ui._GamepadButton.GamepadButton_Impl_;
   import lime.ui._JoystickHatPosition.JoystickHatPosition_Impl_;
   import lime.ui._KeyCode.KeyCode_Impl_;
   import lime.ui._KeyModifier.KeyModifier_Impl_;
   import lime.ui._ScanCode.ScanCode_Impl_;
   import lime.utils.AssetCache;
   import lime.utils.Assets;
   import lime.utils.BytePointerData;
   import lime.utils._LogLevel.LogLevel_Impl_;
   import motion.Actuate;
   import motion.actuators.SimpleActuator;
   import motion.easing.Elastic;
   import motion.easing.Expo;
   import motion.easing.IEasing;
   import motion.easing._Elastic.ElasticEaseIn;
   import motion.easing._Elastic.ElasticEaseInOut;
   import motion.easing._Elastic.ElasticEaseOut;
   import motion.easing._Expo.ExpoEaseIn;
   import motion.easing._Expo.ExpoEaseInOut;
   import motion.easing._Expo.ExpoEaseOut;
   import openfl.Lib;
   import openfl.display._internal.FlashGraphics;
   import openfl.utils.AssetCache;
   import openfl.utils.Assets;
   import openfl.utils.IAssetCache;
   import openfl.utils._ByteArray.ByteArray_Impl_;
   import openfl.utils._Dictionary.Dictionary_Impl_;
   import openfl.utils._internal.Lib;
   
   public class boot_8576 extends Boot
   {
      
      public function boot_8576()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         if(flash.Lib.current == null)
         {
            flash.Lib.current = this;
         }
         start();
      }
      
      override public function init() : void
      {
         var fun15:Function;
         var fun14:Function;
         var fun13:Function;
         var fun12:Function;
         var fun11:Function;
         var fun10:Function;
         var fun9:Function;
         var fun8:Function;
         var fun7:Function;
         var fun6:Function;
         var fun5:Function;
         var fun4:Function;
         var fun3:Function;
         var fun2:Function;
         var fun1:Function;
         var fun:Function;
         var _loc1_:* = null as IMap;
         var _loc2_:* = null as Function;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as String;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:* = null as Credit;
         var _loc10_:* = null as Credit;
         var _loc11_:* = null as Credit;
         var _loc12_:* = null as Array;
         var _loc13_:* = null as String;
         var _loc14_:* = null as Credit;
         var _loc15_:* = null as Array;
         var _loc16_:* = null as String;
         var _loc17_:* = null as Credit;
         var _loc18_:* = null as Credit;
         var _loc19_:* = null as Credit;
         var _loc20_:* = null as Credit;
         var _loc21_:* = null as Array;
         var _loc22_:* = null as String;
         var _loc23_:* = null as Array;
         var _loc24_:* = null as String;
         var _loc25_:* = null as Credit;
         var _loc26_:* = null as Array;
         var _loc27_:* = null as String;
         var _loc28_:* = null as Array;
         var _loc29_:* = null as String;
         var _loc30_:* = null as Array;
         var _loc31_:* = null as String;
         var _loc32_:* = null as Array;
         var _loc33_:* = null as String;
         var _loc34_:* = null as Array;
         var _loc35_:* = null as String;
         var _loc36_:* = null as Array;
         var _loc37_:* = null as String;
         var _loc38_:* = null as Credit;
         var _loc39_:* = null as Credit;
         var _loc40_:* = null as Array;
         var _loc41_:* = null as String;
         var _loc42_:* = null as Credit;
         var _loc43_:* = null as Credit;
         var _loc44_:* = null as Array;
         var _loc45_:* = null as String;
         var _loc46_:* = null as Array;
         var _loc47_:* = null as String;
         var _loc48_:* = null as Array;
         var _loc49_:* = null as String;
         var _loc50_:* = null as Array;
         var _loc51_:* = null as String;
         var _loc52_:* = null as Array;
         var _loc53_:* = null as String;
         var _loc54_:* = null as Array;
         var _loc55_:* = null as String;
         var _loc56_:* = null as Array;
         var _loc57_:* = null as String;
         var _loc58_:* = null as Array;
         var _loc59_:* = null as String;
         var _loc60_:* = null as Array;
         var _loc61_:* = null as String;
         var _loc62_:* = null as Array;
         var _loc63_:* = null as String;
         var _loc64_:* = null as Array;
         var _loc65_:* = null as String;
         var _loc66_:* = null as Array;
         var _loc67_:* = null as String;
         var _loc68_:* = null as Array;
         var _loc69_:* = null as String;
         var _loc70_:* = null as Array;
         var _loc71_:* = null as String;
         var _loc72_:* = null as Array;
         var _loc73_:* = null as String;
         var _loc74_:* = null as Array;
         var _loc75_:* = null as String;
         var _loc76_:* = null as Array;
         var _loc77_:* = null as String;
         var _loc78_:* = null as Credit;
         var _loc79_:* = null as Credit;
         var _loc80_:* = null as Credit;
         var _loc81_:* = null as Array;
         var _loc82_:* = null as String;
         var _loc83_:* = null as Array;
         var _loc84_:* = null as String;
         var _loc85_:* = null as Array;
         var _loc86_:* = null as String;
         var _loc87_:* = null as Array;
         var _loc88_:* = null as String;
         var _loc89_:* = null as Array;
         var _loc90_:* = null as String;
         var _loc91_:* = null as Array;
         var _loc92_:* = null as String;
         var _loc93_:* = null as Array;
         var _loc94_:* = null as String;
         var _loc95_:* = null as Array;
         var _loc96_:* = null as String;
         var _loc97_:* = null as Array;
         var _loc98_:* = null as String;
         var _loc99_:* = null as Array;
         var _loc100_:* = null as String;
         var _loc101_:* = null as Array;
         var _loc102_:* = null as String;
         var _loc103_:* = null as Array;
         var _loc104_:* = null as String;
         var _loc105_:* = null as Array;
         var _loc106_:* = null as String;
         var _loc107_:* = null as Array;
         var _loc108_:* = null as String;
         var _loc109_:* = null as Array;
         var _loc110_:* = null as String;
         var _loc111_:* = null as Array;
         var _loc112_:* = null as String;
         var _loc113_:* = null as Array;
         var _loc114_:* = null as String;
         var _loc115_:* = null as Array;
         var _loc116_:* = null as String;
         var _loc117_:* = null as Array;
         var _loc118_:* = null as String;
         var _loc119_:* = null as Credit;
         var _loc120_:* = null as Array;
         var _loc121_:* = null as String;
         var _loc122_:* = null as Credit;
         var _loc123_:* = null as Array;
         var _loc124_:* = null as String;
         var _loc125_:* = null as Array;
         var _loc126_:* = null as String;
         var _loc127_:* = null as Array;
         var _loc128_:* = null as String;
         var _loc129_:* = null as Array;
         var _loc130_:* = null as String;
         var _loc131_:* = null as Array;
         var _loc132_:* = null as String;
         var _loc133_:* = null as Credit;
         var _loc134_:* = null as Array;
         var _loc135_:* = null as String;
         var _loc136_:* = null as Array;
         var _loc137_:* = null as String;
         var _loc138_:* = null as Credit;
         var _loc139_:* = null as Array;
         var _loc140_:* = null as String;
         var _loc141_:* = null as Array;
         var _loc142_:* = null as String;
         var _loc143_:* = null as PerkType;
         var _loc144_:* = null as PerkType;
         var _loc145_:* = null as PerkType;
         var _loc146_:* = null as PerkType;
         var _loc147_:* = null as PerkType;
         var _loc148_:* = null as IMap;
         var _loc149_:* = null as Bitmap;
         var _loc150_:* = null as Bitmap;
         var _loc151_:* = null as Bitmap;
         var _loc152_:* = null as Bitmap;
         var _loc153_:* = null as Bitmap;
         var _loc154_:* = null as Bitmap;
         var _loc155_:* = null as Bitmap;
         var _loc156_:* = null as Bitmap;
         var _loc157_:* = null as Bitmap;
         var _loc158_:* = null as Bitmap;
         var _loc159_:* = null as Bitmap;
         var _loc160_:* = null as Bitmap;
         var _loc161_:* = null as Bitmap;
         var _loc162_:* = null as Bitmap;
         var _loc163_:* = null as Bitmap;
         var _loc164_:* = null as Bitmap;
         var _loc165_:* = null as Bitmap;
         var _loc166_:* = null as Bitmap;
         var _loc167_:* = null as Bitmap;
         var _loc168_:* = null as Bitmap;
         var _loc169_:* = null as Bitmap;
         var _loc170_:* = null as Bitmap;
         var _loc171_:* = null as Bitmap;
         var _loc172_:* = null as StatBarOptions;
         var _loc173_:* = null as BarDefinition;
         var _loc174_:* = null as StatBarOptions;
         var _loc175_:* = null as BarDefinition;
         var _loc176_:* = null as StatBarOptions;
         var _loc177_:* = null as IMap;
         var _loc178_:* = null as BarDefinition;
         var _loc179_:* = null as StatBarOptions;
         var _loc180_:* = null as IMap;
         var _loc181_:* = null as BarDefinition;
         var _loc182_:* = null as StatBarOptions;
         var _loc183_:* = null as IMap;
         var _loc184_:* = null as BarDefinition;
         var _loc185_:* = null as StatBarOptions;
         var _loc186_:* = null as IMap;
         var _loc187_:* = null as BarDefinition;
         var _loc188_:* = null as StatBarOptions;
         var _loc189_:* = null as IMap;
         var _loc190_:* = null as BarDefinition;
         var _loc191_:* = null as StatBarOptions;
         var _loc192_:* = null as IMap;
         var _loc193_:* = null as BarDefinition;
         var _loc194_:* = null as StatBarOptions;
         var _loc195_:* = null as IMap;
         var _loc196_:* = null as BarDefinition;
         var _loc197_:* = null as StatBarOptions;
         var _loc198_:* = null as IMap;
         var _loc199_:* = null as BarDefinition;
         var _loc200_:* = null as StatBarOptions;
         var _loc201_:* = null as IMap;
         var _loc202_:* = null as BarDefinition;
         var _loc203_:* = null as StatBarOptions;
         var _loc204_:* = null as IMap;
         var _loc205_:* = null as BarDefinition;
         var _loc206_:* = null as StatBarOptions;
         var _loc207_:* = null as IMap;
         var _loc208_:* = null as BarDefinition;
         var _loc209_:* = null as StatBarOptions;
         var _loc210_:* = null as IMap;
         var _loc211_:* = null as ByteArray;
         var _loc212_:* = null as StringMap;
         var _loc213_:* = null as Bytes;
         Math.NaN = Number(Number.NaN);
         Math.NEGATIVE_INFINITY = Number(Number.NEGATIVE_INFINITY);
         Math.POSITIVE_INFINITY = Number(Number.POSITIVE_INFINITY);
         Math.isFinite = function(param1:Number):Boolean
         {
            return isFinite(param1);
         };
         Math.isNaN = function(param1:Number):Boolean
         {
            return isNaN(param1);
         };
         if(!Xml.init__)
         {
            Xml.init__ = true;
            Xml.Element = 0;
            Xml.PCData = 1;
            Xml.CData = 2;
            Xml.Comment = 3;
            Xml.DocType = 4;
            Xml.ProcessingInstruction = 5;
            Xml.Document = 6;
         }
         if(!Appearance.init__)
         {
            Appearance.init__ = true;
            §§push(Appearance);
            _loc1_ = new StringMap();
            if("red" in StringMap.reserved)
            {
               _loc1_.setReserved("red","orange");
            }
            else
            {
               _loc1_.h["red"] = "orange";
            }
            if("orange" in StringMap.reserved)
            {
               _loc1_.setReserved("orange","yellow");
            }
            else
            {
               _loc1_.h["orange"] = "yellow";
            }
            if("yellow" in StringMap.reserved)
            {
               _loc1_.setReserved("yellow","yellowgreen");
            }
            else
            {
               _loc1_.h["yellow"] = "yellowgreen";
            }
            if("yellowgreen" in StringMap.reserved)
            {
               _loc1_.setReserved("yellowgreen","yellow");
            }
            else
            {
               _loc1_.h["yellowgreen"] = "yellow";
            }
            if("green" in StringMap.reserved)
            {
               _loc1_.setReserved("green","light green");
            }
            else
            {
               _loc1_.h["green"] = "light green";
            }
            if("spring green" in StringMap.reserved)
            {
               _loc1_.setReserved("spring green","cyan");
            }
            else
            {
               _loc1_.h["spring green"] = "cyan";
            }
            if("cyan" in StringMap.reserved)
            {
               _loc1_.setReserved("cyan","ocean blue");
            }
            else
            {
               _loc1_.h["cyan"] = "ocean blue";
            }
            if("ocean blue" in StringMap.reserved)
            {
               _loc1_.setReserved("ocean blue","light blue");
            }
            else
            {
               _loc1_.h["ocean blue"] = "light blue";
            }
            if("blue" in StringMap.reserved)
            {
               _loc1_.setReserved("blue","light blue");
            }
            else
            {
               _loc1_.h["blue"] = "light blue";
            }
            if("purple" in StringMap.reserved)
            {
               _loc1_.setReserved("purple","light purple");
            }
            else
            {
               _loc1_.h["purple"] = "light purple";
            }
            if("magenta" in StringMap.reserved)
            {
               _loc1_.setReserved("magenta","blue");
            }
            else
            {
               _loc1_.h["magenta"] = "blue";
            }
            if("deep pink" in StringMap.reserved)
            {
               _loc1_.setReserved("deep pink","pink");
            }
            else
            {
               _loc1_.h["deep pink"] = "pink";
            }
            if("black" in StringMap.reserved)
            {
               _loc1_.setReserved("black","dark gray");
            }
            else
            {
               _loc1_.h["black"] = "dark gray";
            }
            if("white" in StringMap.reserved)
            {
               _loc1_.setReserved("white","light gray");
            }
            else
            {
               _loc1_.h["white"] = "light gray";
            }
            if("gray" in StringMap.reserved)
            {
               _loc1_.setReserved("gray","light gray");
            }
            else
            {
               _loc1_.h["gray"] = "light gray";
            }
            if("light gray" in StringMap.reserved)
            {
               _loc1_.setReserved("light gray","white");
            }
            else
            {
               _loc1_.h["light gray"] = "white";
            }
            if("dark gray" in StringMap.reserved)
            {
               _loc1_.setReserved("dark gray","gray");
            }
            else
            {
               _loc1_.h["dark gray"] = "gray";
            }
            if("pink" in StringMap.reserved)
            {
               _loc1_.setReserved("pink","pale pink");
            }
            else
            {
               _loc1_.h["pink"] = "pale pink";
            }
            §§pop().NAGA_LOWER_BODY_COLORS = _loc1_;
            §§push(Appearance);
            _loc1_ = new StringMap();
            if("auburn" in StringMap.reserved)
            {
               _loc1_.setReserved("auburn","russet");
            }
            else
            {
               _loc1_.h["auburn"] = "russet";
            }
            if("black" in StringMap.reserved)
            {
               _loc1_.setReserved("black","gray");
            }
            else
            {
               _loc1_.h["black"] = "gray";
            }
            if("blond" in StringMap.reserved)
            {
               _loc1_.setReserved("blond","sandy-blonde");
            }
            else
            {
               _loc1_.h["blond"] = "sandy-blonde";
            }
            if("brown" in StringMap.reserved)
            {
               _loc1_.setReserved("brown","auburn");
            }
            else
            {
               _loc1_.h["brown"] = "auburn";
            }
            if("red" in StringMap.reserved)
            {
               _loc1_.setReserved("red","orange");
            }
            else
            {
               _loc1_.h["red"] = "orange";
            }
            if("white" in StringMap.reserved)
            {
               _loc1_.setReserved("white","gray");
            }
            else
            {
               _loc1_.h["white"] = "gray";
            }
            if("gray" in StringMap.reserved)
            {
               _loc1_.setReserved("gray","white");
            }
            else
            {
               _loc1_.h["gray"] = "white";
            }
            if("blue" in StringMap.reserved)
            {
               _loc1_.setReserved("blue","light-blue");
            }
            else
            {
               _loc1_.h["blue"] = "light-blue";
            }
            if("green" in StringMap.reserved)
            {
               _loc1_.setReserved("green","chartreuse");
            }
            else
            {
               _loc1_.h["green"] = "chartreuse";
            }
            if("orange" in StringMap.reserved)
            {
               _loc1_.setReserved("orange","yellow");
            }
            else
            {
               _loc1_.h["orange"] = "yellow";
            }
            if("yellow" in StringMap.reserved)
            {
               _loc1_.setReserved("yellow","sandy-blonde");
            }
            else
            {
               _loc1_.h["yellow"] = "sandy-blonde";
            }
            if("purple" in StringMap.reserved)
            {
               _loc1_.setReserved("purple","pink");
            }
            else
            {
               _loc1_.h["purple"] = "pink";
            }
            if("pink" in StringMap.reserved)
            {
               _loc1_.setReserved("pink","purple");
            }
            else
            {
               _loc1_.h["pink"] = "purple";
            }
            if("rainbow" in StringMap.reserved)
            {
               _loc1_.setReserved("rainbow","white");
            }
            else
            {
               _loc1_.h["rainbow"] = "white";
            }
            if("russet" in StringMap.reserved)
            {
               _loc1_.setReserved("russet","orange");
            }
            else
            {
               _loc1_.h["russet"] = "orange";
            }
            §§pop().RED_PANDA_TAIL_COLORS = _loc1_;
            var _temp_1:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "genderless";
            _loc1_.h[1] = "male";
            _loc1_.h[2] = "female";
            _loc1_.h[3] = "hermaphrodite";
            _temp_1.DEFAULT_GENDER_NAMES = _loc1_;
            var _temp_2:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "skin";
            _loc1_.h[1] = "fur";
            _loc1_.h[2] = "scales";
            _loc1_.h[3] = "goo";
            _loc1_.h[4] = "undefined flesh";
            _loc1_.h[5] = "scales";
            _loc1_.h[6] = "scales";
            _loc1_.h[7] = "wool";
            _loc1_.h[8] = "feathers";
            _temp_2.DEFAULT_SKIN_NAMES = _loc1_;
            var _temp_3:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "skin";
            _loc1_.h[1] = "fur";
            _loc1_.h[2] = "scales";
            _loc1_.h[3] = "skin";
            _loc1_.h[4] = "skin";
            _loc1_.h[5] = "scales";
            _loc1_.h[6] = "scales";
            _loc1_.h[7] = "wool";
            _loc1_.h[8] = "feathers";
            _loc1_.h[10] = "stalk";
            _loc1_.h[11] = "wood-grain";
            _temp_3.DEFAULT_SKIN_DESCS = _loc1_;
            var _temp_4:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "normal";
            _loc1_.h[1] = "feather";
            _loc1_.h[2] = "transparent";
            _loc1_.h[3] = "goopy";
            _loc1_.h[4] = "tentacle";
            _loc1_.h[5] = "quill";
            _loc1_.h[6] = "spiny basilisk";
            _loc1_.h[7] = "feathery plume";
            _loc1_.h[8] = "woolen";
            _loc1_.h[10] = "vines";
            _temp_4.DEFAULT_HAIR_NAMES = _loc1_;
            var _temp_5:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "normal";
            _loc1_.h[1] = "goatee";
            _loc1_.h[2] = "clean-cut";
            _loc1_.h[3] = "mountain-man";
            _temp_5.DEFAULT_BEARD_NAMES = _loc1_;
            var _temp_6:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "horse";
            _loc1_.h[2] = "dog";
            _loc1_.h[3] = "cow";
            _loc1_.h[4] = "shark";
            _loc1_.h[5] = "snake";
            _loc1_.h[28] = "cat";
            _loc1_.h[6] = "cattish";
            _loc1_.h[7] = "lizard";
            _loc1_.h[8] = "bunny";
            _loc1_.h[9] = "kangaroo";
            _loc1_.h[10] = "spider";
            _loc1_.h[11] = "fox";
            _loc1_.h[12] = "dragon";
            _loc1_.h[13] = "raccoon mask";
            _loc1_.h[14] = "racoon";
            _loc1_.h[15] = "buckteeth";
            _loc1_.h[16] = "mouse";
            _loc1_.h[17] = "ferret mask";
            _loc1_.h[18] = "ferret";
            _loc1_.h[19] = "pig";
            _loc1_.h[20] = "boar";
            _loc1_.h[21] = "rhino";
            _loc1_.h[24] = "wolf";
            _loc1_.h[22] = "echidna";
            _loc1_.h[23] = "deer";
            _loc1_.h[25] = "cockatrice";
            _loc1_.h[30] = "bat";
            _temp_6.DEFAULT_FACE_NAMES = _loc1_;
            var _temp_7:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "serpentine";
            _loc1_.h[2] = "demonic";
            _loc1_.h[3] = "draconic";
            _loc1_.h[4] = "echidna";
            _loc1_.h[5] = "lizard";
            _loc1_.h[6] = "cat";
            _temp_7.DEFAULT_TONGUE_NAMES = _loc1_;
            var _temp_8:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "4 spider";
            _loc1_.h[2] = "sandtrap black";
            _loc1_.h[3] = "lizard";
            _loc1_.h[6] = "wolf";
            _loc1_.h[4] = "dragon";
            _loc1_.h[5] = "basilisk";
            _loc1_.h[7] = "spider";
            _loc1_.h[8] = "cockatrice";
            _loc1_.h[9] = "cat";
            _temp_8.DEFAULT_EYES_NAMES = _loc1_;
            var _temp_9:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "horse";
            _loc1_.h[2] = "dog";
            _loc1_.h[3] = "cow";
            _loc1_.h[4] = "elfin";
            _loc1_.h[5] = "cat";
            _loc1_.h[6] = "lizard";
            _loc1_.h[7] = "bunny";
            _loc1_.h[8] = "kangaroo";
            _loc1_.h[9] = "fox";
            _loc1_.h[10] = "dragon";
            _loc1_.h[11] = "raccoon";
            _loc1_.h[12] = "mouse";
            _loc1_.h[13] = "ferret";
            _loc1_.h[14] = "pig";
            _loc1_.h[15] = "rhino";
            _loc1_.h[18] = "wolf";
            _loc1_.h[16] = "echidna";
            _loc1_.h[17] = "deer";
            _loc1_.h[19] = "sheep";
            _loc1_.h[20] = "imp";
            _loc1_.h[21] = "cockatrice";
            _loc1_.h[22] = "red-panda";
            _loc1_.h[24] = "bat";
            _temp_9.DEFAULT_EARS_NAMES = _loc1_;
            var _temp_10:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "non-existent";
            _loc1_.h[1] = "demon";
            _loc1_.h[2] = "cow";
            _loc1_.h[3] = "2 draconic";
            _loc1_.h[4] = "four 12\" long draconic";
            _loc1_.h[5] = "deer";
            _loc1_.h[6] = "goat";
            _loc1_.h[8] = "rhino";
            _loc1_.h[9] = "sheep";
            _loc1_.h[10] = "ram";
            _loc1_.h[11] = "imp";
            _loc1_.h[12] = "wooden";
            _loc1_.h[13] = "antelope";
            _temp_10.DEFAULT_HORN_NAMES = _loc1_;
            var _temp_11:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "non-existent";
            _loc1_.h[2] = "bee";
            _loc1_.h[3] = "cockatrice";
            _temp_11.DEFAULT_ANTENNAE_NAMES = _loc1_;
            var _temp_12:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "harpy";
            _loc1_.h[2] = "spider";
            _loc1_.h[6] = "wolf";
            _loc1_.h[4] = "predator";
            _loc1_.h[5] = "salamander";
            _loc1_.h[7] = "cockatrice";
            _loc1_.h[8] = "red-panda";
            _loc1_.h[13] = "dragon";
            _loc1_.h[14] = "lizard";
            _temp_12.DEFAULT_ARM_NAMES = _loc1_;
            var _temp_13:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "non-existent";
            _loc1_.h[1] = "horse";
            _loc1_.h[2] = "dog";
            _loc1_.h[3] = "demonic";
            _loc1_.h[4] = "cow";
            _loc1_.h[5] = "spider abdomen";
            _loc1_.h[6] = "bee abdomen";
            _loc1_.h[7] = "shark";
            _loc1_.h[8] = "cat";
            _loc1_.h[9] = "lizard";
            _loc1_.h[10] = "rabbit";
            _loc1_.h[11] = "harpy";
            _loc1_.h[12] = "kangaroo";
            _loc1_.h[13] = "fox";
            _loc1_.h[14] = "draconic";
            _loc1_.h[15] = "raccoon";
            _loc1_.h[16] = "mouse";
            _loc1_.h[19] = "pig";
            _loc1_.h[20] = "scorpion";
            _loc1_.h[21] = "goat";
            _loc1_.h[22] = "rhino";
            _loc1_.h[26] = "wolf";
            _loc1_.h[23] = "echidna";
            _loc1_.h[24] = "deer";
            _loc1_.h[25] = "salamander";
            _loc1_.h[27] = "sheep";
            _loc1_.h[28] = "imp";
            _loc1_.h[29] = "cockatrice";
            _loc1_.h[30] = "red-panda";
            _temp_13.DEFAULT_TAIL_NAMES = _loc1_;
            var _temp_14:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "none";
            _loc1_.h[1] = "draconic hairy mane";
            _loc1_.h[2] = "draconic spiky mane";
            _loc1_.h[3] = "shark fin";
            _loc1_.h[4] = "bark covering";
            _temp_14.DEFAULT_REAR_BODY_NAMES = _loc1_;
            var _temp_15:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "";
            _loc1_.h[1] = "long draconic";
            _loc1_.h[2] = "feathery cockatrice";
            _temp_15.DEFAULT_NECK_NAMES = _loc1_;
            var _temp_16:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "non-existent";
            _loc1_.h[1] = "small bee-like";
            _loc1_.h[2] = "large bee-like";
            _loc1_.h[4] = "harpy";
            _loc1_.h[5] = "imp";
            _loc1_.h[13] = "large imp";
            _loc1_.h[6] = "tiny bat-like";
            _loc1_.h[7] = "large bat-like";
            _loc1_.h[9] = "large feathered";
            _loc1_.h[10] = "small draconic";
            _loc1_.h[11] = "large draconic";
            _loc1_.h[12] = "giant dragonfly";
            _loc1_.h[14] = "small faerie";
            _loc1_.h[15] = "large faerie";
            _loc1_.h[16] = "wooden";
            _loc1_.h[17] = "willow";
            _loc1_.h[18] = "weeping";
            _temp_16.DEFAULT_WING_NAMES = _loc1_;
            var _temp_17:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "non-existent";
            _loc1_.h[1] = "small bee-like";
            _loc1_.h[2] = "large bee-like";
            _loc1_.h[4] = "large feathery";
            _loc1_.h[5] = "small";
            _loc1_.h[13] = "large";
            _loc1_.h[6] = "tiny, bat-like";
            _loc1_.h[7] = "large, bat-like";
            _loc1_.h[9] = "large, feathered";
            _loc1_.h[10] = "small, draconic";
            _loc1_.h[11] = "large, draconic";
            _loc1_.h[12] = "giant dragonfly";
            _loc1_.h[14] = "small, faerie";
            _loc1_.h[15] = "large, faerie";
            _loc1_.h[16] = "skeletal, wooden";
            _loc1_.h[17] = "skeletal, leafed";
            _loc1_.h[18] = "skeletal, grotesque";
            _temp_17.DEFAULT_WING_DESCS = _loc1_;
            var _temp_18:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "hoofed";
            _loc1_.h[2] = "dog";
            _loc1_.h[3] = "naga";
            _loc1_.h[26] = "wolf";
            _loc1_.h[5] = "demonic high-heels";
            _loc1_.h[6] = "demonic claws";
            _loc1_.h[7] = "bee";
            _loc1_.h[8] = "goo";
            _loc1_.h[9] = "cat";
            _loc1_.h[10] = "lizard";
            _loc1_.h[11] = "pony";
            _loc1_.h[12] = "bunny";
            _loc1_.h[13] = "harpy";
            _loc1_.h[14] = "kangaroo";
            _loc1_.h[15] = "chitinous spider legs";
            _loc1_.h[16] = "drider";
            _loc1_.h[17] = "fox";
            _loc1_.h[18] = "dragon";
            _loc1_.h[19] = "raccoon";
            _loc1_.h[20] = "ferret";
            _loc1_.h[21] = "cloven-hoofed";
            _loc1_.h[23] = "echidna";
            _loc1_.h[25] = "salamander";
            _loc1_.h[27] = "imp";
            _loc1_.h[28] = "cockatrice";
            _loc1_.h[29] = "red-panda";
            _loc1_.h[30] = "plantigrade roots";
            _loc1_.h[32] = "mermaid";
            _loc1_.h[33] = "bat";
            _temp_18.DEFAULT_LOWER_BODY_NAMES = _loc1_;
            var _temp_19:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "none";
            _loc1_.h[1] = "stud";
            _loc1_.h[2] = "ring";
            _loc1_.h[3] = "ladder";
            _loc1_.h[4] = "hoop";
            _loc1_.h[5] = "chain";
            _temp_19.DEFAULT_PIERCING_NAMES = _loc1_;
            var _temp_20:* = Appearance;
            _loc1_ = new IntMap();
            _loc1_.h[0] = "human";
            _loc1_.h[1] = "equine";
            _loc1_.h[5] = "black sandtrap";
            _temp_20.DEFAULT_VAGINA_TYPE_NAMES = _loc1_;
         }
         if(!BonusStat_Impl_.init__)
         {
            BonusStat_Impl_.init__ = true;
            BonusStat_Impl_.dodge = "闪避几率";
            BonusStat_Impl_.spellMod = "法术修正";
            BonusStat_Impl_.critC = "暴击率";
            BonusStat_Impl_.critCWeapon = "武器暴击率";
            BonusStat_Impl_.critD = "暴击伤害";
            BonusStat_Impl_.maxHealth = "最大生命值";
            BonusStat_Impl_.spellCost = "法术消耗";
            BonusStat_Impl_.accuracy = "命中率";
            BonusStat_Impl_.physDmg = "物理伤害";
            BonusStat_Impl_.healthRegenPercent = "生命恢复 (%)";
            BonusStat_Impl_.healthRegenFlat = "生命恢复 (固定值)";
            BonusStat_Impl_.minLust = "最低欲望";
            BonusStat_Impl_.lustRes = "欲望抗性";
            BonusStat_Impl_.movementChance = "移动几率";
            BonusStat_Impl_.teaseChance = "挑逗几率";
            BonusStat_Impl_.teaseDamage = "挑逗伤害";
            BonusStat_Impl_.attackDamage = "攻击伤害";
            BonusStat_Impl_.globalMod = "全局伤害";
            BonusStat_Impl_.weaponDamage = "武器伤害";
            BonusStat_Impl_.fatigueMax = "最大疲劳度";
            BonusStat_Impl_.damageTaken = "受到伤害";
            BonusStat_Impl_.armor = "护甲";
            BonusStat_Impl_.armorPen = "护甲穿透";
            BonusStat_Impl_.parry = "招架几率";
            BonusStat_Impl_.bodyDmg = "肉体伤害";
            BonusStat_Impl_.xpGain = "经验获取";
            BonusStat_Impl_.statGain = "属性增益";
            BonusStat_Impl_.strGain = "力量增益";
            BonusStat_Impl_.touGain = "体质增益";
            BonusStat_Impl_.speGain = "速度增益";
            BonusStat_Impl_.intGain = "智力增益";
            BonusStat_Impl_.libGain = "性欲增加";
            BonusStat_Impl_.senGain = "敏感度增加";
            BonusStat_Impl_.corGain = "腐化增加";
            BonusStat_Impl_.statLoss = "属性减少";
            BonusStat_Impl_.strLoss = "力量减少";
            BonusStat_Impl_.touLoss = "体质损失";
            BonusStat_Impl_.speLoss = "速度损失";
            BonusStat_Impl_.intLoss = "智力损失";
            BonusStat_Impl_.libLoss = "性欲损失";
            BonusStat_Impl_.senLoss = "敏感度损失";
            BonusStat_Impl_.corLoss = "腐化降低";
            BonusStat_Impl_.minLib = "最低性欲";
            BonusStat_Impl_.minSen = "最低敏感度";
         }
         if(!BonusDerivedStats.init__)
         {
            BonusDerivedStats.init__ = true;
            BonusDerivedStats.goodNegatives = ["法术消耗","最低欲望","腐化增加"];
            BonusDerivedStats.percentageAdditions = ["移动几率","闪避几率","法术修正","暴击率","武器暴击率","暴击伤害","法术消耗","命中率","物理伤害","生命恢复 (%)","欲望抗性","攻击伤害","全局伤害","受到伤害","护甲","招架几率","肉体伤害","经验获取","属性增益","力量增益","体质增益","速度增益","智力增益","性欲增加","敏感度增加","腐化增加","属性减少","力量减少","体质损失","速度损失","智力损失","性欲损失","敏感度损失","腐化降低"];
         }
         if(!CoC.init__)
         {
            CoC.init__ = true;
            var _temp_21:* = CoC;
            CoC.setUpLogging();
            _temp_21.___init = null;
         }
         if(!CockTypesEnum.init__)
         {
            CockTypesEnum.init__ = true;
            CockTypesEnum.HUMAN = new CockTypesEnum(0,"HUMAN","human");
            CockTypesEnum.HORSE = new CockTypesEnum(1,"HORSE","mammal");
            CockTypesEnum.DOG = new CockTypesEnum(2,"DOG","mammal");
            CockTypesEnum.DEMON = new CockTypesEnum(3,"DEMON","super");
            CockTypesEnum.TENTACLE = new CockTypesEnum(4,"TENTACLE","tentacle");
            CockTypesEnum.CAT = new CockTypesEnum(5,"CAT","mammal");
            CockTypesEnum.LIZARD = new CockTypesEnum(6,"LIZARD","reptile");
            CockTypesEnum.ANEMONE = new CockTypesEnum(7,"ANEMONE","seaworld");
            CockTypesEnum.KANGAROO = new CockTypesEnum(8,"KANGAROO","mammal");
            CockTypesEnum.DRAGON = new CockTypesEnum(9,"DRAGON","reptile");
            CockTypesEnum.DISPLACER = new CockTypesEnum(10,"DISPLACER","other");
            CockTypesEnum.FOX = new CockTypesEnum(11,"FOX","mammal");
            CockTypesEnum.BEE = new CockTypesEnum(12,"BEE","insect");
            CockTypesEnum.PIG = new CockTypesEnum(13,"PIG","mammal");
            CockTypesEnum.AVIAN = new CockTypesEnum(14,"AVIAN","avian");
            CockTypesEnum.RHINO = new CockTypesEnum(15,"RHINO","mammal");
            CockTypesEnum.ECHIDNA = new CockTypesEnum(16,"ECHIDNA","mammal");
            CockTypesEnum.WOLF = new CockTypesEnum(17,"WOLF","mammal");
            CockTypesEnum.RED_PANDA = new CockTypesEnum(18,"RED_PANDA","mammal");
            CockTypesEnum.FERRET = new CockTypesEnum(19,"FERRET","mammal");
            CockTypesEnum.GNOLL = new CockTypesEnum(20,"GNOLL","mammal");
            CockTypesEnum.UNDEFINED = new CockTypesEnum(21,"UNDEFINED","");
         }
         if(!DebugMenu.init__)
         {
            DebugMenu.init__ = true;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = ["白化","水蓝","灰白","赤褐","黑色","金发(男)","金发(女)","蓝色","古铜","棕色","焦糖","蔚蓝","巧克力","猩红","水晶","深色","暗色","乌木","翡翠","白皙","金色","灰色","绿色","靛蓝","浅色","红木","金属","午夜","橄榄","橙色","桃红","粉色","紫色","红色","红褐","紫貂","血红","丝滑","银色","棕褐","黄褐","绿松石","白色","黄色","无光蓝黑","灰蓝","乳白","猩红铂金","深蓝","深灰","深绿","深蓝","深红","幽灵苍白","冰川白","金发","灰蓝","虹彩灰","叶绿","浅金","浅蓝","浅灰","浅绿","浅紫","青柠绿","地中海色调","金属金","金属银","午夜黑","乳白","苍白","浅黄","铂金发","铂金猩红","铂金发","紫黑","石英白","红橙","粗糙灰","沙金","沙棕","沙金","亮黑","银金","银白","雪白","黄绿","黑黄","白黑"];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               _loc3_.push(_loc2_(_loc6_));
            }
            §§pop().COLOR_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = ["(none)","tough","smooth","rough","sexy","freckled","glistering","shiny","slimy","goopey","latex","rubber"];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               _loc3_.push(_loc2_(_loc6_));
            }
            §§pop().SKIN_ADJ_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = ["(default)","covering","feathers","hide","shell","plastic","skin","fur","scales","bark","stone","chitin"];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               _loc3_.push(_loc2_(_loc6_));
            }
            §§pop().SKIN_DESC_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = [0,0.5,1,2,4,8,12,24,32,40,64,72];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc7_ = Number(_loc5_[_loc4_]);
               _loc4_++;
               _loc3_.push(_loc2_(_loc7_));
            }
            §§pop().HAIR_LENGTH_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = [0,1,2,3,4,5,6,8,10,12,16,20];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc8_ = int(_loc5_[_loc4_]);
               _loc4_++;
               _loc3_.push(_loc2_(_loc8_));
            }
            §§pop().HORN_COUNT_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = [0,0.1,0.3,2,4,8,12,16,32,64];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc7_ = Number(_loc5_[_loc4_]);
               _loc4_++;
               _loc3_.push(_loc2_(_loc7_));
            }
            §§pop().BEARD_LENGTH_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = [0,1,2,3,4,5,6,7,8,9,10,16];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc8_ = int(_loc5_[_loc4_]);
               _loc4_++;
               _loc3_.push(_loc2_(_loc8_));
            }
            §§pop().TAIL_COUNT_CONSTANTS = _loc3_;
            §§push(DebugMenu);
            _loc2_ = DebugMenu.valueAsLabel;
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = [1,2,4,6,8,10,12,16];
            while(_loc4_ < int(_loc5_.length))
            {
               _loc8_ = int(_loc5_[_loc4_]);
               _loc4_++;
               _loc3_.push(_loc2_(_loc8_));
            }
            §§pop().LEG_COUNT_CONSTANTS = _loc3_;
         }
         if(!ImageManager.init__)
         {
            ImageManager.init__ = true;
            ImageManager._imageMap = new StringMap();
            ImageManager._fqPathMap = new StringMap();
         }
         if(!ItemType.init__)
         {
            ItemType.init__ = true;
            ItemType.ITEM_LIBRARY = new StringMap();
            ItemType.NOTHING = new ItemType("NOTHING!");
         }
         if(!MainMenu.init__)
         {
            MainMenu.init__ = true;
            §§push(MainMenu);
            _loc3_ = [new CreditSection(ContributionType.Coding,"程序编写"),new CreditSection(ContributionType.Contributions,"内容创作")];
            _loc9_ = new Credit("aimozg",null,null,[ContributionType.Coding],null);
            _loc10_ = new Credit("AnonMonkey",null,null,[ContributionType.Coding],null);
            _loc11_ = new Credit("Anonnomàs",null,[Contribution.Standalone("阴茎结解析器及相关场景")],[ContributionType.Contributions],null);
            _loc5_ = ["贴图更新","艾米莉","多米妮卡"];
            _loc6_ = _loc5_.shift();
            _loc12_ = ["UI 资产","清理后的按钮","上下属性箭头重制"];
            _loc13_ = _loc12_.shift();
            _loc14_ = new Credit("Chronicler",null,[Contribution.Standalone("编年史"),Contribution.Standalone("塞拉芙魔法对话"),Contribution.Standalone("制作人员名单菜单重写"),Contribution.Standalone("无头骑士外貌"),Contribution.Standalone("/hgg/ 主菜单Logo"),Contribution.Standalone("物品名称与描述重写"),Contribution.Standalone("小地图素材"),Contribution.Standalone("高山煤矿"),Contribution.Standalone("岩石主题更新"),_loc6_ == null ? Contribution.Grouped("",_loc5_) : Contribution.Grouped(_loc6_,_loc5_),Contribution.Standalone("帖子主楼模板"),Contribution.Standalone("获取华丽宝箱重写"),_loc13_ == null ? Contribution.Grouped("",_loc12_) : Contribution.Grouped(_loc13_,_loc12_)],[ContributionType.Contributions],null);
            _loc15_ = ["恋物教徒扩展","半人马战败扩展","娜迦战败扩展","狗战败场景"];
            _loc16_ = _loc15_.shift();
            _loc17_ = new Credit("CoCanon","!tfhJbjUNbg",[_loc16_ == null ? Contribution.Grouped("",_loc15_) : Contribution.Grouped(_loc16_,_loc15_)],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc18_ = new Credit("Conifer",null,[Contribution.Standalone("艾米莉圣水"),Contribution.Standalone("石像鬼圣水"),Contribution.Standalone("地狱犬圣水"),Contribution.Standalone("半羊人圣水")],[ContributionType.Contributions],null);
            _loc19_ = new Credit("hpreganon",null,[Contribution.Standalone("络新妇寄生虫")],[ContributionType.Contributions],null);
            _loc20_ = new Credit("IxFa","!WrbZPxQ0rw",[Contribution.Standalone("阿玛洛克被骑乘"),Contribution.Standalone("萝莉玩家开场"),Contribution.Standalone("萝莉玩家小恶魔场景"),Contribution.Standalone("萝莉处女小恶魔强暴"),Contribution.Standalone("正太玩家地精场景"),Contribution.Standalone("处女触手强暴")],[ContributionType.Contributions],null);
            _loc21_ = ["石像鬼附加内容","幼年版本","关系对话"];
            _loc22_ = _loc21_.shift();
            _loc23_ = ["尼芙附加内容","幼年版本","武器对话"];
            _loc24_ = _loc23_.shift();
            _loc25_ = new Credit("Koraeli","!KMFMbbzuJw",[Contribution.Standalone("年龄系统"),Contribution.Standalone("幼年烬"),Contribution.Standalone("幼年舒尔德拉"),_loc22_ == null ? Contribution.Grouped("",_loc21_) : Contribution.Grouped(_loc22_,_loc21_),Contribution.Standalone("专精系统"),_loc24_ == null ? Contribution.Grouped("",_loc23_) : Contribution.Grouped(_loc24_,_loc23_),Contribution.Standalone("无毛模式")],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc26_ = ["爱丽丝扩展","自愿尾交","摸头","亲密"];
            _loc27_ = _loc26_.shift();
            _loc28_ = ["阿瑞安扩展","外貌","舔阴","摸头场景","骑脸","女同转变","骑尾巴","处女骑脸","制作莱西特法杖"];
            _loc29_ = _loc28_.shift();
            _loc30_ = ["黑天鹅绒阿鲁拉乌内扩展","舔阴","舔肛","藤蔓胜利"];
            _loc31_ = _loc30_.shift();
            _loc32_ = ["地狱之口附加内容","69式","圣水"];
            _loc33_ = _loc32_.shift();
            _loc34_ = ["赫莉娅的子嗣附加内容","骑脸","足交","亲吻","共眠","百合做爱变体"];
            _loc35_ = _loc34_.shift();
            _loc36_ = ["奇哈的爱意","依偎指交","磨豆腐"];
            _loc37_ = _loc36_.shift();
            _loc38_ = new Credit("Lesbianon",null,[_loc27_ == null ? Contribution.Grouped("",_loc26_) : Contribution.Grouped(_loc27_,_loc26_),_loc29_ == null ? Contribution.Grouped("",_loc28_) : Contribution.Grouped(_loc29_,_loc28_),_loc31_ == null ? Contribution.Grouped("",_loc30_) : Contribution.Grouped(_loc31_,_loc30_),Contribution.Standalone("被俘虏的魅魔女同性爱"),Contribution.Standalone("无头骑士舔玩家肛门"),_loc33_ == null ? Contribution.Grouped("",_loc32_) : Contribution.Grouped(_loc33_,_loc32_),_loc35_ == null ? Contribution.Grouped("",_loc34_) : Contribution.Grouped(_loc35_,_loc34_),_loc37_ == null ? Contribution.Grouped("",_loc36_) : Contribution.Grouped(_loc37_,_loc36_),Contribution.Standalone("萨努拉爪交"),Contribution.Standalone("瓦莱丽亚营地介绍（穿戴时）")],[ContributionType.Contributions],null);
            _loc39_ = new Credit("LinkAnon",null,[Contribution.Standalone("冒险者链甲")],[ContributionType.Contributions],null);
            _loc40_ = ["玛布尔附加内容","纯洁/腐化梦魇","孩童游戏时间","营地克拉拉旁白"];
            _loc41_ = _loc40_.shift();
            _loc42_ = new Credit("MarbleAnon",null,[_loc41_ == null ? Contribution.Grouped("",_loc40_) : Contribution.Grouped(_loc41_,_loc40_)],[ContributionType.Contributions],null);
            _loc43_ = new Credit("MissBlackThorne",null,[Contribution.Standalone("豺狼人据点"),Contribution.Standalone("淫荡修女服")],[ContributionType.Contributions],null);
            _loc44_ = ["爱丽丝附加内容","亲密做爱","粗暴性爱","子宫深喉"];
            _loc45_ = _loc44_.shift();
            _loc46_ = ["阿玛洛克新增内容","战败深喉","女性战败重写"];
            _loc47_ = _loc46_.shift();
            _loc48_ = ["艾米莉新增内容","森林约会","遇见孩子们","头骨收集"];
            _loc49_ = _loc48_.shift();
            _loc50_ = ["塞拉芙新增内容","外貌修改","聊天","强暴play"];
            _loc51_ = _loc50_.shift();
            _loc52_ = ["烬的附加内容","磨豆腐","给孩子盖被子"];
            _loc53_ = _loc52_.shift();
            _loc54_ = ["赫莉娅新增内容","烬三人行","欲火交欢","跟Revamp陪睡"];
            _loc55_ = _loc54_.shift();
            _loc56_ = ["赫莉娅的子嗣新增内容","钓鱼","摸头"];
            _loc57_ = _loc56_.shift();
            _loc58_ = ["赫莉娅的子嗣玩耍附加内容","篝火","抛接球"];
            _loc59_ = _loc58_.shift();
            _loc60_ = ["霍莉附加内容","外貌修改","交谈"];
            _loc61_ = _loc60_.shift();
            _loc62_ = ["伊兹玛附加内容","舔阴","切磋"];
            _loc63_ = _loc62_.shift();
            _loc64_ = ["小A附加内容","外貌","拒绝照看"];
            _loc65_ = _loc64_.shift();
            _loc66_ = ["狐妖附加内容","催情剂骑脸","触摸毛茸茸的尾巴"];
            _loc67_ = _loc66_.shift();
            _loc68_ = ["乳胶粘液娘附加内容","外貌","交谈"];
            _loc69_ = _loc68_.shift();
            _loc70_ = ["杂项一次性遭遇","森林野果","海市蜃楼","骷髅","马车"];
            _loc71_ = _loc70_.shift();
            _loc72_ = ["尼芙新增内容","孩子堆雪人","假阳具","对话选项"];
            _loc73_ = _loc72_.shift();
            _loc74_ = ["瘟疫鼠新增内容","利德尔矿","插入"];
            _loc75_ = _loc74_.shift();
            _loc76_ = ["拉萨祖尔新增内容","外貌","提供物品","对话选项"];
            _loc77_ = _loc76_.shift();
            _loc78_ = new Credit("Mothman",null,[Contribution.Standalone("阿基熊赠礼"),_loc45_ == null ? Contribution.Grouped("",_loc44_) : Contribution.Grouped(_loc45_,_loc44_),_loc47_ == null ? Contribution.Grouped("",_loc46_) : Contribution.Grouped(_loc47_,_loc46_),_loc49_ == null ? Contribution.Grouped("",_loc48_) : Contribution.Grouped(_loc49_,_loc48_),Contribution.Standalone("阿瑞安女性晨爱"),Contribution.Standalone("卡鲁禁欲钓鱼"),_loc51_ == null ? Contribution.Grouped("",_loc50_) : Contribution.Grouped(_loc51_,_loc50_),Contribution.Standalone("第十天同性春梦"),Contribution.Standalone("恶魔伐木工坏结局"),Contribution.Standalone("获取黑檀花"),Contribution.Standalone("埃德琳孩子遭遇"),_loc53_ == null ? Contribution.Grouped("",_loc52_) : Contribution.Grouped(_loc53_,_loc52_),Contribution.Standalone("石像鬼沐浴"),Contribution.Standalone("喂食妖精蜂蜜"),Contribution.Standalone("鸟身女妖女儿结婚"),_loc55_ == null ? Contribution.Grouped("",_loc54_) : Contribution.Grouped(_loc55_,_loc54_),_loc57_ == null ? Contribution.Grouped("",_loc56_) : Contribution.Grouped(_loc57_
            ,_loc56_),_loc59_ == null ? Contribution.Grouped("",_loc58_) : Contribution.Grouped(_loc59_,_loc58_),_loc61_ == null ? Contribution.Grouped("",_loc60_) : Contribution.Grouped(_loc61_,_loc60_),Contribution.Standalone("小恶魔头骨检查"),_loc63_ == null ? Contribution.Grouped("",_loc62_) : Contribution.Grouped(_loc63_,_loc62_),Contribution.Standalone("伊兹米举石比赛"),_loc65_ == null ? Contribution.Grouped("",_loc64_) : Contribution.Grouped(_loc65_,_loc64_),_loc67_ == null ? Contribution.Grouped("",_loc66_) : Contribution.Grouped(_loc67_,_loc66_),_loc69_ == null ? Contribution.Grouped("",_loc68_) : Contribution.Grouped(_loc69_,_loc68_),Contribution.Standalone("营养不良的自慰"),Contribution.Standalone("庄园赠书"),Contribution.Standalone("奶奴对话菜单"),_loc71_ == null ? Contribution.Grouped("",_loc70_) : Contribution.Grouped(_loc71_,_loc70_),_loc73_ == null ? Contribution.Grouped("",_loc72_) : Contribution.Grouped(_loc73_,_loc72_),_loc75_ == null ? Contribution.Grouped("",_loc74_) : Contribution.Grouped(_loc75_,_loc74_),Contribution
            .Standalone("校对 / 润色"),_loc77_ == null ? Contribution.Grouped("",_loc76_) : Contribution.Grouped(_loc77_,_loc76_),Contribution.Standalone("雷贝克鼻烟 "),Contribution.Standalone("沙之母外貌"),Contribution.Standalone("鲨鱼女儿性教育"),Contribution.Standalone("索菲谈话"),Contribution.Standalone("蛾女西尔维娅"),Contribution.Standalone("塔玛尼骑脸后续"),Contribution.Standalone("操泰迪熊"),Contribution.Standalone("特尔阿德雷小孩冰淇淋场景"),Contribution.Standalone("虎鲨女儿支配"),Contribution.Standalone("瓦普拉阴道交")],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc79_ = new Credit("OtherCoCAnon","!FDziEStfd2",[Contribution.Standalone("喀耳刻"),Contribution.Standalone("战斗大修"),Contribution.Standalone("腐化女巫"),Contribution.Standalone("无头骑士"),Contribution.Standalone("深林庄园地牢"),Contribution.Standalone("鳗鱼寄生虫"),Contribution.Standalone("地精神射手"),Contribution.Standalone("洛珀玩家高性欲场景"),Contribution.Standalone("蛞蝓寄生虫"),Contribution.Standalone("欺骗之塔地牢"),Contribution.Standalone("火山岩石魔像")],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc80_ = new Credit("Oxdeception",null,null,[ContributionType.Coding],null);
            _loc81_ = ["艾米莉附加内容","烹饪课程","扶她重写","冬季拥抱场景"];
            _loc82_ = _loc81_.shift();
            _loc83_ = ["塞拉芙附加内容","泰莉角色扮演","下腹骑乘"];
            _loc84_ = _loc83_.shift();
            _loc85_ = ["妖精新增内容","外貌变化","图鉴","腐化林地之花","进食（非吞食）","花发护理","\"治疗\"","森林小鬼一次性事件","口交"];
            _loc86_ = _loc85_.shift();
            _loc87_ = ["恋物教派新增内容","教徒修女胜利","重写项目","狂热牧师胜利","狂热学生战败"];
            _loc88_ = _loc87_.shift();
            _loc89_ = ["哈比女儿扩展","拥抱","舔阴","一起飞行","摸头"];
            _loc90_ = _loc89_.shift();
            _loc91_ = ["赫莉娅的子嗣扩展","纯洁的做爱","童年沐浴","给蜘蛛男孩戴绿帽","骑大马","吸吮阿涅莫涅的水","切磋恶作剧","青少年醉酒性爱"];
            _loc92_ = _loc91_.shift();
            _loc93_ = ["伊莎贝拉扩展","婴儿","营地描述与怀孕重写"];
            _loc94_ = _loc93_.shift();
            _loc95_ = ["伊兹玛新增内容","肛交","相拥"];
            _loc96_ = _loc95_.shift();
            _loc97_ = ["伊兹米新增内容","战败相拥","圣水"];
            _loc98_ = _loc97_.shift();
            _loc99_ = ["乔乔新增内容","外貌重写","营地强暴重写","强暴后互动重写"];
            _loc100_ = _loc99_.shift();
            _loc101_ = ["小A新增内容","教导自慰","泰迪熊守卫","虎鲨摔跤"];
            _loc102_ = _loc101_.shift();
            _loc103_ = ["美人鱼扩展","水母娘","贵族衬衫转化","绿洲萨满","鲨鱼人"];
            _loc104_ = _loc103_.shift();
            _loc105_ = ["尼芙内容补充","肛交","破处","与孩子们玩耍"];
            _loc106_ = _loc105_.shift();
            _loc107_ = ["沙巫新增内容","催情压制","乳交"];
            _loc108_ = _loc107_.shift();
            _loc109_ = ["鲨鱼女儿内容","口交","玩弄鸡巴","虐待地精","游戏时间","偷窥"];
            _loc110_ = _loc109_.shift();
            _loc111_ = ["舒尔德拉新增内容","外貌","聊天","幽灵口交（搞笑模式）","互相自慰","菲拉事件后谈话"];
            _loc112_ = _loc111_.shift();
            _loc113_ = ["立绘","本诺瓦修改与(((本诺瓦)))","修正的阿克巴尔","纯洁密涅瓦修改"];
            _loc114_ = _loc113_.shift();
            _loc115_ = ["基于武器的击杀场景","格温","小恶魔","魅魔监工","泽塔兹"];
            _loc116_ = _loc115_.shift();
            _loc117_ = ["惠特尼的农场马厩","操母马","给公马口交"];
            _loc118_ = _loc117_.shift();
            _loc119_ = new Credit("Satan","!CoC666dcWI",[Contribution.Standalone("爱丽丝们，萝莉魅魔"),_loc82_ == null ? Contribution.Grouped("",_loc81_) : Contribution.Grouped(_loc82_,_loc81_),Contribution.Standalone("阿玛洛克口交"),Contribution.Standalone("集市守卫口交"),Contribution.Standalone("黑天鹅绒阿鲁拉乌内"),Contribution.Standalone("营地睡眠描述"),_loc84_ == null ? Contribution.Grouped("",_loc83_) : Contribution.Grouped(_loc84_,_loc83_),Contribution.Standalone("异界骇物口交"),Contribution.Standalone("烬的龙心花礼物"),_loc86_ == null ? Contribution.Grouped("",_loc85_) : Contribution.Grouped(_loc86_,_loc85_),Contribution.Standalone("农场夜晚修改"),_loc88_ == null ? Contribution.Grouped("",_loc87_) : Contribution.Grouped(_loc88_,_loc87_),Contribution.Standalone("菲拉重写与阿克巴尔的任务"),Contribution.Standalone("蛙女授课扩展"),Contribution.Standalone("母猪恶魔"),Contribution.Standalone("地精子宫奸"),_loc90_ == null ? Contribution.Grouped("",_loc89_) : Contribution.Grouped(_loc90_,_loc89_),Contribution.Standalone("地狱之口"),Contribution.Standalone("赫莉娅的夜间需求"),_loc92_ == null ? Contribution
            .Grouped("",_loc91_) : Contribution.Grouped(_loc92_,_loc91_),Contribution.Standalone("伊弗里斯肌肉崇拜"),Contribution.Standalone("梦魇伐木工"),_loc94_ == null ? Contribution.Grouped("",_loc93_) : Contribution.Grouped(_loc94_,_loc93_),Contribution.Standalone("象牙魅魔"),_loc96_ == null ? Contribution.Grouped("",_loc95_) : Contribution.Grouped(_loc96_,_loc95_),_loc98_ == null ? Contribution.Grouped("",_loc97_) : Contribution.Grouped(_loc98_,_loc97_),_loc100_ == null ? Contribution.Grouped("",_loc99_) : Contribution.Grouped(_loc100_,_loc99_),_loc102_ == null ? Contribution.Grouped("",_loc101_) : Contribution.Grouped(_loc102_,_loc101_),Contribution.Standalone("奇哈赠送龙心花"),Contribution.Standalone("狐妖饮酒（搞笑模式）"),Contribution.Standalone("莱西斯编辑"),Contribution.Standalone("利德尔矿（当前已禁用）"),Contribution.Standalone("棒棒糖重写"),Contribution.Standalone("魔法典籍"),Contribution.Standalone("庄园葡萄酒重制"),Contribution.Standalone("玛莱击杀修改"),_loc104_ == null ? Contribution.Grouped("",_loc103_) : Contribution.Grouped(_loc104_,_loc103_),Contribution
            .Standalone("密涅瓦禁欲选项"),Contribution.Standalone("莫拉斯"),_loc106_ == null ? Contribution.Grouped("",_loc105_) : Contribution.Grouped(_loc106_,_loc105_),Contribution.Standalone("普卡百科与饮酒重写"),Contribution.Standalone("瘟疫鼠"),Contribution.Standalone("拉萨祖尔的熊礼物"),Contribution.Standalone("雷贝克浴室口交"),Contribution.Standalone("罗加强暴"),_loc108_ == null ? Contribution.Grouped("",_loc107_) : Contribution.Grouped(_loc108_,_loc107_),_loc110_ == null ? Contribution.Grouped("",_loc109_) : Contribution.Grouped(_loc110_,_loc109_),_loc112_ == null ? Contribution.Grouped("",_loc111_) : Contribution.Grouped(_loc112_,_loc111_),Contribution.Standalone("索菲拒绝女性求欢"),_loc114_ == null ? Contribution.Grouped("",_loc113_) : Contribution.Grouped(_loc114_,_loc113_),Contribution.Standalone("特尔阿德雷图书馆帮助"),Contribution.Standalone("泰莉的玩具与零食"),Contribution.Standalone("幽会还是款待"),Contribution.Standalone("乌尔塔死后的长戟"),_loc116_ == null ? Contribution.Grouped("",_loc115_) : Contribution.Grouped(_loc116_,_loc115_),_loc118_ == null ? Contribution
            .Grouped("",_loc117_) : Contribution.Grouped(_loc118_,_loc117_),Contribution.Standalone("惠特尼与豺狼人战斗"),Contribution.Standalone("许多烂梗")],[ContributionType.Contributions],null);
            _loc120_ = ["爱丽丝扩展","摸头","内裤蝴蝶结与闻嗅"];
            _loc121_ = _loc120_.shift();
            _loc122_ = new Credit("Wombat",null,[_loc121_ == null ? Contribution.Grouped("",_loc120_) : Contribution.Grouped(_loc121_,_loc120_),Contribution.Standalone("沼泽神庙"),Contribution.Standalone("妖精舒尔德拉的鸡巴幻象~"),Contribution.Standalone("冰川裂谷小木屋"),Contribution.Standalone("玛瑞斯，亡灵女裁缝"),Contribution.Standalone("雷贝克鼻烟场景 (百合)"),Contribution.Standalone("特尔阿德雷小猫遭遇战"),Contribution.Standalone("训练假人"),Contribution.Standalone("瓦普拉强迫舔舐"),Contribution.Standalone("有翼长矛")],[ContributionType.Contributions],null);
            _loc123_ = ["爱子重写","对话选项","八岐后续"];
            _loc124_ = _loc123_.shift();
            _loc125_ = ["烬的附加内容","母乳喂养","孵蛋"];
            _loc126_ = _loc125_.shift();
            _loc127_ = ["赫莉娅的子嗣附加内容","童年阅读","早晨惊喜","荡妇子嗣性爱"];
            _loc128_ = _loc127_.shift();
            _loc129_ = ["狐妖扩展","通用前戏胜利","雕像营地使用","幻象之梦"];
            _loc130_ = _loc129_.shift();
            _loc131_ = ["鲁比附加内容","肛门露出","给孩子们买零食","女性按摩变体"];
            _loc132_ = _loc131_.shift();
            _loc133_ = new Credit("Yuribot",null,[Contribution.Standalone("爱子外貌"),_loc124_ == null ? Contribution.Grouped("",_loc123_) : Contribution.Grouped(_loc124_,_loc123_),Contribution.Standalone("浴场女孩对话选项"),_loc126_ == null ? Contribution.Grouped("",_loc125_) : Contribution.Grouped(_loc126_,_loc125_),Contribution.Standalone("格温无性选项"),Contribution.Standalone("地狱之口拥抱"),_loc128_ == null ? Contribution.Grouped("",_loc127_) : Contribution.Grouped(_loc128_,_loc127_),Contribution.Standalone("霍莉腐化林地再生"),Contribution.Standalone("凯莉孩子赛跑"),Contribution.Standalone("小A的百合做爱"),Contribution.Standalone("奇哈孩子喷火"),_loc130_ == null ? Contribution.Grouped("",_loc129_) : Contribution.Grouped(_loc130_,_loc129_),Contribution.Standalone("玛布尔的戒奶之梦"),Contribution.Standalone("不死鸟骑脸"),Contribution.Standalone("租借爱丽丝"),_loc132_ == null ? Contribution.Grouped("",_loc131_) : Contribution.Grouped(_loc132_,_loc131_),Contribution.Standalone("虎鲨女儿展示"),Contribution.Standalone("瓦普拉与雷贝克百合三人行")],[ContributionType.Contributions],null);
            _loc134_ = ["艾米莉附加内容","孕期骑乘","赠送戒指","依偎/早安咬"];
            _loc135_ = _loc134_.shift();
            _loc136_ = ["奇哈附加内容","接吻","共眠"];
            _loc137_ = _loc136_.shift();
            _loc138_ = new Credit("2hufag",null,[Contribution.Standalone("爱丽丝被舒尔德拉附身"),Contribution.Standalone("替换蛙女"),_loc135_ == null ? Contribution.Grouped("",_loc134_) : Contribution.Grouped(_loc135_,_loc134_),Contribution.Standalone("阿瑞安好感度菜单"),_loc137_ == null ? Contribution.Grouped("",_loc136_) : Contribution.Grouped(_loc137_,_loc136_),Contribution.Standalone("狐妖神社捐赠"),Contribution.Standalone("离开鲁比的家"),Contribution.Standalone("哄鸟身女妖女儿入睡")],[ContributionType.Contributions],null);
            _loc139_ = ["纯洁玛布尔附加内容","按摩与手淫","抖S妈咪"];
            _loc140_ = _loc139_.shift();
            _loc141_ = ["马厩附加内容","撅起屁股","马形假阳具肏干","种马肛交"];
            _loc142_ = _loc141_.shift();
            §§pop()._hggConfig = new Credits(_loc3_,"/hgg/ 制作人员名单","[bu: 帖子特别鸣谢]:\nOP发帖人、帖子存档员以及编剧指南。\n",[_loc9_,_loc10_,_loc11_,_loc14_,_loc17_,_loc18_,_loc19_,_loc20_,_loc25_,_loc38_,_loc39_,_loc42_,_loc43_,_loc78_,_loc79_,_loc80_,_loc119_,_loc122_,_loc133_,_loc138_,new Credit("Anonymous",null,[Contribution.Standalone("阿克巴尔生命值流失"),Contribution.Standalone("弓箭扩展"),Contribution.Standalone("第十天女同之梦"),Contribution.Standalone("和小A一起享受木桶"),Contribution.Standalone("恋物狂热者宗教战败"),Contribution.Standalone("狐妖乳交"),_loc140_ == null ? Contribution.Grouped("",_loc139_) : Contribution.Grouped(_loc140_,_loc139_),Contribution.Standalone("萨努拉舔阴"),Contribution.Standalone("鲨鱼女儿梦魇"),_loc142_ == null ? Contribution.Grouped("",_loc141_) : Contribution.Grouped(_loc142_,_loc141_),Contribution.Standalone("小恶魔生命值流失"),Contribution.Standalone("各种立绘"),Contribution.Standalone("各种提示框"),Contribution.Standalone("校对 / 润色"),Contribution.Standalone("Bug/错别字报告"),Contribution.Standalone("抱怨"),Contribution.Standalone("很多东西")],[ContributionType
            .Coding,ContributionType.Contributions],null)],true);
            §§push(MainMenu);
            _loc3_ = [new CreditSection(ContributionType.Creator,"模组制作"),new CreditSection(ContributionType.Coding,"程序编写"),new CreditSection(ContributionType.Contributions,"内容创作"),new CreditSection(ContributionType.Bugs,"漏洞报告")];
            _loc9_ = new Credit("Aimozg",null,null,[ContributionType.Coding],null);
            _loc10_ = new Credit("Aloonie",null,[Contribution.Standalone("霜巨人遭遇战")],[ContributionType.Contributions],null);
            _loc11_ = new Credit("brrritssocold",null,null,[ContributionType.Coding],null);
            _loc14_ = new Credit("Coalsack",null,[Contribution.Standalone("红河根熊猫转化")],[ContributionType.Contributions],null);
            _loc17_ = new Credit("Donto",null,[Contribution.Standalone("遭遇雪人")],[ContributionType.Contributions],null);
            _loc18_ = new Credit("Fergusson951",null,null,[ContributionType.Coding],null);
            _loc19_ = new Credit("Foxling",null,[Contribution.Standalone("护肤精油与身体乳")],[ContributionType.Contributions],null);
            _loc5_ = ["16位立绘","阿玛洛克","阿瑞安","精液女巫","赫莉娅"];
            _loc6_ = _loc5_.shift();
            _loc12_ = ["8位立绘","阿玛洛克","阿瑞安","无脑荡妇苏菲","精液女巫","地精战士","地精萨满","小鬼军阀","小鬼霸主","狐妖（黑）","狐妖（金）","狐妖（红）","普莉希拉"];
            _loc13_ = _loc12_.shift();
            _loc20_ = new Credit("Foxwells",null,[Contribution.Standalone("遭遇阿玛洛克"),Contribution.Standalone("奇利·史密斯"),Contribution.Standalone("黑檀花与黑檀织物"),_loc6_ == null ? Contribution.Grouped("",_loc5_) : Contribution.Grouped(_loc6_,_loc5_),_loc13_ == null ? Contribution.Grouped("",_loc12_) : Contribution.Grouped(_loc13_,_loc12_),Contribution.Standalone("狼椒变形")],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc25_ = new Credit("Frogapus",null,[Contribution.Standalone("金皮鹿转化")],[ContributionType.Contributions],null);
            _loc38_ = new Credit("IxFa",null,[Contribution.Standalone("娜迦尾巴自慰")],[ContributionType.Contributions],null);
            _loc39_ = new Credit("Kinathis",null,[Contribution.Standalone("腐化的密涅瓦"),Contribution.Standalone("净化的密涅瓦")],[ContributionType.Contributions],null);
            _loc15_ = ["新物品","火铳","瓶装乌尔塔精液","避孕套","神圣树皮甲","龙心花","小恶魔头骨","莱西石","莱西石护甲","彩虹染料","牛头人药剂","冬日布丁"];
            _loc16_ = _loc15_.shift();
            _loc42_ = new Credit("Kitteh6660",null,[Contribution.Standalone("成就及其框架"),Contribution.Standalone("集市守门人战斗"),Contribution.Standalone("可建造的营地小屋"),Contribution.Standalone("可建造的营地围墙"),Contribution.Standalone("腐化玛莱战斗"),Contribution.Standalone("调试菜单"),Contribution.Standalone("DLC愚人节"),Contribution.Standalone("与传送门互动场景"),Contribution.Standalone("珠宝与功能"),Contribution.Standalone("特尔阿德雷的珠宝店"),Contribution.Standalone("奇哈的外貌"),Contribution.Standalone("奇哈穿着蜘蛛丝内衣"),Contribution.Standalone("变态与幸运初始特质"),Contribution.Standalone("玩家胡须"),Contribution.Standalone("普莉希拉"),Contribution.Standalone("大量提示信息"),Contribution.Standalone("玛布尔关于腐化玛莱之死的对话"),Contribution.Standalone("特尔阿德雷裁缝出售的新衣服"),_loc16_ == null ? Contribution.Grouped("",_loc15_) : Contribution.Grouped(_loc16_,_loc15_),Contribution.Standalone("在你的小屋里阅读伊兹玛的书"),Contribution.Standalone("真实、硬核与安全模式"),Contribution.Standalone("永远拒绝与菲拉做爱"),Contribution.Standalone("盾牌及其功能"),Contribution.Standalone("在溪流中游泳的场景"),Contribution.Standalone("内衣与功能"),Contribution.Standalone("从坏结局梦魇中醒来")
            ,Contribution.Standalone("守卫队营地日落场景")],[ContributionType.Creator,ContributionType.Coding,ContributionType.Contributions],null);
            _loc43_ = new Credit("Matraia",null,[Contribution.Standalone("小屋建造替换文本")],[ContributionType.Contributions],null);
            _loc78_ = new Credit("MissBlackthorne",null,[Contribution.Standalone("蛇怪之眼 转化"),Contribution.Standalone("本诺瓦扩展"),Contribution.Standalone("克洛维斯绵羊 转化"),Contribution.Standalone("鸡蛇"),Contribution.Standalone("爬虫之舌变形")],[ContributionType.Contributions],null);
            _loc79_ = new Credit("Ormael",null,[Contribution.Standalone("火蜥蜴烈酒变形")],[ContributionType.Contributions],null);
            _loc21_ = ["冰川裂谷","发现冰碎片","发现神之蜜酒","发现冰川裂谷","遭遇女武神"];
            _loc22_ = _loc21_.shift();
            _loc80_ = new Credit("Savin",null,[_loc22_ == null ? Contribution.Grouped("",_loc21_) : Contribution.Grouped(_loc22_,_loc21_)],[ContributionType.Contributions],null);
            _loc119_ = new Credit("QuietBrowser",null,[Contribution.Standalone("奇哈怀孕")],[ContributionType.Contributions],null);
            _loc122_ = new Credit("Stadler76",null,[Contribution.Standalone("蜘蛛之眼转化")],[ContributionType.Coding,ContributionType.Contributions],null);
            _loc133_ = new Credit("Stygs",null,[Contribution.Standalone("凯瑟琳的棕色、灰色、彩虹色、赤褐色和黄色染发剂")],[ContributionType.Contributions],null);
            _loc138_ = new Credit("Wedge Skyrocket",null,[Contribution.Standalone("狐妖祭司爱子")],[ContributionType.Contributions],null);
            _loc23_ = ["16位立绘","蚂蚁守卫","浴场女孩","布鲁克","布鲁克（裸体）","木匠","克拉拉","沙漠食尸鬼","埃德琳（怀孕）","石像鬼","海克尔","海克尔（裸体）","小恶魔群","象牙魅魔","乔伊","奇哈","凯莉","凯莉（怀孕）","乳胶粘液女孩","玛布尔（奶牛）","巴勃罗","不死鸟","不死鸟（裸体）","菲拉","拉斐尔","鲨鱼女孩","瓦莱丽亚","瓦普拉","维纳斯（扶他）","泽塔兹","泽塔兹（强壮）"];
            _loc24_ = _loc23_.shift();
            _loc26_ = ["8bit立绘","烬","菲拉"];
            _loc27_ = _loc26_.shift();
            §§pop()._revampConfig = new Credits(_loc3_,"Revamp 制作人员名单</u></font><font size=\"17\">\r\n(现称为非官方扩展版)</font><font><u>",null,[_loc9_,_loc10_,_loc11_,_loc14_,_loc17_,_loc18_,_loc19_,_loc20_,_loc25_,_loc38_,_loc39_,_loc42_,_loc43_,_loc78_,_loc79_,_loc80_,_loc119_,_loc122_,_loc133_,_loc138_,new Credit("Whimsalot",null,[_loc24_ == null ? Contribution.Grouped("",_loc23_) : Contribution.Grouped(_loc24_,_loc23_),_loc27_ == null ? Contribution.Grouped("",_loc26_) : Contribution.Grouped(_loc27_,_loc26_)],[ContributionType.Contributions],null),new Credit("worldofdrakan",null,[Contribution.Standalone("伪小恶魔巴勃罗"),Contribution.Standalone("猪尾松露 猪/野猪转化")],[ContributionType.Contributions],null),new Credit("Zeikfried",null,[Contribution.Standalone("伤痕之刃")],[ContributionType.Contributions],null),new Credit("Atlas1965",null,null,[ContributionType.Bugs],null),new Credit("Bsword",null,null,[ContributionType.Bugs],null),new Credit("Drake713",null,null,[ContributionType.Bugs],null),new Credit("Elitist",null,null
            ,[ContributionType.Bugs],null),new Credit("EternalDragon",null,null,[ContributionType.Bugs],null),new Credit("JDoraime",null,null,[ContributionType.Bugs],null),new Credit("kalleangka",null,null,[ContributionType.Bugs],null),new Credit("Netys",null,null,[ContributionType.Bugs],null),new Credit("NineRed",null,null,[ContributionType.Bugs],null),new Credit("OPenaz",null,null,[ContributionType.Bugs],null),new Credit("PowerOfVoid",null,null,[ContributionType.Bugs],null),new Credit("Ramses",null,null,[ContributionType.Bugs],null),new Credit("SirWolfie",null,null,[ContributionType.Bugs],null),new Credit("Sorenant",null,null,[ContributionType.Bugs],null),new Credit("stationpass",null,null,[ContributionType.Bugs],null),new Credit("sworve",null,null,[ContributionType.Bugs],null),new Credit("tadams857",null,null,[ContributionType.Bugs],null),new Credit("Wastarce",null,null,[ContributionType.Bugs],null)],null);
         }
         if(!MasteryType.init__)
         {
            MasteryType.init__ = true;
            MasteryType.MASTERY_LIBRARY = new StringMap();
         }
         if(!MasteryLib.init__)
         {
            MasteryLib.init__ = true;
            MasteryLib.Tease = new MasteryType("Tease","Tease","General","Tease mastery");
            MasteryLib.Shield = new ShieldMastery();
            MasteryLib.Casting = new CastingMastery();
            MasteryLib.TerrestrialFire = new TerrestrialFireMastery();
            MasteryLib.Fist = new FistMastery();
            MasteryLib.Claw = new ClawMastery();
            MasteryLib.Bow = new BowMastery();
            MasteryLib.Sword1H = new WeaponMastery("1H Sword","1H Sword","One-handed sword mastery");
            MasteryLib.Sword2H = new WeaponMastery("2H Sword","2H Sword","Two-handed sword mastery");
            MasteryLib.Knife = new WeaponMastery("Knife","Knife","Knife mastery");
            MasteryLib.Blunt1H = new WeaponMastery("1H Blunt","1H Blunt","One-handed blunt weapon mastery");
            MasteryLib.Blunt2H = new WeaponMastery("2H Blunt","2H Blunt","Two-handed blunt weapon mastery");
            MasteryLib.Spear = new WeaponMastery("Spear","Spear","Spear mastery");
            MasteryLib.Axe = new WeaponMastery("Axe","Axe","Axe mastery");
            MasteryLib.Staff = new WeaponMastery("Staff","Staff","Melee staff mastery");
            MasteryLib.Polearm = new WeaponMastery("Polearm","Polearm","Polearm mastery");
            MasteryLib.Scythe = new WeaponMastery("Scythe","Scythe","Scythe mastery");
            MasteryLib.Whip = new WeaponMastery("Whip","Whip","Whip mastery");
            MasteryLib.Crossbow = new WeaponMastery("Crossbow","Crossbow","Crossbow mastery");
            MasteryLib.Firearm = new WeaponMastery("Firearm","Firearm","Firearm mastery");
            MasteryLib.Gathering = new MasteryType("Gathering","Gathering","Crafting","");
            MasteryLib.BasicCrafting = new MasteryType("Basic Crafting","Basic Crafting","Crafting","");
            MasteryLib.Alchemy = new MasteryType("Alchemy","Alchemy","Crafting","");
            MasteryLib.Cooking = new MasteryType("Cooking","Cooking","Crafting","");
            MasteryLib.Weaponcrafting = new MasteryType("Weaponcrafting","Weaponcrafting","Crafting","");
            MasteryLib.Armorcrafting = new MasteryType("Armorcrafting","Armorcrafting","Crafting","");
            MasteryLib.Enchantment = new MasteryType("Enchantment","Enchantment","Crafting","");
            MasteryLib.Constructs = new MasteryType("Constructs","Constructs","Crafting","");
            MasteryLib.MASTERY_GENERAL = [MasteryLib.Tease,MasteryLib.Shield,MasteryLib.Casting,MasteryLib.TerrestrialFire];
            MasteryLib.MASTERY_WEAPONS = [MasteryLib.Fist,MasteryLib.Claw,MasteryLib.Bow,MasteryLib.Sword1H,MasteryLib.Sword2H,MasteryLib.Knife,MasteryLib.Blunt1H,MasteryLib.Blunt2H,MasteryLib.Spear,MasteryLib.Axe,MasteryLib.Staff,MasteryLib.Polearm,MasteryLib.Scythe,MasteryLib.Whip,MasteryLib.Crossbow,MasteryLib.Firearm];
            MasteryLib.MASTERY_CRAFTING = [MasteryLib.Gathering,MasteryLib.BasicCrafting,MasteryLib.Alchemy,MasteryLib.Cooking,MasteryLib.Weaponcrafting,MasteryLib.Armorcrafting,MasteryLib.Enchantment,MasteryLib.Constructs];
         }
         if(!Output.init__)
         {
            Output.init__ = true;
            Output._instance = new Output();
         }
         if(!PerkType.init__)
         {
            PerkType.init__ = true;
            PerkType.PERK_LIBRARY = new StringMap();
         }
         if(!StatusEffectType.init__)
         {
            StatusEffectType.init__ = true;
            StatusEffectType.STATUSAFFECT_LIBRARY = new StringMap();
         }
         if(!AkbalSpeedDebuff.init__)
         {
            AkbalSpeedDebuff.init__ = true;
            AkbalSpeedDebuff.TYPE = StatusEffect.register("Akbal Speed",AkbalSpeedDebuff);
         }
         if(!AmilyVenomDebuff.init__)
         {
            AmilyVenomDebuff.init__ = true;
            AmilyVenomDebuff.TYPE = StatusEffect.register("Amily Venom",AmilyVenomDebuff);
         }
         if(!AnemoneVenomDebuff.init__)
         {
            AnemoneVenomDebuff.init__ = true;
            AnemoneVenomDebuff.TYPE = StatusEffect.register("Anemone Venom",AnemoneVenomDebuff);
         }
         if(!AttractedDebuff.init__)
         {
            AttractedDebuff.init__ = true;
            AttractedDebuff.TYPE = StatusEffect.register("Attracted",AttractedDebuff);
         }
         if(!BackstabBuff.init__)
         {
            BackstabBuff.init__ = true;
            BackstabBuff.TYPE = StatusEffect.register("Backstab",BackstabBuff);
         }
         if(!BasiliskSlowDebuff.init__)
         {
            BasiliskSlowDebuff.init__ = true;
            BasiliskSlowDebuff.TYPE = StatusEffect.register("BasiliskSlow",BasiliskSlowDebuff);
         }
         if(!BerserkBuff.init__)
         {
            BerserkBuff.init__ = true;
            BerserkBuff.TYPE = StatusEffect.register("Berserking",BerserkBuff);
         }
         if(!BrawlerStanceBuff.init__)
         {
            BrawlerStanceBuff.init__ = true;
            BrawlerStanceBuff.TYPE = StatusEffect.register("Brawler Stance",BrawlerStanceBuff);
         }
         if(!BrutalBlowsDebuff.init__)
         {
            BrutalBlowsDebuff.init__ = true;
            BrutalBlowsDebuff.TYPE = StatusEffect.register("Brutal Blows",BrutalBlowsDebuff);
         }
         if(!CalledShotDebuff.init__)
         {
            CalledShotDebuff.init__ = true;
            CalledShotDebuff.TYPE = StatusEffect.register("Called Shot",CalledShotDebuff);
         }
         if(!ChantedDebuff.init__)
         {
            ChantedDebuff.init__ = true;
            ChantedDebuff.TYPE = StatusEffect.register("Chanted",ChantedDebuff);
         }
         if(!ChargeWeaponBuff.init__)
         {
            ChargeWeaponBuff.init__ = true;
            ChargeWeaponBuff.TYPE = StatusEffect.register("Charge Weapon",ChargeWeaponBuff);
         }
         if(!CirceScimitarBuff.init__)
         {
            CirceScimitarBuff.init__ = true;
            CirceScimitarBuff.TYPE = StatusEffect.register("CirceScimitarBuff",CirceScimitarBuff);
         }
         if(!ClawStanceBuff.init__)
         {
            ClawStanceBuff.init__ = true;
            ClawStanceBuff.TYPE = StatusEffect.register("Claw Stance",ClawStanceBuff);
         }
         if(!TargetMarked.init__)
         {
            TargetMarked.init__ = true;
            TargetMarked.TYPE = StatusEffect.register("TargetMarked",TargetMarked);
         }
         if(!ConstrictedDebuff.init__)
         {
            ConstrictedDebuff.init__ = true;
            ConstrictedDebuff.TYPE = StatusEffect.register("Constricted",TargetMarked);
         }
         if(!CounterABStatus.init__)
         {
            CounterABStatus.init__ = true;
            CounterABStatus.TYPE = StatusEffect.register("Revengeance",CounterABStatus);
         }
         if(!DeafeningBuzz.init__)
         {
            DeafeningBuzz.init__ = true;
            DeafeningBuzz.TYPE = StatusEffect.register("Deafening Buzz",DeafeningBuzz);
         }
         if(!DivineWindBuff.init__)
         {
            DivineWindBuff.init__ = true;
            DivineWindBuff.TYPE = StatusEffect.register("DivineWind",DivineWindBuff);
         }
         if(!DodgedAttackBuff.init__)
         {
            DodgedAttackBuff.init__ = true;
            DodgedAttackBuff.TYPE = StatusEffect.register("Dodged Attack",DodgedAttackBuff);
         }
         if(!DriderIncubusVenomDebuff.init__)
         {
            DriderIncubusVenomDebuff.init__ = true;
            DriderIncubusVenomDebuff.TYPE = StatusEffect.register("Drider Incubus Venom",DriderIncubusVenomDebuff);
         }
         if(!FrogPoisonDebuff.init__)
         {
            FrogPoisonDebuff.init__ = true;
            FrogPoisonDebuff.TYPE = StatusEffect.register("Frog Poison",FrogPoisonDebuff);
         }
         if(!FrostbiteDebuff.init__)
         {
            FrostbiteDebuff.init__ = true;
            FrostbiteDebuff.TYPE = StatusEffect.register("Frostbite",FrostbiteDebuff);
         }
         if(!GardenerSapSpeedDebuff.init__)
         {
            GardenerSapSpeedDebuff.init__ = true;
            GardenerSapSpeedDebuff.TYPE = StatusEffect.register("Sap Speed",GardenerSapSpeedDebuff);
         }
         if(!CombatBonusStatBuff.init__)
         {
            CombatBonusStatBuff.init__ = true;
            CombatBonusStatBuff.TYPE = StatusEffect.register("Combat BonusStat Buff",CombatBonusStatBuff);
         }
         if(!CombatInteBuff.init__)
         {
            CombatInteBuff.init__ = true;
            CombatInteBuff.TYPE = StatusEffect.register("Combat Inte Buff",CombatInteBuff);
         }
         if(!CombatSpeBuff.init__)
         {
            CombatSpeBuff.init__ = true;
            CombatSpeBuff.TYPE = StatusEffect.register("Combat Spe Buff",CombatSpeBuff);
         }
         if(!CombatStrBuff.init__)
         {
            CombatStrBuff.init__ = true;
            CombatStrBuff.TYPE = StatusEffect.register("Combat Str Buff",CombatStrBuff);
         }
         if(!CombatTouBuff.init__)
         {
            CombatTouBuff.init__ = true;
            CombatTouBuff.TYPE = StatusEffect.register("Combat Tou Buff",CombatTouBuff);
         }
         if(!GiantStrLossDebuff.init__)
         {
            GiantStrLossDebuff.init__ = true;
            GiantStrLossDebuff.TYPE = StatusEffect.register("GiantStrLoss",GiantStrLossDebuff);
         }
         if(!Exhaustion.init__)
         {
            Exhaustion.init__ = true;
            Exhaustion.TYPE = StatusEffect.register("Exhaustion",Exhaustion);
         }
         if(!GnollSpearDebuff.init__)
         {
            GnollSpearDebuff.init__ = true;
            GnollSpearDebuff.TYPE = StatusEffect.register("Gnoll Spear",GnollSpearDebuff);
         }
         if(!GroundPoundDebuff.init__)
         {
            GroundPoundDebuff.init__ = true;
            GroundPoundDebuff.TYPE = StatusEffect.register("Groundpound",GroundPoundDebuff);
         }
         if(!IzumiPipeSmoke.init__)
         {
            IzumiPipeSmoke.init__ = true;
            IzumiPipeSmoke.TYPE = StatusEffect.register("IzumiPipeSmoke",IzumiPipeSmoke);
         }
         if(!LeechBuff.init__)
         {
            LeechBuff.init__ = true;
            LeechBuff.TYPE = StatusEffect.register("LeechBuff",LeechBuff);
         }
         if(!LizanBlowpipeDebuff.init__)
         {
            LizanBlowpipeDebuff.init__ = true;
            LizanBlowpipeDebuff.TYPE = StatusEffect.register("Lizan Blowpipe",LizanBlowpipeDebuff);
         }
         if(!LurkBuff.init__)
         {
            LurkBuff.init__ = true;
            LurkBuff.TYPE = StatusEffect.register("Lurk",LurkBuff);
         }
         if(!LustserkBuff.init__)
         {
            LustserkBuff.init__ = true;
            LustserkBuff.TYPE = StatusEffect.register("Lustserking",LustserkBuff);
         }
         if(!MermaidWateredDebuff.init__)
         {
            MermaidWateredDebuff.init__ = true;
            MermaidWateredDebuff.TYPE = StatusEffect.register("MermaidDehydrated",MermaidWateredDebuff);
         }
         if(!MermaidWateredBuff.init__)
         {
            MermaidWateredBuff.init__ = true;
            MermaidWateredBuff.TYPE = StatusEffect.register("MermaidWatered",MermaidWateredBuff);
         }
         if(!MonkStanceBuff.init__)
         {
            MonkStanceBuff.init__ = true;
            MonkStanceBuff.TYPE = StatusEffect.register("Monk Stance",MonkStanceBuff);
         }
         if(!MothPheromones.init__)
         {
            MothPheromones.init__ = true;
            MothPheromones.TYPE = StatusEffect.register("Moth Pheromones",MothPheromones);
         }
         if(!NagaBiteDebuff.init__)
         {
            NagaBiteDebuff.init__ = true;
            NagaBiteDebuff.TYPE = StatusEffect.register("Naga Bite",NagaBiteDebuff);
         }
         if(!NagaVenomDebuff.init__)
         {
            NagaVenomDebuff.init__ = true;
            NagaVenomDebuff.TYPE = StatusEffect.register("Naga Venom",NagaVenomDebuff);
         }
         if(!NephilaSlowDebuff.init__)
         {
            NephilaSlowDebuff.init__ = true;
            NephilaSlowDebuff.TYPE = StatusEffect.register("NephilaSlow",NephilaSlowDebuff);
         }
         if(!OnFireDebuff.init__)
         {
            OnFireDebuff.init__ = true;
            OnFireDebuff.TYPE = StatusEffect.register("On Fire",OnFireDebuff);
         }
         if(!ParalyzeVenomDebuff.init__)
         {
            ParalyzeVenomDebuff.init__ = true;
            ParalyzeVenomDebuff.TYPE = StatusEffect.register("paralyze venom",ParalyzeVenomDebuff);
         }
         if(!PermaFly.init__)
         {
            PermaFly.init__ = true;
            PermaFly.TYPE = StatusEffect.register("Permanent Flying",PermaFly);
         }
         if(!RetributionBuff.init__)
         {
            RetributionBuff.init__ = true;
            RetributionBuff.TYPE = StatusEffect.register("RetributionBuff",RetributionBuff);
         }
         if(!ScorpionBlind.init__)
         {
            ScorpionBlind.init__ = true;
            ScorpionBlind.TYPE = StatusEffect.register("Scorpion Blind",ScorpionBlind);
         }
         if(!ScorpionVenom.init__)
         {
            ScorpionVenom.init__ = true;
            ScorpionVenom.TYPE = StatusEffect.register("Scorpion Venom",ScorpionVenom);
         }
         if(!SeverTendonsDebuff.init__)
         {
            SeverTendonsDebuff.init__ = true;
            SeverTendonsDebuff.TYPE = StatusEffect.register("Sever Tendons",SeverTendonsDebuff);
         }
         if(!StimulatingAuraDebuff.init__)
         {
            StimulatingAuraDebuff.init__ = true;
            StimulatingAuraDebuff.TYPE = StatusEffect.register("Stimulating Aura",StimulatingAuraDebuff);
         }
         if(!TFGeodeKnuckleBuff.init__)
         {
            TFGeodeKnuckleBuff.init__ = true;
            TFGeodeKnuckleBuff.TYPE = StatusEffect.register("Geode Knuckle",TFGeodeKnuckleBuff);
         }
         if(!TFInflameBuff.init__)
         {
            TFInflameBuff.init__ = true;
            TFInflameBuff.TYPE = StatusEffect.register("Inflame",TFInflameBuff);
         }
         if(!TFQuakeBuff.init__)
         {
            TFQuakeBuff.init__ = true;
            TFQuakeBuff.TYPE = StatusEffect.register("Quake",TFQuakeBuff);
         }
         if(!TFScorchBuff.init__)
         {
            TFScorchBuff.init__ = true;
            TFScorchBuff.TYPE = StatusEffect.register("Scorch",TFScorchBuff);
         }
         if(!TFShellBuff.init__)
         {
            TFShellBuff.init__ = true;
            TFShellBuff.TYPE = StatusEffect.register("Stone Shell",TFShellBuff);
         }
         if(!TFTerraCoreBuff.init__)
         {
            TFTerraCoreBuff.init__ = true;
            TFTerraCoreBuff.TYPE = StatusEffect.register("Terrestrial Core",TFTerraCoreBuff);
         }
         if(!TerraStarBuff.init__)
         {
            TerraStarBuff.init__ = true;
            TerraStarBuff.TYPE = StatusEffect.register("Terrestrial Star",TerraStarBuff);
         }
         if(!TerraStarCooldown.init__)
         {
            TerraStarCooldown.init__ = true;
            TerraStarCooldown.TYPE = StatusEffect.register("Terrestrial Star Cooldown",TerraStarCooldown);
         }
         if(!TerraStarDebuff.init__)
         {
            TerraStarDebuff.init__ = true;
            TerraStarDebuff.TYPE = StatusEffect.register("Terrestrial Star Debuff",TerraStarDebuff);
         }
         if(!TellyVisedStatus.init__)
         {
            TellyVisedStatus.init__ = true;
            TellyVisedStatus.TYPE = StatusEffect.register("TellyVisedStatus",TellyVisedStatus);
         }
         if(!TranquilBlessing.init__)
         {
            TranquilBlessing.init__ = true;
            TranquilBlessing.TYPE = StatusEffect.register("TranquilBlessing",TranquilBlessing);
         }
         if(!Tripped.init__)
         {
            Tripped.init__ = true;
            Tripped.TYPE = StatusEffect.register("Tripped",Tripped);
         }
         if(!TrueParryBuff.init__)
         {
            TrueParryBuff.init__ = true;
            TrueParryBuff.TYPE = StatusEffect.register("TrueParry",TrueParryBuff);
         }
         if(!WhisperedDebuff.init__)
         {
            WhisperedDebuff.init__ = true;
            WhisperedDebuff.TYPE = StatusEffect.register("Whispered",WhisperedDebuff);
         }
         if(!WebDebuff.init__)
         {
            WebDebuff.init__ = true;
            WebDebuff.TYPE = StatusEffect.register("Web",WebDebuff);
         }
         if(!WitheringDebuff.init__)
         {
            WitheringDebuff.init__ = true;
            WitheringDebuff.TYPE = StatusEffect.register("WitheringDebuff",WitheringDebuff);
         }
         if(!KitsuneVision.init__)
         {
            KitsuneVision.init__ = true;
            KitsuneVision.TYPE = StatusEffect.register("KitsuneVision",KitsuneVision);
         }
         if(!StatusEffects.init__)
         {
            StatusEffects.init__ = true;
            StatusEffects.AllNaturalOnaholeUsed = StatusEffects.mk("all-natural onahole used");
            StatusEffects.AnemoneArousal = StatusEffects.mk("Anemone Arousal");
            StatusEffects.BimboChampagne = StatusEffects.mk("Bimbo Champagne");
            StatusEffects.Birthed = StatusEffects.mk("Birthed");
            StatusEffects.BirthedImps = StatusEffects.mk("Birthed Imps");
            StatusEffects.BlackCatBeer = StatusEffects.mk("Black Cat Beer");
            StatusEffects.BlackNipples = StatusEffects.mk("Black Nipples");
            StatusEffects.BlowjobOn = StatusEffects.mk("BlowjobOn");
            StatusEffects.BoatDiscovery = StatusEffects.mk("Boat Discovery");
            StatusEffects.BonusACapacity = StatusEffects.mk("Bonus aCapacity");
            StatusEffects.BonusVCapacity = StatusEffects.mk("Bonus vCapacity");
            StatusEffects.BottledMilk = StatusEffects.mk("Bottled Milk");
            StatusEffects.BreastsMilked = StatusEffects.mk("Breasts Milked");
            StatusEffects.BSwordBroken = StatusEffects.mk("BSwordBroken");
            StatusEffects.ButtStretched = StatusEffects.mk("ButtStretched");
            StatusEffects.CampAnemoneTrigger = StatusEffects.mk("Camp Anemone Trigger");
            StatusEffects.CampMarble = StatusEffects.mk("Camp Marble");
            StatusEffects.ClaraCombatRounds = StatusEffects.mk("Clara Combat Rounds");
            StatusEffects.ClaraFoughtInCamp = StatusEffects.mk("Clara Fought In Camp");
            StatusEffects.CockPumped = StatusEffects.mk("Cock Pumped");
            StatusEffects.Contraceptives = StatusEffects.mk("Contraceptives");
            StatusEffects.DefenseCanopy = StatusEffects.mk("Defense: Canopy");
            StatusEffects.DeluxeOnaholeUsed = StatusEffects.mk("deluxe onahole used");
            StatusEffects.DogWarning = StatusEffects.mk("dog warning");
            StatusEffects.DragonBreathBoost = StatusEffects.mk("Dragon Breath Boost");
            StatusEffects.DragonBreathCooldown = StatusEffects.mk("Dragon Breath Cooldown");
            StatusEffects.Dysfunction = StatusEffects.mk("dysfunction");
            StatusEffects.Edryn = StatusEffects.mk("Edryn");
            StatusEffects.Eggchest = StatusEffects.mk("eggchest");
            StatusEffects.Eggs = StatusEffects.mk("eggs");
            StatusEffects.EmberFuckCooldown = StatusEffects.mk("ember fuck cooldown");
            StatusEffects.EmberNapping = StatusEffects.mk("Ember Napping");
            StatusEffects.EverRapedJojo = StatusEffects.mk("Ever Raped Jojo");
            StatusEffects.Exgartuan = StatusEffects.mk("Exgartuan");
            StatusEffects.ExploredDeepwoods = StatusEffects.mk("exploredDeepwoods");
            StatusEffects.FaerieFemFuck = StatusEffects.mk("Faerie Fem Fuck");
            StatusEffects.FaerieFucked = StatusEffects.mk("Faerie Fucked");
            StatusEffects.FappedGenderless = StatusEffects.mk("fapped genderless");
            StatusEffects.Feeder = StatusEffects.mk("Feeder");
            StatusEffects.Fertilized = StatusEffects.mk("Fertilized");
            StatusEffects.FetishOn = StatusEffects.mk("fetishON");
            StatusEffects.FuckedMarble = StatusEffects.mk("FuckedMarble");
            StatusEffects.GlobalFatigue = Exhaustion.TYPE;
            StatusEffects.GooStuffed = StatusEffects.mk("gooStuffed");
            StatusEffects.Groundpound = GroundPoundDebuff.TYPE;
            StatusEffects.HairdresserMeeting = StatusEffects.mk("hairdresser meeting");
            StatusEffects.Hangover = StatusEffects.mk("Hangover");
            StatusEffects.Heat = StatusEffects.mk("heat");
            StatusEffects.HorseWarning = StatusEffects.mk("horse warning");
            StatusEffects.ImpGangBang = StatusEffects.mk("Imp GangBang");
            StatusEffects.Infested = StatusEffects.mk("infested");
            StatusEffects.IzumisPipeSmoke = IzumiPipeSmoke.TYPE;
            StatusEffects.Jizzpants = StatusEffects.mk("Jizzpants");
            StatusEffects.JojoMeditationCount = StatusEffects.mk("Jojo Meditation Count");
            StatusEffects.JojoNightWatch = StatusEffects.mk("JojoNightWatch");
            StatusEffects.JojoTFOffer = StatusEffects.mk("JojoTFOffer");
            StatusEffects.Kelt = StatusEffects.mk("Kelt");
            StatusEffects.KeltBJ = StatusEffects.mk("KeltBJ");
            StatusEffects.KeltBadEndWarning = StatusEffects.mk("Kelt Bad End Warning");
            StatusEffects.KeltOff = StatusEffects.mk("KeltOff");
            StatusEffects.kitsuneVision = KitsuneVision.TYPE;
            StatusEffects.KnowsArouse = StatusEffects.mk("Knows Arouse");
            StatusEffects.KnowsBlind = StatusEffects.mk("Knows Blind");
            StatusEffects.KnowsCharge = StatusEffects.mk("Knows Charge");
            StatusEffects.KnowsHeal = StatusEffects.mk("Knows Heal");
            StatusEffects.KnowsMight = StatusEffects.mk("Knows Might");
            StatusEffects.KnowsWhitefire = StatusEffects.mk("Knows Whitefire");
            StatusEffects.KnowsTKBlast = StatusEffects.mk("Knows TK Blast");
            StatusEffects.KnowsBlackfire = StatusEffects.mk("Knows Blackfire");
            StatusEffects.KnowsLeech = StatusEffects.mk("Knows Leech");
            StatusEffects.KnowsSoulburst = StatusEffects.mk("Knows Soulburst");
            StatusEffects.KnowsWither = StatusEffects.mk("Knows Wither");
            StatusEffects.KnowsCSS = StatusEffects.mk("Knows Circe\'s Summoned Scimitars");
            StatusEffects.KnowsDivineWind = StatusEffects.mk("Knows Divine Wind");
            StatusEffects.LactationEndurance = StatusEffects.mk("Lactation Endurance");
            StatusEffects.LactationReduction = StatusEffects.mk("Lactation Reduction");
            StatusEffects.LactationReduc0 = StatusEffects.mk("Lactation Reduc0");
            StatusEffects.LactationReduc1 = StatusEffects.mk("Lactation Reduc1");
            StatusEffects.LactationReduc2 = StatusEffects.mk("Lactation Reduc2");
            StatusEffects.LactationReduc3 = StatusEffects.mk("Lactation Reduc3");
            StatusEffects.LootEgg = StatusEffects.mk("lootEgg");
            StatusEffects.Luststick = StatusEffects.mk("Luststick");
            StatusEffects.LustStickApplied = StatusEffects.mk("Lust Stick Applied");
            StatusEffects.LustyTongue = StatusEffects.mk("LustyTongue");
            StatusEffects.MalonVisitedPostAddiction = StatusEffects.mk("Malon Visited Post Addiction");
            StatusEffects.Marble = StatusEffects.mk("Marble");
            StatusEffects.MarbleHasItem = StatusEffects.mk("MarbleHasItem");
            StatusEffects.MarbleItemCooldown = StatusEffects.mk("MarbleItemCooldown");
            StatusEffects.MarbleRapeAttempted = StatusEffects.mk("Marble Rape Attempted");
            StatusEffects.MarblesMilk = StatusEffects.mk("Marbles Milk");
            StatusEffects.MarbleSpecials = StatusEffects.mk("MarbleSpecials");
            StatusEffects.MarbleWithdrawl = StatusEffects.mk("MarbleWithdrawl");
            StatusEffects.MeanToNaga = StatusEffects.mk("MeanToNaga");
            StatusEffects.MeetWanderer = StatusEffects.mk("meet wanderer");
            StatusEffects.MetWorms = StatusEffects.mk("metWorms");
            StatusEffects.MetWhitney = StatusEffects.mk("Met Whitney");
            StatusEffects.Milked = StatusEffects.mk("Milked");
            StatusEffects.MinoPlusCowgirl = StatusEffects.mk("Mino + Cowgirl");
            StatusEffects.Naga = StatusEffects.mk("Naga");
            StatusEffects.NakedOn = StatusEffects.mk("NakedOn");
            StatusEffects.NoJojo = StatusEffects.mk("noJojo");
            StatusEffects.NoMoreMarble = StatusEffects.mk("No More Marble");
            StatusEffects.Oswald = StatusEffects.mk("Oswald");
            StatusEffects.ParasiteSlug = StatusEffects.mk("infected by slug parasite");
            StatusEffects.ParasiteSlugReproduction = StatusEffects.mk("slug parasite reproducing");
            StatusEffects.ParasiteSlugMet = StatusEffects.mk("met a parasite in the bog");
            StatusEffects.ParasiteSlugMatureDay = StatusEffects.mk("sets a delay before parasite can reproduce after maturing");
            StatusEffects.ParasiteEel = StatusEffects.mk("infected by eel parasite");
            StatusEffects.ParasiteEelNeedCum = StatusEffects.mk("ParasiteEel needs specific cum");
            StatusEffects.PlainOnaholeUsed = StatusEffects.mk("plain onahole used");
            StatusEffects.PhoukaWhiskeyAffect = StatusEffects.mk("PhoukaWhiskeyAffect");
            StatusEffects.PostAkbalSubmission = StatusEffects.mk("Post Akbal Submission");
            StatusEffects.PostAnemoneBeatdown = StatusEffects.mk("Post Anemone Beatdown");
            StatusEffects.PureCampJojo = StatusEffects.mk("PureCampJojo");
            StatusEffects.RepeatSuccubi = StatusEffects.mk("repeatSuccubi");
            StatusEffects.Rut = StatusEffects.mk("rut");
            StatusEffects.SharkGirl = StatusEffects.mk("Shark-Girl");
            StatusEffects.SlimeCraving = StatusEffects.mk("Slime Craving");
            StatusEffects.SlimeCravingFeed = StatusEffects.mk("Slime Craving Feed");
            StatusEffects.SlimeCravingOutput = StatusEffects.mk("Slime Craving Output");
            StatusEffects.SuccubiNight = StatusEffects.mk("succubiNight");
            StatusEffects.Tamani = StatusEffects.mk("Tamani");
            StatusEffects.TelAdre = StatusEffects.mk("Tel\'Adre");
            StatusEffects.TellyVised = TellyVisedStatus.TYPE;
            StatusEffects.TempleBlessing = TranquilBlessing.TYPE;
            StatusEffects.TentacleBadEndCounter = StatusEffects.mk("TentacleBadEndCounter");
            StatusEffects.TentacleJojo = StatusEffects.mk("Tentacle Jojo");
            StatusEffects.TensionReleased = StatusEffects.mk("TensionReleased");
            StatusEffects.MermaidWatered = MermaidWateredBuff.TYPE;
            StatusEffects.MermaidDehydrated = MermaidWateredDebuff.TYPE;
            StatusEffects.TF2 = StatusEffects.mk("TF2");
            StatusEffects.TookBlessedSword = StatusEffects.mk("Took Blessed Sword");
            StatusEffects.ParasiteNephila = StatusEffects.mk("infected by nephila parasite");
            StatusEffects.ParasiteNephilaNeedCum = StatusEffects.mk("ParasiteNephila needs specific cum");
            StatusEffects.UmasMassage = StatusEffects.mk("Uma\'s Massage");
            StatusEffects.Uniball = StatusEffects.mk("Uniball");
            StatusEffects.UsedNaturalSelfStim = StatusEffects.mk("used natural self-stim");
            StatusEffects.used_self_dash_stim = StatusEffects.mk("used self-stim");
            StatusEffects.Victoria = StatusEffects.mk("Victoria");
            StatusEffects.VoluntaryDemonpack = StatusEffects.mk("Voluntary Demonpack");
            StatusEffects.WormOffer = StatusEffects.mk("WormOffer");
            StatusEffects.WormPlugged = StatusEffects.mk("worm plugged");
            StatusEffects.WandererDemon = StatusEffects.mk("wanderer demon");
            StatusEffects.WandererHuman = StatusEffects.mk("wanderer human");
            StatusEffects.Yara = StatusEffects.mk("Yara");
            StatusEffects.Attacks = StatusEffects.mk("attacks");
            StatusEffects.BowDisabled = StatusEffects.mk("Bow Disabled",CombatStatusEffect);
            StatusEffects.Concentration = StatusEffects.mk("Concentration");
            StatusEffects.Constricted = ConstrictedDebuff.TYPE;
            StatusEffects.CoonWhip = StatusEffects.mk("Coon Whip");
            StatusEffects.Drunk = StatusEffects.mk("Drunk");
            StatusEffects.Earthshield = StatusEffects.mk("Earthshield");
            StatusEffects.Fear = StatusEffects.mk("Fear");
            StatusEffects.GenericRunDisabled = StatusEffects.mk("Generic Run Disabled");
            StatusEffects.Illusion = StatusEffects.mk("Illusion");
            StatusEffects.ImpUber = StatusEffects.mk("ImpUber");
            StatusEffects.Level = StatusEffects.mk("level");
            StatusEffects.KitsuneFight = StatusEffects.mk("Kitsune Fight");
            StatusEffects.LethicesRapeTentacles = StatusEffects.mk("Lethices Rape Tentacles",CombatStatusEffect);
            StatusEffects.LustAura = StatusEffects.mk("Lust Aura");
            StatusEffects.LustStick = StatusEffects.mk("LustStick");
            StatusEffects.Milk = StatusEffects.mk("milk");
            StatusEffects.MilkyUrta = StatusEffects.mk("Milky Urta");
            StatusEffects.MinoMilk = StatusEffects.mk("Mino Milk");
            StatusEffects.MinotaurEntangled = StatusEffects.mk("Minotaur Entangled");
            StatusEffects.NoLoot = StatusEffects.mk("No Loot");
            StatusEffects.OnFire = OnFireDebuff.TYPE;
            StatusEffects.PCTailTangle = StatusEffects.mk("PCTailTangle");
            StatusEffects.QueenBind = StatusEffects.mk("QueenBind");
            StatusEffects.AikoLustPrank = StatusEffects.mk("Aiko sex prank");
            StatusEffects.GenericCombatStrBuff = CombatStrBuff.TYPE;
            StatusEffects.GenericCombatSpeBuff = CombatSpeBuff.TYPE;
            StatusEffects.GenericCombatTouBuff = CombatTouBuff.TYPE;
            StatusEffects.GenericCombatInteBuff = CombatInteBuff.TYPE;
            StatusEffects.GenericBonusStatBuff = CombatBonusStatBuff.TYPE;
            StatusEffects.AcidSlap = StatusEffects.mk("Acid Slap",CombatStatusEffect);
            StatusEffects.AkbalSpeed = AkbalSpeedDebuff.TYPE;
            StatusEffects.AkbalFlameDebuff = StatusEffects.mk("Akbal Flame Debuff",CombatStatusEffect);
            StatusEffects.AkbalFireUsed = StatusEffects.mk("AkbalFireUsed",CombatStatusEffect);
            StatusEffects.AkbalHealUsed = StatusEffects.mk("AkbalHealUsed",CombatStatusEffect);
            StatusEffects.AmilyVenom = AmilyVenomDebuff.TYPE;
            StatusEffects.AnemoneVenom = AnemoneVenomDebuff.TYPE;
            StatusEffects.ArmorRent = StatusEffects.mk("Armor Rent",CombatStatusEffect);
            StatusEffects.Apotheosis = StatusEffects.mk("Exponential spell power, exponentially less HP",CombatStatusEffect);
            StatusEffects.Attracted = AttractedDebuff.TYPE;
            StatusEffects.AttackDisabled = StatusEffects.mk("Attack Disabled",CombatStatusEffect);
            StatusEffects.BasiliskCompulsion = StatusEffects.mk("Basilisk Compulsion",CombatStatusEffect);
            StatusEffects.BasiliskSlow = BasiliskSlowDebuff.TYPE;
            StatusEffects.Berserking = BerserkBuff.TYPE;
            StatusEffects.Blind = StatusEffects.mk("Blind",CombatStatusEffect);
            StatusEffects.Bound = StatusEffects.mk("Bound",CombatStatusEffect);
            StatusEffects.CalledShot = CalledShotDebuff.TYPE;
            StatusEffects.ChargeWeapon = ChargeWeaponBuff.TYPE;
            StatusEffects.Chokeslam = StatusEffects.mk("Chokeslam",CombatStatusEffect);
            StatusEffects.CirceSummonedScimitar = CirceScimitarBuff.TYPE;
            StatusEffects.Confusion = StatusEffects.mk("Confusion",CombatStatusEffect);
            StatusEffects.DemonSeed = StatusEffects.mk("DemonSeed",CombatStatusEffect);
            StatusEffects.CorrWitchBind = StatusEffects.mk("Corrupted Witch headlock",CombatStatusEffect);
            StatusEffects.Disarmed = StatusEffects.mk("Disarmed");
            StatusEffects.DriderKiss = StatusEffects.mk("Drider Kiss",CombatStatusEffect);
            StatusEffects.EmpathicAgony = StatusEffects.mk("Emphatic Agony",CombatStatusEffect);
            StatusEffects.CounterAB = CounterABStatus.TYPE;
            StatusEffects.FirstAttack = StatusEffects.mk("FirstAttack",CombatStatusEffect);
            StatusEffects.Frostbite = FrostbiteDebuff.TYPE;
            StatusEffects.GiantBoulder = StatusEffects.mk("Giant Boulder",CombatStatusEffect);
            StatusEffects.GiantGrabbed = StatusEffects.mk("Giant Grabbed",CombatStatusEffect);
            StatusEffects.GiantStrLoss = GiantStrLossDebuff.TYPE;
            StatusEffects.GnollSpear = GnollSpearDebuff.TYPE;
            StatusEffects.Grappled = StatusEffects.mk("Grappled",CombatStatusEffect);
            StatusEffects.Grappling = StatusEffects.mk("Grappling",CombatStatusEffect);
            StatusEffects.GuardAB = StatusEffects.mk("Targetguarded",CombatStatusEffect);
            StatusEffects.Marked = StatusEffects.mk("Player is marked, less armor",CombatStatusEffect);
            StatusEffects.Resolve = StatusEffects.mk("Test your resolve. A buff, or a debuff.",CombatStatusEffect);
            StatusEffects.Revelation = StatusEffects.mk("Player gained a crumb of cosmic truth",CombatStatusEffect);
            StatusEffects.Round = StatusEffects.mk("Round",CombatStatusEffect);
            StatusEffects.round = StatusEffects.mk("round",CombatStatusEffect);
            StatusEffects.RunDisabled = StatusEffects.mk("Run Disabled",CombatStatusEffect);
            StatusEffects.Shell = StatusEffects.mk("Shell",CombatStatusEffect);
            StatusEffects.SirenSong = StatusEffects.mk("Siren Song",CombatStatusEffect);
            StatusEffects.Soulburst = StatusEffects.mk("Soulburst",CombatStatusEffect);
            StatusEffects.Spar = StatusEffects.mk("spar",CombatStatusEffect);
            StatusEffects.Sparring = StatusEffects.mk("sparring",CombatStatusEffect);
            StatusEffects.spiderfight = StatusEffects.mk("spiderfight",CombatStatusEffect);
            StatusEffects.StimulatingAura = StimulatingAuraDebuff.TYPE;
            StatusEffects.StunCooldown = StatusEffects.mk("Stun Cooldown",CombatStatusEffect);
            StatusEffects.TentacleCoolDown = StatusEffects.mk("TentacleCoolDown",CombatStatusEffect);
            StatusEffects.Timer = StatusEffects.mk("Timer");
            StatusEffects.TimesBashed = StatusEffects.mk("TimesBashed",CombatStatusEffect);
            StatusEffects.Uber = StatusEffects.mk("Uber",CombatStatusEffect);
            StatusEffects.VolcanicUberHEAL = StatusEffects.mk("Volcanic Golem\'s uberheal",CombatStatusEffect);
            StatusEffects.UrtaSecondWinded = StatusEffects.mk("Urta Second Winded",CombatStatusEffect);
            StatusEffects.UsedTitsmother = StatusEffects.mk("UsedTitsmother",CombatStatusEffect);
            StatusEffects.Vala = StatusEffects.mk("vala",CombatStatusEffect);
            StatusEffects.GooArmorBind = StatusEffects.mk("GooArmorBind",CombatStatusEffect);
            StatusEffects.GooArmorSilence = StatusEffects.mk("GooArmorSilence",CombatStatusEffect);
            StatusEffects.GooBind = StatusEffects.mk("GooBind",CombatStatusEffect);
            StatusEffects.HarpyBind = StatusEffects.mk("HarpyBind",CombatStatusEffect);
            StatusEffects.HolliConstrict = StatusEffects.mk("Holli Constrict",CombatStatusEffect);
            StatusEffects.InfestAttempted = StatusEffects.mk("infestAttempted",CombatStatusEffect);
            StatusEffects.IsabellaStunned = StatusEffects.mk("Isabella Stunned",CombatStatusEffect);
            StatusEffects.IzmaBleed = StatusEffects.mk("Izma Bleed",CombatStatusEffect);
            StatusEffects.Ironflesh = StatusEffects.mk("Ironflesh",CombatStatusEffect);
            StatusEffects.KissOfDeath = StatusEffects.mk("Kiss of Death",CombatStatusEffect);
            StatusEffects.LizanBlowpipe = LizanBlowpipeDebuff.TYPE;
            StatusEffects.LustStones = StatusEffects.mk("lust stones",CombatStatusEffect);
            StatusEffects.lustvenom = StatusEffects.mk("lust venom",CombatStatusEffect);
            StatusEffects.Lustserking = LustserkBuff.TYPE;
            StatusEffects.Might = StatusEffects.mk("Might",CombatStatusEffect);
            StatusEffects.MothDose = MothPheromones.TYPE;
            StatusEffects.NagaBind = StatusEffects.mk("Naga Bind",CombatStatusEffect);
            StatusEffects.NagaBite = NagaBiteDebuff.TYPE;
            StatusEffects.NagaVenom = NagaVenomDebuff.TYPE;
            StatusEffects.Deafeningbuzz = DeafeningBuzz.TYPE;
            StatusEffects.PermaFlyStatus = PermaFly.TYPE;
            StatusEffects.NoFlee = StatusEffects.mk("NoFlee",CombatStatusEffect);
            StatusEffects.Overhealing = StatusEffects.mk("Overhealing",CombatStatusEffect);
            StatusEffects.ParalyzeVenom = ParalyzeVenomDebuff.TYPE;
            StatusEffects.PhysicalDisabled = StatusEffects.mk("Physical Disabled",CombatStatusEffect);
            StatusEffects.Poison = StatusEffects.mk("Poison",CombatStatusEffect);
            StatusEffects.Retribution = RetributionBuff.TYPE;
            StatusEffects.Sandstorm = StatusEffects.mk("sandstorm",CombatStatusEffect);
            StatusEffects.ScorpBlind = ScorpionBlind.TYPE;
            StatusEffects.ScorpGrabbed = StatusEffects.mk("Scorpion Grapple",CombatStatusEffect);
            StatusEffects.ScorpVenom = ScorpionVenom.TYPE;
            StatusEffects.Sealed = StatusEffects.mk("Sealed",CombatStatusEffect);
            StatusEffects.SeverTendons = SeverTendonsDebuff.TYPE;
            StatusEffects.BrutalBlows = BrutalBlowsDebuff.TYPE;
            StatusEffects.SheilaOil = StatusEffects.mk("Sheila Oil",CombatStatusEffect);
            StatusEffects.Shielding = StatusEffects.mk("Shielding",CombatStatusEffect);
            StatusEffects.StoneLust = StatusEffects.mk("Stone Lust",CombatStatusEffect);
            StatusEffects.Stunned = StatusEffects.mk("Stunned",CombatStatusEffect);
            StatusEffects.TailWhip = StatusEffects.mk("Tail Whip",CombatStatusEffect);
            StatusEffects.TemporaryHeat = StatusEffects.mk("Temporary Heat",CombatStatusEffect);
            StatusEffects.TentacleBind = StatusEffects.mk("TentacleBind",CombatStatusEffect);
            StatusEffects.ThroatPunch = StatusEffects.mk("Throat Punch",CombatStatusEffect);
            StatusEffects.Titsmother = StatusEffects.mk("Titsmother",CombatStatusEffect);
            StatusEffects.TimeFrozen = StatusEffects.mk("Time Frozen",CombatStatusEffect);
            StatusEffects.TwuWuv = StatusEffects.mk("Twu Wuv",CombatStatusEffect);
            StatusEffects.UBERWEB = StatusEffects.mk("UBERWEB",CombatStatusEffect);
            StatusEffects.Web = WebDebuff.TYPE;
            StatusEffects.WebSilence = StatusEffects.mk("Web-Silence",CombatStatusEffect);
            StatusEffects.Whispered = StatusEffects.mk("whispered",CombatStatusEffect);
            StatusEffects.TrueWhispered = WhisperedDebuff.TYPE;
            StatusEffects.RemovedArmor = StatusEffects.mk("Removed Armor",CombatStatusEffect);
            StatusEffects.JCLustLevel = StatusEffects.mk("JC Lust Level",CombatStatusEffect);
            StatusEffects.Leeching = LeechBuff.TYPE;
            StatusEffects.MirroredAttack = StatusEffects.mk("Mirrored Attack",CombatStatusEffect);
            StatusEffects.KnockedBack = StatusEffects.mk("Knocked Back",CombatStatusEffect);
            StatusEffects.Tentagrappled = StatusEffects.mk("Tentagrappled",CombatStatusEffect);
            StatusEffects.TentagrappleCooldown = StatusEffects.mk("Tentagrapple Cooldown",CombatStatusEffect);
            StatusEffects.ShowerDotEffect = StatusEffects.mk("Shower Dot Effect",CombatStatusEffect);
            StatusEffects.GardenerSapSpeed = GardenerSapSpeedDebuff.TYPE;
            StatusEffects.VineHealUsed = StatusEffects.mk("Vine Heal Used",CombatStatusEffect);
            StatusEffects.DriderIncubusVenom = DriderIncubusVenomDebuff.TYPE;
            StatusEffects.NagaSentVenom = StatusEffects.mk("Naga Sentinel Venom",CombatStatusEffect);
            StatusEffects.Nothingness = StatusEffects.mk("Player doesn\'t exist",CombatStatusEffect);
            StatusEffects.PurpleHaze = StatusEffects.mk("PurpleHaze",CombatStatusEffect);
            StatusEffects.TaintedMind = StatusEffects.mk("Tainted Mind",CombatStatusEffect);
            StatusEffects.MinotaurKingMusk = StatusEffects.mk("Minotaur King Musk",CombatStatusEffect);
            StatusEffects.MinotaurKingsTouch = StatusEffects.mk("Minotaur Kings Touch",CombatStatusEffect);
            StatusEffects.MosquitoNumb = StatusEffects.mk("Mosquito Numb",CombatStatusEffect);
            StatusEffects.ParasiteSlugMusk = StatusEffects.mk("Smell that musk man",CombatStatusEffect);
            StatusEffects.ParasiteQueen = StatusEffects.mk("Being boosted by your parasites!",CombatStatusEffect);
            StatusEffects.NephilaQueen = StatusEffects.mk("Being boosted by nephila parasites!",CombatStatusEffect);
            StatusEffects.NephilaCompulsion = StatusEffects.mk("Nephila Compulsion",CombatStatusEffect);
            StatusEffects.NephilaSlow = NephilaSlowDebuff.TYPE;
            StatusEffects.PigbysHands = StatusEffects.mk("Pigbys Hands",CombatStatusEffect);
            StatusEffects.WhipSilence = StatusEffects.mk("Whip-Silence",CombatStatusEffect);
            StatusEffects.AikoLightningArrow = StatusEffects.mk("Aiko lightning arrow",CombatStatusEffect);
            StatusEffects.YamataEntwine = StatusEffects.mk("Yamata Entwine",CombatStatusEffect);
            StatusEffects.Refashioned = StatusEffects.mk("Player has been remade",CombatStatusEffect);
            StatusEffects.SentinelOmniSilence = StatusEffects.mk("Super silenced",CombatStatusEffect);
            StatusEffects.SentinelPhysicalDisabled = StatusEffects.mk("No physical",CombatStatusEffect);
            StatusEffects.SentinelNoTease = StatusEffects.mk("No tease",CombatStatusEffect);
            StatusEffects.Backstab = BackstabBuff.TYPE;
            StatusEffects.DodgedAttack = DodgedAttackBuff.TYPE;
            StatusEffects.VolcanicFistProblem = StatusEffects.mk("Golem stuck its fist in the ground.",CombatStatusEffect);
            StatusEffects.VolcanicFrenzy = StatusEffects.mk("Golem is pissed off.",CombatStatusEffect);
            StatusEffects.VolcanicArmorRed = StatusEffects.mk("Armor temporarily reduced",CombatStatusEffect);
            StatusEffects.VolcanicWeapRed = StatusEffects.mk("Weapon damage temporarily reduced",CombatStatusEffect);
            StatusEffects.WaitReadiness = StatusEffects.mk("Extra dodge due to wait",CombatStatusEffect);
            StatusEffects.Withering = WitheringDebuff.TYPE;
            StatusEffects.DivineWind = DivineWindBuff.TYPE;
            StatusEffects.TargetMarkedBuff = TargetMarked.TYPE;
            StatusEffects.TFPlate = StatusEffects.mk("Plate",CombatStatusEffect);
            StatusEffects.TFInflame = TFInflameBuff.TYPE;
            StatusEffects.TFMoltenPlate = StatusEffects.mk("Molten Plate",CombatStatusEffect);
            StatusEffects.TFShell = TFShellBuff.TYPE;
            StatusEffects.TFQuake = TFQuakeBuff.TYPE;
            StatusEffects.TFScorch = TFScorchBuff.TYPE;
            StatusEffects.TFGeodeKnuckle = TFGeodeKnuckleBuff.TYPE;
            StatusEffects.TFTerraCore = TFTerraCoreBuff.TYPE;
            StatusEffects.TFTerraStar = TerraStarBuff.TYPE;
            StatusEffects.TFTerraStarCooldown = TerraStarCooldown.TYPE;
            StatusEffects.TFTerraStarWeaken = TerraStarDebuff.TYPE;
            StatusEffects.TFSupercharging = StatusEffects.mk("Supernova Charging",CombatStatusEffect);
            StatusEffects.FrogPoison = FrogPoisonDebuff.TYPE;
            StatusEffects.MonkStance = MonkStanceBuff.TYPE;
            StatusEffects.BrawlerStance = BrawlerStanceBuff.TYPE;
            StatusEffects.ClawStance = ClawStanceBuff.TYPE;
            StatusEffects.Lurk = LurkBuff.TYPE;
            StatusEffects.TrueParry = TrueParryBuff.TYPE;
            StatusEffects.Trip = Tripped.TYPE;
            StatusEffects.Chanted = ChantedDebuff.TYPE;
            StatusEffects.dispellablePositiveEffects = [StatusEffects.TargetMarkedBuff,StatusEffects.ChargeWeapon,StatusEffects.Might,StatusEffects.Leeching,StatusEffects.ParasiteQueen,StatusEffects.NephilaQueen,StatusEffects.Resolve,StatusEffects.Lustserking,StatusEffects.Berserking,StatusEffects.Ironflesh,StatusEffects.Overhealing,StatusEffects.DivineWind,StatusEffects.TFPlate,StatusEffects.TFInflame,StatusEffects.TFMoltenPlate,StatusEffects.TFShell];
            StatusEffects.monsterNegativeEffects = [StatusEffects.OnFire,StatusEffects.IzmaBleed,StatusEffects.Blind,StatusEffects.Fear,StatusEffects.Stunned,StatusEffects.Illusion,StatusEffects.BasiliskCompulsion,StatusEffects.NagaVenom,StatusEffects.lustvenom,StatusEffects.LustStick,StatusEffects.CoonWhip,StatusEffects.Constricted,StatusEffects.TFTerraStarWeaken,StatusEffects.Chanted];
            StatusEffects.spellsWhite = [StatusEffects.KnowsWhitefire,StatusEffects.KnowsCharge,StatusEffects.KnowsBlind];
            StatusEffects.spellsBlack = [StatusEffects.KnowsBlackfire,StatusEffects.KnowsArouse,StatusEffects.KnowsHeal,StatusEffects.KnowsMight];
            StatusEffects.spellsGray = [StatusEffects.KnowsTKBlast,StatusEffects.KnowsLeech];
            StatusEffects.spellsOther = [StatusEffects.KnowsDivineWind,StatusEffects.KnowsWither,StatusEffects.KnowsCSS,StatusEffects.KnowsSoulburst];
            StatusEffects.spells = [].concat(StatusEffects.spellsWhite).concat(StatusEffects.spellsBlack).concat(StatusEffects.spellsGray).concat(StatusEffects.spellsOther);
         }
         if(!PerkLib.init__)
         {
            PerkLib.init__ = true;
            PerkLib.Buttslut = PerkLib.mk("Buttslut","Buttslut","");
            PerkLib.Focused = PerkLib.mk("Focused","Focused","");
            PerkLib.Fast = new GiftFast();
            PerkLib.Lusty = new GiftLusty();
            PerkLib.Pervert = new GiftPervert();
            PerkLib.Sensitive = new GiftSensitive();
            PerkLib.Frigid = new GiftFrigid();
            PerkLib.Smart = new GiftSmart();
            PerkLib.Strong = new GiftStrong();
            PerkLib.Tough = new GiftTough();
            PerkLib.BigClit = PerkLib.mk("Big Clit","Big Clit","Allows your clit to grow larger more easily and faster.",null,true);
            PerkLib.BigTits = PerkLib.mk("Big Tits","Big Tits","Makes your tits grow larger more easily.",null,true);
            PerkLib.Fertile = PerkLib.mk("Fertile","Fertile","Makes you 15% more likely to become pregnant.",null,true);
            PerkLib.WetPussy = PerkLib.mk("Wet Pussy","Wet Pussy","Keeps your pussy wet and provides a bonus to capacity.",null,true);
            PerkLib.BigCock = PerkLib.mk("Big Cock","Big Cock","Gains cock size 25% faster and with less limitations.",null,true);
            PerkLib.MessyOrgasms = PerkLib.mk("Messy Orgasms","Messy Orgasms","Produces 50% more cum volume.",null,true);
            PerkLib.AscensionDesires = new AscensionDesiresPerk();
            PerkLib.AscensionEndurance = new AscensionEndurancePerk();
            PerkLib.AscensionFertility = new AscensionFertilityPerk();
            PerkLib.AscensionFortune = new AscensionFortunePerk();
            PerkLib.AscensionMoralShifter = new AscensionMoralShifterPerk();
            PerkLib.AscensionMysticality = new AscensionMysticalityPerk();
            PerkLib.AscensionTolerance = new AscensionTolerancePerk();
            PerkLib.AscensionVirility = new AscensionVirilityPerk();
            PerkLib.AscensionWisdom = new AscensionWisdomPerk();
            PerkLib.AscensionMartiality = new AscensionMartialityPerk();
            PerkLib.AscensionSeduction = new AscensionSeductionPerk();
            PerkLib.HistoryAlchemist = new HistoryAlchemistPerk();
            PerkLib.HistoryFighter = new HistoryFighterPerk();
            PerkLib.HistoryFortune = new HistoryFortunePerk();
            PerkLib.HistoryHealer = new HistoryHealerPerk();
            PerkLib.HistoryReligious = new HistoryReligiousPerk();
            PerkLib.HistoryScholar = new HistoryScholarPerk();
            PerkLib.HistorySlacker = new HistorySlackerPerk();
            PerkLib.HistorySlut = new HistorySlutPerk();
            PerkLib.HistorySmith = new HistorySmithPerk();
            PerkLib.HistoryWhore = new HistoryWhorePerk();
            PerkLib.HistoryThief = new HistoryThiefPerk();
            PerkLib.HistoryDEUSVULT = new HistoryDEUSVULTPerk();
            var _temp_22:* = PerkLib;
            _loc143_ = PerkLib.mk("Acclimation","Acclimation","Reduces lust gain by 15%.","You choose the \'Acclimation\' perk, making your body 15% more resistant to lust.");
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromInt(15),false);
            _temp_22.Acclimation = _loc143_;
            PerkLib.Agility = PerkLib.mk("Agility","Agility","Boosts armor points by a portion of your speed on light/medium armors.","You choose the \'Agility\' perk, increasing the effectiveness of Light/Medium armors by a portion of your speed.");
            PerkLib.AncestralArchery = PerkLib.mk("Ancestral Archery","Ancestral Archery","Allows your skill with bows to exceed normal limits.","You choose the \'Ancestral Archery\' perk, allowing a higher maximum value for the bow skill.");
            var _temp_23:* = PerkLib;
            _loc143_ = PerkLib.mk("Archmage","Archmage","[if (inte>=75) {Increases base spell strength by 50%.|<b>You are too dumb to gain benefit from this perk.</b>}]","You choose the \'Archmage\' perk, increasing base spell strength by 50%.");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(50),false);
            _temp_23.Archmage = _loc143_;
            PerkLib.ArousingAura = PerkLib.mk("Arousing Aura","Arousing Aura","Exude a lust-inducing aura (Req\'s corruption of 70 or more)","You choose the \'Arousing Aura\' perk, causing you to radiate an aura of lust when your corruption is over 70.");
            PerkLib.Awareness = PerkLib.mk("Awareness","Awareness","Get additional information about your enemy in combat.","You choose the \'Awareness\' perk, allowing you to see the Armor and Corruption values of an opponent.");
            PerkLib.Battlemage = PerkLib.mk("Battlemage","Battlemage","Start every battle with Might enabled, if you meet Black Magic requirements before it starts.","You choose the \'Battlemage\' perk. You start every battle with Might effect, as long as you meet Black Magic requirements to cast it before battle.");
            PerkLib.Berserker = PerkLib.mk("Berserker","Berserker","[if (str>=75) {Grants \'Berserk\' ability.|<b>You aren\'t strong enough to benefit from this anymore.</b>}]","You choose the \'Berserker\' perk, which unlocks the \'Berserk\' magical ability. Berserking increases attack and lust resistance but reduces physical defenses.");
            PerkLib.Blademaster = new BlademasterPerk();
            PerkLib.Brawler = PerkLib.mk("Brawler","Brawler","Brawling experience allows you to make two unarmed attacks in a turn.","You choose the \'Brawler\' perk, allowing you to make two unarmed attacks in a turn!");
            PerkLib.BrutalBlows = PerkLib.mk("Brutal Blows","Brutal Blows","[if (str>=75) {Reduces enemy armor with each hit.|<b>You aren\'t strong enough to benefit from this anymore.</b>}]","You choose the \'Brutal Blows\' perk, which reduces enemy armor with each hit.").setEnemyDesc("Target\'s regular attacks reduce your armor.");
            var _temp_24:* = PerkLib;
            _loc143_ = PerkLib.mk("Channeling","Channeling","Increases base spell strength by 50%.","You choose the \'Channeling\' perk, boosting the strength of your spellcasting!");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(50),false);
            _temp_24.Channeling = _loc143_;
            PerkLib.ColdBlooded = PerkLib.mk("Cold Blooded","Cold Blooded","Reduces minimum lust by up to 20, down to min of 20. Caps min lust at 20 below max.","You choose the \'Cold Blooded\' perk. Thanks to increased control over your desires, your minimum lust is reduced! (Caps minimum lust at 20 below max. Won\'t reduce minimum lust below 20 though.)");
            PerkLib.ColdFury = PerkLib.mk("Cold Fury","Cold Fury","Berserking halves your defense instead of reducing it to zero.","You choose the \'Cold Fury\' perk, causing Berserking to only reduce your armor by half instead of completely reducing it to zero.");
            var _temp_25:* = PerkLib;
            _loc143_ = PerkLib.mk("Corrupted Libido","Corrupted Libido","Reduces lust gain by 10%.","You choose the \'Corrupted Libido\' perk. As a result of your body\'s corruption, you\'ve become a bit harder to turn on. (Lust gain reduced by 10%!)");
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromInt(10),false);
            _temp_25.CorruptedLibido = _loc143_;
            PerkLib.DemonBiology = new DemonBiologyBerk();
            PerkLib.DoubleAttack = PerkLib.mk("Double Attack","Double Attack","[if (spe<50) {<b>You\'re too slow to double attack!</b>|[if (str<61) {Allows you to perform two melee attacks per round.|<b>You are stronger than double attack allows. To choose between reduced strength double-attacks and a single strong attack, access \"Dbl Options\" in the perks menu.</b>}]}]","You choose the \'Double Attack\' perk. This allows you to make two attacks so long as your strength is at 60 or below. By default your effective strength will be reduced to 60 if it is too high when double attacking. <b>You can enter the perks menu at any time to toggle options as to how you will use this perk.</b>");
            PerkLib.EagleEye = PerkLib.mk("Eagle Eye","Eagle Eye","Careful planning behind each shot reduces the chance of missing bow shots.","You choose the \'Eagle Eye\' perk, increasing chance to hit when firing a bow.");
            PerkLib.Evade = new EvadePerk();
            PerkLib.FanShot = PerkLib.mk("Fan Shot","Fan Shot","Allows you to fire arrows to hit all enemies in combat at once, for great fatigue cost.","You choose the \'Fan Shot\' perk, granting the Fan Shot combat ability.");
            PerkLib.FertilityMinus = PerkLib.mk("Fertility-","Fertility-","Decreases fertility rating by 15 and cum volume by up to 30%. (Req\'s libido of less than 25.)","You choose the \'Fertility-\' perk, making it harder to get pregnant. It also decreases your cum volume by up to 30% (if appropriate)!");
            PerkLib.FertilityPlus = PerkLib.mk("Fertility+","Fertility+","Increases fertility rating by 15 and cum volume by up to 50%.","You choose the \'Fertility+\' perk, making it easier to get pregnant. It also increases your cum volume by up to 50% (if appropriate)!");
            PerkLib.FistsOfFury = PerkLib.mk("Fists of Fury","Fists of Fury","Grants unarmed combat stances while not wielding a shield.","You choose the \'Fists of Fury\' perk, which unlocks combat stances to greatly enhance unarmed combat while not wielding a shield.");
            PerkLib.FocusedMind = PerkLib.mk("Focused Mind","Focused Mind","Black Magic is less likely to backfire and White Magic threshold is increased.","You choose the \'Focused Mind\' perk. Black Magic is less likely to backfire and White Magic threshold is increased.");
            PerkLib.Frustration = new FrustrationPerk();
            PerkLib.HoldWithBothHands = new HoldWithBothHandsPerk();
            var _temp_26:* = PerkLib;
            _loc143_ = PerkLib.mk("Hot Blooded","Hot Blooded","Raises minimum lust by up to 20.","You choose the \'Hot Blooded\' perk. As a result of your enhanced libido, your lust no longer drops below 20! (If you already have some minimum lust, it will be increased by 10)");
            _loc143_.boost("最低欲望",NumberFunc_Impl_.fromInt(20),false);
            _temp_26.HotBlooded = _loc143_;
            PerkLib.ImmovableObject = PerkLib.mk("Immovable Object","Immovable Object","[if (tou>=75) {Grants 10% physical damage reduction.|<b>You aren\'t tough enough to benefit from this anymore.</b>}]","You choose the \'Immovable Object\' perk, granting 10% physical damage reduction.");
            var _temp_27:* = PerkLib;
            _loc143_ = PerkLib.mk("Improved Endurance","Improved Endurance","Increases maximum fatigue by 20.","You choose the \'Improved Endurance\' perk. Thanks to your physical conditioning, your maximum fatigue has been increased by 20!");
            _loc143_.boost("最大疲劳度",NumberFunc_Impl_.fromInt(20),false);
            _temp_27.ImprovedEndurance = _loc143_;
            var _temp_28:* = PerkLib;
            _loc143_ = PerkLib.mk("Improved Endurance 2","Improved Endurance 2","Increases maximum fatigue by 10.","You choose the \'Improved Endurance 2\' perk. Thanks to your improved physical conditioning, your maximum fatigue has been further increased by 10!");
            _loc143_.boost("最大疲劳度",NumberFunc_Impl_.fromInt(10),false);
            _temp_28.ImprovedEndurance2 = _loc143_;
            PerkLib.ImprovedSelfControl = PerkLib.mk("Improved Self-Control","Improved Self-Control","Increases maximum lust by 20.","You choose the \'Improved Self-Control\' perk. Thanks to your mental conditioning, your maximum lust has been increased by 20!");
            PerkLib.ImprovedSelfControl2 = PerkLib.mk("Improved Self-Control 2","Improved Self-Control 2","Increases maximum lust by 10.","You choose the \'Improved Self-Control 2\' perk. Thanks to your improved mental conditioning, your maximum lust has been further increased by 10!");
            PerkLib.IronFists = new IronFistsPerk();
            PerkLib.IronFists2 = new IronFists2Perk();
            PerkLib.IronFists3 = new IronFists3Perk();
            PerkLib.IronMan = PerkLib.mk("Iron Man","Iron Man","Reduces the fatigue cost of physical specials by 50%.","You choose the \'Iron Man\' perk, reducing the fatigue cost of physical special attacks by 50%");
            PerkLib.Juggernaut = PerkLib.mk("Juggernaut","Juggernaut","When wearing heavy armor, you have extra 10 armor points and are immune to damage from being constricted/squeezed.","You choose the \'Juggernaut\' perk, granting extra 10 armor points when wearing heavy armor and immunity to damage from been constricted/squeezed.");
            PerkLib.LightningStrikes = new LightningStrikesPerk();
            PerkLib.LungingAttacks = PerkLib.mk("Lunging Attacks","Lunging Attacks","[if (spe>=75) {Grants 25% armor penetration for standard attacks.|<b>You are too slow to benefit from this perk.</b>}]","You choose the \'Lunging Attacks\' perk, granting 25% armor penetration for standard attacks.");
            var _temp_29:* = PerkLib;
            _loc143_ = PerkLib.mk("Mage","Mage","Increases base spell strength by 50%.","You choose the \'Mage\' perk. You are able to focus your magical abilities even more keenly, boosting your base spell effects by 50%.");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(50),false);
            _temp_29.Mage = _loc143_;
            PerkLib.Masochist = PerkLib.mk("Masochist","Masochist","Take 20% less physical damage but gain lust when you take damage.","You choose the \'Masochist\' perk, reducing the damage you take but raising your lust each time! This perk only functions while your libido is at or above 60!");
            PerkLib.Medicine = PerkLib.mk("Medicine","Medicine","Grants 15% chance per round of cleansing poisons/drugs from your body. Increases HP restoration on rest.","You choose the \'Medicine\' perk, giving you a chance to remove debilitating poisons automatically! Also, increases HP restoration on rest.");
            PerkLib.NaturalWeapons = new NaturalWeaponsPerk();
            PerkLib.NoBaggage = PerkLib.mk("No Baggage","No Baggage","If wearing light/medium armor, no weapon, and no shield, bow attacks become much more powerful.","You choose the \'No Baggage\' perk, greatly increasing bow attack damage while unencumbered.");
            var _temp_30:* = PerkLib;
            _loc143_ = PerkLib.mk("Nymphomania","Nymphomania","Raises minimum lust by up to 30.","You\'ve chosen the \'Nymphomania\' perk. Due to the incredible amount of corruption you\'ve been exposed to, you\'ve begun to live in a state of minor constant arousal. Your minimum lust will be increased by as much as 30 (If you already have minimum lust, the increase is 10-15).");
            _loc143_.boost("最低欲望",NumberFunc_Impl_.fromInt(30),false);
            _temp_30.Nymphomania = _loc143_;
            PerkLib.Opportunist = PerkLib.mk("Opportunist","Opportunist","Don\'t turn your back to your opponent! When an enemy attempts to distance himself, get a free attack of opportunity.","You choose the \'Opportunist\' perk, giving you a free attack against any enemy that attempts to distance himself from you.");
            PerkLib.Parry = PerkLib.mk("Parry","Parry","[if (spe>=50) {Increases deflect chance by up to 10% while wielding a weapon. (Speed-based).|<b>You are not durable enough to gain benefit from this perk.</b>}]","You choose the \'Parry\' perk, giving you a chance to deflect blows with your weapon. (Speed-based).");
            PerkLib.PracticedForm = PerkLib.mk("Practiced Form","Practiced Form","Long hours spent practicing your form have resulted in your bow based combat abilities requiring 5 less fatigue.","You choose the \'Practiced Form\' perk, reducing fatigue cost when firing a bow.");
            PerkLib.Precision = PerkLib.mk("Precision","Precision","Reduces enemy armor by 10. (Req\'s 25+ Intelligence)","You\'ve chosen the \'Precision\' perk. Thanks to your intelligence, you\'re now more adept at finding and striking an enemy\'s weak points, reducing their damage resistance from armor by 10. If your intelligence ever drops below 25 you\'ll no longer be smart enough to benefit from this perk.");
            PerkLib.RagingInferno = PerkLib.mk("Raging Inferno","Raging Inferno","Cumulative 20% damage increase for every subsequent fire spell without interruption.","You choose the \'Raging Inferno\' perk. Cumulative 20% damage increase for every subsequent fire spell without interruption.");
            PerkLib.Regeneration = new RegenerationPerk();
            PerkLib.Regeneration2 = new Regeneration2Perk();
            var _temp_31:* = PerkLib;
            _loc143_ = PerkLib.mk("Resistance","Resistance","Reduces lust gain by 10%.","You choose the \'Resistance\' perk, reducing the rate at which your lust increases by 10%.");
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromInt(10),false);
            _temp_31.Resistance = _loc143_;
            PerkLib.Resolute = PerkLib.mk("Resolute","Resolute","[if (tou>=75) {Grants immunity to some statuses and allows you to ignore stuns by spending fatigue.|<b>You aren\'t tough enough to benefit from this anymore.</b>}]","You choose the \'Resolute\' perk, granting immunity to some statuses and allowing you to ignore stuns by spending fatigue.</b>");
            var _temp_32:* = PerkLib;
            _loc143_ = PerkLib.mk("Runner","Runner","Increases chances of movement and escape in combat.","You choose the \'Runner\' perk, increasing your chances to escape combat and successfully move on the battlefield!");
            _loc143_.boost("移动几率",NumberFunc_Impl_.fromInt(15),false);
            _temp_32.Runner = _loc143_;
            var _temp_33:* = PerkLib;
            _loc143_ = PerkLib.mk("Sadist","Sadist","Deal 20% more damage, but gain lust at the same time.","You choose the \'Sadist\' perk, increasing damage by 20 percent but causing you to gain lust from dealing damage.");
            _loc143_.boost("全局伤害",NumberFunc_Impl_.fromFloat(1.2),true);
            _temp_33.Sadist = _loc143_;
            var _temp_34:* = PerkLib;
            _loc143_ = PerkLib.mk("Seduction","Seduction","Upgrades your tease attack, making it more effective.","You choose the \'Seduction\' perk, upgrading the \'tease\' attack with a more powerful damage and a higher chance of success.");
            _loc143_.boost("挑逗几率",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
            _temp_34.Seduction = _loc144_;
            PerkLib.SeverTendons = PerkLib.mk("Sever Tendons","Sever Tendons","Adds a chance for every attack to reduce your target\'s strength and speed.","You choose the \'Sever Tendons\' perk, adding a chance for every attack to reduce your target\'s strength and speed permanently.").setEnemyDesc("Target\'s regular attacks may reduce your strength and speed.");
            PerkLib.ShieldMastery = PerkLib.mk("Shield Mastery","Shield Mastery","[if (tou>=50) {Increases block chance by up to 10% while using a shield (Toughness-based).|<b>You are not durable enough to gain benefit from this perk.</b>}]","You choose the \'Shield Mastery\' perk, increasing block chance by up to 10% as long as you\'re wielding a shield (Toughness-based).");
            PerkLib.ShieldSlam = PerkLib.mk("Shield Slam","Shield Slam","Reduces shield bash diminishing returns by 50% and increases bash damage by 20%.","You choose the \'Shield Slam\' perk. Stun diminishing returns is reduced by 50% and shield bash damage is increased by 20%.");
            PerkLib.SpeedyRecovery = PerkLib.mk("Speedy Recovery","Speedy Recovery","Regain fatigue 50% faster.","You choose the \'Speedy Recovery\' perk, boosting your fatigue recovery rate!");
            var _temp_35:* = PerkLib;
            _loc143_ = PerkLib.mk("Spellpower","Spellpower","Increases base spell strength by 50%.","You choose the \'Spellpower\' perk. Thanks to your sizable intellect and willpower, you are able to more effectively use magic, boosting base spell effects by 50%.");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(50),false);
            _temp_35.Spellpower = _loc143_;
            PerkLib.Spellsword = new SpellswordPerk();
            PerkLib.Survivalist = PerkLib.mk("Survivalist","Survivalist","Slows hunger rate by 20%.","You choose the \'Survivalist\' perk. With this perk, your hunger rate is reduced by 20%.");
            PerkLib.Survivalist2 = PerkLib.mk("Survivalist 2","Survivalist 2","Slows hunger rate by 20%.","You choose the \'Survivalist 2\' perk. With this perk, your hunger rate is reduced by another 20%.");
            PerkLib.StaffChanneling = PerkLib.mk("Staff Channeling","Staff Channeling","Basic attack with wizard\'s staff is replaced with ranged magic bolt.","You choose the \'Staff Channeling\' perk. Basic attack with wizard\'s staff is replaced with ranged magic bolt.");
            PerkLib.StrongBack = PerkLib.mk("Strong Back","Strong Back","Enables additional inventory slot.","You choose the \'Strong Back\' perk, enabling an additional inventory slot.");
            PerkLib.StrongBack2 = PerkLib.mk("Strong Back 2: Strong Harder","Strong Back 2: Strong Harder","Enables additional inventory slot.","You choose the \'Strong Back 2: Strong Harder\' perk, enabling an additional inventory slot.");
            PerkLib.StrongDraw = PerkLib.mk("Strong Draw","Strong Draw","While shooting a bow, increases damage by a portion of your strength.","You choose the \'Strong Draw\' perk, granting increased damage when firing a bow.");
            PerkLib.Tactician = new TacticianPerk();
            PerkLib.Tank = PerkLib.mk("Tank","Tank","Raises max HP by 50.","You choose the \'Tank\' perk, giving you an additional 50 HP!");
            PerkLib.Tank2 = PerkLib.mk("Tank 2","Tank 2","+1 extra HP per point of toughness.","You choose the \'Tank 2\' perk, granting an extra maximum HP for each point of toughness.");
            PerkLib.Tank3 = PerkLib.mk("Tank 3","Tank 3","+5 extra HP per character level.","You choose the \'Tank 3\' perk, granting 5 extra maximum HP for each level.");
            PerkLib.TitanGrip = PerkLib.mk("Titan Grip","Titan Grip","Allows you to wield large weapons in one hand, granting shield usage.","You choose the \'Titan Grip\' perk. Thanks to your incredible strength, you can now wield large weapons with one hand!");
            PerkLib.ThunderousStrikes = new ThunderousStrikesPerk();
            PerkLib.Unhindered = new UnhinderedPerk();
            PerkLib.VitalAim = PerkLib.mk("Vital Aim","Vital Aim","While shooting a bow, increases critical chance by 5%","You choose the \'Vital Aim\' perk, granting critical chance when shooting a bow.");
            PerkLib.HeavyImpact = new HeavyImpactPerk();
            PerkLib.WellAdjusted = PerkLib.mk("Well Adjusted","Well Adjusted","You gain half as much lust as time passes in Mareth.","You choose the \'Well Adjusted\' perk, reducing the amount of lust you naturally gain over time while in this strange land!");
            var _temp_36:* = PerkLib;
            _loc143_ = PerkLib.mk("Chi Reflow - Attack","Chi Reflow - Attack","Regular attacks boosted, but damage resistance decreased.");
            _loc143_.boost("护甲",NumberFunc_Impl_.fromFloat(0.9),true);
            _loc144_ = _loc143_;
            _loc144_.boost("攻击伤害",NumberFunc_Impl_.fromFloat(1.1),true);
            _temp_36.ChiReflowAttack = _loc144_;
            var _temp_37:* = PerkLib;
            _loc143_ = PerkLib.mk("Chi Reflow - Defense","Chi Reflow - Defense","Passive damage resistance, but caps speed");
            _loc143_.boost("护甲",NumberFunc_Impl_.fromFloat(1.1),true);
            _temp_37.ChiReflowDefense = _loc143_;
            var _temp_38:* = PerkLib;
            _loc143_ = PerkLib.mk("Chi Reflow - Lust","Chi Reflow - Lust","Lust resistance and Tease are enhanced, but Libido and Sensitivity gains increased.");
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗几率",NumberFunc_Impl_.fromFloat(10),false);
            _loc145_ = _loc144_;
            _loc145_.boost("性欲增加",NumberFunc_Impl_.fromFloat(1.1),true);
            _loc146_ = _loc145_;
            _loc146_.boost("敏感度增加",NumberFunc_Impl_.fromFloat(1.1),true);
            _temp_38.ChiReflowLust = _loc146_;
            var _temp_39:* = PerkLib;
            _loc143_ = PerkLib.mk("Chi Reflow - Magic","Chi Reflow - Magic","Magic attacks boosted, but regular attacks are weaker.");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromFloat(25),false);
            _loc144_ = _loc143_;
            _loc144_.boost("攻击伤害",NumberFunc_Impl_.fromFloat(0.75),true);
            _temp_39.ChiReflowMagic = _loc144_;
            var _temp_40:* = PerkLib;
            _loc143_ = PerkLib.mk("Chi Reflow - Speed","Chi Reflow - Speed","Speed reductions are halved but caps strength");
            _loc143_.boost("速度损失",NumberFunc_Impl_.fromFloat(0.5),true);
            _temp_40.ChiReflowSpeed = _loc143_;
            PerkLib.PiercedCrimstone = new PiercedCrimstonePerk();
            PerkLib.PiercedIcestone = new PiercedIcestonePerk();
            PerkLib.PiercedFertite = new PiercedFertitePerk();
            PerkLib.PiercedFurrite = PerkLib.mk("Pierced: Furrite","Pierced: Furrite","Increases chances of encountering \'furry\' foes.");
            PerkLib.PiercedLethite = PerkLib.mk("Pierced: Lethite","Pierced: Lethite","Increases chances of encountering demonic foes.");
            var _temp_41:* = PerkLib;
            _loc143_ = PerkLib.mk("Lusty Regeneration","Lusty Regeneration","Regenerates 1% of HP per round in combat and 2% of HP per hour.");
            _loc143_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(1),false);
            _temp_41.LustyRegeneration = _loc143_;
            PerkLib.MidasCock = PerkLib.mk("Midas Cock","Midas Cock","Increases the gems awarded from victory in battle.");
            PerkLib.PentUp = new PentUpPerk();
            PerkLib.PhallicPotential = PerkLib.mk("Phallic Potential","Phallic Potential","Increases the effects of penis-enlarging transformations.");
            PerkLib.PhallicRestraint = PerkLib.mk("Phallic Restraint","Phallic Restraint","Reduces the effects of penis-enlarging transformations.");
            var _temp_42:* = PerkLib;
            _loc143_ = PerkLib.mk("Phallic Power","Phallic Power","Increases spellpower.");
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(5),false);
            _temp_42.PhallicPower = _loc143_;
            PerkLib.BloodMage = PerkLib.mk("Blood Mage","Blood Mage","Spellcasting now consumes health instead of fatigue!",null,true);
            PerkLib.Patience = new PatiencePerk();
            PerkLib.LesserBloodMage = PerkLib.mk("Lesser Blood Mage","Lesser Blood Mage","Spellcasting now consumes a large amount of health instead of fatigue.");
            PerkLib.QuickPockets = PerkLib.mk("Quick Pockets","Quick Pockets","The first item used in a turn does not end it.");
            PerkLib.SluttySeduction = new SluttySeductionPerk();
            PerkLib.WizardsEndurance = new WizardsEndurancePerk();
            PerkLib.WellspringOfLust = PerkLib.mk("Wellspring of Lust","Wellspring of Lust","At the beginning of combat, lust raises to black magic threshold if lust is below black magic threshold.");
            PerkLib.FeralBerserker = PerkLib.mk("Feral Berserker","Feral Berserker","The Berserk ability is improved and costs health instead of fatigue.");
            PerkLib.DemonHunter = PerkLib.mk("Demon Hunter","Demon Hunter","Casting spells may reduce lust at the cost of health when fighting demons.");
            PerkLib.BlazingLust = PerkLib.mk("Blazing Lust","Blazing Lust","Tease effectiveness increases with each successive tease, but so does the damage you take.");
            PerkLib.BestialPassion = PerkLib.mk("Bestial Passion","Bestial Passion","Tease has a chance to deal critical lust damage, but your own lust will be raised as well.");
            PerkLib.SetDemonbane = PerkLib.mk("Set bonus: Demonbane","Set bonus: Demonbane","You have a passive chance to cause fear in demons and weaker enemies.");
            PerkLib.SetRavager = PerkLib.mk("Set bonus: Ravager","Set bonus: Ravager","You can activate Berserk without using up your turn.");
            PerkLib.SetPrimal = PerkLib.mk("Set bonus: Primal","Set bonus: Primal","The Berserk ability will now increase the amount of lust you give.");
            PerkLib.AlrauneVines = new VineArmorPerk();
            PerkLib.IvoryMagic = PerkLib.mk("Ivory Magic","Ivory Magic","Increases the magnitude of Leech and Charge Weapon.");
            PerkLib.WizardsFocus = new WizardsFocusPerk();
            PerkLib.Cunning = new CunningPerk();
            PerkLib.ArcaneSmithing = PerkLib.mk("Arcane Smithing","Arcane Smithing","Increases the magnitude of Leech and Charge Weapon.");
            PerkLib.Scattering = new ScatteringPerk();
            PerkLib.BroodMother = PerkLib.mk("Brood Mother","Brood Mother","Pregnancy moves twice as fast as a normal woman\'s.");
            PerkLib.SpellcastingAffinity = new SpellcastingAffinityPerk();
            PerkLib.KillerInstinct = new KillerInstinctPerk();
            PerkLib.Androgyny = PerkLib.mk("Androgyny","Androgyny","No gender limits on facial masculinity or femininity.");
            PerkLib.BasiliskWomb = PerkLib.mk("Basilisk Womb","Basilisk Womb","Enables your eggs to be properly fertilized into basilisks of both genders!");
            PerkLib.BeeOvipositor = PerkLib.mk("Bee Ovipositor","Bee Ovipositor","Allows you to lay eggs through a special organ on your insect abdomen, though you need at least 10 eggs to lay.");
            var _temp_43:* = PerkLib;
            _loc143_ = PerkLib.mk("Bimbo Body","Bimbo Body","Gives the body of a bimbo. Tits will never stay below a \'DD\' cup, libido is raised, lust resistance is raised, and upgrades tease.");
            _loc143_.boost("挑逗几率",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
            _loc145_ = _loc144_;
            _loc145_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.33),true);
            _loc146_ = _loc145_;
            _loc146_.boost("性欲增加",NumberFunc_Impl_.fromInt(2),true);
            _loc147_ = _loc146_;
            _loc147_.boost("性欲损失",NumberFunc_Impl_.fromFloat(0.5),true);
            _temp_43.BimboBody = _loc147_;
            var _temp_44:* = PerkLib;
            _loc143_ = PerkLib.mk("Bimbo Brains","Bimbo Brains","Now that you\'ve drank bimbo liqueur, you\'ll never, like, have the attention span and intelligence you once did! But it\'s okay, \'cause you get to be so horny an\' stuff!");
            _loc143_.boost("智力增益",NumberFunc_Impl_.fromFloat(0.5),true);
            _loc144_ = _loc143_;
            _loc144_.boost("智力损失",NumberFunc_Impl_.fromInt(2),true);
            _temp_44.BimboBrains = _loc144_;
            PerkLib.Bloodhound = PerkLib.mk("Bloodhound","Bloodhound","Your excellent sense of smell triggers a primal instinct to hunt when your foe is bleeding - Gain +10% accuracy, +10% critical chance and +20% movement chance against bleeding targets. ");
            var _temp_45:* = PerkLib;
            _loc143_ = PerkLib.mk("Bro Body","Bro Body","Grants an ubermasculine body that\'s sure to impress.");
            _loc143_.boost("挑逗几率",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
            _loc145_ = _loc144_;
            _loc145_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.33),true);
            _loc146_ = _loc145_;
            _loc146_.boost("性欲增加",NumberFunc_Impl_.fromInt(2),true);
            _loc147_ = _loc146_;
            _loc147_.boost("性欲损失",NumberFunc_Impl_.fromFloat(0.5),true);
            _temp_45.BroBody = _loc147_;
            var _temp_46:* = PerkLib;
            _loc143_ = PerkLib.mk("Bro Brains","Bro Brains","Makes thou... thin... fuck, that shit\'s for nerds.");
            _loc143_.boost("智力增益",NumberFunc_Impl_.fromFloat(0.5),true);
            _loc144_ = _loc143_;
            _loc144_.boost("智力损失",NumberFunc_Impl_.fromInt(2),true);
            _temp_46.BroBrains = _loc144_;
            PerkLib.BunnyEggs = PerkLib.mk("Bunny Eggs","Bunny Eggs","Laying eggs has become a normal part of your bunny-body\'s routine.");
            PerkLib.CorruptedNinetails = PerkLib.mk("Corrupted Nine-tails","Corrupted Nine-tails","The mystical energy of the nine-tails surges through you, filling you with phenomenal cosmic power! Your boundless magic allows you to recover quickly after casting spells, but your method of attaining it has corrupted the transformation, preventing you from achieving true enlightenment.",null,true);
            PerkLib.Diapause = PerkLib.mk("Diapause","Diapause","Pregnancy does not advance normally, but develops quickly after taking in fluids.");
            PerkLib.Dragonfire = PerkLib.mk("Dragonfire","Dragonfire","Allows access to a dragon breath attack.");
            PerkLib.EnlightenedNinetails = PerkLib.mk("Enlightened Nine-tails","Enlightened Nine-tails","The mystical energy of the nine-tails surges through you, filling you with phenomenal cosmic power! Your boundless magic allows you to recover quickly after casting spells.",null,true);
            PerkLib.Feeder = PerkLib.mk("Feeder","Feeder","Lactation does not decrease and gives a compulsion to breastfeed others.");
            var _temp_47:* = PerkLib;
            _loc143_ = PerkLib.mk("Flexibility","Flexibility","Grants cat-like flexibility. Useful for dodging and \'fun\'.");
            _loc143_.boost("闪避几率",NumberFunc_Impl_.fromInt(6),false);
            _temp_47.Flexibility = _loc143_;
            var _temp_48:* = PerkLib;
            _loc143_ = PerkLib.mk("Futa Faculties","Futa Faculties","It\'s super hard to think about stuff that like, isn\'t working out or fucking!");
            _loc143_.boost("智力增益",NumberFunc_Impl_.fromFloat(0.5),true);
            _loc144_ = _loc143_;
            _loc144_.boost("智力损失",NumberFunc_Impl_.fromInt(2),true);
            _temp_48.FutaFaculties = _loc144_;
            var _temp_49:* = PerkLib;
            _loc143_ = PerkLib.mk("Futa Form","Futa Form","Ensures that your body fits the Futa look (Tits DD+, Dick 8\"+, & Pussy). Also keeps your lusts burning bright and improves the tease skill.");
            _loc143_.boost("挑逗几率",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
            _loc145_ = _loc144_;
            _loc145_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.33),true);
            _loc146_ = _loc145_;
            _loc146_.boost("性欲增加",NumberFunc_Impl_.fromInt(2),true);
            _loc147_ = _loc146_;
            _loc147_.boost("性欲损失",NumberFunc_Impl_.fromFloat(0.5),true);
            _temp_49.FutaForm = _loc147_;
            PerkLib.HarpyWomb = PerkLib.mk("Harpy Womb","Harpy Womb","Increases all laid eggs to large size so long as you have harpy legs and a harpy tail.");
            PerkLib.Incorporeality = PerkLib.mk("Incorporeality","Incorporeality","Allows you to fade into a ghost-like state and temporarily possess others.");
            PerkLib.Lustserker = PerkLib.mk("Lustserker","Lustserker","Grants \'Lustserk\' ability.");
            PerkLib.MilkMaid = new MilkMaidPerk();
            PerkLib.MinotaurCumAddict = PerkLib.mk("Minotaur Cum Addict","Minotaur Cum Addict","Causes you to crave minotaur cum frequently. You cannot shake this addiction.");
            PerkLib.MinotaurCumResistance = PerkLib.mk("Minotaur Cum Resistance","Minotaur Cum Resistance","You can never become a minotaur cum addict. Grants immunity to minotaur cum addiction.");
            PerkLib.Oviposition = PerkLib.mk("Oviposition","Oviposition","Causes you to regularly lay eggs when not otherwise pregnant.");
            var _temp_50:* = PerkLib;
            _loc143_ = PerkLib.mk("Purity Blessing","Purity Blessing","Reduces the rate at which your corruption, libido, and lust increase. Reduces minimum libido slightly.");
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromInt(5),false);
            _loc144_ = _loc143_;
            _loc144_.boost("最低性欲",NumberFunc_Impl_.fromInt(-2),false);
            _loc145_ = _loc144_;
            _loc145_.boost("性欲增加",NumberFunc_Impl_.fromFloat(0.75),true);
            _loc146_ = _loc145_;
            _loc146_.boost("腐化增加",NumberFunc_Impl_.fromFloat(0.5),true);
            _temp_50.PurityBlessing = _loc146_;
            PerkLib.RapierTraining = PerkLib.mk("Rapier Training","Rapier Training","After finishing of your training, increase attack power of any rapier you\'re using.");
            PerkLib.SatyrSexuality = PerkLib.mk("Satyr Sexuality","Satyr Sexuality","Thanks to your satyr biology, you now have the ability to impregnate both vaginas and asses. Also increases your virility rating. (Anal impregnation not implemented yet)");
            PerkLib.SlimeCore = PerkLib.mk("Slime Core","Slime Core","Grants more control over your slimy body, allowing you to go twice as long without fluids.");
            PerkLib.SpiderOvipositor = PerkLib.mk("Spider Ovipositor","Spider Ovipositor","Allows you to lay eggs through a special organ on your arachnid abdomen, though you need at least 10 eggs to lay.");
            PerkLib.ThickSkin = PerkLib.mk("Thick Skin","Thick Skin","Toughens your dermis to provide 2 points of armor.");
            PerkLib.TransformationResistance = PerkLib.mk("Transformation Resistance","Transformation Resistance","Reduces the likelihood of undergoing a transformation. Disables Bad Ends from transformative items.");
            PerkLib.LoliliciousBody = PerkLib.mk("Lolilicious Body","Liddellium Resistance","Makes it difficult to escape your new loli form by massively reducing the likelihood of transformation.");
            PerkLib.ParasiteMusk = PerkLib.mk("Parasite Musk","Parasite Musk","The Bog parasite constantly releases pheromones that boost cum production and allow for a special move in combat.");
            PerkLib.AntiCoagulant = PerkLib.mk("Anti Coagulant","Anti Coagulant","Bleed effects on opponents last one turn longer.");
            PerkLib.MermaidChant = PerkLib.mk("Mermaid Chant","Aqueous Allure","Grants Chant, a lulling song empowered by seduction.");
            PerkLib.AChristmasCarol = PerkLib.mk("A Christmas Carol","A Christmas Carol","Grants year-round access to Christmas event. Note that some events are only accessible once per year.",null,true);
            PerkLib.BasiliskResistance = PerkLib.mk("Basilisk Resistance","Basilisk Resistance","Grants immunity to Basilisk\'s paralyzing gaze. Disables Basilisk Bad End.");
            PerkLib.BulgeArmor = PerkLib.mk("Bulge Armor","Bulge Armor","Grants a 5 point damage bonus to dick-based tease attacks.");
            PerkLib.Cornucopia = PerkLib.mk("Cornucopia","Cornucopia","Vaginal and Anal capacities increased by 30.",null,true);
            PerkLib.CounterAB = PerkLib.mk("Counter Stance","Counter Stance","The Dullahan\'s teachings allows you to enter a countering stance in combat.",null);
            PerkLib.ElvenBounty = new ElvenBountyPerk();
            PerkLib.FerasBoonAlpha = PerkLib.mk("Fera\'s Boon - Alpha","Fera\'s Boon - Alpha","Increases the rate your cum builds up and cum production in general.",null,true);
            PerkLib.FerasBoonBreedingBitch = PerkLib.mk("Fera\'s Boon - Breeding Bitch","Fera\'s Boon - Breeding Bitch","Increases fertility and reduces the time it takes to birth young.",null,true);
            PerkLib.FerasBoonMilkingTwat = PerkLib.mk("Fera\'s Boon - Milking Twat","Fera\'s Boon - Milking Twat","Keeps your pussy from ever getting too loose and increases pregnancy speed.",null,true);
            PerkLib.FerasBoonSeeder = PerkLib.mk("Fera\'s Boon - Seeder","Fera\'s Boon - Seeder","Increases cum output by 1,000 mLs.",null,true);
            PerkLib.FerasBoonWideOpen = PerkLib.mk("Fera\'s Boon - Wide Open","Fera\'s Boon - Wide Open","Keeps your pussy permanently gaped and increases pregnancy speed.",null,true);
            PerkLib.FireLord = PerkLib.mk("Fire Lord","Fire Lord","Akbal\'s blessings grant the ability to breathe burning green flames.");
            PerkLib.Hellfire = PerkLib.mk("Hellfire","Hellfire","Grants a corrupted fire breath attack, like the hellhounds in the mountains.");
            var _temp_51:* = PerkLib;
            _loc143_ = PerkLib.mk("Luststick Adapted","Luststick Adapted","Grants immunity to the lust-increasing effects of lust-stick and allows its use.");
            _loc143_.boost("最低欲望",NumberFunc_Impl_.fromInt(10),false);
            _loc144_ = _loc143_;
            _loc144_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.1),true);
            _temp_51.LuststickAdapted = _loc144_;
            PerkLib.MagicalFertility = PerkLib.mk("Magical Fertility","Magical Fertility","10% higher chance of pregnancy and increased pregnancy speed.");
            PerkLib.MagicalVirility = PerkLib.mk("Magical Virility","Magical Virility","200 mLs more cum per orgasm and enhanced virility.");
            PerkLib.MaraesGiftButtslut = PerkLib.mk("Marae\'s Gift - Buttslut","Marae\'s Gift - Buttslut","Makes your anus provide lubrication when aroused.");
            PerkLib.MaraesGiftFertility = PerkLib.mk("Marae\'s Gift - Fertility","Marae\'s Gift - Fertility","Greatly increases fertility and increases base pregnancy speed.");
            PerkLib.MaraesGiftProfractory = PerkLib.mk("Marae\'s Gift - Profractory","Marae\'s Gift - Profractory","Causes your cum to build up at 3x the normal rate.");
            PerkLib.MaraesGiftStud = PerkLib.mk("Marae\'s Gift - Stud","Marae\'s Gift - Stud","Increases your cum production and potency greatly.");
            PerkLib.MarbleResistant = PerkLib.mk("Marble Resistant","Marble Resistant","Provides resistance to the addictive effects of bottled LaBova milk.");
            PerkLib.MarblesMilk = PerkLib.mk("Marble\'s Milk","Marble\'s Milk","Requires you to drink LaBova milk frequently or eventually die. You cannot shake this addiction.");
            PerkLib.Misdirection = new MisdirectionPerk();
            var _temp_52:* = PerkLib;
            _loc143_ = PerkLib.mk("Omnibus\' Gift","Omnibus\'s Gift","Increases minimum lust but provides some lust resistance.");
            _loc143_.boost("最低欲望",NumberFunc_Impl_.fromInt(35),false);
            _loc144_ = _loc143_;
            _loc144_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.18),true);
            _temp_52.OmnibusGift = _loc144_;
            PerkLib.OneTrackMind = PerkLib.mk("One Track Mind","One Track Mind","Your constant desire for sex causes your sexual organs to be able to take larger insertions and disgorge greater amounts of fluid.",null,true);
            PerkLib.PilgrimsBounty = PerkLib.mk("Pilgrim\'s Bounty","Pilgrim\'s Bounty","Causes you to always cum as hard as if you had max lust.",null,true);
            var _temp_53:* = PerkLib;
            _loc143_ = PerkLib.mk("Pure and Loving","Pure and Loving","Your caring attitude towards love and romance makes you slightly more resistant to lust and corruption.",null,true);
            _loc143_.boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.05),true);
            _loc144_ = _loc143_;
            _loc144_.boost("腐化增加",NumberFunc_Impl_.fromFloat(0.75),true);
            _temp_53.PureAndLoving = _loc144_;
            PerkLib.PotentProstate = PerkLib.mk("Potent Prostate","Potent Prostate","Whenever you have a dick and no balls(or tiny balls), produce cum equivalent to a pair of large balls.",null);
            var _temp_54:* = PerkLib;
            _loc143_ = PerkLib.mk("Mystic Learnings","Mystic Learnings","Reading and fully comprehending the Heptarchia Mystica allows you to cast stronger spells.",null);
            _loc143_.boost("法术修正",NumberFunc_Impl_.fromInt(25),false);
            _temp_54.MysticLearnings = _loc143_;
            PerkLib.PotentPregnancy = PerkLib.mk("Potent Pregnancy","Potent Pregnancy","Whenever you are pregnant, you gain strength and toughness bonuses.",null);
            PerkLib.ParasiteQueen = PerkLib.mk("Parasite Queen","Parasite Queen","Allow you to sacrifice a parasite to boost your stats in battle.",null);
            PerkLib.Revelation = PerkLib.mk("Revelation","Revelation","You have seen things beyond mortal comprehension. Peering into the abyss has a lower chance of breaking your psyche.",null,true);
            PerkLib.RiddleSight = new RiddleSightPerk();
            var _temp_55:* = PerkLib;
            _loc143_ = PerkLib.mk("Sensual Lover","Sensual Lover","Your sensual attitude towards love and romance makes your tease ability slightly more effective.",null,true);
            _loc143_.boost("挑逗几率",NumberFunc_Impl_.fromInt(2),false);
            _loc144_ = _loc143_;
            _loc144_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(2),false);
            _temp_55.SensualLover = _loc144_;
            PerkLib.TerrestrialFire = PerkLib.mk("Terrestrial Fire","Terrestrial Fire","You\'ve unlocked a new type of magic based on the elements of Earth and Fire.");
            PerkLib.WarDance = PerkLib.mk("War Dance","War Dance","+15% damage and +20% accuracy in hand to hand combat.");
            PerkLib.Whispered = PerkLib.mk("Whispered","Whispered","Akbal\'s blessings grant limited telepathy that can induce fear.");
            PerkLib.NephilaQueen = PerkLib.mk("Nephila Queen","Nephila Queen","Allow you to sacrifice a nephila parasite to boost your intelligence in battle.");
            PerkLib.NephilaArchQueen = PerkLib.mk("Nephila Arch Queen","Nephila Arch Queen","Your womb dwarfs you, serving as a veritable paradise for the countless slime monsters within; as a result, you are a crowned nephila arch queen and can use the Unleash Brood attack to send them forth to fight for you in battle.");
            PerkLib.ControlledBreath = new ControlledBreathPerk();
            PerkLib.CleansingPalm = new CleansingPalmPerk();
            PerkLib.Enlightened = new EnlightenedPerk();
            PerkLib.MothBedding = PerkLib.mk("Moth Bedding","Moth Bedding","The pure white sheets made of your daughter\'s silk grant you an increased sense of potency.");
            PerkLib.SpiderBedding = PerkLib.mk("Spider-Silk Bedding","Spider-Silk Bedding","Your spider-silk sheets allow you to recover more quickly from fatigue.");
            PerkLib.Acid = PerkLib.mk("Acid","Acid","");
            PerkLib.PoisonImmune = PerkLib.mk("PoisonImmune","Poison Immune","Target is immune to poison effects.").setEnemyDesc("Target is immune to poison effects.");
            PerkLib.BleedImmune = PerkLib.mk("BleedImmune","Bleed Immune","Target is immune to bleeding effects.").setEnemyDesc("Target is immune to bleeding effects.");
            PerkLib.ExtraDodge = PerkLib.mk("ExtraDodge","Extra Dodgy","Target has a higher chance to dodge attacks.").setEnemyDesc("Target has a higher chance to dodge attacks.");
            PerkLib.PhysicalResistance = PerkLib.mk("PhysicalResistance","Physical Resistance","Target is more resilient to physical attacks.").setEnemyDesc("Target is more resilient to physical attacks.");
            PerkLib.Invincible = PerkLib.mk("Invincible","Invincible","Target is invincible, impervious to all damage!").setEnemyDesc("Target is invincible, and will take no damage from any attack.");
            PerkLib.BlindImmune = PerkLib.mk("Blind Immune","Blind Immune","Blind does not affect this target.").setEnemyDesc("Target is immune to blindness.");
            PerkLib.PsiImmune = PerkLib.mk("Psi Immune","Psi Immune","Psionic attacks do not affect this target.").setEnemyDesc("Target is immune to psionic effects.");
            PerkLib.FearImmune = PerkLib.mk("Fear Immune","Fear Immune","Target is immune to Fear effects.").setEnemyDesc("Target is immune to Fear effects.");
            PerkLib.Flying = PerkLib.mk("Flying","Flying","Target can fly, and regular attacks will hit you even if you\'re flying.").setEnemyDesc("Target can fly, and regular attacks will hit you even if you\'re flying.");
            PerkLib.ChargingSwings = PerkLib.mk("ChargingSwings","Charging Swings","This creature\'s regular attacks remove distance.").setEnemyDesc("Target\'s regular attacks remove distance.");
            PerkLib.Prescience = PerkLib.mk("Prescience","Prescience","This creature gains a cumulative chance to dodge moves the more they\'re used against it.").setEnemyDesc("Target gains a cumulative chance to dodge moves the more they\'re used against it.");
            PerkLib.SoftSkull = PerkLib.mk("SoftSkull","SoftSkull","Stuns on this creature last one turn longer.").setEnemyDesc("Stuns on this target last one turn longer.");
            PerkLib.Immovable = PerkLib.mk("Immovable","Immovable","This creature cannot be moved, and will not move.").setEnemyDesc("Target cannot be moved, and will not move.");
            PerkLib.BiteImmune = PerkLib.mk("Bite Immune","Bite Immune","This creature cannot be bitten.").setEnemyDesc("Your jaws cannot pierce the target\'s defences.");
            PerkLib.StunImmune = PerkLib.mk("Stun Immune","Stun Immune","This creature cannot be stunned.").setEnemyDesc("Target is immune to stun effects.");
            var _temp_56:* = PerkLib;
            PerkLib.initRequirements();
            _temp_56.___init = null;
         }
         if(!BindingPane.init__)
         {
            BindingPane.init__ = true;
            var _temp_57:* = BindingPane;
            _loc1_ = new IntMap();
            _loc1_.h[48] = "0";
            _loc1_.h[49] = "1";
            _loc1_.h[50] = "2";
            _loc1_.h[51] = "3";
            _loc1_.h[52] = "4";
            _loc1_.h[53] = "5";
            _loc1_.h[54] = "6";
            _loc1_.h[55] = "7";
            _loc1_.h[56] = "8";
            _loc1_.h[57] = "9";
            _loc1_.h[65] = "A";
            _loc1_.h[66] = "B";
            _loc1_.h[67] = "C";
            _loc1_.h[68] = "D";
            _loc1_.h[69] = "E";
            _loc1_.h[70] = "F";
            _loc1_.h[71] = "G";
            _loc1_.h[72] = "H";
            _loc1_.h[73] = "I";
            _loc1_.h[74] = "J";
            _loc1_.h[75] = "K";
            _loc1_.h[76] = "L";
            _loc1_.h[77] = "M";
            _loc1_.h[78] = "N";
            _loc1_.h[79] = "O";
            _loc1_.h[80] = "P";
            _loc1_.h[81] = "Q";
            _loc1_.h[82] = "R";
            _loc1_.h[83] = "S";
            _loc1_.h[84] = "T";
            _loc1_.h[85] = "U";
            _loc1_.h[86] = "V";
            _loc1_.h[87] = "W";
            _loc1_.h[88] = "X";
            _loc1_.h[89] = "Y";
            _loc1_.h[90] = "Z";
            _loc1_.h[96] = "小键盘0";
            _loc1_.h[97] = "小键盘1";
            _loc1_.h[98] = "小键盘2";
            _loc1_.h[99] = "小键盘3";
            _loc1_.h[100] = "小键盘4";
            _loc1_.h[101] = "小键盘5";
            _loc1_.h[102] = "小键盘6";
            _loc1_.h[103] = "小键盘7";
            _loc1_.h[104] = "小键盘8";
            _loc1_.h[105] = "小键盘9";
            _loc1_.h[106] = "*";
            _loc1_.h[107] = "+";
            _loc1_.h[108] = "回车键";
            _loc1_.h[109] = "-";
            _loc1_.h[110] = ".";
            _loc1_.h[111] = "/";
            _loc1_.h[112] = "F1";
            _loc1_.h[113] = "F2";
            _loc1_.h[114] = "F3";
            _loc1_.h[115] = "F4";
            _loc1_.h[116] = "F5";
            _loc1_.h[117] = "F6";
            _loc1_.h[118] = "F7";
            _loc1_.h[119] = "F8";
            _loc1_.h[120] = "F9";
            _loc1_.h[121] = "F10";
            _loc1_.h[122] = "F11";
            _loc1_.h[123] = "F12";
            _loc1_.h[124] = "F13";
            _loc1_.h[125] = "F14";
            _loc1_.h[126] = "F15";
            _loc1_.h[8] = "退格键";
            _loc1_.h[9] = "Tab键";
            _loc1_.h[18] = "Alt键";
            _loc1_.h[13] = "回车键";
            _loc1_.h[15] = "‌⌘‌";
            _loc1_.h[16] = "Shift键";
            _loc1_.h[17] = "Control键";
            _loc1_.h[19] = "Break键";
            _loc1_.h[20] = "大写锁键";
            _loc1_.h[21] = "Numpad键";
            _loc1_.h[27] = "Esc键";
            _loc1_.h[32] = "空格键";
            _loc1_.h[33] = "PageUp键";
            _loc1_.h[34] = "PageDown键";
            _loc1_.h[35] = "End键";
            _loc1_.h[36] = "Home键";
            _loc1_.h[37] = "←";
            _loc1_.h[39] = "→";
            _loc1_.h[38] = "↑";
            _loc1_.h[40] = "↓";
            _loc1_.h[45] = "Insert键";
            _loc1_.h[46] = "Delete键";
            _loc1_.h[144] = "Numlock键";
            _loc1_.h[186] = ";";
            _loc1_.h[187] = "=";
            _loc1_.h[188] = ",";
            _loc1_.h[189] = "-";
            _loc1_.h[190] = ".";
            _loc1_.h[191] = "/";
            _loc1_.h[192] = "`";
            _loc1_.h[219] = "[";
            _loc1_.h[220] = "\\";
            _loc1_.h[221] = "]";
            _loc1_.h[222] = "\'";
            _temp_57._keyDict = _loc1_;
         }
         if(!GameViewData.init__)
         {
            GameViewData.init__ = true;
            GameViewData.injectedDisplaySettings = new StringMap();
         }
         if(!KFLAGS.init__)
         {
            KFLAGS.init__ = true;
            KFLAGS.flags = new IntMap();
            KFLAGS.MARBLE_PREGNANCY_INCUBATION = 1;
            KFLAGS.MARBLE_PREGNANCY_TYPE = 2;
            KFLAGS.MARBLE_LUST = 3;
            KFLAGS.MARBLE_DICK_TYPE = 4;
            KFLAGS.MARBLE_DICK_LENGTH = 5;
            KFLAGS.MARBLE_DICK_THICKNESS = 6;
            KFLAGS.MARBLE_UNUSED_DOOTY = 7;
            KFLAGS.MARBLE_KIDS = 8;
            KFLAGS.MARBLE_NURSERY_CONSTRUCTION = 9;
            KFLAGS.PLAYER_PREGGO_WITH_WORMS = 10;
            KFLAGS.TIMES_FUCKED_URTA = 11;
            KFLAGS.URTA_COMFORTABLE_WITH_OWN_BODY = 12;
            KFLAGS.URTA_TIME_SINCE_LAST_CAME = 13;
            KFLAGS.PC_SEEN_URTA_SEX_TOYS = 14;
            KFLAGS.PLAYER_RESISTED_AKBAL = 15;
            KFLAGS.AKBAL_SUBMISSION_COUNTER = 16;
            KFLAGS.AKBAL_SUBMISSION_STATE = 17;
            KFLAGS.MINOTAUR_CUM_ADDICTION_TRACKER = 18;
            KFLAGS.TIME_SINCE_LAST_CONSUMED_MINOTAUR_CUM = 19;
            KFLAGS.MINOTAUR_CUM_ADDICTION_STATE = 20;
            KFLAGS.MINOTAUR_CUM_REALLY_ADDICTED_STATE = 21;
            KFLAGS.IN_COMBAT_USE_PLAYER_WAITED_FLAG = 22;
            KFLAGS.PC_FETISH = 23;
            KFLAGS.PC_MET_CERAPH = 24;
            KFLAGS.INCREASED_HAIR_GROWTH_TIME_REMAINING = 25;
            KFLAGS.INCREASED_HAIR_GROWTH_SERUM_TIMES_APPLIED = 26;
            KFLAGS.CHEAT_ENTERING_COUNTER = 27;
            KFLAGS.TIMES_CHEATED_COUNTER = 28;
            KFLAGS.URTA_PC_AFFECTION_COUNTER = 29;
            KFLAGS.URTA_PC_LOVE_COUNTER = 30;
            KFLAGS.URTA_ANGRY_AT_PC_COUNTDOWN = 31;
            KFLAGS.URTA_KNOWS_PC_HAS_MARBLE_FOLLOWER = 32;
            KFLAGS.PC_SEEN_URTA_BADASS_FIGHT = 33;
            KFLAGS.PC_ENCOUNTERED_CHRISTMAS_ELF_BEFORE = 34;
            KFLAGS.AMILY_MET = 35;
            KFLAGS.AMILY_VILLAGE_ENCOUNTERS_DISABLED = 36;
            KFLAGS.AMILY_GROSSED_OUT_BY_WORMS = 37;
            KFLAGS.AMILY_AFFECTION = 38;
            KFLAGS.AMILY_OFFER_ACCEPTED = 39;
            KFLAGS.AMILY_BIRTH_TOTAL = 40;
            KFLAGS.AMILY_INCUBATION = 41;
            KFLAGS.AMILY_FUCK_COUNTER = 42;
            KFLAGS.AMILY_FOLLOWER = 43;
            KFLAGS.AMILY_VILLAGE_ACCESSIBLE = 44;
            KFLAGS.AMILY_WANG_LENGTH = 45;
            KFLAGS.AMILY_WANG_GIRTH = 46;
            KFLAGS.AMILY_CUP_SIZE = 47;
            KFLAGS.AMILY_NIPPLE_LENGTH = 48;
            KFLAGS.AMILY_HIP_RATING = 49;
            KFLAGS.AMILY_ASS_SIZE = 50;
            KFLAGS.AMILY_LACTATION_RATE = 51;
            KFLAGS.AMILY_CLOTHING = 52;
            KFLAGS.LUMI_MET = 53;
            KFLAGS.NUMBER_OF_TIMES_MET_SCYLLA = 54;
            KFLAGS.TIMES_ENCOUNTED_TAMANIS_DAUGHTERS = 55;
            KFLAGS.TAMANI_TIMES_HYPNOTISED = 56;
            KFLAGS.TAMANI_DAUGHTER_PREGGO_COUNTDOWN = 57;
            KFLAGS.TAMANI_DAUGHTER_CHAIR_COUNTER = 58;
            KFLAGS.TIMES_FUCKED_TAMANIS_DAUGHTERS = 59;
            KFLAGS.UNABLE_TO_MASTURBATE_BECAUSE_CENTAUR = 60;
            KFLAGS.CERULEAN_POTION_BAD_END_FUTA_COUNTER = 61;
            KFLAGS.CERULEAN_POTION_NEUTER_ATTEMPTED = 62;
            KFLAGS.TEMP_STORAGE_SAVE_DELETION = 63;
            KFLAGS.MARBLE_GROSSED_OUT_BECAUSE_WORM_INFESTATION = 64;
            KFLAGS.FORCE_BEE_TO_PRODUCE_HONEY = 65;
            KFLAGS.HAIR_GROWTH_STOPPED_BECAUSE_LIZARD = 66;
            KFLAGS.TIMES_AUTOFELLATIO_DUE_TO_CAT_FLEXABILITY = 67;
            KFLAGS.EDRYN_PREGNANCY_INCUBATION = 68;
            KFLAGS.EDRYN_NUMBER_OF_KIDS = 69;
            KFLAGS.EDRYN_NEVER_SEE_AGAIN = 70;
            KFLAGS.EDRYN_PREGNANT_AND_NOT_TOLD_PC_YET = 71;
            KFLAGS.EDRYN_NEEDS_TO_TALK_ABOUT_KID = 72;
            KFLAGS.EDRYN_GIFT_COUNTER = 73;
            KFLAGS.AMILY_MET_PURE_JOJO = 74;
            KFLAGS.AMILY_SPAR_WITH_PURE_JOJO = 75;
            KFLAGS.AMILY_PISSED_PC_CORRUPED_JOJO = 76;
            KFLAGS.AMILY_WAIT_FOR_PC_FIX_JOJO = 77;
            KFLAGS.AMILY_BLOCK_COUNTDOWN_BECAUSE_CORRUPTED_JOJO = 78;
            KFLAGS.JOJO_FIXED_STATUS = 79;
            KFLAGS.JOJO_DEAD_OR_GONE = 80;
            KFLAGS.AMILY_DISCOVERED_TENTATLE_JOJO = 81;
            KFLAGS.AMILY_MET_RATHAZUL = 82;
            KFLAGS.RATHAZUL_CORRUPT_JOJO_FREAKOUT = 83;
            KFLAGS.JOJO_RATHAZUL_INTERACTION_COUNTER = 84;
            KFLAGS.MARBLE_OR_AMILY_FIRST_FOR_FREAKOUT = 85;
            KFLAGS.AMILY_NOT_FREAKED_OUT = 86;
            KFLAGS.RATHAZUL_CAMP_INTERACTION_COUNTDOWN = 87;
            KFLAGS.DISCOVERED_HIGH_MOUNTAIN = 88;
            KFLAGS.COMBAT_BONUS_XP_VALUE = 89;
            KFLAGS.MET_SOPHIE_COUNTER = 90;
            KFLAGS.FUCKED_SOPHIE_COUNTER = 91;
            KFLAGS.BREASTFEAD_SOPHIE_COUNTER = 92;
            KFLAGS.SOPHIE_PREGNANCY_TYPE = 93;
            KFLAGS.SOPHIE_EGGS_LAID = 94;
            KFLAGS.PC_CURRENTLY_LUSTSTICK_AFFECTED = 95;
            KFLAGS.SOPHIE_ANGRY_AT_PC_COUNTER = 96;
            KFLAGS.TIMES_PISSED_OFF_SOPHIE_COUNTER = 97;
            KFLAGS.TIMES_FUCKED_SOPHIE_LESBIAN = 98;
            KFLAGS.CORRUPT_MARAE_FOLLOWUP_ENCOUNTER_STATE = 100;
            KFLAGS.FOUND_WIZARD_STAFF = 101;
            KFLAGS.JOJO_LAST_MEDITATION = 102;
            KFLAGS.TIMES_AUTOFELLATIOED_EXGARTUAN = 103;
            KFLAGS.WHITNEY_GEMS_PAID_THIS_WEEK = 104;
            KFLAGS.TIMES_MET_SCYLLA_IN_ADDICTION_GROUP = 105;
            KFLAGS.TIMES_SCYLLA_ADDICT_GROUP_EXPLOITED = 106;
            KFLAGS.SCYLLA_TIMES_SHARED_IN_ADDICT_GROUP = 107;
            KFLAGS.SCYLLA_MILK_THERAPY_TIMES = 108;
            KFLAGS.SCYLLA_CUM_THERAPY_TIMES = 109;
            KFLAGS.SCYLLA_SEX_THERAPY_TIMES = 110;
            KFLAGS.CERULEAN_SUCCUBUS_HERM_COUNTER = 111;
            KFLAGS.USED_MILKER_TODAY = 112;
            KFLAGS.DISCOVERED_DUNGEON_2_ZETAZ = 113;
            KFLAGS.DEFEATED_ZETAZ = 114;
            KFLAGS.ZETAZ_DOOR_UNLOCKED = 115;
            KFLAGS.ZETAZ_IMP_HORDE_DEFEATED = 116;
            KFLAGS.ZETAZ_FUNGUS_ROOM_DEFEATED = 117;
            KFLAGS.SILLY_MODE_PONIES = 118;
            KFLAGS.FREED_VALA = 119;
            KFLAGS.WEEKLY_FAIRY_ORGY_COUNTDOWN = 120;
            KFLAGS.ENCOUNTERED_VALA_AT_BAR = 121;
            KFLAGS.FUCKED_VALA_AT_BAR_TODAY = 122;
            KFLAGS.TIMES_FUCKED_VALA_IN_DUNGEON = 123;
            KFLAGS.INVESTIGATED_VALA_AFTER_ZETAZ_DEFEATED = 124;
            KFLAGS.TIME_SINCE_VALA_ATTEMPTED_RAPE_PC = 125;
            KFLAGS.TIMES_PC_DEFEATED_VALA = 126;
            KFLAGS.TIMES_PC_DEFEATED_VALA_AND_RAEPED = 127;
            KFLAGS.ZETAZ_DEFEATED_AND_KILLED = 128;
            KFLAGS.ZETAZ_LAIR_TOOK_BONDAGE_STRAPS = 129;
            KFLAGS.ZETAZ_LAIR_DEMON_VENDOR_PRESENT = 130;
            KFLAGS.TIMES_EXPLORED_PLAINS = 131;
            KFLAGS.MET_BUNBUN = 132;
            KFLAGS.RAPHEAL_COUNTDOWN_TIMER = 133;
            KFLAGS.RAPHAEL_MET = 134;
            KFLAGS.RAPHAEL_DRESS_GIVEN = 135;
            KFLAGS.REJECTED_RAPHAEL = 136;
            KFLAGS.RAPHAEL_RAPIER_TRANING = 137;
            KFLAGS.RAPHAEL_INTELLIGENCE_TRAINING = 138;
            KFLAGS.RAPHAEL_DISGUSTED_BY_PC_APPEARANCE = 139;
            KFLAGS.HELLHOUND_MASTER_PROGRESS = 141;
            KFLAGS.SALON_MINOCUM_UNLOCKED = 142;
            KFLAGS.TIMES_CAUGHT_URTA_WITH_SCYLLA = 143;
            KFLAGS.TIMES_ADVANTAGED_SCYLLA_MULTICOCKS = 144;
            KFLAGS.URTA_CONFRONTED_SCYLLA = 145;
            KFLAGS.URTA_DRINK_FREQUENCY = 146;
            KFLAGS.URTA_BANNED_FROM_SCYLLA = 147;
            KFLAGS.URTA_PAID_OUT_RAPHAELS_BOUNTY = 148;
            KFLAGS.RAPHAEL_BONED = 149;
            KFLAGS.DOMINIKA_STAGE = 150;
            KFLAGS.DOMINIKA_SUCKED_OFF_LARGE_COCKS = 151;
            KFLAGS.DOMINIKA_SUCKED_OFF_SMALL_COCKS = 152;
            KFLAGS.DOMINIKA_VAGINAL_ORAL_RECEIVED = 153;
            KFLAGS.DOMINIKA_EMBARRASSED_ABOUT_MAGIC = 154;
            KFLAGS.DOMINIKA_LEARNING_COOLDOWN = 155;
            KFLAGS.DOMINIKA_SUCKED_OFF_DOGCOCKS = 156;
            KFLAGS.DOMINIKA_SPECIAL_FOLLOWUP = 157;
            KFLAGS.AMILY_MET_AS = 158;
            KFLAGS.AMILY_CONFESSED_LESBIAN = 159;
            KFLAGS.AMILY_TIMES_FUCKED_FEMPC = 160;
            KFLAGS.AMILY_HERM_TIMES_FUCKED_BY_FEMPC = 161;
            KFLAGS.PC_TIMES_BIRTHED_AMILYKIDS = 162;
            KFLAGS.PC_PENDING_PREGGERS = 163;
            KFLAGS.AMILY_PC_GENDER = 164;
            KFLAGS.AMILY_HERM_QUEST = 165;
            KFLAGS.AMILY_ALLOWS_FERTILITY = 166;
            KFLAGS.LIFETIME_GYM_MEMBER = 167;
            KFLAGS.AMILY_CORRUPT_FLIPOUT = 168;
            KFLAGS.AMILY_DRUG_MADE_COUNTER = 169;
            KFLAGS.AMILY_CORRUPTION = 170;
            KFLAGS.AMILY_HAS_BALLS_AND_SIZE = 171;
            KFLAGS.AMILY_VAGINAL_WETNESS = 172;
            KFLAGS.AMILY_CAMP_CORRUPTION_FREAKED = 173;
            KFLAGS.DOMINIKA_SUCKED_OFF_HORSECOCKS = 174;
            KFLAGS.DOMINIKA_DRAMA = 175;
            KFLAGS.TIMES_HAD_YOGA = 176;
            KFLAGS.COTTON_MET_FUCKED = 177;
            KFLAGS.GYM_FEES_PAID_TODAY = 178;
            KFLAGS.JASUN_MET = 179;
            KFLAGS.JASUN_FUCKED_COUNTER = 180;
            KFLAGS.JASUN_NAME_LEARNED = 181;
            KFLAGS.GYM_MACHINE_STATUS = 182;
            KFLAGS.TIMES_USED_SEX_MACHINE_AS_MALE = 183;
            KFLAGS.TIMES_USED_SEX_MACHINE_AS_FEMALE = 184;
            KFLAGS.TIMES_USED_SEX_MACHINE_AS_EUNUCH = 185;
            KFLAGS.TIMES_USED_SEX_MACHINE_AS_HERM = 186;
            KFLAGS.NEW_GAME_PLUS_BONUS_STORED_XP = 187;
            KFLAGS.NEW_GAME_PLUS_BONUS_STORED_ITEMS = 188;
            KFLAGS.NEW_GAME_PLUS_BONUS_WEAPON_NAME = 189;
            KFLAGS.NEW_GAME_PLUS_BONUS_WEAPON_VALUE = 190;
            KFLAGS.NEW_GAME_PLUS_BONUS_WEAPON_PERK = 191;
            KFLAGS.NEW_GAME_PLUS_BONUS_WEAPON_VERB = 192;
            KFLAGS.NEW_GAME_PLUS_BONUS_WEAPON_ATTACK = 193;
            KFLAGS.NEW_GAME_PLUS_BONUS_ARMOR_NAME = 194;
            KFLAGS.NEW_GAME_PLUS_BONUS_ARMOR_PERK = 195;
            KFLAGS.NEW_GAME_PLUS_BONUS_ARMOR_DEFENSE = 196;
            KFLAGS.NEW_GAME_PLUS_BONUS_ARMOR_VALUE = 197;
            KFLAGS.TEMP_STORAGE_PASTRY_NAME = 198;
            KFLAGS.TEMP_STORAGE_PASTRY_PRICE = 199;
            KFLAGS.MINOTAUR_CUM_ECLAIR_UNLOCKED = 200;
            KFLAGS.TIMES_VISITED_BAKERY = 201;
            KFLAGS.TIMES_FUCKED_HECKEL_BLOWJOB = 202;
            KFLAGS.TIMES_FUCKED_HECKEL_ANAL = 203;
            KFLAGS.MET_HECKEL = 204;
            KFLAGS.MET_IFRIS = 205;
            KFLAGS.TIMES_FUCKED_IFRIS_BLOWJOB = 206;
            KFLAGS.TIMES_FUCKED_IFRIS_LICKED = 207;
            KFLAGS.IFRIS_SHOWED_OFF = 208;
            KFLAGS.HAVE_ENCOUNTERED_GNOLL_PLAINS = 209;
            KFLAGS.BAZAAR_SLIPPERY_SQUEEZE_VISITED = 210;
            KFLAGS.BAZAAR_ENTERED = 211;
            KFLAGS.BAZAAR_ENCOUNTERED = 212;
            KFLAGS.CINNABAR_HOUSE_VISITED = 213;
            KFLAGS.CINNABAR_NUMBER_ENCOUNTERS = 214;
            KFLAGS.CINNABAR_NUMBER_TIMES_FUCKED = 215;
            KFLAGS.CINNABAR_FUCKED_CORRUPT_PREVIOUSLY = 216;
            KFLAGS.CERAPH_GENITAL_STEAL_CHOICE = 217;
            KFLAGS.CERAPH_DICKS_OWNED = 218;
            KFLAGS.CERAPH_PUSSIES_OWNED = 219;
            KFLAGS.CERAPH_TITS_OWNED = 220;
            KFLAGS.ROXANNE_MET = 221;
            KFLAGS.ROXANNE_DRINING_CONTEST_WON = 222;
            KFLAGS.ROXANNE_DRINING_CONTEST_LOST = 223;
            KFLAGS.ROXANNE_DRINKING_CONTEST_LAST_WINNER = 224;
            KFLAGS.ROXANNE_TIME_WITHOUT_SEX = 225;
            KFLAGS.ROXANNE_DRINKING_CONTEST_LOSE_ON_PURPOSE = 226;
            KFLAGS.ROXANNE_DRINKING_CONTEST_BONUS_SCORE = 227;
            KFLAGS.DIAPAUSE_FLUID_AMOUNT = 228;
            KFLAGS.DIAPAUSE_NEEDS_DISPLAYING = 229;
            KFLAGS.IZMA_ENCOUNTER_COUNTER = 230;
            KFLAGS.IZMA_TIMES_FOUGHT_AND_WON = 231;
            KFLAGS.IZMA_TALKED_AT_LAKE = 232;
            KFLAGS.IZMA_WORMS_SCARED = 233;
            KFLAGS.BONUS_ITEM_AFTER_COMBAT_ID = 234;
            KFLAGS.IZMA_GLOVES_TAKEN = 235;
            KFLAGS.IZMA_AMILY_FREAKOUT_STATUS = 236;
            KFLAGS.IZMA_MARBLE_FREAKOUT_STATUS = 237;
            KFLAGS.IZMA_FOLLOWER_STATUS = 238;
            KFLAGS.IZMA_TALK_LEVEL = 239;
            KFLAGS.MINO_CHEF_INTRO = 240;
            KFLAGS.MINO_CHEF_EXPLAINED_INGREDIENTS = 241;
            KFLAGS.MADDIE_STATUS = 242;
            KFLAGS.MINO_CHEF_BAKERY_PROC_COUNTER = 243;
            KFLAGS.COTTON_UNUSUAL_YOGA_BOOK_TRACKER = 244;
            KFLAGS.COTTON_BREAKFAST_CLUB = 245;
            KFLAGS.IZMA_TIGERSHARK_TOOTH_COUNTDOWN = 246;
            KFLAGS.GENDERLESS_CENTAUR_MADNESS = 247;
            KFLAGS.IZMA_PREGNANCY_DISCUSSED = 248;
            KFLAGS.IZMA_PREGNANCY_ENABLED = 249;
            KFLAGS.IZMA_INCUBATION = 250;
            KFLAGS.IZMA_CHILDREN_SHARKGIRLS = 251;
            KFLAGS.IZMA_CHILDREN_TIGERSHARKS = 252;
            KFLAGS.IZMA_TIME_TILL_NEW_BOOK_AVAILABLE = 253;
            KFLAGS.ISABELLA_CAMP_APPROACHED = 256;
            KFLAGS.ISABELLA_MET = 257;
            KFLAGS.ISABELLA_OKAY_WITH_TALL_FOLKS = 258;
            KFLAGS.ISABELLA_MET_SHORT_PC = 259;
            KFLAGS.ISABELLA_ANGRY_AT_PC_COUNTER = 260;
            KFLAGS.ISABELLA_SLEEP_RAPE_COUNTER = 261;
            KFLAGS.ISABELLA_TIMES_TALKED = 262;
            KFLAGS.NANCY_MET = 263;
            KFLAGS.NANCY_RELATIONSHIP_LEVEL = 264;
            KFLAGS.NANCY_TIMES_TALKED = 265;
            KFLAGS.NANCY_TIMES_BONED = 266;
            KFLAGS.PLAYER_DISARMED_WEAPON_ATTACK = 269;
            KFLAGS.TIMES_ENCOUNTERED_FEMALE_SPIDERMORPHS = 270;
            KFLAGS.FEMALE_SPIDERMORPH_PREGNANCY_INCUBATION = 271;
            KFLAGS.TIMES_EXPLORED_SWAMP = 272;
            KFLAGS.RATHAZUL_SILK_ARMOR_COUNTDOWN = 274;
            KFLAGS.RATHAZUL_SILK_ARMOR_TYPE = 275;
            KFLAGS.TIMES_ENCOUNTERED_BASILISK = 276;
            KFLAGS.TIMES_ENCOUNTERED_DRIDER = 277;
            KFLAGS.LOTTIE_DISABLED = 278;
            KFLAGS.LOTTIE_FIGURE = 279;
            KFLAGS.LOTTIE_CONFIDENCE = 280;
            KFLAGS.LOTTIE_ENCOUNTER_COUNTER = 281;
            KFLAGS.SOPHIE_BIMBO = 282;
            KFLAGS.SOPHIE_DISABLED_FOREVER = 283;
            KFLAGS.TIMES_SOPHIE_HAS_DRUNK_OVI_ELIXIR = 284;
            KFLAGS.LUSTSTICK_RESISTANCE_PROGRESS = 285;
            KFLAGS.CERAPH_BELLYBUTTON_PIERCING = 286;
            KFLAGS.CERAPH_TOKEN = 287;
            KFLAGS.CERAPH_HIDING_DICK = 288;
            KFLAGS.CERAPH_LICKED_YOU_OUT = 289;
            KFLAGS.CERAPH_PUNISHED = 290;
            KFLAGS.CERAPH_BEATEN_AND_RAPED_COUNTER = 291;
            KFLAGS.BAZAAR_DEMONS_LISTENED_IN = 292;
            KFLAGS.CERAPH_FAUX_CORRUPTION_DISABLED = 293;
            KFLAGS.CERAPH_SWEETIE_NO_RP_DONE = 294;
            KFLAGS.CERAPH_SWEETIE_NO_RP_UTTER_MOO_DISABLED = 295;
            KFLAGS.CERAPH_UDDERS = 296;
            KFLAGS.LOTTIE_LOVES_HER_BODY = 297;
            KFLAGS.LOTTIE_PORKED_COUNT = 298;
            KFLAGS.LOTTIE_TRAINER = 299;
            KFLAGS.LOTTIE_LAST_ENCOURAGEMENT_STATE = 300;
            KFLAGS.LOTTIE_ENCOURAGEMENT_THRESHOLD_31_30_DOWN = 301;
            KFLAGS.LOTTIE_ENCOURAGEMENT_THRESHOLD_30_31_UP = 302;
            KFLAGS.LOTTIE_ENCOURAGEMENT_THRESHOLD_80_79_DOWN = 303;
            KFLAGS.LOTTIE_ENCOURAGEMENT_THRESHOLD_79_80_UP = 304;
            KFLAGS.LOTTIE_NEEDS_TO_TALK_ORAL = 306;
            KFLAGS.LOTTIE_NEEDS_TO_TALK_ANAL = 307;
            KFLAGS.LOTTIE_WEIGHT_CONCLUSION = 308;
            KFLAGS.LOTTIE_FATASS_LOW_ESTEEM = 309;
            KFLAGS.LOTTIE_DOGGYSTYLE_UNLOCKED = 310;
            KFLAGS.LOTTIE_WALKIE_UNLOCKED = 311;
            KFLAGS.LOTTIE_LOVING_FAT_BITCH_EVENT = 312;
            KFLAGS.LOTTIE_COWGIRL_UNLOCKED = 313;
            KFLAGS.LOTTIE_QUICKIE_UNLOCKED = 314;
            KFLAGS.LOTTIE_CHARLOTTES_WEB_EVENT = 315;
            KFLAGS.LOTTIE_THREESOME_UNLOCKED = 316;
            KFLAGS.LOTTIE_ELLE_NTR_UNLOCKED = 317;
            KFLAGS.LOTTIE_MAX_GOAL_LOVE_REACHED = 318;
            KFLAGS.LOTTIE_FEMDOM_UNLOCKED = 319;
            KFLAGS.LOTTIE_REVERSE_COWGIRL_UNLOCKED = 320;
            KFLAGS.LOTTIE_TIMES_GIVEN_ITEMS = 321;
            KFLAGS.LOTTIE_LABOVA_COUNTDOWN = 322;
            KFLAGS.LOTTIE_REDUCTO_USED = 323;
            KFLAGS.LOTTIE_HAM_SAMMICH = 324;
            KFLAGS.TIMES_ENCOUNTERED_MINOTAUR_MOB = 325;
            KFLAGS.ADULT_MINOTAUR_OFFSPRINGS = 326;
            KFLAGS.MINOTAUR_SONS_PENDING = 327;
            KFLAGS.MINOTAUR_SONS_GROWUP_COUNTER = 328;
            KFLAGS.MINOTAUR_SONS_WASTED_TURN = 329;
            KFLAGS.MINOTAUR_SONS_CUM_REPEAT_COOLDOWN = 330;
            KFLAGS.JOJO_COCK_MILKING_COUNTER = 331;
            KFLAGS.JOJO_COCK_MILKING_COOLDOWN = 332;
            KFLAGS.PC_COCK_MILKED_COUNTER = 333;
            KFLAGS.FAP_ARENA_SESSIONS = 334;
            KFLAGS.FAP_ARENA_VICTORIES = 335;
            KFLAGS.AMILY_OFFERED_DEFURRY = 336;
            KFLAGS.AMILY_NOT_FURRY = 337;
            KFLAGS.AMILY_IS_BATMAN = 338;
            KFLAGS.FAP_ARENA_RULES_EXPLAINED = 339;
            KFLAGS.MINOTAUR_CUM_INTAKE_COUNT = 340;
            KFLAGS.KIHA_TOLL = 341;
            KFLAGS.KIHA_TOLL_DURATION = 342;
            KFLAGS.TIMES_MET_KIHA = 343;
            KFLAGS.KIHA_TALK_STAGE = 344;
            KFLAGS.PC_WIN_LAST_KIHA_FIGHT = 345;
            KFLAGS.AMILY_VISITING_URTA = 346;
            KFLAGS.AMILY_NEED_TO_FREAK_ABOUT_URTA = 347;
            KFLAGS.JOEY_BIG_BALLS_COUNTER = 348;
            KFLAGS.JOEY_TOLD_TO_MASTURBATE_COUNTER = 349;
            KFLAGS.URTA_AMILY_FOLLOWUP_NEEDED = 350;
            KFLAGS.TIMES_MET_SHOULDRA = 351;
            KFLAGS.TIMES_BEATEN_SHOULDRA = 352;
            KFLAGS.TIMES_POSSESSED_BY_SHOULDRA = 353;
            KFLAGS.TIMED_SHARKGINAS = 354;
            KFLAGS.TIMES_SHARKPENISED = 355;
            KFLAGS.SHOULDRA_SLIME_PENOR_TIMES = 356;
            KFLAGS.SHOULDRA_GENDERLESS_FUCK_COUNT = 357;
            KFLAGS.SHOULDRA_PENIS_DEFEAT_TIMES = 358;
            KFLAGS.SHOULDRA_WORM_SCENE_COUNTER = 359;
            KFLAGS.SHOULDRA_EXGARTUAN_SPIRIT_SEX_COUNT = 360;
            KFLAGS.SHOULDRA_VAGINAL_POSSESSIONS = 361;
            KFLAGS.SHOULDRA_HERMSEX_COUNT = 362;
            KFLAGS.SHOULDRA_USES_YOUR_GIANT_COCK_COUNT = 363;
            KFLAGS.TIMES_MET_OOZE = 364;
            KFLAGS.SHOULDRA_PALADIN_MAIDEN_COUNTDOWN = 365;
            KFLAGS.SHOULDRA_PALADIN_MAIDEN_COUNTER = 366;
            KFLAGS.ISABELLA_TIMES_OFFERED_FOLLOWER = 367;
            KFLAGS.ISABELLA_AFFECTION = 368;
            KFLAGS.ISABELLA_FOLLOWER_ACCEPTED = 369;
            KFLAGS.ISABELLA_PLAINS_DISABLED = 370;
            KFLAGS.ISABELLA_CAMP_DISABLED = 371;
            KFLAGS.ISABELLA_ACCENT_TRAINING_PERCENT = 372;
            KFLAGS.ISABELLA_ACCENT_TRAINING_COOLDOWN = 373;
            KFLAGS.ISABELLA_ACCENT_FORCED_ON = 374;
            KFLAGS.ISABELLA_MILKED_YET = 375;
            KFLAGS.ISABELLA_BLOWJOBS_DISABLED = 376;
            KFLAGS.ISABELLA_MORNING_FELLATIO_COUNT = 377;
            KFLAGS.ISABELLA_TIME_SINCE_LAST_HOTDOGGING = 378;
            KFLAGS.ISABELLA_TIMES_HOTDOGGED = 379;
            KFLAGS.ISABELLA_MILK_COOLDOWN = 380;
            KFLAGS.ISABELLA_MURBLE_BLEH = 381;
            KFLAGS.ISABELLA_SPARRING_INTRO = 382;
            KFLAGS.ISABELLA_PROBOVA_BURP_COUNT = 383;
            KFLAGS.GOOGIRL_BIRTHS = 384;
            KFLAGS.GOOGIRL_CONSECUTIVE_LOSSES = 385;
            KFLAGS.DOMINIKA_TIMES_MULTICOCK_SLOBBERED = 386;
            KFLAGS.DOMINIKA_TIMES_HYPNO_BJ = 387;
            KFLAGS.DOMINIKA_LAST_HYPNO_SUCK_COUNT = 388;
            KFLAGS.CERAPH_ROLEPLAY_AS_DOMINIKA_COUNT = 389;
            KFLAGS.HEL_TALKED_ABOUT_BERSERKING = 390;
            KFLAGS.HEL_TALKED_ABOUT_HER = 391;
            KFLAGS.HEL_TALKED_ABOUT_ATTACKING_YOU = 392;
            KFLAGS.HEL_FUCKBUDDY = 393;
            KFLAGS.HEL_FUCK_COUNTER = 394;
            KFLAGS.HEL_AFFECTION = 395;
            KFLAGS.HEL_TIMES_ENCOUNTERED = 396;
            KFLAGS.HEL_ISABELLA_THREESOME_ENABLED = 397;
            KFLAGS.KATHERINE_UNLOCKED = 398;
            KFLAGS.KATHERINE_DICK_COUNT = 399;
            KFLAGS.KATHERINE_DICK_LENGTH = 400;
            KFLAGS.KATHERINE_KNOT_THICKNESS = 401;
            KFLAGS.KATHERINE_BALL_SIZE = 402;
            KFLAGS.KATHERINE_TIMES_SEXED = 403;
            KFLAGS.EDRYN_TIMES_HEL_THREESOMED = 404;
            KFLAGS.HEL_EDRYN_OFFER = 405;
            KFLAGS.ZETSUKO_MET = 406;
            KFLAGS.ROGAR_PHASE = 407;
            KFLAGS.ROGAR_DIRT = 408;
            KFLAGS.ROGAR_WARNING = 409;
            KFLAGS.ROGAR_DISABLED = 410;
            KFLAGS.ROGAR_FUCKED_TODAY = 411;
            KFLAGS.IZMA_KIDS_IN_WILD = 412;
            KFLAGS.EXGARTUAN_TIGHTPANTS_MASTURBATE_COUNT = 413;
            KFLAGS.BOOBGARTUAN_SURPRISE_COUNT = 414;
            KFLAGS.GOTTEN_INQUISITOR_ARMOR = 415;
            KFLAGS.DOMINIKAS_SWORD_GIVEN = 416;
            KFLAGS.HEL_FOXY_FOURSOME_WARNED = 417;
            KFLAGS.HISTORY_PERK_SELECTED = 418;
            KFLAGS.AMILY_TIMES_BUTTFUCKED_PC = 419;
            KFLAGS.TIMES_FUCKED_AMILYBUTT = 420;
            KFLAGS.KIHA_AFFECTION_LEVEL = 421;
            KFLAGS.KIHA_AFFECTION = 422;
            KFLAGS.KIHA_CORRUPTION_BITCH = 423;
            KFLAGS.KIHA_NEED_SPIDER_TEXT = 424;
            KFLAGS.KIHA_AND_HEL_WHOOPIE = 425;
            KFLAGS.KIHA_ADMITTED_WARM_FEELINZ = 426;
            KFLAGS.KIHA_MOVE_IN_OFFER = 427;
            KFLAGS.KIHA_FOLLOWER = 428;
            KFLAGS.KIHA_NEEDS_TO_REACT_TO_HORSECOCKING = 429;
            KFLAGS.KIHA_CERVIXGINITY_TAKEN = 430;
            KFLAGS.KIHA_HORSECOCK_FUCKED = 431;
            KFLAGS.KIHA_CHOKED_OUT_PC = 432;
            KFLAGS.VALA_CUMBATH_TIMES = 433;
            KFLAGS.TIMES_AMILY_AND_JOJO_PLAYED_TIMES = 434;
            KFLAGS.AMILY_X_JOJO_COOLDOWN = 435;
            KFLAGS.AMILY_INCEST_COUNTDOWN_TIMER = 436;
            KFLAGS.YVONNE_FUCK_COUNTER = 437;
            KFLAGS.TIMES_CERAPH_PORTAL_FUCKED = 438;
            KFLAGS.IZMA_NO_COCK = 439;
            KFLAGS.ASKED_IZMA_ABOUT_WANG_REMOVAL = 440;
            KFLAGS.SALON_PAID = 441;
            KFLAGS.URTA_FAMILY_TALK_ATTEMPTS = 442;
            KFLAGS.URTA_OPEN_ABOUT_EDRYN = 443;
            KFLAGS.PC_DISLIKES_URTA_AND_EDRYN_TOGETHER = 444;
            KFLAGS.DISCUSSED_URTA_ALCOHOLISM = 445;
            KFLAGS.MET_NIAMH = 446;
            KFLAGS.GOT_NIAMH_BEER = 447;
            KFLAGS.TALKED_NIAMH = 448;
            KFLAGS.NIAMH_MOVED_OUT_COUNTER = 449;
            KFLAGS.NIAMH_STATUS = 450;
            KFLAGS.NIAMH_SEAN_BREW_BIMBO_LIQUEUR_COUNTER = 451;
            KFLAGS.TIMES_NIAMH_BAZAAR_MET = 452;
            KFLAGS.TIMES_MET_ANEMONE = 453;
            KFLAGS.ANEMONE_KID = 454;
            KFLAGS.KID_ITEM_FIND_HOURS = 455;
            KFLAGS.ANEMONE_WATCH = 456;
            KFLAGS.ANEMONE_WEAPON_ID = 457;
            KFLAGS.MURBLE_FARM_TALK_LEVELS = 458;
            KFLAGS.BROKE_UP_WITH_MARBLE = 459;
            KFLAGS.MARBLE_PLAYED_WITH_KIDS_TODAY = 460;
            KFLAGS.MARBLE_CAMPTALK_LEVEL = 461;
            KFLAGS.MARBLE_TELADRE_STORY = 462;
            KFLAGS.MARBLE_WARNING = 463;
            KFLAGS.FARM_DISABLED = 464;
            KFLAGS.MARBLE_BOVA_LEVEL = 465;
            KFLAGS.JOEY_OFFERED_MILKER = 466;
            KFLAGS.ANTS_PC_FAILED_PHYLLA = 467;
            KFLAGS.ANT_COLONY_KEPT_HIDDEN = 468;
            KFLAGS.PC_READY_FOR_ANT_COLONY_CHALLENGE = 469;
            KFLAGS.PHYLLA_SAVED = 470;
            KFLAGS.MET_ANT_ARENA = 471;
            KFLAGS.ANT_ARENA_WINS = 472;
            KFLAGS.ANT_ARENA_LOSSES = 473;
            KFLAGS.ANTS_PC_BEAT_GNOLL = 474;
            KFLAGS.ANTS_PC_LOST_TO_GNOLL = 475;
            KFLAGS.MET_ANT_ARENA_GNOLL = 476;
            KFLAGS.FOX_BAD_END_WARNING = 477;
            KFLAGS.HEL_AFFECTION_FOLLOWER = 478;
            KFLAGS.HEL_FOLLOWER_LEVEL = 479;
            KFLAGS.TOOK_GOO_ARMOR = 480;
            KFLAGS.LOST_GOO_ARMOR_FIGHT = 481;
            KFLAGS.WON_GOO_ARMOR_FIGHT = 482;
            KFLAGS.HEL_REDUCED_ENCOUNTER_RATE = 483;
            KFLAGS.MET_VALERIA = 484;
            KFLAGS.HEL_HARPIES_DEFEATED = 485;
            KFLAGS.HEL_DUNGEON_MEAD_LOOTED = 486;
            KFLAGS.HEL_BRIGID_DEFEATED = 487;
            KFLAGS.HEL_PC_TALKED_WITH_HAKON = 488;
            KFLAGS.HEL_DUNGEON_TAKEN_WHIP = 489;
            KFLAGS.HEL_DUNGEON_TAKEN_STRAPS = 490;
            KFLAGS.HEL_DUNGEON_TAKEN_DAGGER = 491;
            KFLAGS.HEL_PHOENIXES_DEFEATED = 492;
            KFLAGS.HEL_HARPY_QUEEN_DEFEATED = 493;
            KFLAGS.HARPY_QUEEN_EXECUTED = 494;
            KFLAGS.HEL_KNOWS_ABOUT_HAKON = 495;
            KFLAGS.FOUGHT_WITH_HEL_IN_DUNGEON = 496;
            KFLAGS.TOOK_QUEEN_STAFF = 497;
            KFLAGS.VALARIA_AT_CAMP = 498;
            KFLAGS.VELARIA_FUTA = 499;
            KFLAGS.DECLINED_TO_VISIT_REBECCS_VILLAGE = 500;
            KFLAGS.TIMES_IN_DEMON_PIT = 501;
            KFLAGS.TIMES_REFUSED_REBECCS_OFFER = 502;
            KFLAGS.OWCAS_ATTITUDE = 503;
            KFLAGS.VAPULA_SUBMISSIVENESS = 504;
            KFLAGS.DAYS_SINCE_LAST_DEMON_DEALINGS = 505;
            KFLAGS.OWCA_UNLOCKED = 506;
            KFLAGS.REBECCS_LAST_PLEA = 507;
            KFLAGS.OWCA_ANGER_DISABLED = 508;
            KFLAGS.SLIMEGINAED = 509;
            KFLAGS.GHOST_GIRL_SLIME_X_SHOULDRA_COUNTER = 510;
            KFLAGS.GENDERLESS_MASTURBATION_WITH_GHOST_COUNT = 511;
            KFLAGS.SHOULDRA_TONGUE_LICKS_TIMES = 512;
            KFLAGS.SHOULDRA_FOLLOWER_STATE = 513;
            KFLAGS.SHOULDRA_PLOT_LEVEL = 514;
            KFLAGS.SHOULDRA_TALK_NEEDED = 515;
            KFLAGS.SHOULDRA_PLOT_COUNTDOWN = 516;
            KFLAGS.SHOULDRA_SLEEP_TIMER = 517;
            KFLAGS.SHOULDRA_MAGIC_COOLDOWN = 518;
            KFLAGS.SHOULDRA_TIMES_NIGHT_RAPED_PC = 519;
            KFLAGS.SHOULDRA_EXGARTUDRAMA = 520;
            KFLAGS.SHOULDRA_BAKERY_TIMES = 521;
            KFLAGS.FERA_RELEASED = 522;
            KFLAGS.EMBER_AFFECTION = 523;
            KFLAGS.EMBER_HATCHED = 524;
            KFLAGS.EMBER_GENDER = 525;
            KFLAGS.EMBER_TYPE = 526;
            KFLAGS.EMBER_COR = 527;
            KFLAGS.EMBER_HAIR = 528;
            KFLAGS.EMBER_MILK = 529;
            KFLAGS.EMBER_OVIPOSITION = 530;
            KFLAGS.EMBER_ROUNDFACE = 531;
            KFLAGS.EMBER_EGG_FLUID_COUNT = 532;
            KFLAGS.EMBER_STAT = 533;
            KFLAGS.EMBER_INTERNAL_DICK = 534;
            KFLAGS.TIMES_EQUIPPED_EMBER_SHIELD = 535;
            KFLAGS.TOOK_EMBER_EGG = 536;
            KFLAGS.EGG_BROKEN = 537;
            KFLAGS.TIMES_FOUND_EMBERS_EGG = 538;
            KFLAGS.EMBER_JACKED_ON = 539;
            KFLAGS.EMBER_OVI_BITCHED_YET = 540;
            KFLAGS.EMBER_LUST_BITCHING_COUNTER = 541;
            KFLAGS.EMBER_CURRENTLY_FREAKING_ABOUT_MINOCUM = 542;
            KFLAGS.DRANK_EMBER_BLOOD_TODAY = 543;
            KFLAGS.EMBER_PUSSY_FUCK_COUNT = 544;
            KFLAGS.TIMES_BUTTFUCKED_EMBER = 545;
            KFLAGS.VAPULA_HAREM_FUCK = 546;
            KFLAGS.VAPULA_THREESOMES = 547;
            KFLAGS.OWCA_SACRIFICE_DISABLED = 548;
            KFLAGS.VAPULA_FOLLOWER = 549;
            KFLAGS.JOJO_MOVE_IN_DISABLED = 550;
            KFLAGS.VAPULA_DAYS_SINCE_FED = 551;
            KFLAGS.VAPULA_TEASE_COUNT = 552;
            KFLAGS.EMBER_INCUBATION = 553;
            KFLAGS.EMBER_CHILDREN_MALES = 554;
            KFLAGS.EMBER_CHILDREN_FEMALES = 555;
            KFLAGS.EMBER_CHILDREN_HERMS = 556;
            KFLAGS.EMBER_EGGS = 557;
            KFLAGS.EMBER_BITCHES_ABOUT_PREGNANT_PC = 558;
            KFLAGS.EMBER_TALKS_TO_PC_ABOUT_PC_MOTHERING_DRAGONS = 559;
            KFLAGS.EMBER_PREGNANT_TALK = 560;
            KFLAGS.TIMES_MET_CHAMELEON = 561;
            KFLAGS.TIMES_IN_BENOITS = 562;
            KFLAGS.BENOIT_AFFECTION = 563;
            KFLAGS.BENOIT_EXPLAINED_SHOP = 564;
            KFLAGS.BENOIT_SUGGEST_UNLOCKED = 565;
            KFLAGS.TURKEY_FUCK_YEAR_DONE = 566;
            KFLAGS.BENOIT_1 = 567;
            KFLAGS.BENOIT_2 = 568;
            KFLAGS.BENOIT_3 = 569;
            KFLAGS.BENOIT_TALKED_TODAY = 570;
            KFLAGS.BENOIT_TALKED_TO_PROPERLY = 571;
            KFLAGS.BENOIT_EGGS = 572;
            KFLAGS.BENOIT_TIMES_SEXED_FEMPCS = 573;
            KFLAGS.BENOIT_BIRTH_DELAY = 574;
            KFLAGS.BENOIT_WOMB_TALK_UNLOCKED = 575;
            KFLAGS.BENOIT_POST_FIRSTFUCK_TALK = 576;
            KFLAGS.BENOIT_TESTED_BASILISK_WOMB = 577;
            KFLAGS.TIMES_ENCOUNTERED_SAND_TRAPS = 578;
            KFLAGS.SANDTRAP_NAGA_3SOME = 579;
            KFLAGS.TAMANI_TIME_OUT = 580;
            KFLAGS.TIMES_OVIPOSITED_TAMANI = 581;
            KFLAGS.URTA_EGGS = 582;
            KFLAGS.URTA_FERTILE_EGGS = 583;
            KFLAGS.URTA_EGG_FORCE_EVENT = 584;
            KFLAGS.URTA_TIMES_EGG_PREGGED = 585;
            KFLAGS.URTA_PREGNANCY_TYPE = 586;
            KFLAGS.URTA_FLATBELLY_NOTICE = 587;
            KFLAGS.EGG_WITCH_COUNTER = 588;
            KFLAGS.EGG_WITCH_TYPE = 589;
            KFLAGS.TIMES_EGGED_JOJO = 590;
            KFLAGS.JOJO_EGGCUBATE_COUNT = 591;
            KFLAGS.DICK_EGG_INCUBATION = 592;
            KFLAGS.TIMES_EGGED_IN_COCK = 593;
            KFLAGS.TIMES_FUCKED_FLOWER = 594;
            KFLAGS.TIMES_RIDDEN_FLOWER = 595;
            KFLAGS.FUCK_FLOWER_LEVEL = 596;
            KFLAGS.FUCK_FLOWER_GROWTH_COUNTER = 597;
            KFLAGS.FUCK_FLOWER_KILLED = 598;
            KFLAGS.AMILY_TREE_FLIPOUT = 599;
            KFLAGS.HOLLI_FRUIT = 600;
            KFLAGS.HOLLI_FRUIT_EXPLAINED = 601;
            KFLAGS.HOLLI_DEFENSE_ON = 602;
            KFLAGS.SATYR_KIDS = 603;
            KFLAGS.RUBI_AFFECTION = 604;
            KFLAGS.RUBI_DISABLED = 605;
            KFLAGS.RUBI_ADMITTED_GENDER = 606;
            KFLAGS.RUBI_INTRODUCED = 607;
            KFLAGS.RUBI_BLU_BALLS = 608;
            KFLAGS.RUBI_ORGASM_DENIAL = 609;
            KFLAGS.RUBI_BIMBO = 610;
            KFLAGS.RUBI_INCUBUS_PROGRESS = 611;
            KFLAGS.RUBI_SUITCLOTHES = 612;
            KFLAGS.RUBI_FETISH_CLOTHES = 613;
            KFLAGS.RUBI_GREEN_ADVENTURER = 614;
            KFLAGS.RUBI_TUBE_TOP = 615;
            KFLAGS.RUBI_BODYSUIT = 616;
            KFLAGS.RUBI_LONGDRESS = 617;
            KFLAGS.RUBI_TIGHT_PANTS = 618;
            KFLAGS.RUBI_NURSE_CLOTHES = 619;
            KFLAGS.RUBI_SWIMWEAR = 620;
            KFLAGS.RUBI_PROSTITUTION = 621;
            KFLAGS.RUBIS_HOUSE_FIRST_TIME = 622;
            KFLAGS.RUBI_GOT_BIMBO_SKIRT = 623;
            KFLAGS.RUBI_PROFIT = 624;
            KFLAGS.RUBI_BIMBO_MINIDRESS = 625;
            KFLAGS.MANSION_VISITED = 626;
            KFLAGS.REDHEAD_IS_FUTA = 627;
            KFLAGS.MET_KITSUNES = 628;
            KFLAGS.AMILY_OVIPOSITED_COUNT = 629;
            KFLAGS.AMILY_OVIPOSITED_COUNTDOWN = 630;
            KFLAGS.AMILY_OVIPOSITION_UNLOCKED = 631;
            KFLAGS.BENOIT_GENERIC_EGGS = 632;
            KFLAGS.URTA_SCYLLA_BIG_DICK_TIMES_DONE = 633;
            KFLAGS.VAPULA_EARNED_A_SPANK = 634;
            KFLAGS.AMILY_TIMES_SWIMFUCKED = 635;
            KFLAGS.AMILY_OWNS_BIKINI = 636;
            KFLAGS.CANDY_CANE_YEAR_MET = 637;
            KFLAGS.GATS_ANGEL_GOOD_ENDED = 638;
            KFLAGS.GATS_ANGEL_DISABLED = 639;
            KFLAGS.GATS_ANGEL_QUEST_BEGAN = 640;
            KFLAGS.GATS_ANGEL_TIME_TO_FIND_KEY = 641;
            KFLAGS.XMAS_CHICKEN_YEAR = 642;
            KFLAGS.KAMI_ENCOUNTER = 643;
            KFLAGS.POLAR_PETE_YEAR_MET = 644;
            KFLAGS.JACK_FROST_YEAR = 645;
            KFLAGS.JACK_FROST_PROGRESS = 646;
            KFLAGS.NIEVE_STAGE = 647;
            KFLAGS.NIEVE_GENDER = 648;
            KFLAGS.NIEVE_MOUTH = 649;
            KFLAGS.TIMES_LOST_HECKEL_DOM_CHALLENGE = 650;
            KFLAGS.TIMES_DOMMED_HECKEL = 651;
            KFLAGS.TIMES_MET_CHICKEN_HARPY = 652;
            KFLAGS.EGGS_BOUGHT = 653;
            KFLAGS.GOO_TFED_MEAN = 654;
            KFLAGS.GOO_TFED_NICE = 655;
            KFLAGS.GOO_NAME = 656;
            KFLAGS.GOO_SLAVE_RECRUITED = 657;
            KFLAGS.GOO_EYES = 658;
            KFLAGS.GOO_TOSSED_AFTER_NAMING = 659;
            KFLAGS.TIMES_FUCKED_NORMAL_GOOS = 660;
            KFLAGS.PC_KNOWS_ABOUT_BLACK_EGGS = 661;
            KFLAGS.GOO_HAPPINESS = 662;
            KFLAGS.GOO_OBEDIENCE = 663;
            KFLAGS.GOO_FLUID_AMOUNT = 664;
            KFLAGS.GOO_PREFERRED_TIT_SIZE = 665;
            KFLAGS.GOO_NIPPLE_TYPE = 666;
            KFLAGS.GOO_DICK_LENGTH = 667;
            KFLAGS.GOO_DICK_TYPE = 668;
            KFLAGS.TIMES_THOUGHT_ABOUT_GOO_RECRUITMENT = 669;
            KFLAGS.GOO_INDIRECT_FED = 670;
            KFLAGS.TIMES_FED_LATEXY_MINO_CUM = 671;
            KFLAGS.LATEX_GOO_TIMES_FEMDOMMED_BY_PC = 672;
            KFLAGS.COTTON_PREGNANCY_INCUBATION = 673;
            KFLAGS.COTTON_PREGNANCY_TYPE = 674;
            KFLAGS.COTTON_KID_COUNT = 675;
            KFLAGS.COTTON_OLDEST_KID_AGE = 676;
            KFLAGS.PC_IS_A_DEADBEAT_COTTON_DAD = 677;
            KFLAGS.PC_IS_A_GOOD_COTTON_DAD = 678;
            KFLAGS.COTTON_HERBS_OFF = 679;
            KFLAGS.COTTON_CONTRACEPTION_TALK = 680;
            KFLAGS.COTTON_KNOCKED_UP_PC_AND_TALK_HAPPENED = 681;
            KFLAGS.HOLLI_SUBMISSIVE = 682;
            KFLAGS.TIMES_ORPHANAGED_WITH_RAPHAEL = 683;
            KFLAGS.LOPPE_FURRY = 684;
            KFLAGS.LOPPE_FERTILE = 685;
            KFLAGS.LOPPE_KIDS = 686;
            KFLAGS.LOPPE_TRAINING = 687;
            KFLAGS.LOPPE_KIDS_LIMIT = 688;
            KFLAGS.LOPPE_URTA_CHATS = 689;
            KFLAGS.LOPPE_PC_MET_UMA = 690;
            KFLAGS.LOPPE_TIMES_SEXED = 691;
            KFLAGS.LOPPE_DENIAL_COUNTER = 692;
            KFLAGS.LOPPE_DISABLED = 693;
            KFLAGS.TIMES_ASKED_LOPPE_ABOUT_LOPPE = 694;
            KFLAGS.LOPPE_MET = 695;
            KFLAGS.HELIA_FOLLOWER_DISABLED = 696;
            KFLAGS.HEL_INTROS_LEVEL = 697;
            KFLAGS.MINO_SONS_HAVE_SOPHIE = 698;
            KFLAGS.KEEP_HELIA_AND_SOPHIE = 699;
            KFLAGS.FOLLOWER_HEL_TALKS = 700;
            KFLAGS.SLEEP_WITH = 701;
            KFLAGS.COTTON_OLDEST_KID_GENDER = 702;
            KFLAGS.HEL_CAN_SWIM = 703;
            KFLAGS.HEL_GUARDING = 704;
            KFLAGS.PC_PROMISED_HEL_MONOGAMY_FUCKS = 705;
            KFLAGS.HEL_RAPED_TODAY = 706;
            KFLAGS.FOUND_ISABELLA_AT_FARM_TODAY = 707;
            KFLAGS.KITSUNE_SHRINE_VISIT = 708;
            KFLAGS.TOOK_KITSUNE_STATUE = 709;
            KFLAGS.URTA_MET_HEL = 710;
            KFLAGS.URTA_QUEST_STATUS = 711;
            KFLAGS.URTA_FUCKED_HEL = 712;
            KFLAGS.SUCCUBI_MILKED_GNOLL_PRINCESS = 713;
            KFLAGS.URTA_TAKEN_BY_GNOLLS = 714;
            KFLAGS.URTA_BECOMES_SNAKE_SLAVE = 715;
            KFLAGS.URTA_GOBLIN_SLAVE = 716;
            KFLAGS.URTA_TENTACLE_RAPED = 717;
            KFLAGS.URTA_TENTACLE_GAPED = 718;
            KFLAGS.URTA_IS_VULQUINE_MENACE = 719;
            KFLAGS.URTA_RAPED_MINO_LORD = 720;
            KFLAGS.URTA_MINO_AND_SUCCUBI_SLAVE = 721;
            KFLAGS.EDRYN_PREGNANCY_TYPE = 722;
            KFLAGS.URTA_FERTILE = 723;
            KFLAGS.URTA_PREG_EVERYBODY = 724;
            KFLAGS.KELT_BREAK_LEVEL = 725;
            KFLAGS.KELLY_CUNT_TYPE = 726;
            KFLAGS.NEVER_RESIST_KELT = 727;
            KFLAGS.WHITNEY_FLIPPED_OUT_OVER_KELLY = 728;
            KFLAGS.TIMES_PUNISHED_KELLY = 729;
            KFLAGS.TIMES_RIM_JOBBED_BY_KELLY = 730;
            KFLAGS.TIMES_RIDDEN_KELLY_FOR_PUNISHMENT = 731;
            KFLAGS.KELLY_BONUS_TIT_ROWS = 732;
            KFLAGS.KELLY_LACTATING = 733;
            KFLAGS.KELLY_DISOBEYING_COUNTER = 734;
            KFLAGS.KELLY_VAGINALLY_FUCKED_COUNT = 735;
            KFLAGS.VALENTINES_EVENT_YEAR = 736;
            KFLAGS.SOPHIE_HEAT_COUNTER = 737;
            KFLAGS.SOPHIE_INCUBATION = 738;
            KFLAGS.SOPHIE_BROACHED_SLEEP_WITH = 739;
            KFLAGS.SOPHIE_ADULT_KID_COUNT = 740;
            KFLAGS.SOPHIE_DAUGHTER_MATURITY_COUNTER = 741;
            KFLAGS.SOPHIE_CAMP_EGG_COUNTDOWN = 742;
            KFLAGS.SOPHIE_FAMILY_INCEST = 743;
            KFLAGS.RATHAZUL_DEBIMBO_OFFERED = 744;
            KFLAGS.SOPHIE_DEBIMBOED = 745;
            KFLAGS.SOPHIES_DAUGHTERS_DEBIMBOED = 746;
            KFLAGS.SOPHIE_RECRUITED_PURE = 747;
            KFLAGS.SOPHIE_FOLLOWER_IRRITATION = 748;
            KFLAGS.TIMES_MORNING_SOPHIE_FEMDOMMED = 749;
            KFLAGS.DAUGHTER_ONE_BIMBO = 750;
            KFLAGS.DAUGHTER_TWO_BIMBO = 751;
            KFLAGS.DAUGHTER_THREE_BIMBO = 752;
            KFLAGS.DAUGHTER_FOUR_BIMBO = 753;
            KFLAGS.NO_PURE_SOPHIE_RECRUITMENT = 754;
            KFLAGS.SOPHIE_FOLLOWER_PROGRESS = 755;
            KFLAGS.KID_A_XP = 756;
            KFLAGS.KID_SITTER = 757;
            KFLAGS.HAD_KID_A_DREAM = 758;
            KFLAGS.CUSTOM_PC_ENABLED = 759;
            KFLAGS.SHEILA_CORRUPTION = 760;
            KFLAGS.SHEILA_XP = 761;
            KFLAGS.SHEILA_PREGNANCY_INCUBATION = 762;
            KFLAGS.SHEILA_JOEYS = 763;
            KFLAGS.SHEILA_DEMON = 764;
            KFLAGS.SHEILA_CITE = 765;
            KFLAGS.SHOULDRA_MET_VALA = 766;
            KFLAGS.TIMES_VALA_CONSENSUAL_BIG = 767;
            KFLAGS.TIMES_VAPULA_AND_GIANT_VALA = 768;
            KFLAGS.BIKINI_ARMOR_BONUS = 769;
            KFLAGS.OWN_MAIDEN_BIKINI = 770;
            KFLAGS.AMILY_X_IZMA_POTION_3SOME = 771;
            KFLAGS.MET_ESSY = 772;
            KFLAGS.TURNED_DOWN_ESSY_FIRST_MEETING = 773;
            KFLAGS.ACCEPTED_ESSY_FIRST_MEETING = 774;
            KFLAGS.GIVEN_AMILY_NURSE_OUTFIT = 775;
            KFLAGS.TIMES_EATEN_EDRYN_PUSSY_RUT = 776;
            KFLAGS.MET_OTTERGIRL = 777;
            KFLAGS.TIMES_SOLO_FED_NUN = 778;
            KFLAGS.FED_SCYLLA_TODAY = 779;
            KFLAGS.TIMES_SOPHIE_AND_IZMA_FUCKED = 780;
            KFLAGS.TOLD_SOPHIE_TO_IZMA = 781;
            KFLAGS.URTA_CUM_NO_CUM_DAYS = 782;
            KFLAGS.URTA_X_RAPHAEL_HAPPENED = 783;
            KFLAGS.IZMA_X_LATEXY_DISABLED = 784;
            KFLAGS.TIMES_IZMA_DOMMED_LATEXY = 785;
            KFLAGS.TIMES_HELIA_DOUBLE_DONGED = 786;
            KFLAGS.EVER_INFESTED = 787;
            KFLAGS.CAME_WORMS_AFTER_COMBAT = 788;
            KFLAGS.URTA_INCUBATION = 789;
            KFLAGS.URTA_TIMES_BIRTHED = 790;
            KFLAGS.URTA_TIMES_PC_BIRTHED = 791;
            KFLAGS.URTA_KIDS_MALES = 792;
            KFLAGS.URTA_KIDS_FEMALES = 793;
            KFLAGS.URTA_KIDS_HERMS = 794;
            KFLAGS.URTA_FIRSTBORN_GENDER = 795;
            KFLAGS.URTA_FIRSTBORN_COCKTYPE = 796;
            KFLAGS.URTA_LATESTBORN_GENDER = 797;
            KFLAGS.URTA_LATESTBORN_COCKTYPE = 798;
            KFLAGS.NEED_URTA_LETTER = 799;
            KFLAGS.EVENT_PARSER_ESCAPE = 800;
            KFLAGS.URTA_INCUBATION_CELEBRATION = 801;
            KFLAGS.URTA_PREGNANT_DELIVERY_SCENE = 802;
            KFLAGS.TIMES_MASSAGED_URTA_BELLY = 803;
            KFLAGS.TIMES_URTA_BOOB_WORSHIPPED = 804;
            KFLAGS.TIMES_NURSED_FROM_URTA = 805;
            KFLAGS.URTA_LUNCH_PLAY = 806;
            KFLAGS.LIANNA_HAVESTED_MALES = 807;
            KFLAGS.LIANNA_HAVESTED_LADIES = 808;
            KFLAGS.FIRST_TIME_AT_URTA_HOUSE = 809;
            KFLAGS.NEW_BABY_ANNOUNCED = 810;
            KFLAGS.DISCUSSED_LUBE_SPRAY = 811;
            KFLAGS.SANDTRAP_LOSS_REPEATS = 812;
            KFLAGS.MINERVA_LOVE = 813;
            KFLAGS.MINERVA_BACKSTORY = 814;
            KFLAGS.MINERVA_BACKSTORY_LEARNED = 815;
            KFLAGS.TIMES_MINERVA_SEXED = 816;
            KFLAGS.TIMES_BUTTFUCKED_MINERVA = 817;
            KFLAGS.TIMES_MINERVA_COWGIRLED = 818;
            KFLAGS.TIMES_MINERVA_LAPSEXED = 819;
            KFLAGS.MINERVA_LEZZES_OUT = 820;
            KFLAGS.MET_MINERVA = 821;
            KFLAGS.MET_OLIVIA = 822;
            KFLAGS.LAST_EASTER_YEAR = 823;
            KFLAGS.TIMES_EMBER_LUSTY_FUCKED = 824;
            KFLAGS.GAR_NAME = 825;
            KFLAGS.GAR_CONFIDENCE = 826;
            KFLAGS.RITUAL_INTRO = 827;
            KFLAGS.KINKY_RITUALS_SPOKEN = 828;
            KFLAGS.GAR_HISTORY = 829;
            KFLAGS.GAR_CATHEDRAL = 830;
            KFLAGS.GAR_NAME_TALKS = 831;
            KFLAGS.TIMES_RUBI_MASSAGED = 832;
            KFLAGS.SANURA_DISABLED = 833;
            KFLAGS.MET_SANURA = 834;
            KFLAGS.BEATEN_SANURA_COUNT = 835;
            KFLAGS.SANDWITCH_MOB_DEFEATED = 836;
            KFLAGS.SANDWITCH_THRONE_UNLOCKED = 837;
            KFLAGS.SAND_WITCHES_FRIENDLY = 838;
            KFLAGS.CUM_WITCH_DEFEATED = 839;
            KFLAGS.ENTERED_SANDWITCH_DUNGEON = 840;
            KFLAGS.PAWJOBS = 841;
            KFLAGS.RIDDLE_ONE = 842;
            KFLAGS.RIDDLE_TWO = 843;
            KFLAGS.RIDDLE_THREE = 844;
            KFLAGS.TIMES_SUBMITTED_TO_SANURA = 845;
            KFLAGS.TIMES_WINFUCKED_SANURA = 846;
            KFLAGS.SAND_MOTHER_DEFEATED = 847;
            KFLAGS.TIMES_TENTACLED_SAND_MOTHER = 848;
            KFLAGS.SAND_WITCHES_COWED = 849;
            KFLAGS.SAND_WITCH_LOOT_TAKEN = 850;
            KFLAGS.TIMES_FRIENDLY_FUCKED_SAND_MOTHER = 851;
            KFLAGS.MORE_CUM_WITCHES = 852;
            KFLAGS.CUM_WITCHES_FIGHTABLE = 853;
            KFLAGS.SAND_WITCH_LEAVE_ME_ALONE = 854;
            KFLAGS.BEEN_BLESSED_BY_CUM_WITCH = 855;
            KFLAGS.DISCOVERED_WITCH_DUNGEON = 856;
            KFLAGS.URTA_PETPLAY_DONE = 857;
            KFLAGS.SHEILA_CLOCK = 858;
            KFLAGS.SHEILA_IMPS = 859;
            KFLAGS.TIMES_VISITED_MALI = 860;
            KFLAGS.TIMES_BEEN_TO_LIBRARY = 861;
            KFLAGS.MALI_TAKEN_BLADE = 862;
            KFLAGS.ESSRAYLE_ESCAPED_DUNGEON = 863;
            KFLAGS.TOLD_MOTHER_TO_RELEASE_ESSY = 864;
            KFLAGS.ESSY_DUNGEON_FUCKED = 865;
            KFLAGS.ESSY_MET_IN_DUNGEON = 866;
            KFLAGS.DOUBLE_ATTACK_STYLE = 867;
            KFLAGS.SPELLS_CAST = 868;
            KFLAGS.MILK_NAME = 869;
            KFLAGS.MILK_SIZE = 870;
            KFLAGS.MET_MILK_SLAVE = 871;
            KFLAGS.COUNTDOWN_TO_NIGHT_RAPE = 872;
            KFLAGS.PHYLLA_CAPACITY = 873;
            KFLAGS.ANT_KIDS = 874;
            KFLAGS.ANT_WAIFU = 875;
            KFLAGS.PHYLLA_STAY_HOME = 876;
            KFLAGS.PHYLLA_CAMP_VISITS = 877;
            KFLAGS.DAYS_PHYLLA_IN_CAMP = 878;
            KFLAGS.PHYLLA_EGG_LAYING = 879;
            KFLAGS.PHYLLA_BLOWJOBS = 880;
            KFLAGS.TALKED_WITH_PHYLLA_ABOUT_HISTORY = 881;
            KFLAGS.TIMES_LINKED_BJ_SUCK = 882;
            KFLAGS.PHYLLA_FUCKS = 883;
            KFLAGS.TIMES_CORRUPT_MALE_ANT_ORGY = 884;
            KFLAGS.TIMES_CORRUPT_FEMALE_ANT_ORGY = 885;
            KFLAGS.PHYLLA_TIMES_DRIDER_EGG_LAYED = 886;
            KFLAGS.DAYS_PHYLLA_HAS_SPENT_BIRTHING = 887;
            KFLAGS.ANTS_BIRTHED_FROM_LICKING = 888;
            KFLAGS.PHYLLA_COOLDOWN = 889;
            KFLAGS.TIMES_EGG_IMPREGNATING_PHYLLA = 890;
            KFLAGS.PHYLLA_DRIDER_INCUBATION = 891;
            KFLAGS.HAS_SEEN_MINO_AND_COWGIRL = 892;
            KFLAGS.PHYLLA_GEMS_HUNTED_TODAY = 893;
            KFLAGS.PHYLLA_DRIDER_BABIES_COUNT = 894;
            KFLAGS.SOCK_COUNTER = 895;
            KFLAGS.SOCK_HOLDING = 896;
            KFLAGS.FOUND_SOCKS = 897;
            KFLAGS.SOCKS_BOUGHT = 898;
            KFLAGS.GILDED_JERKED = 899;
            KFLAGS.PHYLLA_INHERITED_KNOWLEDGE = 900;
            KFLAGS.PHYLLA_IZMA_TALK = 901;
            KFLAGS.AKBAL_TIMES_BITCHED = 902;
            KFLAGS.AKBAL_BITCH_Q = 903;
            KFLAGS.KELLY_BONUS_BOOB_ROWS = 904;
            KFLAGS.KELLY_INCUBATION = 905;
            KFLAGS.KELLY_TIMES_PEPPERED = 906;
            KFLAGS.KELLY_HEAT_TIME = 907;
            KFLAGS.KELLY_KIDS = 908;
            KFLAGS.KELLY_FIRST_KID_GENDER = 909;
            KFLAGS.KAIJU_MEETINGS = 910;
            KFLAGS.KAIJU_DISABLED = 911;
            KFLAGS.KAIJU_TALK_CYCLE = 912;
            KFLAGS.KAIJU_COCK = 913;
            KFLAGS.KAIJU_BAD_END_COUNTER = 914;
            KFLAGS.BROOKE_AFFECTION = 915;
            KFLAGS.BROOKE_SHOWERED_WITH = 916;
            KFLAGS.BROOKE_AND_HECKEL_3SOME = 917;
            KFLAGS.TIMES_IN_BROOKES_BUTT = 918;
            KFLAGS.BROOKE_MEDIUM_SCENE = 919;
            KFLAGS.BROOKE_MET = 920;
            KFLAGS.BROOKE_MET_TODAY = 921;
            KFLAGS.BROOKE_GRUMPS_ABOUT_TA = 922;
            KFLAGS.FOUGHT_HOLLI = 923;
            KFLAGS.THREATENED_HOLLI = 924;
            KFLAGS.DIDNT_FUCK_PHYLLA_ON_RECRUITMENT = 925;
            KFLAGS.HELIA_ANAL_TRAINING_OFFERED = 926;
            KFLAGS.HELIA_ANAL_TRAINING = 927;
            KFLAGS.HELIA_BIRTHDAY_OFFERED = 928;
            KFLAGS.HELIA_BDAY_DRINKS = 929;
            KFLAGS.HELIA_BDAY_HAKON_AND_KIRI = 930;
            KFLAGS.HELIA_BDAY_PHOENIXES = 931;
            KFLAGS.HELIA_BDAY_FOX_TWINS = 932;
            KFLAGS.ARIAN_FOLLOWER = 933;
            KFLAGS.ARIAN_PARK = 934;
            KFLAGS.ARIAN_HEALTH = 935;
            KFLAGS.ARIAN_ANAL_XP = 936;
            KFLAGS.ARIAN_CAPACITY = 937;
            KFLAGS.ARIAN_COCK_SIZE = 938;
            KFLAGS.ARIAN_DOUBLE_COCK = 939;
            KFLAGS.ARIAN_VAGINA = 940;
            KFLAGS.ARIAN_BREASTS = 941;
            KFLAGS.ARIAN_VIRGIN = 942;
            KFLAGS.ARIAN_S_DIALOGUE = 943;
            KFLAGS.ARIAN_HERM_CHAT = 944;
            KFLAGS.ARIAN_ASS_CHAT = 945;
            KFLAGS.ARIAN_LESSONS = 946;
            KFLAGS.ARIAN_DOUBLE_PENETRATION_CHAT = 947;
            KFLAGS.ARIAN_FIRST_REPTILUM = 948;
            KFLAGS.ARIAN_TREATMENT = 949;
            KFLAGS.ARIAN_HAS_BLOWN = 950;
            KFLAGS.ARIAN_MORNING = 951;
            KFLAGS.ARIAN_EGG_CHAT = 952;
            KFLAGS.ARIAN_EGG_EVENT = 953;
            KFLAGS.ARIAN_EGG_COLOR = 954;
            KFLAGS.ARIAN_EGG_COUNTER = 955;
            KFLAGS.HELSPAWN_NAME = 956;
            KFLAGS.HELSPAWN_PERSONALITY = 957;
            KFLAGS.HELSPAWN_DADDY = 958;
            KFLAGS.HELSPAWN_WEAPON = 959;
            KFLAGS.HELSPAWN_AGE = 960;
            KFLAGS.HELSPAWN_GROWUP_COUNTER = 961;
            KFLAGS.HEL_LOVE = 962;
            KFLAGS.HELIA_KIDS_CHAT = 963;
            KFLAGS.HELIA_TALK_SEVEN = 964;
            KFLAGS.HEL_NTR_TRACKER = 965;
            KFLAGS.HEL_BONUS_POINTS = 966;
            KFLAGS.HEL_PREGNANCY_INCUBATION = 967;
            KFLAGS.HELIA_PREGNANCY_TYPE = 968;
            KFLAGS.HAD_FIRST_HELSPAWN_TALK = 969;
            KFLAGS.HELSPAWN_INCEST = 970;
            KFLAGS.HEL_TALK_EIGHT = 971;
            KFLAGS.HELSPAWN_DISCOVER_BOOZE = 972;
            KFLAGS.HELSPAWN_FUCK_INTERRUPTUS = 973;
            KFLAGS.SPIDER_BRO_GIFT = 974;
            KFLAGS.HAKON_AND_KIRI_VISIT = 975;
            KFLAGS.KELLY_HAIR_COLOR = 976;
            KFLAGS.KELLY_TALK_N_HAND_TIMES = 977;
            KFLAGS.KELLY_TIMES_REWARDED = 978;
            KFLAGS.KELLY_TIMES_DIED_HAIR = 979;
            KFLAGS.KELLY_TIMES_APPLESAUCED = 980;
            KFLAGS.KELLY_REWARD_COOLDOWN = 981;
            KFLAGS.KIHA_CAMP_WATCH = 982;
            KFLAGS.TIMES_ARIAN_DILDOED = 983;
            KFLAGS.RUBI_BREAST_SIZE = 984;
            KFLAGS.RUBI_COCK_SIZE = 985;
            KFLAGS.RUBI_COCK_TYPE = 986;
            KFLAGS.RUBI_LOWERBODY = 987;
            KFLAGS.RUBI_HORNTYPE = 988;
            KFLAGS.RUBI_NIPPLETYPE = 989;
            KFLAGS.RUBI_NO_CUNT = 990;
            KFLAGS.RUBI_CUNTTYPE = 991;
            KFLAGS.RUBI_EYE_DESCRIPT = 992;
            KFLAGS.RUBI_EYE_TYPE = 993;
            KFLAGS.RUBI_SKIN = 994;
            KFLAGS.RUBI_HAIR = 995;
            KFLAGS.RUBI_HAIR_LENGTH = 996;
            KFLAGS.RUBI_BALLS_TYPE = 997;
            KFLAGS.RUBI_EAR_TYPE = 998;
            KFLAGS.RUBI_HANDS = 999;
            KFLAGS.RUBI_WHISKERS = 1000;
            KFLAGS.RUBI_FEET = 1001;
            KFLAGS.RUBI_DEBIMBO = 1002;
            KFLAGS.RUBI_NIPPLE_TYPE = 1003;
            KFLAGS.RUBI_SHE = 1004;
            KFLAGS.TIMES_DISCUSSED_RUBIS_IDENTITY = 1005;
            KFLAGS.RUBI_ICECREAM_CONFESSION = 1006;
            KFLAGS.TIMES_RUBI_DATED = 1007;
            KFLAGS.RUBI_FANCY_CONFESSION = 1008;
            KFLAGS.RUBI_BAR_CONFESSION = 1009;
            KFLAGS.RUBI_TIMES_ANALLY_TRAINED = 1010;
            KFLAGS.RUBI_TIMES_GIVEN_AN_ITEM = 1011;
            KFLAGS.RUBI_BONDAGE_STRAPS = 1012;
            KFLAGS.RUBI_INQUISITORS_CORSET = 1013;
            KFLAGS.RUBI_SETUP = 1014;
            KFLAGS.EXPLORATION_PAGE = 1015;
            KFLAGS.BOG_EXPLORED = 1016;
            KFLAGS.TIMES_ENCOUNTERED_FROG = 1017;
            KFLAGS.FERA_ENCOUNTER_DATE = 1018;
            KFLAGS.FERAS_TRAP_SPRUNG = 1019;
            KFLAGS.TIMES_VALERIA_GOO_THREESOMED = 1020;
            KFLAGS.MORE_TURKEY = 1021;
            KFLAGS.LYNNETTE_PREGNANCY_CYCLE = 1022;
            KFLAGS.LYNNETTE_APPROVAL = 1023;
            KFLAGS.LYNNETTE_BABY_COUNT = 1024;
            KFLAGS.LYNNETTE_CARRYING_COUNT = 1025;
            KFLAGS.LYNNETTE_MET_UNPREGNANT = 1026;
            KFLAGS.LYNNETTE_ANNOUNCED_APPROVAL = 1027;
            KFLAGS.LYNNETTE_FUCK_COUNTER = 1028;
            KFLAGS.UMA_TIMES_SEXED = 1029;
            KFLAGS.UMA_TIMES_MASSAGED = 1030;
            KFLAGS.UMA_TIMES_ACUPUNCTURE_UNDO = 1031;
            KFLAGS.UMA_TIMES_SUCKED_YOU = 1032;
            KFLAGS.TIMES_RUT_FUCKED_URTAS_CUNT = 1033;
            KFLAGS.TIMES_KIHA_ANALED = 1034;
            KFLAGS.TIMES_ENCOUNTERED_GOBLIN_ASSASSIN = 1035;
            KFLAGS.IZUMI_MET = 1036;
            KFLAGS.IZUMI_LAST_ENCOUNTER = 1037;
            KFLAGS.IZUMI_TIMES_SUBMITTED = 1038;
            KFLAGS.IZUMI_TIMES_GRABBED_THE_HORN = 1039;
            KFLAGS.IZUMI_TIMES_LOST_FIGHT = 1040;
            KFLAGS.IZUMI_SEEN_PC_GENDER = 1041;
            KFLAGS.FERRET_BAD_END_WARNING = 1043;
            KFLAGS.TIMES_TALKED_WITH_JOJO = 1044;
            KFLAGS.TIMES_TRAINED_WITH_JOJO = 1045;
            KFLAGS.UNLOCKED_JOJO_TRAINING = 1046;
            KFLAGS.MET_FROSTY = 1047;
            KFLAGS.SIGNED_FROSTYS_CONTRACT = 1048;
            KFLAGS.FROSTY_POINTS = 1049;
            KFLAGS.SEEN_GENDERLESS_FROSTY_REJECTION = 1050;
            KFLAGS.MARBLE_PURIFIED = 1051;
            KFLAGS.MARBLE_BOYS = 1052;
            KFLAGS.CLARA_IMPRISONED = 1053;
            KFLAGS.CLARA_PURIFIED = 1054;
            KFLAGS.MARBLE_TIME_SINCE_NURSED_IN_HOURS = 1055;
            KFLAGS.MARBLE_BREAST_SIZE = 1056;
            KFLAGS.TIMES_GIVEN_MARBLE_PURE_LABOVA = 1057;
            KFLAGS.MARBLE_RATHAZUL_COUNTER_1 = 1058;
            KFLAGS.MARBLE_PURIFICATION_STAGE = 1059;
            KFLAGS.MURBLE_TEA_DRINKER_COUNT = 1060;
            KFLAGS.MARBLE_RATHAZUL_COUNTER_2 = 1061;
            KFLAGS.MARBLE_WARNED_ABOUT_CORRUPTION = 1062;
            KFLAGS.MARBLE_LEFT_OVER_CORRUPTION = 1063;
            KFLAGS.MARBLE_COUNTUP_TO_PURIFYING = 1064;
            KFLAGS.TIMES_ENCOUNTERED_PRINCESS_GWYNN = 1065;
            KFLAGS.WILD_HUNT_ENCOUNTERS = 1066;
            KFLAGS.ERLKING_DISABLED = 1067;
            KFLAGS.KATHERINE_MET_SCYLLA = 1069;
            KFLAGS.WHITNEY_TALK_MURBLE_AND_KELT = 1070;
            KFLAGS.WHITNEY_TALK_TELADRE = 1071;
            KFLAGS.WHITNEY_TALK_HIGH_MOUNTAIN = 1072;
            KFLAGS.WHITNEY_TALK_DUNGEON = 1073;
            KFLAGS.WHITNEY_TALK_DUNGEON_FOLLOWUP = 1074;
            KFLAGS.FARM_CORRUPTION_DISABLED = 1075;
            KFLAGS.FARM_CORRUPT_PROMPT_DISPLAY = 1076;
            KFLAGS.FARM_CORRUPTION_STARTED = 1077;
            KFLAGS.WHITNEY_CORRUPTION = 1078;
            KFLAGS.FOLLOWER_AT_FARM_AMILY = 1079;
            KFLAGS.FOLLOWER_AT_FARM_JOJO = 1080;
            KFLAGS.FOLLOWER_AT_FARM_SOPHIE = 1081;
            KFLAGS.FOLLOWER_AT_FARM_IZMA = 1082;
            KFLAGS.FOLLOWER_AT_FARM_ISABELLA = 1083;
            KFLAGS.FOLLOWER_AT_FARM_VAPULA = 1084;
            KFLAGS.FOLLOWER_AT_FARM_LATEXY = 1085;
            KFLAGS.FOLLOWER_AT_FARM_CERAPH = 1086;
            KFLAGS.FOLLOWER_AT_FARM_HOLLI = 1087;
            KFLAGS.FOLLOWER_AT_FARM_KELLY = 1088;
            KFLAGS.FOLLOWER_AT_FARM_BATH_GIRL = 1089;
            KFLAGS.FARM_CORRUPTION_FIRST_DATE = 1090;
            KFLAGS.FOLLOWER_AT_FARM_MARBLE = 1091;
            KFLAGS.FARM_CORRUPTION_DAYS_SINCE_LAST_PAYOUT = 1092;
            KFLAGS.FARM_CORRUPTION_GEMS_WAITING = 1093;
            KFLAGS.FARM_UPGRADES_REFINERY = 1094;
            KFLAGS.WHITNEY_CORRUPTION_COMPLETE = 1095;
            KFLAGS.FOLLOWER_PRODUCTION_AMILY = 1096;
            KFLAGS.FARM_SUCCUMILK_STORED = 1097;
            KFLAGS.FOLLOWER_PRODUCTION_JOJO = 1098;
            KFLAGS.FARM_INCUDRAFT_STORED = 1099;
            KFLAGS.FOLLOWER_AT_FARM_AMILY_GIBS_MILK = 1100;
            KFLAGS.FOLLOWER_AT_FARM_JOJO_GIBS_DRAFT = 1101;
            KFLAGS.FOLLOWER_PRODUCTION_SOPHIE = 1102;
            KFLAGS.FOLLOWER_PRODUCTION_SOPHIE_COLORCHOICE = 1103;
            KFLAGS.FARM_EGG_STORED = 1104;
            KFLAGS.FARM_EGG_COUNTDOWN = 1105;
            KFLAGS.FOLLOWER_PRODUCTION_VAPULA = 1106;
            KFLAGS.FOLLOWER_AT_FARM_VAPULA_GIBS_MILK = 1107;
            KFLAGS.HOLLI_FUCKED_TODAY = 1108;
            KFLAGS.FARM_UPGRADES_CONTRACEPTIVE = 1109;
            KFLAGS.KELT_TALKED_FARM_MANAGEMENT = 1110;
            KFLAGS.FARM_CONTRACEPTIVE_STORED = 1111;
            KFLAGS.WHITNEY_CORRUPTION_HIGHEST = 1112;
            KFLAGS.WHITNEY_CORRUPTION_0_30_DROP_MESSAGE = 1113;
            KFLAGS.FARM_CORRUPTION_APPROACHED_WHITNEY = 1114;
            KFLAGS.WHITNEY_LEAVE_0_60 = 1115;
            KFLAGS.WHITNEY_MENU_31_60 = 1116;
            KFLAGS.WHITNEY_MENU_61_90 = 1117;
            KFLAGS.WHITNEY_LEAVE_61_90 = 1118;
            KFLAGS.WHITNEY_MENU_91_119 = 1119;
            KFLAGS.WHITNEY_DISABLED_FOR_DAY = 1120;
            KFLAGS.WHITNEY_DEFURRED = 1121;
            KFLAGS.WHITNEY_DOM = 1122;
            KFLAGS.FARM_UPGRADES_MILKTANK = 1123;
            KFLAGS.QUEUE_BREASTMILKER_UPGRADE = 1124;
            KFLAGS.QUEUE_COCKMILKER_UPGRADE = 1125;
            KFLAGS.QUEUE_REFINERY_UPGRADE = 1126;
            KFLAGS.QUEUE_CONTRACEPTIVE_UPGRADE = 1127;
            KFLAGS.QUEUE_MILKTANK_UPGRADE = 1128;
            KFLAGS.WHITNEY_TATTOO_COLLARBONE = 1129;
            KFLAGS.WHITNEY_TATTOO_SHOULDERS = 1130;
            KFLAGS.WHITNEY_TATTOO_LOWERBACK = 1131;
            KFLAGS.WHITNEY_TATTOO_BUTT = 1132;
            KFLAGS.FARM_CORRUPTION_BRANDING_MENU_UNLOCKED = 1133;
            KFLAGS.QUEUE_BRANDING_UPGRADE = 1134;
            KFLAGS.QUEUE_BRANDING_AVAILABLE_TALK = 1135;
            KFLAGS.WHITNEY_ORAL_TRAINING = 1136;
            KFLAGS.AMILY_TATTOO_COLLARBONE = 1137;
            KFLAGS.AMILY_TATTOO_SHOULDERS = 1138;
            KFLAGS.AMILY_TATTOO_LOWERBACK = 1139;
            KFLAGS.AMILY_TATTOO_BUTT = 1140;
            KFLAGS.JOJO_TATTOO_COLLARBONE = 1141;
            KFLAGS.JOJO_TATTOO_SHOULDERS = 1142;
            KFLAGS.JOJO_TATTOO_LOWERBACK = 1143;
            KFLAGS.JOJO_TATTOO_BUTT = 1144;
            KFLAGS.SOPHIE_TATTOO_COLLARBONE = 1145;
            KFLAGS.SOPHIE_TATTOO_SHOULDERS = 1146;
            KFLAGS.SOPHIE_TATTOO_LOWERBACK = 1147;
            KFLAGS.SOPHIE_TATTOO_BUTT = 1148;
            KFLAGS.VAPULA_TATTOO_COLLARBONE = 1149;
            KFLAGS.VAPULA_TATTOO_SHOULDERS = 1150;
            KFLAGS.VAPULA_TATTOO_LOWERBACK = 1151;
            KFLAGS.VAPULA_TATTOO_BUTT = 1152;
            KFLAGS.KELLY_TATTOO_COLLARBONE = 1153;
            KFLAGS.KELLY_TATTOO_SHOULDERS = 1154;
            KFLAGS.KELLY_TATTOO_LOWERBACK = 1155;
            KFLAGS.KELLY_TATTOO_BUTT = 1156;
            KFLAGS.MILKY_TATTOO_COLLARBONE = 1157;
            KFLAGS.MILKY_TATTOO_SHOULDERS = 1158;
            KFLAGS.MILKY_TATTOO_LOWERBACK = 1159;
            KFLAGS.MILKY_TATTOO_BUTT = 1160;
            KFLAGS.WHITNEY_DOM_FIRST_PLEASURE = 1161;
            KFLAGS.FARM_UPGRADES_ORGYROOM = 1162;
            KFLAGS.MASSAGE_HAPPY_ENDINGS = 1163;
            KFLAGS.QUEUE_ORGYROOM_UPGRADE = 1164;
            KFLAGS.FOUND_CATHEDRAL = 1165;
            KFLAGS.PLACES_PAGE = 1166;
            KFLAGS.MARBLE_MILKED_BEFORE = 1168;
            KFLAGS.TATTOO_SAVEFIX_APPLIED = 1169;
            KFLAGS.BIRTHS_PHOUKA = 1170;
            KFLAGS.BIRTHS_FAERIE = 1171;
            KFLAGS.PHOUKA_ENCOUNTER_STATUS = 1172;
            KFLAGS.PHOUKA_LORE = 1173;
            KFLAGS.PREGNANCY_CORRUPTION = 1174;
            KFLAGS.TREACLE_MINE_YEAR_DONE = 1175;
            KFLAGS.PLAYER_INFECTED_HELLHOUNDS = 1176;
            KFLAGS.PLAYER_INFECTED_MINOTAURS = 1177;
            KFLAGS.PLAYER_INFECTED_IMPS = 1178;
            KFLAGS.FEMOIT_UNLOCKED = 1179;
            KFLAGS.BIMBO_FEMOIT_UNLOCKED = 1180;
            KFLAGS.BENOIT_STATUS = 1181;
            KFLAGS.FEMOIT_NEXTDAY_EVENT = 1182;
            KFLAGS.FEMOIT_TALKED_TO = 1183;
            KFLAGS.KATHERINE_RANDOM_RECRUITMENT_DISABLED = 1184;
            KFLAGS.TIMES_FUCKED_FEMOIT = 1185;
            KFLAGS.FEMOIT_EGGS = 1186;
            KFLAGS.FEMOIT_INCUBATION = 1187;
            KFLAGS.FEMOIT_READY_FOR_EGGS = 1188;
            KFLAGS.FEMOIT_FIRST_CLUTCH_MISSED = 1189;
            KFLAGS.FEMOIT_EGGS_LAID = 1190;
            KFLAGS.FEMOIT_HELPED_LAY = 1191;
            KFLAGS.FEMOIT_SPOONED = 1192;
            KFLAGS.FEMOIT_NEXTDAY_EVENT_DONE = 1193;
            KFLAGS.VALA_HEALED_HONEY = 1194;
            KFLAGS.AMILY_PREGNANCY_TYPE = 1195;
            KFLAGS.AMILY_BUTT_PREGNANCY_TYPE = 1196;
            KFLAGS.FEMALE_SPIDERMORPH_PREGNANCY_TYPE = 1197;
            KFLAGS.PHYLLA_VAGINAL_PREGNANCY_TYPE = 1198;
            KFLAGS.TAMANI_PREGNANCY_TYPE = 1199;
            KFLAGS.TAMANI_PREGNANCY_INCUBATION = 1200;
            KFLAGS.TAMANI_PREGNANCY_COUNT = 1201;
            KFLAGS.TAMANI_TIMES_IMPREGNATED = 1202;
            KFLAGS.TAMANI_MET = 1203;
            KFLAGS.TAMANI_NUMBER_OF_DAUGHTERS = 1204;
            KFLAGS.TAMANI_DAUGHTERS_PREGNANCY_TYPE = 1205;
            KFLAGS.TAMANI_DAUGHTERS_PREGNANCY_COUNT = 1206;
            KFLAGS.IZMA_PREGNANCY_TYPE = 1207;
            KFLAGS.EMBER_PREGNANCY_TYPE = 1208;
            KFLAGS.JOJO_BUTT_PREGNANCY_TYPE = 1209;
            KFLAGS.SHEILA_DISABLED = 1210;
            KFLAGS.SHEILA_PREGNANCY_TYPE = 1211;
            KFLAGS.KELLY_PREGNANCY_TYPE = 1212;
            KFLAGS.KELLY_KIDS_MALE = 1213;
            KFLAGS.FUCK_OFF_THEIVING_RAPHAEL = 1214;
            KFLAGS.VALA_TIMES_CONSENSUAL_SEX = 1215;
            KFLAGS.KATHERINE_DICK_FORM = 1216;
            KFLAGS.KATHERINE_BREAST_SIZE = 1217;
            KFLAGS.KATHERINE_HOURS_SINCE_CUM = 1218;
            KFLAGS.KATHERINE_SEXUAL_EXPERIENCE = 1219;
            KFLAGS.KATHERINE_CLOTHES = 1220;
            KFLAGS.KATHERINE_CLOTHES_PREF = 1221;
            KFLAGS.KATHERINE_CLOTHES_WORN = 1222;
            KFLAGS.KATHERINE_HAIR_COLOR = 1223;
            KFLAGS.KATHERINE_IS_CAT_GIRL = 1224;
            KFLAGS.KATHERINE_LOCATION = 1225;
            KFLAGS.KATHERINE_TRAINING = 1226;
            KFLAGS.KATHERINE_SUB_FLAGS = 1227;
            KFLAGS.KATHERINE_AMILY_AFFECTION = 1228;
            KFLAGS.KATHERINE_COTTON_AFFECTION = 1229;
            KFLAGS.KATHERINE_EDRYN_AFFECTION = 1230;
            KFLAGS.KATHERINE_HELIA_AFFECTION = 1231;
            KFLAGS.KATHERINE_URTA_AFFECTION = 1232;
            KFLAGS.KATHERINE_URTA_DATE = 1233;
            KFLAGS.KATHERINE_URTA_TIMES_SEX = 1234;
            KFLAGS.KATHERINE_VALA_AFFECTION = 1235;
            KFLAGS.KATHERINE_VALA_DATE = 1236;
            KFLAGS.KATHERINE_VALA_TIMES_SEX = 1237;
            KFLAGS.SAVE_FILE_INTEGER_FORMAT_VERSION = 1238;
            KFLAGS.D3_DISCOVERED = 1239;
            KFLAGS.D3_ENTERED_MAGPIEHALL = 1240;
            KFLAGS.D3_BASILISKS_REMOVED_FROM_MAGPIE_HALL = 1241;
            KFLAGS.D3_MIRRORS_SHATTERED = 1242;
            KFLAGS.D3_JEAN_CLAUDE_DEFEATED = 1243;
            KFLAGS.D3_DOPPELGANGER_DEFEATED = 1244;
            KFLAGS.D3_MECHANIC_LAST_GREET = 1245;
            KFLAGS.D3_MECHANIC_FIGHT_RESULT = 1246;
            KFLAGS.D3_MECHANIC_COCK_TYPE_SELECTION = 1247;
            KFLAGS.D3_STATUE_DEFEATED = 1248;
            KFLAGS.D3_GARDENER_DEFEATED = 1249;
            KFLAGS.D1_OMNIBUS_KILLED = 1250;
            KFLAGS.D3_CENTAUR_DEFEATED = 1251;
            KFLAGS.D3_EGGS_AVAILABLE = 1252;
            KFLAGS.NOT_HELPED_ARIAN_TODAY = 1253;
            KFLAGS.BEE_GIRL_STATUS = 1254;
            KFLAGS.BEE_GIRL_COMBAT_WINS_WITH_RAPE = 1255;
            KFLAGS.BEE_GIRL_COMBAT_WINS_WITHOUT_RAPE = 1256;
            KFLAGS.BEE_GIRL_COMBAT_LOSSES = 1257;
            KFLAGS.KATHERINE_MILK_OPTIONS = 1258;
            KFLAGS.SCYLLA_FURRY_FOURSOME_COUNT = 1259;
            KFLAGS.SCYLLA_SMALLCOCK_INTRO = 1260;
            KFLAGS.DRIDERINCUBUS_DEFEATED = 1261;
            KFLAGS.DRIDERINCUBUS_KILLED = 1262;
            KFLAGS.MITZI_RECRUITED = 1263;
            KFLAGS.MITZI_FUCKED = 1264;
            KFLAGS.DRIDERINCUBUS_FUCKED = 1265;
            KFLAGS.MINOTAURKING_DEFEATED = 1266;
            KFLAGS.MINOTAURKING_KILLED = 1267;
            KFLAGS.MINOTAURKING_FUCKED = 1268;
            KFLAGS.MINOTAURKINGSSLUT_FUCKED = 1269;
            KFLAGS.MINOTAURKINGS_TOUCH = 1270;
            KFLAGS.MINOTAURKING_ALIVE = 1271;
            KFLAGS.LETHICE_DEFEATED = 1272;
            KFLAGS.LETHICE_NAME = 1274;
            KFLAGS.LETHICE_FUCKED = 1275;
            KFLAGS.LETHICE_REDEEMED = 1276;
            KFLAGS.LETHICE_KILLED = 1277;
            KFLAGS.LETHICE_LEFT_ALIVE = 1278;
            KFLAGS.GAME_END = 1279;
            KFLAGS.OVIMAX_OVERDOSE = 1295;
            KFLAGS.MINO_CHEF_TALKED_RED_RIVER_ROOT = 1296;
            KFLAGS.BENOIT_EYES_TALK_UNLOCKED = 1300;
            KFLAGS.BENOIT_BASIL_EYES_GRANTED = 1301;
            KFLAGS.BENOIT_HAIRPIN_TALKED_TODAY = 1302;
            KFLAGS.IMPS_PETRIFIED = 1303;
            KFLAGS.CAMP_WALL_STATUES = 1304;
            KFLAGS.CODEX_ENTRY_BASILISKS = 1305;
            KFLAGS.COCKATRICES_UNLOCKED = 1310;
            KFLAGS.TIMES_ENCOUNTERED_COCKATRICES = 1311;
            KFLAGS.CODEX_ENTRY_COCKATRICES = 1312;
            KFLAGS.TIMES_ORGASMED = 2001;
            KFLAGS.CORRUPTED_MARAE_KILLED = 2002;
            KFLAGS.CAMP_BUILT_CABIN = 2003;
            KFLAGS.CAMP_CABIN_PROGRESS = 2004;
            KFLAGS.CAMP_CABIN_WOOD_RESOURCES = 2005;
            KFLAGS.CAMP_CABIN_FURNITURE_BED = 2006;
            KFLAGS.CAMP_CABIN_FURNITURE_NIGHTSTAND = 2007;
            KFLAGS.CAMP_CABIN_FURNITURE_DRESSER = 2008;
            KFLAGS.CAMP_CABIN_FURNITURE_TABLE = 2009;
            KFLAGS.CAMP_CABIN_FURNITURE_CHAIR1 = 2010;
            KFLAGS.CAMP_CABIN_FURNITURE_CHAIR2 = 2011;
            KFLAGS.CAMP_CABIN_FURNITURE_DESK = 2012;
            KFLAGS.CAMP_CABIN_FURNITURE_DESKCHAIR = 2013;
            KFLAGS.CAMP_CABIN_FURNITURE_BOOKSHELF = 2014;
            KFLAGS.MET_MARAE = 2015;
            KFLAGS.MET_MARAE_CORRUPTED = 2016;
            KFLAGS.MARAE_QUEST_START = 2017;
            KFLAGS.MARAE_QUEST_COMPLETE = 2018;
            KFLAGS.MARAE_LETHICITE = 2019;
            KFLAGS.FACTORY_FOUND = 2020;
            KFLAGS.FACTORY_SUCCUBUS_DEFEATED = 2021;
            KFLAGS.FACTORY_INCUBUS_DEFEATED = 2022;
            KFLAGS.FACTORY_OMNIBUS_DEFEATED = 2023;
            KFLAGS.FACTORY_SHUTDOWN = 2024;
            KFLAGS.FACTORY_INCUBUS_BRIBED = 2025;
            KFLAGS.FACTORY_TAKEN_LACTAID = 2026;
            KFLAGS.FACTORY_TAKEN_GROPLUS = 2027;
            KFLAGS.FACTORY_MILKER_BUILT = 2028;
            KFLAGS.KELT_KILL_PLAN = 2029;
            KFLAGS.KELT_KILLED = 2030;
            KFLAGS.WHITNEY_GONE = 2031;
            KFLAGS.CODEX_CURRENT_ENTRY = 2032;
            KFLAGS.CODEX_CURRENT_PAGE = 2033;
            KFLAGS.CODEX_UNUSED_FLAG_1 = 2034;
            KFLAGS.CODEX_UNUSED_FLAG_2 = 2035;
            KFLAGS.CODEX_ENTRY_ANEMONES = 2036;
            KFLAGS.CODEX_ENTRY_ARACHNES = 2037;
            KFLAGS.CODEX_ENTRY_FETISHFOLLOWERS = 2038;
            KFLAGS.CODEX_ENTRY_GIANTBEES = 2039;
            KFLAGS.CODEX_ENTRY_GOBLINS = 2040;
            KFLAGS.CODEX_ENTRY_GOOGIRLS = 2041;
            KFLAGS.CODEX_ENTRY_HARPIES = 2042;
            KFLAGS.CODEX_ENTRY_HELLHOUNDS = 2043;
            KFLAGS.CODEX_ENTRY_IMPS = 2044;
            KFLAGS.CODEX_ENTRY_LABOVINES = 2045;
            KFLAGS.CODEX_ENTRY_LIZANS = 2046;
            KFLAGS.CODEX_ENTRY_MAGIC = 2047;
            KFLAGS.CODEX_ENTRY_MINOTAURS = 2048;
            KFLAGS.CODEX_ENTRY_NAGAS = 2049;
            KFLAGS.CODEX_ENTRY_ORCS = 2050;
            KFLAGS.CODEX_ENTRY_SALAMANDERS = 2051;
            KFLAGS.CODEX_ENTRY_SANDWITCHES = 2052;
            KFLAGS.CODEX_ENTRY_SATYRS = 2053;
            KFLAGS.CODEX_ENTRY_SHARKGIRLS = 2054;
            KFLAGS.CODEX_ENTRY_SUCCUBUS = 2055;
            KFLAGS.PIG_SLUT_DISABLED = 2056;
            KFLAGS.MARBLE_CORRUPT_MARAE_STORY = 2057;
            KFLAGS.CAMP_PORTAL_PROGRESS = 2058;
            KFLAGS.DISCOVERED_GLACIAL_RIFT = 2059;
            KFLAGS.DISCOVERED_VOLCANO_CRAG = 2060;
            KFLAGS.MET_YETI_FIRST_TIME = 2061;
            KFLAGS.VALERIA_FOUND_IN_GLACIAL_RIFT = 2062;
            KFLAGS.SHEILA_LETHICITE_FORGE_DAY = 2063;
            KFLAGS.CHEAT_ENTERING_COUNTER_2 = 2064;
            KFLAGS.GIACOMO_MET = 2065;
            KFLAGS.MOD_SAVE_VERSION = 2066;
            KFLAGS.GIACOMO_NOTICES_WORMS = 2067;
            KFLAGS.KEPT_PURE_JOJO_OVER_VAPULA = 2068;
            KFLAGS.KEPT_PURE_AMILY_OVER_VAPULA = 2069;
            KFLAGS.PHOENIX_ENCOUNTERED = 2070;
            KFLAGS.LUSTSTICK_LIBIDO_INITIAL = 2071;
            KFLAGS.LUSTSTICK_LIBIDO_MOD = 2072;
            KFLAGS.PHOENIX_WANKED_COUNTER = 2073;
            KFLAGS.TIMES_MASTURBATED = 2074;
            KFLAGS.DEMONS_DEFEATED = 2075;
            KFLAGS.AMILY_VILLAGE_EXPLORED = 2076;
            KFLAGS.TIMES_TRANSFORMED = 2077;
            KFLAGS.CORRUPTED_GLADES_DESTROYED = 2078;
            KFLAGS.HERMOIT_NEXTDAY_EVENT = 2079;
            KFLAGS.HERMOIT_NEXTDAY_EVENT_DONE = 2080;
            KFLAGS.ACHIEVEMENT_PROGRESS_FASTING = 2081;
            KFLAGS.ACHIEVEMENT_PROGRESS_GLUTTON = 2082;
            KFLAGS.ACHIEVEMENT_PROGRESS_SCHIZOPHRENIA = 2083;
            KFLAGS.ACHIEVEMENT_PROGRESS_CLEAN_SLATE = 2084;
            KFLAGS.ACHIEVEMENT_PROGRESS_TOTAL_DAMAGE = 2085;
            KFLAGS.CLEARED_HEL_TOWER = 2086;
            KFLAGS.MINERVA_PURIFICATION_PROGRESS = 2087;
            KFLAGS.MINERVA_PURIFICATION_MARAE_TALKED = 2088;
            KFLAGS.MINERVA_PURIFICATION_JOJO_TALKED = 2089;
            KFLAGS.MINERVA_PURIFICATION_RATHAZUL_TALKED = 2090;
            KFLAGS.MINERVA_CHILDREN = 2091;
            KFLAGS.MINERVA_CORRUPTION_PROGRESS = 2092;
            KFLAGS.MINERVA_TOWER_TREE = 2093;
            KFLAGS.MINERVA_TOWER_REPAIRED = 2094;
            KFLAGS.MINERVA_PREGNANCY_TYPE = 2095;
            KFLAGS.MINERVA_PREGNANCY_INCUBATION = 2096;
            KFLAGS.MINERVA_FOUND_LOST_SHARKGIRL = 2097;
            KFLAGS.MINERVA_TELLS_ABOUT_PREGNANCY = 2098;
            KFLAGS.TIMES_BIRTHED_SHARPIES = 2099;
            KFLAGS.ACHIEVEMENT_PROGRESS_DEFORESTER = 2100;
            KFLAGS.ACHIEVEMENT_PROGRESS_IM_NO_LUMBERJACK = 2101;
            KFLAGS.ACHIEVEMENT_PROGRESS_HAMMER_TIME = 2102;
            KFLAGS.ACHIEVEMENT_PROGRESS_SCAVENGER = 2103;
            KFLAGS.TIMES_BAD_ENDED = 2104;
            KFLAGS.CONDOMED = 2105;
            KFLAGS.HELIA_HERMIFIED = 2106;
            KFLAGS.IMP_LORD_MALEHERM_PROGRESS = 2107;
            KFLAGS.EMBER_SPAR_VICTORIES = 2108;
            KFLAGS.PHOENIX_HP_LOSS_COUNTER = 2109;
            KFLAGS.LIZAN_ROGUE_SEX_COUNTER = 2110;
            KFLAGS.BENOIT_PISTOL_BOUGHT = 2111;
            KFLAGS.BENOIT_CLOCK_BOUGHT = 2113;
            KFLAGS.BENOIT_CLOCK_ALARM = 2114;
            KFLAGS.GOBLIN_ELDER_GRATEFUL_OVER_LETHICE_DEFEAT = 2115;
            KFLAGS.MET_LIZAN_FIRST_TIME = 2116;
            KFLAGS.TIMES_ENCOUNTERED_GOBLIN_WARRIOR = 2117;
            KFLAGS.TIMES_ENCOUNTERED_GOBLIN_SHAMAN = 2118;
            KFLAGS.TIMES_ENCOUNTERED_GOBLIN_ELDER = 2119;
            KFLAGS.TIMES_ENCOUNTERED_GOBLIN_QUEEN = 2120;
            KFLAGS.DISABLED_JOJO_RAPE = 2136;
            KFLAGS.DISABLED_SEX_MACHINE = 2137;
            KFLAGS.ENEMY_CRITICAL = 2138;
            KFLAGS.MARBLE_HAMMER_QUEST_PROGRESS = 2139;
            KFLAGS.SHIFT_KEY_DOWN = 2140;
            KFLAGS.THIEF_GEMS = 2172;
            KFLAGS.INGNAM_GREETED_AFTER_LONGTIME = 2173;
            KFLAGS.SCARRED_BLADE_STATUS = 2175;
            KFLAGS.PURE_MARAE_ENDGAME = 2176;
            KFLAGS.LETHICITE_ARMOR_TAKEN = 2177;
            KFLAGS.CAMP_WALL_PROGRESS = 2178;
            KFLAGS.CAMP_WALL_GATE = 2179;
            KFLAGS.CAMP_WALL_SKULLS = 2180;
            KFLAGS.JOJO_SEX_COUNTER = 2184;
            KFLAGS.JOJO_ANAL_XP = 2185;
            KFLAGS.JOJO_LITTERS = 2186;
            KFLAGS.JOJO_BLOWJOB_XP = 2187;
            KFLAGS.JOJO_VAGINAL_CATCH_COUNTER = 2188;
            KFLAGS.JOJO_LITTERS_AMILY_REACTION_COUNTER = 2189;
            KFLAGS.JOJO_ANAL_CATCH_COUNTER = 2190;
            KFLAGS.KIHA_UNDERGARMENTS = 2191;
            KFLAGS.KIHA_PREGNANCY_TYPE = 2192;
            KFLAGS.KIHA_INCUBATION = 2193;
            KFLAGS.KIHA_CHILDREN_BOYS = 2195;
            KFLAGS.KIHA_CHILDREN_GIRLS = 2196;
            KFLAGS.KIHA_CHILDREN_HERMS = 2197;
            KFLAGS.KIHA_CHILD_MATURITY_COUNTER = 2198;
            KFLAGS.KIHA_PREGNANCY_POTENTIAL = 2199;
            KFLAGS.VALERIA_FLUIDS = 2200;
            KFLAGS.IZMA_FEEDING_VALERIA = 2201;
            KFLAGS.HELLHOUNDS_KILLED = 2202;
            KFLAGS.IMPS_KILLED = 2203;
            KFLAGS.GOBLINS_KILLED = 2204;
            KFLAGS.MINOTAURS_KILLED = 2205;
            KFLAGS.TIMES_SLEPT_WITH_EMBER = 2206;
            KFLAGS.EMBER_MORNING = 2207;
            KFLAGS.BASILISK_RESISTANCE_TRACKER = 2208;
            KFLAGS.MINOTAUR_CUM_RESISTANCE_TRACKER = 2209;
            KFLAGS.DLC_APRIL_FOOLS = 2210;
            KFLAGS.GOBLIN_ELDER_TALK_COUNTER = 2211;
            KFLAGS.ISABELLA_POTENCY_STATE = 2212;
            KFLAGS.ISABELLA_COWMOTHER = 2213;
            KFLAGS.ISABELLA_PREGNANCY_TYPE = 2214;
            KFLAGS.ISABELLA_PREGNANCY_INCUBATION = 2215;
            KFLAGS.ISABELLA_PREGNANCY_BOOSTED = 2216;
            KFLAGS.ISABELLA_CHILDREN_HUMANS = 2217;
            KFLAGS.ISABELLA_CHILDREN_COWGIRLS = 2218;
            KFLAGS.ISABELLA_COUNTDOWN_TO_CONTRACEPTIONS = 2219;
            KFLAGS.ISABELLA_VALERIA_SPARRED = 2220;
            KFLAGS.FAERIE_ENCOUNTER_DISABLED = 2221;
            KFLAGS.MINERVA_CORRUPTED_CUM_ADDICTION = 2222;
            KFLAGS.ERLKING_CANE_OBTAINED = 2223;
            KFLAGS.KIHA_DESTROYING_CORRUPTED_GLADES = 2225;
            KFLAGS.AMILY_DESTROYING_CORRUPTED_GLADES = 2226;
            KFLAGS.URTA_VIXEN_AND_CREAM_COUNTER = 2266;
            KFLAGS.CAMP_CABIN_STONE_RESOURCES = 2267;
            KFLAGS.ACHIEVEMENT_PROGRESS_YABBA_DABBA_DOO = 2268;
            KFLAGS.ACHIEVEMENT_PROGRESS_ANTWORKS = 2269;
            KFLAGS.CODEX_ENTRY_ZEBRAS = 2270;
            KFLAGS.ACHIEVEMENT_PROGRESS_EGG_HUNTER = 2271;
            KFLAGS.CURRENT_WEATHER = 2272;
            KFLAGS.WEATHER_CHANGE_COOLDOWN = 2273;
            KFLAGS.TAMANI_DEFEAT_COUNTER = 2274;
            KFLAGS.TAMANI_BAD_ENDED = 2275;
            KFLAGS.PHYLLA_STONES_HUNTED_TODAY = 2276;
            KFLAGS.TIMES_EXPLORED = 2297;
            KFLAGS.TIMES_EXPLORED_FOREST = 2298;
            KFLAGS.TIMES_EXPLORED_DESERT = 2299;
            KFLAGS.TIMES_EXPLORED_MOUNTAIN = 2300;
            KFLAGS.TIMES_EXPLORED_LAKE = 2301;
            KFLAGS.HELIA_SPAR_VICTORIES = 2302;
            KFLAGS.HELSPAWN_SPAR_VICTORIES = 2303;
            KFLAGS.KIHA_SPAR_VICTORIES = 2304;
            KFLAGS.ISABELLA_SPAR_VICTORIES = 2305;
            KFLAGS.MINERVA_SPAR_VICTORIES = 2306;
            KFLAGS.VALERIA_SPAR_VICTORIES = 2307;
            KFLAGS.AIKO_SPAR_VICTORIES = 2308;
            KFLAGS.SANDWITCH_SERVICED = 2310;
            KFLAGS.JOJO_STATUS = 2311;
            KFLAGS.TOWN_RUINS_SCAVENGE_CONSIDERED = 2319;
            KFLAGS.TOWN_RUINS_HOUSES_DISMANTLED = 2320;
            KFLAGS.TOWN_RUINS_HOUSE_SCAVENGE_PROGRESS = 2321;
            KFLAGS.TOWN_RUINS_TOWNHALL_SCAVENGE_PROGRESS = 2322;
            KFLAGS.TOWN_RUINS_SHOP_SCAVENGE_PROGRESS = 2323;
            KFLAGS.TOWN_RUINS_HOUSE_FURNITURE_FOUND = 2324;
            KFLAGS.TOWN_RUINS_TOWNHALL_FURNITURE_FOUND = 2325;
            KFLAGS.TOWN_RUINS_SHOP_FURNITURE_FOUND = 2326;
            KFLAGS.PABLO_MET = 2327;
            KFLAGS.PABLO_AFFECTION = 2328;
            KFLAGS.PABLO_WORKOUT_COUNTER = 2329;
            KFLAGS.PABLO_SECRET_LEARNED = 2330;
            KFLAGS.PABLO_SEX_UNLOCKED = 2331;
            KFLAGS.PABLO_GOT_DICKED_VAGINALLY = 2332;
            KFLAGS.PABLO_GOT_DICKED_ANALLY = 2333;
            KFLAGS.PABLO_USED_YOUR_PUSSY = 2334;
            KFLAGS.PABLO_USED_YOUR_ASS = 2335;
            KFLAGS.PABLO_FREAKED_OUT_OVER_WORMS = 2336;
            KFLAGS.TIMES_MINO_MUTUAL = 2337;
            KFLAGS.AMAROK_LOSSES = 2339;
            KFLAGS.MRAPIER_BOUGHT = 2340;
            KFLAGS.GOTTEN_INQUISITOR_CORSET = 2341;
            KFLAGS.GOTTEN_INQUISITOR_ROBES = 2342;
            KFLAGS.GOBLIN_ELDER_FOREPLAY_COUNTER = 2343;
            KFLAGS.GOBLIN_ELDER_RELATION_COUNTER = 2344;
            KFLAGS.GOBLIN_ELDER_WRESTLE_COUNTER = 2345;
            KFLAGS.GOBLIN_ELDER_BEAST_COUNTER = 2346;
            KFLAGS.WEAPON_SHOP_UPGRADE_ITEM = 2347;
            KFLAGS.WEAPON_SHOP_UPGRADE_TIME = 2348;
            KFLAGS.ARMOR_SHOP_UPGRADE_ITEM = 2349;
            KFLAGS.ARMOR_SHOP_UPGRADE_TIME = 2350;
            KFLAGS.CHILL_SMITH_UPGRADE_ITEM = 2351;
            KFLAGS.CHILL_SMITH_UPGRADE_TIME = 2352;
            KFLAGS.AIKO_TIMES_MET = 2353;
            KFLAGS.AIKO_CORRUPTION = 2354;
            KFLAGS.AIKO_AFFECTION = 2356;
            KFLAGS.AIKO_SEXED = 2357;
            KFLAGS.AIKO_BALL_RETURNED = 2358;
            KFLAGS.AIKO_FIRST_CHOICE = 2359;
            KFLAGS.AIKO_FIRST_SEX_COOLDOWN = 2360;
            KFLAGS.AIKO_HAS_FOUGHT = 2361;
            KFLAGS.AIKO_FIGHT_WON = 2362;
            KFLAGS.AIKO_HOT_BLOOD = 2363;
            KFLAGS.AIKO_APOLOGY_SINCERE = 2364;
            KFLAGS.AIKO_RAPE = 2365;
            KFLAGS.AIKO_TALK_CULTURE = 2366;
            KFLAGS.AIKO_TALK_AIKO = 2367;
            KFLAGS.AIKO_TALK_ARCHERY = 2368;
            KFLAGS.AIKO_BOSS_INTRO = 2369;
            KFLAGS.AIKO_BOSS_COMPLETE = 2370;
            KFLAGS.AIKO_BOSS_OUTRO = 2371;
            KFLAGS.YAMATA_MASOCHIST = 2372;
            KFLAGS.TOTAL_HP_VICTORIES = 2373;
            KFLAGS.TENTACLE_BEASTS_KILLED = 2374;
            KFLAGS.WORMS_MASS_KILLED = 2375;
            KFLAGS.ACHIEVEMENT_PROGRESS_DAMAGE_SPONGE = 2376;
            KFLAGS.HELSPAWN_HADSEX = 2638;
            KFLAGS.CERAPHSUBMISSIVE = 2639;
            KFLAGS.CERAPHCHASITY = 2640;
            KFLAGS.CERAPHTOLDGIRLS = 2641;
            KFLAGS.ASCENSIONING = 2644;
            KFLAGS.HADSLUGPARASITE = 2645;
            KFLAGS.METVOLCANICGOLEM = 2646;
            KFLAGS.VOLCANICGOLEMHP = 2647;
            KFLAGS.VOLCANICGOLEMSHIELDHP = 2648;
            KFLAGS.DESTROYEDVOLCANICGOLEM = 2649;
            KFLAGS.VOLCWITCHNUMBEROFCHILDREN = 2650;
            KFLAGS.VOLCWITCHNUMBEROFBIRTHS = 2651;
            KFLAGS.POTENTPREGNANCYBOOST = 2652;
            KFLAGS.AMILY_TREE_MADEUPBULLSHIT = 2653;
            KFLAGS.PARASITE_EEL_DAYDONE = 2654;
            KFLAGS.AMILY_BULGE_STRIKES = 2655;
            KFLAGS.AMILY_BULGE_PROMISE = 2656;
            KFLAGS.CERAPH_KILLED = 2657;
            KFLAGS.KIHA_KILLED = 2658;
            KFLAGS.DULLAHAN_MET = 2659;
            KFLAGS.DULLAHAN_RUDE = 2660;
            KFLAGS.DULLAHAN_DEAD = 2661;
            KFLAGS.BEAUTIFUL_SWORD_LEVEL = 2662;
            KFLAGS.SWORD_SHARDS_TAKEN = 2665;
            KFLAGS.ZETAZ_POTION_CURED = 2666;
            KFLAGS.UNKNOWN_FLAG_NUMBER_02667 = 2667;
            KFLAGS.TIMES_BEATEN_DULLAHAN_SPAR = 2668;
            KFLAGS.RECEIVED_MASTURBATION_WARNING = 2669;
            KFLAGS.UNKNOWN_FLAG_NUMBER_02670 = 2670;
            KFLAGS.MANOR_PROGRESS = 2671;
            KFLAGS.FOUND_MANOR = 2672;
            KFLAGS.CODEX_EPHRAIM_JOURNAL = 2673;
            KFLAGS.ACCEPTED_DULL_REQUEST = 2674;
            KFLAGS.CORR_WITCH_COVEN = 2675;
            KFLAGS.UNIT_AMOUNT = 2676;
            KFLAGS.SAVE_FIXED = 2677;
            KFLAGS.PUMPKIN_SEEDS_EATEN = 2678;
            KFLAGS.PUMPKIN_SEEDS_FAIL = 2679;
            KFLAGS.IZMA_JOJO_CHILDREN_EVENT = 2680;
            KFLAGS.ANNEMARIE_STATUS = 2681;
            KFLAGS.FOUND_WIZARD_TOWER = 2682;
            KFLAGS.WIZARD_TOWER_PROGRESS = 2683;
            KFLAGS.GRABBED_LIGHT_RAIL_AVENGER = 2684;
            KFLAGS.VILKUS_DEFEAT_DAY = 2685;
            KFLAGS.CHILD_LOSSES_SANDWITCH = 2687;
            KFLAGS.GIFTED_FLOWER = 2688;
            KFLAGS.HELIA_MINO_SITUATION = 2689;
            KFLAGS.HELIA_ADDICTION_LEVEL = 2690;
            KFLAGS.HELIA_FED_CUM = 2691;
            KFLAGS.HELIA_FED_DAY = 2692;
            KFLAGS.HELIA_OUT = 2693;
            KFLAGS.HELIA_CURE_KNOWN = 2694;
            KFLAGS.HELIA_ADDICTION_COMPLETE = 2695;
            KFLAGS.LOLIPOP_COUNTER = 2696;
            KFLAGS.ALICE_CHATS = 2697;
            KFLAGS.CODEX_ENTRY_ALICE = 2698;
            KFLAGS.EQUIPPED_NAUGHTY_NUN = 2699;
            KFLAGS.TOOK_NAUGHTY_HABIT = 2700;
            KFLAGS.MET_CULTIST_NUN = 2701;
            KFLAGS.PRAYED_WITH_NUN = 2702;
            KFLAGS.DEFILED_NUN = 2703;
            KFLAGS.UNLOCKED_ASCENSION_AGE = 2704;
            KFLAGS.DESTROYED_BEAUTIFUL_SWORD = 2705;
            KFLAGS.CORRUPTED_COVEN_CIRCE_CHIT_CHAT_COUNT = 2706;
            KFLAGS.CIRCE_TOOK_JEREMIAH = 2707;
            KFLAGS.CORRUPTED_COVEN_CIRCE_CHIT_CHAT_COOLDOWN = 2708;
            KFLAGS.NH_BJ = 2709;
            KFLAGS.DULLAHAN_HORSE_NAME = 2710;
            KFLAGS.DULL_DATES = 2711;
            KFLAGS.MET_HELLMOUTH = 2712;
            KFLAGS.CODEX_ENTRY_HELLMOUTH = 2713;
            KFLAGS.AKBAL_QUEST_STATUS = 2715;
            KFLAGS.AKBAL_FUCKERY = 2716;
            KFLAGS.AKBAL_DAY_DONE = 2717;
            KFLAGS.AKKY_NAME = 2718;
            KFLAGS.MET_ALIANDRA = 2719;
            KFLAGS.ALIANDRA_DEAD = 2720;
            KFLAGS.MAGIC_SWITCH = 2721;
            KFLAGS.CODEX_ENTRY_TERRESTRIAL_FIRE = 2722;
            KFLAGS.GENDER_SWITCH = 2723;
            KFLAGS.HELLMOUTHS_KILLED = 2724;
            KFLAGS.ALICES_KILLED = 2725;
            KFLAGS.LIDDELLIUM_FLAG = 2727;
            KFLAGS.LIDDELLIUM_SEAN_FLAG = 2728;
            KFLAGS.LIDDELLIUM_LUMI_FLAG = 2729;
            KFLAGS.LIDDELLIUM_CERAPH_FLAG = 2730;
            KFLAGS.LIDDELLIUM_DUNGEON_FLAG = 2731;
            KFLAGS.FARM_STABLES = 2732;
            KFLAGS.CODEX_ENTRY_FAERIE = 2733;
            KFLAGS.CODEX_ENTRY_PHOUKA = 2734;
            KFLAGS.SYLVIA_PREGNANCY_TYPE = 2735;
            KFLAGS.SYLVIA_PREGNANCY_INCUBATION = 2736;
            KFLAGS.CODEX_ENTRY_ALRAUNE = 2737;
            KFLAGS.FROG_PREGNANCY_TYPE = 2738;
            KFLAGS.FROG_PREGNANCY_INCUBATION = 2739;
            KFLAGS.CODEX_ENTRY_RAT_MICE = 2740;
            KFLAGS.EMBER_AGE = 2779;
            KFLAGS.GAR_LOVER_TALKS = 2786;
            KFLAGS.GAR_LOVER_CHOICE = 2787;
            KFLAGS.LEWDED_THE_GARGOYLE = 2788;
            KFLAGS.EMBER_HERM_EGGS = 2789;
            KFLAGS.BED_BEARS = 2796;
            KFLAGS.ICE_WEAPON_TIMER = 2797;
            KFLAGS.PARASITE_NEPHILA_DAYDONE = 2918;
            KFLAGS.TIMES_MET_NEPHILA = 2919;
            KFLAGS.PC_MET_NEPHILA_COVEN = 2920;
            KFLAGS.NEPHILA_COVEN_QUEEN_CROWNED = 2921;
            KFLAGS.NEPHILA_QUEEN_ARMOR = 2922;
            KFLAGS.NEPHILA_SECOND_ASCENSION = 2923;
            KFLAGS.CODEX_ENTRY_NEPHILA = 2924;
            KFLAGS.NEPHILA_MOUSE_MET = 2925;
            KFLAGS.NEPHILA_MOUSE_OWNED = 2926;
            KFLAGS.CODEX_ENTRY_GNOLL = 2927;
            KFLAGS.DELETE_ITEMS = 2977;
            KFLAGS.NEW_GAME_PLUS_LEVEL = 2979;
            KFLAGS.MEANINGLESS_CORRUPTION = 2995;
            KFLAGS.ITS_EVERY_DAY = 2996;
            KFLAGS.GRIMDARK_MODE = 2999;
            KFLAGS.HELSPAWN_JOINED_SLUT = 3000;
         }
         if(!Profiling.init__)
         {
            Profiling.init__ = true;
            Profiling.PF_COUNT = new StringMap();
            Profiling.PF_TIME = new StringMap();
         }
         if(!ArmorLib.init__)
         {
            ArmorLib.init__ = true;
            ArmorLib.NOTHING = new classes.items.armors.Nothing();
         }
         if(!JewelryLib.init__)
         {
            JewelryLib.init__ = true;
            JewelryLib.NOTHING = new classes.items.jewelries.Nothing();
         }
         if(!Mutations.init__)
         {
            Mutations.init__ = true;
            Mutations._instance = new Mutations();
         }
         if(!ShieldLib.init__)
         {
            ShieldLib.init__ = true;
            ShieldLib.NOTHING = new classes.items.shields.Nothing();
         }
         if(!UndergarmentLib.init__)
         {
            UndergarmentLib.init__ = true;
            UndergarmentLib.NOTHING = new classes.items.undergarments.Nothing();
         }
         if(!Weapon.init__)
         {
            Weapon.init__ = true;
            Weapon.WEAPONEFFECTS = new WeaponEffects();
         }
         if(!WeaponLib.init__)
         {
            WeaponLib.init__ = true;
            WeaponLib.FISTS = new Fists();
            WeaponLib.CLAWS = new UnarmedClaws();
         }
         if(!IceWeapon.init__)
         {
            IceWeapon.init__ = true;
            IceWeapon.typeTags = ["斧","单手钝器","长矛","单手剑","匕首","Scythe","Staff"];
         }
         if(!FlagLists.init__)
         {
            FlagLists.init__ = true;
            FlagLists.KEEP_ON_ASCENSION = [2979,2644,2704,418];
         }
         if(!PerkLists.init__)
         {
            PerkLists.init__ = true;
            PerkLists.PERMABLE = [PerkLib.Flexibility,PerkLib.Incorporeality,PerkLib.SatyrSexuality,PerkLib.Lustserker,PerkLib.CorruptedNinetails,PerkLib.EnlightenedNinetails,PerkLib.Bloodhound,PerkLib.MaraesGiftButtslut,PerkLib.MaraesGiftFertility,PerkLib.MaraesGiftProfractory,PerkLib.MaraesGiftStud,PerkLib.PurityBlessing,PerkLib.Hellfire,PerkLib.FireLord,PerkLib.Dragonfire,PerkLib.Androgyny,PerkLib.MagicalFertility,PerkLib.MagicalVirility,PerkLib.MilkMaid,PerkLib.Misdirection,PerkLib.MysticLearnings,PerkLib.RapierTraining,PerkLib.PotentPregnancy,PerkLib.PotentProstate,PerkLib.ParasiteQueen,PerkLib.ThickSkin,PerkLib.TerrestrialFire,PerkLib.MermaidChant];
            PerkLists.BIMBO = [PerkLib.BimboBody,PerkLib.BimboBrains,PerkLib.FutaForm,PerkLib.FutaFaculties];
            PerkLists.HISTORY = [{
               "text":"炼金",
               "perk":PerkLib.HistoryAlchemist
            },{
               "text":"斗殴",
               "perk":PerkLib.HistoryFighter
            },{
               "text":"财富",
               "perk":PerkLib.HistoryFortune
            },{
               "text":"治疗",
               "perk":PerkLib.HistoryHealer
            },{
               "text":"宗教",
               "perk":PerkLib.HistoryReligious
            },{
               "text":"求学",
               "perk":PerkLib.HistoryScholar
            },{
               "text":"偷懒",
               "perk":PerkLib.HistorySlacker
            },{
               "text":"荡妇",
               "perk":PerkLib.HistorySlut
            },{
               "text":"铁匠",
               "perk":PerkLib.HistorySmith
            },{
               "text":"娼妓",
               "perk":PerkLib.HistoryWhore
            },{
               "text":"盗贼",
               "perk":PerkLib.HistoryThief
            },{
               "text":"圣骑士",
               "perk":PerkLib.HistoryDEUSVULT
            }];
            PerkLists.ENDOWMENT_ATTRIBUTE = [{
               "text":"强壮",
               "perk":PerkLib.Strong
            },{
               "text":"坚韧",
               "perk":PerkLib.Tough
            },{
               "text":"迅捷",
               "perk":PerkLib.Fast
            },{
               "text":"聪慧",
               "perk":PerkLib.Smart
            },{
               "text":"性欲",
               "perk":PerkLib.Lusty
            },{
               "text":"触觉",
               "perk":PerkLib.Sensitive
            },{
               "text":"性冷淡",
               "perk":PerkLib.Frigid
            },{
               "text":"变态",
               "perk":PerkLib.Pervert
            }];
            PerkLists.ENDOWMENT_COCK = [{
               "text":"大鸡巴",
               "perk":PerkLib.BigCock
            },{
               "text":"精液量多",
               "perk":PerkLib.MessyOrgasms
            }];
            PerkLists.ENDOWMENT_VAGINA = [{
               "text":"大胸",
               "perk":PerkLib.BigTits
            },{
               "text":"大阴蒂",
               "perk":PerkLib.BigClit
            },{
               "text":"多产",
               "perk":PerkLib.Fertile
            },{
               "text":"湿润小穴",
               "perk":PerkLib.WetPussy
            }];
         }
         if(!ConditionalConverters.init__)
         {
            ConditionalConverters.init__ = true;
            §§push(ConditionalConverters);
            _loc1_ = new StringMap();
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_str());
            };
            if("strength" in StringMap.reserved)
            {
               _loc1_.setReserved("strength",_loc2_);
            }
            else
            {
               _loc1_.h["strength"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_str());
            };
            if("str" in StringMap.reserved)
            {
               _loc1_.setReserved("str",_loc2_);
            }
            else
            {
               _loc1_.h["str"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_tou());
            };
            if("toughness" in StringMap.reserved)
            {
               _loc1_.setReserved("toughness",_loc2_);
            }
            else
            {
               _loc1_.h["toughness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_tou());
            };
            if("tou" in StringMap.reserved)
            {
               _loc1_.setReserved("tou",_loc2_);
            }
            else
            {
               _loc1_.h["tou"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_spe());
            };
            if("speed" in StringMap.reserved)
            {
               _loc1_.setReserved("speed",_loc2_);
            }
            else
            {
               _loc1_.h["speed"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_spe());
            };
            if("spe" in StringMap.reserved)
            {
               _loc1_.setReserved("spe",_loc2_);
            }
            else
            {
               _loc1_.h["spe"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_inte());
            };
            if("intelligence" in StringMap.reserved)
            {
               _loc1_.setReserved("intelligence",_loc2_);
            }
            else
            {
               _loc1_.h["intelligence"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_inte());
            };
            if("inte" in StringMap.reserved)
            {
               _loc1_.setReserved("inte",_loc2_);
            }
            else
            {
               _loc1_.h["inte"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().lib);
            };
            if("libido" in StringMap.reserved)
            {
               _loc1_.setReserved("libido",_loc2_);
            }
            else
            {
               _loc1_.h["libido"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().lib);
            };
            if("lib" in StringMap.reserved)
            {
               _loc1_.setReserved("lib",_loc2_);
            }
            else
            {
               _loc1_.h["lib"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().sens);
            };
            if("sensitivity" in StringMap.reserved)
            {
               _loc1_.setReserved("sensitivity",_loc2_);
            }
            else
            {
               _loc1_.h["sensitivity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().sens);
            };
            if("sens" in StringMap.reserved)
            {
               _loc1_.setReserved("sens",_loc2_);
            }
            else
            {
               _loc1_.h["sens"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().cor);
            };
            if("corruption" in StringMap.reserved)
            {
               _loc1_.setReserved("corruption",_loc2_);
            }
            else
            {
               _loc1_.h["corruption"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().cor);
            };
            if("cor" in StringMap.reserved)
            {
               _loc1_.setReserved("cor",_loc2_);
            }
            else
            {
               _loc1_.h["cor"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_fatigue());
            };
            if("fatigue" in StringMap.reserved)
            {
               _loc1_.setReserved("fatigue",_loc2_);
            }
            else
            {
               _loc1_.h["fatigue"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_HP());
            };
            if("hp" in StringMap.reserved)
            {
               _loc1_.setReserved("hp",_loc2_);
            }
            else
            {
               _loc1_.h["hp"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_lust());
            };
            if("lust" in StringMap.reserved)
            {
               _loc1_.setReserved("lust",_loc2_);
            }
            else
            {
               _loc1_.h["lust"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().maxLust());
            };
            if("maxlust" in StringMap.reserved)
            {
               _loc1_.setReserved("maxlust",_loc2_);
            }
            else
            {
               _loc1_.h["maxlust"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().hunger);
            };
            if("hunger" in StringMap.reserved)
            {
               _loc1_.setReserved("hunger",_loc2_);
            }
            else
            {
               _loc1_.h["hunger"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.time.minutes);
            };
            if("minute" in StringMap.reserved)
            {
               _loc1_.setReserved("minute",_loc2_);
            }
            else
            {
               _loc1_.h["minute"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.time.hours);
            };
            if("hour" in StringMap.reserved)
            {
               _loc1_.setReserved("hour",_loc2_);
            }
            else
            {
               _loc1_.h["hour"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.time.hours);
            };
            if("hours" in StringMap.reserved)
            {
               _loc1_.setReserved("hours",_loc2_);
            }
            else
            {
               _loc1_.h["hours"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.time.days);
            };
            if("days" in StringMap.reserved)
            {
               _loc1_.setReserved("days",_loc2_);
            }
            else
            {
               _loc1_.h["days"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_armor() != ArmorLib.NOTHING);
            };
            if("hasarmor" in StringMap.reserved)
            {
               _loc1_.setReserved("hasarmor",_loc2_);
            }
            else
            {
               _loc1_.h["hasarmor"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_lowerGarment() != UndergarmentLib.NOTHING);
            };
            if("haslowergarment" in StringMap.reserved)
            {
               _loc1_.setReserved("haslowergarment",_loc2_);
            }
            else
            {
               _loc1_.h["haslowergarment"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_upperGarment() != UndergarmentLib.NOTHING);
            };
            if("hasuppergarment" in StringMap.reserved)
            {
               _loc1_.setReserved("hasuppergarment",_loc2_);
            }
            else
            {
               _loc1_.h["hasuppergarment"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(!ConditionalConverters.get_player().isUnarmed());
            };
            if("hasweapon" in StringMap.reserved)
            {
               _loc1_.setReserved("hasweapon",_loc2_);
            }
            else
            {
               _loc1_.h["hasweapon"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_tallness());
            };
            if("tallness" in StringMap.reserved)
            {
               _loc1_.setReserved("tallness",_loc2_);
            }
            else
            {
               _loc1_.h["tallness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_tallness());
            };
            if("height" in StringMap.reserved)
            {
               _loc1_.setReserved("height",_loc2_);
            }
            else
            {
               _loc1_.h["height"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().thickness);
            };
            if("thickness" in StringMap.reserved)
            {
               _loc1_.setReserved("thickness",_loc2_);
            }
            else
            {
               _loc1_.h["thickness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().tone);
            };
            if("tone" in StringMap.reserved)
            {
               _loc1_.setReserved("tone",_loc2_);
            }
            else
            {
               _loc1_.h["tone"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().hair.length);
            };
            if("hairlength" in StringMap.reserved)
            {
               _loc1_.setReserved("hairlength",_loc2_);
            }
            else
            {
               _loc1_.h["hairlength"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_femininity());
            };
            if("femininity" in StringMap.reserved)
            {
               _loc1_.setReserved("femininity",_loc2_);
            }
            else
            {
               _loc1_.h["femininity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(100 - ConditionalConverters.get_player().get_femininity());
            };
            if("masculinity" in StringMap.reserved)
            {
               _loc1_.setReserved("masculinity",_loc2_);
            }
            else
            {
               _loc1_.h["masculinity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().cockTotal());
            };
            if("cocks" in StringMap.reserved)
            {
               _loc1_.setReserved("cocks",_loc2_);
            }
            else
            {
               _loc1_.h["cocks"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Cock = ConditionalConverters.get_player().cocks[0];
               return OneOf_Impl_.fromB(_loc1_ != null ? _loc1_.cockLength : null);
            };
            if("cocklength" in StringMap.reserved)
            {
               _loc1_.setReserved("cocklength",_loc2_);
            }
            else
            {
               _loc1_.h["cocklength"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Cock = ConditionalConverters.get_player().cocks[ConditionalConverters.get_player().biggestCockIndex()];
               return OneOf_Impl_.fromB(_loc1_ != null ? _loc1_.cockLength : null);
            };
            if("biggestcocklength" in StringMap.reserved)
            {
               _loc1_.setReserved("biggestcocklength",_loc2_);
            }
            else
            {
               _loc1_.h["biggestcocklength"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Cock = ConditionalConverters.get_player().cocks[0];
               return OneOf_Impl_.fromB(_loc1_ != null ? _loc1_.cockThickness : null);
            };
            if("cockthickness" in StringMap.reserved)
            {
               _loc1_.setReserved("cockthickness",_loc2_);
            }
            else
            {
               _loc1_.h["cockthickness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Cock = ConditionalConverters.get_player().cocks[0];
               return OneOf_Impl_.fromB(_loc1_ != null ? _loc1_.cArea() : null);
            };
            if("cockarea" in StringMap.reserved)
            {
               _loc1_.setReserved("cockarea",_loc2_);
            }
            else
            {
               _loc1_.h["cockarea"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().bRows());
            };
            if("breastrows" in StringMap.reserved)
            {
               _loc1_.setReserved("breastrows",_loc2_);
            }
            else
            {
               _loc1_.h["breastrows"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().biggestTitSize());
            };
            if("biggesttitsize" in StringMap.reserved)
            {
               _loc1_.setReserved("biggesttitsize",_loc2_);
            }
            else
            {
               _loc1_.h["biggesttitsize"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().vaginalCapacity());
            };
            if("vagcapacity" in StringMap.reserved)
            {
               _loc1_.setReserved("vagcapacity",_loc2_);
            }
            else
            {
               _loc1_.h["vagcapacity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().analCapacity());
            };
            if("analcapacity" in StringMap.reserved)
            {
               _loc1_.setReserved("analcapacity",_loc2_);
            }
            else
            {
               _loc1_.h["analcapacity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().balls);
            };
            if("balls" in StringMap.reserved)
            {
               _loc1_.setReserved("balls",_loc2_);
            }
            else
            {
               _loc1_.h["balls"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().ballSize);
            };
            if("ballsize" in StringMap.reserved)
            {
               _loc1_.setReserved("ballsize",_loc2_);
            }
            else
            {
               _loc1_.h["ballsize"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().cumQ());
            };
            if("cumquantity" in StringMap.reserved)
            {
               _loc1_.setReserved("cumquantity",_loc2_);
            }
            else
            {
               _loc1_.h["cumquantity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().lactationQ());
            };
            if("milkquantity" in StringMap.reserved)
            {
               _loc1_.setReserved("milkquantity",_loc2_);
            }
            else
            {
               _loc1_.h["milkquantity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().biggestLactation());
            };
            if("biggestlactation" in StringMap.reserved)
            {
               _loc1_.setReserved("biggestlactation",_loc2_);
            }
            else
            {
               _loc1_.h["biggestlactation"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasVagina());
            };
            if("hasvagina" in StringMap.reserved)
            {
               _loc1_.setReserved("hasvagina",_loc2_);
            }
            else
            {
               _loc1_.h["hasvagina"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isTaur());
            };
            if("istaur" in StringMap.reserved)
            {
               _loc1_.setReserved("istaur",_loc2_);
            }
            else
            {
               _loc1_.h["istaur"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isHoofed());
            };
            if("ishoofed" in StringMap.reserved)
            {
               _loc1_.setReserved("ishoofed",_loc2_);
            }
            else
            {
               _loc1_.h["ishoofed"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isCentaur());
            };
            if("iscentaur" in StringMap.reserved)
            {
               _loc1_.setReserved("iscentaur",_loc2_);
            }
            else
            {
               _loc1_.h["iscentaur"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isNaga());
            };
            if("isnaga" in StringMap.reserved)
            {
               _loc1_.setReserved("isnaga",_loc2_);
            }
            else
            {
               _loc1_.h["isnaga"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isGoo());
            };
            if("isgoo" in StringMap.reserved)
            {
               _loc1_.setReserved("isgoo",_loc2_);
            }
            else
            {
               _loc1_.h["isgoo"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().demonScore() >= 4);
            };
            if("isdemonmorph" in StringMap.reserved)
            {
               _loc1_.setReserved("isdemonmorph",_loc2_);
            }
            else
            {
               _loc1_.h["isdemonmorph"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isBiped());
            };
            if("isbiped" in StringMap.reserved)
            {
               _loc1_.setReserved("isbiped",_loc2_);
            }
            else
            {
               _loc1_.h["isbiped"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isMermaid());
            };
            if("ismermaid" in StringMap.reserved)
            {
               _loc1_.setReserved("ismermaid",_loc2_);
            }
            else
            {
               _loc1_.h["ismermaid"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isMermaid());
            };
            if("ismer" in StringMap.reserved)
            {
               _loc1_.setReserved("ismer",_loc2_);
            }
            else
            {
               _loc1_.h["ismer"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasTailInsteadOfLegs());
            };
            if("tailleg" in StringMap.reserved)
            {
               _loc1_.setReserved("tailleg",_loc2_);
            }
            else
            {
               _loc1_.h["tailleg"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasAntennae());
            };
            if("hasantennae" in StringMap.reserved)
            {
               _loc1_.setReserved("hasantennae",_loc2_);
            }
            else
            {
               _loc1_.h["hasantennae"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().biggestTitSize() >= 1);
            };
            if("hasbreasts" in StringMap.reserved)
            {
               _loc1_.setReserved("hasbreasts",_loc2_);
            }
            else
            {
               _loc1_.h["hasbreasts"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasBalls());
            };
            if("hasballs" in StringMap.reserved)
            {
               _loc1_.setReserved("hasballs",_loc2_);
            }
            else
            {
               _loc1_.h["hasballs"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasCock());
            };
            if("hascock" in StringMap.reserved)
            {
               _loc1_.setReserved("hascock",_loc2_);
            }
            else
            {
               _loc1_.h["hascock"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasSheath());
            };
            if("hassheath" in StringMap.reserved)
            {
               _loc1_.setReserved("hassheath",_loc2_);
            }
            else
            {
               _loc1_.h["hassheath"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasBeak());
            };
            if("hasbeak" in StringMap.reserved)
            {
               _loc1_.setReserved("hasbeak",_loc2_);
            }
            else
            {
               _loc1_.h["hasbeak"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasCatEyes());
            };
            if("hascateyes" in StringMap.reserved)
            {
               _loc1_.setReserved("hascateyes",_loc2_);
            }
            else
            {
               _loc1_.h["hascateyes"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasCatFace());
            };
            if("hascatface" in StringMap.reserved)
            {
               _loc1_.setReserved("hascatface",_loc2_);
            }
            else
            {
               _loc1_.h["hascatface"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasClaws());
            };
            if("hasclaws" in StringMap.reserved)
            {
               _loc1_.setReserved("hasclaws",_loc2_);
            }
            else
            {
               _loc1_.h["hasclaws"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasDragonNeck());
            };
            if("hasdragonneck" in StringMap.reserved)
            {
               _loc1_.setReserved("hasdragonneck",_loc2_);
            }
            else
            {
               _loc1_.h["hasdragonneck"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasTail());
            };
            if("hastail" in StringMap.reserved)
            {
               _loc1_.setReserved("hastail",_loc2_);
            }
            else
            {
               _loc1_.h["hastail"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasScales());
            };
            if("hasscales" in StringMap.reserved)
            {
               _loc1_.setReserved("hasscales",_loc2_);
            }
            else
            {
               _loc1_.h["hasscales"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().neck.pos);
            };
            if("neckpos" in StringMap.reserved)
            {
               _loc1_.setReserved("neckpos",_loc2_);
            }
            else
            {
               _loc1_.h["neckpos"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasBarkSkin());
            };
            if("hasplantskin" in StringMap.reserved)
            {
               _loc1_.setReserved("hasplantskin",_loc2_);
            }
            else
            {
               _loc1_.h["hasplantskin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasPlainSkin());
            };
            if("hasplainskin" in StringMap.reserved)
            {
               _loc1_.setReserved("hasplainskin",_loc2_);
            }
            else
            {
               _loc1_.h["hasplainskin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasGooSkin());
            };
            if("hasgooskin" in StringMap.reserved)
            {
               _loc1_.setReserved("hasgooskin",_loc2_);
            }
            else
            {
               _loc1_.h["hasgooskin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFur());
            };
            if("hasfur" in StringMap.reserved)
            {
               _loc1_.setReserved("hasfur",_loc2_);
            }
            else
            {
               _loc1_.h["hasfur"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasWool());
            };
            if("haswool" in StringMap.reserved)
            {
               _loc1_.setReserved("haswool",_loc2_);
            }
            else
            {
               _loc1_.h["haswool"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFeathers());
            };
            if("hasfeathers" in StringMap.reserved)
            {
               _loc1_.setReserved("hasfeathers",_loc2_);
            }
            else
            {
               _loc1_.h["hasfeathers"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFurryUnderBody());
            };
            if("hasfurryunderbody" in StringMap.reserved)
            {
               _loc1_.setReserved("hasfurryunderbody",_loc2_);
            }
            else
            {
               _loc1_.h["hasfurryunderbody"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasLongTongue());
            };
            if("haslongtongue" in StringMap.reserved)
            {
               _loc1_.setReserved("haslongtongue",_loc2_);
            }
            else
            {
               _loc1_.h["haslongtongue"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFangs());
            };
            if("hasfangs" in StringMap.reserved)
            {
               _loc1_.setReserved("hasfangs",_loc2_);
            }
            else
            {
               _loc1_.h["hasfangs"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasPerk(PerkLib.SlimeCore));
            };
            if("hasslimecore" in StringMap.reserved)
            {
               _loc1_.setReserved("hasslimecore",_loc2_);
            }
            else
            {
               _loc1_.h["hasslimecore"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasUndergarments());
            };
            if("hasundergarments" in StringMap.reserved)
            {
               _loc1_.setReserved("hasundergarments",_loc2_);
            }
            else
            {
               _loc1_.h["hasundergarments"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasHorns());
            };
            if("hashorns" in StringMap.reserved)
            {
               _loc1_.setReserved("hashorns",_loc2_);
            }
            else
            {
               _loc1_.h["hashorns"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hair.length > 0);
            };
            if("hashair" in StringMap.reserved)
            {
               _loc1_.setReserved("hashair",_loc2_);
            }
            else
            {
               _loc1_.h["hashair"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasKnot());
            };
            if("hasknot" in StringMap.reserved)
            {
               _loc1_.setReserved("hasknot",_loc2_);
            }
            else
            {
               _loc1_.h["hasknot"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Cock = ConditionalConverters.get_player().cocks[0];
               return OneOf_Impl_.fromB(_loc1_ != null ? _loc1_.knotMultiplier : null);
            };
            if("knotmult" in StringMap.reserved)
            {
               _loc1_.setReserved("knotmult",_loc2_);
            }
            else
            {
               _loc1_.h["knotmult"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFurryEars());
            };
            if("hasfurryears" in StringMap.reserved)
            {
               _loc1_.setReserved("hasfurryears",_loc2_);
            }
            else
            {
               _loc1_.h["hasfurryears"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasMuzzle());
            };
            if("hasmuzzle" in StringMap.reserved)
            {
               _loc1_.setReserved("hasmuzzle",_loc2_);
            }
            else
            {
               _loc1_.h["hasmuzzle"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasWings());
            };
            if("haswings" in StringMap.reserved)
            {
               _loc1_.setReserved("haswings",_loc2_);
            }
            else
            {
               _loc1_.h["haswings"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasGills());
            };
            if("hasgills" in StringMap.reserved)
            {
               _loc1_.setReserved("hasgills",_loc2_);
            }
            else
            {
               _loc1_.h["hasgills"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isFurry());
            };
            if("isfurry" in StringMap.reserved)
            {
               _loc1_.setReserved("isfurry",_loc2_);
            }
            else
            {
               _loc1_.h["isfurry"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isFluffy());
            };
            if("isfluffy" in StringMap.reserved)
            {
               _loc1_.setReserved("isfluffy",_loc2_);
            }
            else
            {
               _loc1_.h["isfluffy"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isGenderless());
            };
            if("isgenderless" in StringMap.reserved)
            {
               _loc1_.setReserved("isgenderless",_loc2_);
            }
            else
            {
               _loc1_.h["isgenderless"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isMale());
            };
            if("ismale" in StringMap.reserved)
            {
               _loc1_.setReserved("ismale",_loc2_);
            }
            else
            {
               _loc1_.h["ismale"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isFemale());
            };
            if("isfemale" in StringMap.reserved)
            {
               _loc1_.setReserved("isfemale",_loc2_);
            }
            else
            {
               _loc1_.h["isfemale"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isHerm());
            };
            if("isherm" in StringMap.reserved)
            {
               _loc1_.setReserved("isherm",_loc2_);
            }
            else
            {
               _loc1_.h["isherm"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isMaleOrHerm());
            };
            if("ismaleorherm" in StringMap.reserved)
            {
               _loc1_.setReserved("ismaleorherm",_loc2_);
            }
            else
            {
               _loc1_.h["ismaleorherm"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isFemaleOrHerm());
            };
            if("isfemaleorherm" in StringMap.reserved)
            {
               _loc1_.setReserved("isfemaleorherm",_loc2_);
            }
            else
            {
               _loc1_.h["isfemaleorherm"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_silly());
            };
            if("silly" in StringMap.reserved)
            {
               _loc1_.setReserved("silly",_loc2_);
            }
            else
            {
               _loc1_.h["silly"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() <= 50);
            };
            if("cumlow" in StringMap.reserved)
            {
               _loc1_.setReserved("cumlow",_loc2_);
            }
            else
            {
               _loc1_.h["cumlow"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 50 && ConditionalConverters.get_player().cumQ() <= 150);
            };
            if("cumnormal" in StringMap.reserved)
            {
               _loc1_.setReserved("cumnormal",_loc2_);
            }
            else
            {
               _loc1_.h["cumnormal"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 150 && ConditionalConverters.get_player().cumQ() <= 350);
            };
            if("cummedium" in StringMap.reserved)
            {
               _loc1_.setReserved("cummedium",_loc2_);
            }
            else
            {
               _loc1_.h["cummedium"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 350 && ConditionalConverters.get_player().cumQ() <= 1000);
            };
            if("cumhigh" in StringMap.reserved)
            {
               _loc1_.setReserved("cumhigh",_loc2_);
            }
            else
            {
               _loc1_.h["cumhigh"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 1000 && ConditionalConverters.get_player().cumQ() <= 2500);
            };
            if("cumveryhigh" in StringMap.reserved)
            {
               _loc1_.setReserved("cumveryhigh",_loc2_);
            }
            else
            {
               _loc1_.h["cumveryhigh"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 2500);
            };
            if("cumextreme" in StringMap.reserved)
            {
               _loc1_.setReserved("cumextreme",_loc2_);
            }
            else
            {
               _loc1_.h["cumextreme"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 50);
            };
            if("cumnormalleast" in StringMap.reserved)
            {
               _loc1_.setReserved("cumnormalleast",_loc2_);
            }
            else
            {
               _loc1_.h["cumnormalleast"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 150);
            };
            if("cummediumleast" in StringMap.reserved)
            {
               _loc1_.setReserved("cummediumleast",_loc2_);
            }
            else
            {
               _loc1_.h["cummediumleast"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 350);
            };
            if("cumhighleast" in StringMap.reserved)
            {
               _loc1_.setReserved("cumhighleast",_loc2_);
            }
            else
            {
               _loc1_.h["cumhighleast"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cumQ() > 1000);
            };
            if("cumveryhighleast" in StringMap.reserved)
            {
               _loc1_.setReserved("cumveryhighleast",_loc2_);
            }
            else
            {
               _loc1_.h["cumveryhighleast"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().wetness() >= 4);
            };
            if("issquirter" in StringMap.reserved)
            {
               _loc1_.setReserved("issquirter",_loc2_);
            }
            else
            {
               _loc1_.h["issquirter"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().wetness());
            };
            if("vaginalwetness" in StringMap.reserved)
            {
               _loc1_.setReserved("vaginalwetness",_loc2_);
            }
            else
            {
               _loc1_.h["vaginalwetness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               var _loc1_:Vagina = ConditionalConverters.get_player().vaginas[0];
               return OneOf_Impl_.fromB(Number(_loc1_ != null ? _loc1_.vaginalLooseness : null));
            };
            if("vaginallooseness" in StringMap.reserved)
            {
               _loc1_.setReserved("vaginallooseness",_loc2_);
            }
            else
            {
               _loc1_.h["vaginallooseness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().ass.analWetness);
            };
            if("analwetness" in StringMap.reserved)
            {
               _loc1_.setReserved("analwetness",_loc2_);
            }
            else
            {
               _loc1_.h["analwetness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().ass.analLooseness);
            };
            if("anallooseness" in StringMap.reserved)
            {
               _loc1_.setReserved("anallooseness",_loc2_);
            }
            else
            {
               _loc1_.h["anallooseness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().butt.rating);
            };
            if("buttrating" in StringMap.reserved)
            {
               _loc1_.setReserved("buttrating",_loc2_);
            }
            else
            {
               _loc1_.h["buttrating"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_pregnancyIncubation() > 0);
            };
            if("ispregnant" in StringMap.reserved)
            {
               _loc1_.setReserved("ispregnant",_loc2_);
            }
            else
            {
               _loc1_.h["ispregnant"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_buttPregnancyIncubation() > 0);
            };
            if("isbuttpregnant" in StringMap.reserved)
            {
               _loc1_.setReserved("isbuttpregnant",_loc2_);
            }
            else
            {
               _loc1_.h["isbuttpregnant"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasFuckableNipples());
            };
            if("hasnipplecunts" in StringMap.reserved)
            {
               _loc1_.setReserved("hasnipplecunts",_loc2_);
            }
            else
            {
               _loc1_.h["hasnipplecunts"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().totalNipples());
            };
            if("totalnipples" in StringMap.reserved)
            {
               _loc1_.setReserved("totalnipples",_loc2_);
            }
            else
            {
               _loc1_.h["totalnipples"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().canFly());
            };
            if("canfly" in StringMap.reserved)
            {
               _loc1_.setReserved("canfly",_loc2_);
            }
            else
            {
               _loc1_.h["canfly"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasOvipositor());
            };
            if("hasovipositor" in StringMap.reserved)
            {
               _loc1_.setReserved("hasovipositor",_loc2_);
            }
            else
            {
               _loc1_.h["hasovipositor"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isAdult());
            };
            if("isadult" in StringMap.reserved)
            {
               _loc1_.setReserved("isadult",_loc2_);
            }
            else
            {
               _loc1_.h["isadult"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isChild());
            };
            if("ischild" in StringMap.reserved)
            {
               _loc1_.setReserved("ischild",_loc2_);
            }
            else
            {
               _loc1_.h["ischild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isTeen());
            };
            if("isteen" in StringMap.reserved)
            {
               _loc1_.setReserved("isteen",_loc2_);
            }
            else
            {
               _loc1_.h["isteen"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isElder());
            };
            if("iselder" in StringMap.reserved)
            {
               _loc1_.setReserved("iselder",_loc2_);
            }
            else
            {
               _loc1_.h["iselder"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isChild() || ConditionalConverters.get_player().isTeen());
            };
            if("isunderage" in StringMap.reserved)
            {
               _loc1_.setReserved("isunderage",_loc2_);
            }
            else
            {
               _loc1_.h["isunderage"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().wasAdult());
            };
            if("wasadult" in StringMap.reserved)
            {
               _loc1_.setReserved("wasadult",_loc2_);
            }
            else
            {
               _loc1_.h["wasadult"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().wasChild());
            };
            if("waschild" in StringMap.reserved)
            {
               _loc1_.setReserved("waschild",_loc2_);
            }
            else
            {
               _loc1_.h["waschild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().wasTeen());
            };
            if("wasteen" in StringMap.reserved)
            {
               _loc1_.setReserved("wasteen",_loc2_);
            }
            else
            {
               _loc1_.h["wasteen"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().wasElder());
            };
            if("waselder" in StringMap.reserved)
            {
               _loc1_.setReserved("waselder",_loc2_);
            }
            else
            {
               _loc1_.h["waselder"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().lactationQ() > 0);
            };
            if("islactating" in StringMap.reserved)
            {
               _loc1_.setReserved("islactating",_loc2_);
            }
            else
            {
               _loc1_.h["islactating"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().biggestTitSize() == 0);
            };
            if("isflat" in StringMap.reserved)
            {
               _loc1_.setReserved("isflat",_loc2_);
            }
            else
            {
               _loc1_.h["isflat"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isBimbo());
            };
            if("isbimbo" in StringMap.reserved)
            {
               _loc1_.setReserved("isbimbo",_loc2_);
            }
            else
            {
               _loc1_.h["isbimbo"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(true);
            };
            if("true" in StringMap.reserved)
            {
               _loc1_.setReserved("true",_loc2_);
            }
            else
            {
               _loc1_.h["true"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(false);
            };
            if("false" in StringMap.reserved)
            {
               _loc1_.setReserved("false",_loc2_);
            }
            else
            {
               _loc1_.h["false"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isNaked());
            };
            if("isnaked" in StringMap.reserved)
            {
               _loc1_.setReserved("isnaked",_loc2_);
            }
            else
            {
               _loc1_.h["isnaked"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isNakedLower());
            };
            if("isnakedlower" in StringMap.reserved)
            {
               _loc1_.setReserved("isnakedlower",_loc2_);
            }
            else
            {
               _loc1_.h["isnakedlower"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isNakedUpper());
            };
            if("isnakedupper" in StringMap.reserved)
            {
               _loc1_.setReserved("isnakedupper",_loc2_);
            }
            else
            {
               _loc1_.h["isnakedupper"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().lowerBody.legCount == 1);
            };
            if("singleleg" in StringMap.reserved)
            {
               _loc1_.setReserved("singleleg",_loc2_);
            }
            else
            {
               _loc1_.h["singleleg"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().lowerBody.legCount > 1);
            };
            if("haslegs" in StringMap.reserved)
            {
               _loc1_.setReserved("haslegs",_loc2_);
            }
            else
            {
               _loc1_.h["haslegs"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_metric());
            };
            if("metric" in StringMap.reserved)
            {
               _loc1_.setReserved("metric",_loc2_);
            }
            else
            {
               _loc1_.h["metric"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_noFur());
            };
            if("nofur" in StringMap.reserved)
            {
               _loc1_.setReserved("nofur",_loc2_);
            }
            else
            {
               _loc1_.h["nofur"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_allowChild());
            };
            if("allowchild" in StringMap.reserved)
            {
               _loc1_.setReserved("allowchild",_loc2_);
            }
            else
            {
               _loc1_.h["allowchild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_allowBaby());
            };
            if("allowbaby" in StringMap.reserved)
            {
               _loc1_.setReserved("allowbaby",_loc2_);
            }
            else
            {
               _loc1_.h["allowbaby"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_goreEnabled());
            };
            if("guro" in StringMap.reserved)
            {
               _loc1_.setReserved("guro",_loc2_);
            }
            else
            {
               _loc1_.h["guro"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_watersportsEnabled());
            };
            if("watersports" in StringMap.reserved)
            {
               _loc1_.setReserved("watersports",_loc2_);
            }
            else
            {
               _loc1_.h["watersports"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.camp.get_builtCabin());
            };
            if("builtcabin" in StringMap.reserved)
            {
               _loc1_.setReserved("builtcabin",_loc2_);
            }
            else
            {
               _loc1_.h["builtcabin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.camp.get_builtWall());
            };
            if("builtwall" in StringMap.reserved)
            {
               _loc1_.setReserved("builtwall",_loc2_);
            }
            else
            {
               _loc1_.h["builtwall"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.camp.get_builtBarrel());
            };
            if("builtbarrel" in StringMap.reserved)
            {
               _loc1_.setReserved("builtbarrel",_loc2_);
            }
            else
            {
               _loc1_.h["builtbarrel"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2010) != 0 || FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2013) != 0);
            };
            if("builtchair" in StringMap.reserved)
            {
               _loc1_.setReserved("builtchair",_loc2_);
            }
            else
            {
               _loc1_.h["builtchair"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.camp.get_builtCabin());
            };
            if("builtbed" in StringMap.reserved)
            {
               _loc1_.setReserved("builtbed",_loc2_);
            }
            else
            {
               _loc1_.h["builtbed"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().sleeping);
            };
            if("issleeping" in StringMap.reserved)
            {
               _loc1_.setReserved("issleeping",_loc2_);
            }
            else
            {
               _loc1_.h["issleeping"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               if(ConditionalConverters.get_player().hasTail())
               {
                  if(ConditionalConverters.get_player().tail.type == 13)
                  {
                     return OneOf_Impl_.fromB(ConditionalConverters.get_player().tail.venom);
                  }
                  return OneOf_Impl_.fromB(1);
               }
               return OneOf_Impl_.fromB(0);
            };
            if("tailnumber" in StringMap.reserved)
            {
               _loc1_.setReserved("tailnumber",_loc2_);
            }
            else
            {
               _loc1_.h["tailnumber"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isColdBlooded());
            };
            if("coldblooded" in StringMap.reserved)
            {
               _loc1_.setReserved("coldblooded",_loc2_);
            }
            else
            {
               _loc1_.h["coldblooded"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().get_gems());
            };
            if("gems" in StringMap.reserved)
            {
               _loc1_.setReserved("gems",_loc2_);
            }
            else
            {
               _loc1_.h["gems"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().mf("m","f") == "f");
            };
            if("isfeminine" in StringMap.reserved)
            {
               _loc1_.setReserved("isfeminine",_loc2_);
            }
            else
            {
               _loc1_.h["isfeminine"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.time.isDay());
            };
            if("isday" in StringMap.reserved)
            {
               _loc1_.setReserved("isday",_loc2_);
            }
            else
            {
               _loc1_.h["isday"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.time.isNight());
            };
            if("isnight" in StringMap.reserved)
            {
               _loc1_.setReserved("isnight",_loc2_);
            }
            else
            {
               _loc1_.h["isnight"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.camp.getCampPopulation());
            };
            if("camppop" in StringMap.reserved)
            {
               _loc1_.setReserved("camppop",_loc2_);
            }
            else
            {
               _loc1_.h["camppop"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isDrider());
            };
            if("isdrider" in StringMap.reserved)
            {
               _loc1_.setReserved("isdrider",_loc2_);
            }
            else
            {
               _loc1_.h["isdrider"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_shield() != ShieldLib.NOTHING);
            };
            if("hasshield" in StringMap.reserved)
            {
               _loc1_.setReserved("hasshield",_loc2_);
            }
            else
            {
               _loc1_.h["hasshield"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_armorPerk() == "Light");
            };
            if("lightarmor" in StringMap.reserved)
            {
               _loc1_.setReserved("lightarmor",_loc2_);
            }
            else
            {
               _loc1_.h["lightarmor"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().virilityQ());
            };
            if("virility" in StringMap.reserved)
            {
               _loc1_.setReserved("virility",_loc2_);
            }
            else
            {
               _loc1_.h["virility"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isReligious());
            };
            if("isreligious" in StringMap.reserved)
            {
               _loc1_.setReserved("isreligious",_loc2_);
            }
            else
            {
               _loc1_.h["isreligious"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(!KGAMECLASS.kGAMECLASS.get_urtaDisabled());
            };
            if("urtaexists" in StringMap.reserved)
            {
               _loc1_.setReserved("urtaexists",_loc2_);
            }
            else
            {
               _loc1_.h["urtaexists"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isUnarmed());
            };
            if("isunarmed" in StringMap.reserved)
            {
               _loc1_.setReserved("isunarmed",_loc2_);
            }
            else
            {
               _loc1_.h["isunarmed"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().get_weapon().isRanged());
            };
            if("hasranged" in StringMap.reserved)
            {
               _loc1_.setReserved("hasranged",_loc2_);
            }
            else
            {
               _loc1_.h["hasranged"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasVirginVagina());
            };
            if("isvirgin" in StringMap.reserved)
            {
               _loc1_.setReserved("isvirgin",_loc2_);
            }
            else
            {
               _loc1_.h["isvirgin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().lostVirginity);
            };
            if("haslostvirginity" in StringMap.reserved)
            {
               _loc1_.setReserved("haslostvirginity",_loc2_);
            }
            else
            {
               _loc1_.h["haslostvirginity"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().buttVirgin());
            };
            if("isanalvirgin" in StringMap.reserved)
            {
               _loc1_.setReserved("isanalvirgin",_loc2_);
            }
            else
            {
               _loc1_.h["isanalvirgin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               if(ConditionalConverters.get_player().hasVagina())
               {
                  return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasVirginVagina());
               }
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().buttVirgin());
            };
            if("isvagorassvirgin" in StringMap.reserved)
            {
               _loc1_.setReserved("isvagorassvirgin",_loc2_);
            }
            else
            {
               _loc1_.h["isvagorassvirgin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().cockTotal() > 1);
            };
            if("multicock" in StringMap.reserved)
            {
               _loc1_.setReserved("multicock",_loc2_);
            }
            else
            {
               _loc1_.h["multicock"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isInMountains() || ConditionalConverters.get_player().isInHighMountains());
            };
            if("inmountains" in StringMap.reserved)
            {
               _loc1_.setReserved("inmountains",_loc2_);
            }
            else
            {
               _loc1_.h["inmountains"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().isInLake());
            };
            if("inlake" in StringMap.reserved)
            {
               _loc1_.setReserved("inlake",_loc2_);
            }
            else
            {
               _loc1_.h["inlake"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(ConditionalConverters.get_player().getClitLength());
            };
            if("clitlength" in StringMap.reserved)
            {
               _loc1_.setReserved("clitlength",_loc2_);
            }
            else
            {
               _loc1_.h["clitlength"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.get_displaySettings().time12Hour);
            };
            if("time12hour" in StringMap.reserved)
            {
               _loc1_.setReserved("time12hour",_loc2_);
            }
            else
            {
               _loc1_.h["time12hour"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().hasStinger());
            };
            if("hasstinger" in StringMap.reserved)
            {
               _loc1_.setReserved("hasstinger",_loc2_);
            }
            else
            {
               _loc1_.h["hasstinger"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.dungeons.checkFactoryClear());
            };
            if("beatfactory" in StringMap.reserved)
            {
               _loc1_.setReserved("beatfactory",_loc2_);
            }
            else
            {
               _loc1_.h["beatfactory"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness > 90 && ConditionalConverters.get_player().tone > 90);
            };
            if("istitanicbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("istitanicbuild",_loc2_);
            }
            else
            {
               _loc1_.h["istitanicbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness > 90 && ConditionalConverters.get_player().tone >= 50);
            };
            if("ishulkbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("ishulkbuild",_loc2_);
            }
            else
            {
               _loc1_.h["ishulkbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness > 90 && ConditionalConverters.get_player().tone < 50);
            };
            if("isobesebuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isobesebuild",_loc2_);
            }
            else
            {
               _loc1_.h["isobesebuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness > 70 && ConditionalConverters.get_player().tone < 50);
            };
            if("isfatbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isfatbuild",_loc2_);
            }
            else
            {
               _loc1_.h["isfatbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness > 70 && ConditionalConverters.get_player().tone < 50 || ConditionalConverters.get_player().thickness > 50 && ConditionalConverters.get_player().tone < 25);
            };
            if("ischubbybuild" in StringMap.reserved)
            {
               _loc1_.setReserved("ischubbybuild",_loc2_);
            }
            else
            {
               _loc1_.h["ischubbybuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness < ConditionalConverters.get_player().tone && ConditionalConverters.get_player().tone >= 50);
            };
            if("ismuscularbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("ismuscularbuild",_loc2_);
            }
            else
            {
               _loc1_.h["ismuscularbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness < 71 && ConditionalConverters.get_player().tone < 71 && (ConditionalConverters.get_player().thickness > 30 && ConditionalConverters.get_player().tone > 30));
            };
            if("isaveragebuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isaveragebuild",_loc2_);
            }
            else
            {
               _loc1_.h["isaveragebuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness < ConditionalConverters.get_player().tone);
            };
            if("isfitbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isfitbuild",_loc2_);
            }
            else
            {
               _loc1_.h["isfitbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness <= 30);
            };
            if("isthinbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isthinbuild",_loc2_);
            }
            else
            {
               _loc1_.h["isthinbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().thickness < 10 && ConditionalConverters.get_player().tone < 10);
            };
            if("isemaciatedbuild" in StringMap.reserved)
            {
               _loc1_.setReserved("isemaciatedbuild",_loc2_);
            }
            else
            {
               _loc1_.h["isemaciatedbuild"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(ConditionalConverters.get_player().location == "swim");
            };
            if("isswimming" in StringMap.reserved)
            {
               _loc1_.setReserved("isswimming",_loc2_);
            }
            else
            {
               _loc1_.h["isswimming"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2698) > 0);
            };
            if("knowsalices" in StringMap.reserved)
            {
               _loc1_.setReserved("knowsalices",_loc2_);
            }
            else
            {
               _loc1_.h["knowsalices"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.monster.get_plural());
            };
            if("monster.plural" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.plural",_loc2_);
            }
            else
            {
               _loc1_.h["monster.plural"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.monster.canFly());
            };
            if("monster.canfly" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.canfly",_loc2_);
            }
            else
            {
               _loc1_.h["monster.canfly"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.monster.isFlying);
            };
            if("monster.isflying" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.isflying",_loc2_);
            }
            else
            {
               _loc1_.h["monster.isflying"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2356));
            };
            if("aikoaffection" in StringMap.reserved)
            {
               _loc1_.setReserved("aikoaffection",_loc2_);
            }
            else
            {
               _loc1_.h["aikoaffection"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.forest.aikoScene.get_aikoCorruption() >= 50);
            };
            if("aikocorrupt" in StringMap.reserved)
            {
               _loc1_.setReserved("aikocorrupt",_loc2_);
            }
            else
            {
               _loc1_.h["aikocorrupt"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2357) > 0 || FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2365) > 0);
            };
            if("aikohadsex" in StringMap.reserved)
            {
               _loc1_.setReserved("aikohadsex",_loc2_);
            }
            else
            {
               _loc1_.h["aikohadsex"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.mothCave.doloresScene.doloresComforted());
            };
            if("dolorescomforted" in StringMap.reserved)
            {
               _loc1_.setReserved("dolorescomforted",_loc2_);
            }
            else
            {
               _loc1_.h["dolorescomforted"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),523));
            };
            if("emberaffection" in StringMap.reserved)
            {
               _loc1_.setReserved("emberaffection",_loc2_);
            }
            else
            {
               _loc1_.h["emberaffection"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),531) > 0);
            };
            if("emberroundface" in StringMap.reserved)
            {
               _loc1_.setReserved("emberroundface",_loc2_);
            }
            else
            {
               _loc1_.h["emberroundface"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.emberScene.littleEmber());
            };
            if("littleember" in StringMap.reserved)
            {
               _loc1_.setReserved("littleember",_loc2_);
            }
            else
            {
               _loc1_.h["littleember"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.emberScene.emberChildren());
            };
            if("emberkids" in StringMap.reserved)
            {
               _loc1_.setReserved("emberkids",_loc2_);
            }
            else
            {
               _loc1_.h["emberkids"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),2638) == 0);
            };
            if("helspawnvirgin" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawnvirgin",_loc2_);
            }
            else
            {
               _loc1_.h["helspawnvirgin"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.helSpawnScene.helspawnChaste());
            };
            if("helspawnchaste" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawnchaste",_loc2_);
            }
            else
            {
               _loc1_.h["helspawnchaste"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),970) == 1);
            };
            if("helspawnincest" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawnincest",_loc2_);
            }
            else
            {
               _loc1_.h["helspawnincest"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),957));
            };
            if("helspawnpersonality" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawnpersonality",_loc2_);
            }
            else
            {
               _loc1_.h["helspawnpersonality"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),682) <= 0);
            };
            if("hollidom" in StringMap.reserved)
            {
               _loc1_.setReserved("hollidom",_loc2_);
            }
            else
            {
               _loc1_.h["hollidom"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),1108) > 0);
            };
            if("hollifed" in StringMap.reserved)
            {
               _loc1_.setReserved("hollifed",_loc2_);
            }
            else
            {
               _loc1_.h["hollifed"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.isabellaFollowerScene.isabellaAccent());
            };
            if("isabellaaccent" in StringMap.reserved)
            {
               _loc1_.setReserved("isabellaaccent",_loc2_);
            }
            else
            {
               _loc1_.h["isabellaaccent"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),439) < 1);
            };
            if("izmaherm" in StringMap.reserved)
            {
               _loc1_.setReserved("izmaherm",_loc2_);
            }
            else
            {
               _loc1_.h["izmaherm"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),655));
            };
            if("latexynicetf" in StringMap.reserved)
            {
               _loc1_.setReserved("latexynicetf",_loc2_);
            }
            else
            {
               _loc1_.h["latexynicetf"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.latexGirl.gooObedience());
            };
            if("latexyobedience" in StringMap.reserved)
            {
               _loc1_.setReserved("latexyobedience",_loc2_);
            }
            else
            {
               _loc1_.h["latexyobedience"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.latexGirl.gooHappiness());
            };
            if("latexyhappiness" in StringMap.reserved)
            {
               _loc1_.setReserved("latexyhappiness",_loc2_);
            }
            else
            {
               _loc1_.h["latexyhappiness"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),756));
            };
            if("kidaxp" in StringMap.reserved)
            {
               _loc1_.setReserved("kidaxp",_loc2_);
            }
            else
            {
               _loc1_.h["kidaxp"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),985) > 0);
            };
            if("rubihascock" in StringMap.reserved)
            {
               _loc1_.setReserved("rubihascock",_loc2_);
            }
            else
            {
               _loc1_.h["rubihascock"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(KGAMECLASS.kGAMECLASS.shouldraScene.ghostLoli());
            };
            if("ghostloli" in StringMap.reserved)
            {
               _loc1_.setReserved("ghostloli",_loc2_);
            }
            else
            {
               _loc1_.h["ghostloli"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromB(KGAMECLASS.kGAMECLASS.sylviaScene.get_sylviaGetDom());
            };
            if("sylviadom" in StringMap.reserved)
            {
               _loc1_.setReserved("sylviadom",_loc2_);
            }
            else
            {
               _loc1_.h["sylviadom"] = _loc2_;
            }
            _loc2_ = function():Either
            {
               return OneOf_Impl_.fromA(FlagDict_Impl_.arrayReadInt(ConditionalConverters.get_flags(),1296) > 0);
            };
            if("bakerytalkedroot" in StringMap.reserved)
            {
               _loc1_.setReserved("bakerytalkedroot",_loc2_);
            }
            else
            {
               _loc1_.h["bakerytalkedroot"] = _loc2_;
            }
            §§pop().CONVERTERS = _loc1_;
         }
         if(!DoubleArgLookups.init__)
         {
            DoubleArgLookups.init__ = true;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().multiCockDescriptLight();
            };
            if("all" in StringMap.reserved)
            {
               _loc1_.setReserved("all",_loc2_);
            }
            else
            {
               _loc1_.h["all"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().sMultiCockDesc();
            };
            if("each" in StringMap.reserved)
            {
               _loc1_.setReserved("each",_loc2_);
            }
            else
            {
               _loc1_.h["each"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().oMultiCockDesc();
            };
            if("one" in StringMap.reserved)
            {
               _loc1_.setReserved("one",_loc2_);
            }
            else
            {
               _loc1_.h["one"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("largest" in StringMap.reserved)
            {
               _loc1_.setReserved("largest",_loc2_);
            }
            else
            {
               _loc1_.h["largest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("biggest" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest",_loc2_);
            }
            else
            {
               _loc1_.h["biggest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().biggestCockIndex2());
            };
            if("biggest2" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest2",_loc2_);
            }
            else
            {
               _loc1_.h["biggest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().biggestCockIndex3());
            };
            if("biggest3" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest3",_loc2_);
            }
            else
            {
               _loc1_.h["biggest3"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().smallestCockIndex());
            };
            if("smallest" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest",_loc2_);
            }
            else
            {
               _loc1_.h["smallest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().smallestCockIndex2());
            };
            if("smallest2" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest2",_loc2_);
            }
            else
            {
               _loc1_.h["smallest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().longestCock());
            };
            if("longest" in StringMap.reserved)
            {
               _loc1_.setReserved("longest",_loc2_);
            }
            else
            {
               _loc1_.h["longest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescript(DoubleArgLookups.get_player().shortestCockIndex());
            };
            if("shortest" in StringMap.reserved)
            {
               _loc1_.setReserved("shortest",_loc2_);
            }
            else
            {
               _loc1_.h["shortest"] = _loc2_;
            }
            §§pop().cockLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("biggest" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest",_loc2_);
            }
            else
            {
               _loc1_.h["biggest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().biggestCockIndex2());
            };
            if("biggest2" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest2",_loc2_);
            }
            else
            {
               _loc1_.h["biggest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().biggestCockIndex3());
            };
            if("biggest3" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest3",_loc2_);
            }
            else
            {
               _loc1_.h["biggest3"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("largest" in StringMap.reserved)
            {
               _loc1_.setReserved("largest",_loc2_);
            }
            else
            {
               _loc1_.h["largest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().smallestCockIndex());
            };
            if("smallest" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest",_loc2_);
            }
            else
            {
               _loc1_.h["smallest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().smallestCockIndex2());
            };
            if("smallest2" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest2",_loc2_);
            }
            else
            {
               _loc1_.h["smallest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().longestCock());
            };
            if("longest" in StringMap.reserved)
            {
               _loc1_.setReserved("longest",_loc2_);
            }
            else
            {
               _loc1_.h["longest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockHead(DoubleArgLookups.get_player().shortestCockIndex());
            };
            if("shortest" in StringMap.reserved)
            {
               _loc1_.setReserved("shortest",_loc2_);
            }
            else
            {
               _loc1_.h["shortest"] = _loc2_;
            }
            §§pop().cockHeadLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("biggest" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest",_loc2_);
            }
            else
            {
               _loc1_.h["biggest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().biggestCockIndex2());
            };
            if("biggest2" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest2",_loc2_);
            }
            else
            {
               _loc1_.h["biggest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().biggestCockIndex3());
            };
            if("biggest3" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest3",_loc2_);
            }
            else
            {
               _loc1_.h["biggest3"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("largest" in StringMap.reserved)
            {
               _loc1_.setReserved("largest",_loc2_);
            }
            else
            {
               _loc1_.h["largest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().smallestCockIndex());
            };
            if("smallest" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest",_loc2_);
            }
            else
            {
               _loc1_.h["smallest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().smallestCockIndex2());
            };
            if("smallest2" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest2",_loc2_);
            }
            else
            {
               _loc1_.h["smallest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().longestCock());
            };
            if("longest" in StringMap.reserved)
            {
               _loc1_.setReserved("longest",_loc2_);
            }
            else
            {
               _loc1_.h["longest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(DoubleArgLookups.get_player().shortestCockIndex());
            };
            if("shortest" in StringMap.reserved)
            {
               _loc1_.setReserved("shortest",_loc2_);
            }
            else
            {
               _loc1_.h["shortest"] = _loc2_;
            }
            §§pop().shortCockLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("biggest" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest",_loc2_);
            }
            else
            {
               _loc1_.h["biggest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().biggestCockIndex2());
            };
            if("biggest2" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest2",_loc2_);
            }
            else
            {
               _loc1_.h["biggest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().biggestCockIndex3());
            };
            if("biggest3" in StringMap.reserved)
            {
               _loc1_.setReserved("biggest3",_loc2_);
            }
            else
            {
               _loc1_.h["biggest3"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().biggestCockIndex());
            };
            if("largest" in StringMap.reserved)
            {
               _loc1_.setReserved("largest",_loc2_);
            }
            else
            {
               _loc1_.h["largest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().smallestCockIndex());
            };
            if("smallest" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest",_loc2_);
            }
            else
            {
               _loc1_.h["smallest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().smallestCockIndex2());
            };
            if("smallest2" in StringMap.reserved)
            {
               _loc1_.setReserved("smallest2",_loc2_);
            }
            else
            {
               _loc1_.h["smallest2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().longestCock());
            };
            if("longest" in StringMap.reserved)
            {
               _loc1_.setReserved("longest",_loc2_);
            }
            else
            {
               _loc1_.h["longest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(DoubleArgLookups.get_player().shortestCockIndex());
            };
            if("shortest" in StringMap.reserved)
            {
               _loc1_.setReserved("shortest",_loc2_);
            }
            else
            {
               _loc1_.h["shortest"] = _loc2_;
            }
            §§pop().cockTypeLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            fun = function(param1:int):String
            {
               return DoubleArgLookups.get_player().cockDescriptShort(param1);
            };
            fun1 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun1,param1);
            };
            if("cockshort" in StringMap.reserved)
            {
               _loc1_.setReserved("cockshort",_loc2_);
            }
            else
            {
               _loc1_.h["cockshort"] = _loc2_;
            }
            fun2 = function(param1:Number):String
            {
               return DoubleArgLookups.fits(param1,function(param1:int):String
               {
                  return DoubleArgLookups.get_player().cockDescript(param1);
               });
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun2,param1);
            };
            if("cockfit" in StringMap.reserved)
            {
               _loc1_.setReserved("cockfit",_loc2_);
            }
            else
            {
               _loc1_.h["cockfit"] = _loc2_;
            }
            fun3 = function(param1:Number):String
            {
               return DoubleArgLookups.fits2(param1,function(param1:int):String
               {
                  return DoubleArgLookups.get_player().cockDescript(param1);
               });
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun3,param1);
            };
            if("cockfit2" in StringMap.reserved)
            {
               _loc1_.setReserved("cockfit2",_loc2_);
            }
            else
            {
               _loc1_.h["cockfit2"] = _loc2_;
            }
            fun4 = function(param1:Number):String
            {
               return DoubleArgLookups.fits(param1,function(param1:int):String
               {
                  return DoubleArgLookups.get_player().cockHead(param1);
               });
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun4,param1);
            };
            if("cockheadfit" in StringMap.reserved)
            {
               _loc1_.setReserved("cockheadfit",_loc2_);
            }
            else
            {
               _loc1_.h["cockheadfit"] = _loc2_;
            }
            fun5 = function(param1:Number):String
            {
               return DoubleArgLookups.fits2(param1,function(param1:int):String
               {
                  return DoubleArgLookups.get_player().cockHead(param1);
               });
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun5,param1);
            };
            if("cockheadfit2" in StringMap.reserved)
            {
               _loc1_.setReserved("cockheadfit2",_loc2_);
            }
            else
            {
               _loc1_.h["cockheadfit2"] = _loc2_;
            }
            fun6 = function(param1:int):String
            {
               return DoubleArgLookups.get_player().cockDescript(param1);
            };
            fun7 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun6,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun7,param1);
            };
            if("cock" in StringMap.reserved)
            {
               _loc1_.setReserved("cock",_loc2_);
            }
            else
            {
               _loc1_.h["cock"] = _loc2_;
            }
            fun8 = function(param1:int):String
            {
               return DoubleArgLookups.get_player().cockHead(param1);
            };
            fun9 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun8,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun9,param1);
            };
            if("cockhead" in StringMap.reserved)
            {
               _loc1_.setReserved("cockhead",_loc2_);
            }
            else
            {
               _loc1_.h["cockhead"] = _loc2_;
            }
            fun10 = function(param1:int):String
            {
               return DoubleArgLookups.get_player().cockMultiNoun(param1);
            };
            fun11 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun10,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun11,param1);
            };
            if("cocktype" in StringMap.reserved)
            {
               _loc1_.setReserved("cocktype",_loc2_);
            }
            else
            {
               _loc1_.h["cocktype"] = _loc2_;
            }
            fun12 = function(param1:int):String
            {
               return DoubleArgLookups.get_player().knotWord(param1);
            };
            fun13 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun12,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun13,param1);
            };
            if("knotword" in StringMap.reserved)
            {
               _loc1_.setReserved("knotword",_loc2_);
            }
            else
            {
               _loc1_.h["knotword"] = _loc2_;
            }
            fun14 = function(param1:int):String
            {
               return DoubleArgLookups.get_player().cockAnimalityAdj(param1);
            };
            fun15 = function(param1:Number):String
            {
               return DoubleArgLookups.inRange(fun14,param1);
            };
            _loc2_ = function(param1:Number):String
            {
               return DoubleArgLookups.hasCock(fun15,param1);
            };
            if("cockanimalityadj" in StringMap.reserved)
            {
               _loc1_.setReserved("cockanimalityadj",_loc2_);
            }
            else
            {
               _loc1_.h["cockanimalityadj"] = _loc2_;
            }
            §§pop().twoWordNumericTagsLookup = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("男人","女人");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("他","她");
            };
            if("ey" in StringMap.reserved)
            {
               _loc1_.setReserved("ey",_loc2_);
            }
            else
            {
               _loc1_.h["ey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("他","她");
            };
            if("em" in StringMap.reserved)
            {
               _loc1_.setReserved("em",_loc2_);
            }
            else
            {
               _loc1_.h["em"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("他的","她的");
            };
            if("eir" in StringMap.reserved)
            {
               _loc1_.setReserved("eir",_loc2_);
            }
            else
            {
               _loc1_.h["eir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("他","她");
            };
            if("eirs" in StringMap.reserved)
            {
               _loc1_.setReserved("eirs",_loc2_);
            }
            else
            {
               _loc1_.h["eirs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianMF("他自己","她自己");
            };
            if("emself" in StringMap.reserved)
            {
               _loc1_.setReserved("emself",_loc2_);
            }
            else
            {
               _loc1_.h["emself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianChestAdjective();
            };
            if("chestadj" in StringMap.reserved)
            {
               _loc1_.setReserved("chestadj",_loc2_);
            }
            else
            {
               _loc1_.h["chestadj"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_arian().arianChest();
            };
            if("chest" in StringMap.reserved)
            {
               _loc1_.setReserved("chest",_loc2_);
            }
            else
            {
               _loc1_.h["chest"] = _loc2_;
            }
            §§pop().arianLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("男人","女人");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("他","她");
            };
            if("ey" in StringMap.reserved)
            {
               _loc1_.setReserved("ey",_loc2_);
            }
            else
            {
               _loc1_.h["ey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("他","她");
            };
            if("em" in StringMap.reserved)
            {
               _loc1_.setReserved("em",_loc2_);
            }
            else
            {
               _loc1_.h["em"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("他的","她的");
            };
            if("eir" in StringMap.reserved)
            {
               _loc1_.setReserved("eir",_loc2_);
            }
            else
            {
               _loc1_.h["eir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("他的","她的");
            };
            if("eirs" in StringMap.reserved)
            {
               _loc1_.setReserved("eirs",_loc2_);
            }
            else
            {
               _loc1_.h["eirs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF("他自己","她自己");
            };
            if("emself" in StringMap.reserved)
            {
               _loc1_.setReserved("emself",_loc2_);
            }
            else
            {
               _loc1_.h["emself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_ember().emberMF(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "龙" : "龙人",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,531) == 0 ? "母龙" : "龙娘");
            };
            if("short" in StringMap.reserved)
            {
               _loc1_.setReserved("short",_loc2_);
            }
            else
            {
               _loc1_.h["short"] = _loc2_;
            }
            §§pop().emberLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("男人","女人");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("男孩","女孩");
            };
            if("boy" in StringMap.reserved)
            {
               _loc1_.setReserved("boy",_loc2_);
            }
            else
            {
               _loc1_.h["boy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("他","她");
            };
            if("ey" in StringMap.reserved)
            {
               _loc1_.setReserved("ey",_loc2_);
            }
            else
            {
               _loc1_.h["ey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("他","她");
            };
            if("em" in StringMap.reserved)
            {
               _loc1_.setReserved("em",_loc2_);
            }
            else
            {
               _loc1_.h["em"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("他的","她的");
            };
            if("eir" in StringMap.reserved)
            {
               _loc1_.setReserved("eir",_loc2_);
            }
            else
            {
               _loc1_.h["eir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("他的","她的");
            };
            if("eirs" in StringMap.reserved)
            {
               _loc1_.setReserved("eirs",_loc2_);
            }
            else
            {
               _loc1_.h["eirs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiMF("他自己","她自己");
            };
            if("emself" in StringMap.reserved)
            {
               _loc1_.setReserved("emself",_loc2_);
            }
            else
            {
               _loc1_.h["emself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiCock();
            };
            if("cock" in StringMap.reserved)
            {
               _loc1_.setReserved("cock",_loc2_);
            }
            else
            {
               _loc1_.h["cock"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_rubi().rubiBreasts();
            };
            if("breasts" in StringMap.reserved)
            {
               _loc1_.setReserved("breasts",_loc2_);
            }
            else
            {
               _loc1_.h["breasts"] = _loc2_;
            }
            §§pop().rubiLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("男人","女人");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("本诺瓦","本诺瓦特");
            };
            if("name" in StringMap.reserved)
            {
               _loc1_.setReserved("name",_loc2_);
            }
            else
            {
               _loc1_.h["name"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("他","她");
            };
            if("ey" in StringMap.reserved)
            {
               _loc1_.setReserved("ey",_loc2_);
            }
            else
            {
               _loc1_.h["ey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("他","她");
            };
            if("em" in StringMap.reserved)
            {
               _loc1_.setReserved("em",_loc2_);
            }
            else
            {
               _loc1_.h["em"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("他的","她的");
            };
            if("eir" in StringMap.reserved)
            {
               _loc1_.setReserved("eir",_loc2_);
            }
            else
            {
               _loc1_.h["eir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("他的","她的");
            };
            if("eirs" in StringMap.reserved)
            {
               _loc1_.setReserved("eirs",_loc2_);
            }
            else
            {
               _loc1_.h["eirs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_benoit().benoitMF("他","她");
            };
            if("emself" in StringMap.reserved)
            {
               _loc1_.setReserved("emself",_loc2_);
            }
            else
            {
               _loc1_.h["emself"] = _loc2_;
            }
            §§pop().benoitLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMbFg("男人","男孩","女人","女孩");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMF("他的","她的");
            };
            if("ey" in StringMap.reserved)
            {
               _loc1_.setReserved("ey",_loc2_);
            }
            else
            {
               _loc1_.h["ey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMF("他","她");
            };
            if("em" in StringMap.reserved)
            {
               _loc1_.setReserved("em",_loc2_);
            }
            else
            {
               _loc1_.h["em"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMF("他的","她的");
            };
            if("eir" in StringMap.reserved)
            {
               _loc1_.setReserved("eir",_loc2_);
            }
            else
            {
               _loc1_.h["eir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMF("他的","她的");
            };
            if("eirs" in StringMap.reserved)
            {
               _loc1_.setReserved("eirs",_loc2_);
            }
            else
            {
               _loc1_.h["eirs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return DoubleArgLookups.get_nieve().nieveMF("他","她");
            };
            if("emself" in StringMap.reserved)
            {
               _loc1_.setReserved("emself",_loc2_);
            }
            else
            {
               _loc1_.h["emself"] = _loc2_;
            }
            §§pop().nieveLookups = _loc1_;
            §§push(DoubleArgLookups);
            _loc1_ = new StringMap();
            _loc148_ = DoubleArgLookups.rubiLookups;
            if("rubi" in StringMap.reserved)
            {
               _loc1_.setReserved("rubi",_loc148_);
            }
            else
            {
               _loc1_.h["rubi"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.arianLookups;
            if("arian" in StringMap.reserved)
            {
               _loc1_.setReserved("arian",_loc148_);
            }
            else
            {
               _loc1_.h["arian"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.emberLookups;
            if("ember" in StringMap.reserved)
            {
               _loc1_.setReserved("ember",_loc148_);
            }
            else
            {
               _loc1_.h["ember"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.benoitLookups;
            if("benoit" in StringMap.reserved)
            {
               _loc1_.setReserved("benoit",_loc148_);
            }
            else
            {
               _loc1_.h["benoit"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.nieveLookups;
            if("nieve" in StringMap.reserved)
            {
               _loc1_.setReserved("nieve",_loc148_);
            }
            else
            {
               _loc1_.h["nieve"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.cockLookups;
            if("cock" in StringMap.reserved)
            {
               _loc1_.setReserved("cock",_loc148_);
            }
            else
            {
               _loc1_.h["cock"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.cockHeadLookups;
            if("cockhead" in StringMap.reserved)
            {
               _loc1_.setReserved("cockhead",_loc148_);
            }
            else
            {
               _loc1_.h["cockhead"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.shortCockLookups;
            if("cockshort" in StringMap.reserved)
            {
               _loc1_.setReserved("cockshort",_loc148_);
            }
            else
            {
               _loc1_.h["cockshort"] = _loc148_;
            }
            _loc148_ = DoubleArgLookups.cockTypeLookups;
            if("cocktype" in StringMap.reserved)
            {
               _loc1_.setReserved("cocktype",_loc148_);
            }
            else
            {
               _loc1_.h["cocktype"] = _loc148_;
            }
            §§pop().twoWordTagsLookup = _loc1_;
         }
         if(!classes.parser.Parser.init__)
         {
            classes.parser.Parser.init__ = true;
            classes.parser.Parser.makeQuotesPrettah_emDashes = new EReg("--","g");
            classes.parser.Parser.makeQuotesPrettah_closeDoubles = new EReg("([a-zA-Z<>.!,?()])\"([\r\n \t.!,?()]|$)","g");
            classes.parser.Parser.makeQuotesPrettah_openDoubles = new EReg("(^|[\r\n \t.!,?()])\"([a-zA-Z<>.!,?()])","g");
            classes.parser.Parser.makeQuotesPrettah_special = new EReg("(\\))\"(\\))","g");
            classes.parser.Parser.makeQuotesPrettah_apostrophes = new EReg("(\\w)\'(\\w)","g");
            classes.parser.Parser.preparseFormats_fmtTag = new EReg("(?<!\\\\)\\[([biu]{1,3}):","i");
            classes.parser.Parser.preparseFormats_sayTag = new EReg("(?<!\\\\)\\[(say):","i");
            classes.parser.Parser.convertConditionalArgumentFromStr_LA_OPERATOR = new EReg("^(>=?|<=?|!==?|={1,3}|\\|\\||&&|or|and|eq|neq?|[lg](te|t|e)|[-+*/%])","");
            classes.parser.Parser.handleFormatSwitch_formatExp = new EReg("^(say|[biu]{1,3})(?:start|end)$","i");
            classes.parser.Parser.handleIf_braceEReg = new EReg("(?<!\\\\){","");
            classes.parser.Parser.handleIf_openBracket = new EReg("<","g");
            classes.parser.Parser.handleTag_ifStatement = new EReg("^if\\b","i");
            classes.parser.Parser.handleTag_pg = new EReg("^pg([+-]*)$","");
            classes.parser.Parser.handleTag_doubleWordTag = new EReg("^[\\w.]+\\s[\\w.]+$","");
            classes.parser.Parser.handleTag_singleWordTag = new EReg("^[\\w.]+$","");
            classes.parser.Parser.handleTag_parserSwitch = new EReg("^(?:say|[biu]{1,3})(?:start|end)$","i");
            classes.parser.Parser.parse_repeatedSpaces = new EReg("[  ]{2,}","g");
            classes.parser.Parser.sillyType = Utils.rand(4);
         }
         if(!SingleArgLookups.init__)
         {
            SingleArgLookups.init__ = true;
            §§push(SingleArgLookups);
            _loc1_ = new StringMap();
            _loc2_ = function():String
            {
               return "[Agility]";
            };
            if("agility" in StringMap.reserved)
            {
               _loc1_.setReserved("agility",_loc2_);
            }
            else
            {
               _loc1_.h["agility"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().ageDesc();
            };
            if("age" in StringMap.reserved)
            {
               _loc1_.setReserved("age",_loc2_);
            }
            else
            {
               _loc1_.h["age"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().allBreastsDescript();
            };
            if("allbreasts" in StringMap.reserved)
            {
               _loc1_.setReserved("allbreasts",_loc2_);
            }
            else
            {
               _loc1_.h["allbreasts"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().allBreastsDescript();
            };
            if("alltits" in StringMap.reserved)
            {
               _loc1_.setReserved("alltits",_loc2_);
            }
            else
            {
               _loc1_.h["alltits"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_armorName());
            };
            if("armor" in StringMap.reserved)
            {
               _loc1_.setReserved("armor",_loc2_);
            }
            else
            {
               _loc1_.h["armor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_armorName());
            };
            if("armorname" in StringMap.reserved)
            {
               _loc1_.setReserved("armorname",_loc2_);
            }
            else
            {
               _loc1_.h["armorname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().arms.phrase();
            };
            if("arms" in StringMap.reserved)
            {
               _loc1_.setReserved("arms",_loc2_);
            }
            else
            {
               _loc1_.h["arms"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().arms.adj();
            };
            if("armadj" in StringMap.reserved)
            {
               _loc1_.setReserved("armadj",_loc2_);
            }
            else
            {
               _loc1_.h["armadj"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().buttDescript();
            };
            if("ass" in StringMap.reserved)
            {
               _loc1_.setReserved("ass",_loc2_);
            }
            else
            {
               _loc1_.h["ass"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().assholeDescript();
            };
            if("asshole" in StringMap.reserved)
            {
               _loc1_.setReserved("asshole",_loc2_);
            }
            else
            {
               _loc1_.h["asshole"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().assholeOrPussy();
            };
            if("assholeorpussy" in StringMap.reserved)
            {
               _loc1_.setReserved("assholeorpussy",_loc2_);
            }
            else
            {
               _loc1_.h["assholeorpussy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().ballsDescriptLight(true,true);
            };
            if("aballs" in StringMap.reserved)
            {
               _loc1_.setReserved("aballs",_loc2_);
            }
            else
            {
               _loc1_.h["aballs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().ballsDescript(true,true);
            };
            if("aballsfull" in StringMap.reserved)
            {
               _loc1_.setReserved("aballsfull",_loc2_);
            }
            else
            {
               _loc1_.h["aballsfull"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().ballsDescriptLight();
            };
            if("balls" in StringMap.reserved)
            {
               _loc1_.setReserved("balls",_loc2_);
            }
            else
            {
               _loc1_.h["balls"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().sackDescript();
            };
            if("ballsack" in StringMap.reserved)
            {
               _loc1_.setReserved("ballsack",_loc2_);
            }
            else
            {
               _loc1_.h["ballsack"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().ballsDescript();
            };
            if("ballsfull" in StringMap.reserved)
            {
               _loc1_.setReserved("ballsfull",_loc2_);
            }
            else
            {
               _loc1_.h["ballsfull"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.num2Text(SingleArgLookups.get_player().balls);
            };
            if("ballcount" in StringMap.reserved)
            {
               _loc1_.setReserved("ballcount",_loc2_);
            }
            else
            {
               _loc1_.h["ballcount"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.player.mf("男爵","女爵");
            };
            if("baron" in StringMap.reserved)
            {
               _loc1_.setReserved("baron",_loc2_);
            }
            else
            {
               _loc1_.h["baron"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.camp.bedDesc();
            };
            if("bed" in StringMap.reserved)
            {
               _loc1_.setReserved("bed",_loc2_);
            }
            else
            {
               _loc1_.h["bed"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().bodyType();
            };
            if("bodytype" in StringMap.reserved)
            {
               _loc1_.setReserved("bodytype",_loc2_);
            }
            else
            {
               _loc1_.h["bodytype"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("男朋友","女朋友");
            };
            if("boyfriend" in StringMap.reserved)
            {
               _loc1_.setReserved("boyfriend",_loc2_);
            }
            else
            {
               _loc1_.h["boyfriend"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "乳房";
            };
            if("breast" in StringMap.reserved)
            {
               _loc1_.setReserved("breast",_loc2_);
            }
            else
            {
               _loc1_.h["breast"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastDescript(0);
            };
            if("breasts" in StringMap.reserved)
            {
               _loc1_.setReserved("breasts",_loc2_);
            }
            else
            {
               _loc1_.h["breasts"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastDescript(-1);
            };
            if("lastbreasts" in StringMap.reserved)
            {
               _loc1_.setReserved("lastbreasts",_loc2_);
            }
            else
            {
               _loc1_.h["lastbreasts"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().buttDescript();
            };
            if("butt" in StringMap.reserved)
            {
               _loc1_.setReserved("butt",_loc2_);
            }
            else
            {
               _loc1_.h["butt"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().assholeDescript();
            };
            if("butthole" in StringMap.reserved)
            {
               _loc1_.setReserved("butthole",_loc2_);
            }
            else
            {
               _loc1_.h["butthole"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.camp.homeDesc();
            };
            if("cabin" in StringMap.reserved)
            {
               _loc1_.setReserved("cabin",_loc2_);
            }
            else
            {
               _loc1_.h["cabin"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Std.string(KGAMECLASS.kGAMECLASS.camp.getCampPopulation());
            };
            if("camppop" in StringMap.reserved)
            {
               _loc1_.setReserved("camppop",_loc2_);
            }
            else
            {
               _loc1_.h["camppop"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().chestDesc();
            };
            if("chest" in StringMap.reserved)
            {
               _loc1_.setReserved("chest",_loc2_);
            }
            else
            {
               _loc1_.h["chest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().clawsDescript(false);
            };
            if("claw" in StringMap.reserved)
            {
               _loc1_.setReserved("claw",_loc2_);
            }
            else
            {
               _loc1_.h["claw"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().clawsDescript();
            };
            if("claws" in StringMap.reserved)
            {
               _loc1_.setReserved("claws",_loc2_);
            }
            else
            {
               _loc1_.h["claws"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().clitDescript();
            };
            if("clit" in StringMap.reserved)
            {
               _loc1_.setReserved("clit",_loc2_);
            }
            else
            {
               _loc1_.h["clit"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockDescript(0);
            };
            if("cock" in StringMap.reserved)
            {
               _loc1_.setReserved("cock",_loc2_);
            }
            else
            {
               _loc1_.h["cock"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockDescriptShort(0);
            };
            if("cockshort" in StringMap.reserved)
            {
               _loc1_.setReserved("cockshort",_loc2_);
            }
            else
            {
               _loc1_.h["cockshort"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockClit(0);
            };
            if("cockclit" in StringMap.reserved)
            {
               _loc1_.setReserved("cockclit",_loc2_);
            }
            else
            {
               _loc1_.h["cockclit"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockMultiNoun(0);
            };
            if("cocktype" in StringMap.reserved)
            {
               _loc1_.setReserved("cocktype",_loc2_);
            }
            else
            {
               _loc1_.h["cocktype"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockHead(0);
            };
            if("cockhead" in StringMap.reserved)
            {
               _loc1_.setReserved("cockhead",_loc2_);
            }
            else
            {
               _loc1_.h["cockhead"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().multiCockDescriptLight();
            };
            if("cocks" in StringMap.reserved)
            {
               _loc1_.setReserved("cocks",_loc2_);
            }
            else
            {
               _loc1_.h["cocks"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().hasCock())
               {
                  return SingleArgLookups.get_player().cockDescript(0);
               }
               return SingleArgLookups.get_player().vaginaDescript();
            };
            if("cockorvag" in StringMap.reserved)
            {
               _loc1_.setReserved("cockorvag",_loc2_);
            }
            else
            {
               _loc1_.h["cockorvag"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockAnimalityAdj();
            };
            if("cockanimalityadj" in StringMap.reserved)
            {
               _loc1_.setReserved("cockanimalityadj",_loc2_);
            }
            else
            {
               _loc1_.h["cockanimalityadj"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().vaginaDescript();
            };
            if("cunt" in StringMap.reserved)
            {
               _loc1_.setReserved("cunt",_loc2_);
            }
            else
            {
               _loc1_.h["cunt"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("爸爸","妈妈");
            };
            if("dad" in StringMap.reserved)
            {
               _loc1_.setReserved("dad",_loc2_);
            }
            else
            {
               _loc1_.h["dad"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("爹地","妈咪");
            };
            if("daddy" in StringMap.reserved)
            {
               _loc1_.setReserved("daddy",_loc2_);
            }
            else
            {
               _loc1_.h["daddy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(KGAMECLASS.kGAMECLASS.time.hours < 12)
               {
                  return "早上";
               }
               if(KGAMECLASS.kGAMECLASS.time.hours < 19)
               {
                  return "白天";
               }
               return "晚上";
            };
            if("day" in StringMap.reserved)
            {
               _loc1_.setReserved("day",_loc2_);
            }
            else
            {
               _loc1_.h["day"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().cockDescript(0);
            };
            if("dick" in StringMap.reserved)
            {
               _loc1_.setReserved("dick",_loc2_);
            }
            else
            {
               _loc1_.h["dick"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().sMultiCockDesc();
            };
            if("eachcock" in StringMap.reserved)
            {
               _loc1_.setReserved("eachcock",_loc2_);
            }
            else
            {
               _loc1_.h["eachcock"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().earDescript(false);
            };
            if("ear" in StringMap.reserved)
            {
               _loc1_.setReserved("ear",_loc2_);
            }
            else
            {
               _loc1_.h["ear"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().earDescript();
            };
            if("ears" in StringMap.reserved)
            {
               _loc1_.setReserved("ears",_loc2_);
            }
            else
            {
               _loc1_.h["ears"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "[闪避]";
            };
            if("evade" in StringMap.reserved)
            {
               _loc1_.setReserved("evade",_loc2_);
            }
            else
            {
               _loc1_.h["evade"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().extraEyesDescript();
            };
            if("extraeyes" in StringMap.reserved)
            {
               _loc1_.setReserved("extraeyes",_loc2_);
            }
            else
            {
               _loc1_.h["extraeyes"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().extraEyesDescriptShort();
            };
            if("extraeyesshort" in StringMap.reserved)
            {
               _loc1_.setReserved("extraeyesshort",_loc2_);
            }
            else
            {
               _loc1_.h["extraeyesshort"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().eyesDescript();
            };
            if("eyes" in StringMap.reserved)
            {
               _loc1_.setReserved("eyes",_loc2_);
            }
            else
            {
               _loc1_.h["eyes"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Std.string(SingleArgLookups.get_player().eyes.count);
            };
            if("eyecount" in StringMap.reserved)
            {
               _loc1_.setReserved("eyecount",_loc2_);
            }
            else
            {
               _loc1_.h["eyecount"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().faceDescript();
            };
            if("face" in StringMap.reserved)
            {
               _loc1_.setReserved("face",_loc2_);
            }
            else
            {
               _loc1_.h["face"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().faceDesc();
            };
            if("facelong" in StringMap.reserved)
            {
               _loc1_.setReserved("facelong",_loc2_);
            }
            else
            {
               _loc1_.h["facelong"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("father","mother");
            };
            if("father" in StringMap.reserved)
            {
               _loc1_.setReserved("father",_loc2_);
            }
            else
            {
               _loc1_.h["father"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().feet();
            };
            if("feet" in StringMap.reserved)
            {
               _loc1_.setReserved("feet",_loc2_);
            }
            else
            {
               _loc1_.h["feet"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().foot();
            };
            if("foot" in StringMap.reserved)
            {
               _loc1_.setReserved("foot",_loc2_);
            }
            else
            {
               _loc1_.h["foot"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().allChestDesc();
            };
            if("fullchest" in StringMap.reserved)
            {
               _loc1_.setReserved("fullchest",_loc2_);
            }
            else
            {
               _loc1_.h["fullchest"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().skin.furColor;
            };
            if("furcolor" in StringMap.reserved)
            {
               _loc1_.setReserved("furcolor",_loc2_);
            }
            else
            {
               _loc1_.h["furcolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("神","女神");
            };
            if("god" in StringMap.reserved)
            {
               _loc1_.setReserved("god",_loc2_);
            }
            else
            {
               _loc1_.h["god"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hairDescript();
            };
            if("hair" in StringMap.reserved)
            {
               _loc1_.setReserved("hair",_loc2_);
            }
            else
            {
               _loc1_.h["hair"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().hair.color);
            };
            if("haircolor" in StringMap.reserved)
            {
               _loc1_.setReserved("haircolor",_loc2_);
            }
            else
            {
               _loc1_.h["haircolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hairShort();
            };
            if("hairshort" in StringMap.reserved)
            {
               _loc1_.setReserved("hairshort",_loc2_);
            }
            else
            {
               _loc1_.h["hairshort"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hairOrFur();
            };
            if("hairorfur" in StringMap.reserved)
            {
               _loc1_.setReserved("hairorfur",_loc2_);
            }
            else
            {
               _loc1_.h["hairorfur"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_hairOrFurColors());
            };
            if("hairorfurcolors" in StringMap.reserved)
            {
               _loc1_.setReserved("hairorfurcolors",_loc2_);
            }
            else
            {
               _loc1_.h["hairorfurcolors"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hairOrFurColor();
            };
            if("hairorfurcolor" in StringMap.reserved)
            {
               _loc1_.setReserved("hairorfurcolor",_loc2_);
            }
            else
            {
               _loc1_.h["hairorfurcolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().handsDescriptShort(false);
            };
            if("hand" in StringMap.reserved)
            {
               _loc1_.setReserved("hand",_loc2_);
            }
            else
            {
               _loc1_.h["hand"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().handsDescriptShort(true);
            };
            if("hands" in StringMap.reserved)
            {
               _loc1_.setReserved("hands",_loc2_);
            }
            else
            {
               _loc1_.h["hands"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().handsDescript(false);
            };
            if("handdesc" in StringMap.reserved)
            {
               _loc1_.setReserved("handdesc",_loc2_);
            }
            else
            {
               _loc1_.h["handdesc"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().handsDescript(true);
            };
            if("handsdesc" in StringMap.reserved)
            {
               _loc1_.setReserved("handsdesc",_loc2_);
            }
            else
            {
               _loc1_.h["handsdesc"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他","她");
            };
            if("he" in StringMap.reserved)
            {
               _loc1_.setReserved("he",_loc2_);
            }
            else
            {
               _loc1_.h["he"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.player2.mf("他","她");
            };
            if("he2" in StringMap.reserved)
            {
               _loc1_.setReserved("he2",_loc2_);
            }
            else
            {
               _loc1_.h["he2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他的","她的");
            };
            if("hers" in StringMap.reserved)
            {
               _loc1_.setReserved("hers",_loc2_);
            }
            else
            {
               _loc1_.h["hers"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他","她");
            };
            if("him" in StringMap.reserved)
            {
               _loc1_.setReserved("him",_loc2_);
            }
            else
            {
               _loc1_.h["him"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.player2.mf("他","她");
            };
            if("him2" in StringMap.reserved)
            {
               _loc1_.setReserved("him2",_loc2_);
            }
            else
            {
               _loc1_.h["him2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他自己","她自己");
            };
            if("himself" in StringMap.reserved)
            {
               _loc1_.setReserved("himself",_loc2_);
            }
            else
            {
               _loc1_.h["himself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他自己","她自己");
            };
            if("herself" in StringMap.reserved)
            {
               _loc1_.setReserved("herself",_loc2_);
            }
            else
            {
               _loc1_.h["herself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hipDescript();
            };
            if("hips" in StringMap.reserved)
            {
               _loc1_.setReserved("hips",_loc2_);
            }
            else
            {
               _loc1_.h["hips"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("他的","她的");
            };
            if("his" in StringMap.reserved)
            {
               _loc1_.setReserved("his",_loc2_);
            }
            else
            {
               _loc1_.h["his"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.player2.mf("他的","她的");
            };
            if("his2" in StringMap.reserved)
            {
               _loc1_.setReserved("his2",_loc2_);
            }
            else
            {
               _loc1_.h["his2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("王子","公主");
            };
            if("prince" in StringMap.reserved)
            {
               _loc1_.setReserved("prince",_loc2_);
            }
            else
            {
               _loc1_.h["prince"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().hornDescript();
            };
            if("horns" in StringMap.reserved)
            {
               _loc1_.setReserved("horns",_loc2_);
            }
            else
            {
               _loc1_.h["horns"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Std.string(SingleArgLookups.get_player().get_gems());
            };
            if("gems" in StringMap.reserved)
            {
               _loc1_.setReserved("gems",_loc2_);
            }
            else
            {
               _loc1_.h["gems"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_inventoryName();
            };
            if("inv" in StringMap.reserved)
            {
               _loc1_.setReserved("inv",_loc2_);
            }
            else
            {
               _loc1_.h["inv"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_inventoryName();
            };
            if("inventory" in StringMap.reserved)
            {
               _loc1_.setReserved("inventory",_loc2_);
            }
            else
            {
               _loc1_.h["inventory"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_inventoryName();
            };
            if("pouch" in StringMap.reserved)
            {
               _loc1_.setReserved("pouch",_loc2_);
            }
            else
            {
               _loc1_.h["pouch"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_inventoryName();
            };
            if("pack" in StringMap.reserved)
            {
               _loc1_.setReserved("pack",_loc2_);
            }
            else
            {
               _loc1_.h["pack"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("国王","女王");
            };
            if("king" in StringMap.reserved)
            {
               _loc1_.setReserved("king",_loc2_);
            }
            else
            {
               _loc1_.h["king"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().knotWord(0);
            };
            if("knotword" in StringMap.reserved)
            {
               _loc1_.setReserved("knotword",_loc2_);
            }
            else
            {
               _loc1_.h["knotword"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().leg();
            };
            if("leg" in StringMap.reserved)
            {
               _loc1_.setReserved("leg",_loc2_);
            }
            else
            {
               _loc1_.h["leg"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.num2Text(SingleArgLookups.get_player().lowerBody.legCount);
            };
            if("legcounttext" in StringMap.reserved)
            {
               _loc1_.setReserved("legcounttext",_loc2_);
            }
            else
            {
               _loc1_.h["legcounttext"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().legs();
            };
            if("legs" in StringMap.reserved)
            {
               _loc1_.setReserved("legs",_loc2_);
            }
            else
            {
               _loc1_.h["legs"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().lowerBody.skin();
            };
            if("lowerbodyskin" in StringMap.reserved)
            {
               _loc1_.setReserved("lowerbodyskin",_loc2_);
            }
            else
            {
               _loc1_.h["lowerbodyskin"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_lowerGarmentName();
            };
            if("lowergarment" in StringMap.reserved)
            {
               _loc1_.setReserved("lowergarment",_loc2_);
            }
            else
            {
               _loc1_.h["lowergarment"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("领主","夫人");
            };
            if("lord" in StringMap.reserved)
            {
               _loc1_.setReserved("lord",_loc2_);
            }
            else
            {
               _loc1_.h["lord"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("先生","女士");
            };
            if("maam" in StringMap.reserved)
            {
               _loc1_.setReserved("maam",_loc2_);
            }
            else
            {
               _loc1_.h["maam"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("先生","女士");
            };
            if("ma\'am" in StringMap.reserved)
            {
               _loc1_.setReserved("ma\'am",_loc2_);
            }
            else
            {
               _loc1_.h["ma\'am"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("先生","女士");
            };
            if("madam" in StringMap.reserved)
            {
               _loc1_.setReserved("madam",_loc2_);
            }
            else
            {
               _loc1_.h["madam"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2721))
               {
                  case 0:
                     return "Black & White";
                  case 1:
                     return "Terrestrial Fire";
                  default:
                     return "错误：无效的魔法学派";
               }
            };
            if("magic" in StringMap.reserved)
            {
               _loc1_.setReserved("magic",_loc2_);
            }
            else
            {
               _loc1_.h["magic"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("男性","人");
            };
            if("malespersons" in StringMap.reserved)
            {
               _loc1_.setReserved("malespersons",_loc2_);
            }
            else
            {
               _loc1_.h["malespersons"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("男人","女人");
            };
            if("man" in StringMap.reserved)
            {
               _loc1_.setReserved("man",_loc2_);
            }
            else
            {
               _loc1_.h["man"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("男人们","女人们");
            };
            if("men" in StringMap.reserved)
            {
               _loc1_.setReserved("men",_loc2_);
            }
            else
            {
               _loc1_.h["men"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().isChild() || SingleArgLookups.get_player().isTeen())
               {
                  return SingleArgLookups.get_player().mf("男孩","女孩");
               }
               return SingleArgLookups.get_player().mf("男人","女人");
            };
            if("manboy" in StringMap.reserved)
            {
               _loc1_.setReserved("manboy",_loc2_);
            }
            else
            {
               _loc1_.h["manboy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().isChild() || SingleArgLookups.get_player().isTeen())
               {
                  return SingleArgLookups.get_player().mf("男孩们","女孩们");
               }
               return SingleArgLookups.get_player().mf("男人们","女人们");
            };
            if("menboys" in StringMap.reserved)
            {
               _loc1_.setReserved("menboys",_loc2_);
            }
            else
            {
               _loc1_.h["menboys"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().maleFemaleHerm();
            };
            if("malefemaleherm" in StringMap.reserved)
            {
               _loc1_.setReserved("malefemaleherm",_loc2_);
            }
            else
            {
               _loc1_.h["malefemaleherm"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("主人","女主人");
            };
            if("master" in StringMap.reserved)
            {
               _loc1_.setReserved("master",_loc2_);
            }
            else
            {
               _loc1_.h["master"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("阳刚","阴柔");
            };
            if("masculine" in StringMap.reserved)
            {
               _loc1_.setReserved("masculine",_loc2_);
            }
            else
            {
               _loc1_.h["masculine"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "人鱼" + (SingleArgLookups.get_player().isGenderless() ? "" : SingleArgLookups.get_player().mf("男","女"));
            };
            if("merfolk" in StringMap.reserved)
            {
               _loc1_.setReserved("merfolk",_loc2_);
            }
            else
            {
               _loc1_.h["merfolk"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "人鱼" + (SingleArgLookups.get_player().isGenderless() ? "" : SingleArgLookups.get_player().mf("男","女"));
            };
            if("merfolks" in StringMap.reserved)
            {
               _loc1_.setReserved("merfolks",_loc2_);
            }
            else
            {
               _loc1_.h["merfolks"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "[误导]";
            };
            if("misdirection" in StringMap.reserved)
            {
               _loc1_.setReserved("misdirection",_loc2_);
            }
            else
            {
               _loc1_.h["misdirection"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("先生","小姐");
            };
            if("mister" in StringMap.reserved)
            {
               _loc1_.setReserved("mister",_loc2_);
            }
            else
            {
               _loc1_.h["mister"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().multiCockDescriptLight();
            };
            if("multicock" in StringMap.reserved)
            {
               _loc1_.setReserved("multicock",_loc2_);
            }
            else
            {
               _loc1_.h["multicock"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().multiCockDescriptLight();
            };
            if("multicockdescriptlight" in StringMap.reserved)
            {
               _loc1_.setReserved("multicockdescriptlight",_loc2_);
            }
            else
            {
               _loc1_.h["multicockdescriptlight"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_short();
            };
            if("name" in StringMap.reserved)
            {
               _loc1_.setReserved("name",_loc2_);
            }
            else
            {
               _loc1_.h["name"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().neckDescript();
            };
            if("neck" in StringMap.reserved)
            {
               _loc1_.setReserved("neck",_loc2_);
            }
            else
            {
               _loc1_.h["neck"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().neck.color;
            };
            if("neckcolor" in StringMap.reserved)
            {
               _loc1_.setReserved("neckcolor",_loc2_);
            }
            else
            {
               _loc1_.h["neckcolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().nippleDescript(0);
            };
            if("nipple" in StringMap.reserved)
            {
               _loc1_.setReserved("nipple",_loc2_);
            }
            else
            {
               _loc1_.h["nipple"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().nippleDescript(0) + "";
            };
            if("nipples" in StringMap.reserved)
            {
               _loc1_.setReserved("nipples",_loc2_);
            }
            else
            {
               _loc1_.h["nipples"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().nippleDescript(-1);
            };
            if("lastnipple" in StringMap.reserved)
            {
               _loc1_.setReserved("lastnipple",_loc2_);
            }
            else
            {
               _loc1_.h["lastnipple"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().nippleDescript(-1) + "";
            };
            if("lastnipples" in StringMap.reserved)
            {
               _loc1_.setReserved("lastnipples",_loc2_);
            }
            else
            {
               _loc1_.h["lastnipples"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().sMultiCockDesc();
            };
            if("onecock" in StringMap.reserved)
            {
               _loc1_.setReserved("onecock",_loc2_);
            }
            else
            {
               _loc1_.h["onecock"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("父亲的","母亲的");
            };
            if("paternal" in StringMap.reserved)
            {
               _loc1_.setReserved("paternal",_loc2_);
            }
            else
            {
               _loc1_.h["paternal"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_short();
            };
            if("player" in StringMap.reserved)
            {
               _loc1_.setReserved("player",_loc2_);
            }
            else
            {
               _loc1_.h["player"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().vaginaDescript();
            };
            if("pussy" in StringMap.reserved)
            {
               _loc1_.setReserved("pussy",_loc2_);
            }
            else
            {
               _loc1_.h["pussy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_race());
            };
            if("race" in StringMap.reserved)
            {
               _loc1_.setReserved("race",_loc2_);
            }
            else
            {
               _loc1_.h["race"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().rearBodyDescript();
            };
            if("rearbody" in StringMap.reserved)
            {
               _loc1_.setReserved("rearbody",_loc2_);
            }
            else
            {
               _loc1_.h["rearbody"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().rearBody.color;
            };
            if("rearbodycolor" in StringMap.reserved)
            {
               _loc1_.setReserved("rearbodycolor",_loc2_);
            }
            else
            {
               _loc1_.h["rearbodycolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().sackDescript();
            };
            if("sack" in StringMap.reserved)
            {
               _loc1_.setReserved("sack",_loc2_);
            }
            else
            {
               _loc1_.h["sack"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().sheathDescript();
            };
            if("sheath" in StringMap.reserved)
            {
               _loc1_.setReserved("sheath",_loc2_);
            }
            else
            {
               _loc1_.h["sheath"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_shieldName());
            };
            if("shield" in StringMap.reserved)
            {
               _loc1_.setReserved("shield",_loc2_);
            }
            else
            {
               _loc1_.h["shield"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("先生","女士");
            };
            if("sir" in StringMap.reserved)
            {
               _loc1_.setReserved("sir",_loc2_);
            }
            else
            {
               _loc1_.h["sir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().skin.description(false,false);
            };
            if("skin" in StringMap.reserved)
            {
               _loc1_.setReserved("skin",_loc2_);
            }
            else
            {
               _loc1_.h["skin"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().skin.description(true,false);
            };
            if("skin.noadj" in StringMap.reserved)
            {
               _loc1_.setReserved("skin.noadj",_loc2_);
            }
            else
            {
               _loc1_.h["skin.noadj"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().hasScales())
               {
                  return "是";
               }
               return "是";
            };
            if("skinis" in StringMap.reserved)
            {
               _loc1_.setReserved("skinis",_loc2_);
            }
            else
            {
               _loc1_.h["skinis"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().skin.desc);
            };
            if("skindesc" in StringMap.reserved)
            {
               _loc1_.setReserved("skindesc",_loc2_);
            }
            else
            {
               _loc1_.h["skindesc"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().skinFurScales();
            };
            if("skinfurscales" in StringMap.reserved)
            {
               _loc1_.setReserved("skinfurscales",_loc2_);
            }
            else
            {
               _loc1_.h["skinfurscales"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().skin.description(true,true);
            };
            if("skinshort" in StringMap.reserved)
            {
               _loc1_.setReserved("skinshort",_loc2_);
            }
            else
            {
               _loc1_.h["skinshort"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().skin.tone);
            };
            if("skintone" in StringMap.reserved)
            {
               _loc1_.setReserved("skintone",_loc2_);
            }
            else
            {
               _loc1_.h["skintone"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("儿子","女儿");
            };
            if("son" in StringMap.reserved)
            {
               _loc1_.setReserved("son",_loc2_);
            }
            else
            {
               _loc1_.h["son"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(KGAMECLASS.kGAMECLASS.time.hours < 21)
               {
                  return "阳";
               }
               return "月";
            };
            if("sun" in StringMap.reserved)
            {
               _loc1_.setReserved("sun",_loc2_);
            }
            else
            {
               _loc1_.h["sun"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Measurements.footInchOrMetre(SingleArgLookups.get_player().get_tallness());
            };
            if("tallness" in StringMap.reserved)
            {
               _loc1_.setReserved("tallness",_loc2_);
            }
            else
            {
               _loc1_.h["tallness"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(KGAMECLASS.kGAMECLASS.time.hours < 12)
               {
                  return "早晨";
               }
               if(KGAMECLASS.kGAMECLASS.time.hours < 17)
               {
                  return "下午";
               }
               if(KGAMECLASS.kGAMECLASS.time.hours < 21)
               {
                  return "傍晚";
               }
               return "深夜";
            };
            if("timeofday" in StringMap.reserved)
            {
               _loc1_.setReserved("timeofday",_loc2_);
            }
            else
            {
               _loc1_.h["timeofday"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastDescript(0);
            };
            if("tits" in StringMap.reserved)
            {
               _loc1_.setReserved("tits",_loc2_);
            }
            else
            {
               _loc1_.h["tits"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastDescript(-1);
            };
            if("lasttits" in StringMap.reserved)
            {
               _loc1_.setReserved("lasttits",_loc2_);
            }
            else
            {
               _loc1_.h["lasttits"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastCup(0);
            };
            if("breastcup" in StringMap.reserved)
            {
               _loc1_.setReserved("breastcup",_loc2_);
            }
            else
            {
               _loc1_.h["breastcup"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().breastCup(-1);
            };
            if("lastbreastcup" in StringMap.reserved)
            {
               _loc1_.setReserved("lastbreastcup",_loc2_);
            }
            else
            {
               _loc1_.h["lastbreastcup"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().tongueDescript();
            };
            if("tongue" in StringMap.reserved)
            {
               _loc1_.setReserved("tongue",_loc2_);
            }
            else
            {
               _loc1_.h["tongue"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().underBody.skinFurScales();
            };
            if("underbody.skinfurscales" in StringMap.reserved)
            {
               _loc1_.setReserved("underbody.skinfurscales",_loc2_);
            }
            else
            {
               _loc1_.h["underbody.skinfurscales"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().underBody.skin.tone;
            };
            if("underbody.skintone" in StringMap.reserved)
            {
               _loc1_.setReserved("underbody.skintone",_loc2_);
            }
            else
            {
               _loc1_.h["underbody.skintone"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().underBody.skin.furColor;
            };
            if("underbody.furcolor" in StringMap.reserved)
            {
               _loc1_.setReserved("underbody.furcolor",_loc2_);
            }
            else
            {
               _loc1_.h["underbody.furcolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().get_upperGarmentName();
            };
            if("uppergarment" in StringMap.reserved)
            {
               _loc1_.setReserved("uppergarment",_loc2_);
            }
            else
            {
               _loc1_.h["uppergarment"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().vaginaDescript();
            };
            if("vag" in StringMap.reserved)
            {
               _loc1_.setReserved("vag",_loc2_);
            }
            else
            {
               _loc1_.h["vag"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().vaginaDescript();
            };
            if("vagina" in StringMap.reserved)
            {
               _loc1_.setReserved("vagina",_loc2_);
            }
            else
            {
               _loc1_.h["vagina"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().hasVagina())
               {
                  return SingleArgLookups.get_player().vaginaDescript();
               }
               return SingleArgLookups.get_player().assholeDescript();
            };
            if("vagorass" in StringMap.reserved)
            {
               _loc1_.setReserved("vagorass",_loc2_);
            }
            else
            {
               _loc1_.h["vagorass"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weaponName());
            };
            if("weapon" in StringMap.reserved)
            {
               _loc1_.setReserved("weapon",_loc2_);
            }
            else
            {
               _loc1_.h["weapon"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weaponName());
            };
            if("weaponname" in StringMap.reserved)
            {
               _loc1_.setReserved("weaponname",_loc2_);
            }
            else
            {
               _loc1_.h["weaponname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weapon().get_singularName());
            };
            if("weaponsingular" in StringMap.reserved)
            {
               _loc1_.setReserved("weaponsingular",_loc2_);
            }
            else
            {
               _loc1_.h["weaponsingular"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weapon().get_attackNoun());
            };
            if("attacknoun" in StringMap.reserved)
            {
               _loc1_.setReserved("attacknoun",_loc2_);
            }
            else
            {
               _loc1_.h["attacknoun"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weapon().get_attackVerb());
            };
            if("attackverb" in StringMap.reserved)
            {
               _loc1_.setReserved("attackverb",_loc2_);
            }
            else
            {
               _loc1_.h["attackverb"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(SingleArgLookups.get_player().get_weapon().get_attackVerbed());
            };
            if("attackverbed" in StringMap.reserved)
            {
               _loc1_.setReserved("attackverbed",_loc2_);
            }
            else
            {
               _loc1_.h["attackverbed"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(int(SingleArgLookups.get_player().cocks.length) == 1)
               {
                  return "肉棒";
               }
               return "肉棒们";
            };
            if("cockplural" in StringMap.reserved)
            {
               _loc1_.setReserved("cockplural",_loc2_);
            }
            else
            {
               _loc1_.h["cockplural"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(int(SingleArgLookups.get_player().cocks.length) == 1)
               {
                  return "鸡巴";
               }
               return "鸡巴们";
            };
            if("dickplural" in StringMap.reserved)
            {
               _loc1_.setReserved("dickplural",_loc2_);
            }
            else
            {
               _loc1_.h["dickplural"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(int(SingleArgLookups.get_player().cocks.length) == 1)
               {
                  return "头";
               }
               return "头";
            };
            if("headplural" in StringMap.reserved)
            {
               _loc1_.setReserved("headplural",_loc2_);
            }
            else
            {
               _loc1_.h["headplural"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(int(SingleArgLookups.get_player().cocks.length) == 1)
               {
                  return "卵蛋";
               }
               return "卵蛋";
            };
            if("prickplural" in StringMap.reserved)
            {
               _loc1_.setReserved("prickplural",_loc2_);
            }
            else
            {
               _loc1_.h["prickplural"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("男孩","女孩");
            };
            if("boy" in StringMap.reserved)
            {
               _loc1_.setReserved("boy",_loc2_);
            }
            else
            {
               _loc1_.h["boy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().mf("伙计","妹子");
            };
            if("guy" in StringMap.reserved)
            {
               _loc1_.setReserved("guy",_loc2_);
            }
            else
            {
               _loc1_.h["guy"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wetnessDescript(0);
            };
            if("wet" in StringMap.reserved)
            {
               _loc1_.setReserved("wet",_loc2_);
            }
            else
            {
               _loc1_.h["wet"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wingsDescript();
            };
            if("wings" in StringMap.reserved)
            {
               _loc1_.setReserved("wings",_loc2_);
            }
            else
            {
               _loc1_.h["wings"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wings.color;
            };
            if("wingcolor" in StringMap.reserved)
            {
               _loc1_.setReserved("wingcolor",_loc2_);
            }
            else
            {
               _loc1_.h["wingcolor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wings.color2;
            };
            if("wingcolor2" in StringMap.reserved)
            {
               _loc1_.setReserved("wingcolor2",_loc2_);
            }
            else
            {
               _loc1_.h["wingcolor2"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wings.getColorDesc(1);
            };
            if("wingcolordesc" in StringMap.reserved)
            {
               _loc1_.setReserved("wingcolordesc",_loc2_);
            }
            else
            {
               _loc1_.h["wingcolordesc"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().wings.getColorDesc(2);
            };
            if("wingcolor2desc" in StringMap.reserved)
            {
               _loc1_.setReserved("wingcolor2desc",_loc2_);
            }
            else
            {
               _loc1_.h["wingcolor2desc"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(SingleArgLookups.get_player().get_gender())
               {
                  case 0:
                     return "anus is";
                  case 1:
                     if(SingleArgLookups.get_player().cockTotal() > 1)
                     {
                        return "cocks are";
                     }
                     return "cock is";
                     break;
                  case 2:
                     return "小穴是";
                  case 3:
                     return "肉棒和小穴是";
                  default:
                     return "";
               }
            };
            if("genitalis" in StringMap.reserved)
            {
               _loc1_.setReserved("genitalis",_loc2_);
            }
            else
            {
               _loc1_.h["genitalis"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(SingleArgLookups.get_player().get_gender())
               {
                  case 0:
                     return SingleArgLookups.get_player().assholeDescript();
                  case 1:
                     if(SingleArgLookups.get_player().cockTotal() > 1)
                     {
                        return SingleArgLookups.get_player().multiCockDescriptLight();
                     }
                     return SingleArgLookups.get_player().cockDescript();
                     break;
                  case 2:
                     return SingleArgLookups.get_player().vaginaDescript();
                  case 3:
                     return SingleArgLookups.get_player().cockDescript() + "和" + SingleArgLookups.get_player().vaginaDescript();
                  default:
                     return "";
               }
            };
            if("genitalsdetail" in StringMap.reserved)
            {
               _loc1_.setReserved("genitalsdetail",_loc2_);
            }
            else
            {
               _loc1_.h["genitalsdetail"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(SingleArgLookups.get_player().get_gender())
               {
                  case 0:
                     return "后门";
                  case 1:
                     if(SingleArgLookups.get_player().cockTotal() > 1)
                     {
                        return "肉棒";
                     }
                     return "肉棒";
                     break;
                  case 2:
                     return "小穴";
                  case 3:
                     return "肉棒和小穴";
                  default:
                     return "";
               }
            };
            if("genitals" in StringMap.reserved)
            {
               _loc1_.setReserved("genitals",_loc2_);
            }
            else
            {
               _loc1_.h["genitals"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(SingleArgLookups.get_player().get_gender())
               {
                  case 0:
                     return "it";
                  case 1:
                     if(SingleArgLookups.get_player().cockTotal() > 1)
                     {
                        return "they";
                     }
                     return "it";
                     break;
                  case 2:
                     return "it";
                  case 3:
                     return "they";
                  default:
                     return "";
               }
            };
            if("genitaley" in StringMap.reserved)
            {
               _loc1_.setReserved("genitaley",_loc2_);
            }
            else
            {
               _loc1_.h["genitaley"] = _loc2_;
            }
            _loc2_ = function():String
            {
               switch(SingleArgLookups.get_player().get_gender())
               {
                  case 0:
                     return "it";
                  case 1:
                     if(SingleArgLookups.get_player().cockTotal() > 1)
                     {
                        return "them";
                     }
                     return "it";
                     break;
                  case 2:
                     return "it";
                  case 3:
                     return "them";
                  default:
                     return "";
               }
            };
            if("genitalem" in StringMap.reserved)
            {
               _loc1_.setReserved("genitalem",_loc2_);
            }
            else
            {
               _loc1_.h["genitalem"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().cockTotal() > 1)
               {
                  return "cocks have";
               }
               return "cock has";
            };
            if("cockhas" in StringMap.reserved)
            {
               _loc1_.setReserved("cockhas",_loc2_);
            }
            else
            {
               _loc1_.h["cockhas"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().cockTotal() > 1)
               {
                  return "它们";
               }
               return "它";
            };
            if("cockey" in StringMap.reserved)
            {
               _loc1_.setReserved("cockey",_loc2_);
            }
            else
            {
               _loc1_.h["cockey"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().cockTotal() > 1)
               {
                  return "它们";
               }
               return "它";
            };
            if("cockem" in StringMap.reserved)
            {
               _loc1_.setReserved("cockem",_loc2_);
            }
            else
            {
               _loc1_.h["cockem"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().cockTotal() > 1)
               {
                  return "它们的";
               }
               return "它的";
            };
            if("cockeir" in StringMap.reserved)
            {
               _loc1_.setReserved("cockeir",_loc2_);
            }
            else
            {
               _loc1_.h["cockeir"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().tailDescript();
            };
            if("tail" in StringMap.reserved)
            {
               _loc1_.setReserved("tail",_loc2_);
            }
            else
            {
               _loc1_.h["tail"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().oneTailDescript();
            };
            if("onetail" in StringMap.reserved)
            {
               _loc1_.setReserved("onetail",_loc2_);
            }
            else
            {
               _loc1_.h["onetail"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.num2Text(SingleArgLookups.get_player().tail.venom);
            };
            if("tailnumber" in StringMap.reserved)
            {
               _loc1_.setReserved("tailnumber",_loc2_);
            }
            else
            {
               _loc1_.h["tailnumber"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().hasTailInsteadOfLegs())
               {
                  return "滑行";
               }
               if(SingleArgLookups.get_player().isCentaur())
               {
                  return "小跑";
               }
               if(SingleArgLookups.get_player().isGoo())
               {
                  return "滑动";
               }
               if(SingleArgLookups.get_player().isDrider())
               {
                  return "疾走";
               }
               if(SingleArgLookups.get_player().isHoppy())
               {
                  return "跳跃";
               }
               return "行走";
            };
            if("walk" in StringMap.reserved)
            {
               _loc1_.setReserved("walk",_loc2_);
            }
            else
            {
               _loc1_.h["walk"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(SingleArgLookups.get_player().hasTailInsteadOfLegs())
               {
                  return "滑行";
               }
               if(SingleArgLookups.get_player().isCentaur())
               {
                  return "小跑";
               }
               if(SingleArgLookups.get_player().isGoo())
               {
                  return "滑动";
               }
               if(SingleArgLookups.get_player().isDrider())
               {
                  return "疾走";
               }
               if(SingleArgLookups.get_player().isHoppy())
               {
                  return "跳跃";
               }
               return "行走";
            };
            if("walking" in StringMap.reserved)
            {
               _loc1_.setReserved("walking",_loc2_);
            }
            else
            {
               _loc1_.h["walking"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return SingleArgLookups.get_player().location;
            };
            if("areaname" in StringMap.reserved)
            {
               _loc1_.setReserved("areaname",_loc2_);
            }
            else
            {
               _loc1_.h["areaname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.get_short());
            };
            if("monster.short" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.short",_loc2_);
            }
            else
            {
               _loc1_.h["monster.short"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return "";
            };
            if("monster.a" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.a",_loc2_);
            }
            else
            {
               _loc1_.h["monster.a"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.get_short());
            };
            if("themonster" in StringMap.reserved)
            {
               _loc1_.setReserved("themonster",_loc2_);
            }
            else
            {
               _loc1_.h["themonster"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.monster.get_possessive();
            };
            if("monster.possessive" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.possessive",_loc2_);
            }
            else
            {
               _loc1_.h["monster.possessive"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.get_short()) + KGAMECLASS.kGAMECLASS.monster.get_possessive();
            };
            if("themonster\'s" in StringMap.reserved)
            {
               _loc1_.setReserved("themonster\'s",_loc2_);
            }
            else
            {
               _loc1_.h["themonster\'s"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.monster.pronoun1;
            };
            if("monster.he" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.he",_loc2_);
            }
            else
            {
               _loc1_.h["monster.he"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.monster.pronoun2;
            };
            if("monster.him" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.him",_loc2_);
            }
            else
            {
               _loc1_.h["monster.him"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.monster.pronoun3;
            };
            if("monster.his" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.his",_loc2_);
            }
            else
            {
               _loc1_.h["monster.his"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.monster.pronoun2 + (KGAMECLASS.kGAMECLASS.monster.get_plural() ? "selves" : "self");
            };
            if("monster.himself" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.himself",_loc2_);
            }
            else
            {
               _loc1_.h["monster.himself"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.hair.color);
            };
            if("monster.hair" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.hair",_loc2_);
            }
            else
            {
               _loc1_.h["monster.hair"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.skin.tone);
            };
            if("monster.skin" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.skin",_loc2_);
            }
            else
            {
               _loc1_.h["monster.skin"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(KGAMECLASS.kGAMECLASS.monster.get_plural())
               {
                  return "";
               }
               return "";
            };
            if("monster.s" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.s",_loc2_);
            }
            else
            {
               _loc1_.h["monster.s"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(KGAMECLASS.kGAMECLASS.monster.get_plural())
               {
                  return "是";
               }
               return "是";
            };
            if("monster.is" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.is",_loc2_);
            }
            else
            {
               _loc1_.h["monster.is"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.get_weaponName());
            };
            if("monster.weapon" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.weapon",_loc2_);
            }
            else
            {
               _loc1_.h["monster.weapon"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return Utils.cnName(KGAMECLASS.kGAMECLASS.monster.get_armorName());
            };
            if("monster.armor" in StringMap.reserved)
            {
               _loc1_.setReserved("monster.armor",_loc2_);
            }
            else
            {
               _loc1_.h["monster.armor"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return FlagDict_Impl_.arrayReadString(KFLAGS.flags,825);
            };
            if("garg" in StringMap.reserved)
            {
               _loc1_.setReserved("garg",_loc2_);
            }
            else
            {
               _loc1_.h["garg"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return FlagDict_Impl_.arrayReadString(KFLAGS.flags,2718);
            };
            if("akky" in StringMap.reserved)
            {
               _loc1_.setReserved("akky",_loc2_);
            }
            else
            {
               _loc1_.h["akky"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.latexGirl.gooName();
            };
            if("latexyname" in StringMap.reserved)
            {
               _loc1_.setReserved("latexyname",_loc2_);
            }
            else
            {
               _loc1_.h["latexyname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.milkWaifu.get_milkName();
            };
            if("bathgirlname" in StringMap.reserved)
            {
               _loc1_.setReserved("bathgirlname",_loc2_);
            }
            else
            {
               _loc1_.h["bathgirlname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2710) == 1)
               {
                  return "勒诺";
               }
               return "她的马";
            };
            if("dullhorse" in StringMap.reserved)
            {
               _loc1_.setReserved("dullhorse",_loc2_);
            }
            else
            {
               _loc1_.h["dullhorse"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.aliceScene.eyeColor;
            };
            if("aliceeyes" in StringMap.reserved)
            {
               _loc1_.setReserved("aliceeyes",_loc2_);
            }
            else
            {
               _loc1_.h["aliceeyes"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.aliceScene.panties;
            };
            if("alicepanties" in StringMap.reserved)
            {
               _loc1_.setReserved("alicepanties",_loc2_);
            }
            else
            {
               _loc1_.h["alicepanties"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.aliceScene.pantiesLong;
            };
            if("alicepantieslong" in StringMap.reserved)
            {
               _loc1_.setReserved("alicepantieslong",_loc2_);
            }
            else
            {
               _loc1_.h["alicepantieslong"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.aliceScene.get_hairColor();
            };
            if("alicehair" in StringMap.reserved)
            {
               _loc1_.setReserved("alicehair",_loc2_);
            }
            else
            {
               _loc1_.h["alicehair"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.aliceScene.get_skinTone();
            };
            if("aliceskin" in StringMap.reserved)
            {
               _loc1_.setReserved("aliceskin",_loc2_);
            }
            else
            {
               _loc1_.h["aliceskin"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.bazaar.telly.get_tellyScope();
            };
            if("tellyvisual" in StringMap.reserved)
            {
               _loc1_.setReserved("tellyvisual",_loc2_);
            }
            else
            {
               _loc1_.h["tellyvisual"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.helSpawnScene.get_helspawnName();
            };
            if("helspawn" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawn",_loc2_);
            }
            else
            {
               _loc1_.h["helspawn"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.helSpawnScene.helspawnEyes();
            };
            if("helspawneyes" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawneyes",_loc2_);
            }
            else
            {
               _loc1_.h["helspawneyes"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.helSpawnScene.helspawnScales();
            };
            if("helspawnscales" in StringMap.reserved)
            {
               _loc1_.setReserved("helspawnscales",_loc2_);
            }
            else
            {
               _loc1_.h["helspawnscales"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.ceraphFollowerScene.ceraphBus();
            };
            if("ceraphbus" in StringMap.reserved)
            {
               _loc1_.setReserved("ceraphbus",_loc2_);
            }
            else
            {
               _loc1_.h["ceraphbus"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.bazaar.demonFistFighterScene.saveContent.playerName;
            };
            if("ringname" in StringMap.reserved)
            {
               _loc1_.setReserved("ringname",_loc2_);
            }
            else
            {
               _loc1_.h["ringname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               return KGAMECLASS.kGAMECLASS.camp.saveContent.dummyName;
            };
            if("dummyname" in StringMap.reserved)
            {
               _loc1_.setReserved("dummyname",_loc2_);
            }
            else
            {
               _loc1_.h["dummyname"] = _loc2_;
            }
            _loc2_ = function():String
            {
               var _loc1_:Nieve = KGAMECLASS.kGAMECLASS.xmas.nieve;
               var _loc2_:Boolean = KGAMECLASS.kGAMECLASS.get_silly() && Utils.randomChance(1);
               var _loc3_:Boolean = KGAMECLASS.kGAMECLASS.get_silly() && Utils.randomChance(1);
               return _loc1_.nieveMbFg("雪人",_loc2_ ? "雪他" : "雪人","雪女",_loc3_ ? "雪萝莉" : "雪女孩");
            };
            if("snowman" in StringMap.reserved)
            {
               _loc1_.setReserved("snowman",_loc2_);
            }
            else
            {
               _loc1_.h["snowman"] = _loc2_;
            }
            _loc2_ = function():String
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2370) > 0)
               {
                  return "八";
               }
               return "七";
            };
            if("aikotailnumber" in StringMap.reserved)
            {
               _loc1_.setReserved("aikotailnumber",_loc2_);
            }
            else
            {
               _loc1_.h["aikotailnumber"] = _loc2_;
            }
            _loc2_ = function():String
            {
               var _loc1_:String = FlagDict_Impl_.arrayReadString(KFLAGS.flags,52);
               if(_loc1_ == null || _loc1_ == "")
               {
                  return "破布";
               }
               return _loc1_;
            };
            if("amilyclothing" in StringMap.reserved)
            {
               _loc1_.setReserved("amilyclothing",_loc2_);
            }
            else
            {
               _loc1_.h["amilyclothing"] = _loc2_;
            }
            §§pop().CONVERTERS = _loc1_;
         }
         if(!SelfSaver.init__)
         {
            SelfSaver.init__ = true;
            SelfSaver.saveList = new StringMap();
         }
         if(!PregnancyProgression.init__)
         {
            PregnancyProgression.init__ = true;
            PregnancyProgression.vaginalPregnancyScenes = new IntMap();
            PregnancyProgression.analPregnancyScenes = new IntMap();
         }
         if(!FnHelpers.init__)
         {
            FnHelpers.init__ = true;
            FnHelpers.FN = new FnHelpers();
         }
         if(!Encounters.init__)
         {
            Encounters.init__ = true;
            Encounters.fn = FnHelpers.FN;
         }
         if(!DungeonAbstractContent.init__)
         {
            DungeonAbstractContent.init__ = true;
            DungeonAbstractContent.WALKABLE = DungeonRoomConst_Impl_.WALKABLE;
            DungeonAbstractContent.CONNECTABLE = DungeonRoomConst_Impl_.CONNECTABLE;
         }
         if(!FarmCorruption.init__)
         {
            FarmCorruption.init__ = true;
            §§push(FarmCorruption);
            _loc1_ = new StringMap();
            _loc3_ = [1129,1131,1130,1132];
            if("whitney" in StringMap.reserved)
            {
               _loc1_.setReserved("whitney",_loc3_);
            }
            else
            {
               _loc1_.h["whitney"] = _loc3_;
            }
            _loc3_ = [1137,1139,1138,1140];
            if("amily" in StringMap.reserved)
            {
               _loc1_.setReserved("amily",_loc3_);
            }
            else
            {
               _loc1_.h["amily"] = _loc3_;
            }
            _loc3_ = [1141,1143,1142,1144];
            if("jojo" in StringMap.reserved)
            {
               _loc1_.setReserved("jojo",_loc3_);
            }
            else
            {
               _loc1_.h["jojo"] = _loc3_;
            }
            _loc3_ = [1145,1147,1146,1148];
            if("sophie" in StringMap.reserved)
            {
               _loc1_.setReserved("sophie",_loc3_);
            }
            else
            {
               _loc1_.h["sophie"] = _loc3_;
            }
            _loc3_ = [1149,1151,1150,1152];
            if("vapula" in StringMap.reserved)
            {
               _loc1_.setReserved("vapula",_loc3_);
            }
            else
            {
               _loc1_.h["vapula"] = _loc3_;
            }
            _loc3_ = [1153,1155,1154,1156];
            if("kelly" in StringMap.reserved)
            {
               _loc1_.setReserved("kelly",_loc3_);
            }
            else
            {
               _loc1_.h["kelly"] = _loc3_;
            }
            _loc3_ = [1157,1159,1158,1160];
            if("milky" in StringMap.reserved)
            {
               _loc1_.setReserved("milky",_loc3_);
            }
            else
            {
               _loc1_.h["milky"] = _loc3_;
            }
            §§pop().tattooFlagMap = _loc1_;
         }
         if(!AngeredPugilist.init__)
         {
            AngeredPugilist.init__ = true;
            AngeredPugilist.TYPE = StatusEffect.register("AngeredPugilist",AngeredPugilist);
         }
         if(!DazedDebuff.init__)
         {
            DazedDebuff.init__ = true;
            DazedDebuff.TYPE = StatusEffect.register("DazedDebuff",DazedDebuff);
         }
         if(!Immobilized.init__)
         {
            Immobilized.init__ = true;
            Immobilized.TYPE = StatusEffect.register("Immobilized",Immobilized);
         }
         if(!VineTangled.init__)
         {
            VineTangled.init__ = true;
            VineTangled.TYPE = StatusEffect.register("VineTangled",VineTangled);
         }
         if(!Eval.init__)
         {
            Eval.init__ = true;
            Eval.RX_FLOAT = new EReg("^[+\\-]?(\\d+(\\.\\d+)?|\\.\\d+)(e[+\\-]?\\d+)?$","");
            Eval.RX_INT = new EReg("^[+\\-]?(0x)?\\d+$","");
            Eval.LA_BLOCK_COMMENT = new EReg("^/\\*([^*/]|\\*[^/]|[^\\*]/)*\\*+/","");
            Eval.LA_FLOAT = new EReg("^[+\\-]?(\\d+(\\.\\d+)?|\\.\\d+)(e[+\\-]?\\d+)?","");
            Eval.LA_INT = new EReg("^[+\\-]?(0x)?\\d+","");
            Eval.LA_ID = new EReg("^[a-zA-Z_$][a-zA-Z_$0-9]*","");
            Eval.LA_OPERATOR = new EReg("^(>=?|<=?|!==?|={1,3}|\\|\\||&&|or|and|eq|neq?|[lg](te|t|e)|[-+*/%])","");
            §§push(Eval);
            _loc1_ = new StringMap();
            if("||" in StringMap.reserved)
            {
               _loc1_.setReserved("||",10);
            }
            else
            {
               _loc1_.h["||"] = 10;
            }
            if("or" in StringMap.reserved)
            {
               _loc1_.setReserved("or",10);
            }
            else
            {
               _loc1_.h["or"] = 10;
            }
            if("&&" in StringMap.reserved)
            {
               _loc1_.setReserved("&&",20);
            }
            else
            {
               _loc1_.h["&&"] = 20;
            }
            if("and" in StringMap.reserved)
            {
               _loc1_.setReserved("and",20);
            }
            else
            {
               _loc1_.h["and"] = 20;
            }
            if(">=" in StringMap.reserved)
            {
               _loc1_.setReserved(">=",30);
            }
            else
            {
               _loc1_.h[">="] = 30;
            }
            if(">" in StringMap.reserved)
            {
               _loc1_.setReserved(">",30);
            }
            else
            {
               _loc1_.h[">"] = 30;
            }
            if("<=" in StringMap.reserved)
            {
               _loc1_.setReserved("<=",30);
            }
            else
            {
               _loc1_.h["<="] = 30;
            }
            if("<" in StringMap.reserved)
            {
               _loc1_.setReserved("<",30);
            }
            else
            {
               _loc1_.h["<"] = 30;
            }
            if("!==" in StringMap.reserved)
            {
               _loc1_.setReserved("!==",30);
            }
            else
            {
               _loc1_.h["!=="] = 30;
            }
            if("!=" in StringMap.reserved)
            {
               _loc1_.setReserved("!=",30);
            }
            else
            {
               _loc1_.h["!="] = 30;
            }
            if("===" in StringMap.reserved)
            {
               _loc1_.setReserved("===",30);
            }
            else
            {
               _loc1_.h["==="] = 30;
            }
            if("==" in StringMap.reserved)
            {
               _loc1_.setReserved("==",30);
            }
            else
            {
               _loc1_.h["=="] = 30;
            }
            if("=" in StringMap.reserved)
            {
               _loc1_.setReserved("=",30);
            }
            else
            {
               _loc1_.h["="] = 30;
            }
            if("lt" in StringMap.reserved)
            {
               _loc1_.setReserved("lt",30);
            }
            else
            {
               _loc1_.h["lt"] = 30;
            }
            if("le" in StringMap.reserved)
            {
               _loc1_.setReserved("le",30);
            }
            else
            {
               _loc1_.h["le"] = 30;
            }
            if("lte" in StringMap.reserved)
            {
               _loc1_.setReserved("lte",30);
            }
            else
            {
               _loc1_.h["lte"] = 30;
            }
            if("gt" in StringMap.reserved)
            {
               _loc1_.setReserved("gt",30);
            }
            else
            {
               _loc1_.h["gt"] = 30;
            }
            if("ge" in StringMap.reserved)
            {
               _loc1_.setReserved("ge",30);
            }
            else
            {
               _loc1_.h["ge"] = 30;
            }
            if("gte" in StringMap.reserved)
            {
               _loc1_.setReserved("gte",30);
            }
            else
            {
               _loc1_.h["gte"] = 30;
            }
            if("neq" in StringMap.reserved)
            {
               _loc1_.setReserved("neq",30);
            }
            else
            {
               _loc1_.h["neq"] = 30;
            }
            if("ne" in StringMap.reserved)
            {
               _loc1_.setReserved("ne",30);
            }
            else
            {
               _loc1_.h["ne"] = 30;
            }
            if("eq" in StringMap.reserved)
            {
               _loc1_.setReserved("eq",30);
            }
            else
            {
               _loc1_.h["eq"] = 30;
            }
            if("+" in StringMap.reserved)
            {
               _loc1_.setReserved("+",40);
            }
            else
            {
               _loc1_.h["+"] = 40;
            }
            if("-" in StringMap.reserved)
            {
               _loc1_.setReserved("-",40);
            }
            else
            {
               _loc1_.h["-"] = 40;
            }
            if("*" in StringMap.reserved)
            {
               _loc1_.setReserved("*",50);
            }
            else
            {
               _loc1_.h["*"] = 50;
            }
            if("/" in StringMap.reserved)
            {
               _loc1_.setReserved("/",50);
            }
            else
            {
               _loc1_.h["/"] = 50;
            }
            if("%" in StringMap.reserved)
            {
               _loc1_.setReserved("%",50);
            }
            else
            {
               _loc1_.h["%"] = 50;
            }
            §§pop().OP_PRIORITIES = _loc1_;
         }
         if(!DragButton.init__)
         {
            DragButton.init__ = true;
            DragButton.buttonMap = new ObjectMap();
         }
         if(!MainView.init__)
         {
            MainView.init__ = true;
            MainView.buttonBackgrounds = [new Bitmap(new coc.view.ButtonBackground0(0,0)),new Bitmap(new coc.view.ButtonBackground1(0,0)),new Bitmap(new coc.view.ButtonBackground2(0,0)),new Bitmap(new coc.view.ButtonBackground3(0,0)),new Bitmap(new coc.view.ButtonBackground4(0,0)),new Bitmap(new coc.view.ButtonBackground5(0,0)),new Bitmap(new coc.view.ButtonBackground6(0,0)),new Bitmap(new coc.view.ButtonBackground7(0,0)),new Bitmap(new coc.view.ButtonBackground8(0,0)),new Bitmap(new coc.view.ButtonBackground9(0,0))];
            MainView.navButtons = {
               "north":new Bitmap(new coc.view.NorthButton(0,0)),
               "south":new Bitmap(new coc.view.SouthButton(0,0)),
               "east":new Bitmap(new coc.view.EastButton(0,0)),
               "west":new Bitmap(new coc.view.WestButton(0,0))
            };
            MainView.mediumButtons = [new Bitmap(new coc.view.MediumButton0(0,0)),new Bitmap(new coc.view.MediumButton1(0,0)),new Bitmap(new coc.view.MediumButton2(0,0))];
            MainView.BOTTOM_HGAP = (MainView.BOTTOM_W - 750) / 10;
            MainView.BOTTOM_Y = 800 - MainView.BOTTOM_H;
            MainView.MONSTER_H = 125;
         }
         if(!StatBar.init__)
         {
            StatBar.init__ = true;
            StatBar.DEFAULT_OPTIONS = StatBar.factoryReset();
         }
         if(!Stone.init__)
         {
            Stone.init__ = true;
            Stone.buttonBackgrounds = [new Bitmap(new coc.view.themeAssets.ButtonBackground0(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground1(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground2(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground3(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground4(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground5(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground6(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground7(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground8(0,0)),new Bitmap(new coc.view.themeAssets.ButtonBackground9(0,0))];
            Stone.navButtons = {
               "north":new Bitmap(new coc.view.themeAssets.NorthButton(0,0)),
               "south":new Bitmap(new coc.view.themeAssets.SouthButton(0,0)),
               "east":new Bitmap(new coc.view.themeAssets.EastButton(0,0)),
               "west":new Bitmap(new coc.view.themeAssets.WestButton(0,0))
            };
            Stone.mediumButtons = [new Bitmap(new coc.view.themeAssets.MediumButton0(0,0)),new Bitmap(new coc.view.themeAssets.MediumButton1(0,0)),new Bitmap(new coc.view.themeAssets.MediumButton2(0,0))];
         }
         if(!Theme.init__)
         {
            Theme.init__ = true;
            Theme._THEMES = new StringMap();
            var _temp_58:* = Theme;
            _loc149_ = new Bitmap(new Background1(0,0));
            _loc150_ = new Bitmap(new SidebarBg1(0,0));
            _loc151_ = new Bitmap(new SidebarEnemy(0,0));
            _loc152_ = new Bitmap(new MinimapBG(0,0));
            _loc153_ = new Bitmap(new coc.view.TooltipBg(0,0));
            _loc154_ = new Bitmap(new GameLogo(0,0));
            _loc155_ = new Bitmap(new DisclaimerBG(0,0));
            _loc156_ = new Bitmap(new Warning(0,0));
            _loc157_ = new Bitmap(new StatsBarBottom(0,0));
            _loc158_ = new Bitmap(new ArrowUp(0,0));
            _loc159_ = new Bitmap(new ArrowDown(0,0));
            _loc160_ = new Bitmap(new Background(0,0));
            _loc161_ = new Bitmap(new BackgroundPlayer(0,0));
            _loc162_ = new Bitmap(new TransitionIcon(0,0));
            _loc163_ = new Bitmap(new StairsUp(0,0));
            _loc164_ = new Bitmap(new StairsDown(0,0));
            _loc165_ = new Bitmap(new StairsUpDown(0,0));
            _loc166_ = new Bitmap(new Npc(0,0));
            _loc167_ = new Bitmap(new Trader(0,0));
            _loc168_ = new Bitmap(new Connect(0,0));
            _loc169_ = new Bitmap(new Connecth(0,0));
            _loc170_ = new Bitmap(new LockedDoor(0,0));
            _loc171_ = new Bitmap(new LockedDoorV(0,0));
            _temp_58.DEFAULT_THEME = new Theme("Default",{
               "textColors":{
                  "default":0,
                  "mainMenu":0,
                  "sideBar":0,
                  "button":0,
                  "tooltip":0,
                  "minimap":0
               },
               "stageColor":"0x000000",
               "barAlpha":0.4,
               "isDark":false,
               "mainBg":_loc149_,
               "sidebarBg":_loc150_,
               "monsterBg":_loc151_,
               "minimapBg":_loc152_,
               "tooltipBg":_loc153_,
               "textBgColor":"#FFFFFF",
               "textBgAlpha":0.4,
               "textBgImage":null,
               "textBgCombatImage":null,
               "CoCLogo":_loc154_,
               "disclaimerBg":_loc155_,
               "warningImage":_loc156_,
               "statbarBottomBg":_loc157_,
               "arrowUp":_loc158_,
               "arrowDown":_loc159_,
               "buttonBgs":MainView.buttonBackgrounds,
               "medButtons":MainView.mediumButtons,
               "navButtons":MainView.navButtons,
               "mmBackground":_loc160_,
               "mmBackgroundPlayer":_loc161_,
               "mmTransition":_loc162_,
               "mmUp":_loc163_,
               "mmDown":_loc164_,
               "mmUpDown":_loc165_,
               "mmNPC":_loc166_,
               "mmTrader":_loc167_,
               "mmConnect":_loc168_,
               "mmConnectH":_loc169_,
               "mmLocked":_loc170_,
               "mmLockedV":_loc171_,
               "mmExit":new Bitmap(new InitIcon(0,0)),
               "statbar":{
                  "default":{
                     "barColor":"#600000",
                     "fontColor":"#000000"
                  },
                  "HP:":{
                     "barColor":"#B17D5E",
                     "minbarColor":"#A86E52"
                  },
                  "Lust:":{"minbarColor":"#880101"}
               }
            });
            Theme.PARCHMENT = new Theme("Parchment",{"mainBg":new Bitmap(new Background2(0,0))},Theme.DEFAULT_THEME);
            Theme.MARBLE = new Theme("Marble",{
               "mainBg":new Bitmap(new Background3(0,0)),
               "sidebarBg":new Bitmap(new SidebarBg3(0,0)),
               "monsterBg":new Bitmap(new SidebarBg3(0,0))
            },Theme.DEFAULT_THEME);
            Theme.STONE = new Theme("Stone",{
               "textBgAlpha":1,
               "mainBg":new Bitmap(new MainBg(0,0)),
               "sidebarBg":new Bitmap(new SidebarBg(0,0)),
               "monsterBg":new Bitmap(new MonsterBg(0,0)),
               "minimapBg":new Bitmap(new MinimapBg(0,0)),
               "tooltipBg":new Bitmap(new coc.view.themeAssets.TooltipBg(0,0)),
               "textBgImage":new Bitmap(new TextBgImage(0,0)),
               "textBgCombatImage":new Bitmap(new TextBgCombatImage(0,0)),
               "disclaimerBg":new Bitmap(new DisclaimerBg(0,0)),
               "warningImage":new Bitmap(new WarningImage(0,0)),
               "statbarBottomBg":new Bitmap(new StatbarBottomBg(0,0)),
               "buttonBgs":Stone.buttonBackgrounds,
               "medButtons":Stone.mediumButtons,
               "navButtons":Stone.navButtons,
               "mmBackground":new Bitmap(new MmBackground(0,0)),
               "mmBackgroundPlayer":new Bitmap(new MmBackgroundPlayer(0,0)),
               "mmTransition":new Bitmap(new MmTransition(0,0)),
               "mmUp":new Bitmap(new MmUp(0,0)),
               "mmDown":new Bitmap(new MmDown(0,0)),
               "mmUpDown":new Bitmap(new MmUpDown(0,0)),
               "mmNPC":new Bitmap(new MmNPC(0,0)),
               "mmExit":new Bitmap(new MmExit(0,0)),
               "statbar":{
                  "default":{
                     "barColor":"#892106",
                     "fontColor":"#000000"
                  },
                  "HP:":{
                     "barColor":"#B17D5E",
                     "minbarColor":"#A86E52"
                  },
                  "Lust:":{"minbarColor":"#880101"}
               }
            },Theme.DEFAULT_THEME);
            var _temp_59:* = Theme;
            _loc149_ = new Bitmap(new Background4(0,0));
            _loc150_ = new Bitmap(new SidebarBg4(0,0));
            _temp_59.OBSIDIAN = new Theme("Obsidian",{
               "textColors":{
                  "default":"#C0C0C0",
                  "minimap":1
               },
               "statbar":{
                  "default":{
                     "barColor":"#600000",
                     "fontColor":"#C0C0C0"
                  },
                  "HP:":{
                     "barColor":"#b17d5e",
                     "minbarColor":"#a86e52"
                  },
                  "Lust:":{"minbarColor":"#880101"}
               },
               "textBgAlpha":0.1,
               "barAlpha":0.5,
               "isDark":true,
               "mainBg":_loc149_,
               "sidebarBg":_loc150_,
               "monsterBg":new Bitmap(new SidebarBg4(0,0))
            },Theme.DEFAULT_THEME);
            Theme.BLACK = new Theme("Black",{
               "barAlpha":1,
               "mainBg":null,
               "sidebarBg":null,
               "monsterBg":null
            },Theme.OBSIDIAN);
            Theme.current = Theme.DEFAULT_THEME;
         }
         if(!MobileUI.init__)
         {
            MobileUI.init__ = true;
            MobileUI.defaultTextFormat = new TextFormat("Noto Serif",20);
         }
         if(!StatsView.init__)
         {
            StatsView.init__ = true;
            §§push(StatsView);
            _loc172_ = new StatBarOptions(null,null,null,null,null,"力量：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc1_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc1_.setReserved("maxValue","max");
            }
            else
            {
               _loc1_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc1_.setReserved("value","value");
            }
            else
            {
               _loc1_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc1_.setReserved("isUp","isUp");
            }
            else
            {
               _loc1_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc1_.setReserved("isDown","isDown");
            }
            else
            {
               _loc1_.h["isDown"] = "isDown";
            }
            _loc173_ = new BarDefinition(_loc172_,_loc1_);
            _loc174_ = new StatBarOptions(null,null,null,null,null,"体质：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc148_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc148_.setReserved("maxValue","max");
            }
            else
            {
               _loc148_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc148_.setReserved("value","value");
            }
            else
            {
               _loc148_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc148_.setReserved("isUp","isUp");
            }
            else
            {
               _loc148_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc148_.setReserved("isDown","isDown");
            }
            else
            {
               _loc148_.h["isDown"] = "isDown";
            }
            _loc175_ = new BarDefinition(_loc174_,_loc148_);
            _loc176_ = new StatBarOptions(null,null,null,null,null,"速度：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc177_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc177_.setReserved("maxValue","max");
            }
            else
            {
               _loc177_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc177_.setReserved("value","value");
            }
            else
            {
               _loc177_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc177_.setReserved("isUp","isUp");
            }
            else
            {
               _loc177_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc177_.setReserved("isDown","isDown");
            }
            else
            {
               _loc177_.h["isDown"] = "isDown";
            }
            _loc178_ = new BarDefinition(_loc176_,_loc177_);
            _loc179_ = new StatBarOptions(null,null,null,null,null,"智力：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc180_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc180_.setReserved("maxValue","max");
            }
            else
            {
               _loc180_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc180_.setReserved("value","value");
            }
            else
            {
               _loc180_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc180_.setReserved("isUp","isUp");
            }
            else
            {
               _loc180_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc180_.setReserved("isDown","isDown");
            }
            else
            {
               _loc180_.h["isDown"] = "isDown";
            }
            _loc181_ = new BarDefinition(_loc179_,_loc180_);
            _loc182_ = new StatBarOptions(null,null,null,100,null,"性欲：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc183_ = new StringMap();
            if("value" in StringMap.reserved)
            {
               _loc183_.setReserved("value","value");
            }
            else
            {
               _loc183_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc183_.setReserved("isUp","isUp");
            }
            else
            {
               _loc183_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc183_.setReserved("isDown","isDown");
            }
            else
            {
               _loc183_.h["isDown"] = "isDown";
            }
            _loc184_ = new BarDefinition(_loc182_,_loc183_);
            _loc185_ = new StatBarOptions(null,null,null,100,null,"敏感度：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc186_ = new StringMap();
            if("value" in StringMap.reserved)
            {
               _loc186_.setReserved("value","value");
            }
            else
            {
               _loc186_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc186_.setReserved("isUp","isUp");
            }
            else
            {
               _loc186_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc186_.setReserved("isDown","isDown");
            }
            else
            {
               _loc186_.h["isDown"] = "isDown";
            }
            _loc187_ = new BarDefinition(_loc185_,_loc186_);
            _loc188_ = new StatBarOptions(null,null,null,100,null,"腐化：",null,null,null,null,null,null,null,null,null,null,null,null);
            _loc189_ = new StringMap();
            if("value" in StringMap.reserved)
            {
               _loc189_.setReserved("value","value");
            }
            else
            {
               _loc189_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc189_.setReserved("isUp","isUp");
            }
            else
            {
               _loc189_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc189_.setReserved("isDown","isDown");
            }
            else
            {
               _loc189_.h["isDown"] = "isDown";
            }
            _loc190_ = new BarDefinition(_loc188_,_loc189_);
            _loc191_ = new StatBarOptions(null,null,null,null,null,"生命值：",true,null,null,null,null,true,null,null,null,11631966,11038290,null);
            _loc192_ = new StringMap();
            if("minValue" in StringMap.reserved)
            {
               _loc192_.setReserved("minValue","min");
            }
            else
            {
               _loc192_.h["minValue"] = "min";
            }
            if("maxValue" in StringMap.reserved)
            {
               _loc192_.setReserved("maxValue","max");
            }
            else
            {
               _loc192_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc192_.setReserved("value","value");
            }
            else
            {
               _loc192_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc192_.setReserved("isUp","isUp");
            }
            else
            {
               _loc192_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc192_.setReserved("isDown","isDown");
            }
            else
            {
               _loc192_.h["isDown"] = "isDown";
            }
            _loc193_ = new BarDefinition(_loc191_,_loc192_);
            _loc194_ = new StatBarOptions(null,null,null,null,null,"欲望：",true,null,null,null,null,true,null,null,null,null,8913153,null);
            _loc195_ = new StringMap();
            if("minValue" in StringMap.reserved)
            {
               _loc195_.setReserved("minValue","min");
            }
            else
            {
               _loc195_.h["minValue"] = "min";
            }
            if("maxValue" in StringMap.reserved)
            {
               _loc195_.setReserved("maxValue","max");
            }
            else
            {
               _loc195_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc195_.setReserved("value","value");
            }
            else
            {
               _loc195_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc195_.setReserved("isUp","isUp");
            }
            else
            {
               _loc195_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc195_.setReserved("isDown","isDown");
            }
            else
            {
               _loc195_.h["isDown"] = "isDown";
            }
            _loc196_ = new BarDefinition(_loc194_,_loc195_);
            _loc197_ = new StatBarOptions(null,null,null,null,null,"疲劳：",true,null,null,null,null,null,null,null,null,null,null,null);
            _loc198_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc198_.setReserved("maxValue","max");
            }
            else
            {
               _loc198_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc198_.setReserved("value","value");
            }
            else
            {
               _loc198_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc198_.setReserved("isUp","isUp");
            }
            else
            {
               _loc198_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc198_.setReserved("isDown","isDown");
            }
            else
            {
               _loc198_.h["isDown"] = "isDown";
            }
            _loc199_ = new BarDefinition(_loc197_,_loc198_);
            _loc200_ = new StatBarOptions(null,null,null,null,null,"饱足：",true,null,null,null,null,null,null,null,null,null,null,null);
            _loc201_ = new StringMap();
            if("maxValue" in StringMap.reserved)
            {
               _loc201_.setReserved("maxValue","max");
            }
            else
            {
               _loc201_.h["maxValue"] = "max";
            }
            if("value" in StringMap.reserved)
            {
               _loc201_.setReserved("value","value");
            }
            else
            {
               _loc201_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc201_.setReserved("isUp","isUp");
            }
            else
            {
               _loc201_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc201_.setReserved("isDown","isDown");
            }
            else
            {
               _loc201_.h["isDown"] = "isDown";
            }
            _loc202_ = new BarDefinition(_loc200_,_loc201_);
            _loc203_ = new StatBarOptions(null,null,null,null,null,"等级：",null,null,null,null,false,null,null,null,null,null,null,null);
            _loc204_ = new StringMap();
            if("value" in StringMap.reserved)
            {
               _loc204_.setReserved("value","value");
            }
            else
            {
               _loc204_.h["value"] = "value";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc204_.setReserved("isUp","isUp");
            }
            else
            {
               _loc204_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc204_.setReserved("isDown","isDown");
            }
            else
            {
               _loc204_.h["isDown"] = "isDown";
            }
            _loc205_ = new BarDefinition(_loc203_,_loc204_);
            _loc206_ = new StatBarOptions(null,null,null,null,null,"经验：",true,null,null,null,null,null,null,null,null,null,null,null);
            _loc207_ = new StringMap();
            if("value" in StringMap.reserved)
            {
               _loc207_.setReserved("value","value");
            }
            else
            {
               _loc207_.h["value"] = "value";
            }
            if("maxValue" in StringMap.reserved)
            {
               _loc207_.setReserved("maxValue","max");
            }
            else
            {
               _loc207_.h["maxValue"] = "max";
            }
            if("valueText" in StringMap.reserved)
            {
               _loc207_.setReserved("valueText","valueText");
            }
            else
            {
               _loc207_.h["valueText"] = "valueText";
            }
            if("isUp" in StringMap.reserved)
            {
               _loc207_.setReserved("isUp","isUp");
            }
            else
            {
               _loc207_.h["isUp"] = "isUp";
            }
            if("isDown" in StringMap.reserved)
            {
               _loc207_.setReserved("isDown","isDown");
            }
            else
            {
               _loc207_.h["isDown"] = "isDown";
            }
            _loc208_ = new BarDefinition(_loc206_,_loc207_);
            _loc209_ = new StatBarOptions(null,null,null,null,null,"宝石：",null,null,null,null,false,null,null,null,null,null,null,null);
            _loc210_ = new StringMap();
            if("valueText" in StringMap.reserved)
            {
               _loc210_.setReserved("valueText","valueText");
            }
            else
            {
               _loc210_.h["valueText"] = "valueText";
            }
            §§pop().BAR_INFO = [_loc173_,_loc175_,_loc178_,_loc181_,_loc184_,_loc187_,_loc190_,_loc193_,_loc196_,_loc199_,_loc202_,_loc205_,_loc208_,new BarDefinition(_loc209_,_loc210_)];
         }
         if(!DebugComp.init__)
         {
            DebugComp.init__ = true;
            DebugComp.UPDATED = "debugcomp$updated";
         }
         if(!SearchBar.init__)
         {
            SearchBar.init__ = true;
            SearchBar.TEXT_FORMAT = new TextFormat("Calibri",14,0);
            SearchBar.HINT_FORMAT = new TextFormat("Calibri",14,7500402);
         }
         if(!CapsStyle_Impl_.init__)
         {
            CapsStyle_Impl_.init__ = true;
            CapsStyle_Impl_.NONE = "none";
            CapsStyle_Impl_.ROUND = "round";
            CapsStyle_Impl_.SQUARE = "square";
         }
         if(!GradientType_Impl_.init__)
         {
            GradientType_Impl_.init__ = true;
            GradientType_Impl_.LINEAR = "linear";
            GradientType_Impl_.RADIAL = "radial";
         }
         if(!InterpolationMethod_Impl_.init__)
         {
            InterpolationMethod_Impl_.init__ = true;
            InterpolationMethod_Impl_.LINEAR_RGB = "linearRGB";
            InterpolationMethod_Impl_.RGB = "rgb";
         }
         if(!JointStyle_Impl_.init__)
         {
            JointStyle_Impl_.init__ = true;
            JointStyle_Impl_.MITER = "miter";
            JointStyle_Impl_.ROUND = "round";
            JointStyle_Impl_.BEVEL = "bevel";
         }
         if(!LineScaleMode_Impl_.init__)
         {
            LineScaleMode_Impl_.init__ = true;
            LineScaleMode_Impl_.HORIZONTAL = "horizontal";
            LineScaleMode_Impl_.NONE = "none";
            LineScaleMode_Impl_.NORMAL = "normal";
            LineScaleMode_Impl_.VERTICAL = "vertical";
         }
         if(!SpreadMethod_Impl_.init__)
         {
            SpreadMethod_Impl_.init__ = true;
            SpreadMethod_Impl_.PAD = "pad";
            SpreadMethod_Impl_.REFLECT = "reflect";
            SpreadMethod_Impl_.REPEAT = "repeat";
         }
         if(!KeyLocation_Impl_.init__)
         {
            KeyLocation_Impl_.init__ = true;
            KeyLocation_Impl_.LEFT = 1;
            KeyLocation_Impl_.NUM_PAD = 3;
            KeyLocation_Impl_.RIGHT = 2;
            KeyLocation_Impl_.STANDARD = 0;
         }
         if(!MouseCursor_Impl_.init__)
         {
            MouseCursor_Impl_.init__ = true;
            MouseCursor_Impl_.ARROW = "arrow";
            MouseCursor_Impl_.AUTO = "auto";
            MouseCursor_Impl_.BUTTON = "button";
            MouseCursor_Impl_.HAND = "hand";
            MouseCursor_Impl_.IBEAM = "ibeam";
         }
         if(!Endian_Impl_.init__)
         {
            Endian_Impl_.init__ = true;
            Endian_Impl_.BIG_ENDIAN = "bigEndian";
            Endian_Impl_.LITTLE_ENDIAN = "littleEndian";
         }
         if(!Unserializer.init__)
         {
            Unserializer.init__ = true;
            Unserializer.DEFAULT_RESOLVER = new DefaultResolver();
         }
         if(!haxe.crypto.Base64.init__)
         {
            haxe.crypto.Base64.init__ = true;
            haxe.crypto.Base64.BYTES = Bytes.ofString(haxe.crypto.Base64.CHARS);
         }
         if(!FPHelper.init__)
         {
            FPHelper.init__ = true;
            var _temp_60:* = FPHelper;
            _loc211_ = new ByteArray();
            _loc211_.endian = "littleEndian";
            _temp_60.helper = _loc211_;
         }
         if(!haxe.xml.Parser.init__)
         {
            haxe.xml.Parser.init__ = true;
            §§push(haxe.xml.Parser);
            _loc212_ = new StringMap();
            if("lt" in StringMap.reserved)
            {
               _loc212_.setReserved("lt","<");
            }
            else
            {
               _loc212_.h["lt"] = "<";
            }
            if("gt" in StringMap.reserved)
            {
               _loc212_.setReserved("gt",">");
            }
            else
            {
               _loc212_.h["gt"] = ">";
            }
            if("amp" in StringMap.reserved)
            {
               _loc212_.setReserved("amp","&");
            }
            else
            {
               _loc212_.h["amp"] = "&";
            }
            if("quot" in StringMap.reserved)
            {
               _loc212_.setReserved("quot","\"");
            }
            else
            {
               _loc212_.h["quot"] = "\"";
            }
            if("apos" in StringMap.reserved)
            {
               _loc212_.setReserved("apos","\'");
            }
            else
            {
               _loc212_.h["apos"] = "\'";
            }
            §§pop().escapes = _loc212_;
         }
         if(!lime._internal.format.Base64.init__)
         {
            lime._internal.format.Base64.init__ = true;
            lime._internal.format.Base64.DICTIONARY = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split("");
            §§push(lime._internal.format.Base64);
            _loc3_ = [];
            _loc4_ = 0;
            _loc5_ = lime._internal.format.Base64.DICTIONARY;
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               _loc8_ = 0;
               _loc12_ = lime._internal.format.Base64.DICTIONARY;
               while(_loc8_ < int(_loc12_.length))
               {
                  _loc13_ = _loc12_[_loc8_];
                  _loc8_++;
                  _loc3_.push(_loc6_ + _loc13_);
               }
            }
            §§pop().EXTENDED_DICTIONARY = _loc3_;
         }
         if(!WebGL2RenderContext_Impl_.init__)
         {
            WebGL2RenderContext_Impl_.init__ = true;
            var _temp_61:* = WebGL2RenderContext_Impl_;
            _loc213_ = null;
            _temp_61.__tempPointer = new BytePointerData(_loc213_,0);
         }
         if(!System.init__)
         {
            System.init__ = true;
            System.__directories = new IntMap();
         }
         if(!Gamepad.init__)
         {
            Gamepad.init__ = true;
            Gamepad.devices = new IntMap();
            Gamepad.onConnect = new _Event_lime_ui_Gamepad_Void();
         }
         if(!GamepadAxis_Impl_.init__)
         {
            GamepadAxis_Impl_.init__ = true;
            GamepadAxis_Impl_.LEFT_X = 0;
            GamepadAxis_Impl_.LEFT_Y = 1;
            GamepadAxis_Impl_.RIGHT_X = 2;
            GamepadAxis_Impl_.RIGHT_Y = 3;
            GamepadAxis_Impl_.TRIGGER_LEFT = 4;
            GamepadAxis_Impl_.TRIGGER_RIGHT = 5;
         }
         if(!GamepadButton_Impl_.init__)
         {
            GamepadButton_Impl_.init__ = true;
            GamepadButton_Impl_.A = 0;
            GamepadButton_Impl_.B = 1;
            GamepadButton_Impl_.X = 2;
            GamepadButton_Impl_.Y = 3;
            GamepadButton_Impl_.BACK = 4;
            GamepadButton_Impl_.GUIDE = 5;
            GamepadButton_Impl_.START = 6;
            GamepadButton_Impl_.LEFT_STICK = 7;
            GamepadButton_Impl_.RIGHT_STICK = 8;
            GamepadButton_Impl_.LEFT_SHOULDER = 9;
            GamepadButton_Impl_.RIGHT_SHOULDER = 10;
            GamepadButton_Impl_.DPAD_UP = 11;
            GamepadButton_Impl_.DPAD_DOWN = 12;
            GamepadButton_Impl_.DPAD_LEFT = 13;
            GamepadButton_Impl_.DPAD_RIGHT = 14;
         }
         if(!Joystick.init__)
         {
            Joystick.init__ = true;
            Joystick.devices = new IntMap();
            Joystick.onConnect = new _Event_lime_ui_Joystick_Void();
         }
         if(!JoystickHatPosition_Impl_.init__)
         {
            JoystickHatPosition_Impl_.init__ = true;
            JoystickHatPosition_Impl_.CENTER = 0;
            JoystickHatPosition_Impl_.DOWN = 4;
            JoystickHatPosition_Impl_.LEFT = 8;
            JoystickHatPosition_Impl_.RIGHT = 2;
            JoystickHatPosition_Impl_.UP = 1;
            JoystickHatPosition_Impl_.DOWN_LEFT = 12;
            JoystickHatPosition_Impl_.DOWN_RIGHT = 6;
            JoystickHatPosition_Impl_.UP_LEFT = 9;
            JoystickHatPosition_Impl_.UP_RIGHT = 3;
         }
         if(!KeyCode_Impl_.init__)
         {
            KeyCode_Impl_.init__ = true;
            KeyCode_Impl_.UNKNOWN = 0;
            KeyCode_Impl_.BACKSPACE = 8;
            KeyCode_Impl_.TAB = 9;
            KeyCode_Impl_.RETURN = 13;
            KeyCode_Impl_.ESCAPE = 27;
            KeyCode_Impl_.SPACE = 32;
            KeyCode_Impl_.EXCLAMATION = 33;
            KeyCode_Impl_.QUOTE = 34;
            KeyCode_Impl_.HASH = 35;
            KeyCode_Impl_.DOLLAR = 36;
            KeyCode_Impl_.PERCENT = 37;
            KeyCode_Impl_.AMPERSAND = 38;
            KeyCode_Impl_.SINGLE_QUOTE = 39;
            KeyCode_Impl_.LEFT_PARENTHESIS = 40;
            KeyCode_Impl_.RIGHT_PARENTHESIS = 41;
            KeyCode_Impl_.ASTERISK = 42;
            KeyCode_Impl_.PLUS = 43;
            KeyCode_Impl_.COMMA = 44;
            KeyCode_Impl_.MINUS = 45;
            KeyCode_Impl_.PERIOD = 46;
            KeyCode_Impl_.SLASH = 47;
            KeyCode_Impl_.NUMBER_0 = 48;
            KeyCode_Impl_.NUMBER_1 = 49;
            KeyCode_Impl_.NUMBER_2 = 50;
            KeyCode_Impl_.NUMBER_3 = 51;
            KeyCode_Impl_.NUMBER_4 = 52;
            KeyCode_Impl_.NUMBER_5 = 53;
            KeyCode_Impl_.NUMBER_6 = 54;
            KeyCode_Impl_.NUMBER_7 = 55;
            KeyCode_Impl_.NUMBER_8 = 56;
            KeyCode_Impl_.NUMBER_9 = 57;
            KeyCode_Impl_.COLON = 58;
            KeyCode_Impl_.SEMICOLON = 59;
            KeyCode_Impl_.LESS_THAN = 60;
            KeyCode_Impl_.EQUALS = 61;
            KeyCode_Impl_.GREATER_THAN = 62;
            KeyCode_Impl_.QUESTION = 63;
            KeyCode_Impl_.AT = 64;
            KeyCode_Impl_.LEFT_BRACKET = 91;
            KeyCode_Impl_.BACKSLASH = 92;
            KeyCode_Impl_.RIGHT_BRACKET = 93;
            KeyCode_Impl_.CARET = 94;
            KeyCode_Impl_.UNDERSCORE = 95;
            KeyCode_Impl_.GRAVE = 96;
            KeyCode_Impl_.A = 97;
            KeyCode_Impl_.B = 98;
            KeyCode_Impl_.C = 99;
            KeyCode_Impl_.D = 100;
            KeyCode_Impl_.E = 101;
            KeyCode_Impl_.F = 102;
            KeyCode_Impl_.G = 103;
            KeyCode_Impl_.H = 104;
            KeyCode_Impl_.I = 105;
            KeyCode_Impl_.J = 106;
            KeyCode_Impl_.K = 107;
            KeyCode_Impl_.L = 108;
            KeyCode_Impl_.M = 109;
            KeyCode_Impl_.N = 110;
            KeyCode_Impl_.O = 111;
            KeyCode_Impl_.P = 112;
            KeyCode_Impl_.Q = 113;
            KeyCode_Impl_.R = 114;
            KeyCode_Impl_.S = 115;
            KeyCode_Impl_.T = 116;
            KeyCode_Impl_.U = 117;
            KeyCode_Impl_.V = 118;
            KeyCode_Impl_.W = 119;
            KeyCode_Impl_.X = 120;
            KeyCode_Impl_.Y = 121;
            KeyCode_Impl_.Z = 122;
            KeyCode_Impl_.DELETE = 127;
            KeyCode_Impl_.CAPS_LOCK = 1073741881;
            KeyCode_Impl_.F1 = 1073741882;
            KeyCode_Impl_.F2 = 1073741883;
            KeyCode_Impl_.F3 = 1073741884;
            KeyCode_Impl_.F4 = 1073741885;
            KeyCode_Impl_.F5 = 1073741886;
            KeyCode_Impl_.F6 = 1073741887;
            KeyCode_Impl_.F7 = 1073741888;
            KeyCode_Impl_.F8 = 1073741889;
            KeyCode_Impl_.F9 = 1073741890;
            KeyCode_Impl_.F10 = 1073741891;
            KeyCode_Impl_.F11 = 1073741892;
            KeyCode_Impl_.F12 = 1073741893;
            KeyCode_Impl_.PRINT_SCREEN = 1073741894;
            KeyCode_Impl_.SCROLL_LOCK = 1073741895;
            KeyCode_Impl_.PAUSE = 1073741896;
            KeyCode_Impl_.INSERT = 1073741897;
            KeyCode_Impl_.HOME = 1073741898;
            KeyCode_Impl_.PAGE_UP = 1073741899;
            KeyCode_Impl_.END = 1073741901;
            KeyCode_Impl_.PAGE_DOWN = 1073741902;
            KeyCode_Impl_.RIGHT = 1073741903;
            KeyCode_Impl_.LEFT = 1073741904;
            KeyCode_Impl_.DOWN = 1073741905;
            KeyCode_Impl_.UP = 1073741906;
            KeyCode_Impl_.NUM_LOCK = 1073741907;
            KeyCode_Impl_.NUMPAD_DIVIDE = 1073741908;
            KeyCode_Impl_.NUMPAD_MULTIPLY = 1073741909;
            KeyCode_Impl_.NUMPAD_MINUS = 1073741910;
            KeyCode_Impl_.NUMPAD_PLUS = 1073741911;
            KeyCode_Impl_.NUMPAD_ENTER = 1073741912;
            KeyCode_Impl_.NUMPAD_1 = 1073741913;
            KeyCode_Impl_.NUMPAD_2 = 1073741914;
            KeyCode_Impl_.NUMPAD_3 = 1073741915;
            KeyCode_Impl_.NUMPAD_4 = 1073741916;
            KeyCode_Impl_.NUMPAD_5 = 1073741917;
            KeyCode_Impl_.NUMPAD_6 = 1073741918;
            KeyCode_Impl_.NUMPAD_7 = 1073741919;
            KeyCode_Impl_.NUMPAD_8 = 1073741920;
            KeyCode_Impl_.NUMPAD_9 = 1073741921;
            KeyCode_Impl_.NUMPAD_0 = 1073741922;
            KeyCode_Impl_.NUMPAD_PERIOD = 1073741923;
            KeyCode_Impl_.APPLICATION = 1073741925;
            KeyCode_Impl_.POWER = 1073741926;
            KeyCode_Impl_.NUMPAD_EQUALS = 1073741927;
            KeyCode_Impl_.F13 = 1073741928;
            KeyCode_Impl_.F14 = 1073741929;
            KeyCode_Impl_.F15 = 1073741930;
            KeyCode_Impl_.F16 = 1073741931;
            KeyCode_Impl_.F17 = 1073741932;
            KeyCode_Impl_.F18 = 1073741933;
            KeyCode_Impl_.F19 = 1073741934;
            KeyCode_Impl_.F20 = 1073741935;
            KeyCode_Impl_.F21 = 1073741936;
            KeyCode_Impl_.F22 = 1073741937;
            KeyCode_Impl_.F23 = 1073741938;
            KeyCode_Impl_.F24 = 1073741939;
            KeyCode_Impl_.EXECUTE = 1073741940;
            KeyCode_Impl_.HELP = 1073741941;
            KeyCode_Impl_.MENU = 1073741942;
            KeyCode_Impl_.SELECT = 1073741943;
            KeyCode_Impl_.STOP = 1073741944;
            KeyCode_Impl_.AGAIN = 1073741945;
            KeyCode_Impl_.UNDO = 1073741946;
            KeyCode_Impl_.CUT = 1073741947;
            KeyCode_Impl_.COPY = 1073741948;
            KeyCode_Impl_.PASTE = 1073741949;
            KeyCode_Impl_.FIND = 1073741950;
            KeyCode_Impl_.MUTE = 1073741951;
            KeyCode_Impl_.VOLUME_UP = 1073741952;
            KeyCode_Impl_.VOLUME_DOWN = 1073741953;
            KeyCode_Impl_.NUMPAD_COMMA = 1073741957;
            KeyCode_Impl_.ALT_ERASE = 1073741977;
            KeyCode_Impl_.SYSTEM_REQUEST = 1073741978;
            KeyCode_Impl_.CANCEL = 1073741979;
            KeyCode_Impl_.CLEAR = 1073741980;
            KeyCode_Impl_.PRIOR = 1073741981;
            KeyCode_Impl_.RETURN2 = 1073741982;
            KeyCode_Impl_.SEPARATOR = 1073741983;
            KeyCode_Impl_.OUT = 1073741984;
            KeyCode_Impl_.OPER = 1073741985;
            KeyCode_Impl_.CLEAR_AGAIN = 1073741986;
            KeyCode_Impl_.CRSEL = 1073741987;
            KeyCode_Impl_.EXSEL = 1073741988;
            KeyCode_Impl_.NUMPAD_00 = 1073742000;
            KeyCode_Impl_.NUMPAD_000 = 1073742001;
            KeyCode_Impl_.THOUSAND_SEPARATOR = 1073742002;
            KeyCode_Impl_.DECIMAL_SEPARATOR = 1073742003;
            KeyCode_Impl_.CURRENCY_UNIT = 1073742004;
            KeyCode_Impl_.CURRENCY_SUBUNIT = 1073742005;
            KeyCode_Impl_.NUMPAD_LEFT_PARENTHESIS = 1073742006;
            KeyCode_Impl_.NUMPAD_RIGHT_PARENTHESIS = 1073742007;
            KeyCode_Impl_.NUMPAD_LEFT_BRACE = 1073742008;
            KeyCode_Impl_.NUMPAD_RIGHT_BRACE = 1073742009;
            KeyCode_Impl_.NUMPAD_TAB = 1073742010;
            KeyCode_Impl_.NUMPAD_BACKSPACE = 1073742011;
            KeyCode_Impl_.NUMPAD_A = 1073742012;
            KeyCode_Impl_.NUMPAD_B = 1073742013;
            KeyCode_Impl_.NUMPAD_C = 1073742014;
            KeyCode_Impl_.NUMPAD_D = 1073742015;
            KeyCode_Impl_.NUMPAD_E = 1073742016;
            KeyCode_Impl_.NUMPAD_F = 1073742017;
            KeyCode_Impl_.NUMPAD_XOR = 1073742018;
            KeyCode_Impl_.NUMPAD_POWER = 1073742019;
            KeyCode_Impl_.NUMPAD_PERCENT = 1073742020;
            KeyCode_Impl_.NUMPAD_LESS_THAN = 1073742021;
            KeyCode_Impl_.NUMPAD_GREATER_THAN = 1073742022;
            KeyCode_Impl_.NUMPAD_AMPERSAND = 1073742023;
            KeyCode_Impl_.NUMPAD_DOUBLE_AMPERSAND = 1073742024;
            KeyCode_Impl_.NUMPAD_VERTICAL_BAR = 1073742025;
            KeyCode_Impl_.NUMPAD_DOUBLE_VERTICAL_BAR = 1073742026;
            KeyCode_Impl_.NUMPAD_COLON = 1073742027;
            KeyCode_Impl_.NUMPAD_HASH = 1073742028;
            KeyCode_Impl_.NUMPAD_SPACE = 1073742029;
            KeyCode_Impl_.NUMPAD_AT = 1073742030;
            KeyCode_Impl_.NUMPAD_EXCLAMATION = 1073742031;
            KeyCode_Impl_.NUMPAD_MEM_STORE = 1073742032;
            KeyCode_Impl_.NUMPAD_MEM_RECALL = 1073742033;
            KeyCode_Impl_.NUMPAD_MEM_CLEAR = 1073742034;
            KeyCode_Impl_.NUMPAD_MEM_ADD = 1073742035;
            KeyCode_Impl_.NUMPAD_MEM_SUBTRACT = 1073742036;
            KeyCode_Impl_.NUMPAD_MEM_MULTIPLY = 1073742037;
            KeyCode_Impl_.NUMPAD_MEM_DIVIDE = 1073742038;
            KeyCode_Impl_.NUMPAD_PLUS_MINUS = 1073742039;
            KeyCode_Impl_.NUMPAD_CLEAR = 1073742040;
            KeyCode_Impl_.NUMPAD_CLEAR_ENTRY = 1073742041;
            KeyCode_Impl_.NUMPAD_BINARY = 1073742042;
            KeyCode_Impl_.NUMPAD_OCTAL = 1073742043;
            KeyCode_Impl_.NUMPAD_DECIMAL = 1073742044;
            KeyCode_Impl_.NUMPAD_HEXADECIMAL = 1073742045;
            KeyCode_Impl_.LEFT_CTRL = 1073742048;
            KeyCode_Impl_.LEFT_SHIFT = 1073742049;
            KeyCode_Impl_.LEFT_ALT = 1073742050;
            KeyCode_Impl_.LEFT_META = 1073742051;
            KeyCode_Impl_.RIGHT_CTRL = 1073742052;
            KeyCode_Impl_.RIGHT_SHIFT = 1073742053;
            KeyCode_Impl_.RIGHT_ALT = 1073742054;
            KeyCode_Impl_.RIGHT_META = 1073742055;
            KeyCode_Impl_.MODE = 1073742081;
            KeyCode_Impl_.AUDIO_NEXT = 1073742082;
            KeyCode_Impl_.AUDIO_PREVIOUS = 1073742083;
            KeyCode_Impl_.AUDIO_STOP = 1073742084;
            KeyCode_Impl_.AUDIO_PLAY = 1073742085;
            KeyCode_Impl_.AUDIO_MUTE = 1073742086;
            KeyCode_Impl_.MEDIA_SELECT = 1073742087;
            KeyCode_Impl_.WWW = 1073742088;
            KeyCode_Impl_.MAIL = 1073742089;
            KeyCode_Impl_.CALCULATOR = 1073742090;
            KeyCode_Impl_.COMPUTER = 1073742091;
            KeyCode_Impl_.APP_CONTROL_SEARCH = 1073742092;
            KeyCode_Impl_.APP_CONTROL_HOME = 1073742093;
            KeyCode_Impl_.APP_CONTROL_BACK = 1073742094;
            KeyCode_Impl_.APP_CONTROL_FORWARD = 1073742095;
            KeyCode_Impl_.APP_CONTROL_STOP = 1073742096;
            KeyCode_Impl_.APP_CONTROL_REFRESH = 1073742097;
            KeyCode_Impl_.APP_CONTROL_BOOKMARKS = 1073742098;
            KeyCode_Impl_.BRIGHTNESS_DOWN = 1073742099;
            KeyCode_Impl_.BRIGHTNESS_UP = 1073742100;
            KeyCode_Impl_.DISPLAY_SWITCH = 1073742101;
            KeyCode_Impl_.BACKLIGHT_TOGGLE = 1073742102;
            KeyCode_Impl_.BACKLIGHT_DOWN = 1073742103;
            KeyCode_Impl_.BACKLIGHT_UP = 1073742104;
            KeyCode_Impl_.EJECT = 1073742105;
            KeyCode_Impl_.SLEEP = 1073742106;
         }
         if(!KeyModifier_Impl_.init__)
         {
            KeyModifier_Impl_.init__ = true;
            KeyModifier_Impl_.NONE = 0;
            KeyModifier_Impl_.LEFT_SHIFT = 1;
            KeyModifier_Impl_.RIGHT_SHIFT = 2;
            KeyModifier_Impl_.LEFT_CTRL = 64;
            KeyModifier_Impl_.RIGHT_CTRL = 128;
            KeyModifier_Impl_.LEFT_ALT = 256;
            KeyModifier_Impl_.RIGHT_ALT = 512;
            KeyModifier_Impl_.LEFT_META = 1024;
            KeyModifier_Impl_.RIGHT_META = 2048;
            KeyModifier_Impl_.NUM_LOCK = 4096;
            KeyModifier_Impl_.CAPS_LOCK = 8192;
            KeyModifier_Impl_.MODE = 16384;
            KeyModifier_Impl_.CTRL = 192;
            KeyModifier_Impl_.SHIFT = 3;
            KeyModifier_Impl_.ALT = 768;
            KeyModifier_Impl_.META = 3072;
         }
         if(!ScanCode_Impl_.init__)
         {
            ScanCode_Impl_.init__ = true;
            ScanCode_Impl_.UNKNOWN = 0;
            ScanCode_Impl_.BACKSPACE = 42;
            ScanCode_Impl_.TAB = 43;
            ScanCode_Impl_.RETURN = 40;
            ScanCode_Impl_.ESCAPE = 41;
            ScanCode_Impl_.SPACE = 44;
            ScanCode_Impl_.SINGLE_QUOTE = 52;
            ScanCode_Impl_.COMMA = 54;
            ScanCode_Impl_.MINUS = 45;
            ScanCode_Impl_.PERIOD = 55;
            ScanCode_Impl_.SLASH = 56;
            ScanCode_Impl_.NUMBER_0 = 39;
            ScanCode_Impl_.NUMBER_1 = 30;
            ScanCode_Impl_.NUMBER_2 = 31;
            ScanCode_Impl_.NUMBER_3 = 32;
            ScanCode_Impl_.NUMBER_4 = 33;
            ScanCode_Impl_.NUMBER_5 = 34;
            ScanCode_Impl_.NUMBER_6 = 35;
            ScanCode_Impl_.NUMBER_7 = 36;
            ScanCode_Impl_.NUMBER_8 = 37;
            ScanCode_Impl_.NUMBER_9 = 38;
            ScanCode_Impl_.SEMICOLON = 51;
            ScanCode_Impl_.EQUALS = 46;
            ScanCode_Impl_.LEFT_BRACKET = 47;
            ScanCode_Impl_.BACKSLASH = 49;
            ScanCode_Impl_.RIGHT_BRACKET = 48;
            ScanCode_Impl_.GRAVE = 53;
            ScanCode_Impl_.A = 4;
            ScanCode_Impl_.B = 5;
            ScanCode_Impl_.C = 6;
            ScanCode_Impl_.D = 7;
            ScanCode_Impl_.E = 8;
            ScanCode_Impl_.F = 9;
            ScanCode_Impl_.G = 10;
            ScanCode_Impl_.H = 11;
            ScanCode_Impl_.I = 12;
            ScanCode_Impl_.J = 13;
            ScanCode_Impl_.K = 14;
            ScanCode_Impl_.L = 15;
            ScanCode_Impl_.M = 16;
            ScanCode_Impl_.N = 17;
            ScanCode_Impl_.O = 18;
            ScanCode_Impl_.P = 19;
            ScanCode_Impl_.Q = 20;
            ScanCode_Impl_.R = 21;
            ScanCode_Impl_.S = 22;
            ScanCode_Impl_.T = 23;
            ScanCode_Impl_.U = 24;
            ScanCode_Impl_.V = 25;
            ScanCode_Impl_.W = 26;
            ScanCode_Impl_.X = 27;
            ScanCode_Impl_.Y = 28;
            ScanCode_Impl_.Z = 29;
            ScanCode_Impl_.DELETE = 76;
            ScanCode_Impl_.CAPS_LOCK = 57;
            ScanCode_Impl_.F1 = 58;
            ScanCode_Impl_.F2 = 59;
            ScanCode_Impl_.F3 = 60;
            ScanCode_Impl_.F4 = 61;
            ScanCode_Impl_.F5 = 62;
            ScanCode_Impl_.F6 = 63;
            ScanCode_Impl_.F7 = 64;
            ScanCode_Impl_.F8 = 65;
            ScanCode_Impl_.F9 = 66;
            ScanCode_Impl_.F10 = 67;
            ScanCode_Impl_.F11 = 68;
            ScanCode_Impl_.F12 = 69;
            ScanCode_Impl_.PRINT_SCREEN = 70;
            ScanCode_Impl_.SCROLL_LOCK = 71;
            ScanCode_Impl_.PAUSE = 72;
            ScanCode_Impl_.INSERT = 73;
            ScanCode_Impl_.HOME = 74;
            ScanCode_Impl_.PAGE_UP = 75;
            ScanCode_Impl_.END = 77;
            ScanCode_Impl_.PAGE_DOWN = 78;
            ScanCode_Impl_.RIGHT = 79;
            ScanCode_Impl_.LEFT = 80;
            ScanCode_Impl_.DOWN = 81;
            ScanCode_Impl_.UP = 82;
            ScanCode_Impl_.NUM_LOCK = 83;
            ScanCode_Impl_.NUMPAD_DIVIDE = 84;
            ScanCode_Impl_.NUMPAD_MULTIPLY = 85;
            ScanCode_Impl_.NUMPAD_MINUS = 86;
            ScanCode_Impl_.NUMPAD_PLUS = 87;
            ScanCode_Impl_.NUMPAD_ENTER = 88;
            ScanCode_Impl_.NUMPAD_1 = 89;
            ScanCode_Impl_.NUMPAD_2 = 90;
            ScanCode_Impl_.NUMPAD_3 = 91;
            ScanCode_Impl_.NUMPAD_4 = 92;
            ScanCode_Impl_.NUMPAD_5 = 93;
            ScanCode_Impl_.NUMPAD_6 = 94;
            ScanCode_Impl_.NUMPAD_7 = 95;
            ScanCode_Impl_.NUMPAD_8 = 96;
            ScanCode_Impl_.NUMPAD_9 = 97;
            ScanCode_Impl_.NUMPAD_0 = 98;
            ScanCode_Impl_.NUMPAD_PERIOD = 99;
            ScanCode_Impl_.APPLICATION = 101;
            ScanCode_Impl_.POWER = 102;
            ScanCode_Impl_.NUMPAD_EQUALS = 103;
            ScanCode_Impl_.F13 = 104;
            ScanCode_Impl_.F14 = 105;
            ScanCode_Impl_.F15 = 106;
            ScanCode_Impl_.F16 = 107;
            ScanCode_Impl_.F17 = 108;
            ScanCode_Impl_.F18 = 109;
            ScanCode_Impl_.F19 = 110;
            ScanCode_Impl_.F20 = 111;
            ScanCode_Impl_.F21 = 112;
            ScanCode_Impl_.F22 = 113;
            ScanCode_Impl_.F23 = 114;
            ScanCode_Impl_.F24 = 115;
            ScanCode_Impl_.EXECUTE = 116;
            ScanCode_Impl_.HELP = 117;
            ScanCode_Impl_.MENU = 118;
            ScanCode_Impl_.SELECT = 119;
            ScanCode_Impl_.STOP = 120;
            ScanCode_Impl_.AGAIN = 121;
            ScanCode_Impl_.UNDO = 122;
            ScanCode_Impl_.CUT = 123;
            ScanCode_Impl_.COPY = 124;
            ScanCode_Impl_.PASTE = 125;
            ScanCode_Impl_.FIND = 126;
            ScanCode_Impl_.MUTE = 127;
            ScanCode_Impl_.VOLUME_UP = 128;
            ScanCode_Impl_.VOLUME_DOWN = 129;
            ScanCode_Impl_.NUMPAD_COMMA = 133;
            ScanCode_Impl_.ALT_ERASE = 153;
            ScanCode_Impl_.SYSTEM_REQUEST = 154;
            ScanCode_Impl_.CANCEL = 155;
            ScanCode_Impl_.CLEAR = 156;
            ScanCode_Impl_.PRIOR = 157;
            ScanCode_Impl_.RETURN2 = 158;
            ScanCode_Impl_.SEPARATOR = 159;
            ScanCode_Impl_.OUT = 160;
            ScanCode_Impl_.OPER = 161;
            ScanCode_Impl_.CLEAR_AGAIN = 162;
            ScanCode_Impl_.CRSEL = 163;
            ScanCode_Impl_.EXSEL = 164;
            ScanCode_Impl_.NUMPAD_00 = 176;
            ScanCode_Impl_.NUMPAD_000 = 177;
            ScanCode_Impl_.THOUSAND_SEPARATOR = 178;
            ScanCode_Impl_.DECIMAL_SEPARATOR = 179;
            ScanCode_Impl_.CURRENCY_UNIT = 180;
            ScanCode_Impl_.CURRENCY_SUBUNIT = 181;
            ScanCode_Impl_.NUMPAD_LEFT_PARENTHESIS = 182;
            ScanCode_Impl_.NUMPAD_RIGHT_PARENTHESIS = 183;
            ScanCode_Impl_.NUMPAD_LEFT_BRACE = 184;
            ScanCode_Impl_.NUMPAD_RIGHT_BRACE = 185;
            ScanCode_Impl_.NUMPAD_TAB = 186;
            ScanCode_Impl_.NUMPAD_BACKSPACE = 187;
            ScanCode_Impl_.NUMPAD_A = 188;
            ScanCode_Impl_.NUMPAD_B = 189;
            ScanCode_Impl_.NUMPAD_C = 190;
            ScanCode_Impl_.NUMPAD_D = 191;
            ScanCode_Impl_.NUMPAD_E = 192;
            ScanCode_Impl_.NUMPAD_F = 193;
            ScanCode_Impl_.NUMPAD_XOR = 194;
            ScanCode_Impl_.NUMPAD_POWER = 195;
            ScanCode_Impl_.NUMPAD_PERCENT = 196;
            ScanCode_Impl_.NUMPAD_LESS_THAN = 197;
            ScanCode_Impl_.NUMPAD_GREATER_THAN = 198;
            ScanCode_Impl_.NUMPAD_AMPERSAND = 199;
            ScanCode_Impl_.NUMPAD_DOUBLE_AMPERSAND = 200;
            ScanCode_Impl_.NUMPAD_VERTICAL_BAR = 201;
            ScanCode_Impl_.NUMPAD_DOUBLE_VERTICAL_BAR = 202;
            ScanCode_Impl_.NUMPAD_COLON = 203;
            ScanCode_Impl_.NUMPAD_HASH = 204;
            ScanCode_Impl_.NUMPAD_SPACE = 205;
            ScanCode_Impl_.NUMPAD_AT = 206;
            ScanCode_Impl_.NUMPAD_EXCLAMATION = 207;
            ScanCode_Impl_.NUMPAD_MEM_STORE = 208;
            ScanCode_Impl_.NUMPAD_MEM_RECALL = 209;
            ScanCode_Impl_.NUMPAD_MEM_CLEAR = 210;
            ScanCode_Impl_.NUMPAD_MEM_ADD = 211;
            ScanCode_Impl_.NUMPAD_MEM_SUBTRACT = 212;
            ScanCode_Impl_.NUMPAD_MEM_MULTIPLY = 213;
            ScanCode_Impl_.NUMPAD_MEM_DIVIDE = 214;
            ScanCode_Impl_.NUMPAD_PLUS_MINUS = 215;
            ScanCode_Impl_.NUMPAD_CLEAR = 216;
            ScanCode_Impl_.NUMPAD_CLEAR_ENTRY = 217;
            ScanCode_Impl_.NUMPAD_BINARY = 218;
            ScanCode_Impl_.NUMPAD_OCTAL = 219;
            ScanCode_Impl_.NUMPAD_DECIMAL = 220;
            ScanCode_Impl_.NUMPAD_HEXADECIMAL = 221;
            ScanCode_Impl_.LEFT_CTRL = 224;
            ScanCode_Impl_.LEFT_SHIFT = 225;
            ScanCode_Impl_.LEFT_ALT = 226;
            ScanCode_Impl_.LEFT_META = 227;
            ScanCode_Impl_.RIGHT_CTRL = 228;
            ScanCode_Impl_.RIGHT_SHIFT = 229;
            ScanCode_Impl_.RIGHT_ALT = 230;
            ScanCode_Impl_.RIGHT_META = 231;
            ScanCode_Impl_.MODE = 257;
            ScanCode_Impl_.AUDIO_NEXT = 258;
            ScanCode_Impl_.AUDIO_PREVIOUS = 259;
            ScanCode_Impl_.AUDIO_STOP = 260;
            ScanCode_Impl_.AUDIO_PLAY = 261;
            ScanCode_Impl_.AUDIO_MUTE = 262;
            ScanCode_Impl_.MEDIA_SELECT = 263;
            ScanCode_Impl_.WWW = 264;
            ScanCode_Impl_.MAIL = 265;
            ScanCode_Impl_.CALCULATOR = 266;
            ScanCode_Impl_.COMPUTER = 267;
            ScanCode_Impl_.APP_CONTROL_SEARCH = 268;
            ScanCode_Impl_.APP_CONTROL_HOME = 269;
            ScanCode_Impl_.APP_CONTROL_BACK = 270;
            ScanCode_Impl_.APP_CONTROL_FORWARD = 271;
            ScanCode_Impl_.APP_CONTROL_STOP = 272;
            ScanCode_Impl_.APP_CONTROL_REFRESH = 273;
            ScanCode_Impl_.APP_CONTROL_BOOKMARKS = 274;
            ScanCode_Impl_.BRIGHTNESS_DOWN = 275;
            ScanCode_Impl_.BRIGHTNESS_UP = 276;
            ScanCode_Impl_.DISPLAY_SWITCH = 277;
            ScanCode_Impl_.BACKLIGHT_TOGGLE = 278;
            ScanCode_Impl_.BACKLIGHT_DOWN = 279;
            ScanCode_Impl_.BACKLIGHT_UP = 280;
            ScanCode_Impl_.EJECT = 281;
            ScanCode_Impl_.SLEEP = 282;
         }
         if(!Touch.init__)
         {
            Touch.init__ = true;
            Touch.onCancel = new _Event_lime_ui_Touch_Void();
            Touch.onEnd = new _Event_lime_ui_Touch_Void();
            Touch.onMove = new _Event_lime_ui_Touch_Void();
            Touch.onStart = new _Event_lime_ui_Touch_Void();
         }
         if(!lime.utils.Assets.init__)
         {
            lime.utils.Assets.init__ = true;
            lime.utils.Assets.cache = new lime.utils.AssetCache();
            lime.utils.Assets.onChange = new _Event_Void_Void();
            lime.utils.Assets.bundlePaths = new StringMap();
            lime.utils.Assets.libraries = new StringMap();
            lime.utils.Assets.libraryPaths = new StringMap();
         }
         if(!LogLevel_Impl_.init__)
         {
            LogLevel_Impl_.init__ = true;
            LogLevel_Impl_.NONE = 0;
            LogLevel_Impl_.ERROR = 1;
            LogLevel_Impl_.WARN = 2;
            LogLevel_Impl_.INFO = 3;
            LogLevel_Impl_.DEBUG = 4;
            LogLevel_Impl_.VERBOSE = 5;
         }
         if(!SimpleActuator.init__)
         {
            SimpleActuator.init__ = true;
            SimpleActuator.actuators = [];
         }
         if(!Expo.init__)
         {
            Expo.init__ = true;
            Expo.easeIn = new ExpoEaseIn();
            Expo.easeInOut = new ExpoEaseInOut();
            Expo.easeOut = new ExpoEaseOut();
         }
         if(!Actuate.init__)
         {
            Actuate.init__ = true;
            Actuate.defaultActuator = SimpleActuator;
            Actuate.defaultEase = Expo.easeOut;
            Actuate.targetLibraries = new ObjectMap();
         }
         if(!Elastic.init__)
         {
            Elastic.init__ = true;
            Elastic.easeIn = new ElasticEaseIn(0.1,0.4);
            Elastic.easeInOut = new ElasticEaseInOut(0.1,0.4);
            Elastic.easeOut = new ElasticEaseOut(0.1,0.4);
         }
         if(!openfl.Lib.init__)
         {
            openfl.Lib.init__ = true;
            openfl.Lib.__sentWarnings = new StringMap();
            openfl.Lib.__timers = new IntMap();
            openfl.Lib.__registeredClassAliases = new StringMap();
            openfl.Lib.__registeredClasses = Dictionary_Impl_._new();
         }
         if(!FlashGraphics.init__)
         {
            FlashGraphics.init__ = true;
            FlashGraphics.bitmapFill = Dictionary_Impl_._new(true);
            FlashGraphics.tileRect = new Rectangle();
            FlashGraphics.tileTransform = new Matrix();
         }
         if(!openfl.utils.Assets.init__)
         {
            openfl.utils.Assets.init__ = true;
            openfl.utils.Assets.cache = new openfl.utils.AssetCache();
            openfl.utils.Assets.dispatcher = new EventDispatcher();
            openfl.utils.Assets.libraryBindings = new StringMap();
         }
         if(!ByteArray_Impl_.init__)
         {
            ByteArray_Impl_.init__ = true;
            var _temp_62:* = ByteArray_Impl_;
            _loc213_ = null;
            _temp_62.__bytePointer = new BytePointerData(_loc213_,0);
         }
         if(!openfl.utils._internal.Lib.init__)
         {
            openfl.utils._internal.Lib.init__ = true;
            openfl.utils._internal.Lib.current = flash.Lib.current;
            openfl.utils._internal.Lib.__sentWarnings = new StringMap();
         }
         ApplicationMain.main();
      }
   }
}

