class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :mark, null: false, default: 0
      t.integer :rank, null: false, default: 0
      t.references :wx_user

      t.timestamps null: false
    end
  end
end
