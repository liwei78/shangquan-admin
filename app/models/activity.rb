class Activity < ActiveRecord::Base
  validates :title, :presence => true
  has_attached_file :poster,
    :styles => { :original => "600>", :small => "120>" },
    :url => "/:class/:attachment/:id/:style_:basename.:extension",
    :default_url => "nopic.jpg"
end
