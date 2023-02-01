require "import"
import "theme"
--import "mengchen"
import "loading_layout"
activity.setContentView(loadlayout("loading_layout"))

function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    return true
  end
end


function skip.onClick()
  activity.finish()
end

function run_ti()
  if num == nil then
    num = 4
    ti = Ticker()
    ti.Period = tonumber(1000)
    function ti.onTick()
      text.Text = "跳过 "..num
      num = num - 1
      if num == -1 then
        activity.finish()
      end
    end
    ti.start()
  end
end

function loading()
  urla="https://www.mini1.cn/mobile/"
  Http.get(urla,nil,nil,nil,function(code,content)
    if code==200 then
      file = io.open("/sdcard/devToolbox/loading.html","w")
      file:write(content)
      file:close()
      file = "/sdcard/devToolbox/loading.html"
      loading_lines={}
      for line in io.lines(file) do
        table.insert(loading_lines,line)
      end
      image_url = loading_lines[49]:match([[<img src="(.-)" class="bannerimg" alt="" />]])
      loading_image.setImageBitmap(loadbitmap(image_url))
      run_ti()
     else
      run_ti()
    end
  end)
end
loading()



