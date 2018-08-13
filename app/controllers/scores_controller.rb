require 'json'

class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_score
    score = params[:score]
    openid = params[:openid]
    wxuser = WxUser.find_by(:openid => openid)
    if wxuser and wxuser.score.add_score(score)
      respond_to do |f|
        f.json {
          render :json => {
            :status => 1 
          }.to_json
        }
      end
    else
      respond_to do |f|
        f.json {
          render :json => {
            :status => 0 
          }.to_json
        }
      end
    end
  end

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
