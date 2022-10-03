require "import"
import "mengchen"
import "theme"
import "android.graphics.Typeface"
--LuaUtil.copyDir("/data/data/com.mini.dev.toolbox/","/sdcard/devToolbox/test/")
--activity.setContentView(loadlayout("home_layout"))
--activity.newActivity("tools/material_export")
--activity.finish()

import "android.net.Uri"
import "android.content.Intent"
import "android.content.Context"
import "android.content.DialogInterface"
import "main1_layout"
import "settings"
settings = settings_decode()
Version = activity.getPackageManager().getPackageInfo("com.mini.dev.toolbox", 0).versionName
if Version ~= settings["app_version"] then
  settings["app_version"] = Version
  activity.newActivity("user/update_log")
  settings_encode(settings)
end
activity.setContentView(loadlayout(main1_layout))
import "editor/main"
import "tools/main"
import "user/main"



Http.get("https://www.mini1.cn/index",nil,nil,nil,function(code,content)
  if code==200 then
    file = io.open("/sdcard/devToolbox/test.html","w")
    file:write(content)
    file:close()
    file = "/sdcard/devToolbox/test.html"
    news_lines={}
    for line in io.lines(file) do
      table.insert(news_lines,line)
    end
    news_urls={}
    news_imgs={}
    for i = 1,6 do
      news_urls[i] = news_lines[303+i]:match([[href="(.-)" target]])
      news_imgs[i] = news_lines[303+i]:match([[img src="(.-)" /></a></li>]])
    end
    news_1.setImageBitmap(loadbitmap(news_imgs[1]))
    news_2.setImageBitmap(loadbitmap(news_imgs[2]))
    news_3.setImageBitmap(loadbitmap(news_imgs[3]))
    news_4.setImageBitmap(loadbitmap(news_imgs[4]))
    news_5.setImageBitmap(loadbitmap(news_imgs[5]))
    news_6.setImageBitmap(loadbitmap(news_imgs[6]))
   else
    提示("轮播图加载失败，请重试")
  end
end)

function news_open(val)
  if string.sub(news_urls[val],1,5) == "https" then
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(news_urls[val])))
   else
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://www.mini1.cn"..news_urls[val])))
  end
end
function news.onPageChange(v,val)
  current_news = val
  if val == 0 then
    news_dot1.setBackgroundColor(0xff2196f3)
    news_dot2.setBackgroundColor(0x7fffffff)
    news_dot3.setBackgroundColor(0x7fffffff)
    news_dot4.setBackgroundColor(0x7fffffff)
    news_dot5.setBackgroundColor(0x7fffffff)
    news_dot6.setBackgroundColor(0x7fffffff)
   elseif val == 1 then
    news_dot2.setBackgroundColor(0xff2196f3)
    news_dot1.setBackgroundColor(0x7fffffff)
    news_dot3.setBackgroundColor(0x7fffffff)
    news_dot4.setBackgroundColor(0x7fffffff)
    news_dot5.setBackgroundColor(0x7fffffff)
    news_dot6.setBackgroundColor(0x7fffffff)
   elseif val == 2 then
    news_dot3.setBackgroundColor(0xff2196f3)
    news_dot1.setBackgroundColor(0x7fffffff)
    news_dot2.setBackgroundColor(0x7fffffff)
    news_dot4.setBackgroundColor(0x7fffffff)
    news_dot5.setBackgroundColor(0x7fffffff)
    news_dot6.setBackgroundColor(0x7fffffff)
   elseif val == 3 then
    news_dot4.setBackgroundColor(0xff2196f3)
    news_dot1.setBackgroundColor(0x7fffffff)
    news_dot2.setBackgroundColor(0x7fffffff)
    news_dot3.setBackgroundColor(0x7fffffff)
    news_dot5.setBackgroundColor(0x7fffffff)
    news_dot6.setBackgroundColor(0x7fffffff)
   elseif val == 4 then
    news_dot5.setBackgroundColor(0xff2196f3)
    news_dot1.setBackgroundColor(0x7fffffff)
    news_dot2.setBackgroundColor(0x7fffffff)
    news_dot3.setBackgroundColor(0x7fffffff)
    news_dot4.setBackgroundColor(0x7fffffff)
    news_dot6.setBackgroundColor(0x7fffffff)
   elseif val == 5 then
    news_dot6.setBackgroundColor(0xff2196f3)
    news_dot1.setBackgroundColor(0x7fffffff)
    news_dot2.setBackgroundColor(0x7fffffff)
    news_dot3.setBackgroundColor(0x7fffffff)
    news_dot4.setBackgroundColor(0x7fffffff)
    news_dot5.setBackgroundColor(0x7fffffff)
  end
end
current_news = 0
function change_news()
  if current_news <5 then
    news.showPage(current_news+1)
   else
    news.showPage(0)
  end
end
news_ti = Ticker()
news_ti.Period = tonumber(3000)
function news_ti.onTick()
  task(10,change_news)
end
news_ti.start()

function express_open(data,val)
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(data["news"][val]["target_url"])))
end
function get_express()
  dataurl="https://www.mini1.cn/landing/getdata"
  Http.get(dataurl,nil,"utf8",nil,function(code,content)
    if code == 200 then
      local data = string.sub(content,1,(#content-2))
      local data = string.sub(data,15,#data)
      local data = cjson.decode(data);
      express1.Text=data["news"][1]["title"]
      express1_time.Text=data["news"][1]["create_date"]
      express2.Text=data["news"][2]["title"]
      express2_time.Text=data["news"][2]["create_date"]
      express3.Text=data["news"][3]["title"]
      express3_time.Text=data["news"][3]["create_date"]
      express4.Text=data["news"][4]["title"]
      express4_time.Text=data["news"][4]["create_date"]
      express1.onClick=function()express_open(data,1)end
      express2.onClick=function()express_open(data,2)end
      express3.onClick=function()express_open(data,3)end
      express4.onClick=function()express_open(data,4)end
     else
    end
  end)
end
get_express()

hot_layout={
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  onClick=function()end;
  {
    CardView;
    layout_gravity="center";
    layout_width="140dp";
    background="#FFFFFF";
    layout_margin="10dp";
    CardElevation="2dp";
    radius="10dp";
    layout_height="60dp";
    {
      LinearLayout;
      orientation="horizontal";
      layout_width="fill";
      layout_height="fill";
      gravity="center|left";
      layout_marginLeft="6dp";
      --style="?android:attr/buttonBarButtonStyle";
      layout_gravity="center";
      {
        ImageView;
        id="img";
        layout_height="30dp";
        layout_width="30dp";
        layout_marginRight="10dp";
      };
      {
        TextView;
        id="text1";
        textColor="#2196F3";
        textSize="16sp";
      };
    };
    {
      LinearLayout;
      layout_gravity="center";
      gravity="center|left";
      orientation="horizontal";
      layout_width="fill";
      layout_height="fill";
      {
        TextView;
        textSize="20sp";
        id="top_num";
        gravity="center";
        Typeface=Typeface.MONOSPACE;
        textColor="#909090";
        layout_marginLeft="20dp";
        layout_marginRight="5dp";
      };
      {
        TextView;
        textSize="16sp";
        id="text2";
        textColor="#2196F3";
      };
    };

  };
};
hot_adp=LuaAdapter(activity,hot_layout)
hot.Adapter=hot_adp
Http.get("https://kfz.mini1.cn/center/japi/pub/hot/hotKey/?size=10",nil,nil,nil,
function(code,content)
  if code == 200 then
    local data=cjson.decode(content)
    hot_adp.add{img="res/icon/top1.png",text1=data["data"][1]}
    hot_adp.add{img="res/icon/top2.png",text1=data["data"][2]}
    hot_adp.add{img="res/icon/top3.png",text1=data["data"][3]}
    for i = 4,10 do
      hot_adp.add{top_num=tostring(i),text2=data["data"][i]}
    end
  end
end)

the_words = "如果觉得迷你开发者工具箱有什么不足的地方，或者有什么好的推荐，期待你的反馈"
the_author = "Tatsuki丶梦辰"
hitokoto_words.text = the_words
--一言

function hitokoto()
  dataurl="https://v1.hitokoto.cn/"
  Http.get(dataurl,nil,"utf8",nil,function(code,content)
    if code == 200 then
      local data = cjson.decode(content);
      the_words = data["hitokoto"]
      the_author = data["from"]
      hitokoto_words.text = the_words
     else
    end
  end)
end
task(10,hitokoto())
ti = Ticker()
ti.Period = tonumber(10000)
function ti.onTick()
  task(10,hitokoto())
end
ti.start()
function hitokoto_background.onClick()
  local temp_words,temp_author=the_words,the_author
  local dl=AlertDialog.Builder(activity)
  .setTitle("一言")
  .setMessage(the_words.."\n——"..the_author)
  .setPositiveButton("复制",DialogInterface
  .OnClickListener{
    onClick=function(v)
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(temp_words.."\n——"..temp_author)
      提示"已复制一言到剪贴板"
    end
  })
  .setNegativeButton("取消",nil)
  .create()
  dl.show()
end
--获取公告
function get_announcement()
  urla="https://share.weiyun.com/Ya4yfkYi"
  Http.get(urla,nil,nil,nil,function(code,content)
    if code==200 then
      公告内容=content:match([[>『公告内容』(.-)「公告内容」]])
      更新标题=content:match([[>『更新标题』(.-)「更新标题」]])
      版本更新=content:match([[>『版本更新』(.-)「版本更新」]])
      更新内容=string.gsub(content:match([[>『更新内容』(.-)「更新内容」]]),"</p><p>","\n")
      更新内容=string.gsub(更新内容,"&nbsp;"," ")
      下载地址=content:match([[>『下载地址』(.-)「下载地址」]])
      提取码=content:match([[>『提取码』(.-)「提取码」]])
      announcement.text=公告内容
      Version = activity.getPackageManager().getPackageInfo("com.mini.dev.toolbox", 0).versionName
      if Version ~= 版本更新 then
        local dl=AlertDialog.Builder(activity)
        .setTitle(更新标题)
        .setMessage("发现新版本：v"..版本更新.."\n更新内容："..更新内容.."下载地址："..下载地址.."\n提取码："..提取码.."\n是否立即前往更新？")
        .setPositiveButton("前往",DialogInterface
        .OnClickListener{
          onClick=function(v)
            import "android.content.Intent"
            import "android.net.Uri"
            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(提取码)
            提示"已复制提取码到剪贴板"
            viewIntent = Intent("android.intent.action.VIEW",Uri.parse(下载地址))
            activity.startActivity(viewIntent)--事件
          end
        })
        .setNegativeButton("取消",nil)
        .create()
        dl.show()
      end
     else
      announcement.text="获取公告失败"
    end
  end)
end
task(10,get_announcement())
--每日一图
function geteverydayimage()
  EverydayImage="welcome.png"
  everyday_image.setVisibility(View.INVISIBLE)
  cjson=import "cjson"
  dataurl='http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1'
  Http.get(dataurl,nil,"utf8",nil,function(code,content,cookie,header)
    if code == 200 then
      local data = cjson.decode(content);
      EverydayImage=data["images"][1]["url"]
      EverydayImage="http://cn.bing.com/"..EverydayImage
      everyday_image.setImageBitmap(loadbitmap(EverydayImage))
      everyday_image.setVisibility(View.VISIBLE)
     else
      EverydayImage="res/home_page/welcome.png"
      everyday_image.setImageBitmap(loadbitmap(EverydayImage))
      everyday_image.setVisibility(View.VISIBLE)
    end
  end)
end
task(10,geteverydayimage())
import "android.app.DownloadManager"
function everyday_image.onLongClick()
  if EverydayImage ~= "res/home_page/welcome.png" then
    downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
    url=Uri.parse(EverydayImage);
    request=DownloadManager.Request(url);
    request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
    request.setDestinationInExternalPublicDir("/DCIM/Camera/","每日一图 - "..os.date("%Y%m%d")..".png");
    request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
    downloadManager.enqueue(request);
    vibrator = activity.getSystemService(Context.VIBRATOR_SERVICE)
    vibrator.vibrate( long{100,50} ,-1)
    提示"图片已保存在系统DCIM/Camera路径下"
  end
end















--双击退出
num=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if num+2 > tonumber(os.time()) then
      activity.finish()
     else
      提示"再按一次返回键退出"
      num=tonumber(os.time())
    end
    return true
  end
end

--动画
function 水珠动画(view,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(view,"scaleX",{1.2,.8,1.1,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(view,"scaleY",{1.2,.8,1.1,.9,1}).setDuration(time).start()
end
page1.TextColor=0xFF1296DB
img1.setColorFilter(0xFF1296DB)
img2.setColorFilter(0xFF757575)
img3.setColorFilter(0xFF757575)
img4.setColorFilter(0xFF757575)
img5.setColorFilter(0xFF757575)
function pages.onPageChange(v,val)
  if val == 0 then
    水珠动画(img1,500)
    page1.TextColor=0xFF1296DB
    page2.TextColor=0xFF757575
    page3.TextColor=0xFF757575
    page4.TextColor=0xFF757575
    page5.TextColor=0xFF757575
    img1.setColorFilter(0xFF1296DB)
    img2.setColorFilter(0xFF757575)
    img3.setColorFilter(0xFF757575)
    img4.setColorFilter(0xFF757575)
    img5.setColorFilter(0xFF757575)
   elseif val == 1 then
    if dev_wiki ~= true then
      dev_wiki = true
      webview.loadUrl("https://dev-wiki.mini1.cn")
      提示"长按教程按钮可以切换到迷你开发者工具箱帮助文档哦~"
    end
    水珠动画(img2,500)
    page2.TextColor=0xFF1296DB
    page1.TextColor=0xFF757575
    page3.TextColor=0xFF757575
    page4.TextColor=0xFF757575
    page5.TextColor=0xFF757575
    img2.setColorFilter(0xFF1296DB)
    img1.setColorFilter(0xFF757575)
    img3.setColorFilter(0xFF757575)
    img4.setColorFilter(0xFF757575)
    img5.setColorFilter(0xFF757575)
   elseif val == 2 then
    水珠动画(img3,500)
    page3.TextColor=0xFF1296DB
    page2.TextColor=0xFF757575
    page1.TextColor=0xFF757575
    page4.TextColor=0xFF757575
    page5.TextColor=0xFF757575
    img3.setColorFilter(0xFF1296DB)
    img2.setColorFilter(0xFF757575)
    img1.setColorFilter(0xFF757575)
    img4.setColorFilter(0xFF757575)
    img5.setColorFilter(0xFF757575)
   elseif val == 3 then
    水珠动画(img4,500)
    page4.TextColor=0xFF1296DB
    page2.TextColor=0xFF757575
    page3.TextColor=0xFF757575
    page1.TextColor=0xFF757575
    page5.TextColor=0xFF757575
    img4.setColorFilter(0xFF1296DB)
    img2.setColorFilter(0xFF757575)
    img3.setColorFilter(0xFF757575)
    img1.setColorFilter(0xFF757575)
    img5.setColorFilter(0xFF757575)
   elseif val == 4 then
    水珠动画(img5,500)
    page5.TextColor=0xFF1296DB
    page2.TextColor=0xFF757575
    page3.TextColor=0xFF757575
    page4.TextColor=0xFF757575
    page1.TextColor=0xFF757575
    img5.setColorFilter(0xFF1296DB)
    img2.setColorFilter(0xFF757575)
    img3.setColorFilter(0xFF757575)
    img4.setColorFilter(0xFF757575)
    img1.setColorFilter(0xFF757575)
  end
end
page1.onClick=function()
  pages.showPage(0)
end
page2.onClick=function()
  pages.showPage(1)
end
page3.onClick=function()
  pages.showPage(2)
end
page4.onClick=function()
  pages.showPage(3)
end
page5.onClick=function()
  pages.showPage(4)
end

page2.onLongClick=function()
  if dev_wiki ~= true then
    dev_wiki = true
  end
  if devToolbox ~= true then
    webview.loadUrl("https://tatsukimengchen.github.io/devToolbox/")
    devToolbox = true
    提示"已切换为迷你开发者工具箱帮助文档"
   else
    webview.loadUrl("https://dev-wiki.mini1.cn")
    devToolbox = false
    提示"已切换为开发者学院"
  end
end
activity.newActivity("loading")
