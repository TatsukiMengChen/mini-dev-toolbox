require "import"
import "mengchen"
import "theme"
import "tools/id_search_layout"
activity.setContentView(loadlayout("tools/id_search_layout"))

nums = 8664
path = activity.getLuaDir()
id1_path = path.."/res/itemid.txt"

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
  item = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(item)
  提示("已复制 "..item.." 到剪贴板")
  return true
end
list2.onItemLongClick=function(p,v,i,s)
  item = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(item)
  提示("已复制 "..item.." 到剪贴板")
  return true
end

function itemid.onClick()
  nums = 8664
  id1_path = path.."/res/itemid.txt"
  start()
  id_search()
end
function actorid.onClick()
  nums = 352
  id1_path = path.."/res/actorid.txt"
  start()
  id_search()
end
function modelid.onClick()
  nums = 333
  id1_path = path.."/res/modelid.txt"
  start()
  id_search()
end
function global_effectid.onClick()
  nums = 2432
  id1_path = path.."/res/global_effectid.txt"
  start()
  id_search()
end
