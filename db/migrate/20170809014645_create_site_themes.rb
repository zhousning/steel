class CreateSiteThemes < ActiveRecord::Migration
  def change
    create_table :site_themes do |t|
      t.string :title, null: false
      t.string :main_image, null: false, default: ""
      t.string :preview_link, null: false, default: ""
      t.string :source_link, null: false, default: ""
      t.text :tag, null: false

      t.timestamps null: false
    end
  end
end
