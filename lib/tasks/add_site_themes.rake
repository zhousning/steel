# coding: utf-8

require 'yaml'

namespace :db do
  desc "add site theme to mysql"
  task :add_site_themes => :environment do
    site_themes = YAML.load_file("lib/tasks/site_themes.yml")
    site_themes.each do |theme|
     @site_themes = SiteTheme.create!(
       :title => theme[0], 
       :tag => theme[1],
       :main_image => theme[2], 
       :source_link => theme[3],
       :preview_link => theme[4]
     )
    end
  end
end
