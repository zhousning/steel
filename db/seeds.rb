# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#admin = User.create(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', role: Setting.users.role_admin)

5.times do |i|
  wxuser = WxUser.create(nickname: '王羲之', avatarurl: 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKTeCTlQhiabqTArHII8gHmdbJNhlt37eMIMLiaeAFRMVibIlureu5sVI3njScGvibBZmCH3jkLUayMnQ/132')
  Score.create(mark: i+100, wx_user: wxuser) 
end
