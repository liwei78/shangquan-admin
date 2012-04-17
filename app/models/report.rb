class Report < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :user
  has_many :photos, :as => :klass
end
