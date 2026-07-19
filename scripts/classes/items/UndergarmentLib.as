package classes.items
{
   import classes.PerkLib;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.undergarments.NobleShirt;
   import classes.items.undergarments.UndergarmentWithPerk;
   import flash.Boot;
   
   public final class UndergarmentLib
   {
      
      public static var init__:Boolean;
      
      public static var NOTHING:Undergarment;
      
      public static var DEFAULT_VALUE:Number = 6;
      
      public static var TYPE_UPPERWEAR:int = 0;
      
      public static var TYPE_LOWERWEAR:int = 1;
      
      public static var TYPE_FULLWEAR:int = 2;
      
      public var WHPANTY:Undergarment;
      
      public var SS_LOIN:Undergarment;
      
      public var SS_BRA:Undergarment;
      
      public var SSPANTY:Undergarment;
      
      public var SHR_PAN:Undergarment;
      
      public var SHR_BRA:Undergarment;
      
      public var SHRBYDL:Undergarment;
      
      public var SEA_SHIRT:NobleShirt;
      
      public var PSTRPAN:Undergarment;
      
      public var PSTRBRA:Undergarment;
      
      public var PHPANTY:Undergarment;
      
      public var PANHOSE:Undergarment;
      
      public var NPNTYHS:Undergarment;
      
      public var MOTHPAN:Undergarment;
      
      public var LTX_BRA:Undergarment;
      
      public var LTXTHNG:Undergarment;
      
      public var LTXSHRT:Undergarment;
      
      public var LOLIPAN:Undergarment;
      
      public var LOLIBRA:Undergarment;
      
      public var LACEPAN:Undergarment;
      
      public var LACEBRA:Undergarment;
      
      public var GARTERS:Undergarment;
      
      public var FURLOIN:Undergarment;
      
      public var FUNDOSH:Undergarment;
      
      public var FRILPAN:Undergarment;
      
      public var FRILBRA:Undergarment;
      
      public var EBNVEST:Undergarment;
      
      public var EBNTHNG:Undergarment;
      
      public var EBNRTNG:Undergarment;
      
      public var EBNRLNC:Undergarment;
      
      public var EBNRJCK:Undergarment;
      
      public var EBNJOCK:Undergarment;
      
      public var EBNCRST:Undergarment;
      
      public var EBNCLTH:Undergarment;
      
      public var DS_LOIN:Undergarment;
      
      public var DS_BRA:Undergarment;
      
      public var DSTHONG:Undergarment;
      
      public var C_PANTY:Undergarment;
      
      public var C_LOIN:Undergarment;
      
      public var C_BRA:Undergarment;
      
      public var BSTRPAN:Undergarment;
      
      public var BSTRBRA:Undergarment;
      
      public var BLOOMER:Undergarment;
      
      public var BBYDOLL:Undergarment;
      
      public function UndergarmentLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:Undergarment = new Undergarment("MothPan","M.Silk Panties","moth-silk panties","a pair of moth-silk panties",1,500,"These intricately designed panties were woven from your daughter\'s silk. Although their pure-white color makes them look fairly innocent, something about them seems strangely sensual.",4);
         _loc1_.boost("欲望抗性",NumberFunc_Impl_.fromInt(-10),false);
         var _loc2_:Undergarment = _loc1_;
         _loc2_._headerName = "Moth-Silk Panties";
         MOTHPAN = _loc2_;
         PANHOSE = new Undergarment("PanHose","Pantyhose","pantyhose and panties","a pair of pantyhose and panties",1,70,"A set consisting of a pair of pantyhose with some quite comfortable panties underneath.",1);
         var _loc3_:Undergarment = new Undergarment("NPntyHs","N.Pantyhose","pantyhose","a pair of pantyhose",1,40,"A simple pair of pantyhose. As they do not come with panties, you will be going commando underneath.",1);
         _loc3_._headerName = "Naked Pantyhose";
         NPNTYHS = _loc3_;
         PSTRPAN = new Undergarment("PStrPan","P.StripedPanties","pink-white striped panties","a pair of pink-and-white striped panties",1,50,"A pair of relatively simple, horizontally striped panties in pink and white. They have an air of cute, innocent youthfulness to them.",1);
         BSTRPAN = new Undergarment("BStrPan","B.StripedPanties","blue-white striped panties","a pair of blue-and-white striped panties",1,50,"A pair of relatively simple, horizontally striped panties in blue and white. Considered a timeless classic among some circles.",1);
         FRILPAN = new Undergarment("FrilPan","Frilly Panties","frilly panties","a pair of frilly panties",1,50,"A pair of cute panties, with frills along the edges.",1);
         SHR_PAN = new Undergarment("Shr Pan","Sheer Panties","sheer panties","a pair of sheer panties",1,140,"A pair of rather provocative panties. Made of see-through fabric, they conceal nothing.",3);
         LACEPAN = new Undergarment("LacePan","Lace Panties","lace panties","a pair of lace panties",1,60,"A pair of patterned panties, made of lace. The fabric is quite comfortable to the touch.",2);
         WHPANTY = new Undergarment("WHPanty","W.HeartPanties","white-hearted panties","a pair of pink panties with white hearts",1,30,"A pair of innocent, light-pink cotton panties, fashioned with a generous sprinkle of white hearts across their soft fabric. Especially popular with very young girls of all upbringings.");
         PHPANTY = new Undergarment("PHPanty","P.HeartPanties","pink-hearted panties","a pair of white panties with pink hearts",1,30,"A pair of innocent, white cotton panties, fashioned with a generous sprinkle of light-pink hearts across their soft fabric. Quite popular with little girls of all upbringings.");
         EBNRLNC = new UndergarmentWithPerk("RnCloth","Runed L.Cloth","runed ebonweave loincloth","a runed ebonweave loincloth",1,1200,"A loincloth made from ebonweave. Adorning the front is a rune of lust, glowing with magic.",3,3,PerkLib.WellspringOfLust,0,0,0,0,"At the beginning of combat, lust raises to black magic threshold if lust is below black magic threshold.","TailLegWearable");
         EBNRTNG = new UndergarmentWithPerk("RnThong","Runed Thong","runed ebonweave thong","a runed ebonweave thong",1,1200,"A thong made from ebonweave. Adorning the front is a rune of lust, glowing with magic.",3,3,PerkLib.WellspringOfLust,0,0,0,0,"At the beginning of combat, lust raises to black magic threshold if lust is below black magic threshold.");
         EBNRJCK = new UndergarmentWithPerk("RnStrap","Runed Jock","runed ebonweave jockstrap","a runed ebonweave jockstrap",1,1200,"A jockstrap made from ebonweave. Adorning the pouch is a rune of lust, glowing with magic.",3,3,PerkLib.WellspringOfLust,0,0,0,0,"At the beginning of combat, lust raises to black magic threshold if lust is below black magic threshold.");
         EBNCLTH = new Undergarment("EWCloth","Ebon Loin","ebonweave loincloth","an ebonweave loincloth",1,900,"A loincloth made from ebonweave. It\'s designed to fit snugly around any form, and due to the alchemic treatment, it\'s elastic enough to hold assets of any size.",2,3,"TailLegWearable");
         EBNTHNG = new Undergarment("EWThong","Ebon Thong","ebonweave thong","an ebonweave thong",1,900,"A thong made from ebonweave. It\'s designed to fit snugly around any form, and due to the alchemic treatment, it\'s elastic enough to hold assets of any size.",2,3);
         EBNJOCK = new Undergarment("EWStrap","Ebon Jock","ebonweave jockstrap","an ebonweave jockstrap",1,900,"A jockstrap made from ebonweave. It\'s comfortable and elastic due to the alchemic treatment, providing support while containing assets of any size.",2,3);
         var _loc4_:Undergarment = new Undergarment("SSPanty","S.Silk Panties","spider-silk panties","a pair of spider-silk panties",1,370,"A pair of panties made from spider silk. They look incredibly comfortable and are white as snow, finely woven with hundreds of spider silk strands.",1,1);
         _loc4_._headerName = "Spider-Silk Panties";
         SSPANTY = _loc4_;
         var _loc5_:Undergarment = new Undergarment("SS.Loin","S.Silk L.Cloth","spider-silk loincloth","a spider-silk loincloth",1,370,"A loincloth made from spider silk. It looks incredibly comfortable and is white as snow, finely woven with hundreds of spider silk strands.",1,1,"TailLegWearable");
         _loc5_._headerName = "Spider-Silk Loincloth";
         SS_LOIN = _loc5_;
         LTXTHNG = new Undergarment("LtxThng","Latex Thong","latex thong","a latex thong",1,300,"A black and shiny thong made of latex. It\'s designed to fit snugly around your form.",3);
         LTXSHRT = new Undergarment("LtxShrt","Latex Shorts","latex shorts","a pair of latex shorts",1,300,"A pair of black and shiny shorts made of latex. It\'s designed to fit snugly around your form.",3);
         GARTERS = new Undergarment("Garters","Stocking&Garter","stockings and garters","a pair of stockings and garters",1,6,"A pair of stockings with garters. The perfect lingerie to seduce your partner.",3);
         FURLOIN = new Undergarment("FurLoin","Fur Loincloth","fur loincloth","a front and back set of loincloths",1,6,"A loincloth to cover your crotch and butt. Typically worn by people named \'Conan\'. ",2,0,"TailLegWearable");
         FUNDOSH = new Undergarment("Fundosh","Fundoshi","fundoshi","a fundoshi",1,20,"An eastern-styled undergarment. It resembles a cross between a thong and loincloth.",2);
         DSTHONG = new Undergarment("DSPanty","D.Scale Thong","dragonscale thong","a dragonscale thong",1,360,"A thong made from dragon scales, it\'s held together with leather straps around the waist and the area between the legs. Great for those in-touch with their wild side.",1,2);
         DS_LOIN = new Undergarment("DS.Loin","D.Scale L.Cloth","dragonscale loincloth","a dragonscale loincloth",1,360,"A loincloth made from dragon scales, held together with a leather straps going around the waist. Great for those in-touch with their wild side.",1,2,"TailLegWearable");
         LOLIPAN = new Undergarment("LoliPan","Child Panties","children\'s panties","a cute pair of children\'s panties",1,20,"These panties are made from pure white, extra-soft cotton, with cute designs embroidered all over and a tiny pink ribbon on the front.");
         C_PANTY = new Undergarment("C.Panty","Comfy Panties","comfortable panties","a pair of comfortable panties",1,6,"A simple and soft pair of panties.");
         C_LOIN = new Undergarment("C. Loin","Comfy L.Cloth","comfortable loincloth","a comfortable loincloth",1,6,"A plain loincloth that doesn\'t offer much besides covering your modesty.",0,0,"TailLegWearable");
         BLOOMER = new Undergarment("Bloomers","Bloomers","bloomers","a pair of bloomers",1,40,"A pair of baggy, old-fashioned bloomers. An air of innocence surrounds them.");
         SEA_SHIRT = new NobleShirt();
         PSTRBRA = new Undergarment("PStrBra","P.Striped Bra","pink-white striped bra","a pink-and-white striped bra",0,50,"A relatively simple, horizontally striped bra in pink and white. A bit childish, but nonetheless enticing.",1);
         BSTRBRA = new Undergarment("BStrBra","B.Striped Bra","blue-white striped bra","a blue-and-white striped bra",0,50,"A relatively simple, horizontally striped bra in blue and white. Reminds you of the great, wide sea.",1);
         FRILBRA = new Undergarment("FrilBra","Frilly Bra","frilly bra","a frilly bra",0,50,"A cute bra, with frills along the edges.",1);
         SHR_BRA = new Undergarment("Shr Bra","Sheer Bra","sheer bra","a sheer bra",0,140,"A rather provocative bra. Made of see-through fabric, it conceals next to nothing.",3);
         SHRBYDL = new Undergarment("ShrBydl","Sheer Babydoll","sheer babydoll","a sheer babydoll",0,200,"A loose, ruffled nightgown, commonly known as a \'babydoll\'. It just about reaches your thighs, and the see-through fabric does little to obscure your chest.",3);
         BBYDOLL = new Undergarment("Bbydoll","Babydoll","babydoll","a babydoll",0,190,"A loose, ruffled nightgown, commonly known as a \'babydoll\'. Being just long enough to reach one\'s thighs, it\'s quite light and breathes easily.",2);
         LACEBRA = new Undergarment("LaceBra","Lace Bra","lace bra","a lace bra",0,60,"A patterned bra, made of lace. The fabric is quite comfortable to the touch.",2);
         EBNCRST = new Undergarment("EW Crst","Ebon Corset","ebonweave corset","an ebonweave corset",0,900,"A corset made from ebonweave. The alchemical treatment has made it elastic enough to be surprisingly comfortable while still emphasizing your curves.",2,3);
         EBNVEST = new Undergarment("EW Vest","Ebon Vest","ebonweave vest","an ebonweave vest",0,900,"A vest made from ebonweave. The alchemical treatment has made it elastic and form-fitting, and it accentuates the wearer\'s form quite well.",2,3);
         var _loc6_:Undergarment = new Undergarment("SS. Bra","S.Silk Bra","spider-silk bra","a spider-silk bra",0,370,"A bra made from spider silk. It looks incredibly comfortable and is white as snow, finely woven with hundreds of spider silk strands.",1,1);
         _loc6_._headerName = "Spider-Silk Bra";
         SS_BRA = _loc6_;
         LTX_BRA = new Undergarment("Ltx.Bra","Latex Bra","latex bra","a latex bra",0,250,"A black and shiny bra, obviously made of latex. It\'s designed to fit snugly around your breasts.",3);
         DS_BRA = new Undergarment("DS. Bra","D.Scale Bra","dragonscale bra","a dragonscale bra",0,360,"A bra made from dragon scales, held together with leather straps for flexibility. Great for those in-touch with their wild side.",1,2);
         LOLIBRA = new Undergarment("LoliBra","Training Bra","training bra","a comfortable training bra",0,20,"A bra made from thin and lightweight cotton. It provides no real support and is designed to protect a young girl\'s sensitive, budding breasts.");
         C_BRA = new Undergarment("C. Bra ","Comfy Bra","comfortable bra","a comfortable bra",0,6,"A generic but comfortable bra.");
      }
   }
}

