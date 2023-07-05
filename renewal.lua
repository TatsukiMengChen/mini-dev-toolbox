notice = [[由于一些特殊原因，工具箱将于2023年8月31号停止维护
新的APP《迷梦工坊》正在努力开发中，预计将于8月初发布
申请内测请加入迷梦工坊Q群：882487612

内群申请要求（满足任意一点即可）：
1. 迷你人气值10W+
2. 熟练并掌握至少一门编程语言
3. 工具箱忠实粉丝（于2022年7月1日之前进群）
4. 对工具箱发展有过帮助
5. 联动工作室
6. 星光工作室骨干成员
7. 更多进群理由请私信梦辰
内群群号：323857692]]


import "android.net.Uri"
import "android.content.*"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.Typeface"
import "android.widget.TextView"
import "android.app.AlertDialog"

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
              text="前往加群",--文本内容
              textSize='14dp';--文字大小
              id="qx";
              onClick=function()--单击事件
                
                url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=".."882487612".."&card_type=group&source=qrcode"
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
