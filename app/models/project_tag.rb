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
  has_and_belongs_to_many :site_themes

  validates :name,     :presence => true
end
