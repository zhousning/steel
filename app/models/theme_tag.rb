# == Schema Information
#
# Table name: theme_tags
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ThemeTag < ActiveRecord::Base
  searchkick

  has_many :theme_tagships
  has_many :site_themes, :through => :theme_tagships
  belongs_to :category

  validates :name,     :presence => true
end
