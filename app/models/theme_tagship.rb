# == Schema Information
#
# Table name: theme_tagships
#
#  id            :integer          not null, primary key
#  theme_tag_id  :integer
#  site_theme_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ThemeTagship < ActiveRecord::Base
  belongs_to :site_theme
  belongs_to :theme_tag
end
