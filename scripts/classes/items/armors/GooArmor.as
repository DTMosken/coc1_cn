package classes.items.armors
{
   import classes.CoC;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Armor;
   import classes.items.Equippable;
   import flash.Boot;
   import haxe.IMap;
   
   public final class GooArmor extends Armor
   {
      
      public function GooArmor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("GooArmr","Valeria Armor","goo armor","Valeria, the goo-girl armor",22,1,"A shining suit of platemail that is more than just that--it houses the goo-girl, Valeria! Together, they provide excellent protection, but you better be okay with having her handle your private parts when wearing this.","Heavy");
      }
      
      override public function useText() : void
      {
         var _loc1_:* = null as IMap;
         outputText("带着狂喜的笑容，史莱姆护甲跳了起来，双臂搂住你的肩膀。[say: 哦，这一定会非常有趣的！谢谢你谢谢你谢谢你！我保证会让你舒舒服服、安安全全的，别担心。哦哦，又是一次真正的冒险！呜呼！]");
         outputText("[pg]在她变得过于兴奋之前，你提醒这个史莱姆，她现在应该做你的护甲了。她尴尬地捂住嘴，小声地道了个歉，并催促你赶紧[say: 穿上我！]你尴尬地脱下装备，打开板甲爬了进去。里面又湿又软，当你把你这位新朋友压扁在金属护甲上时，你不禁浑身发抖、扭动起来。");
         outputText("[pg]最终，你们俩都安顿好了。史莱姆女孩在沉重的盔甲内滑过你的身体，调整位置，让你的脸不受遮挡，而你没有被盔甲保护的关节则被柔软的史莱姆紧紧包裹。她甚至在你的新头盔上形成了一个粘稠的护面，让你在战斗中可以像面罩一样打开和关闭她。最后，她的粘液在你的");
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         if(get_player().hasVagina() && get_player().hasCock())
         {
            outputText("和");
         }
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         if(get_player().get_gender() == 0)
         {
            outputText("腹股沟");
         }
         outputText("，包裹住你的下体，以防你需要在战斗中途稍微释放一下，她说道。");
         outputText("[pg]几分钟后，你和你的护甲朋友安顿好了，准备出发。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,484) == 0)
         {
            outputText("当你为前方的" + (get_game().dungeons.checkPhoenixTowerClear() ? "冒险" : "地牢") + "做好准备时，史莱姆在你耳边咯咯笑了起来。[say: 哎呀，我真傻。我都忘了，我叫瓦莱里娅。如果你想正式点，可以叫我瓦莱里娅爵士。]你做了自我介绍，尴尬地握了握自己的手以示客套。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,484,FlagDict_Impl_.arrayReadInt(_loc1_,484) + 1);
         }
         outputText("[pg][say: 那好吧，[name]！]瓦莱里娅兴奋地说，[say: 我们走！][pg]");
         awardAchievement("史莱姆护甲",121);
      }
      
      override public function removeText() : void
      {
         outputText("瓦莱里娅爬起来，气呼呼地说，[say: 也许我们以后可以再一起冒险？] 然后扭动着身体朝你的营地走去。");
      }
      
      override public function playerRemove() : Equippable
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,498,1);
         return null;
      }
      
      override public function playerEquip() : Equippable
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,498,0);
         return super.playerEquip();
      }
      
      override public function get_def() : Number
      {
         if(get_game().valeria.valeriaFluidsEnabled())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) < 50)
            {
               return 15 + int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2200) / 5);
            }
            return 25;
         }
         return 22;
      }
   }
}

