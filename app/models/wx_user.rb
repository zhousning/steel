# == Schema Information
#
# Table name: wx_users
#
#  id         :integer          not null, primary key
#  unionid    :string           default(""), not null
#  openid     :string           default(""), not null
#  nickname   :string           default(""), not null
#  avatarurl  :string           default(""), not null
#  gender     :string           default(""), not null
#  city       :string           default(""), not null
#  province   :string           default(""), not null
#  country    :string           default(""), not null
#  language   :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WxUser < ActiveRecord::Base
  has_one :score
end
