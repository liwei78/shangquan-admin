class CompanyCategory < ActiveRecord::Base
  validates :name, :presence => true
end
