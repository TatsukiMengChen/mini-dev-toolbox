require "import"
import "theme"
import "mengchen"
import "android.content.Context"
import "editor/script_factory/script/add_item_layout"
activity.setContentView(loadlayout("editor/script_factory/script/add_item_layout"))
import "res/id_table"
editor_theme(editor)
editor.Text=[[
--点击生成脚本后脚本会在此显示，可自行修改后再点击复制脚本
]]
temp = false
function match_name(val)
  for i = 1,#ids do
    if val == ids[i][1] then
      temp = true
      物品名称.Text = ids[i][2]

      return
    end
  end

  if 物品名称.Text ~= "" then
    temp = true
    物品名称.Text = ""

  end
end
function match_id(val)
  for i = 1,#ids do
    if val == ids[i][2] then
      temp = true
      物品ID.Text = tostring(ids[i][1])

      return
    end
  end
  if 物品ID.Text ~= "" then
    temp = true
    物品ID.Text = ""
  end
end
物品名称.addTextChangedListener{
  onTextChanged=function(s)
    if 物品名称.Text ~= "" then
      if temp == false then
        match_id(物品名称.Text)
       else
        temp = false
      end
     else
    end
  end
}

物品ID.addTextChangedListener{
  onTextChanged=function(s)
    if 物品ID.Text ~= "" then
      if temp == false then
        match_name(tonumber(物品ID.Text))
       else
        temp = false
      end
     else
    end
  end
}

function id_search.onClick()
  activity.newActivity("tools/id_search")
end
function create.onClick()
  script = [[
--给指定玩家的背包添加物品
--第一个参数为玩家迷你号
--第二个参数为要添加的物品id
--第三个参数为要添加的物品数量
local result,successNum=Backpack:addItem(<<迷你号>>,<<物品ID>>,<<物品数量>>)
if result==0 then--如果添加成功
	--在聊天框显示
	Chat:sendSystemMsg("尝试给玩家<<迷你号>>的背包添加<<物品数量>>个<<物品名称>>，实际添加了"..successNum)
else--如果添加失败
	--在聊天框显示
	Chat:sendSystemMsg("玩家<<迷你号>>不在当前存档")
end
]]
  if 迷你号.Text ~= "" then
    script = string.gsub(script,"<<迷你号>>",迷你号.Text)
   else
    script = string.gsub(script,"<<迷你号>>","0")
  end
  if 物品ID.Text ~= "" then
    script = string.gsub(script,"<<物品ID>>",物品ID.Text)
   else
    script = string.gsub(script,"<<物品ID>>","0")
  end
  if 物品名称.Text ~= "" then
    script = string.gsub(script,"<<物品名称>>",物品名称.Text)
   else
    script = string.gsub(script,"<<物品名称>>","未知物品")
  end
  if 物品数量.Text ~= "" then
    script = string.gsub(script,"<<物品数量>>",物品数量.Text)
   else
    script = string.gsub(script,"<<物品数量>>","1")
  end
  editor.Text=script
end
function copy.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(editor.Text)
  提示("已复制脚本到剪贴板")
end

