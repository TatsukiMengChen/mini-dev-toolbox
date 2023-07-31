require "import"
import "mengchen"
import "theme"
import "android.content.Context"
import "tools/vox_layout"
activity.setContentView(loadlayout("tools/vox_layout"))

editor_theme(editor)
editor.Text=[=[
--[[
此工具需要搭配海螺壳脚本工具使用（可在群文件下载）
可将插件化后的脚本添加至插件包
使用方法：
1. 在海螺壳脚本工具中生成体素脚本
2. 将体素脚本粘贴到此处
3. 点击插件化
]]
]=]

function id_search.onClick()
  activity.newActivity("tools/id_search")
end

function run.onClick()
  if block.Text != "" then
    if pcall(function ()
        script = editor.Text
        script = script:sub(1,script:find("ScriptSupportEvent:registerEvent")-1)
        a,b = script:find('tr={[',1,true)
        script = script:sub(1,b)..block.Text..script:sub(b+2,#script)
        print(a,b)
        script = script:gsub('M==1','M=='..block.Text)
        script = script..[[
ScriptSupportEvent:registerEvent('Block.PlaceBy',o)
ScriptSupportEvent:registerEvent('Block.PlaceBy',l)
tt = true function ti() if tt then tt = false while true do r() threadpool:wait(0.05) end end end
ScriptSupportEvent:registerEvent('Block.PlaceBy',ti)]]
        editor.Text = script
      end) then
      msg"插件化成功"
     else
      msg"请输入合法的体素脚本"
    end

   else
    msg"请输入方块ID"
  end
end

function copy.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(editor.Text)
  提示("已复制脚本到剪贴板")
end

