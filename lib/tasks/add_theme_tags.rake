# coding: utf-8

require 'yaml'

namespace :db do
  desc "add theme tag to mysql"
  task :add_theme_tags => :environment do
    tags = YAML.load_file("lib/tasks/theme_tags.yml")
    tags.each do |tag|
      @tags = ThemeTag.create!(:name => tag)
    end
  end
end
