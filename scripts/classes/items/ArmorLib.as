package classes.items
{
   import classes.PerkLib;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.armors.AdventurersLewdChain;
   import classes.items.armors.ArmorWithPerk;
   import classes.items.armors.BalletDress;
   import classes.items.armors.BeeArmor;
   import classes.items.armors.CheerleaderOutfit;
   import classes.items.armors.ComfortableClothes;
   import classes.items.armors.GooArmor;
   import classes.items.armors.InquisitorsCorset;
   import classes.items.armors.InquisitorsRobes;
   import classes.items.armors.IvoryCorset;
   import classes.items.armors.LeatherArmorSegments;
   import classes.items.armors.LethiciteArmor;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.armors.MaraeArmor;
   import classes.items.armors.MothSilkDress;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.items.armors.NephilaQueensGown;
   import classes.items.armors.PureMaraeArmor;
   import classes.items.armors.SeductiveArmor;
   import classes.items.armors.SeductiveArmorUntrapped;
   import classes.items.armors.SluttySwimwear;
   import classes.items.armors.VineArmor;
   import flash.Boot;
   
   public final class ArmorLib
   {
      
      public static var init__:Boolean;
      
      public static var NOTHING:Armor;
      
      public var YORHARM:ArmorWithPerk;
      
      public var W_ROBES:Armor;
      
      public var VINARMR:VineArmor;
      
      public var URTALTA:LeatherArmorSegments;
      
      public var T_BSUIT:Armor;
      
      public var TUBETOP:Armor;
      
      public var TRTLNCK:Armor;
      
      public var TBARMOR:Armor;
      
      public var TATTERL:Armor;
      
      public var S_SWMWR:SluttySwimwear;
      
      public var S_DRESS:Armor;
      
      public var SS_ROBE:Armor;
      
      public var SSDRESS:Armor;
      
      public var SSARMOR:Armor;
      
      public var SEDUCTU:SeductiveArmorUntrapped;
      
      public var SEDUCTA:SeductiveArmor;
      
      public var SCHLGRL:Armor;
      
      public var SCALEML:Armor;
      
      public var SAMUARM:Armor;
      
      public var R_BDYST:Armor;
      
      public var RBBRCLT:Armor;
      
      public var OVERALL:Armor;
      
      public var NURSECL:Armor;
      
      public var NQGOWN:Armor;
      
      public var NNUNHAB:NaughtyNunsHabit;
      
      public var M_ROBES:Armor;
      
      public var M_DRESS:Armor;
      
      public var MSDRESS:MothSilkDress;
      
      public var LTHRROB:Armor;
      
      public var LTHRPNT:Armor;
      
      public var LTHCARM:LethiciteArmor;
      
      public var LMARMOR:LustyMaidensArmor;
      
      public var LEATHRA:Armor;
      
      public var KIMONO:Armor;
      
      public var I_ROBES:InquisitorsRobes;
      
      public var I_CORST:InquisitorsCorset;
      
      public var IVCRSET:IvoryCorset;
      
      public var INDECST:Armor;
      
      public var GOOARMR:GooArmor;
      
      public var GOLARMR:Armor;
      
      public var GELARMR:Armor;
      
      public var FULLPLT:Armor;
      
      public var FULLCHN:Armor;
      
      public var EBNROBE:Armor;
      
      public var EBNJACK:Armor;
      
      public var EBNIROB:Armor;
      
      public var EBNARMR:Armor;
      
      public var DSCLROB:Armor;
      
      public var DSCLARM:Armor;
      
      public var DBARMOR:Armor;
      
      public var C_CLOTH:ComfortableClothes;
      
      public var CLSSYCL:Armor;
      
      public var CHTARMR:Armor;
      
      public var CHROTFT:CheerleaderOutfit;
      
      public var CHNGSAM:Armor;
      
      public var CHBIKNI:Armor;
      
      public var B_DRESS:Armor;
      
      public var B_CLOAK:Armor;
      
      public var BUTSUIT:Armor;
      
      public var BONSTRP:Armor;
      
      public var BIMBOSK:Armor;
      
      public var BEEARMR:Armor;
      
      public var BALLETD:BalletDress;
      
      public var ADVNCHN:Armor;
      
      public var ADVLCHN:AdventurersLewdChain;
      
      public var ADVCLTH:Armor;
      
      public function ArmorLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ADVLCHN = new AdventurersLewdChain();
         ADVNCHN = new Armor("AdvNChn","Kokiri Chain","green adventurer\'s tunic-over-chainmail","a green adventurer\'s tunic-over-chainmail outfit, complete with pointed cap",10,300,"A set of comfortable green adventurer\'s clothes over well made chainmail. It comes complete with a pointed hat.","Medium");
         TATTERL = new Armor("TatterL","Tattered Leather","tattered leather armor","a set of tattered leather armor",3,50,"A suit of damaged leather armor. It\'s definitely seen better days, but it still offers some protection.","Light");
         var _loc1_:Armor = new Armor("Chtarmr","Cheat Armor","cheat armor","an armor for cheaters",85,0,"An armor for cheaters that want to get pummeled without dying, or for debugging.");
         _loc1_.boost("最大生命值",NumberFunc_Impl_.fromInt(100),true);
         var _loc2_:Armor = _loc1_;
         _loc2_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(100),false);
         CHTARMR = _loc2_;
         var _loc3_:VineArmor = new VineArmor();
         _loc3_._headerName = "Obsidian Vines";
         VINARMR = _loc3_;
         var _loc4_:ArmorWithPerk = new ArmorWithPerk("Y.Armor","Yorham Armor","Yorham Scout Armor","a Yorham Scout Armor",5,2000,"This intricately designed armor is used by Yorham\'s scouts, who have to be quick on their feet and wits. Straps and holsters for vials and various other tools are spread throughout the many straps and belts, allowing for quick access. The thick, black leather offers poor protection, however.","Light",PerkLib.QuickPockets,0,0,0,0,"The first item used in a turn does not end it.");
         _loc4_._headerName = "Yorham Scout Armor";
         YORHARM = _loc4_;
         var _loc5_:Armor = new Armor("W.Robes","Wizard Robes","wizard\'s robes","a wizard\'s robes",1,50,"These robes appear to have once belonged to a female wizard. They\'re long, with a slit up the side and full billowing sleeves. The top is surprisingly low cut. Somehow you know wearing it would aid your spellcasting.","Light");
         _loc5_.boost("法术消耗",NumberFunc_Impl_.fromInt(-25),false);
         W_ROBES = _loc5_;
         var _loc6_:Armor = new Armor("SSArmor","S.Silk Armor","spider-silk armor","a suit of spider-silk armor",25,950,"A set of armor made from spider silk, as white as the driven snow. It\'s crafted out of thousands of strands of spider-silk into an impenetrable protective suit. The surface is slightly spongy, but so tough you wager most blows would bounce right off.","Heavy");
         _loc6_._headerName = "Spider-Silk Armor";
         SSARMOR = _loc6_;
         var _loc7_:Armor = new Armor("SS.Robe","S.Silk Robes","spider-silk robes","a set of spider-silk robes",6,950,"An incredibly comfortable looking set of robes. They\'re made from alchemically enhanced spider-silk, and embroidered with what looks like magical glyphs around the sleeves and hood.","Light");
         _loc7_.boost("法术消耗",NumberFunc_Impl_.fromInt(-30),false);
         var _loc8_:Armor = _loc7_;
         _loc8_._headerName = "Spider-Silk Robes";
         SS_ROBE = _loc8_;
         var _loc9_:SeductiveArmorUntrapped = new SeductiveArmorUntrapped();
         _loc9_._headerName = "Untrapped Seductive Armor";
         SEDUCTU = _loc9_;
         var _loc10_:SeductiveArmor = new SeductiveArmor();
         _loc10_._headerName = "Seductive Armor";
         SEDUCTA = _loc10_;
         var _loc11_:Armor = new Armor("ScaleMl","Scale Armor","scale-mail armor","a set of scale-mail armor",12,170,"A suit of scale-mail that covers the entire body with layered steel scales, providing flexibility and protection.","Heavy");
         _loc11_._headerName = "Scale-Mail Armor";
         SCALEML = _loc11_;
         SAMUARM = new Armor("SamuArm","Samurai Armor","samurai armor","a suit of samurai armor",18,300,"A suit of armor originally worn by warriors from the far east.","Heavy");
         var _loc12_:MaraeArmor = new MaraeArmor();
         _loc12_._headerName = "Tentacled Bark Armor";
         TBARMOR = _loc12_;
         var _loc13_:NephilaQueensGown = new NephilaQueensGown();
         _loc13_._headerName = "Nephila Queen\'s Gown";
         NQGOWN = _loc13_;
         LTHRROB = new Armor("LthrRob","Leather Robes","black leather armor surrounded by voluminous robes","a suit of black leather armor with voluminous robes",6,100,"This is a suit of flexible leather armor with a voluminous set of concealing black robes.","Light");
         LTHCARM = new LethiciteArmor();
         var _loc14_:LustyMaidensArmor = new LustyMaidensArmor();
         _loc14_._headerName = "Lusty Maiden\'s Armor";
         LMARMOR = _loc14_;
         var _loc15_:LeatherArmorSegments = new LeatherArmorSegments();
         _loc15_._headerName = "Urta\'s Leather Armor Segments";
         URTALTA = _loc15_;
         NNUNHAB = new NaughtyNunsHabit();
         LEATHRA = new Armor("LeathrA","Leather Armor","leather armor segments","a set of leather armor",5,76,"A suit of well-made leather armor. It looks fairly rugged.","Light");
         IVCRSET = new IvoryCorset();
         var _loc16_:Armor = new Armor("IndecSt","Skimpy Armor","practically indecent steel armor","a suit of practically indecent steel armor",5,800,"A suit of steel \"armor\". It consists of two round disks that barely cover the nipples, a tight chainmail bikini, and two circular butt plates.","Medium");
         _loc16_.boost("挑逗几率",NumberFunc_Impl_.fromInt(6),false);
         var _loc17_:Armor = _loc16_;
         _loc17_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(6),false);
         var _loc18_:Armor = _loc17_;
         _loc18_._headerName = "Skimpy Steel Armor";
         INDECST = _loc18_;
         var _loc19_:InquisitorsRobes = new InquisitorsRobes();
         _loc19_._headerName = "Inquisitor\'s Robes";
         I_ROBES = _loc19_;
         var _loc20_:InquisitorsCorset = new InquisitorsCorset();
         _loc20_._headerName = "Inquisitor\'s Corset";
         I_CORST = _loc20_;
         var _loc21_:GooArmor = new GooArmor();
         _loc21_._headerName = "Valeria, the Goo-Girl Armor";
         GOOARMR = _loc21_;
         GOLARMR = new Armor("GolArmr","Golem Armor","golem plate armor","a suit of golem armor",30,3000,"A full suit of armor that was fashioned from a golem\'s heart. It provides excellent protection and can occasionally damage enemies that attack you.","Heavy");
         GELARMR = new Armor("GelArmr","Gel Armor","glistening gel-armor plates","a suit of gel armor",10,150,"A suit comprised of interlocking plates made from green gel-like material. It feels spongy to the touch, but is amazingly resilient.","Heavy");
         var _loc22_:Armor = new Armor("FullPlt","Plate Armor","full platemail","a suit of full-plate armor",21,250,"A highly protective suit of steel platemail. It would be hard to find better physical protection than this.","Heavy");
         _loc22_._headerName = "Full-Plate Armor";
         FULLPLT = _loc22_;
         var _loc23_:Armor = new Armor("FullChn","Chainmail","full-body chainmail","a full suit of chainmail armor",8,150,"A full suit of chainmail armor that covers its wearer from head to toe in protective steel rings.","Medium");
         _loc23_._headerName = "Chainmail Armor";
         FULLCHN = _loc23_;
         var _loc24_:Armor = new Armor("EWIRobe","I.Ebon Robes","indecent ebonweave robe","an indecent ebonweave robe",6,3000,"A set of robes fashioned from ebonweave. It\'s more of a longcoat than a robe, and discrete straps centered around the belt keep the front open.","Light",true);
         _loc24_.boost("法术消耗",NumberFunc_Impl_.fromInt(-30),false);
         var _loc25_:Armor = _loc24_;
         _loc25_.boost("挑逗几率",NumberFunc_Impl_.fromInt(5),false);
         var _loc26_:Armor = _loc25_;
         _loc26_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
         var _loc27_:Armor = _loc26_;
         _loc27_._headerName = "Indecent Ebonweave Robes";
         EBNIROB = _loc27_;
         var _loc28_:Armor = new Armor("EW Robe","Ebon Robes","ebonweave robes","ebonweave robes",9,3000,"A set of robes fashioned from ebonweave. They are quite comfortable, and more protective than ordinary chainmail, with a slight magical aura seeping from them.","Medium");
         _loc28_.boost("法术消耗",NumberFunc_Impl_.fromInt(-30),false);
         var _loc29_:Armor = _loc28_;
         _loc29_._headerName = "Ebonweave Robes";
         EBNROBE = _loc29_;
         var _loc30_:Armor = new Armor("EWJackt","Ebon Jacket","ebonweave jacket","an ebonweave jacket",18,3000,"A jacket made from ebonweave. The outfit consists of a leather-like jacket and a mesh breastplate.","Medium");
         _loc30_.boost("法术消耗",NumberFunc_Impl_.fromInt(-15),false);
         var _loc31_:Armor = _loc30_;
         _loc31_._headerName = "Ebonweave Jacket";
         EBNJACK = _loc31_;
         var _loc32_:Armor = new Armor("EWPlate","Ebon Plate","ebonweave platemail","a set of ebonweave platemail",27,3000,"A set of platemail made from ebonweave. The armor consists of an outer layer of ebonweave plating and an inner material of softer, yet just as durable ebonweave cloth.","Heavy");
         _loc32_.boost("法术消耗",NumberFunc_Impl_.fromInt(-15),false);
         var _loc33_:Armor = _loc32_;
         _loc33_._headerName = "Ebonweave Platemail";
         EBNARMR = _loc33_;
         var _loc34_:Armor = new Armor("DSclRob","D.Scale Robes","dragonscale robes","a dragonscale robe",9,900,"A robe expertly made from dragon scales. It offers high protection while being lightweight, and should be comfortable to wear all day.","Light");
         _loc34_.boost("法术消耗",NumberFunc_Impl_.fromInt(-20),false);
         var _loc35_:Armor = _loc34_;
         _loc35_._headerName = "Dragon Scale Robes";
         DSCLROB = _loc35_;
         var _loc36_:Armor = new Armor("DSclArm","D.Scale Armor","dragonscale armor","a suit of dragonscale armor",18,900,"A set of armor cleverly fashioned from dragon scales. It offers high protection and is quite flexible at the same time.","Medium");
         _loc36_._headerName = "Dragon Scale Armor";
         DSCLARM = _loc36_;
         var _loc37_:PureMaraeArmor = new PureMaraeArmor();
         _loc37_._headerName = "Divine Bark Armor";
         DBARMOR = _loc37_;
         var _loc38_:Armor = new Armor("ChBikni","Chain Bikini","revealing chainmail bikini","a chainmail bikini",2,700,"A revealing chainmail bikini that barely covers anything. The bottom half is little more than a triangle of metal and a leather thong.","Light",false,false);
         _loc38_.boost("挑逗几率",NumberFunc_Impl_.fromInt(5),false);
         var _loc39_:Armor = _loc38_;
         _loc39_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(5),false);
         var _loc40_:Armor = _loc39_;
         _loc40_._headerName = "Chainmail Bikini";
         CHBIKNI = _loc40_;
         BEEARMR = new BeeArmor();
         var _loc41_:Armor = new Armor("SSDress","S.Silk Dress","spider-silk dress","a spider-silk dress",5,950,"A comfortable dress made of pearl-white spider-silk. Its adjustable waist sash and the allure of exposing much of one\'s back and shoulders combine with a flowing skirt and sleeves that fan out wide, mimicking a [if (isfeminine) {witch|mage}]\'s robe. The runes swirling around the hems complete that image well.","Light");
         _loc41_.boost("法术消耗",NumberFunc_Impl_.fromInt(-15),false);
         var _loc42_:Armor = _loc41_;
         _loc42_.boost("挑逗几率",NumberFunc_Impl_.fromInt(2),false);
         var _loc43_:Armor = _loc42_;
         _loc43_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(2),false);
         var _loc44_:Armor = _loc43_;
         _loc44_._headerName = "Spider-Silk Dress";
         SSDRESS = _loc44_;
         var _loc45_:Armor = new Armor("SchlGirl","SchoolUniform","school uniform","a school uniform",0,200,"A type of light school uniform, typically worn by female students in certain parts of the world. Consists of a blouse, vest, skirt, and a ribbon around the neck.","Light");
         _loc45_._headerName = "School Uniform";
         SCHLGRL = _loc45_;
         MSDRESS = new MothSilkDress();
         TRTLNCK = new Armor("Trtlnck","Turtleneck","turtleneck sweater","a large turtleneck sweater",0,260,"A warm, oversized sweater, made of thick sheep wool. Ideal for the cold winter months and cuddling with your loved ones.","Light");
         TUBETOP = new Armor("TubeTop","Tube Top","tube top and short shorts","a snug tube top and [b: very] short shorts",0,80,"A clingy tube top and [b: very] short shorts.","Light");
         var _loc46_:Armor = new Armor("T.BSuit","Bodysuit","semi-transparent bodysuit","a semi-transparent, curve-hugging bodysuit",0,1300,"A semi-transparent bodysuit. It looks like it will cling to all the curves of your body.","Light");
         _loc46_.boost("挑逗几率",NumberFunc_Impl_.fromInt(7),false);
         var _loc47_:Armor = _loc46_;
         _loc47_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(7),false);
         T_BSUIT = _loc47_;
         S_DRESS = new Armor("S.Dress","Summer Dress","summer dress","a summer dress",0,210,"A modest, light dress adorned with ruffles and designed for the warmer months of the year. Its loose fit and lack of sleeves make it quite an airy garment. Comes with a straw hat to complete the ready-for-summer-look. Beware of sudden breezes.","Light");
         S_SWMWR = new SluttySwimwear();
         var _loc48_:Armor = new Armor("RbbrClt","Fetish Wear","rubber fetish clothes","a set of revealing rubber fetish clothes",3,1000,"A revealing set of rubber fetish wear.","Light",true,false);
         _loc48_.boost("挑逗几率",NumberFunc_Impl_.fromInt(8),false);
         var _loc49_:Armor = _loc48_;
         _loc49_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(8),false);
         var _loc50_:Armor = _loc49_;
         _loc50_._headerName = "Rubber Fetish Wear";
         RBBRCLT = _loc50_;
         R_BDYST = new Armor("R.BdySt","Red Bodysuit","red, high-society bodysuit","a red bodysuit for high society",1,1200,"A high society bodysuit. It is as easy to mistake it for ballroom apparel as it is for boudoir lingerie. The thin transparent fabric is so light and airy that it makes avoiding blows a second nature.","Light",true,false);
         OVERALL = new Armor("Overall","Overalls","white shirt and overalls","a white shirt and overalls",0,60,"A simple white shirt with overalls.","Light",true);
         var _loc51_:Armor = new Armor("NurseCl","Nurse Outfit","skimpy nurse\'s outfit","a nurse\'s outfit",0,800,"A borderline obscene nurse\'s outfit that looks like it would barely reach its wearer\'s hips and crotch. The midriff is totally exposed, and the white top leaves plenty of room for cleavage. A tiny white hat tops off the whole ensemble.","Light");
         _loc51_.boost("挑逗几率",NumberFunc_Impl_.fromInt(8),false);
         var _loc52_:Armor = _loc51_;
         _loc52_.boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(1),false);
         var _loc53_:Armor = _loc52_;
         _loc53_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(8),false);
         NURSECL = _loc53_;
         M_ROBES = new Armor("M.Robes","Modest Robes","modest robes","a set of modest robes",0,120,"A set of modest robes, not dissimilar from what the monks back home would wear.","Light");
         var _loc54_:Armor = new Armor("M.Dress","Maid Dress","maid dress","a frilly maid dress",0,450,"A stereotypical maid\'s outfit, complete with half-apron, stockings, headpiece, and lots of lace and frills. Feather duster not included.","Light");
         _loc54_.boost("挑逗几率",NumberFunc_Impl_.fromInt(1),false);
         var _loc55_:Armor = _loc54_;
         _loc55_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(1),false);
         M_DRESS = _loc55_;
         var _loc56_:Armor = new Armor("LthrPnt","Leather Pants","white silk shirt and tight leather pants","a pair of leather pants and a white silk shirt",0,450,"A flowing silk shirt and tight black leather pants. Suave!","Light");
         _loc56_._headerName = "Leather Pants Outfit";
         LTHRPNT = _loc56_;
         KIMONO = new Armor("Kimono ","Kimono ","kimono","a traditional kimono",2,500,"An eastern-style formal robe. It\'s long enough to extend to the ankles and has wide sleeves. It comes complete with a sash to secure it properly.","Light");
         CLSSYCL = new Armor("ClssyCl","Suitclothes","classy suitclothes","a set of classy suitclothes",1,400,"A set of classy suitclothes.","Light");
         var _loc57_:Armor = new Armor("Chngsam","China Dress","cheongsam","a cheongsam",0,400,"A long, body-hugging dress of foreign design, bearing elaborate embroidery. Two long slits down from the thighs provide allure as well as ease of movement when necessary.","Light");
         _loc57_.boost("挑逗几率",NumberFunc_Impl_.fromInt(2),false);
         var _loc58_:Armor = _loc57_;
         _loc58_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(2),false);
         CHNGSAM = _loc58_;
         CHROTFT = new CheerleaderOutfit();
         var _loc59_:ComfortableClothes = new ComfortableClothes();
         _loc59_._headerName = "Comfortable Clothes";
         C_CLOTH = _loc59_;
         BUTSUIT = new Armor("ButSuit","Butler Suit","butler suit","an elegant butler suit",0,580,"A classy butler\'s suit. The set consists of shirt, waistcoat, tailcoat, suit pants, dress shoes, a pair of satin gloves, and the choice between a bow- or necktie.","Light");
         var _loc60_:Armor = new Armor("BonStrp","BondageStraps","barely-decent bondage straps","a set of bondage straps",0,600,"These leather straps and well-placed hooks are actually designed in such a way as to be worn as clothing. While they technically would cover your naughty bits, virtually every other inch of your body would be exposed.","Light",false,false);
         _loc60_.boost("挑逗几率",NumberFunc_Impl_.fromInt(8),false);
         var _loc61_:Armor = _loc60_;
         _loc61_.boost("挑逗伤害",NumberFunc_Impl_.fromInt(8),false);
         var _loc62_:Armor = _loc61_;
         _loc62_._headerName = "Bondage Straps";
         BONSTRP = _loc62_;
         B_CLOAK = new Armor("B.Cloak","Black Cloak","black cloak","a long, silky, black cloak with a large, popped-up collar",0,150,"A long, silky, black cloak with a large collar that can be popped up. That\'s all there is to it. Maybe you can use it to flash people on a regular basis.","Light");
         BIMBOSK = new Armor("BimboSk","Bimbo Outfit","bimbo skirt","a skirt that looks like it belongs on a bimbo",0,50,"A tight, cleavage-inducing halter top and an extremely short miniskirt. The sexual allure of this item is undoubtable.","Light");
         BALLETD = new BalletDress();
         var _loc63_:Armor = new Armor("B.Dress","BallroomDress","long ballroom dress patterned with sequins","a ballroom dress patterned with sequins",0,1200,"A long, beautiful ballroom dress patterned with sequins. Perfect for important occasions.","Light");
         _loc63_._headerName = "Ballroom Dress";
         B_DRESS = _loc63_;
         ADVCLTH = new Armor("AdvClth","Kokiri Clothes","green adventurer\'s clothes","a green adventurer\'s outfit, complete with pointed cap",2,200,"A set of comfortable green adventurer\'s clothes. It comes complete with a pointed hat.","Light");
      }
   }
}

