
ac = "6L-35qKmU3R1ZGlv"

local function run(v)
  import "android.net.Uri"
  import "android.content.*"
  import "android.graphics.drawable.ColorDrawable"
  import "android.graphics.Typeface"
  import "android.widget.TextView"
  import "android.app.AlertDialog"


  if v == 1 then

    notice = [[迷梦工坊已经上线正式版！
官网：https://mimeng.fun
Q群：882487612]]


    
弹窗={

  FrameLayout,--帧布局
  layout_width='fill',--宽度
  {
    CardView;--卡片控件
    layout_gravity='center';--重力
    --左:left 右:right 中:center 顶:top 底:bottom
    elevation='';--阴影
    layout_width='80%w';--宽度
    CardBackgroundColor='#ffffffff';--颜色
    radius='15dp';--圆角
    {
      LinearLayout,
      orientation='vertical',--方向
      {
        LinearLayout,--线性布局
        padding="6dp",--往内部元素的填充一定边距
        orientation='vertical',--方向
        layout_width='fill',--宽度
        background='#00FFFFFF',--背景颜色或图片路径
        {
          LinearLayout,--线性布局
          orientation='vertical',--方向
          layout_width='fill',--宽度
          --  layout_height='30dp',--高度
          --background='#FFFFFFFF',--背景颜色或图片路径
          {
            TextView;--文本控件
            gravity='center';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            layout_width='fill';--宽度
            layout_height='fill';--高度
            textColor='#c1000000';--文字颜色
            text='公告';--显示文字
            textSize='18dp';--文字大小
            Typeface=Typeface.DEFAULT_BOLD--加粗字体
          };
        };
        {
          LinearLayout,--线性布局
          padding="6dp",--往内部元素的填充一定边距
          orientation='vertical',--方向
          layout_width='fill',

          {
            LinearLayout,--线性布局                             
            gravity='center';--卡片重力
            --左:left 右:right 中:center 顶:top 底:bottom
            orientation='vertical',--方向
            layout_width='fill',--宽度
            background='#ffffffff',--背景颜色或图片路径
            {
              LinearLayout,--线性布局          
              orientation='vertical',--方向
              layout_width='fill',--宽度
              {
                TextView;--文本控件
                --  layout_marginRight='8dp';--右距
                layout_marginLeft='8dp';--左距
                textColor='#97000000';--文字颜色
                textSize='14dp';--文字大小
                text=notice,--文本内容
                -- id="gxnr",
              };
            };
          };
        };
      };
      {
        LinearLayout,--线性布局
        gravity='center|bottom';--重力=
        orientation='vertical',--方向
        layout_width='fill',--宽度
        layout_height='fill',--高度
        background='#00FFFFFF',--背景颜色或图片路径

        {
          LinearLayout,--线性布局
          gravity='center';--重力
          orientation='horizontal',--方向
          layout_width='fill',--宽度
          layout_height='40dp',--高度
          background='#FFFFFFFF',--背景颜色或图片路径
          {
            CardView;--卡片控件
            layout_margin='2dp';--边距
            layout_gravity='center';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            elevation='';--阴影
            layout_width='140dp';--宽度
            layout_height='35dp';--高度
            CardBackgroundColor='#ffffffff';--颜色
            radius='';--圆角


            {
              TextView;--文本控件
              gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_width='fill';--宽度
              layout_height='fill';--高度
              textColor='#2196F3';--文字颜色
              text="前往官网",--文本内容
              textSize='14dp';--文字大小
              id="qx";
              onClick=function()--单击事件
                
                url="https://mimeng.fun"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
                dkl.dismiss()
              end;
            };
          };
          {
            TextView,--垂直分割线
            layout_width="3px",--布局宽度
            layout_height="20dp",--布局高度
            layout_gravity="center",--重力居中
            backgroundColor="#26000000",--背景色
          };

          {
            CardView;--卡片控件
            layout_margin='2dp';--边距
            layout_gravity='center';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            elevation='';--阴影
            layout_width='140dp';--宽度
            layout_height='35dp';--高度
            CardBackgroundColor='#ffffffff';--颜色
            radius='';--圆角


            {
              TextView;--文本控件             
              gravity='center';--重力
              --左:left 右:right 中:center 顶:top 底:bottom
              layout_width='fill';--宽度
              layout_height='fill';--高度
              textColor='#2196F3';--文字颜色
              text='确定';--显示文字
              textSize='14dp';--文字大小
              id="gx";
              onClick=function()--单击事件               
dkl.dismiss()
              end;
            };
          };
        };
      };
    };
  };
};


    dkl=AlertDialog.Builder(this)
    dkl.setView(loadlayout(弹窗))
    --dkl.setCancelable(false)--禁用返回键
    dkl=dkl.show()
    --背景透明
    import "android.graphics.drawable.ColorDrawable"
    dkl.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))



   else
    弹窗 = {

      FrameLayout,--帧布局
      layout_width='fill',--宽度
      {
        CardView;--卡片控件
        layout_gravity='center';--重力
        --左:left 右:right 中:center 顶:top 底:bottom
        elevation='';--阴影
        layout_width='80%w';--宽度
        CardBackgroundColor='#ffffffff';--颜色
        radius='15dp';--圆角
        {
          LinearLayout,
          orientation='vertical',--方向
          {
            LinearLayout,--线性布局
            padding="6dp",--往内部元素的填充一定边距
            orientation='vertical',--方向
            layout_width='fill',--宽度
            background='#00FFFFFF',--背景颜色或图片路径
            {
              LinearLayout,--线性布局
              orientation='vertical',--方向
              layout_width='fill',--宽度
              --  layout_height='30dp',--高度
              --background='#FFFFFFFF',--背景颜色或图片路径
              {
                TextView;--文本控件
                gravity='center';--重力
                --左:left 右:right 中:center 顶:top 底:bottom
                layout_width='fill';--宽度
                layout_height='fill';--高度
                textColor='#c1000000';--文字颜色
                text='激活码';--显示文字
                textSize='18dp';--文字大小
                Typeface=Typeface.DEFAULT_BOLD--加粗字体
              };
            };
            {
              LinearLayout,--线性布局
              padding="6dp",--往内部元素的填充一定边距
              orientation='vertical',--方向
              layout_width='fill',

              {
                LinearLayout,--线性布局                          
                gravity='center';--卡片重力
                --左:left 右:right 中:center 顶:top 底:bottom
                orientation='vertical',--方向
                layout_width='fill',--宽度
                background='#ffffffff',--背景颜色或图片路径
                {
                  LinearLayout,--线性布局       
                  orientation='vertical',--方向
                  layout_width='fill',--宽度
                  {
                    TextView;
                    layout_width="fill";
                    gravity="center";
                    text=[[
激活码已发布至迷梦工坊Q群公告
一群：882487612
二群：713413602]]
                  };
                  {
                    EditText;
                    id="pwd";
                    layout_width="fill";
                    hint="请输入激活码";
                    gravity="center";
                  };
                };
              };
            };
          };
          {
            LinearLayout,--线性布局
            gravity='center|bottom';--重力=
            orientation='vertical',--方向
            layout_width='fill',--宽度
            layout_height='fill',--高度
            background='#00FFFFFF',--背景颜色或图片路径

            {
              LinearLayout,--线性布局
              gravity='center';--重力
              orientation='horizontal',--方向
              layout_width='fill',--宽度
              layout_height='40dp',--高度
              background='#FFFFFFFF',--背景颜色或图片路径
              {
                CardView;--卡片控件
                layout_margin='2dp';--边距
                layout_gravity='center';--重力
                --左:left 右:right 中:center 顶:top 底:bottom
                elevation='';--阴影
                layout_width='140dp';--宽度
                layout_height='35dp';--高度
                CardBackgroundColor='#ffffffff';--颜色
                radius='';--圆角


                {
                  TextView;--文本控件
                  gravity='center';--重力
                  --左:left 右:right 中:center 顶:top 底:bottom
                  layout_width='fill';--宽度
                  layout_height='fill';--高度
                  textColor='#2196F3';--文字颜色
                  text="前往加群",--文本内容
                  textSize='14dp';--文字大小
                  id="qx";
                  onClick=function()--单击事件

                    url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=".."882487612".."&card_type=group&source=qrcode"
                    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
                  end;
                };
              };
              {
                TextView,--垂直分割线
                layout_width="3px",--布局宽度
                layout_height="20dp",--布局高度
                layout_gravity="center",--重力居中
                backgroundColor="#26000000",--背景色
              };

              {
                CardView;--卡片控件
                layout_margin='2dp';--边距
                layout_gravity='center';--重力
                --左:left 右:right 中:center 顶:top 底:bottom
                elevation='';--阴影
                layout_width='140dp';--宽度
                layout_height='35dp';--高度
                CardBackgroundColor='#ffffffff';--颜色
                radius='';--圆角


                {
                  TextView;--文本控件          
                  gravity='center';--重力
                  --左:left 右:right 中:center 顶:top 底:bottom
                  layout_width='fill';--宽度
                  layout_height='fill';--高度
                  textColor='#2196F3';--文字颜色
                  text='验证';--显示文字
                  textSize='14dp';--文字大小
                  id="gx";
                  onClick=function()--单击事件   
                    if pwd.Text == ac then
                      msg"激活成功"
                      local s = settings_decode()
                      s["activation_code"] = pwd.Text
                      settings_encode(s)
                      dkl.dismiss()
                     else
                      msg"请输入正确的激活码"
                    end
                  end;
                };
              };
            };
          };
        };
      };
    };
    dkl=AlertDialog.Builder(this)
    dkl.setView(loadlayout(弹窗))
    dkl.setCancelable(false)--禁用返回键
    dkl=dkl.show()
    --背景透明
    import "android.graphics.drawable.ColorDrawable"
    dkl.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

  end
end

local ss = settings_decode()
if ss["activation_code"] == ac then
  run(1)
 else
  run(2)
end


