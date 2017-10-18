# coding: utf-8

namespace :site_themes do
  desc "add themes tags categories to mysql"
  task :add_datas do
    Rake::Task["db:add_site_themes"].invoke
    Rake::Task["db:add_theme_tags"].invoke
    Rake::Task["db:add_categories"].invoke
    Rake::Task["db:add_themes_tags_ship"].invoke
  end
end
