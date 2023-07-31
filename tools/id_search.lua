require "import"
import "mengchen"
import "theme"
import "tools/id_search_layout"
activity.setContentView(loadlayout("tools/id_search_layout"))

nums = 10355
path = activity.getLuaDir()
id1_path = path.."/res/id/Item.txt"

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

function Act.onClick()
  nums = 207
  id1_path = path.."/res/id/Act.txt"
  start()
  id_search()
end

function Animact.onClick()
  nums = 37
  id1_path = path.."/res/id/Animact.txt"
  start()
  id_search()
end

function APIID.onClick()
  nums = 56
  id1_path = path.."/res/id/APIID.txt"
  start()
  id_search()
end

function Block.onClick()
  nums = 1752
  id1_path = path.."/res/id/Block.txt"
  start()
  id_search()
end

function Buff.onClick()
  nums = 389
  id1_path = path.."/res/id/Buff.txt"
  start()
  id_search()
end

function Crafting.onClick()
  nums = 1014
  id1_path = path.."/res/id/Crafting.txt"
  start()
  id_search()
end

function Creature.onClick()
  nums = 703
  id1_path = path.."/res/id/Creature.txt"
  start()
  id_search()
end

function CustomSkin.onClick()
  nums = 1820
  id1_path = path.."/res/id/CustomSkin.txt"
  start()
  id_search()
end

function Enchant.onClick()
  nums = 92
  id1_path = path.."/res/id/Enchant.txt"
  start()
  id_search()
end

function EnchantOld.onClick()
  nums = 120
  id1_path = path.."/res/id/EnchantOld.txt"
  start()
  id_search()
end

function Horse.onClick()
  nums = 227
  id1_path = path.."/res/id/Horse.txt"
  start()
  id_search()
end

function Item.onClick()
  nums = 10355
  id1_path = path.."/res/id/Item.txt"
  start()
  id_search()
end

function Particles.onClick()
  nums = 633
  id1_path = path.."/res/id/Particles.txt"
  start()
  id_search()
end

function ParticlesPath.onClick()
  nums = 839
  id1_path = path.."/res/id/ParticlesPath.txt"
  start()
  id_search()
end

function Projectile.onClick()
  nums = 141
  id1_path = path.."/res/id/Projectile.txt"
  start()
  id_search()
end

function Skin.onClick()
  nums = 340
  id1_path = path.."/res/id/Skin.txt"
  start()
  id_search()
end

function Sound.onClick()
  nums = 993
  id1_path = path.."/res/id/Sound.txt"
  start()
  id_search()
end
