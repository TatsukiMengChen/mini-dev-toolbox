require "import"
import "mengchen"
import "theme"
import "settings"
activity.setContentView("user/software_mode_layout")

function back.onClick()
  activity.finish()
end
function change_mode(val)
  settings = settings_decode()
  settings["software_mode"] = val
  settings_encode(settings)
  activity.finish()
end
function mode_1.onClick()
  change_mode(1)
  msg"已将软件运行模式设置为默认模式"
end
function mode_2.onClick()
  change_mode(2)
  msg"已将软件运行模式设置为旧版模式"
end
function mode_3.onClick()
  change_mode(3)
  msg"已将软件运行模式设置为root模式"

end





