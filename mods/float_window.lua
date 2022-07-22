function 悬浮窗(宽,高,xX,yY,初始位置,焦点)
  import "android.graphics.PixelFormat" --导入
  local Xf=activity.getSystemService(Context.WINDOW_SERVICE) --获取窗口管理器
  local wmParams = WindowManager.LayoutParams() --对象
  wmParams.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT --设置悬浮窗方式
  wmParams.format =PixelFormat.RGBA_8888 --设置背景
  if 焦点 then
    wmParams.flags=WindowManager.LayoutParams().FLAG_NOT_TOUCH_MODAL
   else
    wmParams.flags= WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE--焦点设置
  end
  wmParams.gravity = 初始位置
  wmParams.x = xX
  wmParams.y = yY
  wmParams.width =宽--WindowManager.LayoutParams.WRAP_CONTENT
  wmParams.height =高--WindowManager.LayoutParams.WRAP_CONTENT
  return Xf,wmParams,焦点
end

function 开启悬浮(vS,vL,lay)
  if type(lay) == "table" then
    local 布局 = loadlayout(lay)
    vL.addView(布局,vS)
    return 布局
   else
    local 布局=lay
    vL.addView(布局,vS)
    return 布局
  end
end

function 关闭悬浮(vL,布局)
  vL.removeView(布局)
end

function 关闭焦点(vS,vL,lay)
  vS.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  vL.updateViewLayout(lay,vS)
end

function 打开焦点(vS,vL,lay)
  vS.flags=WindowManager.LayoutParams().FLAG_NOT_TOUCH_MODAL
  vL.updateViewLayout(lay,vS)
end

function 移动浮窗(id,vS,vL,lay)
  function id.OnTouchListener(v,event) --移动
    if event.getAction()==MotionEvent.ACTION_DOWN then
      firstX=event.getRawX()
      firstY=event.getRawY()
      wmX=vS.x
      wmY=vS.y
     elseif event.getAction()==MotionEvent.ACTION_MOVE then
      vS.x=wmX+(event.getRawX()-firstX)
      vS.y=wmY+(event.getRawY()-firstY)
      vL.updateViewLayout(lay,vS)
     elseif event.getAction()==MotionEvent.ACTION_UP then
    end
    return true
  end
end

