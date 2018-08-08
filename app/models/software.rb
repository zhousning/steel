# == Schema Information
#
# Table name: softwares
#
#  id          :integer          not null, primary key
#  name        :string           default(""), not null
#  file        :string           default(""), not null
#  description :string           default(""), not null
#  install     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Software < ActiveRecord::Base
end
