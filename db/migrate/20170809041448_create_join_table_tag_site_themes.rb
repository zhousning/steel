class CreateJoinTableTagSiteThemes < ActiveRecord::Migration
  def change
    create_join_table :tags, :site_themes do |t|
    end
  end
end
