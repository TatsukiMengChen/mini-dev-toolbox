--import "editor/float/float_window"
function script_factory.onClick()
  --msg'功能还未更新，下个版本再来吧！'
  activity.newActivity("editor/script_factory/main")
end
function script_editor.onClick()
  local path = activity.getLuaDir()
  temporary('webview.loadUrl("'..path..'/editor/script_editor/index.html")')
  activity.newActivity("webview")
  提示"温馨提示：横屏使用体验更佳"
end
function lua_editor.onClick()
  activity.newActivity("editor/lua_editor")
end
function wordhtml.onClick()
  local path = activity.getLuaDir()
  temporary('webview.loadUrl("https://wordhtml.com")')
  activity.newActivity("webview")
  提示"首次打开Word转HTML工具可能需要花费较长时间，请耐心等待"
end
function spck_editor.onClick()
  local path = activity.getLuaDir()
  temporary('webview.loadUrl("https://spck.io")')
  activity.newActivity("webview")
  提示"首次打开Spck Editor可能需要花费较长时间，请耐心等待"
end
function markdown_to_html.onClick()
  提示"功能还未完善，下个版本再来吧~"
  --activity.newActivity("editor/lua_editor")
end
function markdown_editor.onClick()
  
  local path = activity.getLuaDir()
  temporary('webview.loadUrl("https://helloworld.net/html2md")')
  activity.newActivity("webview")
end
function wordhtml.onLongClick()
  url="https://wordhtml.com"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function spck_editor.onLongClick()
  url="https://spck.io"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end