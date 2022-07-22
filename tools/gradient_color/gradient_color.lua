require "import"
import "mengchen"
import "theme"
import "android.content.*"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "tools/gradient_color/gradient_color_layout"
activity.setContentView(loadlayout("tools/gradient_color/gradient_color_layout"))
reverse.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF64B5F6,PorterDuff.Mode.SRC_ATOP))
reverse.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_1.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_2.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_3.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_4.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_5.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
diy_6.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))


提示"请尽可能输入中文\n如果需要英文、数字、空格等等\n请确保相邻的英文或者数字等等的个数为3的倍数"
text_a = nil
text_b = nil
longth = nil
color = {}
mini_color = {}
mini = {}
text = {text1,text2,text3,text4,text5,text6}
function setcolor()
  if reverse.checked==false then
    mini = mini_color
    text1.TextColor=(color[1])
    text2.TextColor=(color[2])
    text3.TextColor=(color[3])
    text4.TextColor=(color[4])
    text5.TextColor=(color[5])
    text6.TextColor=(color[6])
   else
    text1.TextColor=(color[6])
    text2.TextColor=(color[5])
    text3.TextColor=(color[4])
    text4.TextColor=(color[3])
    text5.TextColor=(color[2])
    text6.TextColor=(color[1])
    for i = 1,6 do
      mini[i] = mini_color[7-i]
    end
  end
end
function convert.onClick()
  text_a = text_1.Text
  text_b = nil
  longth = #text_a/3
  for i = 1,longth do
    if i <=#mini then
      if text_b == nil then
        text_b = mini[i]..string.sub(text_a,1,3)
       else
        text_b = text_b..mini[i]..string.sub(text_a,3*i-2,3*i)
      end
     elseif i > 6 then
      a = (i-#mini)%10
      if a == 0 then
        a = 2*mini-2
      end
      if a <= #mini-2 and a > 0 then
        text_b = text_b..mini[#mini-a]..string.sub(text_a,3*i-2,3*i)
       else
        text_b = text_b..mini[a-#mini+2]..string.sub(text_a,3*i-2,3*i)
      end
    end
  end
  text_2.setText(text_b)
end
function copy.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(text_b)
  提示"已复制渐变文字到剪贴板"
end


function diy_save.onClick()
  diy1,diy2,diy3,diy4,diy5,diy6 = diy_1.Text,diy_2.Text,diy_3.Text,diy_4.Text,diy_5.Text,diy_6.Text
  diyc1,diyc2,diyc3,diyc4,diyc5,diyc6=c转0x(diy1),c转0x(diy2),c转0x(diy3),c转0x(diy4),c转0x(diy5),c转0x(diy6)
  if diyc1 ~= nil and diyc1 ~= nil and diyc3 ~= nil and diyc4 ~= nil and diyc5 ~= nil and diyc6 ~= nil then
    file = "/sdcard/miniToolbox/color_diy.txt"
    io.open(file,"a+"):write(diy1..","..diy2..","..diy3..","..diy4..","..diy5..","..diy6.."\n"):close()
    提示"DIY渐变色已保存至/sdcard/miniToolbox/color_diy.txt"
  end
end
function diy_view()
  diy1,diy2,diy3,diy4,diy5,diy6 = diy_1.Text,diy_2.Text,diy_3.Text,diy_4.Text,diy_5.Text,diy_6.Text
  diyc1,diyc2,diyc3,diyc4,diyc5,diyc6=c转0x(diy1),c转0x(diy2),c转0x(diy3),c转0x(diy4),c转0x(diy5),c转0x(diy6)
  if diyc1 ~= nil and diyc1 ~= nil and diyc3 ~= nil and diyc4 ~= nil and diyc5 ~= nil and diyc6 ~= nil then
    color = {diyc1,diyc2,diyc3,diyc4,diyc5,diyc6}
    mini_color = {diy1,diy2,diy3,diy4,diy5,diy6}
    setcolor()
  end
end
function diy_example.onClick()
  diy_1.Text,diy_2.Text,diy_3.Text,diy_4.Text,diy_5.Text,diy_6.Text = "#cAAFFFF","#cBBEEEE","#cCCDDDD","#cCCDDCC","#cDDCCCC","#cDDCCDD"
end
function diy_random.onClick()
  diy_1.Text = diys[math.random(1,216)]
  diy_2.Text = diys[math.random(1,216)]
  diy_3.Text = diys[math.random(1,216)]
  diy_4.Text = diys[math.random(1,216)]
  diy_5.Text = diys[math.random(1,216)]
  diy_6.Text = diys[math.random(1,216)]
  diy_view()
end


渐变(0xFFAAFFFF,0xFFAAAAFF,color1)
function blue_purple.onClick()
  提示"蓝紫渐变"
  color = {0xFFAAFFFF,0xFFAAEEFF,0xFFAADDFF,0xFFAACCFF,0xFFAABBFF,0xFFAAAAFF}
  mini_color = {"#cAAFFFF","#cAAEEFF","#cAADDFF","#cAACCFF","#cAABBFF","#cAAAAFF"}
  setcolor()
end
渐变(0xFFAAFFFF,0xFFAAFFAA,color2)
function blue_green.onClick()
  提示"蓝绿渐变"
  color = {0xFFAAFFFF,0xFFAAFFEE,0xFFAAFFDD,0xFFAAFFCC,0xFFAAFFBB,0xFFAAFFAA}
  mini_color = {"#cAAFFFF","#cAAFFEE","#cAAFFDD","#cAAFFCC","#cAAFFBB","#cAAFFAA"}
  setcolor()
end
渐变(0xFFFFAAFF,0xFFAAAAFF,color3)
function pink_purple.onClick()
  提示"粉紫渐变"
  color = {0xFFFFAAFF,0xFFEEAAFF,0xFFDDAAFF,0xFFCCAAFF,0xFFBBAAFF,0xFFAAAAFF}
  mini_color = {"#cFFAAFF","#cEEAAFF","#cDDAAFF","#cCCAAFF","#cBBAAFF","#cAAAAFF"}
  setcolor()
end
渐变(0xFFFFAAFF,0xFFFFAAAA,color4)
function pink_orange.onClick()
  提示"粉橙渐变"
  color = {0xFFFFAAFF,0xFFFFAAEE,0xFFFFAADD,0xFFFFAACC,0xFFFFAABB,0xFFFFAAAA}
  mini_color = {"#cFFAAFF","#cFFAAEE","#cFFAADD","#cFFAACC","#cFFAABB","#cFFAAAA"}
  setcolor()
end
渐变(0xFFFFFFAA,0xFFAAFFAA,color5)
function yellow_green.onClick()
  提示"黄绿渐变"
  color = {0xFFFFFFAA,0xFFEEFFAA,0xFFDDFFAA,0xFFCCFFAA,0xFFBBFFAA,0xFFAAFFAA}
  mini_color = {"#cFFFFAA","#cEEFFAA","#cDDFFAA","#cCCFFAA","#cBBFFAA","#cAAFFAA"}
  setcolor()
end
渐变(0xFFFFFFAA,0xFFFFAAAA,color6)
function yellow_orange.onClick()
  提示"黄橙渐变"
  color = {0xFFFFFFAA,0xFFFFEEAA,0xFFFFDDAA,0xFFFFCCAA,0xFFFFBBAA,0xFFFFAAAA}
  mini_color = {"#cFFFFAA","#cFFEEAA","#cFFDDAA","#cFFCCAA","#cFFBBAA","#cFFAAAA"}
  setcolor()
end
渐变(0xFFFFAAFF,0xFFFFFFAA,color7)
function pink_yellow.onClick()
  提示"粉黄渐变"
  color = {0xFFFFAAFF,0xFFFFBBEE,0xFFFFCCDD,0xFFFFDDCC,0xFFFFEEBB,0xFFFFFFAA}
  mini_color = {"#cFFAAFF","#cFFBBEE","#cFFCCDD","#cFFDDCC","#cFFEEBB","#cFFFFAA"}
  setcolor()
end
渐变(0xFFAAFFFF,0xFFFFFFAA,color8)
function blue_yellow.onClick()
  提示"蓝黄渐变"
  color = {0xFFAAFFFF,0xFFBBFFEE,0xFFCCFFDD,0xFFDDFFCC,0xFFEEFFBB,0xFFFFFFAA}
  mini_color = {"#cAAFFFF","#cBBFFEE","#cCCFFDD","#cDDFFCC","#cEEFFBB","#cFFFFAA"}
  setcolor()
end
渐变(0xFFAAFFFF,0xFFFFAAFF,color9)
function blue_pink.onClick()
  提示"蓝粉渐变"
  color = {0xFFAAFFFF,0xFFBBEEFF,0xFFCCDDFF,0xFFDDCCFF,0xFFEEBBFF,0xFFFFAAFF}
  mini_color = {"#cAAFFFF","#cBBEEFF","#cCCDDFF","#cDDCCFF","#cEEBBFF","#cFFAAFF"}
  setcolor()
end
渐变(0xFFFFAAAA,0xFFAAAAFF,color10)
function orange_purple.onClick()
  提示"橙紫渐变"
  color = {0xFFFFAAAA,0xFFEEAABB,0xFFDDAACC,0xFFCCAADD,0xFFBBAAEE,0xFFAAAAFF}
  mini_color = {"#cFFAAAA","#cEEAABB","#cDDAACC","#cCCAADD","#cBBAAEE","#cAAAAFF"}
  setcolor()
end
渐变(0xFFAAFFFF,0xFFFFAAFF,long_color1a)
渐变(0xFFFFAAFF,0xFFFFFFAA,long_color1b)
function long_color1.onClick()
  提示"蓝粉黄渐变"
  color = {0xFFAAFFFF,0xFFBBEEFF,0xFFCCDDFF,0xFFDDCCFF,0xFFEEBBFF,0xFFFFAAFF,0xFFFFBBEE,0xFFFFCCDD,0xFFFFDDCC,0xFFFFEEBB,0xFFFFFFAA}
  mini_color = {"#cAAFFFF","#cBBEEFF","#cCCDDFF","#cDDCCFF","#cEEBBFF","#cFFAAFF","#cFFBBEE","#cFFCCDD","#cFFDDCC","#cFFEEBB","#cFFFFAA"}
  setcolor()
end



diys = {
  "#cFFFFFF",
  "#cFFFFEE",
  "#cFFFFDD",
  "#cFFFFCC",
  "#cFFFFBB",
  "#cFFFFAA",
  "#cFFEEFF",
  "#cFFEEEE",
  "#cFFEEDD",
  "#cFFEECC",
  "#cFFEEBB",
  "#cFFEEAA",
  "#cFFDDFF",
  "#cFFDDEE",
  "#cFFDDDD",
  "#cFFDDCC",
  "#cFFDDBB",
  "#cFFDDAA",
  "#cFFCCFF",
  "#cFFCCEE",
  "#cFFCCDD",
  "#cFFCCCC",
  "#cFFCCBB",
  "#cFFCCAA",
  "#cFFBBFF",
  "#cFFBBEE",
  "#cFFBBDD",
  "#cFFBBCC",
  "#cFFBBBB",
  "#cFFBBAA",
  "#cFFAAFF",
  "#cFFAAEE",
  "#cFFAADD",
  "#cFFAACC",
  "#cFFAABB",
  "#cFFAAAA",
  "#cEEFFFF",
  "#cEEFFEE",
  "#cEEFFDD",
  "#cEEFFCC",
  "#cEEFFBB",
  "#cEEFFAA",
  "#cEEEEFF",
  "#cEEEEEE",
  "#cEEEEDD",
  "#cEEEECC",
  "#cEEEEBB",
  "#cEEEEAA",
  "#cEEDDFF",
  "#cEEDDEE",
  "#cEEDDDD",
  "#cEEDDCC",
  "#cEEDDBB",
  "#cEEDDAA",
  "#cEECCFF",
  "#cEECCEE",
  "#cEECCDD",
  "#cEECCCC",
  "#cEECCBB",
  "#cEECCAA",
  "#cEEBBFF",
  "#cEEBBEE",
  "#cEEBBDD",
  "#cEEBBCC",
  "#cEEBBBB",
  "#cEEBBAA",
  "#cEEAAFF",
  "#cEEAAEE",
  "#cEEAADD",
  "#cEEAACC",
  "#cEEAABB",
  "#cEEAAAA",
  "#cDDFFFF",
  "#cDDFFEE",
  "#cDDFFDD",
  "#cDDFFCC",
  "#cDDFFBB",
  "#cDDFFAA",
  "#cDDEEFF",
  "#cDDEEEE",
  "#cDDEEDD",
  "#cDDEECC",
  "#cDDEEBB",
  "#cDDEEAA",
  "#cDDDDFF",
  "#cDDDDEE",
  "#cDDDDDD",
  "#cDDDDCC",
  "#cDDDDBB",
  "#cDDDDAA",
  "#cDDCCFF",
  "#cDDCCEE",
  "#cDDCCDD",
  "#cDDCCCC",
  "#cDDCCBB",
  "#cDDCCAA",
  "#cDDBBFF",
  "#cDDBBEE",
  "#cDDBBDD",
  "#cDDBBCC",
  "#cDDBBBB",
  "#cDDBBAA",
  "#cDDAAFF",
  "#cDDAAEE",
  "#cDDAADD",
  "#cDDAACC",
  "#cDDAABB",
  "#cDDAAAA",
  "#cCCFFFF",
  "#cCCFFEE",
  "#cCCFFDD",
  "#cCCFFCC",
  "#cCCFFBB",
  "#cCCFFAA",
  "#cCCEEFF",
  "#cCCEEEE",
  "#cCCEEDD",
  "#cCCEECC",
  "#cCCEEBB",
  "#cCCEEAA",
  "#cCCDDFF",
  "#cCCDDEE",
  "#cCCDDDD",
  "#cCCDDCC",
  "#cCCDDBB",
  "#cCCDDAA",
  "#cCCCCFF",
  "#cCCCCEE",
  "#cCCCCDD",
  "#cCCCCCC",
  "#cCCCCBB",
  "#cCCCCAA",
  "#cCCBBFF",
  "#cCCBBEE",
  "#cCCBBDD",
  "#cCCBBCC",
  "#cCCBBBB",
  "#cCCBBAA",
  "#cCCAAFF",
  "#cCCAAEE",
  "#cCCAADD",
  "#cCCAACC",
  "#cCCAABB",
  "#cCCAAAA",
  "#cBBFFFF",
  "#cBBFFEE",
  "#cBBFFDD",
  "#cBBFFCC",
  "#cBBFFBB",
  "#cBBFFAA",
  "#cBBEEFF",
  "#cBBEEEE",
  "#cBBEEDD",
  "#cBBEECC",
  "#cBBEEBB",
  "#cBBEEAA",
  "#cBBDDFF",
  "#cBBDDEE",
  "#cBBDDDD",
  "#cBBDDCC",
  "#cBBDDBB",
  "#cBBDDAA",
  "#cBBCCFF",
  "#cBBCCEE",
  "#cBBCCDD",
  "#cBBCCCC",
  "#cBBCCBB",
  "#cBBCCAA",
  "#cBBBBFF",
  "#cBBBBEE",
  "#cBBBBDD",
  "#cBBBBCC",
  "#cBBBBBB",
  "#cBBBBAA",
  "#cBBAAFF",
  "#cBBAAEE",
  "#cBBAADD",
  "#cBBAACC",
  "#cBBAABB",
  "#cBBAAAA",
  "#cAAFFFF",
  "#cAAFFEE",
  "#cAAFFDD",
  "#cAAFFCC",
  "#cAAFFBB",
  "#cAAFFAA",
  "#cAAEEFF",
  "#cAAEEEE",
  "#cAAEEDD",
  "#cAAEECC",
  "#cAAEEBB",
  "#cAAEEAA",
  "#cAADDFF",
  "#cAADDEE",
  "#cAADDDD",
  "#cAADDCC",
  "#cAADDBB",
  "#cAADDAA",
  "#cAACCFF",
  "#cAACCEE",
  "#cAACCDD",
  "#cAACCCC",
  "#cAACCBB",
  "#cAACCAA",
  "#cAABBFF",
  "#cAABBEE",
  "#cAABBDD",
  "#cAABBCC",
  "#cAABBBB",
  "#cAABBAA",
  "#cAAAAFF",
  "#cAAAAEE",
  "#cAAAADD",
  "#cAAAACC",
  "#cAAAABB",
  "#cAAAAAA"
}

