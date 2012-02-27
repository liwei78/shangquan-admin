module ApplicationHelper
  
  def site_title
    SITE_SETTINGS["site_title"]
  end
  
  def admin_nav?(flag)
    'on' if flag == @admin_nav_flag
  end
  
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    errors = Array(instance.error_message).join(', ')
    %(#{html_tag}<span class="validation-error">&nbsp;#{errors}</span>).html_safe
  end
  
  def nbsp(n=1)
    raw "&nbsp;"*n
  end
  
  def js_void
    "javascript:void(0);"
  end
  
  def flashplayer(code)
    raw '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="480" height="400"><param name="movie" value="'+code+'" /><param name="quality" value="high" /><embed src="'+code+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="480" height="400"></embed></object>'
  end
  
end
