# coding: utf-8

require 'yaml'

namespace :db do
  desc "import software datas from softwares.yml"
  task :import_softwares => :environment do
    softwares = YAML.load_file("lib/tasks/softwares.yml")
    softwares.each do |s|
      Software.create!(
        :name => s['name'],
        :file => s['file'], 
        :description => s['description'],
        :install => s['install']
      )
    end
  end
end
