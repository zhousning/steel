require_relative "../works/crawler_work"
require 'yaml'

class TrainsController < ApplicationController
  def index
  end

  def get_ranks
    @ranks = Hash.new
    @keywords = YAML.load_file("#{Rails.root}/public/datas/train_keywords.yml")
    @keywords.each do |keyword|
      puts keyword
      rank = CrawlerWork.process(keyword)
      @ranks[keyword] = rank
      sleep 0.2
    end
    puts @ranks
    respond_to do |f|
      f.json { render :json => @ranks.to_json }
    end
  end
end
