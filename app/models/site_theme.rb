# == Schema Information
#
# Table name: site_themes
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  main_image   :string           default(""), not null
#  preview_link :string           default(""), not null
#  source_link  :string           default(""), not null
#  tag          :text             default(""), not null
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SiteTheme < ActiveRecord::Base
  has_many :theme_tagships
  has_many :project_tags, :through => :theme_tagships

  serialize :tag, Array

  validates :title,     :presence => true

  def set_tags(tags)
    unless tags.empty?
      self.project_tags = ProjectTag.find(tags) 
    end
  end
end
