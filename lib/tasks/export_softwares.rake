# coding: utf-8

require 'yaml'

namespace :db do
  desc "export software datas to softwares.yml"
  task :export_softwares => :environment do
    result = []
    softwares = Software.all
    softwares.each do |s|
      software_info = Hash.new
      software_info['name'] = s.name
      software_info['file'] = s.file
      software_info['description'] = s.description
      software_info['install'] = s.install
      result << software_info
    end
    File.open("lib/tasks/softwares.yml", "a+"){|f| 
      f.set_encoding("ASCII-8BIT:utf-8")
      YAML.dump(result, f)
    }
  end
end
