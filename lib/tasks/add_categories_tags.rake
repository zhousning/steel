# coding: utf-8

require 'yaml'

namespace :db do
  desc "add categoies and tags to mysql"
  task :add_categories_tags => :environment do
    tags = YAML.load_file("lib/tasks/categories.yml")
    tags.each_pair do |key, value|
      category = Category.create!(:name => key)
      value.each do |v|
        tag = ThemeTag.create!(:name => v, :category => category)
      end
    end
  end
end
