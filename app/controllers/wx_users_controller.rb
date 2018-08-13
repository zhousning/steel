require 'restclient'
require 'json'

class WxUsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    target = WxUser.find_by(:openid => params[:openid])
    unless target
      wxuser = WxUser.new(wx_user_params)
      score = Score.new
      wxuser.score = score
      if wxuser.save
        respond_to do |f|
          f.json {
            render :json => {:wxuser_status => 'success'}.to_json
          }
        end
      else
        respond_to do |f|
          f.json {
            render :json => {:wxuser_status => 'fail'}.to_json
          }
        end
      end
    else
      respond_to do |f|
        f.json {
          render :json => {:wxuser_status => 'already exist'}.to_json
        }
      end
    end
  end

  def get_userid
    encryptedData = params[:encryptedData]
    iv = params[:iv]
    url = "https://api.weixin.qq.com/sns/jscode2session"
    data = {
      appid: "wxfa7abc0845745fb8", 
      secret: "45dd3af7aeffcaa06450ec8dd2e24f52",
      js_code: params[:code].to_s,
      grant_type: 'authorization_code'
    }
    response = RestClient.get url, params: data, :accept => :json
    body = JSON.parse(response.body)
    unless body["errcode"]
      openid = body["openid"]
      session_key = body["session_key"]
      respond_to do |f|
        f.json { render :json => {
          :openId => openid
        }.to_json }
      end
    else
      respond_to do |f|
        f.json { render :json => {
          :openId => body 
        }.to_json }
      end
    end
  end

  private
    def wx_user_params
      params.require(:wx_user).permit(:openid, :nickname, :avatarurl, :gender, :city, :province, :country, :language)
    end                                  
end
