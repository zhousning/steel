# coding: utf-8

require 'yaml'

namespace :db do
  desc "associate site_theme and tag"
  task :associate_site_themes_tags => :environment do
    themes = SiteTheme.all
    themes.each do |t|
      tags = t.tag
      result = []  
      tags.each do |tag|
        prj_tag = ProjectTag.where(:name => tag)
        result << prj_tag
      end
      t.set_tags(result)
    end
  end
end
