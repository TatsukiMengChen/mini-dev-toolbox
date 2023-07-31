function id_search.onClick()
  activity.newActivity("tools/id_search")
end
function pallette.onClick()
  activity.newActivity("tools/pallette")
end
function gradient_color.onClick()
  activity.newActivity("tools/gradient_color/gradient_color")
end
function material_export.onClick()
  activity.newActivity("tools/material_export")
end
function trigger_to_script.onClick()
  activity.newActivity("tools/trigger_to_script")
end
function building_share.onClick()
  local path = activity.getLuaDir()
  temporary('webview.loadUrl("https://minitoolbox.netlify.app/")')
  activity.newActivity("webview")
end
function vox.onClick()
  activity.newActivity("tools/vox")
end