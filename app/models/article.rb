class Article < ActiveRecord::Base
  has_many :photos, :as => :klass
  has_many :comments, :as => :klass
  acts_as_taggable
  
  scope :type_0, :conditions => ["article_type = ?", 'article']
  scope :type_1, :conditions => ["article_type = ?", 'photo']
  scope :type_2, :conditions => ["article_type = ?", 'video']
  scope :type_3, :conditions => ["article_type = ?", 'brand']
  
  has_attached_file :poster,
    :styles      => { :original => SITE_SETTINGS["crop_original"], :small => SITE_SETTINGS["crop_small"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
  

end
