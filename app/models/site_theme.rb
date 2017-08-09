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
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SiteTheme < ActiveRecord::Base
  has_and_belongs_to_many :project_tags

  serialize :tag, Array

  validates :title,     :presence => true
end
