import "android.graphics.drawable.StateListDrawable"
import "android.graphics.drawable.ColorDrawable"
import "android.view.inputmethod.InputMethodManager"
import "android.content.*"
import "mengchen"
import "settings"
settings = settings_decode()
path= activity.getLuaDir().."/editor/keywords.json"
file = io.open(path,"r")
--io.input(file)
keywords = cjson.decode(file:read("*a"))
file:close()
Names = {}
for i in pairs(keywords) do
  Names[i]=keywords[i]["value"]
end

float_editor_editor.addNames(Names)
float_editor_editor.addNames(
{
  'ScriptSupportEvent:registerEvent("event",fun)--注册监听器',
}
)


path = "/sdcard/devToolbox/lua_editor_demo.lua"
value = 文件是否存在(path,value)
if value == true then
  file = io.open(path,"r")
  float_editor_editor.Text = file:read("*a")
  file:close()
end

function float_editor_show_toolbar1.onClick()
  float_editor_toolbar1.setVisibility(View.VISIBLE)
  float_editor_toolbar2.setVisibility(View.VISIBLE)
  float_editor_hide_toolbar.setVisibility(View.VISIBLE)
  float_editor_show_toolbar.setVisibility(View.INVISIBLE)
end
function float_editor_hide_toolbar1.onClick()
  float_editor_toolbar1.setVisibility(View.INVISIBLE)
  float_editor_toolbar2.setVisibility(View.INVISIBLE)
  float_editor_show_toolbar.setVisibility(View.VISIBLE)
  float_editor_hide_toolbar.setVisibility(View.INVISIBLE)
end
function float_editor_format.onClick()
  float_editor_editor.format()
end
function float_editor_paste.onClick()
  float_editor_editor.paste()
end
night_mode = settings["night_mode"]
if night_mode == false then
  float_editor_night_mode1.setImageBitmap(loadbitmap("res/icon/daytime.png"))
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xffffffff);
  end
  float_editor_editor.setUserwordColor(0xfff08d49)--用户词
  float_editor_editor.setTextColor(0xff000000)--文本
  float_editor_editor.setTextHighlightColor(0xff4a4e56)--高亮(文本选择)背景
  float_editor_editor.setStringColor(0xff7ec699)--字符串
  float_editor_editor.setPanelBackgroundColor(0x9f282c34)--补全背景
  float_editor_editor.setPanelTextColor(0xffffffff)--补全文字、边框
  float_editor_editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  float_editor_editor.setCommentColor(0xff969896)--注释颜色
  float_editor_editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  float_editor_editor.setShowLineNumbers(true)
  float_editor_editor.setBackgroundColor(0xffffffff)--背景颜色
  float_editor_editor.setTextSize(30)
  float_editor_editor.setTextHighlightColor(0xff4a4e56)
  float_editor_editor.setHighlightCurrentRow(true)
  float_editor_editor.setAutoIndentWidth(2);
 else
  float_editor_night_mode1.setImageBitmap(loadbitmap("res/icon/night.png"))
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff282c34);
  end
  float_editor_editor.setUserwordColor(0xfff08d49)
  float_editor_editor.setStringColor(0xff7ec699)--字符串
  float_editor_editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  float_editor_editor.setCommentColor(0xff969896)--注释颜色
  float_editor_editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  float_editor_editor.setShowLineNumbers(true)
  float_editor_editor.setTextSize(30)
  float_editor_editor.setHighlightCurrentRow(true)
  float_editor_editor.setAutoIndentWidth(2);
  float_editor_editor.setTextColor(0xffffffff)
  float_editor_editor.setTextHighlightColor(0xff4a4e56)
  float_editor_editor.setBackgroundColor(0xff282c34)
  float_editor_editor.setPanelBackgroundColor(0x9f282c34)
  float_editor_editor.setPanelTextColor(0xffffffff)
end
function float_editor_daytime_night.onClick()
  if night_mode == false then
    night_mode = true
    settings["night_mode"] = true
    settings_encode(settings)
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff282c34);
    end
    float_editor_editor.setTextColor(0xffffffff)
    float_editor_editor.setBackgroundColor(0xff282c34)
    float_editor_editor.setPanelBackgroundColor(0x9fffffff)
    float_editor_editor.setPanelTextColor(0xff000000)
    float_editor_night_mode1.setImageBitmap(loadbitmap("res/icon/night.png"))
   else
    night_mode = false
    settings["night_mode"] = false
    settings_encode(settings)
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xffffffff);
    end
    float_editor_editor.setTextColor(0xff000000)
    float_editor_editor.setBackgroundColor(0xffffffff)
    float_editor_editor.setPanelBackgroundColor(0x9f282c34)
    float_editor_editor.setPanelTextColor(0xffffffff)
    float_editor_night_mode1.setImageBitmap(loadbitmap("res/icon/daytime.png"))
  end
end
function float_editor_save.onClick()
  file = io.open("/sdcard/devToolbox/lua_editor_demo.lua","w")
  --io.output(file)
  file:write(float_editor_editor.Text)
  file:close()
  提示("保存成功")
end
function float_editor_undo.onClick()
  float_editor_editor.undo()
end
function float_editor_redo.onClick()
  float_editor_editor.redo()
end
function float_editor_select_all.onClick()
  float_editor_editor.selectAll()
end
function float_editor_cut.onClick()
  float_editor_editor.cut()
end
function float_editor_copy.onClick()
  float_editor_editor.copy()
end
function float_editor_close.onClick()
  float_editor_toolbar3.setVisibility(View.GONE)
end
function 快捷栏(kjid,kjdianji,kjtab,kjtxtsize,kjtxtcolor)
  --local cd1=ColorDrawable(0xc0ffffff)
  --local cd2=ColorDrawable(0xc0ffffff)
  function newButton(text)
    local sd=StateListDrawable()
    --sd.addState({pressed},cd2)
    --sd.addState({0},cd1)
    local btn=TextView()
    btn.TextSize=kjtxtsize;
    btn.TextColor=kjtxtcolor;
    local pd=btn.TextSize/2
    btn.setPadding(24,10,24,15)
    btn.Text=text
    --btn.setBackgroundDrawable(sd)
    btn.onClick=kjdianji
    return btn
  end

  for k,v in ipairs(kjtab) do
    kjid.addView(newButton(v))
  end
end

symbol_table={"FUN","(",")","[","]","{","}",[["]],"=",";",".",",",":","_","+","-","*","/","\\","%","#","^","$","?","&","|","<",">","~","'"}
function input_symbol(v)
  if v.Text=="FUN" then
    float_editor_editor.paste("function()")
   else
    float_editor_editor.paste(v.Text)
  end
end
快捷栏(float_editor_symbol_bar,input_symbol,symbol_table,16,0xff1296db)

float_editor_editor.OnSelectionChangedListener=function(a,b,c)
  if a then
    float_editor_toolbar3.setVisibility(View.VISIBLE)
   else
    float_editor_toolbar3.setVisibility(View.GONE)
  end
end