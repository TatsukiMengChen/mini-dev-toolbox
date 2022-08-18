require "import"
import "mengchen"
import "theme"
import "com.androlua.LuaUtil"
import "settings"
import "user/setting_layout"
activity.setContentView("user/setting_layout")
wiki.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP));
settings = settings_decode()
function exit.onClick()
  activity.finish()
end

if settings["script_editor_wiki"] ~= nil then
  wiki.Text = settings["script_editor_wiki"]
end
function Wiki()
  url = string.gsub(wiki.Text,"\n","")
  settings["script_editor_wiki"] = url
  settings_encode(settings)
  path = activity.getLuaDir().."/editor/script_editor/index.html"
  file_line(path,156,'      <iframe src="'..url..'" frameborder="0"></iframe>')
  msg("已将wiki模块设置为\n"..url.."\n设置立即生效")
  --activity.result{"wiki"}
end

sizes_cache=GetFileSize("/sdcard/AndroLua/cache/")
cache_size.Text=sizes_cache
function clean_cache.onClick()
  os.execute("rm -r ".."/sdcard/AndroLua/cache")
  os.execute('mkdir '.."/sdcard/AndroLua/cache")
  提示"缓存清除完毕"
  sizes_cache=GetFileSize("/sdcard/AndroLua/cache/")
  cache_size.Text=sizes_cache
end

browse_path = ("/data/data/"..activity.getPackageName().."/cache/WebView")
sizes_browse=GetFileSize(browse_path.."/")
browse_size.Text=sizes_browse
function clean_browse.onClick()
  import "android.content.DialogInterface"
  local dl=AlertDialog.Builder(activity)
  .setTitle("清除所有网站数据？")
  .setMessage("这将清除所有网站保存的数据，其中的大部分数据可联网重新下载。")
  .setNegativeButton("取消",nil)
  .setPositiveButton("清除",DialogInterface
  .OnClickListener{
    onClick=function(v)
      os.execute("rm -r "..browse_path)
      os.execute('mkdir '..browse_path)
      提示"网站浏览数据清理完毕"
      sizes_browse=GetFileSize(browse_path.."/")
      browse_size.Text=sizes_browse
    end
  })
  .create()
  dl.show()
end

