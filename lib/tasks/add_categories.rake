# coding: utf-8

require 'yaml'

namespace :db do
  desc "add categoies to mysql"
  task :add_categories => :environment do
    tags = YAML.load_file("lib/tasks/categories.yml")
    tags.each_pair do |key, value|
      category = Category.create(:name => key)
      value.each do |v|
        tag = ThemeTag.find_by_name(v)
        tag.update_attributes(:category => category) if category.persisted?
      end
    end
  end
end
