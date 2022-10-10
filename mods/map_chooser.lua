require "import"
import "theme"
import "mengchen"
import "java.io.File"

import "settings"
activity.setContentView("mods/map_chooser_layout")

settings = settings_decode()

if settings.software_mode == 1 then
  path = "/sdcard/Android/data/"..settings.miniworld_package_name.."/files/miniplay/data/"
 elseif settings.software_mode == 2 then
  path = "/sdcard/miniplay/"..settings.miniworld_package_name.."/data/"
 elseif settings.software_mode == 3 then
  path = "/data/data/"..settings.miniworld_package_name.."/files/miniplay/data/"
end

file_list=luajava.astable(File(path).listFiles())
maps = {}
for i in pairs(file_list) do
  if 文件是否存在(tostring(file_list[i]).."/thumb.png_") then
    table.insert(maps,{tostring(file_list[i]).."/thumb.png_",File(tostring(file_list[i])).getName()})
   elseif 文件是否存在(tostring(file_list[i]).."/thumb.png") then
    table.insert(maps,{tostring(file_list[i]).."/thumb.png",File(tostring(file_list[i])).getName()})
  end
end

layout={
  LinearLayout;
  layout_height="fill";
  orientation="vertical";
  layout_width="fill";
  {
    CardView;
    layout_height="90dp";
    layout_margin="10dp";
    layout_width="160dp";
    radius="10dp";
    CardElevation="5dp";
    background="#FFFFFF";
    layout_gravity="center";
    {
      ImageView;
      layout_height="match_parent";
      id="img";
      layout_width="match_parent";
    };
  };

  {
    TextView;
    id="text";
    textColor="#2196F3";
    textSize="14sp";
    layout_gravity="center";
  };
};


adp=LuaAdapter(activity,layout)

grid.Adapter=adp
map = "/storage/emulated/0/miniplay/com.minitech.miniworld.m4399/data/w45492451686809/thumb.png_"

for i in pairs(maps) do
  adp.add({img=maps[i][1],text=maps[i][2]})
end
grid.onItemClick=function(parent,v,pos,id)

  activity.result({maps[id]})
end
