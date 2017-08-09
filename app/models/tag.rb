class Tag < ActiveRecord::Base
  has_and_belongs_to_many :site_themes

  validates :name,      :presence => ture
end
