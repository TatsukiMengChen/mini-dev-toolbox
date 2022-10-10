require "import"
import "theme"
import "mengchen"
import "java.io.File"
activity.setContentView("mods/file_chooser_layout")

function main(path,val)
  if val == 1 then
    title.Text = "选择脚本"
   elseif val == 2 then
    title.Text = "选择触发器"
  end
  files = {}
  if 文件是否存在(path) then
    file_list=luajava.astable(File(path).listFiles())
   else
    file_list={}
  end
  for i in pairs(file_list) do
    table.insert(files,{tostring(file_list[i]),File(tostring(file_list[i])).getName()})
  end

  layout={
    LinearLayout;
    layout_height="48dp";
    layout_width="fill";
    {
      ImageView;
      layout_height="32dp";
      layout_width="32dp";
      id="img";
      layout_marginLeft="20dp";
      layout_gravity="center";
    };
    {
      TextView;
      id="text";
      textColor="#2196F3";
      textSize="14sp";
      layout_marginLeft="10dp";
      layout_gravity="center";
    };
  };
  adp=LuaAdapter(activity,layout)
  list.Adapter=adp
  for i in pairs(files) do
    adp.add({img="/storage/emulated/0/AndLua/project/迷你开发者工具箱/res/icon/lua.png",text=files[i][2]})
  end
  list.onItemClick=function(parent,v,pos,id)
    activity.result({{files[id][1],files[id][2],val}})
  end
end