require "import"
import "mengchen"
import "theme"
import "tools/id_search_layout"
activity.setContentView(loadlayout("tools/id_search_layout"))

path = activity.getLuaDir()
id1_path = path.."/res/id1.txt"
--id1 = {}
id1=ArrayList()
adp1=ArrayAdapter(this,android.R.layout.simple_list_item_1,id1)
list1.setAdapter(adp1)
id2=ArrayList()
adp2=ArrayAdapter(this,android.R.layout.simple_list_item_1,id2)
list2.setAdapter(adp2)
for i in io.lines(id1_path) do
  id1.add(i)
end
function id_search()
  id2.clear()
  adp2.clear()
  if edit.Text ~= "" and edit.Text ~= " " then
    for i = 0,7445 do
      if string.find(id1[i],edit.Text,1) ~= nil then
        id2.add(id1[i])
      end
    end
   else
    for i = 0,7445 do
      id2.add(id1[i])
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


