# == Schema Information
#
# Table name: scores
#
#  id         :integer          not null, primary key
#  mark       :integer          default(0), not null
#  score      :integer          default(0), not null
#  rank       :integer          default(1), not null
#  wx_user_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :wx_user

  def add_score(mark, rank, step)
    score = self.score
    if mark > self.mark
      score = (rank-1)*step + mark 
    else
      mark = self.mark
    end
    self.update_attributes(:mark => mark, :score => score, :rank => rank)
  end
end
