if settings["miniworld_package_name"]~= nil then
  miniworld_package_name.Text = "包名："..settings["miniworld_package_name"]
end
if settings["miniworld_version"] ~= nil then
  miniworld_version.Text = "版本：v"..settings["miniworld_version"]
end
if settings["miniworld_account"] ~= nil then
  miniworld_Account.Text = settings["miniworld_account"]
end
if settings["software_mode"]~= nil then
  if settings["software_mode"] == 1 then
    software_Mode.Text = "默认模式"
   elseif settings["software_mode"] == 2 then
    software_Mode.Text = "旧版模式"
   elseif settings["software_mode"] == 3 then
    software_Mode.Text = "root模式"
  end
end
function channel_setup.onClick()
  activity.newActivity("user/channel_setup")
end
function miniworld_account.onClick()
  if settings["miniworld_package_name"] ~= nil then
    import "android.graphics.drawable.GradientDrawable"
    layout={
      LinearLayout;
      gravity="center|top";
      layout_width="fill";
      layout_height="220dp";
      {
        CardView;
        layout_marginTop="10dp";
        CardElevation="10dp";
        background="#FFFFFF";
        layout_width="fill";
        radius="20dp";
        {
          LinearLayout;
          orientation="vertical";
          layout_width="fill";
          layout_height="fill";
          {
            LinearLayout;
            layout_width="fill";
            orientation="horizontal";
            {
              EditText;
              hint="请输入迷你号";
              id="account_edit";
              layout_width="150dp";
              textSize="16sp";
              layout_marginLeft="10dp";
              hintTextColor="#90CAF9";
              --layout_marginRight="10dp";
              text="";
              InputType="number";
              textColor="#2196F3";
              singleLine="true";
            };
            {
              ImageView;
              layout_gravity="center";
              src="res/icon/select.png";
              layout_width="30dp";
              layout_height="30dp";
              onClick=function()
                if account_edit.Text ~= "" and #account_edit.Text >= 4 then
                  settings = settings_decode()
                  settings["miniworld_account"] = account_edit.Text
                  settings_encode(settings)
                  msg("已将迷你号设置为"..account_edit.Text)
                  miniworld_Account.Text = account_edit.Text
                  pop.dismiss()
                 else
                  提示"请输入正确的迷你号"
                end
              end;
            };
          };
        };
      };
    };
    gd = GradientDrawable()
    gd.setColor(0x00ffffff)
    pop=PopupWindow(activity)
    pop.setContentView(loadlayout(layout))
    pop.setWidth(720)
    pop.setHeight(240)
    pop.setBackgroundDrawable(gd)
    pop.setFocusable(true)
    pop.setTouchable(true)
    pop.setOutsideTouchable(false)
    pop.showAtLocation(v,Gravity.CENTER,120,-150)
    account_edit.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP));
   else
    msg"请先绑定渠道"
  end
end
function software_mode.onClick()
  activity.newActivity("user/software_mode")
end
function software_about.onClick()
  activity.newActivity("user/about")
end
function software_setting.onClick()
  if settings["miniworld_package_name"] ~= nil then
    activity.newActivity("user/setting")
   else
    msg"请先绑定渠道"
  end
end
function onActivityResult()
  --[===[path = activity.getLuaDir().."/callback.lua"
  if 文件是否存在(path) == true then
    file = io.open(path,"r")
    io.input(file)
    callback = load(io.read("*a"))
    io.close()
    os.remove(path)
    callback()
  end]===]
  settings = settings_decode()
  if settings["miniworld_package_name"]~= nil then
    miniworld_package_name.Text = "包名："..settings["miniworld_package_name"]
  end
  if settings["miniworld_version"] ~= nil then
    miniworld_version.Text = "版本：v"..settings["miniworld_version"]
  end
  if settings["software_mode"]~= nil then
    if settings["software_mode"] == 1 then
      software_Mode.Text = "默认模式"
     elseif settings["software_mode"] == 2 then
      software_Mode.Text = "旧版模式"
     elseif settings["software_mode"] == 3 then
      software_Mode.Text = "root模式"
    end
  end
end
android_Version = Build.VERSION.RELEASE
android_version.Text = "安卓版本："..android_Version
