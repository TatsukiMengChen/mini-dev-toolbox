require "import"
import "res/init"
import "theme"
--activity.newActivity("tools/trigger_to_script")
--activity.finish()
import "mengchen"
import "settings"
import "android.text.Html"
if 文件是否存在("/sdcard") == true then
  settings = settings_decode()
  if settings.used == true then
    activity.newActivity("main1")
    activity.finish()
  end
end
activity.setContentView("welcome/main")
val = 0
linearParams = progress_bar.getLayoutParams()
width = linearParams.width
bt1.visibility = 8
function next.onClick()
  if val == 0 then
    val = 1
    pages.showPage(1)
    bt1.visibility = 0
    title.Text = "隐私政策"
    linearParams.width = width * 2
    progress_bar.setLayoutParams(linearParams)
   elseif val == 1 then
    if check.checked == true then
      val = 2
      pages.showPage(2)
      title.Text = "权限申请"
      linearParams.width = width * 3
      progress_bar.setLayoutParams(linearParams)

     else
      msg"请阅读并同意隐私政策！"
    end
   elseif val == 2 then
    if 文件是否存在("/sdcard") == true then
      val = 3
      pages.showPage(3)
      title.Text = "准备就绪"
      next_text.Text = "完成"
      linearParams.width = width * 4
      progress_bar.setLayoutParams(linearParams)
     else
      msg"请在手机设置中授予储存权限"
    end
   elseif val == 3 then
    settings = settings_decode()
    settings.used = true
    settings_encode(settings)
    activity.newActivity("main1")
    activity.finish()
  end
end

function last.onClick()
  if val == 1 then
    val = 0
    pages.showPage(0)
    bt1.visibility = 8
    title.Text = "迷你开发者工具箱"
    linearParams.width = width
    progress_bar.setLayoutParams(linearParams)
   elseif val == 2 then
    val = 1
    title.Text = "隐私政策"
    pages.showPage(1)
    linearParams.width = width * 2
    progress_bar.setLayoutParams(linearParams)
   elseif val == 3 then
    val = 2
    title.Text = "权限申请"
    next_text.Text = "下一步"
    pages.showPage(2)
    linearParams.width = width * 3
    progress_bar.setLayoutParams(linearParams)
  end
end




text1 = [[<h3>隐私政策</h3>
<p>梦辰开发了该开源的应用程序迷你开发者工具箱。该服务由梦辰提供，旨在安装并使用。</p>
<p>我对您使用迷你开发者工具箱的隐私政策做出规定，并解释了我如何收集，保护和披露您因使用我的服务而产生的信息。</p>
<p>如果您选择使用我提供的服务，则表示您同意收集和使用与此政策相关的信息。我收集的个人信息用于提供和改进服务。除非本隐私政策中另有说明，否则我不会与任何人一起使用或分享您的信息。</p>
<p>除非本隐私政策另有规定，否则本隐私政策中使用的术语与我们的条款和条件具有相同的含义，可在迷你开发者工具箱中访问。</p>
<h3>信息收集与使用</h3>
<p>为了获得更好的体验，在使用我们的服务时，我可能会要求您向我们提供某些个人身份信息。 我请求的信息将保留在您的设备上，不会被我以任何方式收集。</p>
<h3>记录数据</h3>
<p>当您使用我的服务时，如果应用程序出现错误，我会通过第三方数据统计在您的手机上收集数据和信息。该日志数据可能包含以下信息，例如：您的设备Internet协议（ IP）地址，设备名称，操作系统版本，使用我的服务时应用的配置，您使用该服务的时间和日期以及其他统计信息。</p>
<h3>Cookies</h3>
<p>Cookies是具有少量数据的文件，通常用作匿名唯一标识符。 这些信息将从您访问的网站发送到浏览器，并存储在设备的内存中。</p>
<p>本应用未明确使用这些Cookies。但是，该应用程序可能使用第三方代码和使用带有Cookies的库来收集信息并改善其服务。 您可以选择接受还是拒绝这些Cookies，并知道何时将Cookies发送到您的设备。 如果您选择拒绝我们的Cookies，则可能无法使用本服务的部分功能。</p>
<h3>服务供应商</h3>
<p>我可能由于以下原因雇用第三方公司和个人：</p>
<ul>
<li>促进我们的服务质量；</li>
<li>代表我们提供服务；</li>
<li>提供与服务相关的服务；</li>
<li>帮助我们分析如何使用我们的服务。</li>
</ul>
<p>我想通知此服务的用户，这些第三方有权访问您的个人信息。原因是代表我们执行分配给他们的任务。但是，他们有义务不出于任何其他目的披露或使用该信息。</p>
<h3>安全</h3>
<p>我很重视您对我们提供您的个人信息的信任，因此我们正在努力使用商业上可接受的方法来保护它。但是请记住，没有一种通过互联网传输的方法，或者说电子存储的方法是100%安全可靠的，我不能保证它的绝对安全性。</p>
<h3>到其他网站的链接</h3>
<p>此服务可能包含指向其他网站的链接。如果你点击第三方链接，你将被引导到该网站。注意，这些外部站点不是由我操作的。因此，我强烈建议您查看这些网站的隐私策略。我对任何第三方网站或服务的内容、隐私政策或做法没有控制权，也不承担任何责任。</p>
<h3>儿童隐私</h3>
<p>这些服务不面向13岁以下的青少年。我不会有意收集13岁以下儿童的个人身份信息。如果我发现13岁以下的儿童向我提供了个人信息，我会立即从我们的服务器中删除这些信息。 如果您是父母或监护人，并且知道您的孩子向我提供了个人信息，请与我联系，以便我能够采取必要的措施。</p>
<h3>本隐私政策的变更</h3>
<p>我可能会不时更新我们的隐私政策。因此，建议您定期查看此页以了解更改。如有任何更改，我会在本页公布新的隐私政策。</p>
<p>该政策自2022-10-01起生效。</p>
<h3>联系我们</h3>
<p>如果您对我的隐私政策有任何疑问或建议，请随时通过s3224815186@163.com与我联系。</p>]]

privacy.setText(Html.fromHtml(text1))


