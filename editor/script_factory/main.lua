require "import"
import "theme"
import "mengchen"
import "editor/script_factory/main_layout"

activity.setContentView(loadlayout("editor/script_factory/main_layout"))

script = {
  {"添加物品","add_item"};
  {"玩家飞行","player_fly"};
}





layout={
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  id="it1";
  {
    CardView;
    layout_gravity="center";
    layout_width="160dp";
    background="#FFFFFF";
    layout_margin="10dp";
    CardElevation="5dp";
    radius="10dp";
    layout_height="60dp";
    id="it2";
    {
      LinearLayout;
      orientation="horizontal";
      layout_width="180dp";
      layout_height="130dp";
      gravity="center";
      --style="?android:attr/buttonBarButtonStyle";
      layout_gravity="center";
      --onClick=function(a,b,c,d)print(a,b,c,d)end;
      --onClick=function(a,b,c,d)print(a,b,c,d)print(text.Text)end;
      {
        TextView;
        id="text";
        textColor="#2196F3";
        textSize="16sp";
      };
    };
  };
};

adp=LuaAdapter(activity,layout)

grid.Adapter=adp

for i = 1,#script do
  a = adp.add{text = script[i][1]}
end

grid.onItemClick=function(parent,v,pos,id)

  activity.newActivity("editor/script_factory/script/"..script[id][2])
end