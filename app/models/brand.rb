class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, :through => :brand_users
  has_attached_file :logo,
    :styles          => { :original => SITE_SETTINGS["crop_original"], :small => "" },
    :convert_options => { :small => SITE_SETTINGS["crop_small_covert"] },
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
end
