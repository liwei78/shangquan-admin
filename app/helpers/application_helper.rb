module ApplicationHelper
  
  def site_title
    SITE_SETTINGS["site_title"]
  end
  
  def admin_nav?(flag)
    'on' if flag == @admin_nav_flag
  end
end
