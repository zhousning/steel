require 'json'

class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def top_one_hundred
    scores = Score.limit(100).order('mark desc').all
    result = []
    scores.each do |score|
      hash = Hash.new
      hash["nickname"] = score.wx_user.nickname
      hash["avatarurl"] = score.wx_user.avatarurl
      hash["mark"] = score.mark
      result << hash
    end

    openid = params[:openid]
    wxuser = WxUser.find_by(:openid => openid)
    myscore = wxuser.score.mark

    respond_to do |f|
      f.json {
        render :json => {
          myscore: myscore,
          scores: result
        }.to_json
      }
    end
  end
  
end
