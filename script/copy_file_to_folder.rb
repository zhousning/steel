# coding utf-8
require 'find'
require 'fileutils'

SourceFile = "money.txt"
TargetDir = "/home/zn/work/steel/public/cssthemes"

Find.find(TargetDir) do |dir|
  if File.directory?(dir)
    FileUtils.cp(SourceFile, dir)
  end
end
