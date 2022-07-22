require "import"
import "android.graphics.drawable.StateListDrawable"
import "android.graphics.drawable.ColorDrawable"
import "android.view.inputmethod.InputMethodManager"
import"android.content.*"
import "mengchen"
import "settings"
settings = settings_decode()
import "theme"
import "editor/lua_editor_layout"
activity.setTheme(android.R.style.Theme_Material_Light_NoActionBar)
activity.setContentView(loadlayout("editor/lua_editor_layout"))
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
path= activity.getLuaDir().."/editor/keywords.json"
file = io.open(path,"r")
io.input(file)
keywords = cjson.decode(io.read("*a"))
io.close()
Names = {}
for i in pairs(keywords) do
  Names[i]=keywords[i]["value"]
end

editor.addNames(Names)
editor.addNames(
{
  'ScriptSupportEvent:registerEvent("event",fun)--注册监听器',
}
)


path = "/sdcard/devToolbox/lua_editor_demo.lua"
value = 文件是否存在(path,value)
if value == true then
  file = io.open(path,"r")
  editor.Text = file:read("*a")
  file:close()
end

function show_toolbar1.onClick()
  toolbar1.setVisibility(View.VISIBLE)
  toolbar2.setVisibility(View.VISIBLE)
  hide_toolbar.setVisibility(View.VISIBLE)
  show_toolbar.setVisibility(View.INVISIBLE)
end
function hide_toolbar1.onClick()
  toolbar1.setVisibility(View.INVISIBLE)
  toolbar2.setVisibility(View.INVISIBLE)
  show_toolbar.setVisibility(View.VISIBLE)
  hide_toolbar.setVisibility(View.INVISIBLE)
end
function format.onClick()
  editor.format()
end
function paste.onClick()
  editor.paste()
end
night_mode = settings["night_mode"]
if night_mode == false then
  night_mode1.setImageBitmap(loadbitmap("res/icon/daytime.png"))
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xffffffff);
  end
  editor.setUserwordColor(0xfff08d49)--用户词
  editor.setTextColor(0xff000000)--文本
  editor.setTextHighlightColor(0xff4a4e56)--高亮(文本选择)背景
  editor.setStringColor(0xff7ec699)--字符串
  editor.setPanelBackgroundColor(0x9f282c34)--补全背景
  editor.setPanelTextColor(0xffffffff)--补全文字、边框
  editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  editor.setCommentColor(0xff969896)--注释颜色
  editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  editor.setShowLineNumbers(true)
  editor.setBackgroundColor(0xffffffff)--背景颜色
  editor.setTextSize(30)
  editor.setTextHighlightColor(0xff4a4e56)
  editor.setHighlightCurrentRow(true)
  editor.setAutoIndentWidth(2);
 else
  night_mode1.setImageBitmap(loadbitmap("res/icon/night.png"))
  if Build.VERSION.SDK_INT >= 21 then
    activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff282c34);
  end
  editor.setUserwordColor(0xfff08d49)
  editor.setStringColor(0xff7ec699)--字符串
  editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  editor.setCommentColor(0xff969896)--注释颜色
  editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  editor.setShowLineNumbers(true)
  editor.setTextSize(30)
  editor.setHighlightCurrentRow(true)
  editor.setAutoIndentWidth(2);
  editor.setTextColor(0xffffffff)
  editor.setTextHighlightColor(0xff4a4e56)
  editor.setBackgroundColor(0xff282c34)
  editor.setPanelBackgroundColor(0x9f282c34)
  editor.setPanelTextColor(0xffffffff)
end
function daytime_night.onClick()
  if night_mode == false then
    night_mode = true
    settings["night_mode"] = true
    settings_encode(settings)
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff282c34);
    end
    editor.setTextColor(0xffffffff)
    editor.setBackgroundColor(0xff282c34)
    editor.setPanelBackgroundColor(0x9fffffff)
    editor.setPanelTextColor(0xff000000)
    night_mode1.setImageBitmap(loadbitmap("res/icon/night.png"))
   else
    night_mode = false
    settings["night_mode"] = false
    settings_encode(settings)
    if Build.VERSION.SDK_INT >= 21 then
      activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xffffffff);
    end
    editor.setTextColor(0xff000000)
    editor.setBackgroundColor(0xffffffff)
    editor.setPanelBackgroundColor(0x9f282c34)
    editor.setPanelTextColor(0xffffffff)
    night_mode1.setImageBitmap(loadbitmap("res/icon/daytime.png"))
  end
end
function id_search.onClick()
  activity.newActivity("tools/id_search")
end
function API.onClick()
  pages.showPage(1)
end
function pages.onPageChange(v,val)
  current_page = val
end
function back_to_editor.onClick()
  pages.showPage(0)
end
if settings["script_editor_wiki"] ~= nil then
  webview.loadUrl(settings["script_editor_wiki"])
 else
  webview.loadUrl("https://developers.mini1.cn/wiki/API.html")
end
function save.onClick()
  file = io.open("/sdcard/devToolbox/lua_editor_demo.lua","w")
  io.output(file)
  io.write(editor.Text)
  io.close()
  提示("保存成功")
end
function undo.onClick()
  editor.undo()
end
function redo.onClick()
  editor.redo()
end
function select_all.onClick()
  editor.selectAll()
end
function cut.onClick()
  editor.cut()
end
function copy.onClick()
  editor.copy()
end
function close.onClick()
  toolbar3.setVisibility(View.GONE)
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
    editor.paste("function()")
   else
    editor.paste(v.Text)
  end
end
快捷栏(symbol_bar,input_symbol,symbol_table,16,0xff1296db)

editor.OnSelectionChangedListener=function(a,b,c)
  if a then
    toolbar3.setVisibility(View.VISIBLE)
   else
    toolbar3.setVisibility(View.GONE)
  end
end


function quit2()
  path = "/sdcard/devToolbox/lua_editor_demo.lua"
  value = 文件是否存在(path,value)
  if value == true then
    file = io.open(path,"r")
    lua_editor_demo = file:read("*a")
    file:close()
    if editor.Text ~= lua_editor_demo then
      dl=AlertDialog.Builder(activity)
      .setTitle("提示")
      .setMessage("脚本还未保存，是否要保存当前脚本？")
      .setPositiveButton("保存",DialogInterface
      .OnClickListener{
        onClick=function()
          activity.finish()
          file = io.open("/sdcard/devToolbox/lua_editor_demo.lua","w")
          io.output(file)
          io.write(editor.Text)
          io.close()
          提示("脚本已保存在\n/sdcard/devToolbox/lua_editor_demo.lua\n目录下")
        end
      })
      .setNegativeButton("不保存",DialogInterface
      .OnClickListener{
        onClick=function()
          activity.finish()
        end
      })
      .create()
      dl.show()
     else
      activity.finish()
    end
   else
    if editor.Text ~= "" then
      dl=AlertDialog.Builder(activity)
      .setTitle("提示")
      .setMessage("脚本还未保存，是否要保存当前脚本？")
      .setPositiveButton("保存",DialogInterface
      .OnClickListener{
        onClick=function()
          activity.finish()
          file = io.open("/sdcard/devToolbox/lua_editor_demo.lua","w")
          io.output(file)
          io.write(editor.Text)
          io.close()
          提示("脚本已保存在\n/sdcard/devToolbox/lua_editor_demo.lua\n目录下")
        end
      })
      .setNegativeButton("不保存",DialogInterface
      .OnClickListener{
        onClick=function()
          activity.finish()
        end
      })
      .create()
      dl.show()
     else
      activity.finish()
    end
  end

  --activity.finish()
end
function quit1.onClick()
  quit2()
end

参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 参数+2 > tonumber(os.time()) then
      quit2()
     else
      if current_page == 0 then
        参数=tonumber(os.time())
        msg"再按一次返回键退出"
       else
        pages.showPage(0)
        参数=0
      end
    end
    return true
  end
end


