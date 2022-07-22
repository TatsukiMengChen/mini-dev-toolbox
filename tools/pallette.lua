require "import"
import "theme"
import "mengchen"
import "android.graphics.Color"
import "android.content.*"
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_NoActionBar)
activity.setContentView("tools/pallette_layout")

red.setMax(255);
red.setProgress(255);

green.setMax(255);
green.setProgress(255);

blue.setMax(255);
blue.setProgress(255);

red.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFFF44336,PorterDuff.Mode.SRC_ATOP))
red.Thumb.setColorFilter(PorterDuffColorFilter(0xFFF44336,PorterDuff.Mode.SRC_ATOP))

green.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF4CAF50,PorterDuff.Mode.SRC_ATOP))
green.Thumb.setColorFilter(PorterDuffColorFilter(0xFF4CAF50,PorterDuff.Mode.SRC_ATOP))

blue.ProgressDrawable.setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
blue.Thumb.setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))

function check_length(val1,val2)
  temp = string.format("%X",val1)
  if type(temp) == "string" then
   else
    temp = tostring(temp)
  end
  if #temp == 1 then
    if val2 == "R" then
      R = "0"..temp
     elseif val2 == "G" then
      G = "0"..temp
     elseif val2 == "B" then
      B = "0"..temp
    end
   else
    if val2 == "R" then
      R = temp
     elseif val2 == "G" then
      G = temp
     elseif val2 == "B" then
      B = temp
    end
  end
end
a,r,g,b = 255,255,255,255
A,R,G,B = "FF","FF","FF","FF"
RGB = "FFFFFF"
red.setOnSeekBarChangeListener{
  onProgressChanged=function(v,i)
    r=i
    check_length(r,"R")
    RGB = R..G..B
    rgb1.Text,rgb2.Text,rgb3.Text = "#c"..RGB,"#"..RGB,"0xFF"..RGB
    rgb4.Text = tostring(tonumber("0x"..RGB))
    rgb5.Text = tostring(tonumber("0xff"..RGB))
    color.BackgroundColor=Color.argb(a,r,g,b)
  end}
green.setOnSeekBarChangeListener{
  onProgressChanged=function(v,i)
    g=i
    check_length(g,"G")
    RGB = R..G..B
    rgb1.Text,rgb2.Text,rgb3.Text = "#c"..RGB,"#"..RGB,"0xFF"..RGB
    rgb4.Text = tostring(tonumber("0x"..RGB))
    rgb5.Text = tostring(tonumber("0xff"..RGB))
    color.BackgroundColor=Color.argb(a,r,g,b)
  end}
blue.setOnSeekBarChangeListener{
  onProgressChanged=function(v,i)
    b=i
    check_length(b,"B")
    RGB = R..G..B
    rgb1.Text,rgb2.Text,rgb3.Text = "#c"..RGB,"#"..RGB,"0xFF"..RGB
    rgb4.Text = tostring(tonumber("0x"..RGB))
    rgb5.Text = tostring(tonumber("0xff"..RGB))
    color.BackgroundColor=Color.argb(a,r,g,b)
  end}

function rgb1.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(rgb1.Text)
  提示("已复制"..rgb1.Text.."到剪贴板")
end
function rgb2.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(rgb2.Text)
  提示("已复制"..rgb2.Text.."到剪贴板")
end
function rgb3.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(rgb3.Text)
  提示("已复制"..rgb3.Text.."到剪贴板")
end

