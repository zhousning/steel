class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name, null: false, default: ""
      t.string :file, null: false, default: ""
      t.string :description, null: false, default: ""
      t.text :install, null: false, default: ""

      t.timestamps null: false
    end
  end
end
