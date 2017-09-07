# coding: utf-8

require 'yaml'

namespace :db do
  desc "associate site_theme and tag"
  task :add_themes_tags_ship => :environment do
    themes = SiteTheme.all
    themes.each do |t|
      tags = t.tag
      result = []  
      tags.each do |tag|
        prj_tag = ThemeTag.where(:name => tag)
        result << prj_tag
      end
      t.set_tags(result)
    end
  end
end
