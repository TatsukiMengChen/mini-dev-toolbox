require "import"
import "theme"
import "mengchen"
layout={
  LinearLayout;
  orientation="vertical";
  {
    LuaWebView;
    id="webview";
    layout_width="fill";
    layout_height="fill";
  };
};

activity.setContentView(loadlayout(layout))
import "temp"



num=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if num+2 > tonumber(os.time()) then
      activity.finish()
     else
      提示"再按一次返回键退出"
      num=tonumber(os.time())
    end
    return true
  end
end