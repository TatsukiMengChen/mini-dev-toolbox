path = activity.getLuaDir()
float_id_search_id1_path = path.."/res/id1.txt"
--id1 = {}
float_id_search_id1=ArrayList()
float_id_search_adp1=ArrayAdapter(this,android.R.layout.simple_list_item_1,float_id_search_id1)
float_id_search_list1.setAdapter(float_id_search_adp1)
float_id_search_id2=ArrayList()
float_id_search_adp2=ArrayAdapter(this,android.R.layout.simple_list_item_1,float_id_search_id2)
float_id_search_list2.setAdapter(float_id_search_adp2)
for i in io.lines(float_id_search_id1_path) do
  float_id_search_id1.add(i)
end
function float_id_search_id_search()
  float_id_search_id2.clear()
  float_id_search_adp2.clear()
  if float_id_search_edit.Text ~= "" and float_id_search_edit.Text ~= " " then
    for i = 0,7445 do
      if string.find(float_id_search_id1[i],float_id_search_edit.Text,1) ~= nil then
        float_id_search_id2.add(float_id_search_id1[i])
      end
    end
   else
    for i = 0,7445 do
      float_id_search_id2.add(float_id_search_id1[i])
    end
  end
end
float_id_search_edit.addTextChangedListener{
  onTextChanged=function(s)
  if float_id_search_edit.Text ~= "" then
    float_id_search_id_search()
   else
    float_id_search_id2.clear()
    float_id_search_adp2.clear()
  end
  end
}
float_id_search_list1.onItemLongClick=function(p,v,i,s)
  float_id_search_item = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(float_id_search_item)
  提示("已复制 "..float_id_search_item.." 到剪贴板")
  return true
end
float_id_search_list2.onItemLongClick=function(p,v,i,s)
  float_id_search_item = v.Text
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(float_id_search_item)
  提示("已复制 "..float_id_search_item.." 到剪贴板")
  return true
end


