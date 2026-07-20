package classes.items
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.weapons.BeautifulSword;
   import classes.items.weapons.Blunderbuss;
   import classes.items.weapons.CursedDagger;
   import classes.items.weapons.EldritchStaff;
   import classes.items.weapons.FelAxe;
   import classes.items.weapons.FlameheartSpear;
   import classes.items.weapons.GeodeKnuckle;
   import classes.items.weapons.HugeWarhammer;
   import classes.items.weapons.HuntsmansCane;
   import classes.items.weapons.IceWeapon;
   import classes.items.weapons.JeweledRapier;
   import classes.items.weapons.LargeClaymore;
   import classes.items.weapons.LargeHammer;
   import classes.items.weapons.LethiciteStaff;
   import classes.items.weapons.MidnightRapier;
   import classes.items.weapons.NephilaScepter;
   import classes.items.weapons.RaphaelsRapier;
   import classes.items.weapons.ScarredBlade;
   import classes.items.weapons.Spellblade;
   import classes.items.weapons.UglySword;
   import classes.items.weapons.WingedSpear;
   import classes.items.weapons.unarmed.Fists;
   import classes.items.weapons.unarmed.UnarmedClaws;
   import flash.Boot;
   
   public final class WeaponLib
   {
      
      public static var init__:Boolean;
      
      public static var FISTS:Fists;
      
      public static var CLAWS:UnarmedClaws;
      
      public static var DEFAULT_VALUE:Number = 6;
      
      public var W_STAFF:Weapon;
      
      public var WINGSPR:Weapon;
      
      public var WHIP:Weapon;
      
      public var WARHAMR:HugeWarhammer;
      
      public var U_SWORD:Weapon;
      
      public var URTAHLB:Weapon;
      
      public var S_GAUNT:Weapon;
      
      public var S_BLADE:Spellblade;
      
      public var SUCWHIP:Weapon;
      
      public var SPEAR:Weapon;
      
      public var SILWHIP:Weapon;
      
      public var SCIMITR:Weapon;
      
      public var SCARBLD:Weapon;
      
      public var RRAPIER:RaphaelsRapier;
      
      public var RIDINGC:Weapon;
      
      public var PTCHFRK:Weapon;
      
      public var PIPE:Weapon;
      
      public var NEPHSCEPT:NephilaScepter;
      
      public var MRAPIER:MidnightRapier;
      
      public var MACE:Weapon;
      
      public var L__AXE:Weapon;
      
      public var L_WHIP:Weapon;
      
      public var L_STAFF:LethiciteStaff;
      
      public var L_HAMMR:LargeHammer;
      
      public var L_DAGGR:Weapon;
      
      public var LRAVENG:Weapon;
      
      public var KIHAAXE:Weapon;
      
      public var KATANA:Weapon;
      
      public var JRAPIER:JeweledRapier;
      
      public var ICESWORD:IceWeapon;
      
      public var ICESTAFF:IceWeapon;
      
      public var ICESPEAR:IceWeapon;
      
      public var ICESCYTHE:IceWeapon;
      
      public var ICEMACE:IceWeapon;
      
      public var ICEDAGGER:IceWeapon;
      
      public var ICEAXE:IceWeapon;
      
      public var H_GAUNT:Weapon;
      
      public var HNTCANE:HuntsmansCane;
      
      public var G_KNUCKLE:GeodeKnuckle;
      
      public var FLNGSRD:Weapon;
      
      public var FLMHRTSPEAR:FlameheartSpear;
      
      public var FLINTLK:Weapon;
      
      public var FLAIL:Weapon;
      
      public var FINALARG:Weapon;
      
      public var FEL_AXE:FelAxe;
      
      public var E_STAFF:EldritchStaff;
      
      public var DULLSC:Weapon;
      
      public var DAGGER:Weapon;
      
      public var CTSWRD:Weapon;
      
      public var CROSSBW:Weapon;
      
      public var CLAYMOR:Weapon;
      
      public var CDAGGER:CursedDagger;
      
      public var B_SWORD:Weapon;
      
      public var B_SCARB:Weapon;
      
      public var BLUNDER:Blunderbuss;
      
      public var BAT:Weapon;
      
      public function WeaponLib()
      {
         var _g6:WeaponEffects;
         var _g11:WeaponEffects;
         var _g5:WeaponEffects;
         var _g4:WeaponEffects;
         var playerCorRatio1:int;
         var baseTease1:int;
         var chance:int;
         var _g3:WeaponEffects;
         var _g2:WeaponEffects;
         var _g1:WeaponEffects;
         var type:String;
         var playerCorRatio:int;
         var baseTease:int;
         var _g:WeaponEffects;
         var _loc1_:Weapon;
         var _loc2_:HugeWarhammer;
         var _loc3_:Weapon;
         var _loc4_:Weapon;
         var _loc5_:Weapon;
         var _loc6_:Weapon;
         var _loc7_:Spellblade;
         var _loc8_:RaphaelsRapier;
         var _loc9_:Weapon;
         var _loc10_:Weapon;
         var _loc11_:LargeHammer;
         var _loc12_:Weapon;
         var _loc13_:Weapon;
         var _loc14_:Weapon;
         var _loc15_:Weapon;
         var _loc16_:Weapon;
         var _loc17_:Weapon;
         var _loc18_:Weapon;
         var _loc19_:Weapon;
         super();
         if(Boot.skip_constructor)
         {
            return;
         }
         _g = Weapon.WEAPONEFFECTS;
         baseTease = 5;
         playerCorRatio = 12;
         type = "coiled";
         _loc1_ = new Weapon("Whip   ","Whip","coiled whip","a coiled whip",["lash"],5,500,"A coiled length of leather designed to lash your foes into submission. There\'s a chance the bondage inclined might enjoy it!",["Whip"],1,[function():void
         {
            _g.lustPoison(baseTease,playerCorRatio,type);
         }]);
         _loc1_._headerName = "Whip";
         WHIP = _loc1_;
         _loc2_ = new HugeWarhammer();
         _loc2_._headerName = "Warhammer";
         WARHAMR = _loc2_;
         WINGSPR = new WingedSpear();
         _loc3_ = new Weapon("W.Staff","Wizard Staff","wizard\'s staff","a wizard\'s staff",["smack"],3,350,"This staff is made of very old wood and seems to tingle to the touch. The top has an odd zig-zag shape to it, and the wood is worn smooth from lots of use. It probably belonged to a wizard at some point and would aid magic use.",["魔法","Staff"]);
         _loc3_.boost("法术修正",NumberFunc_Impl_.fromInt(40),false);
         _loc4_ = _loc3_;
         _loc4_._headerName = "Wizard Staff";
         W_STAFF = _loc4_;
         _loc5_ = new Weapon("UrtaHlb","Urta\'s Halberd","halberd","a halberd",["slash"],11,10,"Urta\'s halberd.",["Polearm","大型"],1,null,0,25);
         _loc5_._headerName = "Urta\'s Halberd";
         URTAHLB = _loc5_;
         U_SWORD = new UglySword();
         _g1 = Weapon.WEAPONEFFECTS;
         SUCWHIP = new Weapon("SucWhip","Succubus Whip","succubus whip","a succubus whip",["whipping","lash"],10,400,"This coiled length of midnight-black leather practically exudes lust. Though it looks like it could do a lot of damage, the feel of its slick leather impacting flesh is sure to inspire lust. However, it might slowly warp the mind of wielder.",["Whip"],1,[function():void
         {
            _g1.corruptedTease();
         }]);
         _loc6_ = new Weapon("Spear  ","Spear","deadly spear","a deadly spear",["stab"],8,450,"A staff with a sharp blade at the tip designed to pierce through the toughest armor. This would penetrate most armors.",["Spear"],0.6);
         _loc6_._headerName = "Spear";
         SPEAR = _loc6_;
         SILWHIP = new Weapon("SilWhip","Silver Whip","silver whip","a white, metal-tipped whip",["whipping","lash"],12,500,"This coiled length of alabaster-white leather is tipped with a shiny silver wedge. The end snaps at high velocity, capable of doing considerably more harm than one might think.",["Whip"]);
         SCIMITR = new Weapon("Scimitr","Scimitar","scimitar","a scimitar",["slash"],15,500,"This curved sword is made for slashing. No doubt it\'ll easily cut through flesh.",["1H Sword"]);
         SCARBLD = new ScarredBlade();
         _g2 = Weapon.WEAPONEFFECTS;
         S_GAUNT = new Weapon("S.Gaunt","SpikedGauntlet","spiked gauntlet","a spiked gauntlet",["punch"],5,400,"This single metal gauntlet has the knuckles tipped with metal spikes. Though it lacks the damaging potential of other weapons, the sheer pain of its wounds has a chance of stunning your opponent.",["Fist"],1,[function():void
         {
            _g2.stun();
         }]);
         _loc7_ = new Spellblade();
         _loc7_._headerName = "Spellblade";
         S_BLADE = _loc7_;
         _loc8_ = new RaphaelsRapier();
         _loc8_._headerName = "Raphael\'s Vulpine Rapier";
         RRAPIER = _loc8_;
         RIDINGC = new Weapon("RidingC","Riding Crop","riding crop","a riding crop",["strike"],5,50,"This riding crop appears to be made of black leather, and could be quite a painful (or exciting) weapon.",["1H Blunt","非钝器"]);
         PTCHFRK = new Weapon("PtchFrk","Pitchfork","pitchfork","a pitchfork",["stab"],10,200,"An ordinary pitchfork intended for farm work. It can also double as a stabbing weapon.",["Spear"]);
         PIPE = new Weapon("Pipe   ","Pipe","pipe","a pipe",["swing","smash"],5,25,"A simple rusted pipe of unknown origins. It\'s hefty and could probably be used as an effective bludgeoning tool.",["1H Blunt"]);
         NEPHSCEPT = new NephilaScepter();
         MRAPIER = new MidnightRapier();
         MACE = new Weapon("Mace   ","Mace","mace","a mace",["swing","smash"],9,100,"A weapon designed to crush an opponent\'s defense.",["1H Blunt"],0.6);
         _g3 = Weapon.WEAPONEFFECTS;
         chance = 100;
         baseTease1 = 25;
         playerCorRatio1 = 10;
         _loc9_ = new Weapon("L. Whip","Lethice\'s Whip","flaming whip","a flaming whip",["lash"],16,2000,"This whip once belonged to Lethice, who was defeated at your hands. It gives off flames when you crack it.",["Whip"],1,[function():void
         {
            _g3.corruptedTease(chance,baseTease1,playerCorRatio1);
         }]);
         _loc9_._headerName = "Lethice\'s Whip";
         L_WHIP = _loc9_;
         L_STAFF = new LethiciteStaff();
         _loc10_ = new Weapon("L.Avngr","Rail Avenger","Light Rail Avenger","The Light Rail Avenger",["slash"],0,0,"This beautiful katana was said to be crafted by the gods themselves, at the beginning of time. Their chosen warrior fell to the demon menace, but they have found a new one to take up the Way of the Blade. Ordinary men cannot wield the true power of this blade.",["2H Sword","武士刀"],10);
         _loc10_._headerName = "The Light Rail Avenger";
         LRAVENG = _loc10_;
         _loc11_ = new LargeHammer();
         _loc11_._headerName = "Marble\'s Hammer";
         L_HAMMR = _loc11_;
         _g4 = Weapon.WEAPONEFFECTS;
         _loc12_ = new Weapon("L.Daggr","Lust Dagger","lust-enchanted dagger","an aphrodisiac-coated dagger",["stab"],3,150,"A dagger with a short blade in a wavy pattern. Its edge seems to have been enchanted to always be covered in a light aphrodisiac to arouse anything cut with it.",["催情武器","Knife"],1,[function():void
         {
            _g4.lustPoison();
         }]);
         _loc12_._headerName = "Lust Dagger";
         L_DAGGR = _loc12_;
         L__AXE = new Weapon("L. Axe ","Large Axe","large axe","an axe large enough for a minotaur",["cleave"],20,100,"This massive axe once belonged to a minotaur. It\'d be hard for anyone smaller than a giant to wield effectively. The axe is double-bladed and deadly-looking. Requires height of 6\'6\" or 90 strength.",["Axe","大型"],1,null,0,-10);
         _loc13_ = new Weapon("KihaAxe","Kiha\'s Greataxe","double-bladed axe","a double-bladed axe",["cleave"],15,1000,"The large, double-bladed axe once wielded by Kiha. It no longer radiates its former heat.",["Axe","大型"]);
         _loc13_._headerName = "Kiha\'s Greataxe";
         KIHAAXE = _loc13_;
         KATANA = new Weapon("Katana ","Katana","katana","a katana",["cut"],10,500,"A curved bladed weapon that cuts through flesh with the greatest of ease.",["1H Sword","武士刀"]);
         JRAPIER = new JeweledRapier();
         ICESTAFF = new IceWeapon(6);
         ICESCYTHE = new IceWeapon(5);
         ICEDAGGER = new IceWeapon(4);
         ICESWORD = new IceWeapon(3);
         ICESPEAR = new IceWeapon(2);
         ICEMACE = new IceWeapon(1);
         ICEAXE = new IceWeapon(0);
         HNTCANE = new HuntsmansCane();
         _g5 = Weapon.WEAPONEFFECTS;
         _g11 = Weapon.WEAPONEFFECTS;
         _loc14_ = new Weapon("H.Gaunt","HookedGauntlets","hooked gauntlets","a set of hooked gauntlets",["punch"],8,300,"These metal gauntlets are covered in nasty looking hooks that are sure to tear at your foes flesh and cause them harm.",["Fist"],1,[function():void
         {
            _g5.stun();
         },function():void
         {
            _g11.bleed();
         }]);
         _loc14_._plural = true;
         _loc15_ = _loc14_;
         _loc15_._singular = "hooked gauntlet";
         H_GAUNT = _loc15_;
         G_KNUCKLE = new GeodeKnuckle();
         _loc16_ = new Weapon("FLngSrd","Fine Longsword","fine longsword","a fine longsword",["slash"],13,1150,"A fine, elegant longsword, slightly smaller than its brethren. Simple and unassuming at first glance, it actually seems to be custom-made, as an elaborate motif of falcons and lilies is etched into the fittings and scabbard. The blade itself is excellently balanced for anyone looking for a nimble, easy-to-handle weapon.",["1H Sword"],0.85);
         _loc16_._headerName = "Fine Longsword";
         FLNGSRD = _loc16_;
         FLMHRTSPEAR = new FlameheartSpear();
         FLINTLK = new Weapon("Flintlk","Flintlock Pistol","flintlock pistol","a flintlock pistol",["shot","shoot"],14,250,"A firearm using a flint striking ignition mechanism. As the flint is struck, the black powder inside is detonated and propels the loaded lead ball forward at breakneck speed, putting anything in its path in harm\'s way. Speed has a factor in how much damage is dealt.",["Firearm"],0.7,null,4,10);
         FLAIL = new Weapon("Flail  ","Flail","flail","a flail",["swing","smash"],10,200,"A weapon consisting of a metal spiked ball attached to a stick by chain. Be careful with this as you might end up injuring yourself.",["1H Blunt"]);
         FINALARG = new Weapon("Final Argument","Final Argument","Final Argument","Anne\'s rifle",["shot","shoot"],30,2000,"Anne Marie\'s favored weapon. A massive, single fire, breech loaded rifle. It is deadly accurate, and a single shot is usually more than enough to kill anything that moves.",["Firearm"],0.5,[Weapon.WEAPONEFFECTS.strongRecoil],1,15);
         FEL_AXE = new FelAxe();
         E_STAFF = new EldritchStaff();
         _g6 = Weapon.WEAPONEFFECTS;
         _loc17_ = new Weapon("Dullsc","Dullahan Scythe","cursed scythe","a dullahan\'s scythe",["slash"],25,2500,"A gift from the Dullahan, this scythe boasts tremendous killing potential, at a cost.",["大型","Scythe"],1,[function():void
         {
            _g6.dullahanDrain();
         }]);
         _loc17_._headerName = "Dullahan\'s Scythe";
         DULLSC = _loc17_;
         _loc18_ = new Weapon("Dagger ","Dagger","dagger","a dagger",["stab"],4,40,"A small blade. The preferred weapon for rogues.",["狡诈","Knife"]);
         _loc18_.boost("武器暴击率",NumberFunc_Impl_.fromInt(15),false);
         _loc19_ = _loc18_;
         _loc19_.boost("暴击伤害",NumberFunc_Impl_.fromFloat(0.7),true);
         DAGGER = _loc19_;
         CROSSBW = new Weapon("Crossbw","Crossbow","crossbow","a crossbow",["shot","shoot"],11,200,"This weapon fires bolts at your enemies.",["Crossbow"],0.7);
         CTSWRD = new Weapon("CheatSword","Cheat Sword","cheat sword","a sword for cheaters",["cheat"],9999999,0,"This sword was created by a person who just wanted to kill things really fast to see if they were working properly. Most of the time, they were not.",["1H Sword","远程"],0,null,0,99);
         CLAYMOR = new LargeClaymore();
         CDAGGER = new CursedDagger();
         BLUNDER = new Blunderbuss();
         B_SCARB = new Weapon("B.ScarB","B.Scarred Blade","broken scarred blade","a broken scarred blade",["slash"],12,1000,"This saber, made from lethicite-imbued metal, seems to no longer seek flesh. Whatever demonic properties in this weapon are gone now, but it\'s still an effective weapon.",["1H Sword"]);
         B_SWORD = new BeautifulSword();
         BAT = new Weapon("Bat","Bat","bat","a bat",["swing","smash"],7,50,"A wooden club that slowly widens from handle to tip.",["1H Blunt"]);
      }
   }
}

