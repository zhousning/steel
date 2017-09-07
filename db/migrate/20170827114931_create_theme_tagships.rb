class CreateThemeTagships < ActiveRecord::Migration
  def change
    create_table :theme_tagships do |t|
      t.integer :theme_tag_id
      t.integer :site_theme_id

      t.timestamps null: false
    end
  end
end
