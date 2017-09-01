# == Schema Information
#
# Table name: project_tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectTag < ActiveRecord::Base
  has_many :theme_tagships
  has_many :site_themes, :through => :theme_tagships
  belongs_to :category

  validates :name,     :presence => true
end
