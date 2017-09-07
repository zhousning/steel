class CreateThemeTags < ActiveRecord::Migration
  def change
    create_table :theme_tags do |t|
      t.string :name, null: false

      t.references :category

      t.timestamps null: false
    end
  end
end
