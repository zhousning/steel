class CreateJoinTableProjectTagSiteThemes < ActiveRecord::Migration
  def change
    create_join_table :project_tags, :site_themes do |t|
    end
  end
end
