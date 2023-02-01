require "import"
import "mengchen"
import "theme"
import "tools/id_search_layout"
activity.setContentView(loadlayout("tools/id_search_layout"))

nums = 9756
path = activity.getLuaDir()
id1_path = path.."/res/item.txt"

function start()
  id3 = {}
  id1=ArrayList()
  adp1=ArrayAdapter(this,android.R.layout.simple_list_item_1,id1)
  list1.setAdapter(adp1)
  id2=ArrayList()
  adp2=ArrayAdapter(this,android.R.layout.simple_list_item_1,id2)
  list2.setAdapter(adp2)
  for i in io.lines(id1_path) do
    id1.add(i)
    table.insert(id3,i)
  end
end
start()
function id_search()
  id2.clear()
  adp2.clear()
  if edit.Text ~= "" and edit.Text ~= " " then
    for i = 1,nums do
      if string.find(id3[i],edit.Text,1) ~= nil then
        id2.add(id3[i])
      end
    end
   else
    for i = 1,nums do
      id2.add(id3[i])
    end
  end
end
edit.addTextChangedListener{
  onTextChanged=function(s)
    id_search()
  end
}
list1.onItemLongClick=function(p,v,i,s)
  id = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(id)
  提示("已复制 "..id.." 到剪贴板")
  return true
end
list2.onItemLongClick=function(p,v,i,s)
  id = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(id)
  提示("已复制 "..id.." 到剪贴板")
  return true
end

function item.onClick()
  nums = 9756
  id1_path = path.."/res/item.txt"
  start()
  id_search()
end
function actor.onClick()
  nums = 691
  id1_path = path.."/res/actor.txt"
  start()
  id_search()
end
function actor_model.onClick()
  nums = 329
  id1_path = path.."/res/actor_model.txt"
  start()
  id_search()
end
function skin.onClick()
  nums = 307
  id1_path = path.."/res/skin.txt"
  start()
  id_search()
end
function skin_icon.onClick()
  nums = 307
  id1_path = path.."/res/skin_icon.txt"
  start()
  id_search()
end
function skin_model.onClick()
  nums = 291
  id1_path = path.."/res/skin_model.txt"
  start()
  id_search()
end
function custom_skin.onClick()
  nums = 1820
  id1_path = path.."/res/custom_skin.txt"
  start()
  id_search()
end
function buff.onClick()
  nums = 387
  id1_path = path.."/res/buff.txt"
  start()
  id_search()
end
function global_effect.onClick()
  nums = 2432
  id1_path = path.."/res/global_effect.txt"
  start()
  id_search()
end
