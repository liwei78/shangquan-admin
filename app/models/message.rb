# encoding: utf-8
class Message < ActiveRecord::Base
  belongs_to :user
  
  scope :sysmsg, :conditions => ["messages.sysmsg = ?", true]
  scope :mymsg,  :conditions => ["messages.sysmsg = ?", false]
  
  def self.sys_send_to(uid, title, content)
    create(
      :user_id => uid,
      :title   => title,
      :content => content, 
      :sysmsg  => true)
  end
  
  def self.upgrade_state_msg(user)
    title = ""
    content = ""
    case user.upgrade_state
    when 2
      title = "恭喜您，你的申请通过了！"
      content = "您现在已经正式成为 #{user.site_role} 了，具备了相应的资格。"
    when 3
      title = "你的申请被拒绝了！"
      content = "请与管理员联系。"
    else
      title = "你的申请无效"
      content = "请与管理员联系。"
    end
    create(
      :user_id => user.id,
      :title   => title,
      :content => content, 
      :sysmsg  => true)
  end
end
