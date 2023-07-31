require "import"
import "mengchen"
import "theme"
import "android.content.Context"
import "android.net.Uri"
import "android.app.DownloadManager"
activity.setContentView("user/donate_layout")

function back.onClick()
  activity.finish()
end

function zfb.onClick()
  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
  url=Uri.parse("https://minitoolbox.netlify.app/images/zfb.jpg");
  request=DownloadManager.Request(url);
  request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
  request.setDestinationInExternalPublicDir("/DCIM/Camera/","支付宝捐赠二维码.jpg");
  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
  downloadManager.enqueue(request);
  msg"已保存支付宝捐赠二维码到系统相册"
end

function wx.onClick()
  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
  url=Uri.parse("https://minitoolbox.netlify.app/images/wx.jpg");
  request=DownloadManager.Request(url);
  request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
  request.setDestinationInExternalPublicDir("/DCIM/Camera/","微信捐赠二维码.png");
  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
  downloadManager.enqueue(request);
  msg"已保存微信捐赠二维码到系统相册"
end

function qq.onClick()
  downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
  url=Uri.parse("https://minitoolbox.netlify.app/images/qq.jpg");
  request=DownloadManager.Request(url);
  request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
  request.setDestinationInExternalPublicDir("/DCIM/Camera/","QQ捐赠二维码.png");
  request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
  downloadManager.enqueue(request);
  msg"已保存QQ捐赠二维码到系统相册"
end
