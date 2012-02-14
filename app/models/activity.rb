class Activity < ActiveRecord::Base
  validates :title, :presence => true
  has_attached_file :poster,
    :styles      => { :original => "600>", :small => "120>" },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
end