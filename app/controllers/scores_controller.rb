require 'json'

class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_score
    mark = params[:mark].to_i
    rank = params[:rank].to_i
    step = params[:step].to_i
    openid = params[:openid]
    wxuser = WxUser.find_by(:openid => openid)
    respond_to do |f|
      if wxuser and wxuser.score.add_score(mark, rank, step)
        f.json { render :json => {:status => 1 }.to_json }
      else
        f.json { render :json => {:status => 0 }.to_json }
      end
    end
  end

  def get_rank
    openid = params[:openid]
    wxuser = WxUser.find_by(:openid => openid)
    rank = wxuser.score.rank
    puts rank
    respond_to do |f|
      f.json { render :json => {:rank => rank}.to_json } 
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
      hash["rank"] = score.rank
      result << hash
    end

    openid = params[:openid]
    wxuser = WxUser.find_by(:openid => openid)
    myscore = wxuser.score.mark
    myrank = wxuser.score.rank

    respond_to do |f|
      f.json { render :json => { myscore: myscore, myrank: myrank, scores: result }.to_json }
    end
  end
  
end
