require "import"
import "theme"
import "mengchen"
import "android.content.Context"
import "editor/script_factory/script/add_item_layout"
activity.setContentView(loadlayout("editor/script_factory/script/add_item_layout"))
function copy.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(script)
  提示("已复制脚本到剪贴板")
end