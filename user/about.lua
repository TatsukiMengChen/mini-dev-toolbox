require "import"
import "mengchen"
import "theme"
import "android.net.Uri"
import "android.content.*"
import "user/about_layout"
activity.setContentView("user/about_layout")

Version = activity.getPackageManager().getPackageInfo("com.mini.dev.toolbox", 0).versionName
version.Text = "版本号："..Version
function qq_share.onClick()
  url="mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=".."3224815186"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function join_group.onClick()
  url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=".."882487612".."&card_type=group&source=qrcode"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function douyin_share.onClick()
  url="https://v.douyin.com/LYJFfBd/"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

function miniworld_share.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("158087577")
  提示"已复制迷你号到剪贴板"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage("com.minitech.miniworld")
  task (500,function()
    this.startActivity(open)
  end)
end

function update_log.onClick()
  activity.newActivity("user/update_log")
end

function help.onClick()
  url="https://tatsukimengchen.github.io/devToolbox/"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
function check_update.onClick()
  dataurl="http://tool.bitefu.net/lanzou/?url=https://tatsuki-mengchen.lanzoub.com/i8vOH0461g4h&pwd=bv72"
  Http.get(dataurl,nil,"utf8",nil,function(code,content)
    if code == 200 then
      print(content)
     else
    end
  end)
  提示"正在检查版本更新中..."
  urla="https://share.weiyun.com/Ya4yfkYi"
  Http.get(urla,nil,nil,nil,function(code,content)
    if code==200 then
      更新标题=content:match([[>『更新标题』(.-)「更新标题」]])
      版本更新=content:match([[>『版本更新』(.-)「版本更新」]])
      更新内容=string.gsub(content:match([[>『更新内容』(.-)「更新内容」]]),"</p><p>","\n")
      更新内容=string.gsub(更新内容,"&nbsp;"," ")
      下载地址=content:match([[>『下载地址』(.-)「下载地址」]])
      提取码=content:match([[>『提取码』(.-)「提取码」]])
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
       else
        提示"当前已经是最新版本了哦~"
      end
     else
      提示"检查更新失败"
    end
  end)
end




