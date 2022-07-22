require "import"
import "mengchen"
import "theme"
import "java.io.File"
import "settings"
import "user/channel_setup_layout"
activity.setContentView(loadlayout("user/channel_setup_layout"))

item_keys = {"#7f000006","#7f000009","#7f00000c","#7f00000f","#7f000012","#7f000015"}
item = {
  LinearLayout;
  {
    CardView;
    layout_height="100dp";
    background="#FFFFFF";
    layout_width="320dp";
    layout_margin="20dp";
    CardElevation="2dp";
    radius="20dp";
    {
      LinearLayout;
      layout_height="120dp";
      id="channel_setup";
      style="?android:attr/buttonBarButtonStyle";
      orientation="vertical";
      layout_gravity="center";
      layout_width="340dp";
      onClick=function(val)
        val = tostring(val)
        print(val)
        for i in pairs(item_keys) do
          if string.find(val,item_keys[i],1) ~= nil then
            提示("已将渠道设置为"..file_list[i])
            settings = settings_decode()
            settings["miniworld_package_name"] = file_list[i]
            settings["miniworld_version"] = miniworld_Versions[i]
            if settings["miniworld_number"] ~= nil then
              settings["miniworld_number"] = nil
            end
            settings_encode(settings)
            file = io.open(activity.getLuaDir().."/callback.lua","w")
            io.output(file)
            io.write('miniworld_package_name.Text = "'..file_list[i]..'"\n')
            io.write('miniworld_version.Text = "版本：v'..miniworld_Versions[i]..'"')
            io.close()
            activity.finish()
            break
          end
        end
      end;
      {
        LinearLayout;
        layout_width="fill";
        layout_marginLeft="5dp";
        orientation="horizontal";
        layout_marginTop="5dp";
        {
          CardView;
          layout_height="40dp";
          radius="10dp";
          layout_width="40dp";
          CardElevation="0dp";
          layout_margin="10dp";
          {
            ImageView;
            layout_height="40dp";
            layout_width="40dp";
            src="res/icon/miniworld.png";
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          gravity="center|left";
          orientation="vertical";
          layout_gravity="center";
          {
            TextView;
            textSize="16sp";
            textColor="#000000";
            text="迷你世界";
          };
          {
            TextView;
            id="package_name";
            textSize="10dp";
            text="包名：未知";
          };
        };
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_marginLeft="5dp";
        {
          TextView;
          id="miniworld_version";
          layout_marginTop="0dp";
          textColor="#2196F3";
          layout_margin="10dp";
          text="版本：未知";
        };
      };
    };
    {
      ImageView;
      layout_height="20dp";
      layout_marginRight="20dp";
      layout_width="20dp";
      layout_gravity="center|right";
      src="res/icon/switch.png";
    };
  };
}
adp=LuaAdapter(activity,item)
list.Adapter=adp
file_list=luajava.astable(File("/sdcard/miniplay/").listFiles(),1)
miniworld_Versions = {}
for i in pairs(file_list) do
  file_list[i] = tostring(file_list[i])
  file_list[i] = string.sub(file_list[i],18,#file_list[i])
  if pcall(function() activity.getPackageManager().getPackageInfo(file_list[i],0) end) then
    miniworld_Version = activity.getPackageManager().getPackageInfo(file_list[i],0).versionName
    table.insert(miniworld_Versions,miniworld_Version)
    adp.add{miniworld_version = "版本：v"..miniworld_Version,package_name = file_list[i]}
  end
end






