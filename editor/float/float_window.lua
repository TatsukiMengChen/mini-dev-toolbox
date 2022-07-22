import "mods/float_window"


bj1=import "editor/float/float_window_layout"
bj2=import "editor/float/min_float_window_layout"
a,b,c = 悬浮窗(-2,-2,0,0,17,false)
d,e,f = 悬浮窗(-2,-2,0,0,17,true)
function onDestroy()
  if max_float_show == true then
    关闭悬浮(d,maxlay)
   elseif max_float_show == nil then
    关闭悬浮(a,minlay)
  end
end

function min_functions()
  minlay = 开启悬浮(b,a,bj2)
  移动浮窗(lin,b,a,minlay)
  function min_float_icon.onClick()
    关闭悬浮(a,minlay)
    max_functions()
  end
  function min_float_icon.onLongClick()
    关闭悬浮(a,minlay)
    float_switch.checked = false
  end
end
function set_float_orientation(val)
  if val == 1 then
    linearParams = float_main.getLayoutParams()
    print(linearParams.width)
    linearParams.width = activity.getWidth()
    float_main.setLayoutParams(linearParams)
    linearParams = float_main.getLayoutParams()
    linearParams.height = activity.getHeight()
    float_main.setLayoutParams(linearParams)
   else
    linearParams = float_main.getLayoutParams()
    linearParams.width = activity.getHeight()
    float_main.setLayoutParams(linearParams)
    linearParams = float_main.getLayoutParams()
    linearParams.height = activity.getWidth()
    float_main.setLayoutParams(linearParams)
  end
end
float_orientation = 1
float_pageview = 0
float_page0_opened = true
function max_functions()
  if float_orientation == 1 then
    if max_float_show == nil then
      maxlay = 开启悬浮(e,d,bj1)
      set_float_orientation(1)
      关闭悬浮(a,maxlay)
      maxlay = 开启悬浮(e,d,bj1)
     else
      maxlay = 开启悬浮(e,d,bj1)
      set_float_orientation(1)
    end
   else
    maxlay = 开启悬浮(e,d,bj1)
    set_float_orientation(0)
  end
  max_float_show = true
  function float_icon.onClick()
    if max_float_show == true then
      float_page0_opened = false
      float_page1_opened = false
      float_page2_opened = false
      float_page3_opened = false
      float_page4_opened = false
      float_page5_opened = false
      float_page6_opened = false
      关闭悬浮(a,maxlay)
      min_functions()
      max_float_show = nil
    end
  end
  function float_icon.onLongClick()
    float_page0_opened = false
    float_page1_opened = false
    float_page2_opened = false
    float_page3_opened = false
    float_page4_opened = false
    float_page5_opened = false
    float_page6_opened = false
    if float_orientation == 1 then
      float_orientation = 0
      set_float_orientation(0)
      关闭悬浮(a,maxlay)
      max_functions()
     else
      float_orientation = 1
      set_float_orientation(1)
      关闭悬浮(a,maxlay)
      max_functions()
    end
  end
  function float_change_page0()
    float_pageview = 0
    float_pages.showPage(0)
    import "editor/float/lua_editor"
    package.loaded["editor/float/lua_editor"] = nil
  end
  function float_change_page1()
    float_pageview = 1
    float_pages.showPage(1)
    if settings["script_editor_wiki"] ~= nil then
      float_api_webview.loadUrl(settings["script_editor_wiki"])
     else
      float_api_webview.loadUrl("https://developers.mini1.cn/wiki/API.html")
    end
  end
  function float_change_page2()
    float_pageview = 2
    float_pages.showPage(2)
    float_course_webview.loadUrl("tatsukimengchen.github.io/devToolbox/")
  end
  function float_change_page3()
    float_pageview = 3
    float_pages.showPage(3)
    import "editor/float/id_search"
    package.loaded["editor/float/id_search"] = nil
  end
  float_icon0.onClick=function()
    if float_page0_opened == true then
      float_pages.showPage(0)
      float_pageview = 0
     else
      if float_pageview ~= 0 then
        float_change_page0()
        float_page0_opened = true
      end
    end
  end
  float_icon1.onClick=function()
    if float_page1_opened == true then
      float_pages.showPage(1)
      float_pageview = 1
     else
      if float_pageview ~= 1 then
        float_change_page1()
        float_page1_opened = true
      end
    end
  end
  float_icon2.onClick=function()
    if float_page2_opened == true then
      float_pages.showPage(2)
      float_pageview = 2
     else
      if float_pageview ~= 2 then
        float_change_page2()
        float_page2_opened = true
      end
    end
  end
  float_icon3.onClick=function()
    if float_page3_opened == true then
      float_pages.showPage(3)
      float_pageview = 3
     else
      if float_pageview ~= e then
        float_change_page3()
        float_page3_opened = true
      end
    end
  end
  if float_pageview == 0 then
    float_change_page0()
   elseif float_pageview ==1 then
    float_change_page1()
   elseif float_pageview == 2 then
    float_change_page2()
   elseif float_pageview == 3 then
    float_change_page3()
   else
    float_pageview = 0
    import "editor/float/lua_editor"
    package.loaded["editor/float/lua_editor"] = nil
  end

end


float_switch.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF64B5F6,PorterDuff.Mode.SRC_ATOP))
float_switch.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))

function float_window.onClick()
  if float_switch.checked == true then
    float_switch.checked = false
    msg"开发者悬浮窗已关闭"
    if max_float_show == true then
      关闭悬浮(d,maxlay)
     else
      关闭悬浮(a,minlay)
    end
   else
    float_switch.checked = true
    msg"开发者悬浮窗已开启"
    min_functions()
  end
end





