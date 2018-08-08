# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  mark       :integer          default(0), not null
#  rank       :integer          default(0), not null
#  wx_user_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :wx_user
end
