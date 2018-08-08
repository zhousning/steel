class CreateWxUsers < ActiveRecord::Migration
  def change
    create_table :wx_users do |t|
      t.string :unionid, null: false, default: "" 
      t.string :openid, null: false, default: ""
      t.string :nickname, null: false, default: "" 
      t.string :avatarurl, null: false, default: ""
      t.string :gender, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :province, null: false, default: ""
      t.string :country, null: false, default: ""
      t.string :language, null: false, default: ""

      t.timestamps null: false
    end
  end
end
