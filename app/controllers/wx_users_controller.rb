require 'restclient'
require 'json'

class WxUsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    target = WxUser.find_by(:openid => params[:openid])
    unless target
      score = Score.new
      wxuser = WxUser.new(wx_user_params, :score => score)
      if wxuser.save
        puts "#{wxuser.nickname} save success"
      else
        puts "#{wxuser.nickname} save error"
      end
    end
  end

  def get_userid
    encryptedData = params[:encryptedData]
    iv = params[:iv]
    appid = "wxfa7abc0845745fb8"
    secret = "45dd3af7aeffcaa06450ec8dd2e24f52"
    code = params[:code]
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{appid}&secret=#{secret}&js_code=#{code}&grant_type=authorization_code"
    RestClient.get url do |response|
      body = JSON.parse(response.body)
      unless body["errcode"]
        openid = body["openid"]
        session_key = body["session_key"]
        respond_to do |f|
          f.json { render :json => {
            :openid => openid
          }.to_json }
        end
      else
        respond_to do |f|
          f.json { render :json => {
            :openid => "error" 
          }.to_json }
        end
      end
    end
  end

  private
    def wx_user_params
      params.require(:wx_user).permit(:openid, :nickname, :avatarurl, :gender, :city, :province, :country, :language)
    end                                  
end
