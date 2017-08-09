# coding: utf-8

require 'yaml'

namespace :db do
  desc "add tag to mysql"
  task :add_tags => :environment do
    tags = YAML.load_file("lib/tasks/tags.yml")
    tags.each do |tag|
      @tags = ProjectTag.create!(:name => tag)
    end
  end
end
