require "import"
import "android.content.Context"
import "android.net.Uri"
import"mengchen"
import"theme"
import "tools/material_export_layout"

activity.setContentView(loadlayout("tools/material_export_layout"))

url = "https://image.mini1.cn//roleicon/"
url = "https://map1.mini1.cn/roleicon/"
layout={
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  {
    CardView;
    layout_gravity="center";
    layout_width="160dp";
    background="#FFFFFF";
    layout_margin="10dp";
    CardElevation="5dp";
    radius="10dp";
    layout_height="60dp";
    {
      LinearLayout;
      id="lua_editor";
      orientation="horizontal";
      layout_width="180dp";
      layout_height="130dp";
      gravity="center";
      --style="?android:attr/buttonBarButtonStyle";
      layout_gravity="center";
      --onClick=function(a,b,c,d)print(a,b,c,d)print(text.Text)end;
      {
        ImageView;
        id="img";
        layout_height="40dp";
        layout_width="40dp";
        layout_marginRight="10dp";
      };
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
--328
function getpicture(val)
  adp.clear()
  for i=20*(val-1)+1,20*val do
    adp.add{img=url..i..".png",text=i..".png"}
  end
end
grid.Adapter=adp
grid.onItemClick=function(parent,v,pos,id)
  msg("已将图片"..(20*(tonumber(edit.Text)-1)+pos+1)..".png保存到系统相册\n/DCIM/Camera/目录下")
  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
  url1=Uri.parse("https://image.mini1.cn//roleicon/"..(20*(tonumber(edit.Text)-1)+pos+1)..".png");
  request=DownloadManager.Request(url1);
  request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
  request.setDestinationInExternalPublicDir("/DCIM/Camera/",(20*(tonumber(edit.Text)-1)+pos+1)..".png");
  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
  downloadManager.enqueue(request);
end

getpicture(1)
edit.Text = "1"
function sub.onClick()
  if tonumber(edit.Text)>1 then
    edit.Text = tostring(tonumber(edit.Text)-1)
    getpicture(tonumber(edit.Text))
  end
end
function add.onClick()
  edit.Text = tostring(tonumber(edit.Text)+1)
  getpicture(tonumber(edit.Text))
end
edit.addTextChangedListener{
  onTextChanged=function(s)
    getpicture(tonumber(edit.Text))
  end
}



