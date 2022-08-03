import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"

function editor_theme(editor,mode)
if mode == "dark" then
  editor.setUserwordColor(0xfff08d49)
  editor.setStringColor(0xff7ec699)--字符串
  editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  editor.setCommentColor(0xff969896)--注释颜色
  editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  editor.setShowLineNumbers(true)
  editor.setTextSize(30)
  editor.setHighlightCurrentRow(true)
  editor.setAutoIndentWidth(2);
  editor.setTextColor(0xffffffff)
  editor.setTextHighlightColor(0xff4a4e56)
  editor.setBackgroundColor(0xff282c34)
  editor.setPanelBackgroundColor(0x9f282c34)
  editor.setPanelTextColor(0xffffffff)
  else
  editor.setUserwordColor(0xfff08d49)--用户词
  editor.setTextColor(0xff000000)--文本
  editor.setTextHighlightColor(0xff4a4e56)--高亮(文本选择)背景
  editor.setStringColor(0xff7ec699)--字符串
  editor.setPanelBackgroundColor(0x9f282c34)--补全背景
  editor.setPanelTextColor(0xffffffff)--补全文字、边框
  editor.setKeywordColor(0xffcc99cd)--关键词(function、local等)
  editor.setCommentColor(0xff969896)--注释颜色
  editor.setBasewordColor(0xfff08d49)--基本词(require、activity等)
  editor.setShowLineNumbers(true)
  editor.setBackgroundColor(0xffffffff)--背景颜色
  editor.setTextSize(30)
  editor.setTextHighlightColor(0xff4a4e56)
  editor.setHighlightCurrentRow(true)
  editor.setAutoIndentWidth(2);
  end
end




function 解压zip(a1,a2,a3)
import "zip4j.zip.z.zip类"
sx = zip类()
if a3 == nil then
return sx.解压(a1,a2,nil)
else
return sx.解压(a1,a2,a3)
end
end


function 压缩zip(a1,a2,a3)
import "zip4j.zip.z.zip类"
sx = zip类()
if a3 == nil then
return sx.压缩(a1,a2,nil)
else
return sx.压缩(a1,a2,a3)
end
end

function 单解压(q,w,e,r)
import "zip4j.zip.z.zip类"
sx = zip类()
if r == nil then
return sx.单个解压(q,w,e,nil)
else
return sx.单个解压(q,w,e,r)
end
end

function 是否密码(file)
import "zip4j.zip.z.zip类"
sx = zip类()
return sx.是否有密码(file)
end
--获取zip文件内容
function getZipfiletext(zipfile,file,code)
  import "java.io.InputStreamReader"
  import "java.io.File"
  import "java.util.zip.ZipFile"
  import "java.io.BufferedReader"
  local zipfile,file = ZipFile(File(tostring(zipfile))),tostring(file)
  local entries = zipfile.entries()
  local str = {}
  while entries.hasMoreElements() do
    entry = entries.nextElement();
    if tostring(entry) == file then
      local br = BufferedReader(InputStreamReader(zipfile.getInputStream(entry),code or "utf-8"));
      local line = br.readLine()
      while line ~= nil do
        str[#str+1] = line
        line = br.readLine();
      end
      break
    end
  end
  zipfile.close()
  return table.concat(str,"\n")
end

--获取zip文件列表
function getZipfilelist(zipfile)
  import "java.io.File"
  import "java.util.zip.ZipFile"
  local zipfile = ZipFile(File(tostring(zipfile)))
  local entries = zipfile.entries()
  local files ={}
  while entries.hasMoreElements() do
    entry=entries.nextElement();
    --合约0.1资源
    files[#files+1] = entry--通过getName()可以得到文件名称
    --a=("文件大小:"..entry.getSize())--得到文件大小
  end
  zipfile.close()
  return files
end

--获取zip文件大小
function getZipfilesize(zipfile,file)
  import "java.io.File"
  import "java.util.zip.ZipFile"
  local zipfile = ZipFile(File(tostring(zipfile)))
  local entries = zipfile.entries()
  while entries.hasMoreElements() do
    entry = entries.nextElement();
    if tostring(entry) == file then
      return entry.getSize()
    end
  end
  zipfile.close()
  return entry.getSize()
end
--写入文件
function write(path,content)
  f=File(tostring(File(tostring(path)).getParentFile())).mkdirs()
  io.open(tostring(path),"w"):write(tostring(content)):close()
end
--缓存文件
function temporary(text)
  path = activity.getLuaDir()
  file = io.open(path.."/temp.lua","w")
  io.output(file)
  io.write(text)
  io.close()
end
--#cffffff转0xffffffff
function c转0x(c)
  if #c == 8 then
    if string.sub(c,1,2) == "#c" then
      c = "#"..string.sub(c,3,#c)
      return tonumber("0xff"..c:match("#(.+)"))
     else
      提示"请输入以#c开头的颜色字符\n例：白色为#cFFFFFF"
    end
   else
    提示"请输入字符串长度为8位的颜色字符\n例：白色为#cFFFFFF"
  end
end
function 文件是否存在(path)
  import "java.io.*"
  file,err=io.open(path)
  if err==nil then
    return true
   else
    return false
  end
end

function 提示(文本)
  layout={
    LinearLayout;
    {
      CardView;
      background="#FFFFFF";
      CardElevation="5dp";
      layout_margin="50dp";
      layout_marginLeft="20dp";
      layout_marginRight="20dp";
      radius="10dp";
      {
        TextView;
        id="text";
        textColor="#2196F3";
        layout_margin="10dp";
        textSize="16sp";
        layout_gravity="center";
      };
    };
  };
  local toast=Toast.makeText(activity,"文本",Toast.LENGTH_SHORT).setView(loadlayout(layout))
  toast.setGravity(Gravity.BOTTOM,0, 0)
  text.Text=tostring(文本)
  toast.show()
end
function msg(text)
  提示(text)
end

function 渐变(left_jb,right_jb,id)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable(GradientDrawable.Orientation.TR_BL,{
    right_jb,--右色
    left_jb,--左色
  });
  id.setBackgroundDrawable(drawable)
end
--文件写入指定行
function file_line(路径,行数,内容)
  local a={}
  for v,s in io.lines(路径) do
    table.insert(a,v.."\n")
  end
  a[行数]=内容.."\n"
  io.open(tostring(路径),"w"):write(table.concat(a)):close()
end
--调用系统打开文件
function OpenFile(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  if Mime then
    intent = Intent()
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    intent.setAction(Intent.ACTION_VIEW);
    intent.setDataAndType(Uri.fromFile(File(path)), Mime);
    activity.startActivity(intent)
    return true
   else
    return false
  end
end
--文件选择器
function file_chooser(StartPath,event,theme)
  if theme==1 then
    主题="#ff212121"
    强调="#ffffffff"
    字体="#c0ffffff"
   else
    主题="#ffffffff"
    强调="#2196F3"
    字体="#ff444444"
  end
  function CloseDialog(dialog)
    dialog.dismiss()
  end
  import "android.graphics.Typeface"
  import "android.graphics.drawable.ColorDrawable"
  import "android.graphics.drawable.*"
  import "java.io.*"
  local abm={
    LinearLayout;
    layout_width="fill";
    paddingTop="0dp";
    {
      CardView;
      layout_width="fill";
      radius="0dp";
      translationZ="0dp";
      background=主题;
      Elevation="10";
      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        layout_height="fill";
        {
          LinearLayout;
          layout_width="fill";
          Gravity="left|center";
          layout_marginTop="24dp";
          layout_marginLeft="24dp";
          layout_marginRight="24dp";
          {
            TextView;
            layout_weight="1";
            layout_marginLeft="4dp";
            --Typeface=Typeface.createFromFile(File(activity.getLuaDir().."/res/product.ttf"));
            textSize="20sp";
            Text="文件选择";
            textColor="#2196F3";
          };
          {
            Button;
            style="?android:attr/buttonBarButtonStyle";
            text="close",
            textColor="#2196F3",
            -- Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
            onClick=function()CloseDialog(fileChoseDialog)end;
          };
        };
        {
          RelativeLayout;
          layout_width="fill";
          layout_height="fill";
          {
            PageView;
            id="pageview";
            pages={
              {
                LinearLayout;
                layout_width="fill";
                layout_height="fill";
                orientation="vertical";
                {
                  TextView;
                  layout_width="fill";
                  textSize="14sp";
                  paddingTop="8dp";
                  paddingLeft="24dp";
                  paddingRight="24dp";
                  paddingBottom="8dp";
                  --Typeface=Typeface.createFromFile(File(activity.getLuaDir().."/res/product.ttf"));
                  Text="sdcard";
                  textColor="#2196F3";
                  id="cp";
                };
                {
                  ListView;
                  fastScrollEnabled=true;
                  id="lva";
                  layout_width="fill";
                  layout_height="fill";
                };
              };

            };
          };

        };
      };
    };
  };

  local fileDialog=AlertDialog.Builder(activity)
  fileDialog.setView(loadlayout(abm))
  fileChoseDialog=fileDialog.show()
  windowm = fileChoseDialog.getWindow();
  windowm.setBackgroundDrawable(ColorDrawable(0x00ffffff));
  wlpm = windowm.getAttributes();
  wlpm.gravity = Gravity.BOTTOM;
  wlpm.width = WindowManager.LayoutParams.MATCH_PARENT;
  wlpm.height = WindowManager.LayoutParams.WRAP_CONTENT;
  windowm.setAttributes(wlpm);

  itm={
    LinearLayout;
    layout_height="-2";
    layout_width="-1";
    Gravity="left|center";
    paddingTop="8dp";
    paddingLeft="24dp";
    paddingRight="24dp";
    paddingBottom="8dp";
    {
      ImageView;
      src="res/file";
      layout_height="28dp";
      layout_width="28dp";
      --colorFilter="#2196F3";
      id="tb";
    };
    {
      TextView;
      layout_width="-1";
      layout_marginLeft="16dp";
      layout_height="-2";
      textSize="14sp";
      Text="sdcard";
      textColor="#2196F3";
      --Typeface=Typeface.createFromFile(File(activity.getLuaDir().."/res/product.ttf"));
      id="ll";
    };
  };

  ddp=LuaAdapter(activity,itm)

  function SetItem(path)
    path=tostring(path)
    ddp.clear()--清空适配器
    cp.Text=tostring(path)--设置当前路径
    if path~="/sdcard" then--不是根目录则加上../
      ddp.add{ll="<-"..tostring(File(cp.Text).getParentFile()),tb={src="res/icon/back.png"}}
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果为文件夹
        ddp.add{ll=c.Name.."/",tb={src="res/icon/folder-filling.png"}}
       else
        if c.isFile() then

          if c.Name:find("%.png$") then
            ddp.add{ll=c.Name,tb=tostring(c)}
           else
            ddp.add{ll=c.Name,tb="res/icon/file.png"}
          end
        end
      end
    end
  end
  lva.onItemClick=function(l,v,p,s)
    项目=tostring(v.Tag.ll.Text)
    if tostring(cp.Text)=="/sdcard" then
      路径=ls[p+1]
     else
      路径=ls[p]
    end
    if 项目=="<-"..tostring(File(cp.Text).getParentFile()) then
      SetItem(File(cp.Text).getParentFile())
     elseif 路径.isDirectory() then
      SetItem(路径)
     elseif 路径.isFile() then
      文件路径=cp.Text.."/"..v.Tag.ll.Text
      --  loadstring(event)()
      if 路径.exists() then
        CloseDialog(fileChoseDialog)
        --fileChoseDialog.dismiss()
       else
        --没文件
      end
    end
    --  end
    --end

  end
  lva.setAdapter(ddp)

  SetItem(StartPath)
end
--获取文件目录大小
function GetFileSize(path)
  import "java.io.File"
  file_list=luajava.astable(File(path).listFiles())
  import "android.text.format.Formatter"
  local size = 0
  for i in pairs(file_list) do
    size=size+File(tostring(file_list[i])).length()
  end
  local Sizes=Formatter.formatFileSize(activity, size)
  return Sizes
end






